unit frmControlDevice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  se_pngimagelist, se_form, se_effect, se_ani, se_controls, Vcl.StdCtrls, Vcl.ExtCtrls,
  uFunction, uConst, ABC_PS_DM, ABC_FN_DM, ABC_FC_DM, Vcl.ComCtrls, Jpeg;

type
  TControlDevice = class(TForm)
    sePageViewer2: TsePageViewer;
    pagCD_Fingerprint: TsePageViewerPage;
    pagCD_Camera: TsePageViewerPage;
    pagCD_Passport: TsePageViewerPage;
    btnConnect: TButton;
    btnDisconnect: TButton;
    btnStart: TButton;
    GroupBox3: TGroupBox;
    lbDocumentType: TLabel;
    Panel1: TPanel;
    imgPhoto: TImage;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtDocType: TEdit;
    edtName: TEdit;
    edtDocNo: TEdit;
    edtBirth: TEdit;
    edtExpiry: TEdit;
    edtIssueCountry: TEdit;
    edtSex: TEdit;
    edtNationality: TEdit;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    edtDocNoCD: TEdit;
    edtDocNoCDR: TEdit;
    edtBirthCD: TEdit;
    edtBirthCDR: TEdit;
    edtExpiryCD: TEdit;
    edtOptionalCD: TEdit;
    edtOptionalCDR: TEdit;
    edtExpiryCDR: TEdit;
    edtComCD: TEdit;
    edtComCDR: TEdit;
    GroupBox6: TGroupBox;
    edtMRZ1: TEdit;
    edtMRZ2: TEdit;
    edtMRZ3: TEdit;
    Panel2: TPanel;
    imgIR: TImage;
    Panel3: TPanel;
    imgUV: TImage;
    Panel4: TPanel;
    imgWH: TImage;
    seToolBarEx1: TseToolBarEx;
    seAnimationList1: TseAnimationList;
    PageAnimation: TseAnimation;
    FormShowAnimation: TseAnimation;
    SlideBackAnimation: TseAnimation;
    seAnimationForm1: TseAnimationForm;
    sePngImageList1: TsePngImageList;
    SlideAnimation: TseAnimation;
    btnStop: TButton;
    Panel6: TPanel;
    imgLeftFinger: TImage;
    Panel7: TPanel;
    imgRightFinger: TImage;
    btnCaptureRightFinger: TButton;
    btnCaptureLeftFinger: TButton;
    btnFingerDeviceOpen: TButton;
    btnFingerDeviceClose: TButton;
    btnFAOpen: TButton;
    btnFAClose: TButton;
    procedure seToolBarEx1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure seToolBarEx1PrepareAnimation(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure PageAnimationFinish(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFingerDeviceOpenClick(Sender: TObject);
    procedure btnFingerDeviceCloseClick(Sender: TObject);
    procedure btnFAOpenClick(Sender: TObject);
    procedure btnFACloseClick(Sender: TObject);
    procedure btnCaptureLeftFingerClick(Sender: TObject);
    procedure btnCaptureRightFingerClick(Sender: TObject);
  private
    PSDMContext: ABC_Context;
    FNDMContext: ABC_Context;
    FNAMContext: ABC_Context;
    FDocType: Integer;
    FMRZData: ABC_PS_MRZ;
    FMRZAllData: ABC_PS_MRZ_DATA;
    FMRPFaceImg: ABC_IMAGE;
    FFingerSpoof: Integer; // �����Ǻ����� ����
    FLFingerFeature, // ��� ���� Ư¡��1
    FRFingerFeature: array[0..20480] of AnsiChar; // ��� ���� Ư¡��2
    FLFingerQuality,
    FRFingerQuality: Integer;
    FLFingerImg, FRFingerImg: ABC_IMAGE; // �����̹���
    procedure ShowLog(strMsg: string);
    procedure ClearWindow;
    function GetMRP_Photo: Integer;
    procedure GetOpticalData;
    procedure ShowImage(image: TImage; data: ABC_IMAGE);
    procedure TakeFingerprint;
    procedure MatchFingerprint;
  protected
    procedure WndProc(var Msg: TMessage); override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlDevice: TControlDevice;
  CloseState: Boolean;

implementation

uses
  frmMain;

{$R *.dfm}

procedure TControlDevice.WndProc(var Msg: TMessage);
begin
  case Msg.Msg of
    // �����ǵ��� �޽���
    WM_PS_DEVICE:
      begin
        case PS_DEV_MSSG_WPARAM_DEFINE(Msg.WParam) of
          WP_PS_ERROR:
            begin
              case Msg.LParam of
                0:
                  begin
                    ShowLog('WM_PS_DEVICE : WP_PS_ERROR  ����');
                  end;
                1:
                  begin
                    ShowLog('WM_PS_DEVICE : WP_PS_ERROR �¹���ī��');
                    // 2016-12-14 dyddyd ���н� ��� ����ȣ��
                    PPR_ReadDocument(PSDMContext, READ_AUTO, true);
                  end;
              end;
//              GetDeviceErrStatus;
            end; //WP_PS_DOCUMENT_ON

          WP_PS_DOCUMENT_ON:
            begin
              ShowLog('���ǰ���');
              ShowLog('WM_PS_DEVICE : WP_PS_DOCUMENT_ON');
            end; //WP_PS_DOCUMENT_ON

          WP_PS_PASSPORT_READ_BEGIN:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_PASSPORT_READ_BEGIN');
            end; //WP_PS_PASSPORT_READ_BEGIN

          WP_PS_PASSPORT_READ_END:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_PASSPORT_READ_END');
              GetOpticalData;
            end; //WP_PS_PASSPORT_READ_END

          WP_PS_E_PASSPORT_ON:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_E_PASSPORT_ON');
            end; //WP_PS_E_PASSPORT_ON

          WP_PS_E_PASSPORT_READ_BEGIN:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_E_PASSPORT_READ_BEGIN');
            end; //WP_PS_E_PASSPORT_READ_BEGIN

          WP_PS_E_PASSPORT_READ_END:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_E_PASSPORT_READ_END');
//              GetEDocData;
            end; //WP_PS_E_PASSPORT_READ_END

          WP_PS_RFCARD_ON:
            begin
              ShowLog('�¹���ī�� ����');
              ShowLog('WM_PS_DEVICE : WP_PS_RFCARD_ON');
            end; //WP_PS_RFCARD_ON
  //
          WP_PS_RFCARD_READ_BEGIN:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_RFCARD_READ_BEGIN');
            end; //WP_PS_RFCARD_READ_BEGIN
  //
          WP_PS_RFCARD_READ_END:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_RFCARD_READ_END');
              PPR_ReadDocumentStop(PSDMContext);
            end; //WP_PS_RFCARD_READ_END

          WP_PS_DOCUMENT_OFF: ;
        end; //case PS_DEV_MSSG_WPARAM_DEFINE(Message.wParam) of
      end; // WM_PS_DEVICE

    // ���� �ν� �޽���
    WM_FN_DEVICE..WM_FN_DEVICE + MAX_DEVICE:
      begin
        case FN_DEV_MSSG_WPARAM_DEFINE(Msg.WParam) of
          WP_FN_ERROR:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_ERROR');
//                    GetDeviceErrStatus;
            end; //WP_FN_ERROR

          WP_FN_OPEN:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_OPEN');
            end; //WP_FN_OPEN

          WP_FN_CLOSE:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_CLOSE');
            end; //WP_FN_CLOSE

          WP_FN_NO_FINGER:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_NO_FINGER');
            end; //WP_FN_NO_FINGER

          WP_FN_FINGER_OK:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_FINGER_OK');
            end; //WP_FN_NO_FINGER

          WP_FN_MOVE_LEFT:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_MOVE_LEFT');
            end; //WP_FN_MOVE_LEFT

          WP_FN_MOVE_RIGHT:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_MOVE_RIGHT');
            end; //WP_FN_MOVE_RIGHT

          WP_FN_MOVE_UP:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_MOVE_UP');
            end; //WP_FN_MOVE_UP

          WP_FN_MOVE_DOWN:
            begin
              ShowLog('WM_FN_DEVICE : WP_FN_MOVE_DOWN');
            end; //WP_FN_MOVE_DOWN
          WP_FN_PROCESS:
            begin
              case Msg.LParam of
                ABC_SUCCESS:
                  begin
                    ShowLog('WM_FN_DEVICE : WP_FN_PROCESS : CAPTURED');
                    MatchFingerprint;
                  end;
                ABC_FN_CAPTURE_FAIL: ;
                ABC_FN_CAPTURE_TIMEOUT: ;
                ABC_FN_CAPTURE_CANCELED: ;
              end;
            end;
        end; //case FC_DEV_MSSG_WPARAM_DEFINE(Msg.wParam) of
      end; // WM_FC_DEVICE
  else
    inherited WndProc(Msg);
  end;
end;

{Passport Control}
procedure TControlDevice.btnConnectClick(Sender: TObject);
var
  info: ABC_DEVICE_INFO;
  src: AnsiString;
  nRetVal: Integer;
begin
FCC_2PStart;
  {$IFNDEF __NOEQUIPMENT__PASSPORT}
  nRetVal := PPR_InitSDK;
  if nRetVal <> ABC_SUCCESS then
  begin
    ShowLog(Format('>>>>�����ǵ����ʱ�ȭ::����[%s]', [PPR_ErrorToDescription(nil, PPR_GetLastError(nil))]));
    Exit;
  end;

  if PPR_GetDeviceSource(@info) <> ABC_SUCCESS then
  begin
    ShowLog('>>>>�����ǵ����ʱ�ȭ::�˻�����');
  end
  else
  begin
    if info.iDeviceCount > 0 then
    begin
      ShowLog(Format('>>>>�����ǵ����ʱ�ȭ::��񰹼�=%d', [info.iDeviceCount]));
      src := info.strDeviceName[0];
      if PPR_CreateContext(@PSDMContext, PAnsiChar(src)) <> ABC_SUCCESS then
      begin
        ShowLog(Format('>>>>�����ǵ����ʱ�ȭ::����[%s]', [PPR_ErrorToDescription(nil, PPR_GetLastError(nil))]));
      end;
    end
    else
    begin
      ShowLog('>>>>�����ǵ����ʱ�ȭ::������');
    end;
  end;
  btnConnect.Enabled := False;
  btnDisconnect.Enabled := True;
  {$ENDIF}
end;

procedure TControlDevice.btnDisconnectClick(Sender: TObject);
begin
  ShowLog('UnInitialize::PPR_DeviceClose');
  PPR_DeviceClose(PSDMContext);
  btnConnect.Enabled := True;
  btnDisconnect.Enabled := False;
end;

procedure TControlDevice.btnStartClick(Sender: TObject);
var
  nRetVal: Integer;
  nDetectMode: Integer;
  env: ABC_PS_RF_CARD_ENV;
  iMode: Integer;
begin
  {$IFDEF __NOEQUIPMENT__PASSPORT}
  ShowLog('>>>>�����ǵ���TEST::������');
  nRetVal := RP_StartDocDetect(RP_DOC_DETECT_MODE_NOMAL);
  Result := True;
  {$ELSE}
  nRetVal := PPR_DeviceOpen(PSDMContext);
  if nRetVal <> ABC_SUCCESS then
  begin
    ShowLog(Format('>>>>�����ǵ���Open::����[%d]', [PPR_GetLastError(PSDMContext)]));
    Exit;
  end;

  if PPR_RegisterMessageHandle(PSDMContext, Handle, WM_PS_DEVICE) <> ABC_SUCCESS then
  begin
    ShowLog('>>>>�����ǵ���Open::�޼�����Ͻ���');
    Exit;
  end;
  ShowLog('>>�����ǵ���Open::�Ϸ�');

  // 2016-12-29 dyddyd ���ڿ��� ȯ�氪 ����
//  ReadEPassport(0);

  // ���� �ǵ��Ⱑ �����ϰ� �ִٸ� ���� ����
  PPR_ReadDocumentStop(PSDMContext);

  ShowLog('�����ǵ����');

  // �¹��� ī�� ���� �б� ����
  PPR_GetRFCardEnv(PSDMContext, @env);
  iMode := SM_WH + SM_IR + SM_UV + SM_RFCARD;

  nRetVal := PPR_ReadDocument(PSDMContext, READ_AUTO, true, iMode);
  if nRetVal <> ABC_SUCCESS then
  begin
    PPR_ReadDocumentStop(PSDMContext);
    nRetVal := PPR_ReadDocument(PSDMContext, READ_AUTO, true, iMode);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('�����ǵ����::����[%d]', [nRetVal]));
      Exit;
    end;
  end;
  {$ENDIF}
end;

procedure TControlDevice.btnStopClick(Sender: TObject);
begin
  PPR_ReadDocumentStop(PSDMContext);
end;

procedure TControlDevice.GetOpticalData;
var
  nRetVal: Integer;
  strMRZ: string;
begin
  FDocType := DOC_TYPE_NO;
  nRetVal := PPR_GetData(PSDMContext, DT_DOC_TYPE, @FDocType);
  if (nRetVal = ABC_SUCCESS) then
  begin
    case FDocType of
      DOC_TYPE_NO:
        lbDocumentType.Caption := 'No document!!';
      DOC_TYPE_KOR_PASS:
        lbDocumentType.Caption := 'Korean Passport';
      DOC_TYPE_FOREIGN_PASS:
        lbDocumentType.Caption := 'Foreign Passport';
      DOC_TYPE_VISA:
        lbDocumentType.Caption := 'Visa';
      DOC_TYPE_NONE_ICAO:
        lbDocumentType.Caption := 'None ICAO Standard';
      DOC_TYPE_KOR_E_PASS:
        lbDocumentType.Caption := 'Korean e-Passort';
      DOC_TYPE_FOREIGN_E_PASS:
        lbDocumentType.Caption := 'Foreign e-Passport';
      DOC_TYPE_UNKNOWN:
        lbDocumentType.Caption := 'unknown';
    end;
  end;

  if not ((FDocType = DOC_TYPE_KOR_PASS) or (FDocType = DOC_TYPE_FOREIGN_PASS) or
          (FDocType = DOC_TYPE_KOR_E_PASS) or (FDocType = DOC_TYPE_FOREIGN_E_PASS)) then
  begin
    ShowLog('�����ǵ�::����/ī�� �ƴ�...');
    Exit;
  end;

  ShowLog('�����ǵ�::����');
  ZeroMemory(@FMRZData, sizeof(ABC_PS_MRZ));
  nRetVal := PPR_GetData(PSDMContext, DT_MRZ, @FMRZData);
  if (nRetVal = ABC_SUCCESS) then
  begin
    ShowLog(StrPas(FMRZData.mrz1));
    ShowLog(StrPas(FMRZData.mrz3));

    strMRZ := StrPas(FMRZData.mrz1) + StrPas(FMRZData.mrz3);

    // MRZ �νİ���� 88�������� �˻�
    if Length(strMRZ) <> 88 then
    begin
      ShowLog('�����ǵ�::mrz 88�ڸ��� �ƴ�: ' + strMRZ);
      Exit;
    end;

    ZeroMemory(@FMRZAllData, sizeof(ABC_PS_MRZ_DATA));
    nRetVal := PPR_GetData(PSDMContext, DT_MRZ_DATA, @FMRZAllData);

    ShowLog('�����ǵ�::�����ǵ����°˻�');
    if (nRetVal <> ABC_SUCCESS) or (FMRZAllData.DocType[0] = #0) then
    begin
      ShowLog('�����ǵ�::�����ǵ� �ڷ� ����');
      Exit;
    end;

    ShowLog('�����ǵ�::�����ǵ� ����');

    ShowLog('PPR_GetData Success - DT_MRZ');
    ShowLog('-----------------------------------------');
    ShowLog('DocType         : ' + FMRZAllData.DocType);
    ShowLog('IssuingState    : ' + FMRZAllData.IssuingState);
    ShowLog('Name            : ' + FMRZAllData.Name);
    ShowLog('PassportNum     : ' + FMRZAllData.PassportNum);
    ShowLog('PassportNumCD   : ' + FMRZAllData.PassportNumCD);
    ShowLog('PassportNumCDR  : ' + FMRZAllData.PassportNumCDR);
    ShowLog('Nationality     : ' + FMRZAllData.Nationality);
    ShowLog('Birth           : ' + FMRZAllData.Birth);
    ShowLog('BirthCD         : ' + FMRZAllData.BirthCD);
    ShowLog('BirthCDR        : ' + FMRZAllData.BirthCDR);
    ShowLog('Sex             : ' + FMRZAllData.Sex);
    ShowLog('Expiry          : ' + FMRZAllData.Expiry);
    ShowLog('ExpiryCD        : ' + FMRZAllData.ExpiryCD);
    ShowLog('ExpiryCDR       : ' + FMRZAllData.ExpiryCDR);
    ShowLog('Optional        : ' + FMRZAllData.Optional);
    ShowLog('OptionalCD      : ' + FMRZAllData.OptionalCD);
    ShowLog('OptionalCDR     : ' + FMRZAllData.OptionalCDR);
    ShowLog('CompositeCD     : ' + FMRZAllData.CompositeCD);
    ShowLog('CompositeCDR    : ' + FMRZAllData.CompositeCDR);
    ShowLog('-----------------------------------------');

    edtDocType.Text := FMRZAllData.DocType;
    edtIssueCountry.Text := FMRZAllData.IssuingState;
    edtName.Text := FMRZAllData.Name;
    edtDocNo.Text := FMRZAllData.PassportNum;
    edtBirth.Text := FMRZAllData.Birth;
    edtExpiry.Text := FMRZAllData.Expiry;
    edtSex.Text := FMRZAllData.Sex;
    edtNationality.Text := FMRZAllData.Nationality;
    edtDocNoCD.Text := FMRZAllData.PassportNumCD;
    edtDocNoCDR.Text := FMRZAllData.PassportNumCDR;
    edtBirthCD.Text := FMRZAllData.BirthCD;
    edtBirthCDR.Text := FMRZAllData.BirthCDR;
    edtExpiryCD.Text := FMRZAllData.ExpiryCD;
    edtExpiryCDR.Text := FMRZAllData.ExpiryCDR;
    edtOptionalCD.Text := FMRZAllData.OptionalCD;
    edtOptionalCDR.Text := FMRZAllData.OptionalCDR;
    edtComCD.Text := FMRZAllData.CompositeCD;
    edtComCDR.Text := FMRZAllData.CompositeCDR;
  end;

  GetMRP_Photo;
end;

procedure TControlDevice.ShowImage(image: TImage; data: ABC_IMAGE);
var
  mem: TMemoryStream;
  jpg: TJPEGImage;
begin
  if data.info.iSize = 0 then
    Exit;

  mem := TMemoryStream.Create;
  mem.Write(data.data^, data.info.iSize);
  mem.Position := 0;

  if data.info.iImageType = Integer(IT_BITMAP) then
    image.Picture.Bitmap.LoadFromStream(mem)
  else if data.info.iImageType = Integer(IT_JPG) then
  begin
    jpg := TJPEGImage.Create;
    jpg.LoadFromStream(mem);
    image.Picture.Assign(jpg);
    jpg.Free;
  end
  else
  begin
    image.Picture.LoadFromStream(mem);
  end;

  mem.Clear;
  mem.Free;
end;

function TControlDevice.GetMRP_Photo: Integer;
begin
  if FMRPFaceImg.info.iSize > 0 then
    PPR_FreeImage(@FMRPFaceImg);

  if PPR_GetImage(PSDMContext, PIT_VZ_PHOTO, @FMRPFaceImg) <> ABC_SUCCESS then
  begin
    ShowLog('PPR_GetImage Fail... - GetMRP_Photo');
    Result := 0;
  end
  else
  begin
    ShowLog('PPR_GetImage Success - PIT_VZ_PHOTO');
    ShowImage(imgPhoto, FMRPFaceImg);
    // 2017-01-20 dyddyd ǥ��ȭ �����Կ����� ���⿡ �����̹��� ����
    Result := 1;
  end;
end;
{Passport Control}

{Fingerprint Scanner Control}
procedure TControlDevice.btnFACloseClick(Sender: TObject);
begin
  ShowLog('UnInitialize::FNA_Close');
  FNA_Close(FNAMContext);
  btnFAOpen.Enabled := True;
  btnFAClose.Enabled := False;
end;

procedure TControlDevice.btnFAOpenClick(Sender: TObject);
var
  info: ABC_ALG_INFO;
  src: AnsiString;
begin
  ShowLog('>>�����˰���Open');

  {$IFDEF __NOEQUIPMENT__FINGER}// 2016-10-19 dyddyd
  ShowLog('>>>>�����˰���TEST::������');
  Result := True;
  Exit;
  {$ENDIF}

  if FNA_InitSDK <> ABC_SUCCESS then
  begin
    ShowLog(Format('>>>>�����˰����ʱ�ȭ::����[%s]', [FNA_ErrorToDescription(nil, FNA_GetLastError(nil))]));
    Exit;
  end;

  if FNA_GetAlgorithms(@info) <> ABC_SUCCESS then
  begin
    ShowLog('>>>>�����˰����ʱ�ȭ::�˻�����');
  end
  else
  begin
    if info.algorithm_count > 0 then
    begin
      ShowLog(Format('>>>>�����˰����ʱ�ȭ::�˰��򰹼�=%d', [info.algorithm_count]));
      src := info.algorithm_name[0];
      if FNA_CreateContext(@FNAMContext, PAnsiChar(src)) <> ABC_SUCCESS then
      begin
        ShowLog(Format('>>>>�����˰����ʱ�ȭ::����[%s]', [FNA_ErrorToDescription(nil, FNA_GetLastError(nil))]));
      end;
    end
    else
    begin
      ShowLog('>>>>�����˰����ʱ�ȭ::�˰������');
    end;
  end;

  if FNA_Open(FNAMContext) <> ABC_SUCCESS then
  begin
    ShowLog(Format('>>>>�����˰���Open::����[%d]', [FNS_GetLastError(FNAMContext)]));
    Exit;
  end;
  ShowLog('>>�����˰���Open::�Ϸ�');

  btnFAOpen.Enabled := False;
  btnFAClose.Enabled := True;
end;

procedure TControlDevice.btnFingerDeviceCloseClick(Sender: TObject);
begin
  ShowLog('UnInitialize::FNS_DeviceClose');
  FNS_DeviceClose(FNDMContext);
  btnFingerDeviceOpen.Enabled := True;
  btnFingerDeviceClose.Enabled := False;
end;

procedure TControlDevice.btnFingerDeviceOpenClick(Sender: TObject);
var
  info: ABC_DEVICE_INFO;
  src: AnsiString;
  nRetVal: Integer;
begin
  ShowLog('>>������ĳ��Open');

  {$IFDEF __NOEQUIPMENT__FINGER}
  ShowLog('>>>>������ĳ��TEST::������');
  Exit;
  {$ENDIF}

  nRetVal := FNS_InitSDK;
  if nRetVal <> ABC_SUCCESS then
  begin
    ShowLog(Format('>>>>������ĳ���ʱ�ȭ::����[%s]', [FNS_ErrorToDescription(nil, FNS_GetLastError(nil))]));
    Exit;
  end;

  if FNS_GetDeviceSource(@info) <> ABC_SUCCESS then
  begin
    ShowLog('>>>>������ĳ���ʱ�ȭ::�˻�����');
  end
  else
  begin
    if info.iDeviceCount > 0 then
    begin
      ShowLog(Format('>>>>������ĳ���ʱ�ȭ::��񰹼�=%d', [info.iDeviceCount]));
      src := info.strDeviceName[0];
      if FNS_CreateContext(@FNDMContext, PAnsiChar(src)) <> ABC_SUCCESS then
      begin
        ShowLog(Format('>>>>������ĳ���ʱ�ȭ::����[%s]', [FNS_ErrorToDescription(nil, FNS_GetLastError(nil))]));
      end;
    end
    else
    begin
      ShowLog('>>>>������ĳ���ʱ�ȭ::������');
    end;
  end;

  FNS_Cancel(FNDMContext);

  if FNS_RegisterMessageHandle(FNDMContext, Handle, WM_FN_DEVICE) <> ABC_SUCCESS then
  begin
    ShowLog('>>>>������ĳ��Open::�޼�����Ͻ���');
    Exit;
  end;

  if FNS_DeviceOpen(FNDMContext) <> ABC_SUCCESS then
  begin
    ShowLog(Format('>>>>������ĳ��Open::����[%d]', [FNS_GetLastError(FNDMContext)]));
    Exit;
  end;
  ShowLog('>>������ĳ��Open::�Ϸ�');
  btnFingerDeviceOpen.Enabled := False;
  btnFingerDeviceClose.Enabled := True;
end;

procedure TControlDevice.btnCaptureLeftFingerClick(Sender: TObject);
begin
  btnCaptureLeftFinger.Tag := 1;
  btnCaptureRightFinger.Tag := 0;
  TakeFingerprint;
end;

procedure TControlDevice.btnCaptureRightFingerClick(Sender: TObject);
begin
  btnCaptureLeftFinger.Tag := 0;
  btnCaptureRightFinger.Tag := 1;
  TakeFingerprint;
end;

procedure TControlDevice.TakeFingerprint;
begin
  {$IFNDEF __NOEQUIPMENT__FINGER}
  // ���� ��� ���̶��, �ϴ� ���� ��������...
  FNS_Cancel(FNDMContext);
  if FNS_Capture(FNDMContext, Integer(CT_PLANE_ONE), 15000) <> ABC_SUCCESS then
  begin
    ShowLog(Format('��������û::����[%s]', [FNS_ErrorToDescription(FNDMContext, FNS_GetLastError(FNDMContext))]));
    Exit;
  end;
  {$ENDIF}
end;

procedure TControlDevice.MatchFingerprint;
var
  image: ABC_FN_IMAGE;
  imageFinger: ABC_IMAGE;
  fetSrc: ABC_FEATURE;
  iQuality: Integer;
  nRetVal: Integer;
begin
  ZeroMemory(@fetSrc.info, SizeOf(ABC_FEATURE_INFO));
  fetSrc.data := Nil;

  ShowLog('�����ν�::����');

  nRetVal := FNS_GetCapturedImage(FNDMContext, @image);
  if nRetVal <> ABC_SUCCESS then
  begin
    ShowLog('�����ν�::��濵��ȹ��::����');
//      RetryTakeFingerprint(0, 0, nil);
    Exit;
  end;
  ShowLog('�����ν�::image :' + inttostr(SizeOf(image)));
  ShowLog('�����ν�::��濵��ȹ��::����');
  FNS_ConvertRawToBMP(@(image.segimages), @imageFinger);

  if btnCaptureLeftFinger.Tag = 1 then
  begin
    FNS_ConvertRawToBMP(@(image.segimages), @FLFingerImg);
    ShowImage(imgLeftFinger, FLFingerImg);

    // ���� ���� �˻�
//    if image.spoof^ > g_iFingerSpoof then
//    begin
//      FNS_FreeFingerImage(@image);
//      ShowLog(Format('�����ν�::�������α��������ʰ�::��������[%d]::SPOOF[%d]::�����', [g_iFingerSpoof, image.spoof^]));
//  //      RetryTakeFingerprint(0, 0, nil);
//      Exit;
//    end;

    if FNA_Extract(FNAMContext, @FLFingerImg, 0) <> ABC_SUCCESS then
    begin
      FNS_FreeFingerImage(@image);
      FNS_FreeFingerImage(@FLFingerImg);
      ShowLog('�����ν�::Ư¡������::����');
      Exit;
    end;
    ShowLog('�����ν�::Ư¡������::����');
  end;

  if btnCaptureRightFinger.Tag = 1 then
  begin
    FNS_ConvertRawToBMP(@(image.segimages), @FRFingerImg);
    ShowImage(imgRightFinger, FRFingerImg);

    // ���� ���� �˻�
//    if image.spoof^ > g_iFingerSpoof then
//    begin
//      FNS_FreeFingerImage(@image);
//      ShowLog(Format('�����ν�::�������α��������ʰ�::��������[%d]::SPOOF[%d]::�����', [g_iFingerSpoof, image.spoof^]));
//  //      RetryTakeFingerprint(0, 0, nil);
//      Exit;
//    end;

    if FNA_Extract(FNAMContext, @FRFingerImg, 0) <> ABC_SUCCESS then
    begin
      FNS_FreeFingerImage(@image);
      FNS_FreeFingerImage(@FRFingerImg);
      ShowLog('�����ν�::Ư¡������::����');
      Exit;
    end;
    ShowLog('�����ν�::Ư¡������::����');
  end;

  WaitSleep(100);
  // ǰ���˻� �� ǰ���� �������� �� ��� ����
  FNA_GetQuality(FNAMContext, @iQuality);
  if iQuality < 50 then
  begin
    FNS_FreeFingerImage(@image);
    FNS_FreeFingerImage(@FLFingerImg);
    FNS_FreeFingerImage(@FRFingerImg);
    ShowLog('�����ν�::����ǰ�� ���� �̴�::�����');
    Exit;
  end;

  if FNA_GetFeature(FNAMContext, @fetSrc) <> ABC_SUCCESS then
  begin
    FNS_FreeFingerImage(@image);
    FNS_FreeFingerImage(@FLFingerImg);
    FNS_FreeFingerImage(@FRFingerImg);
    ShowLog('�����ν�::���Ư¡��ȹ��::����');
    FNA_FreeFeature(@fetSrc);
    Exit;
  end;

  if btnCaptureLeftFinger.Tag = 1 then
  begin
    FLFingerQuality := iQuality;
    FillChar(FLFingerFeature, SizeOf(FLFingerFeature), #0);
    PByteToCharArray(PByteArray(fetSrc.data), fetSrc.info.iSize, @FLFingerFeature);
  end;
  if btnCaptureRightFinger.Tag = 1 then
  begin
    FRFingerQuality := iQuality;
    FillChar(FRFingerFeature, SizeOf(FRFingerFeature), #0);
    PByteToCharArray(PByteArray(fetSrc.data), fetSrc.info.iSize, @FRFingerFeature);
  end;
end;

{Fingerprint Scanner Control}

procedure TControlDevice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TControlDevice.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := CloseState;
end;

procedure TControlDevice.FormCreate(Sender: TObject);
begin
  ClearWindow();
  imgPhoto.Align := alClient;
  imgIR.Align := alClient;
  imgWH.Align := alClient;
  imgUV.Align := alClient;
  imgLeftFinger.Align := alClient;
  imgRightFinger.Align := alClient;
//  imgCameraTest.Align := alClient;

  btnDisconnect.Enabled := False;
  btnFingerDeviceClose.Enabled := False;
  btnFAClose.Enabled := False;

  btnConnect.Click;
  btnFingerDeviceOpen.Click;
  btnFAOpen.Click;
//  btnCameraOpen.Click;
end;

procedure TControlDevice.PageAnimationFinish(Sender: TObject);
begin
  CloseState := True;
end;

procedure TControlDevice.seToolBarEx1Change(Sender: TObject);
begin
  if (SlideAnimation.State = asExecuting) or (SlideBackAnimation.State = asExecuting) then
    WaitSleep(200);

  if sePageViewer2.PageIndex = seToolBarEx1.ItemIndex then
    Exit;
  if sePageViewer2.PageIndex > seToolBarEx1.ItemIndex then
    sePageViewer2.Animation := SlideAnimation;
  if sePageViewer2.PageIndex < seToolBarEx1.ItemIndex then
    sePageViewer2.Animation := SlideBackAnimation;

  sePageViewer2.PageIndex := seToolBarEx1.ItemIndex;
end;

procedure TControlDevice.seToolBarEx1PrepareAnimation(Sender: TObject);
begin
  CloseState := False;
end;

procedure TControlDevice.ClearWindow;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].ClassType = TEdit then
    begin
      TEdit(Components[i]).Text := '';
    end
    else if Components[i].ClassType = TImage then
    begin
      TImage(Components[i]).Picture := nil;
      TImage(Components[i]).Tag := 0;
    end
    else if Components[i].ClassType = TStatusBar then
    begin
      TStatusBar(Components[i]).Panels[0].Text := '';
    end
    else if Components[i].ClassType = TButton then
    begin
//      if Pos('Save', TButton(Components[i]).Name) > 0 then
        TButton(Components[i]).Enabled := True;
        TButton(Components[i]).Tag := 0;
    end;
  end;

//  dxCameraControl1.Active := False;
  sePageViewer2.ActivePage := pagCD_Passport;
end;

procedure TControlDevice.ShowLog(strMsg: string);
begin
  Main.lblStatusText.Caption := strMsg;
end;

end.

