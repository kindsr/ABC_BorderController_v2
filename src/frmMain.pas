{*******************************************************}
{                                                       }
{                BorderController                       }
{                                                       }
{           Copyright (C) 2018 G-An Tech.               }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}
unit frmMain;

interface

uses
  Windows, Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, scControls, scModernControls, scGPControls,
  scAdvancedControls, Vcl.Mask, scExtControls, scGPExtControls, scStyledForm,
  scStyleManager, System.StrUtils, scGPPagers, scGPVertPagers, scGPImages,
  scGPMeters, acPNG, Vcl.ComCtrls, se_controls, se_form, se_effect, se_ani,
  scImageCollection, se_pngimagelist, uConst, uFunction, uService,
  ABC_PS_DM, ABC_FN_DM, ABC_FC_DM, ABC_DC_DM, WUpdate, System.Win.Registry;

type
  TMain = class(TForm)
    ActionList1: TActionList;
    actInitialize: TAction;
    imlIcons: TImageList;
    SV: TscSplitView;
    btnPersonInfo: TscButton;
    btnExit: TscButton;
    btnOption: TscButton;
    btnControlDevice: TscButton;
    btnProcessing: TscButton;
    pnlBackground: TscGPPanel;
    pnlTitle: TscGPPanel;
    CloseButton: TscGPGlyphButton;
    MinButton: TscGPGlyphButton;
    labelTitle: TscLabel;
    scGPGlyphButton4: TscGPGlyphButton;
    MaxButton: TscGPGlyphButton;
    btnDetail: TscGPGlyphButton;
    svOption: TscSplitView;
    scLabel5: TscLabel;
    scScrollBox1: TscScrollBox;
    scListGroupPanel1: TscListGroupPanel;
    scLabel6: TscLabel;
    scLabel9: TscLabel;
    swiOverlayMode: TscGPSwitch;
    swiAnimation: TscGPSwitch;
    scListGroupPanel3: TscListGroupPanel;
    scLabel12: TscLabel;
    scLabel17: TscLabel;
    scPasswordEdit1: TscPasswordEdit;
    scEdit2: TscEdit;
    scListGroupPanel4: TscListGroupPanel;
    scLabel18: TscLabel;
    cbxMaximize: TscCheckBox;
    cbxSizeBox: TscCheckBox;
    pnlStatusBar: TscGPPanel;
    scGPTrackBar1: TscGPTrackBar;
    scGPGlyphButton10: TscGPGlyphButton;
    scGPGlyphButton11: TscGPGlyphButton;
    scGPSizeBox1: TscGPSizeBox;
    lblStatusText: TscLabel;
    scStyleManager1: TscStyleManager;
    scStyledForm1: TscStyledForm;
    btnInit: TscButton;
    cbxSkin: TscComboBox;
    btnSaveConfig: TscGPGlyphButton;
    scLabel1: TscLabel;
    swiCloseMode: TscGPSwitch;
    pnlSubForm: TscGPPanel;
    actPersonInfo: TAction;
    actProcessing: TAction;
    actControlDevice: TAction;
    pgBar: TscGPProgressBar;
    cbxStayOnTop: TscCheckBox;
    seAnimationForm1: TseAnimationForm;
    sePageViewer1: TsePageViewer;
    seAnimationList1: TseAnimationList;
    PageAnimation: TseAnimation;
    FormShowAnimation: TseAnimation;
    pagPersonInfo: TsePageViewerPage;
    pagProcessing: TsePageViewerPage;
    pagControlDevices: TsePageViewerPage;
    scGPImageCollection1: TscGPImageCollection;
    abc2P: TscGPImage;
    abcCamera: TscGPImage;
    abcDetecting: TscActivityIndicator;
    abcFinger: TscGPImage;
    abcIndicator: TscGPGlyphButton;
    abcPassport: TscGPImage;
    abcReading: TscActivityIndicator;
    abcScanning: TscActivityIndicator;
    abcTaking: TscActivityIndicator;
    imgSensors: TImage;
    lblSensor1: TscGPLabel;
    lblSensor11: TscGPLabel;
    lblSensor12: TscGPLabel;
    lblSensor2: TscGPLabel;
    lblSensor21: TscGPLabel;
    lblSensor22: TscGPLabel;
    lblSensor31: TscGPLabel;
    lblSensor32: TscGPLabel;
    lblSensor41: TscGPLabel;
    lblSensor42: TscGPLabel;
    lblSensor51: TscGPLabel;
    lblSensor52: TscGPLabel;
    lblSensor61: TscGPLabel;
    lblSensor62: TscGPLabel;
    lblSensor71: TscGPLabel;
    lblSensor72: TscGPLabel;
    lblSensor81: TscGPLabel;
    lblSensor82: TscGPLabel;
    tmrCheckIdle: TTimer;
    Panel1: TPanel;
    img2P: TImage;
    imgCurPhoto: TImage;
    imgEPhoto: TImage;
    imgFinger: TImage;
    imgPhoto: TImage;
    imgRegPhoto: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblBirthDay: TLabel;
    lblDocNumber: TLabel;
    lblExpiryDate: TLabel;
    lblIssueCountry: TLabel;
    lblName: TLabel;
    lblNationality: TLabel;
    lblPersonalData: TLabel;
    lblSex: TLabel;
    lblType: TLabel;
    Shape1: TShape;
    Panel2: TPanel;
    mmMessage: TMemo;
    mmLog: TMemo;
    Label1: TLabel;
    scLabel2: TscLabel;
    swiShowFlash: TscGPSwitch;
    Button1: TButton;
    procedure btnDetailClick(Sender: TObject);
    procedure cbxSkinChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure MaxButtonClick(Sender: TObject);
    procedure MinButtonClick(Sender: TObject);
    procedure OptionClick(Sender: TObject);
    procedure swiOverlayModeChangeState(Sender: TObject);
    procedure swiAnimationChangeState(Sender: TObject);
    procedure cbxSizeBoxClick(Sender: TObject);
    procedure cbxMaximizeClick(Sender: TObject);
    procedure labelTitleDblClick(Sender: TObject);
    procedure labelTitleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure labelTitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure labelTitleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSaveConfigClick(Sender: TObject);
    procedure swiCloseModeChangeState(Sender: TObject);
    procedure actInitializeExecute(Sender: TObject);
    procedure actPersonInfoExecute(Sender: TObject);
    procedure actProcessingExecute(Sender: TObject);
    procedure cbxStayOnTopClick(Sender: TObject);
    procedure actControlDeviceExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrCheckIdleTimer(Sender: TObject);
    procedure swiShowFlashChangeState(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FOldBoundsRect: TRect;
    FMaximized: Boolean;
    FDown: Boolean;
    FDownP: TPoint;
    ////////////////////////////////////////////////////////////////////////////
    FLastInputInfo: TLastInputInfo;
    FisCursorHide : Boolean;
    ////////////////////////////////////////////////////////////////////////////
    procedure ShowSubForm(ASubForm: TForm);
    ////////////////////////////////////////////////////////////////////////////
    procedure HideMouseCursor;
    procedure ShowMouseCursor;
    { Private declarations }
  protected
    procedure WndProc(var Msg: TMessage); override;
  public
    procedure DoMaximize;
    procedure DoRestore;
    procedure DoSizeCheck;
    ////////////////////////////////////////////////////////////////////////////
    procedure ClearComponents(caArea: TClearArea);
    procedure ShowLog(strMsg: string);
    procedure ShowMsgLog(strMsg: string);
    procedure Processing(paNow: TProcessABC);
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses
  Vcl.Themes, uVersionInfo, frmControlDevice, PaxInfo, uViewModel, frmDisplayFlash;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
///  Begin of Templete Form Event
////////////////////////////////////////////////////////////////////////////////

procedure TMain.actInitializeExecute(Sender: TObject);
var
  i: Integer;
  filepath: string;
begin
  if PageAnimation.State = asExecuting then
    WaitSleep(200);

  FCC_StopPreVerify();
  FNS_Cancel(FNDMContext);
  SetCheckSensor(sePageViewer1.ActivePage = pagProcessing);
  InitializeClick;
end;

procedure TMain.actProcessingExecute(Sender: TObject);
begin
  if PageAnimation.State = asExecuting then
    WaitSleep(200);

  if Assigned(ControlDevice) then
  begin
    ControlDevice.Close;
    FreeAndNil(ControlDevice);
  end;
  sePageViewer1.ActivePage := pagProcessing;
  SetCheckSensor(sePageViewer1.ActivePage = pagProcessing);
  if not FRunMode then SetModeRun;
end;

procedure TMain.actPersonInfoExecute(Sender: TObject);
begin
  if PageAnimation.State = asExecuting then
    WaitSleep(200);

  if Assigned(ControlDevice) then
  begin
    ControlDevice.Close;
    FreeAndNil(ControlDevice);
  end;
  sePageViewer1.ActivePage := pagPersonInfo;
  SetCheckSensor(sePageViewer1.ActivePage = pagProcessing);
  if not FRunMode then SetModeRun;
end;

procedure TMain.actControlDeviceExecute(Sender: TObject);
begin
  if PageAnimation.State = asExecuting then
    WaitSleep(200);

  // ControlDevice Form Create
  ControlDevice := TControlDevice.Create(pagControlDevices);
  ShowSubForm(ControlDevice);
  sePageViewer1.ActivePage := pagControlDevices;
  SetCheckSensor(sePageViewer1.ActivePage = pagProcessing);
  SetModeStop;
end;

procedure TMain.btnDetailClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure TMain.btnSaveConfigClick(Sender: TObject);
var
  ConfigInfo: TConfigInfo;
begin
  // SaveConfig
  ConfigInfo.OverlayMode := swiOverlayMode.IsOn;
  ConfigInfo.Animation := swiAnimation.IsOn;
  ConfigInfo.CompactWidth := StrToInt(IfThen(swiCloseMode.IsOn, '50', '0'));
  ConfigInfo.SkinComboIndex := cbxSkin.ItemIndex;
  ConfigInfo.Maximize := cbxMaximize.Checked;
  ConfigInfo.Sizable := cbxSizeBox.Checked;
  ConfigInfo.StayOnTop := cbxStayOnTop.Checked;
  ConfigInfo.ShowFlash := swiShowFlash.IsOn;
  SaveConfig(ChangeFileExt(Application.ExeName, '.ini'), ConfigInfo);
end;

procedure TMain.Button1Click(Sender: TObject);
var
  nRetVal : Integer;
  iRst: Integer;
  probe : ABC_IMAGE;
  faceinfo: ABC_DETECT_RESULT;
begin
  //nRetVal := FCC_2PStart;
  nRetVal := FCC_Get2PResult(@iRst, @probe, @faceinfo);

  if nRetVal = ABC_SUCCESS then
  begin
    ShowImage(Main.img2P, probe);
    // 2인감지 결과 저장
    // 결과변수해제
  end;
end;

procedure TMain.cbxMaximizeClick(Sender: TObject);
begin
  MaxButton.Left := CloseButton.Left;
  MaxButton.Visible := cbxMaximize.Checked;
end;

procedure TMain.cbxSizeBoxClick(Sender: TObject);
begin
  scGPSizeBox1.Visible := cbxSizeBox.Checked;
  DoSizeCheck;
end;

procedure TMain.cbxSkinChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbxSkin.Items[cbxSkin.ItemIndex]);
end;

