{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit uService;

interface

uses
  Windows, Forms, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Dialogs,
  uFunction, uConst, ABC_PS_DM, ABC_FN_DM, ABC_FC_DM, uHTTP, XMLDoc, XMLIntf,
  Soap.EncdDecd, IniFiles, PassportInfo, FingerInfo, FaceInfo, KioskInfo, Jpeg,
  XSuperJSON, XSuperObject, HistObj, ResInfo, S510, CrewInfo;

type
  TLogEvent = procedure( strMsg : string ) of object;

procedure Log( strMsg : string );
function PassportCheck(iDcType : Integer; mrz : ABC_PS_MRZ_DATA; bCheckEPass : Boolean) : Integer;
function RFCardCheck(mrz : ABC_PS_CREW_DATA) : Integer;
function GetSvrData_InitValue(sFlag : string) : Integer;
function GetSvrData_DateTime : Integer;
function GetServiceFingerFeature( feature, feature2 : PABC_FEATURE ) : Integer;
function GetServiceFaceImage( image : PABC_IMAGE ) : Integer;
function InsertImmigrationLogs(ProcStat : string) : Integer;

var
  FIsKor : Integer; // 0:한국,1:영어권,2:중국,3:일본
  FLogEvent : TLogEvent = nil;
  FHistObj : THistObj;

implementation

uses frmMain;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: Log                                                            //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: strMssg : string                                               //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure Log(strMsg : string);
begin
  if Assigned( FLogEvent ) then
    FLogEvent( strMsg );
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: InitService                                                    //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: None                                                           //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure InitService;
  procedure LoadConfig;
  var
    ini : TIniFile;
    tmp : string;
  begin
    tmp := ExtractFileDir( Application.ExeName );
    ini := TIniFile.Create('..\ini\' + ExtractFileName(ChangeFileExt(Application.ExeName, '.env')));
    ini_directory := ini.ReadString( 'PATH', 'INI', Copy(tmp, 0, tmp.LastIndexOf('\')) + '\ini\' );
    log_directory := ini.ReadString( 'PATH', 'LOG', Copy(tmp, 0, tmp.LastIndexOf('\')) + '\log\BorderController\' );
    media_directory := ini.ReadString( 'PATH', 'MEDIA', Copy(tmp, 0, tmp.LastIndexOf('\')) + '\media\' );

    ini.Free;
  end;
begin
  // 환경설정 읽기
  LoadConfig;

  FHistObj := THistObj.Create;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: PassportCheck                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: iDcType : Integer; mrz : ABC_PS_MRZ_DATA; bCheckEPass : Boolean  //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function PassportCheck(iDcType : Integer; mrz : ABC_PS_MRZ_DATA; bCheckEPass : Boolean) : Integer;
var
  nRetVal : Integer;
  ReqJson : TStringStream;
  ResJson : string;
  ppiObj : TPPIObj;
  sJson : string;
begin
  Result := ABC_FAIL;

  if NOSERVICE_VALUE then
  begin
    ppiObj := TPPIObj.Create;
    try
      InsertMrzData(ppiObj, mrz, FHistObj.edDate);
      FPaxInfo.regNo := ppiObj.RegNo;
      FPaxInfo.name := ppiObj.name;
      FPaxInfo.passNo := ppiObj.PassNo;
      FPaxInfo.birth := ppiObj.Birth;
      FPaxInfo.natCd := ppiObj.NatCd;
      FPaxInfo.modiNatCd := ppiObj.modiNatCd;
      FPaxInfo.sex := ppiObj.Sex;
      FPaxInfo.passExpDate := ppiObj.PassExpDate;
      FPaxInfo.jobGb := '1';
      FPaxInfo.crewNo := '';
      FPaxInfo.mrpPhotoImg := ppiObj.mrpPhotoImg;
    finally
      ppiObj.Free;
    end;
  end
  else
  begin
    ppiObj := TPPIObj.Create;

    try
      InsertMrzData(ppiObj, mrz, FHistObj.edDate);

      // Select Table P100(Master)
      ReqJson := TStringStream.Create(TJson.Stringify(ppiObj,False,False),TEncoding.UTF8);
      try
        ResJson := HTTPJson(SERVER_ADDRESS, '/mrp/checkMrp.json', ReqJson);
      finally
        ReqJson.Free;
      end;
      ppiObj := TJson.Parse<TPPIObj>(ResJson);

      Main.lblStatusText.Caption := ppiObj.ResFlag + '::' + ppiObj.ResMsg;
      Main.ShowLog(ppiObj.ResFlag + '::' + ppiObj.ResMsg);

      if Pos(ABC00001, ppiObj.ResMsg) = 0 then
      begin
        Exit;
      end;

      FPaxInfo.regNo := ppiObj.RegNo;
      FPaxInfo.name := ppiObj.name;
      FPaxInfo.passNo := ppiObj.PassNo;
      FPaxInfo.birth := ppiObj.Birth;
      FPaxInfo.natCd := ppiObj.NatCd;
      FPaxInfo.modiNatCd := ppiObj.modiNatCd;
      FPaxInfo.sex := ppiObj.Sex;
      FPaxInfo.passExpDate := ppiObj.PassExpDate;
      FPaxInfo.jobGb := '1';
      FPaxInfo.crewNo := '';
      FPaxInfo.mrpPhotoImg := ppiObj.mrpPhotoImg;

      if FPaxInfo.modiNatCd = '100' then
        FIsKor := 0
      else if FPaxInfo.modiNatCd = '130' then
        FIsKor := 3
      else if MatchStr(FPaxInfo.modiNatCd, ['112','113','122','120']) then
        FIsKor := 2
      else
        FIsKor := 1;

    finally
      ResJson := '';
      ppiObj.Free;
    end;
  end;

  Result := ABC_SUCCESS;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: RF Card Check                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: iDcType : Integer; mrz : ABC_PS_MRZ_DATA; bCheckEPass : Boolean  //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function RFCardCheck(mrz : ABC_PS_CREW_DATA) : Integer;
var
  nRetVal : Integer;
  ReqJson : TStringStream;
  ResJson : string;
  crwObj : TCRWObj;
  sJson : string;
begin
  Result := ABC_FAIL;

  if NOSERVICE_VALUE then
  begin
    crwObj := TCRWObj.Create;
    try
      InsertCrewData(crwObj, mrz, FHistObj.edDate);
      FPaxInfo.regNo := crwObj.RegNo;
      FPaxInfo.name := crwObj.name;
      FPaxInfo.passNo := crwObj.PassNo;
      FPaxInfo.birth := crwObj.Birth;
      FPaxInfo.natCd := crwObj.NatCd;
      FPaxInfo.sex := crwObj.Sex;
      FPaxInfo.passExpDate := crwObj.PassExpDate;
      FPaxInfo.jobGb := '1';
      FPaxInfo.crewNo := crwObj.crewNo;
      FPaxInfo.mrpPhotoImg := crwObj.mrpPhotoImg;
    finally
      crwObj.Free;
    end;
  end
  else
  begin
    crwObj := TCRWObj.Create;

    try
      InsertCrewData(crwObj, mrz, FHistObj.edDate);

      // Select Table C100(Master)
      ReqJson := TStringStream.Create(TJson.Stringify(crwObj,False,False),TEncoding.UTF8);
      try
        ResJson := HTTPJson(SERVER_ADDRESS, '/rfid/SelectRfidData.json', ReqJson);
      finally
        ReqJson.Free;
      end;
      crwObj := TJson.Parse<TCRWObj>(ResJson);

      Main.lblStatusText.Caption := crwObj.ResFlag + '::' + crwObj.ResMsg;
      Main.ShowLog(crwObj.ResFlag + '::' + crwObj.ResMsg);

      if Pos(ABC00001, crwObj.ResMsg) = 0 then
      begin
        Exit;
      end;

      FPaxInfo.regNo := crwObj.RegNo;
      FPaxInfo.name := crwObj.name;
      FPaxInfo.passNo := crwObj.PassNo;
      FPaxInfo.birth := crwObj.Birth;
      FPaxInfo.natCd := crwObj.NatCd;
//      FPaxInfo.modiNatCd := crwObj.modiNatCd;
      FPaxInfo.sex := crwObj.Sex;
      FPaxInfo.passExpDate := crwObj.PassExpDate;
      FPaxInfo.jobGb := 'C';
      FPaxInfo.crewNo := crwObj.crewNo;
      FPaxInfo.mrpPhotoImg := crwObj.mrpPhotoImg;

      if FPaxInfo.modiNatCd = '100' then
        FIsKor := 0
      else if FPaxInfo.modiNatCd = '130' then
        FIsKor := 3
      else if MatchStr(FPaxInfo.modiNatCd, ['112','113','122','120']) then
        FIsKor := 2
      else
        FIsKor := 1;

    finally
      ResJson := '';
      crwObj.Free;
    end;
  end;

  Result := ABC_SUCCESS;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: GetSvrData_InitValue                                           //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.10.31                                                     //
//  Arguments: sFlag                                                           //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function GetSvrData_InitValue(sFlag : string) : Integer;
var
  ReqJson : TStringStream;
  ResJson : string;
  ResObj : TResInfo;
  kioskObj : TKioskInfo;
begin
  Result := ABC_FAIL;

  if NOSERVICE_VALUE then
  begin
    FHistObj.edGb := 'E';
    FHistObj.kioskIp := GetLocalIP;
  end
  else
  begin
    kioskObj := TKioskInfo.Create;
    try
      if GetSvrData_DateTime <> ABC_SUCCESS then Exit;

      kioskObj.edGb := 'E';
      kioskObj.kioskIp := GetLocalIP;
      kioskObj.workDate := FHistObj.edDate;
      kioskObj.workTime := FHistObj.edTime;
      kioskObj.opYn := sFlag;
      kioskObj.offiCd := 'GA';
      kioskObj.procId := 'GAN';

      // HTTP Post faceImg
      ReqJson := TStringStream.Create(TJson.Stringify(kioskObj,False,False),TEncoding.UTF8);
      try
        ResJson := HTTPJson(SERVER_ADDRESS, '/log/insertKioskOpStopConLog.json', ReqJson);
      finally
        ReqJson.Free;
      end;

  //    kioskObj := TJson.Parse<TKioskInfo>(ResJson);
      ResObj := TJson.Parse<TResInfo>(ResJson);

      Main.lblStatusText.Caption := ResObj.ResFlag + '::' + ResObj.ResMsg;
      Main.ShowLog(ResObj.ResFlag + '::' + ResObj.ResMsg);
  //    if Pos(ABC01001, ResObj.ResMsg) = 0 then
  //    begin
  //      Exit;
  //    end;

      FHistObj.edGb := kioskObj.edGb;
      FHistObj.kioskIp := kioskObj.kioskIp;

    finally
      kioskObj.Free;
    end;
  end;

  Result := ABC_SUCCESS;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: GetSvrData_DateTime                                            //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.29                                                     //
//  Arguments: None                                                           //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function GetSvrData_DateTime : Integer;
var
  ReqJson : TStringStream;
  ResJson : string;
  jsonObj : ISuperObject;
begin
  Result := ABC_FAIL;
  if NOSERVICE_VALUE then
  begin
    FHistObj.edDate := FormatDateTime('yyyymmdd', Now);
    FHistObj.edTime := FormatDateTime('hhnnss', Now);
    Result := ABC_SUCCESS;
  end
  else
  begin
    ReqJson := TStringStream.Create('{}',TEncoding.UTF8);

    try
      try
        ResJson := HTTPJson(SERVER_ADDRESS, '/gate/DbServerCheck.json', ReqJson);
      except
  //      on E : Exception do
  //        Log(E.ClassName + '::' + E.Message);
  //      {$DEFINE __NOSERVICE}
      end;

      jsonObj := SO(ResJson);
      if Pos(ABC00001, jsonObj.S['resMsg']) > 0 then
      begin
        FHistObj.edDate := jsonObj.S['dbYmd'];
        FHistObj.edTime := jsonObj.S['dbHms'];
        Result := ABC_SUCCESS;
      end;
    finally
      ReqJson.Free;
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: GetServiceFingerFeature                                        //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: feature, feature2 : PABC_FEATURE                               //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function GetServiceFingerFeature( feature, feature2 : PABC_FEATURE ) : Integer;
var
  iQuality, iQuality2, iFingerSpecLen : Integer;
  pData : array[0..20480] of AnsiChar;
  mem : TMemoryStream;
  Bytes : TBytes;
  ReqJson : TStringStream;
  ResJson : string;
  fniObj : TFNIObj;
begin
  Result := ABC_FAIL;

  if not NOSERVICE_VALUE then
  begin
    fniObj := TFNIObj.Create;
    try
      fniObj.RegNo := FPaxInfo.regNo;

      // HTTP Post fingerSpec
      mem := TMemoryStream.Create;
      ReqJson := TStringStream.Create(TJson.Stringify(fniObj,False,False),TEncoding.UTF8);

      try
        ResJson := HTTPJson(SERVER_ADDRESS, '/finger/selectFingerSpec.json', ReqJson);
  //      ShowMessage(ResJson);
      finally
        ReqJson.Free;
      end;

      fniObj := TJson.Parse<TFNIObj>(ResJson);
      FPaxInfo.fingerIndex := fniObj.LeftFingerIndex + fniObj.LeftFingerIndex;
      FPaxInfo.leftFnSpecLen := IntToStr(Length(fniObj.LeftFingerSpec));
      StrPLCopy(PAnsiChar(@FPaxInfo.leftFnSpec[0]), fniObj.LeftFingerSpec, Length(FPaxInfo.leftFnSpec));
      FPaxInfo.leftFnQuality := fniObj.LeftQuality;
      FPaxInfo.rightFnSpecLen := IntToStr(Length(fniObj.RightFingerSpec));
      StrPLCopy(PAnsiChar(@FPaxInfo.rightFnSpec[0]), fniObj.RightFingerSpec, Length(FPaxInfo.rightFnSpec));
      FPaxInfo.rightFnQuality := fniObj.RightQuality;

      // LeftFinger
      if StrToInt(FPaxInfo.leftFnSpecLen) > 0 then
      begin
        ZeroMemory(@pData, 20480);
        CharArrayToPByte(FPaxInfo.leftFnSpec, StrToInt(FPaxInfo.leftFnSpecLen), @pData, @iFingerSpecLen ); // hex => bin 변환
        if iFingerSpecLen > 0 then
        begin
          //DIGENT_IZZIXFCI
          feature.info.ftype := Integer( FT_FINGER );
          feature.info.algorithm_name := 'DIGENT_IZZIXFCI';
          feature.info.iSize := iFingerSpecLen;
          feature.data := GetMemory( iFingerSpecLen );
          CopyMemory( feature.data, @pData, iFingerSpecLen );
        end;
      end;

      // RightFinger
      if StrToInt(FPaxInfo.rightFnSpecLen) > 0 then
      begin
        ZeroMemory(@pData, 20480);
        CharArrayToPByte(FPaxInfo.rightFnSpec, StrToInt(FPaxInfo.rightFnSpecLen), @pData, @iFingerSpecLen ); // hex => bin 변환
        if iFingerSpecLen > 0 then
        begin
          //DIGENT_IZZIXFCI
          feature2.info.ftype := Integer( FT_FINGER );
          feature2.info.algorithm_name := 'DIGENT_IZZIXFCI';
          feature2.info.iSize := iFingerSpecLen;
          feature2.data := GetMemory( iFingerSpecLen );
          CopyMemory( feature2.data, @pData, iFingerSpecLen );
        end;
      end;
    finally
      fniObj.Free;
    end;
  end;

  Result := ABC_SUCCESS;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: GetServiceFaceImage                                            //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.29                                                     //
//  Arguments: image : PABC_IMAGE                                             //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function GetServiceFaceImage( image : PABC_IMAGE ) : Integer;
var
  iQuality, iQuality2, iFingerSpecLen : Integer;
  mem : TMemoryStream;
  Bytes : TBytes;
  ReqJson : TStringStream;
  ResJson : string;
  fciObj : TFCIObj;
  obj: ISuperObject;
begin
  Result := ABC_FAIL;

  if not NOSERVICE_VALUE then
  begin
    fciObj := TFCIObj.Create;

    try
    //  fciObj.RegNo := g_kiosk_rec[0].reg_no;
      fciObj.RegNo := FPaxInfo.regNo;

      // HTTP Post faceImg
      ReqJson := TStringStream.Create(TJson.Stringify(fciObj,False,False),TEncoding.UTF8);
      try
        ResJson := HTTPJson(SERVER_ADDRESS, '/face/selectFaceImg.json', ReqJson);
      finally
        ReqJson.Free;
      end;

      mem := TMemoryStream.Create;
    //  fciObj := TJson.Parse<TFCIObj>(ResJson);
      obj := SO(ResJson);
      try
    //    Bytes := DecodeBase64(AnsiString(fciObj.FaceImg));
        FPaxInfo.faceImg := obj.S['faceImg'];
        Bytes := DecodeBase64(AnsiString(obj.S['faceImg']));
        mem.WriteBuffer(Bytes[0], Length(Bytes));

        image.info.iImageType := Integer(IT_JPG);
        image.info.iWidth := 320;
        image.info.iHeight := 480;
        image.info.iSize := mem.Size;
        image.data := GetMemory(mem.Size);
        mem.Position := 0;
        mem.ReadBuffer(image.data^, mem.Size);
      finally
        mem.Free;
      end;
    finally
      fciObj.Free;
    end;
  end;

  Result := ABC_SUCCESS;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: InsertImmigrationLogs                                          //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.11.02                                                     //
//  Arguments: ProcStat : string                                              //
//  Result:    Integer                                                        //
//  Purpose:   ImmigrationLogs for S510, S520, S530, S540, S550, S560,        //
//                                 S570, S580, S590                           //
////////////////////////////////////////////////////////////////////////////////
//  ProcStat : 10 - Reading Passport                                          //
//             11 - Passport OK  /  12 - Passport Fail                        //
//             20 - Open FrontDoor                                            //
//             21 - Close FrontDoor  /  22 - Fail to get inside               //
//             50 - Scanning Fingerprint                                      //
//             51 - Fingerprint OK  /  52 - Fingerprint Fail                  //
//             60 - Taking Photo                                              //
//             61 - Photo OK  /  62 - Photo Fail                              //
//             80 - Open RearDoor                                             //
//             81 - Close RearDoor  /  82 - Fail to get out                   //
//             99 - Succeed Immigration                                       //
////////////////////////////////////////////////////////////////////////////////
function InsertImmigrationLogs(ProcStat : string) : Integer;
var
  ReqJson : TStringStream;
  ResJson : string;
  ResObj : TResInfo;
  tbS510 : TS510;
begin
  Result := ABC_FAIL;

  if not NOSERVICELOG_VALUE then
  begin
    ResObj := TResInfo.Create;
    tbS510 := TS510.Create;

    try
      if ProcStat = '10' then GetSvrData_DateTime;

      tbS510.edGb := FHistObj.edGb;
      tbS510.edDate := FHistObj.edDate;
      tbS510.edTime := FHistObj.edTime;
      tbS510.kioskIp := FHistObj.kioskIp;
      tbS510.regNo := FPaxInfo.regNo;
      if ProcStat = '10' then
        tbS510.kioskStartDtm := FormatDateTime('YYYYMMDDHHNNSS',Now);
      if ProcStat = '99' then
        tbS510.kioskEndDtm := FormatDateTime('YYYYMMDDHHNNSS',Now);
      tbS510.procStat := ProcStat;
      tbS510.offiCd := '00';
      tbS510.regYn := 'Y';
      tbS510.procId := 'GAN';
      tbS510.procDtm := Now;
      if ProcStat = '10' then
        tbS510.flagType := 'I'
      else
        tbS510.flagType := 'U';

  //    Main.ShowLog(TJson.Stringify(tbS510,False,False));

      // HTTP Post faceImg
      ReqJson := TStringStream.Create(TJson.Stringify(tbS510,False,False),TEncoding.UTF8);
      try
        ResJson := HTTPJson(SERVER_ADDRESS, '/log/insertKioskDevLog.json', ReqJson);
      finally
        ReqJson.Free;
      end;

      ResObj := TJson.Parse<TResInfo>(ResJson);

  //    Main.StatusBar1.Panels[0].Text := ResObj.ResFlag + '::' + ResObj.ResMsg;
      Main.lblStatusText.Caption := tbS510.edGb + '/' + tbS510.edDate + '/' + tbS510.edTime + '/' + tbS510.kioskIp + '/' + tbS510.procStat;
      Main.ShowLog(ResObj.ResFlag + '::' + ResObj.ResMsg);
  //    if Pos(ABC01001, ResObj.ResMsg) = 0 then
  //      Exit;

      ///////////////////////////////////////////////////////////
      ///  for S520, S530, S540, S550, S560, S570, S580, S590 ///
      ///////////////////////////////////////////////////////////
    finally
      ResObj.Free;
      tbS510.Free;
    end;
  end;

  Result := ABC_SUCCESS;
end;

initialization
  InitService;

end.
