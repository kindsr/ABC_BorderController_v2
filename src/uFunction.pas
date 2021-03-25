{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit uFunction;

interface

uses
  Windows, Classes, StrUtils, SysUtils, Vcl.Forms, Vcl.Graphics, jpeg, Winapi.TlHelp32,
  WinSock2, uConst, ABC_PS_DM, ABC_FC_DM, PassportInfo, Dialogs, System.IniFiles,
  CrewInfo;

type
  TRGBArray = array[Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;

{Byte Handling}
function  PByteToCharArray(EncodedData: PByteArray; EncodedDataLen: Integer; DestData: PAnsiChar): integer;     // Binary => pAnsichar
procedure CharArrayToPByte(srcData: PAnsiChar; srcLen: Integer; DecodedData: PByte; DecodedDataLen: PInteger);  // pAnsichar => Binary
function  PByteToString(EncodedData: PByteArray; EncodedDataLen: Integer): string;
procedure StringToPByte(strData: string; DecodedData: PByte; DecodedDataLen: PInteger);
{Sleep}
procedure WaitSleep(sleepTime: Integer);
{Stream}
function  StringToStream(const AString: string): TStream; overload;
procedure StringToStream(Stream: TStream; const S: string); overload;
function  StreamToString(const Stream: TMemoryStream): string;
procedure InsertStringToMemoryStream(MS: TMemoryStream; Index: Integer; const S: string);
{Image Handling}
procedure SmoothResize(Src: TBitmap; Dst: TBitmap);
procedure ResizeImage(const src: TMemoryStream; var des: TMemoryStream); overload;
procedure ResizeImage(src: PABC_IMAGE; des: PABC_IMAGE); overload;
procedure JPG2BMP(src:PABC_IMAGE; des: PABC_IMAGE);
{BusinessLogic}
function InsertMrzData(var ppiObj: TPPIObj; mrz : ABC_PS_MRZ_DATA; ymd: string) : Boolean;
function InsertCrewData(var crwObj: TCRWObj; mrz : ABC_PS_CREW_DATA; ymd: string) : Boolean;
function gp_mrz_digit_check(MRZ_REC : ABC_PS_MRZ_DATA) : String;
function GetTestFingerBMP(bmp : PABC_IMAGE) : Integer;
{Ini File}
procedure SaveConfig(const FileName: string; const rConfig: TConfigInfo);
procedure LoadConfig(const FileName: string; var rConfig: TConfigInfo);
function  GetLocalIP : String;
procedure FreeMemAndNil(var ptr; size: Integer = -1);

implementation

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: PByteToCharArray                                               //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: EncodedData: PByteArray; EncodedDataLen: Integer; DestData: PAnsiChar  //
//  Result:    integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function PByteToCharArray(EncodedData: PByteArray; EncodedDataLen: Integer; DestData: PAnsiChar): integer;
var
  i, j: Integer;
  strTemp: string;
begin
  Result := 0;
  try
    j := 0;
    for i := 0 to EncodedDataLen - 1 do
    begin
      strTemp := Format('%x', [Ord(EncodedData[i])]);
      if Length(strTemp) = 0 then
        strTemp := '00';
      if Length(strTemp) = 1 then
        strTemp := '0' + strTemp;
      for j := 0 to 1 do
        StrPCopy(PAnsiChar(@DestData[i * 2 + j]), Copy(strTemp, j + 1, 1));

    end;
  except
    on E: Exception do
    begin
//      Log( 'PByteToCharArray 변환 오류 : EncodedDataLen = ' + IntToStr(EncodedDataLen) + 'ResultLen = ' + IntToStr(Length(StrPas(DestData)))+' ['+E.Message+']' );
      Exit;
    end;
  end;
  Result := StrLen(DestData);
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: CharArrayToPByte                                               //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: srcData: PAnsiChar; srcLen: Integer; DecodedData: PByte; DecodedDataLen: PInteger  //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure CharArrayToPByte(srcData: PAnsiChar; srcLen: Integer; DecodedData: PByte; DecodedDataLen: PInteger);
var
  Bin: array[0..20480] of AnsiChar;
  iBinSize: Integer;
  i, j: Integer;
  strTemp: string;
begin
  iBinSize := srcLen div 2;
  ZeroMemory(@Bin, 20480);
  i := 1;
  j := 0;
  while i < srcLen do
  begin

    strTemp := '$' + Copy(srcData, i, 2);
    i := i + 2;
    Bin[j] := AnsiChar(StrToInt(strTemp));
    Inc(j);
  end;
//   Log( 'CharArrayToPByte 변환 오류 : iBinSize = ' + IntToStr(iBinSize) + 'Bin = ' +string(Bin) );

  if iBinSize > 0 then
  begin
    CopyMemory(DecodedData, @Bin, iBinSize);
    DecodedDataLen^ := iBinSize;
  end
  else
  begin
    ZeroMemory(DecodedData, 2048);
    DecodedDataLen^ := 0;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: PByteToString                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: EncodedData: PByteArray; EncodedDataLen: Integer               //
//  Result:    string                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function PByteToString(EncodedData: PByteArray; EncodedDataLen: Integer): string;
var
  i: Integer;
  strTemp: string;
  strRet: string;
begin
  strRet := '';

  try
    for i := 0 to EncodedDataLen - 1 do
    begin
      strTemp := Format('%x', [Ord(EncodedData[i])]);
      if Length(strTemp) = 0 then
        strTemp := '00';
      if Length(strTemp) = 1 then
        strTemp := '0' + strTemp;

      strRet := strRet + strTemp;
    end;
  except
    on E: Exception do
    begin
//      Log('PBteToString 변환 오류 : EncodedDataLen = ' + IntToStr(EncodedDataLen) + 'ResultLen = ' + IntToStr(Length(strRet)) + ' [' + E.Message + ']');
      strRet := 'ERROR';
    end;
  end;

  Result := strRet;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: StringToPByte                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: strData: string; DecodedData: PByte; DecodedDataLen: PInteger  //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure StringToPByte(strData: string; DecodedData: PByte; DecodedDataLen: PInteger);
var
  strSrc: string;
  Bin: array[0..20480] of AnsiChar;
  iBinSize: Integer;
  i, j: Integer;
  strTemp: string;
begin
  strSrc := LowerCase(strData);
  iBinSize := Length(strSrc) div 2;
  ZeroMemory(@Bin, 20480);
  i := 1;
  j := 0;
  while i < Length(strSrc) do
  begin
    strTemp := '$' + Copy(strSrc, i, 2);
    i := i + 2;
    Bin[j] := AnsiChar(StrToInt(strTemp));
    Inc(j);
  end;
//  Log('StringToPByte 변환 오류 : iBinSize = ' + IntToStr(iBinSize) + 'Bin = ' + string(Bin));

  if iBinSize > 0 then
  begin
    CopyMemory(DecodedData, @Bin, iBinSize);
    DecodedDataLen^ := iBinSize;
  end
  else
  begin
    ZeroMemory(DecodedData, 2048);
    DecodedDataLen^ := 0;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: WaitSleep                                                      //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: sleepTime: Integer                                             //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure WaitSleep(sleepTime: Integer);
var
  iStart: Integer;
begin
  iStart := GetTickCount;
  while GetTickCount - iStart < sleepTime do
  begin
    Sleep(1);
    Application.ProcessMessages;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: StringToStream                                                 //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: const AString: string                                          //
//  Result:    TStream                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function StringToStream(const AString: string): TStream;
begin
  Result := TStringStream.Create(AString);
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: StringToStream                                                 //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: Stream: TStream; const S: string                               //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure StringToStream(Stream: TStream; const S: string);
begin
  Stream.Write(Pointer(S)^, length(S));
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: StreamToString                                                 //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: const Stream: TMemoryStream                                    //
//  Result:    string                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function StreamToString(const Stream: TMemoryStream): string;
begin
  if Stream.Size <= 0 then
    Exit;
  SetLength(Result, Stream.Size);
  Stream.Position := 0;
  Move(Stream.Memory^, Result[1], Stream.Size);
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: InsertStringToMemoryStream                                     //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: MS: TMemoryStream; Index: Integer; const S: string             //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure InsertStringToMemoryStream(MS: TMemoryStream; Index: Integer; const S: string);
var
  SLength: Integer;
  Chr: PChar;
begin
  SLength := Length(S);
  if SLength = 0 then
    Exit;
  MS.SetSize(MS.Size + SLength * SizeOf(Char));
  Chr := PChar(MS.Memory);
  Move((Chr + Index)^, (Chr + Index + SLength)^, (MS.Size - SLength - Index) * SizeOf(Char));
  Move(Pointer(S)^, (Chr + Index)^, SLength * SizeOf(Char));
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: SmoothResize                                                   //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: Src: TBitmap; Dst: TBitmap                                     //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure SmoothResize(Src: TBitmap; Dst: TBitmap);
var
  x, y: Integer;
  xP, yP: Integer;
  xP2, yP2: Integer;
  SrcLine1, SrcLine2: pRGBArray;
  t3: Integer;
  z, z2, iz2: Integer;
  DstLine: pRGBArray;
  DstGap: Integer;
  w1, w2, w3, w4: Integer;
begin
  Src.PixelFormat := pf24Bit;
  Dst.PixelFormat := pf24Bit;

  if (Src.Width = Dst.Width) and (Src.Height = Dst.Height) then
    Dst.Assign(Src)
  else
  begin
    DstLine := Dst.ScanLine[0];
    DstGap := Integer(Dst.ScanLine[1]) - Integer(DstLine);

    xP2 := MulDiv(pred(Src.Width), $10000, Dst.Width);
    yP2 := MulDiv(pred(Src.Height), $10000, Dst.Height);
    yP := 0;

    for y := 0 to pred(Dst.Height) do
    begin
      xP := 0;

      SrcLine1 := Src.ScanLine[yP shr 16];

      if (yP shr 16 < pred(Src.Height)) then
        SrcLine2 := Src.ScanLine[succ(yP shr 16)]
      else
        SrcLine2 := Src.ScanLine[yP shr 16];

      z2 := succ(yP and $FFFF);
      iz2 := succ((not yP) and $FFFF);
      for x := 0 to pred(Dst.Width) do
      begin
        t3 := xP shr 16;
        z := xP and $FFFF;
        w2 := MulDiv(z, iz2, $10000);
        w1 := iz2 - w2;
        w4 := MulDiv(z, z2, $10000);
        w3 := z2 - w4;
        DstLine[x].rgbtRed := (SrcLine1[t3].rgbtRed * w1 + SrcLine1[t3 + 1].rgbtRed * w2 + SrcLine2[t3].rgbtRed * w3 + SrcLine2[t3 + 1].rgbtRed * w4) shr 16;
        DstLine[x].rgbtGreen := (SrcLine1[t3].rgbtGreen * w1 + SrcLine1[t3 + 1].rgbtGreen * w2 + SrcLine2[t3].rgbtGreen * w3 + SrcLine2[t3 + 1].rgbtGreen * w4) shr 16;
        DstLine[x].rgbtBlue := (SrcLine1[t3].rgbtBlue * w1 + SrcLine1[t3 + 1].rgbtBlue * w2 + SrcLine2[t3].rgbtBlue * w3 + SrcLine2[t3 + 1].rgbtBlue * w4) shr 16;
        Inc(xP, xP2);
      end; {for}
      Inc(yP, yP2);
      DstLine := pRGBArray(Integer(DstLine) + DstGap);
    end; {for}
  end; {if}
end; {SmoothResize}

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: ResizeImage                                                    //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: const src: TMemoryStream; var des: TMemoryStream               //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure ResizeImage(const src: TMemoryStream; var des: TMemoryStream);
var
  OldBitmap: Vcl.Graphics.TBitmap;
  NewBitmap: Vcl.Graphics.TBitmap;
  jpg: TJPEGImage;
begin
  jpg := TJPEGImage.Create;
  OldBitmap := Vcl.Graphics.TBitmap.Create;
  try
    src.Position := 0;
    OldBitmap.LoadFromStream(src);

    if (OldBitmap.Width > 320) then
    begin
      NewBitmap := Vcl.Graphics.TBitmap.Create;
      try
        NewBitmap.Width := 320;
        NewBitmap.Height := MulDiv(320, OldBitmap.Height, OldBitmap.Width);
        SmoothResize(OldBitmap, NewBitmap);
        jpg.Assign(NewBitmap);
        jpg.CompressionQuality := 75;
//        jpg.SaveToFile('.\ResizeJPG.jpg');
        des.Clear;
        des.Position := 0;
        jpg.SaveToStream(des);
      finally
        NewBitmap.Free;
      end; {try}
    end
    else
    begin
      jpg.Assign(OldBitmap);
      jpg.CompressionQuality := 75;
//        jpg.SaveToFile('.\ResizeJPG.jpg');
      des.Clear;
      des.Position := 0;
      jpg.SaveToStream(des);
    end; {if}
  finally
    FreeAndNil(OldBitmap);
    FreeAndNil(jpg);
  end; {try}
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: ResizeImage                                                    //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.05                                                     //
//  Arguments: src: PABC_IMAGE; des: PABC_IMAGE                               //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure ResizeImage(src: PABC_IMAGE; des: PABC_IMAGE);
var
  mem : TMemoryStream;
  OldBitmap: Vcl.Graphics.TBitmap;
  NewBitmap: Vcl.Graphics.TBitmap;
  jpg : TJPEGImage;
  aWidth: Integer;
begin
  mem := TMemoryStream.Create;
  jpg := TJPEGImage.Create;
  OldBitmap := TBitmap.Create;
  try
//    OldBitmap := src;
    mem.Write( src.data^, src.info.iSize );
    mem.Position := 0;
    OldBitmap.LoadFromStream(mem);

    aWidth := OldBitmap.Width;
    if (OldBitmap.Width > 320) then
    begin
      aWidth    := 320;
      NewBitmap := TBitmap.Create;
      try
        NewBitmap.Width  := 320;
        NewBitmap.Height := MulDiv(320, OldBitmap.Height, OldBitmap.Width);
        SmoothResize(OldBitmap, NewBitmap);
        jpg.Assign(NewBitmap);
        jpg.CompressionQuality := 75;
//        jpg.SaveToFile('.\ResizeJPG.jpg');
        mem.Clear;
        mem.Position := 0;
        jpg.SaveToStream(mem);

        FCC_MakeImage( Integer( IT_JPG ), mem.Memory, mem.Size, des );
      finally
        NewBitmap.Free;
      end; {try}
    end
    // 2017-05-18 dyddyd  경찰청지문연계시 촬영이미지 누락의심되는 부분
    else
    begin
      jpg.Assign(OldBitmap);
      jpg.CompressionQuality := 75;
//        jpg.SaveToFile('.\ResizeJPG.jpg');
      mem.Clear;
      mem.Position := 0;
      jpg.SaveToStream(mem);

      FCC_MakeImage( Integer( IT_JPG ), mem.Memory, mem.Size, des );
    end; {if}
  finally
    FreeAndNil(OldBitmap);
    FreeAndNil(jpg);
    FreeAndNil(mem);
  end; {try}
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: JPG2BMP                                                        //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.05                                                     //
//  Arguments: src:PABC_IMAGE; des: PABC_IMAGE                                //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure JPG2BMP(src:PABC_IMAGE; des: PABC_IMAGE);
var
  mem : TMemoryStream;
  jpg : TJPEGImage;
  bmp : Vcl.Graphics.TBitmap;
  iWidth, iHeight, iBPP : Integer;
begin
  if src.info.iSize = 0 then
    Exit;

  mem := TMemoryStream.Create;
  jpg := TJPEGImage.Create;
  bmp := Vcl.Graphics.TBitmap.Create;

  try
    mem.Write( src.data^, src.info.iSize );
    mem.Position := 0;

    if src.info.iImageType = Integer( IT_BITMAP ) then
      bmp.LoadFromStream( mem )
    else
    begin
      jpg.LoadFromStream( mem );
      bmp.PixelFormat := pf24bit;
      bmp.Assign( jpg );
//      bmp.SaveToFile('.\JPG2BMP_'+ IntToStr(src.info.iSize) +'.bmp');
    end;

    mem.Clear;
    mem.Position := 0;
    bmp.SaveToStream(mem);

    iWidth  := bmp.Width;
    iHeight := bmp.Height;
//    iBPP    := IfThen( bmp.PixelFormat = pf24bit, 3, 1 );
    if bmp.PixelFormat = pf24bit then
      iBPP := 3
    else
      iBPP := 1;

    des.info.iImageType := Integer( IT_BITMAP );
    des.info.iWidth := iWidth;
    des.info.iHeight := iHeight;
//    des.info.iSize := iWidth*iHeight*iBPP;
//    des.data := GetMemory( iWidth*iHeight*iBPP );
    des.info.iSize := mem.Size;
    des.data := GetMemory( mem.Size );
    mem.Position := 0;
    mem.Read(des.data^, mem.Size);
  finally
    FreeAndNil(jpg);
    FreeAndNil(bmp);
    FreeAndNil(mem);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: GetLocalIP                                                     //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.29                                                     //
//  Arguments: None                                                           //
//  Result:    String                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function GetLocalIP : String;
var
  varTWSAData: TWSAData;
  varPHostEnt: PHostEnt;
  varTInAddr : TInAddr;
  namebuf    : array[0..255] of AnsiChar;
  function IsWinsockInitialized: Boolean;
  var
    sock: TSocket;
  begin
    sock := socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    result := (sock <> INVALID_SOCKET) or (WSAGetLastError <> WSANOTINITIALISED);
  end;
begin
  Result := '127.0.0.1';
  if not IsWinsockInitialized then
  begin
    WSAStartup(MAKEWORD(1, 1), varTWSAData);
    if not IsWinsockInitialized then
      Exit;
  end;

  if gethostname(@namebuf, sizeof(namebuf)) = SOCKET_ERROR then
    Exit;

  varPHostEnt := gethostbyname(@namebuf);
  varTInAddr.S_addr := ULONG(PULONG(varPHostEnt^.h_addr_list^)^);
  Result := String(inet_ntoa(varTInAddr));
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: KillTask                                                       //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2018.08.08                                                     //
//  Arguments: ExeFileName: string                                            //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: FreeMemAndNil                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.12                                                     //
//  Arguments: var ptr; size: Integer = -1                                    //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure FreeMemAndNil(var ptr; size: Integer = -1);
var
  p: Pointer;
begin
  p := Pointer(ptr);
  if p <> nil then
  begin
    if size > -1 then
      FreeMem(p, size)
    else
      FreeMem(p);
    Pointer(ptr) := nil;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: InsertMrzData                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.12                                                     //
//  Arguments: var ppiObj: TPPIObj; mrz : ABC_PS_MRZ_DATA; ymd: string        //
//  Result:    Boolean                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function InsertMrzData(var ppiObj: TPPIObj; mrz : ABC_PS_MRZ_DATA; ymd: string) : Boolean;
var
  sYear1, sYear2 : string;

  function DelStr(const S, sDel : string) : string;
  var
    sTmp : string;
  begin
    sTmp := S;
    while Pos(sDel, sTmp) > 0 do
      Delete(sTmp, Pos(sDel, sTmp), Length(sDel));
    Result := sTmp;
  end;
begin
  Result := False;

  sYear1 := copy(ymd,1,2);
  sYear2 := Copy(ymd,3,2);

  if Trim(mrz.Nationality) = 'KOR' then
  begin
    with ppiObj do
    begin
      name := DelStr(Trim(mrz.Name),'<');
      passNo := Trim(mrz.PassportNum);

      if Length(Trim(mrz.Birth)) = 6 then
      begin
        if Copy(Trim(mrz.Birth),1,2) > sYear2 then
          birth := '19' + mrz.Birth
        else
          birth := sYear1 + mrz.Birth;
      end
      else
        birth := mrz.Birth;

      if (Pos('M', mrz.Sex) = 0) and (Pos('F', mrz.Sex) = 0) then
        sex := ''
      else
        sex := mrz.Sex;

      if (Copy(birth,5,4) = '<<<<') or (Copy(birth,5,4) = '4444') then
        birth := Copy(birth,1,4) + '0000';
      juminNo := Trim(Copy(mrz.Optional,1,7));
      if Length(Trim(mrz.Expiry)) = 6 then
        passExpDate := '20' + mrz.Expiry
      else
        passExpDate := mrz.Expiry;
      natCd := mrz.Nationality;
      modiNatCd := '100';
    end;
  end
  else
  begin
    with ppiObj do
    begin
      name := DelStr(Trim(mrz.Name),'<');
      passNo := Trim(mrz.PassportNum);

      if Length(Trim(mrz.Birth)) = 6 then
      begin
        if Copy(Trim(mrz.Birth),1,2) > sYear2 then
          birth := '19' + mrz.Birth
        else
          birth := sYear1 + mrz.Birth;
      end
      else
        birth := mrz.Birth;

      if (Pos('M', mrz.Sex) = 0) and (Pos('F', mrz.Sex) = 0) then
        sex := 'Z'
      else
        sex := mrz.Sex;

      if (Copy(birth,5,4) = '<<<<') or (Copy(birth,5,4) = '4444') then
        birth := Copy(birth,1,4) + '0000';
      juminNo := Trim(Copy(mrz.Optional,1,13));
      if Length(Trim(mrz.Expiry)) = 6 then
        passExpDate := '20' + mrz.Expiry
      else
        passExpDate := mrz.Expiry;

      if Length(Trim(mrz.Nationality)) = 3 then
      begin
        if Trim(mrz.Nationality) = 'D<<' then
          natCd := 'DEU'
        else
          natCd := mrz.Nationality;

        if Trim(mrz.Nationality) = 'CHN' then
        begin
          if (Copy(Trim(mrz.PassportNum),1,1) = 'H') or (Copy(Trim(mrz.PassportNum),1,1) = 'K') then
            modiNatCd := '120'
          else if Copy(Trim(mrz.PassportNum),1,1) = 'M' then
            modiNatCd := '142'
          else
            modiNatCd := '112'
        end
        else if Trim(mrz.Nationality) = 'GBR' then
          modiNatCd := '120'
        else
          modiNatCd := '100';
      end;
    end;
  end;

  Result := True;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: InsertCrewData                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.12                                                     //
//  Arguments: var crwObj: TCRWObj; mrz : ABC_PS_MRZ_DATA; ymd: string        //
//  Result:    Boolean                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function InsertCrewData(var crwObj: TCRWObj; mrz : ABC_PS_CREW_DATA; ymd: string) : Boolean;
var
  sYear1, sYear2 : string;

  function DelStr(const S, sDel : string) : string;
  var
    sTmp : string;
  begin
    sTmp := S;
    while Pos(sDel, sTmp) > 0 do
      Delete(sTmp, Pos(sDel, sTmp), Length(sDel));
    Result := sTmp;
  end;
begin
  Result := False;

  sYear1 := copy(ymd,1,2);
  sYear2 := Copy(ymd,3,2);

  with crwObj do
  begin
    name := DelStr(Trim(mrz.EnglishName),'<');
    crewNo := Trim(mrz.RegNum);

    if Length(Trim(mrz.BirthDay)) = 6 then
    begin
      if Copy(Trim(mrz.BirthDay),1,2) > sYear2 then
        birth := '19' + mrz.BirthDay
      else
        birth := sYear1 + mrz.BirthDay;
    end
    else
      birth := mrz.BirthDay;

    if (Pos('M', mrz.Sex) = 0) and (Pos('F', mrz.Sex) = 0) then
      sex := ''
    else
      sex := mrz.Sex;

    if (Copy(birth,5,4) = '<<<<') or (Copy(birth,5,4) = '4444') then
      birth := Copy(birth,1,4) + '0000';
    juminNo := Trim(Copy(mrz.PersonNum,1,7));
    if Length(Trim(mrz.ExpiryDay)) = 6 then
      passExpDate := '20' + mrz.ExpiryDay
    else
      passExpDate := mrz.ExpiryDay;
    natCd := mrz.Nationality;
  end;

  Result := True;
end;

function gp_mrz_digit_check(MRZ_REC : ABC_PS_MRZ_DATA) : String;
var
  sCD1  : AnsiString;
  sCD2  : AnsiString;
  sCD3  : AnsiString;
  sCD4  : AnsiString;
  sCD5  : AnsiString;
  sCD6  : AnsiString;
  sCDR1 : AnsiString;
  sCDR2 : AnsiString;
  sCDR3 : AnsiString;
  sCDR4 : AnsiString;
  sCDR5 : AnsiString;
  sCDR6 : AnsiString;
begin
  Result := '';

  sCD1  := MRZ_REC.PassportNumCD; //여권번호
  sCD2  := MRZ_REC.BirthCD;       //생년월일
  sCD3  := MRZ_REC.ExpiryCD;      //만료일
  sCD4  := MRZ_REC.OptionalCD;    //추가정보()
  sCD5  := MRZ_REC.CompositeCD;   //복합 체크섬
  sCD6  := MRZ_REC.OptionalCD;
  sCDR1 := MRZ_REC.PassportNumCDR;
  sCDR2 := MRZ_REC.BirthCDR;
  sCDR3 := MRZ_REC.ExpiryCDR;
  sCDR4 := MRZ_REC.OptionalCDR;
  sCDR5 := MRZ_REC.CompositeCDR;
  sCDR6 := MRZ_REC.OptionalCDR;

  if sCD1 = '<' then sCD1 := '0';
  if sCD2 = '<' then sCD2 := '0';
  if sCD3 = '<' then sCD3 := '0';
  if sCD4 = '<' then sCD4 := '0';
  if sCD5 = '<' then sCD5 := '0';
  if sCD6 = '<' then sCD6 := '0';

  if (sCD1<>sCDR1) or
     (sCD2<>sCDR2) or
     (sCD3<>sCDR3) or
     (sCD4<>sCDR4) or
     (sCD5<>sCDR5) or
     (sCD6<>sCDR6) then
  begin
      Result := 'Check Digit Error';
  end;

  if (sCD1<>sCDR1) then Result := 'N' else Result := 'Y';
  if (sCD2<>sCDR2) then Result := Result+'N' else Result := Result+'Y';
  if (sCD3<>sCDR3) then Result := Result+'N' else Result := Result+'Y';
  if (sCD4<>sCDR4) then Result := Result+'N' else Result := Result+'Y';
  if (sCD5<>sCDR5) then Result := Result+'N' else Result := Result+'Y';
  if (sCD6<>sCDR6) then Result := Result+'N' else Result := Result+'Y';
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: GetTestFingerBMP                                               //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.10.19                                                     //
//  Arguments: bmp : PABC_IMAGE                                               //
//  Result:    Integer                                                        //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function GetTestFingerBMP(bmp : PABC_IMAGE) : Integer;
var
  mem : TMemoryStream;
  Bitmap: Vcl.Graphics.TBitmap;
  iWidth, iHeight : Integer;
begin
  Result := ABC_FAIL;

  mem := TMemoryStream.Create;
  Bitmap := TBitmap.Create;

  try
    // TestFinger.bmp 로드
    Bitmap.LoadFromFile('./TestFinger.bmp');
    Bitmap.SaveToStream(mem);
    bmp.info.iImageType := Integer(IT_BITMAP);
    bmp.info.iWidth := Bitmap.Width;
    bmp.info.iHeight := Bitmap.Height;
    bmp.info.iSize := mem.Size;
    bmp.data := GetMemory( mem.Size );
    mem.Position := 0;
    mem.Read(bmp.data^, mem.Size);
  finally
    FreeAndNil(Bitmap);
    FreeAndNil(mem);
  end;

  Result := ABC_SUCCESS;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: SaveConfig                                                     //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.12.27                                                     //
//  Arguments: const FileName: string; const rConfig: TConfigInfo             //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure SaveConfig(const FileName: string; const rConfig: TConfigInfo);
var
  ini: TMemIniFile;
begin
  ini := TMemIniFile.Create(FileName);
  try
    ini.WriteString('FORM', 'OverlayMode', IfThen(rConfig.OverlayMode, '1', '0'));
    ini.WriteString('FORM', 'Animation', IfThen(rConfig.Animation, '1', '0'));
    ini.WriteInteger('FORM', 'CompactWidth', rConfig.CompactWidth);
    ini.WriteInteger('FORM', 'SkinComboIndex', rConfig.SkinComboIndex);
    ini.WriteString('FORM', 'Maximize', IfThen(rConfig.Maximize, '1', '0'));
    ini.WriteString('FORM', 'Sizable', IfThen(rConfig.Sizable, '1', '0'));
    ini.WriteString('FORM', 'StayOnTop', IfThen(rConfig.StayOnTop, '1', '0'));
    ini.WriteString('FORM', 'ShowFlash', IfThen(rConfig.ShowFlash, '1', '0'));
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end; {SaveConfig}

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: LoadConfig                                                     //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.12.27                                                     //
//  Arguments: const FileName: string; var rConfig: TConfigInfo               //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure LoadConfig(const FileName: string; var rConfig: TConfigInfo);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(FileName);
  try
    if ini.ReadString('FORM', 'OverlayMode', '1') = '1' then
      rConfig.OverlayMode := True
    else
      rConfig.OverlayMode := False;
    if ini.ReadString('FORM', 'Animation', '1') = '1' then
      rConfig.Animation := True
    else
      rConfig.Animation := False;
    rConfig.CompactWidth := ini.ReadInteger('FORM', 'CompactWidth', 0);
    rConfig.SkinComboIndex := ini.ReadInteger('FORM', 'SkinComboIndex', 0);
    if ini.ReadString('FORM', 'Maximize', '1') = '1' then
      rConfig.Maximize := True
    else
      rConfig.Maximize := False;
    if ini.ReadString('FORM', 'Sizable', '1') = '1' then
      rConfig.Sizable := True
    else
      rConfig.Sizable := False;
    if ini.ReadString('FORM', 'StayOnTop', '1') = '1' then
      rConfig.StayOnTop := True
    else
      rConfig.StayOnTop := False;
    if ini.ReadString('FORM', 'ShowFlash', '1') = '1' then
      rConfig.ShowFlash := True
    else
      rConfig.ShowFlash := False;
  finally
    ini.Free;
  end;
end; {LoadConfig}

end.