procedure TMain.DoMaximize;
begin
  FOldBoundsRect := BoundsRect;
  BoundsRect := scStyledForm1.GetMaximizeBounds;
  FMaximized := True;
  MaxButton.GlyphOptions.Kind := scgpbgkRestore;
  scGPSizeBox1.Visible := False;
end;

procedure TMain.DoRestore;
begin
  BoundsRect := FOldBoundsRect;
  FMaximized := False;
  labelTitle.DragForm := True;
  MaxButton.GlyphOptions.Kind := scgpbgkMaximize;
  scGPSizeBox1.Visible := cbxSizeBox.Checked;
end;

procedure TMain.DoSizeCheck;
begin
  if cbxSizeBox.Checked then
  begin
    Main.Constraints.MinWidth := Round(800 * scStyledForm1.ScaleFactor);
    Main.Constraints.MinHeight := Round(450 * scStyledForm1.ScaleFactor);
    scGPSizeBox1.Left := pgBar.Left + pgBar.Width + 1;
  end
  else
  begin
    Main.Constraints.MinWidth := 0;
    Main.Constraints.MinHeight := 0;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.FormActivate                                             //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.25                                                     //
//  Arguments: Sender: TObject                                                //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.FormActivate(Sender: TObject);
begin
  if Tag = 1 then Exit;
  Tag := 1;

//  FormInit;
  // 메모리 변수 초기화
  ZeroMemory(@FRegFace.info, SizeOf(ABC_IMAGE_INFO));
  ZeroMemory(@FRegFaceBMP.info, SizeOf(ABC_IMAGE_INFO));
  ZeroMemory(@FRegFinger1.info, SizeOf(ABC_FEATURE_INFO));
  ZeroMemory(@FRegFinger2.info, SizeOf(ABC_FEATURE_INFO));

  ViewModel.LoadConfig;
  ViewModel.SetBtnCloseClick(False);

  ShowLog('=================================');
  ShowLog('  BorderController::Start');
  ShowLog('=================================');

  // Connect to Server
  try
    if GetSvrData_DateTime <> ABC_SUCCESS then
    begin
      ShowLog('Fail to Connect to DB Server!');
      Application.MessageBox('Border Controller DB접속 중 오류가 발생했습니다.' + sLineBreak + '오류 메세지를 확인 후 재 시작하세요', '초기화 오류', MB_OK + MB_ICONSTOP);
      Application.Terminate;
      Exit;
    end;
  except
    ShowMessage('Fail to Connect to DB Server!');
  end;

  // Init SDK
  if not InitSDK then
  begin
    ShowLog('Fail to initialize SDK!');
    Application.MessageBox('Border Controller 초기화 중 오류가 발생했습니다.' + sLineBreak + '오류 메세지를 확인 후 재 시작하세요', '초기화 오류', MB_OK + MB_ICONSTOP);
    Application.Terminate;
    Exit;
  end;

  InitializeClick;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.FormClose                                                //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.06                                                     //
//  Arguments: Sender: TObject; var Action: TCloseAction                      //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  uViewModel.FormClose;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.FormCloseQuery                                           //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.10.24                                                     //
//  Arguments: Sender: TObject; var CanClose: Boolean                         //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  uViewModel.FormCloseQuery;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  ConfigInfo: TConfigInfo;
begin
  Left := 0;
  Top := 400;

  labelTitle.Caption := labelTitle.Caption + ' :: ' + fnGetVersionInfo(tvFileVersion);
  // Load Config
  uFunction.LoadConfig(ChangeFileExt(Application.ExeName, '.ini'), ConfigInfo);

  cbxSkin.Items.Clear;
  cbxSkin.Items.AddStrings(TStyleManager.StyleNames);

  with ConfigInfo do
  begin
    if OverlayMode then
      swiOverlayMode.State := scswOn
    else
      swiOverlayMode.State := scswOff;
    if Animation then
      swiAnimation.State := scswOn
    else
      swiAnimation.State := scswOff;
    cbxStayOnTop.Checked := ConfigInfo.StayOnTop;
    cbxMaximize.Checked := ConfigInfo.Maximize;
    cbxSizeBox.Checked := ConfigInfo.Sizable;
    if ConfigInfo.SkinComboIndex <> -1 then
      cbxSkin.ItemIndex := ConfigInfo.SkinComboIndex
    else
      cbxSkin.ItemIndex := cbxSkin.Items.IndexOf(TStyleManager.ActiveStyle.Name);
    SV.CompactWidth := ConfigInfo.CompactWidth;
    if SV.CompactWidth > 0 then
      swiCloseMode.State := scswOn
    else
      swiCloseMode.State := scswOff;
    if ShowFlash then
      swiShowFlash.State := scswOn
    else
      swiShowFlash.State := scswOff;
    SV.Opened := False;
  end;
  TStyleManager.SetStyle(cbxSkin.Items[cbxSkin.ItemIndex]);

  sePageViewer1.ActivePage := pagPersonInfo;
  SV.Enabled := True;
end;

procedure TMain.labelTitleDblClick(Sender: TObject);
begin
  if not cbxMaximize.Checked then
    Exit;

  if FMaximized then
    DoRestore
  else
    DoMaximize;
end;

procedure TMain.labelTitleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and not (ssDouble in Shift) and FMaximized then
  begin
    GetCursorPos(FDownP);
    FDown := True;
  end;
end;

procedure TMain.labelTitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
  W, H, L, T: Integer;
begin
  if FMaximized and FDown then
  begin
    GetCursorPos(P);
    W := FOldBoundsRect.Width;
    H := FOldBoundsRect.Height;
    L := Round(W * (P.X - Left) / Width);
    T := P.Y - Top;
    FOldBoundsRect.Left := P.X - L;
    FOldBoundsRect.Top := P.Y - T;
    FOldBoundsRect.Right := FOldBoundsRect.Left + W;
    FOldBoundsRect.Height := FOldBoundsRect.Top + H;
    DoRestore;
  end;
end;

procedure TMain.labelTitleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDown := False;
end;

procedure TMain.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMain.MaxButtonClick(Sender: TObject);
begin
  if not cbxMaximize.Checked then
    Exit;

  if FMaximized then
    DoRestore
  else
    DoMaximize;
end;

procedure TMain.MinButtonClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TMain.OptionClick(Sender: TObject);
begin
  svOption.Opened := not svOption.Opened;
end;

procedure TMain.cbxStayOnTopClick(Sender: TObject);
begin
  if cbxStayOnTop.Checked then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;

procedure TMain.swiAnimationChangeState(Sender: TObject);
begin
  SV.Animation := swiAnimation.IsOn;
  svOption.Animation := swiAnimation.IsOn;
end;

procedure TMain.swiCloseModeChangeState(Sender: TObject);
begin
  SV.CompactWidth := StrToInt(IfThen(swiCloseMode.IsOn, '50', '0'));
end;

procedure TMain.swiOverlayModeChangeState(Sender: TObject);
begin
  if SV.DisplayMode = scsvmDocked then
    SV.DisplayMode := scsvmOverlay
  else
    SV.DisplayMode := scsvmDocked;
end;

procedure TMain.swiShowFlashChangeState(Sender: TObject);
begin
  if Assigned(DisplayFlash) then
  begin
    DisplayFlash.Visible := swiShowFlash.IsOn;
    if not DisplayFlash.Visible then
      DisplayFlash.Tag := 0;
  end;
end;

procedure TMain.ShowSubForm(ASubForm: TForm);
begin
  // SubForm AllFileProc
  ASubForm.Parent := pagControlDevices;
  ASubForm.Left := 0;
  ASubForm.Top := 0;

  if Main.Constraints.MinWidth >= ASubForm.Width + SV.Width + svOption.Width + 2 then
    ClientWidth := Main.Constraints.MinWidth
  else
    ClientWidth := ASubForm.Width + SV.Width + svOption.Width + 2;

  if Main.Constraints.MinHeight >= ASubForm.Height + pnlTitle.Height + pnlStatusBar.Height + 2 then
    ClientHeight := Main.Constraints.MinHeight
  else
    ClientHeight := ASubForm.Height + pnlTitle.Height + pnlStatusBar.Height + 2;

  ASubForm.Show;

  DoSizeCheck;
  if not pnlSubForm.Visible then
    pnlSubForm.Visible := True;
end;

////////////////////////////////////////////////////////////////////////////////
///  End of Templete Form Event
////////////////////////////////////////////////////////////////////////////////

procedure TMain.WMCopyData(var Msg: TWMCopyData);
var
  ms: TMemoryStream;
  pMyData: CopyDataStruct;
begin
  if ViewModel.BtnCloseClick then Exit;

  pMyData := Msg.CopyDataStruct^;
  case pMyData.dwData of
    1:
      begin
        if not NOEQUIPMENT_2PERSON_VALUE then
        begin
          if not FCheck2P then
            Exit;
          if ViewModel.Detect2Person then
            Exit;
          SetModeStop;
          Windows.Beep(6300, 2000);
          FCC_2PStop;

          ShowMsgLog('2인감지결과 수신::2인');
          Processing(pa2PFail);
          // 이미 2인감지인데 메시지 수신시 넘김

          ViewModel.Detect2Person := True;
          SetFlash(fsMain, FlashRec[57].filename);
          WaitSleep(3000);
          SetFlash(fsSub, FlashRec[52].filename);
          PlaySound('032');
//          ViewModel.SetCurrentStep(0);

          // 장비 동작 중지
          FNS_Cancel(FNDMContext);
        end;
      end;
    2:
      begin
        if not FCheckInside then
          Exit;
        if ViewModel.Detect2Person then
          Exit;

        ShowLog('출구문닫힘::짐감지::관리자호출');
        ViewModel.Detect2Person := True;
        SetFlash(fsMain, FlashRec[52].filename);
        SetFlash(fsSub, FlashRec[52].filename);
        PlaySound('032');
//          ViewModel.SetCurrentStep(0);
        PPR_ReadDocumentStop(PSDMContext);
        if not NOEQUIPMENT_RFCARD_VALUE then
          RFC_ReadStop;
      end;
  end;

  ms := TMemoryStream.Create;
  try
    ms.Write(pMyData.lpData^, pMyData.cbData);
    ms.Position := 0;
    GetResult2P(ms);
  finally
    ms.Free;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.WndProc                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: var Msg: TMessage                                              //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.WndProc(var Msg: TMessage);
begin
  if ViewModel.BtnCloseClick then Exit;

  case Msg.Msg of
    // 여권판독기 메시지
    WM_PS_DEVICE:
      begin
        case PS_DEV_MSSG_WPARAM_DEFINE(Msg.WParam) of
          WP_PS_ERROR:
            begin
              LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
              InsertImmigrationLogs('12');
              Processing(paPassportFail);
              case Msg.LParam of
                0:
                  begin
                    ShowMsgLog('WM_PS_DEVICE : WP_PS_ERROR  여권');
                    if not NOEQUIPMENT_RFCARD_VALUE then
                      RFC_Read; // RF Card Read
                  end;
                1:
                  begin
                    ShowMsgLog('WM_PS_DEVICE : WP_PS_ERROR 승무원카드');
                    // 2016-12-14 dyddyd 실패시 계속 오픈호출
                    PPR_ReadDocument(PSDMContext, READ_AUTO, true);
                  end;
              end;

//              GetDeviceErrStatus;
            end; //WP_PS_DOCUMENT_ON

          WP_PS_DOCUMENT_ON:
            begin
              ShowLog('여권감지');
              ShowMsgLog('WM_PS_DEVICE : WP_PS_DOCUMENT_ON');
              if not NOEQUIPMENT_RFCARD_VALUE then
                RFC_ReadStop; // RF Card ReadStop
              SetFlash(fsSub, FlashRec[2].filename);
              LEDControl(DCU_LED_INDICATOR, DCU_LED_GREEN_OFF);
              LEDControl(DCU_LED_INDICATOR, DCU_LED_RED);
              InsertImmigrationLogs('10');
              Processing(paReading);
            end; //WP_PS_DOCUMENT_ON

          WP_PS_PASSPORT_READ_BEGIN:
            begin
              ShowMsgLog('WM_PS_DEVICE : WP_PS_PASSPORT_READ_BEGIN');
            end; //WP_PS_PASSPORT_READ_BEGIN

          WP_PS_PASSPORT_READ_END:
            begin
              ShowLog('심사시작');
              ShowMsgLog('WM_PS_DEVICE : WP_PS_PASSPORT_READ_END');
//              LEDControl(DCU_LED_PASSPORT, DCU_LED_GREEN);
              Processing(paPassport);
              GetOpticalData;
            end; //WP_PS_PASSPORT_READ_END

          WP_PS_E_PASSPORT_ON:
            begin
              ShowMsgLog('WM_PS_DEVICE : WP_PS_E_PASSPORT_ON');
            end; //WP_PS_E_PASSPORT_ON

          WP_PS_E_PASSPORT_READ_BEGIN:
            begin
              ShowLog('WM_PS_DEVICE : WP_PS_E_PASSPORT_READ_BEGIN');
            end; //WP_PS_E_PASSPORT_READ_BEGIN

          WP_PS_E_PASSPORT_READ_END:
            begin
              ShowMsgLog('WM_PS_DEVICE : WP_PS_E_PASSPORT_READ_END');
//              GetEDocData;
            end; //WP_PS_E_PASSPORT_READ_END

          WP_PS_RFCARD_ON:
            begin
              ShowLog('승무원카드 감지');
              ShowMsgLog('WM_PS_DEVICE : WP_PS_RFCARD_ON');
              Processing(paReading);
            end; //WP_PS_RFCARD_ON
  //
          WP_PS_RFCARD_READ_BEGIN:
            begin
              ShowMsgLog('WM_PS_DEVICE : WP_PS_RFCARD_READ_BEGIN');
            end; //WP_PS_RFCARD_READ_BEGIN
  //
          WP_PS_RFCARD_READ_END:
            begin
              ShowMsgLog('WM_PS_DEVICE : WP_PS_RFCARD_READ_END');
              PPR_ReadDocumentStop(PSDMContext);
              Processing(paPassport);
            end; //WP_PS_RFCARD_READ_END

          WP_PS_DOCUMENT_OFF:
            begin
              LEDControl(DCU_LED_PASSPORT, DCU_LED_BLUE);
            end;

          // VIZData 가 필요하면
          WP_PS_VIZ_COMPLETE:
            begin
//              PPR_GetVizResult(@g_VIZData);
            end;
        end; //case PS_DEV_MSSG_WPARAM_DEFINE(Message.wParam) of
      end; // WM_PS_DEVICE

    // RF Card 메시지
    WM_RF_DEVICE:
      begin
        case RF_DEV_MSSG_WPARAM_DEFINE(Msg.WParam) of
          WM_RF_CREW_CARD_ON:
            begin
              ShowMsgLog('WM_RF_DEVICE : WM_RF_CREW_CARD_ON');
              PPR_ReadDocumentStop(PSDMContext);
            end;
          WM_RF_CREW_CARD_COMPLETE:
            begin
              ShowMsgLog('WM_RF_DEVICE : WM_RF_CREW_CARD_COMPLETE');
              GetRFCardData;
            end;
          WM_RF_CARD_WRITE_COMPLETE:
            begin
              ShowMsgLog('WM_RF_DEVICE : WM_RF_CARD_WRITE_COMPLETE');
            end;
          WM_RF_CARD_WRITE_FAIL:
            begin
              ShowMsgLog('WM_RF_DEVICE : WM_RF_CARD_WRITE_FAIL');
            end;
          WM_RF_TIMEOUT:
            begin
              ShowMsgLog('WM_RF_DEVICE : WM_RF_TIMEOUT');
              PPR_ReadDocument(PSDMContext);
              if not NOEQUIPMENT_RFCARD_VALUE then
                RFC_Read;
            end;
        end;
      end;

    // 지문 인식 메시지
    WM_FN_DEVICE..WM_FN_DEVICE + MAX_DEVICE:
      begin
        case FN_DEV_MSSG_WPARAM_DEFINE(Msg.WParam) of
          WP_FN_ERROR:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_ERROR');
              LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
              Processing(paFingerFail);
//                    GetDeviceErrStatus;
            end; //WP_FN_ERROR

          WP_FN_OPEN:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_OPEN');
            end; //WP_FN_OPEN

          WP_FN_CLOSE:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_CLOSE');
            end; //WP_FN_CLOSE

          WP_FN_NO_FINGER:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_NO_FINGER');
            end; //WP_FN_NO_FINGER

          WP_FN_FINGER_OK:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_FINGER_OK');
            end; //WP_FN_NO_FINGER

          WP_FN_MOVE_LEFT:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_MOVE_LEFT');
            end; //WP_FN_MOVE_LEFT

          WP_FN_MOVE_RIGHT:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_MOVE_RIGHT');
            end; //WP_FN_MOVE_RIGHT

          WP_FN_MOVE_UP:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_MOVE_UP');
            end; //WP_FN_MOVE_UP

          WP_FN_MOVE_DOWN:
            begin
              ShowMsgLog('WM_FN_DEVICE : WP_FN_MOVE_DOWN');
            end; //WP_FN_MOVE_DOWN
          WP_FN_PROCESS:
            begin
              case Msg.LParam of
                ABC_SUCCESS:
                  begin
                    ShowMsgLog('WM_FN_DEVICE : WP_FN_PROCESS : CAPTURED');

                    // 2인감지면 다음진행은 하지않음
                    if ViewModel.Detect2Person then
                    begin
                      // 2인 진입감지 영상
                      Exit;
                    end;
//                    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_GREEN);
                    MatchFingerprint;
                  end;
                ABC_FN_CAPTURE_FAIL:
                  begin
                    // 2인감지면 다음진행은 하지않음
                    if ViewModel.Detect2Person then
                    begin
                      // 2인 진입감지 영상
                      Exit;
                    end;
                    ShowMsgLog('WM_FN_DEVICE : WP_FN_PROCESS : ABC_FN_CAPTURE_FAIL');
                    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
                    Processing(paFingerFail);
                    RetryTakeFingerprint;
                  end;
                ABC_FN_CAPTURE_TIMEOUT:
                  begin
                    // 2인감지면 다음진행은 하지않음
                    if ViewModel.Detect2Person then
                    begin
                      // 2인 진입감지 영상
                      Exit;
                    end;
                    ShowMsgLog('WM_FN_DEVICE : WP_FN_PROCESS : ABC_FN_CAPTURE_TIMEOUT');
                    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
                    Processing(paFingerFail);
                    RetryTakeFingerprint;
                  end;
                ABC_FN_CAPTURE_CANCELED:
                  begin
                    ShowMsgLog('WM_FN_DEVICE : WP_FN_PROCESS : ABC_FN_CAPTURE_CANCELED');
                    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_BLUE);
                  end;
              end;
            end;
        end; //case FN_DEV_MSSG_WPARAM_DEFINE(Msg.wParam) of
      end; // WM_FN_DEVICE

    // 안면 메시지
    WM_FCNC_DEVICE:
      begin
        case FCNC_DEV_MSSG_WPARAM_DEFINE(Msg.WParam) of
          WP_FACE_OPEN:
            begin
              ShowMsgLog('안면 인증 서버 접속 성공');
              ViewModel.SetConnectCAM(1);
            end; //WP_FACE_OPEN

          WP_FACE_CLOSE:
            begin
              ShowMsgLog('안면 인증 서버 접속 해제');
              ViewModel.ConnectCAM := 0;

              if ViewModel.ReconnectCAM = 1 then
              begin
                ShowLog('안면 인증 서버 재 접속 처리 중');
                FCC_ConnectServer(FNetworkInfo);
              end;
            end; //WP_FACE_CLOSE

          WP_FACE_VERIFY:
            begin
              // 안면이미지 버퍼해제
              FreeImage(@FFace1bmp);
              FreeImage(@FFace2bmp);
//              FreeImage(@FFacePrebmp);

              // 2인감지면 다음진행은 하지않음
              if ViewModel.Detect2Person then
              begin
                // 2인 진입감지 영상
                Exit;
              end;

              if Msg.LParam = 0 then
              begin
                ShowMsgLog('안면 인증 실패');
                ViewModel.SetFaceOk(0);
              end
              else
              begin
                ShowMsgLog('안면 인증 성공 : ' + IntToStr(Msg.LParam) + '번카메라');
                ViewModel.SetFaceOk(1);
              end;

              MatchPhoto;
            end; //WP_FACE_VERIFY
          WP_FACE_ERROR:
            begin
              ShowLog('WP_FACE_ERROR DetectFaceError 호출 Message.LParam : ' + IntToStr(Msg.LParam));
              InsertImmigrationLogs('62');
              Processing(paCameraFail);
//              CopyMemory(@err, Pointer(Msg.LParam), SizeOf(ABC_FCNC_FACE_ERROR));
//              DetectFaceError(err.iErrorCode);
//              GetDeviceErrStatus;
              case Msg.LParam of
                0:
                  begin
                    ShowLog('1번카메라오류');
                    ShowMsgLog('1번카메라오류');
                  end;
                1:
                  begin
                    ShowLog('2번카메라오류');
                    ShowMsgLog('2번카메라오류');
                  end;
                2:
                  begin
                    ShowLog('3번카메라오류');
                    ShowMsgLog('3번카메라오류');
                  end;
              end;
            end;
          WP_FACE_PREVERIFY:
            begin
              // 2인감지면 다음진행은 하지않음
              if ViewModel.Detect2Person then
              begin
                // 2인 진입감지 영상
                Exit;
              end;

              if not NOEQUIPMENT_CAMERA_VALUE then
              begin
                ViewModel.SetFaceOk(1);
                ViewModel.SetIsPreVerifyOk(True);
              end;
            end;
        end; //case MESSAGES(Message.WParam) of
      end; //WM_FCNC_DEVICE

    // 2인감지
    WM_FCNC_PASSENGERDETECT:
      begin
        case PASSENGERDETECT_MSG_WPARAM_DEFINE(Msg.WParam) of
          DETECT_FAIL:
            begin
            end;
          DETECT_START:
            begin
              ShowMsgLog('2인감지 시작');
            end;

          DETECT_STOP:
            begin
              ShowMsgLog('2인감지 종료');
            end;

          DETECT_SUCCESS:
            begin
              if not NOEQUIPMENT_2PERSON_VALUE then
              begin
                SetModeStop;
                Windows.Beep(6300, 2000);
                FCC_2PStop;

                ShowMsgLog('2인감지결과 수신::2인');
                Processing(pa2PFail);
                // 이미 2인감지인데 메시지 수신시 넘김
                if ViewModel.Detect2Person then
                  Exit;
                ViewModel.Detect2Person := True;
  //              GetDeviceErrStatus;
                SetFlash(fsMain, FlashRec[57].filename);
                WaitSleep(3000);
                SetFlash(fsSub, FlashRec[52].filename);
                PlaySound('032');
                ViewModel.SetCurrentStep(0);
  //
  //              // 장비 동작 중지
                FNS_Cancel(FNDMContext);
                GetResult2P;
              end;
            end;
        end;
      end;
    // 조명 LED
    WM_LIGHT_DEVICE:
      begin
//        ShowMessage(IntToStr(Msg.LParam));
      end;
    // DCU Message
    WM_DC_DEVICE:
      begin
        case DCU_DEV_MSG_WPARAM_DEFINE(Msg.WParam) of
          WP_DC_A_ENT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_A_ENT_CLOSE');
              LEDControl(DCU_LED_INDICATOR, DCU_LED_GREEN_OFF);
              LEDControl(DCU_LED_INDICATOR, DCU_LED_RED);
              ViewModel.SetPaxIn(True);
              FrontDoorClose;
            end;
          WP_DC_A_NOENT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_A_NOENT_CLOSE');
              ViewModel.SetPaxIn(False);
              FrontDoorClose;
            end;
          WP_DC_B_ENT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_B_ENT_CLOSE');
              ViewModel.SetPaxIn(False);
              FrontDoorClose;
            end;
          WP_DC_B_NOENT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_B_NOENT_CLOSE');
              ViewModel.SetPaxIn(True);
              FrontDoorClose;
            end;
          WP_DC_A_EXT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_A_EXT_CLOSE');
              ViewModel.SetPaxIn(False);
              ExitDoorClose;
            end;
          WP_DC_A_NOEXT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_A_NOEXT_CLOSE');
              ViewModel.SetPaxIn(True);
              ExitDoorClose;
            end;
          WP_DC_B_EXT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_B_EXT_CLOSE');
              ViewModel.SetPaxIn(False);
              ExitDoorClose;
            end;
          WP_DC_B_NOEXT_CLOSE:
            begin
              ShowMsgLog('WM_DC_DEVICE : WP_DC_OPERATION : WP_DC_B_NOEXT_CLOSE');
              ViewModel.SetPaxIn(True);
              ExitDoorClose;
            end;
        end;
      end;
  else
    inherited;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.ClearComponents                                          //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: caArea: TClearArea                                             //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.ClearComponents(caArea: TClearArea);
var
  i, j: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if caArea in [caAll, caArea] then
    begin
      if Components[i].ClassType = TEdit then
      begin
        TEdit(Components[i]).Text := '';
      end
      else if Components[i].ClassType = TLabel then
      begin
        if Pos('lbl', TLabel(Components[i]).Name) > 0 then
          TLabel(Components[i]).Caption := '';
      end
      else if Components[i].ClassType = TMemo then
      begin
        if Pos('mmLog', TMemo(Components[i]).Name) > 0 then
          Continue;
        TMemo(Components[i]).Lines.Clear;
      end
      else if Components[i].ClassType = TscActivityIndicator then
      begin
        if Pos('abc', TscActivityIndicator(Components[i]).Name) > 0 then
        begin
          TscActivityIndicator(Components[i]).Active := False;
          TscActivityIndicator(Components[i]).Visible := False;
        end;
      end
      else if Components[i].ClassType = TscGPGlyphButton then
      begin
        if Pos('abc', TscGPGlyphButton(Components[i]).Name) > 0 then
        begin
          TscGPGlyphButton(Components[i]).GlyphOptions.Kind := scgpbgkForward;
        end;
      end
      else if Components[i].ClassType = TscGPImage then
      begin
        if Pos('abc', TscGPImage(Components[i]).Name) > 0 then
        begin
          TscGPImage(Components[i]).Visible := False;
        end;
      end
      else if Components[i].ClassType = TImage then
      begin
        if Pos('imgSensors', TImage(Components[i]).Name) > 0 then
          Continue;
        TImage(Components[i]).Picture := nil;
      end
      else if Components[i].ClassType = TButton then
      begin
        if Pos('btn', TButton(Components[i]).Name) > 0 then
          TButton(Components[i]).Enabled := True;
      end;
    end
    else if caArea in [caAction] then
    begin
      if Components[i].ClassType = TImage then
      begin
        TImage(Components[i]).Picture := nil;
      end;
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.ShowLog                                                  //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: strMsg: string                                                 //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.ShowLog(strMsg: string);
var
  strFileName: string;
  strDateTime: string;
  fileLog: TextFile;
begin
  if mmLog.CanFocus = true then
  begin
    mmLog.Lines.Add(strMsg);
    if mmLog.Lines.Count > 300 then
    begin
      mmLog.Lines.Delete(0);
      mmLog.Lines.Add('');
      mmLog.Lines.Delete(mmLog.Lines.Count - 1);
    end;
  end;

  if ViewModel.WriteLogFile then
  begin
    DateTimeToString(strDateTime, 'YYYY-MM-DD HH:NN:SS:ZZZ', Now);
    strMsg := strDateTime + '    ' + strMsg + sLineBreak;

    DateTimeToString(strDateTime, 'YYYYMMDD', Now);
    strFileName := ViewModel.LogPath + 'BorderController_' + strDateTime + '.log';

    if not DirectoryExists(ViewModel.LogPath) then
      ForceDirectories(ViewModel.LogPath);

    if not FileExists(strFileName) then
      FileClose(FileCreate(strFileName));

    AssignFile(fileLog, strFileName);
    Append(fileLog);
    Writeln(fileLog, strMsg);
    CloseFile(fileLog);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.ShowMsgLog                                               //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: strMsg: string                                                 //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.ShowMsgLog(strMsg: string);
var
  strFileName: string;
  strDateTime: string;
  fileLog: TFileStream;
begin
  if mmMessage.CanFocus = true then
  begin
    mmMessage.Lines.Add(strMsg);
    if mmMessage.Lines.Count > 300 then
    begin
      mmMessage.Lines.Delete(0);
      mmMessage.Lines.Add('');
      mmMessage.Lines.Delete(mmMessage.Lines.Count - 1);
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.ShowMouseCursor                                          //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.26                                                     //
//  Arguments: None                                                           //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.ShowMouseCursor;
begin
  if not FisCursorHide then
    Exit;
  FisCursorHide := false;
  ShowCursor(True);
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.HideMouseCursor                                          //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.26                                                     //
//  Arguments: None                                                           //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.HideMouseCursor;
begin
  if FisCursorHide then
    Exit;

  FisCursorHide := true;
  ShowCursor(False);
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.Processing                                               //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.10.19                                                     //
//  Arguments: abcNow: TProcessABC                                            //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.Processing(paNow: TProcessABC);
begin
  case paNow of
    paInit:
      begin
        abcIndicator.GlyphOptions.Kind := scgpbgkForward;
        abcReading.Active := False;
        abcReading.Visible := False;
        abcPassport.Visible := False;
        abcScanning.Active := False;
        abcScanning.Visible := False;
        abcFinger.Visible := False;
        abcTaking.Active := False;
        abcTaking.Visible := False;
        abcCamera.Visible := False;
        abcDetecting.Active := False;
        abcDetecting.Visible := False;
        abc2P.Visible := False;
      end;
    paReading:
      begin
        abcIndicator.GlyphOptions.Kind := scgpbgkCancel;
        abcReading.Visible := True;
        abcReading.Active := True;
      end;
    paPassport:
      begin
        abcReading.Active := False;
        abcReading.Visible := False;
        abcPassport.ImageIndex := 0;
        abcPassport.Visible := True;
      end;
    paPassportFail:
      begin
        abcReading.Active := False;
        abcReading.Visible := False;
        abcPassport.ImageIndex := 1;
        abcPassport.Visible := True;
      end;
    paDoorFront:
      ;
    paWalkThStart:
      ;
    paScanning:
      begin
        abcScanning.Visible := True;
        abcScanning.Active := True;
      end;
    paFinger:
      begin
        abcScanning.Active := False;
        abcScanning.Visible := False;
        abcFinger.ImageIndex := 0;
        abcFinger.Visible := True;
      end;
    paFingerFail:
      begin
        abcScanning.Active := False;
        abcScanning.Visible := False;
        abcFinger.ImageIndex := 1;
        abcFinger.Visible := True;
      end;
    paWalkThEnd:
      ;
    paTaking:
      begin
        abcTaking.Visible := True;
        abcTaking.Active := True;
      end;
    paCamera:
      begin
        abcTaking.Active := False;
        abcTaking.Visible := False;
        abcCamera.ImageIndex := 0;
        abcCamera.Visible := True;
      end;
    paCameraFail:
      begin
        abcTaking.Active := False;
        abcTaking.Visible := False;
        abcCamera.ImageIndex := 1;
        abcCamera.Visible := True;
      end;
    paDoorRear:
      ;
    paDetecting:
      begin
        abcDetecting.Visible := True;
        abcDetecting.Active := True;
      end;
    pa2P:
      begin
        abcDetecting.Active := False;
        abcDetecting.Visible := False;
        abc2P.ImageIndex := 0;
        abc2P.Visible := True;
      end;
    pa2PFail:
      begin
        abcDetecting.Active := False;
        abcDetecting.Visible := False;
        abc2P.ImageIndex := 1;
        abc2P.Visible := True;
      end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: TMain.tmrCheckIdleTimer                                        //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.09.26                                                     //
//  Arguments: Sender: TObject                                                //
//  Result:    None                                                           //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure TMain.tmrCheckIdleTimer(Sender: TObject);
begin
  tmrCheckIdle.Enabled := False;

  if GetLastInputInfo(FLastInputInfo) then
  begin
    if GetTickCount - FLastInputInfo.dwTime > 2000 then
      HideMouseCursor
    else
      ShowMouseCursor;
  end;

  tmrCheckIdle.Enabled := True;
end;

end.

