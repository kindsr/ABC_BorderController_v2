unit uViewModel;

interface

uses
  Forms, Windows, Classes, IniFiles, SysUtils, StrUtils, ExtCtrls, jpeg,
  uConst, uFunction, uService, Graphics, scGPControls,
  ABC_PS_DM, ABC_FN_DM, ABC_FC_DM, ABC_DC_DM, Winapi.MMSystem;

type
  TArrAnsiChar = array[0..20480] of AnsiChar;
  TViewModel = class
  private
    FReconnectCAM: Integer;
    FFrontDoorTimeout: Integer;
    FBrightTop: Integer;
    FUseEPass: Boolean;
    FFingerSpoof: Integer;
    FFaceChecked: Boolean;
    FFingerOk: Integer;
    FMatchedFaceScore: Single;
    FIsPassBack: Boolean;
    FManualGateFlag: Boolean;
    FFingerMaxTry: Integer;
    FPassportOk: Integer;
    FLFingerFeature: TArrAnsiChar;
    FBright: Integer;
    FExitDoorBackRule: Integer;
    FPassportMaxTry: Integer;
    FFingerFailStop: Integer;
    FFaceOk: integer;
    FRFingerQuality: Integer;
    FFaceCrewPerson: Integer;
    FFingerTryCount: integer;
    FFaceMaxTry: Integer;
    FAutoTestCount: Integer;
    FFrontDoorBackRule: Integer;
    FDCU: Integer;
    FFingerSecureLevel: Integer;
    FFingerTimeout: Integer;
    FFaceScore: Integer;
    FPassportTryCount: integer;
    FWriteLogFile: Boolean;
    FBtnCloseClick: Boolean;
    FLogPath: string;
    FStopMode: Boolean;
    FPaxIn: Boolean;
    FFingerQuality: Integer;
    FFaceFailStop: Integer;
    FRegFinger2Index: string;
    FIsPreVerifyOk: Boolean;
    FFaceTryCount: integer;
    FRFingerFeature: TArrAnsiChar;
    FExitDoorTimeout: Integer;
    FConnectCAM: Integer;
    FRegFinger1Index: string;
    FCurrentStep: Integer;
    FLFingerQuality: Integer;
    FDetect2Person: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetAutoTestCount(const Value: Integer);
    procedure SetBright(const Value: Integer);
    procedure SetBrightTop(const Value: Integer);
    procedure SetBtnCloseClick(const Value: Boolean);
    procedure SetConnectCAM(const Value: Integer);
    procedure SetCurrentStep(const Value: Integer);
    procedure SetDCU(const Value: Integer);
    procedure SetDetect2Person(const Value: Boolean);
    procedure SetExitDoorBackRule(const Value: Integer);
    procedure SetExitDoorTimeout(const Value: Integer);
    procedure SetFaceChecked(const Value: Boolean);
    procedure SetFaceCrewPerson(const Value: Integer);
    procedure SetFaceFailStop(const Value: Integer);
    procedure SetFaceMaxTry(const Value: Integer);
    procedure SetFaceOk(const Value: integer);
    procedure SetFaceScore(const Value: Integer);
    procedure SetFaceTryCount(const Value: integer);
    procedure SetFingerFailStop(const Value: Integer);
    procedure SetFingerMaxTry(const Value: Integer);
    procedure SetFingerOk(const Value: Integer);
    procedure SetFingerQuality(const Value: Integer);
    procedure SetFingerSecureLevel(const Value: Integer);
    procedure SetFingerSpoof(const Value: Integer);
    procedure SetFingerTimeout(const Value: Integer);
    procedure SetFingerTryCount(const Value: integer);
    procedure SetFrontDoorBackRule(const Value: Integer);
    procedure SetFrontDoorTimeout(const Value: Integer);
    procedure SetIsPassBack(const Value: Boolean);
    procedure SetIsPreVerifyOk(const Value: Boolean);
    procedure SetLFingerFeature(const Value: TArrAnsiChar);
    procedure SetLFingerQuality(const Value: Integer);
    procedure SetLogPath(const Value: string);
    procedure SetManualGateFlag(const Value: Boolean);
    procedure SetMatchedFaceScore(const Value: Single);
    procedure SetPassportMaxTry(const Value: Integer);
    procedure SetPassportOk(const Value: Integer);
    procedure SetPassportTryCount(const Value: integer);
    procedure SetPaxIn(const Value: Boolean);
    procedure SetReconnectCAM(const Value: Integer);
    procedure SetRegFinger1Index(const Value: string);
    procedure SetRegFinger2Index(const Value: string);
    procedure SetRFingerFeature(const Value: TArrAnsiChar);
    procedure SetRFingerQuality(const Value: Integer);
    procedure SetStopMode(const Value: Boolean);
    procedure SetUseEPass(const Value: Boolean);
    procedure SetWriteLogFile(const Value: Boolean);
    property BtnCloseClick: Boolean read FBtnCloseClick write SetBtnCloseClick;
    property RegFinger1Index: string read FRegFinger1Index write SetRegFinger1Index;
    property RegFinger2Index: string read FRegFinger2Index write SetRegFinger2Index;
    property LFingerFeature: TArrAnsiChar read FLFingerFeature write SetLFingerFeature;
    property RFingerFeature: TArrAnsiChar read FRFingerFeature write SetRFingerFeature;
    property LFingerQuality: Integer read FLFingerQuality write SetLFingerQuality;
    property RFingerQuality: Integer read FRFingerQuality write SetRFingerQuality;
    property MatchedFaceScore: Single read FMatchedFaceScore write SetMatchedFaceScore;
    property ReconnectCAM: Integer read FReconnectCAM write SetReconnectCAM;
    property ConnectCAM: Integer read FConnectCAM write SetConnectCAM;
    property Detect2Person: Boolean read FDetect2Person write SetDetect2Person;
    property CurrentStep: Integer read FCurrentStep write SetCurrentStep;
    property StopMode: Boolean read FStopMode write SetStopMode;
    property FingerTryCount: integer read FFingerTryCount write SetFingerTryCount;
    property FaceTryCount: integer read FFaceTryCount write SetFaceTryCount;
    property PassportTryCount: integer read FPassportTryCount write SetPassportTryCount;
    property PassportOk: Integer read FPassportOk write SetPassportOk;
    property FingerOk: Integer read FFingerOk write SetFingerOk;
    property FaceOk: integer read FFaceOk write SetFaceOk;

    {Ini File Config Values}
    procedure LoadConfig;
    property WriteLogFile: Boolean read FWriteLogFile write SetWriteLogFile;
    property LogPath: string read FLogPath write SetLogPath;
    property FaceMaxTry: Integer read FFaceMaxTry write SetFaceMaxTry;
    property FingerMaxTry: Integer read FFingerMaxTry write SetFingerMaxTry;
    property PassportMaxTry: Integer read FPassportMaxTry write SetPassportMaxTry;
    property FaceFailStop: Integer read FFaceFailStop write SetFaceFailStop;
    property FingerFailStop: Integer read FFingerFailStop write SetFingerFailStop;
    property FaceCrewPerson: Integer read FFaceCrewPerson write SetFaceCrewPerson;
    property FaceScore: Integer read FFaceScore write SetFaceScore;
    property FaceChecked: Boolean read FFaceChecked write SetFaceChecked;
    property FingerTimeout: Integer read FFingerTimeout write SetFingerTimeout;
    property FingerSecureLevel: Integer read FFingerSecureLevel write SetFingerSecureLevel;
    property FingerQuality: Integer read FFingerQuality write SetFingerQuality;
    property FingerSpoof: Integer read FFingerSpoof write SetFingerSpoof;
    property Bright: Integer read FBright write SetBright;
    property BrightTop: Integer read FBrightTop write SetBrightTop;
    property DCU: Integer read FDCU write SetDCU;
    property UseEPass: Boolean read FUseEPass write SetUseEPass;
    property IsPassBack: Boolean read FIsPassBack write SetIsPassBack;
    property FrontDoorTimeout: Integer read FFrontDoorTimeout write SetFrontDoorTimeout;
    property FrontDoorBackRule: Integer read FFrontDoorBackRule write SetFrontDoorBackRule;
    property ExitDoorTimeout: Integer read FExitDoorTimeout write SetExitDoorTimeout;
    property ExitDoorBackRule: Integer read FExitDoorBackRule write SetExitDoorBackRule;
    property ManualGateFlag: Boolean read FManualGateFlag write SetManualGateFlag;
    property IsPreVerifyOk: Boolean read FIsPreVerifyOk write SetIsPreVerifyOk;
    property AutoTestCount: Integer read FAutoTestCount write SetAutoTestCount;
    property PaxIn: Boolean read FPaxIn write SetPaxIn;
  end;
  TCheckPassengerOutTimer = class(TTimer)
  public
    procedure OnCheckPassengerOutTimer(Sender: TObject);
  end;
  TCheckSensorTimer = class(TTimer)
  public
    procedure OnCheckSensorTimer(Sender: TObject);
  end;

  {Global Function}
  procedure FormInit;
  procedure FormClose;
  procedure FormCloseQuery;
  procedure ShowLog(Msg: string);
  procedure ShowMsgLog(Msg: string);
  procedure Processing(paNow: TProcessABC);
  procedure InitVars(caArea: TClearArea);
  function  CheckInside(iCount: Integer): Integer;
  function  CheckSensorInfo(piFrom, piTo: Integer): Integer; overload;
  procedure CheckSensorInfo; overload;
  procedure SensorLabelInit;
  procedure SensorLabelSetColor(Sensor: Integer; Color: TColor);
  procedure SetCheckSensor(IsOn: Boolean);
  procedure FreeImage(image: PABC_IMAGE);
  procedure CopyImage(src: PABC_IMAGE; dest: PABC_IMAGE);
  procedure FreeFeature(feature: PABC_FEATURE);
  procedure CopyFeature(src: PABC_FEATURE; dest: PABC_FEATURE);
  procedure ShowImage(image: TImage; data: ABC_IMAGE);
  function  GetMRP_Photo: Integer;
  procedure SetModeRun;
  procedure SetModeStop;

  {InitSDK}
  function InitSDK: Boolean;
  function InitDoorControlUnit: Boolean;
  function InitPassportDevice: Boolean;
  function InitFingerprintDevice: Boolean;
  function InitFingerAlgorithm: Boolean;
  function InitCameraDevice: Boolean;
  function InitLightDevice: Boolean;
  function InitRFCardDevice: Boolean;
  function Initialize: Boolean;
  procedure UnInitialize;
  function UnInitSDK: Boolean;

  {ControlDevices}
  procedure DOORControl(iDoor : DC_DOOR_POSITION; iCmd: DC_DOOR_COMMAND; iAutoCloseTime: Integer);
  procedure LEDControl(iLED : DC_LED_POSITION; iCmd : DC_LED_COMMAND);
  procedure SetFlash(FlashSet : TFlashSet; strFile : string);
  procedure PlaySound(strFile : string);

  {BusinessLogic}
  procedure InitializeClick;
  procedure StartProcess;
  procedure EndProcess;
  procedure TakeFingerprint;
  procedure RetryTakeFingerprint;
  procedure MatchFingerprint;
  procedure GetOpticalData;
  procedure GetRFCardData;
  procedure TakePhoto;
  procedure RetryTakePhoto;
  procedure MatchPhoto;
  procedure MatchPrePhoto;
  procedure BioSuccess;
  function PassengerBack(iType: Integer): Integer;
  procedure GetResult2P; overload;
  procedure GetResult2P(ms: TMemoryStream); overload;

  {Door Control}
  procedure RequestFrontDoorOpen;
  procedure FrontDoorClose;
  procedure RequestExitDoorOpen;
  procedure ExitDoorClose;

var
  ViewModel: TViewModel;
  CheckPassengerOutTimer: TCheckPassengerOutTimer;
  CheckSensorTimer: TCheckSensorTimer;

  PSDMContext: ABC_Context = nil;
  FNDMContext: ABC_Context = nil;
  FNAMContext: ABC_Context = nil;
  DIMMContext: ABC_Context = nil;
  DCDMContext: ABC_Context = nil;
  FMRZAllData: ABC_PS_MRZ_DATA;
  FDocType: Integer;
  FDocResult: ABC_PS_E_DOC_DATA;
  FMRZData: ABC_PS_MRZ;
  FVIZData: ABC_RP_VIZ_DATA;
  FMRPFaceImg: ABC_IMAGE;
  FMRPEFaceImg: ABC_IMAGE;
  FUseEPassDevice: Boolean;
  FCrewData: ABC_PS_CREW_DATA;
  FCertInfo: ABC_PS_CERT_INFO;
  FRegFinger1: ABC_FEATURE;
  FRegFinger2: ABC_FEATURE;
  FRegFingerImg1: ABC_IMAGE;
  FRegFingerImg2: ABC_IMAGE;
  FRegFace: ABC_IMAGE;
  FRegFaceBMP: ABC_IMAGE;
  FFace1bmp: ABC_IMAGE;
  FFace2bmp: ABC_IMAGE;
  FFacePrebmp: ABC_IMAGE;
  FNetworkInfo: ABC_NETWORK_INFO;

  FInitializeTag: Integer;

  FRunMode: Boolean;

  FCheckInside: Boolean;
  FCheck2P: Boolean;

implementation

uses
  frmMain, frmDisplayFlash;

{ TViewModel }

constructor TViewModel.Create;
begin
  inherited;
end;

destructor TViewModel.Destroy;
begin
  inherited;
end;

procedure TViewModel.SetAutoTestCount(const Value: Integer);
begin
  FAutoTestCount := Value;
end;

procedure TViewModel.SetBright(const Value: Integer);
begin
  FBright := Value;
end;

procedure TViewModel.SetBrightTop(const Value: Integer);
begin
  FBrightTop := Value;
end;

procedure TViewModel.SetBtnCloseClick(const Value: Boolean);
begin
  FBtnCloseClick := Value;
end;

procedure TViewModel.SetConnectCAM(const Value: Integer);
begin
  FConnectCAM := Value;
end;

procedure TViewModel.SetCurrentStep(const Value: Integer);
begin
  FCurrentStep := Value;
end;

procedure TViewModel.SetDCU(const Value: Integer);
begin
  FDCU := Value;
end;

procedure TViewModel.SetDetect2Person(const Value: Boolean);
begin
  FDetect2Person := Value;
end;

procedure TViewModel.SetExitDoorBackRule(const Value: Integer);
begin
  FExitDoorBackRule := Value;
end;

procedure TViewModel.SetExitDoorTimeout(const Value: Integer);
begin
  FExitDoorTimeout := Value;
end;

procedure TViewModel.SetFaceChecked(const Value: Boolean);
begin
  FFaceChecked := Value;
end;

procedure TViewModel.SetFaceCrewPerson(const Value: Integer);
begin
  FFaceCrewPerson := Value;
end;

procedure TViewModel.SetFaceFailStop(const Value: Integer);
begin
  FFaceFailStop := Value;
end;

procedure TViewModel.SetFaceMaxTry(const Value: Integer);
begin
  FFaceMaxTry := Value;
end;

procedure TViewModel.SetFaceOk(const Value: integer);
begin
  FFaceOk := Value;
end;

procedure TViewModel.SetFaceScore(const Value: Integer);
begin
  FFaceScore := Value;
end;

procedure TViewModel.SetFaceTryCount(const Value: integer);
begin
  FFaceTryCount := Value;
end;

procedure TViewModel.SetFingerFailStop(const Value: Integer);
begin
  FFingerFailStop := Value;
end;

procedure TViewModel.SetFingerMaxTry(const Value: Integer);
begin
  FFingerMaxTry := Value;
end;

procedure TViewModel.SetFingerOk(const Value: Integer);
begin
  FFingerOk := Value;
end;

procedure TViewModel.SetFingerQuality(const Value: Integer);
begin
  FFingerQuality := Value;
end;

procedure TViewModel.SetFingerSecureLevel(const Value: Integer);
begin
  FFingerSecureLevel := Value;
end;

procedure TViewModel.SetFingerSpoof(const Value: Integer);
begin
  FFingerSpoof := Value;
end;

procedure TViewModel.SetFingerTimeout(const Value: Integer);
begin
  FFingerTimeout := Value;
end;

procedure TViewModel.SetFingerTryCount(const Value: integer);
begin
  FFingerTryCount := Value;
end;

procedure TViewModel.SetFrontDoorBackRule(const Value: Integer);
begin
  FFrontDoorBackRule := Value;
end;

procedure TViewModel.SetFrontDoorTimeout(const Value: Integer);
begin
  FFrontDoorTimeout := Value;
end;

procedure TViewModel.SetIsPassBack(const Value: Boolean);
begin
  FIsPassBack := Value;
end;

procedure TViewModel.SetIsPreVerifyOk(const Value: Boolean);
begin
  FIsPreVerifyOk := Value;
end;

procedure TViewModel.SetLFingerFeature(const Value: TArrAnsiChar);
begin
  FLFingerFeature := Value;
end;

procedure TViewModel.SetLFingerQuality(const Value: Integer);
begin
  FLFingerQuality := Value;
end;

procedure TViewModel.SetLogPath(const Value: string);
begin
  FLogPath := Value;
end;

procedure TViewModel.SetManualGateFlag(const Value: Boolean);
begin
  FManualGateFlag := Value;
end;

procedure TViewModel.SetMatchedFaceScore(const Value: Single);
begin
  FMatchedFaceScore := Value;
end;

procedure TViewModel.SetPassportMaxTry(const Value: Integer);
begin
  FPassportMaxTry := Value;
end;

procedure TViewModel.SetPassportOk(const Value: Integer);
begin
  FPassportOk := Value;
end;

procedure TViewModel.SetPassportTryCount(const Value: integer);
begin
  FPassportTryCount := Value;
end;

procedure TViewModel.SetPaxIn(const Value: Boolean);
begin
  FPaxIn := Value;
end;

procedure TViewModel.SetReconnectCAM(const Value: Integer);
begin
  FReconnectCAM := Value;
end;

procedure TViewModel.SetRegFinger1Index(const Value: string);
begin
  FRegFinger1Index := Value;
end;

procedure TViewModel.SetRegFinger2Index(const Value: string);
begin
  FRegFinger2Index := Value;
end;

procedure TViewModel.SetRFingerFeature(const Value: TArrAnsiChar);
begin
  FRFingerFeature := Value;
end;

procedure TViewModel.SetRFingerQuality(const Value: Integer);
begin
  FRFingerQuality := Value;
end;

procedure TViewModel.SetStopMode(const Value: Boolean);
begin
  FStopMode := Value;
end;

procedure TViewModel.SetUseEPass(const Value: Boolean);
begin
  FUseEPass := Value;
end;

procedure TViewModel.SetWriteLogFile(const Value: Boolean);
begin
  FWriteLogFile := Value;
end;

procedure TViewModel.LoadConfig;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_directory + ExtractFileName(ChangeFileExt(Application.ExeName, '.ini')));

  try
    with ViewModel do
    begin
      SetWriteLogFile(StrToBool(IfThen(ini.ReadInteger('LOG', 'ENABLE', 0) = 1, BoolToStr(True), BoolToStr(False))));
      SetLogPath(ini.ReadString('LOG', 'PATH', log_directory));

      SetFaceMaxTry(ini.ReadInteger('FACE', 'MAX_TRY', 3));
      SetFaceFailStop(ini.ReadInteger('FACE', 'FAILSTOP', 0));
      SetFaceCrewPerson(ini.ReadInteger('FACE', 'ENABLE_CREW', 0));
      SetFaceScore(ini.ReadInteger('FACE', 'SCORE', 0));
      SetFaceChecked(StrToBool(IfThen(ini.ReadInteger('FACE', 'USEYN', 0) = 1, BoolToStr(True), BoolToStr(False))));

      SetFingerMaxTry(ini.ReadInteger('FINGER', 'MAX_TRY', 3));
      SetFingerFailStop(ini.ReadInteger('FINGER', 'FAILSTOP', 0));
      SetFingerTimeout(ini.ReadInteger('FINGER', 'TIMEOUT', 15000));
      SetFingerSecureLevel(ini.ReadInteger('FINGER', 'SECURE_LEVEL', 2));
      SetFingerQuality(ini.ReadInteger('FINGER', 'QUALITY', 50));
      SetFingerSpoof(ini.ReadInteger('FINGER', 'SPOOF', 10000));

      SetPassportMaxTry(ini.ReadInteger('PASSPORT', 'MAX_TRY', 3));
      SetUseEPass(StrToBool(IfThen(ini.ReadInteger('PASSPORT', 'READ_EDOC', 0) = 1, BoolToStr(True), BoolToStr(False))));

      SetFrontDoorTimeout(ini.ReadInteger('FRONT_DOOR', 'TIMEOUT', 20));
      SetFrontDoorBackRule(ini.ReadInteger('FRONT_DOOR', 'BACK_RULE', 2)); // 1 : ������ȣ��, 2 : ���������� �ݺ�
      SetExitDoorTimeout(ini.ReadInteger('EXIT_DOOR', 'TIMEOUT', 30));
      SetExitDoorBackRule(ini.ReadInteger('EXIT_DOOR', 'BACK_RULE', 1)); // 1 : ������ȣ��, 2 : ���������� �ݺ�

      SetBright(ini.ReadInteger('DIMMING', 'BRIGHT', 5));
      SetBrightTop(ini.ReadInteger('DIMMING', 'BRIGHT_TOP', 5));
    end;
  finally
    FreeAndNil(ini);
  end;
end;

{Global Function}

procedure FormInit;
begin
  // �޸� ���� �ʱ�ȭ
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
  if GetSvrData_DateTime <> ABC_SUCCESS then
  begin
    ShowLog('Fail to Connect to DB Server!');
    Application.MessageBox('Border Controller DB���� �� ������ �߻��߽��ϴ�.' + sLineBreak + '���� �޼����� Ȯ�� �� �� �����ϼ���', '�ʱ�ȭ ����', MB_OK + MB_ICONSTOP);
    Application.Terminate;
    Exit;
  end;

  // Init SDK
  if not InitSDK then
  begin
    ShowLog('Fail to initialize SDK!');
    Application.MessageBox('Border Controller �ʱ�ȭ �� ������ �߻��߽��ϴ�.' + sLineBreak + '���� �޼����� Ȯ�� �� �� �����ϼ���', '�ʱ�ȭ ����', MB_OK + MB_ICONSTOP);
    Application.Terminate;
    Exit;
  end;

  InitializeClick;
end;

procedure FormClose;
begin
//  if not NODISPLAY_VALUE then
//  begin
//    if Assigned(DisplayFlash) then
//      FreeAndNil(DisplayFlash);
//  end;

  CheckPassengerOutTimer.Enabled := False;
  CheckSensorTimer.Enabled := False;
  Main.tmrCheckIdle.Enabled := False;;

  ShowLog('UnInitialize');
  UnInitialize;

  //WaitSleep(1000);
  //ShowLog('UnInitSDK');
  UnInitSDK;
end;

procedure FormCloseQuery;
begin
  if GetSvrData_InitValue('N') = 0 then
  begin
    ShowLog('������::����::�ڵ��ɻ�� ���� ��ȸ::����');
    FInitializeTag := 0;
    Exit;
  end;
  SetModeStop;
  ViewModel.SetBtnCloseClick(True);
end;

procedure ShowLog(Msg: string);
begin
  Main.ShowLog(Msg);
end;

procedure ShowMsgLog(Msg: string);
begin
  Main.ShowMsgLog(Msg);
end;

procedure Processing(paNow: TProcessABC);
begin
  Main.Processing(paNow);
end;

procedure InitVars(caArea: TClearArea);
begin
  Main.ClearComponents(caArea);

  // �°�����üũ Ÿ�̸� �ʱ�ȭ
  CheckPassengerOutTimer.Enabled := False;
  CheckPassengerOutTimer.Tag := 0;

  CheckSensorTimer.Enabled := False;
  CheckSensorTimer.Tag := 0;

  // �� ���� �ʱ�ȭ
  FreeImage(@FRegFace);
  FreeImage(@FRegFaceBMP);

  // ���� Ư¡�� ����Ÿ �ʱ�ȭ
  FreeFeature(@FRegFinger1);
  FreeFeature(@FRegFinger2);

  // ���� ��ġ �ʱ�ȭ
  ViewModel.SetRegFinger1Index('B');
  ViewModel.SetRegFinger2Index('B');

  // ����, ����, �ȸ� �õ�Ƚ��
  ViewModel.SetFingerTryCount(1);
  ViewModel.SetFaceTryCount(1);
  ViewModel.SetPassportTryCount(1);

  // ����, ����, �ȸ� OK
  ViewModel.SetPassportOk(0);
  ViewModel.SetFingerOk(0);
  ViewModel.SetFaceOk(0);

  // ���� ���μ���
  FCheckInside := True;
  FCheck2P := False;
  FRunMode := True;

  WaitSleep(500);

  ViewModel.SetCurrentStep(0);
  FIsKor := 0;

  // �°� ��������
  ViewModel.SetIsPassBack(False);

  // 2�ΰ���
  ViewModel.SetDetect2Person(False);

  // �����ɻ�
  ViewModel.SetManualGateFlag(False);

  // ���Դ�������
  ViewModel.SetPaxIn(False);

  FPaxInfo.Clear;

  // LED �ʱ�ȭ
  LEDControl(DCU_LED_INDICATOR, DCU_LED_OFF);
  LEDControl(DCU_LED_INDICATOR, DCU_LED_GREEN);
  LEDControl(DCU_LED_PASSPORT, DCU_LED_OFF);
  LEDControl(DCU_LED_FINGERPRINT, DCU_LED_OFF);
  LEDControl(DCU_LED_PRINTER, DCU_LED_OFF);
  LEDControl(DCU_LED_TOPWARNING, DCU_LED_OFF);
  LEDControl(DCU_LED_TOPPROCESS, DCU_LED_OFF);
end;

function CheckInside(iCount : Integer) : Integer;
var
  i, iSensor : Integer;
begin
  if ViewModel.DCU = 1 then
  begin
    // ���� üũ �ڵ� �߰�.
    ShowLog('��ü���ν°�����');
    SensorLabelInit;

    Result := 0;
    i := 0;
    while i < iCount do
    begin
      iSensor := CheckSensorInfo(21, 90);
      if iSensor > 0 then
      begin
        ShowLog('>>>>GCU Sensor : ' + IntToStr(iSensor) + '::��ü���ν°�����::�°�����');
        Result := 1;
        Exit;
      end;

      WaitSleep(30);
      Inc(i);
    end;
  end
  else
  begin
    ShowLog('IsPassengerIn �ӽ� üũ : ' + IntToStr(1));
    result := 1;
  end;
end;

function CheckSensorInfo(piFrom, piTo : Integer) : Integer;
var
  nRetVal: Integer;
  i: Integer;
  szInfo: array[0..MAX_SENSOR - 1] of AnsiChar;
begin
  Result := 0;
  if ViewModel.BtnCloseClick then Exit;
  FillChar(szInfo, SizeOf(szInfo), #0);

  nRetVal := DCU_GetCheckedSensorInfo(@szInfo);
  if nRetVal <> ABC_SUCCESS then
  begin
    ShowLog('>>>>GCU SensorInfo::�Լ�ȣ�� ����');
    Exit;
  end;
//  ShowLog('>>>>GCU SensorInfo::'+szInfo);

  for i := piFrom to piTo - 1 do
  begin
    if (i > 60) and (i <= 80) then
      Continue;

    if szInfo[i] = #1 then
    begin
      SensorLabelSetColor(i, CL_RED);
      Result := i;
      Exit;
    end
    else
      SensorLabelSetColor(i, CL_LIME);
  end;
  Application.ProcessMessages;
end;

procedure CheckSensorInfo;
var
  nRetVal: Integer;
  i: Integer;
  szInfo: array[0..MAX_SENSOR - 1] of AnsiChar;
begin
  if ViewModel.BtnCloseClick then Exit;

  FillChar(szInfo, SizeOf(szInfo), #0);

  nRetVal := DCU_GetCheckedSensorInfo(@szInfo);
  if nRetVal <> ABC_SUCCESS then
  begin
    ShowLog('>>>>GCU SensorInfo::�Լ�ȣ�� ����');
    Exit;
  end;
//  ShowLog('>>>>GCU SensorInfo::'+szInfo);

  for i := 0 to MAX_SENSOR - 1 do
  begin
    if szInfo[i] = #1 then
      SensorLabelSetColor(i, CL_RED)
    else
      SensorLabelSetColor(i, CL_LIME);
  end;
  Application.ProcessMessages;
end;

procedure SensorLabelInit;
var
  i: Integer;
begin
  for i := 0 to Main.ComponentCount - 1 do
  begin
    if Main.Components[i].ClassType = TscGPLabel then
    begin
      if Pos('lblSensor', TscGPLabel(Main.Components[i]).Name) > 0 then
      begin
        TscGPLabel(Main.Components[i]).FillColor := CL_LIME;
      end;
    end;
  end;
end;

procedure SensorLabelSetColor(Sensor: Integer; Color: TColor);
var
  i: Integer;
begin
  for i := 0 to Main.ComponentCount - 1 do
  begin
    if (Main.Components[i].ClassType = TscGPLabel) and (TscGPLabel(Main.Components[i]).Name = 'lblSensor' + IntToStr(Sensor)) then
    begin
      TscGPLabel(Main.Components[i]).FillColor := Color;
    end;
  end;
end;

procedure SetCheckSensor(IsOn: Boolean);
begin
  SensorLabelInit;
  if IsOn then
  begin
    ShowLog('Sensor Status Check :: DCU_GetSensorStatus Start ');
//    CheckSensorTimer.Enabled := True;
    while IsOn do
    begin
      CheckSensorInfo;
    end;
  end
  else
  begin
    ShowLog('Sensor Status Check :: DCU_GetSensorStatus Stop ');
//    CheckSensorTimer.Enabled := False;
  end

end;

procedure FreeImage(image: PABC_IMAGE);
begin
  if image.info.iSize > 0 then
  begin
    FreeMemory(image.data);
//    image.data := nil;
  end;
  ZeroMemory(@image.info, SizeOf(ABC_IMAGE_INFO));
end;

procedure CopyImage(src: PABC_IMAGE; dest: PABC_IMAGE);
begin
  if src.info.iSize > 0 then
  begin
    CopyMemory(@dest.info, @src.info, SizeOf(ABC_IMAGE_INFO));
    dest.data := GetMemory(src.info.iSize);
    CopyMemory(dest.data, src.data, src.info.iSize);
  end
  else
    ZeroMemory(@dest.info, SizeOf(ABC_IMAGE_INFO));
end;

procedure FreeFeature(feature: PABC_FEATURE);
begin
  if feature.info.iSize > 0 then
  begin
    FreeMemory(feature.data);
//    feature.data := nil;
  end;
  ZeroMemory(@feature.info, SizeOf(ABC_FEATURE_INFO));
end;

procedure CopyFeature(src: PABC_FEATURE; dest: PABC_FEATURE);
begin
  CopyMemory(@dest.info, @src.info, SizeOf(ABC_FEATURE_INFO));
  dest.data := GetMemory(src.info.iSize);
  CopyMemory(dest.data, src.data, src.info.iSize);
end;

procedure ShowImage(image: TImage; data: ABC_IMAGE);
var
  mem: TMemoryStream;
  jpg: TJPEGImage;
begin
  if data.info.iSize = 0 then
    Exit;

  mem := TMemoryStream.Create;

  try
    mem.Write(data.data^, data.info.iSize);
    mem.Position := 0;

    if data.info.iImageType = Integer(IT_BITMAP) then
      image.Picture.Bitmap.LoadFromStream(mem)
    else if data.info.iImageType = Integer(IT_JPG) then
    begin
      jpg := TJPEGImage.Create;
      try
        jpg.LoadFromStream(mem);
        image.Picture.Assign(jpg);
      finally
        FreeAndNil(jpg);
      end;
    end
    else
    begin
      image.Picture.LoadFromStream(mem);
    end;
  finally
    FreeAndNil(mem);
  end;
end;

function GetMRP_Photo: Integer;
begin
  if FMRPFaceImg.info.iSize > 0 then
    PPR_FreeImage(@FMRPFaceImg);

  if PPR_GetImage(PSDMContext, PIT_VZ_PHOTO, @FMRPFaceImg) <> ABC_SUCCESS then
  begin
    ShowLog('PPR_GetImage Fail... - GetMRP_Photo');
    Result := ABC_FAIL;
  end
  else
  begin
    ShowLog('PPR_GetImage Success - PIT_VZ_PHOTO');
    ShowImage(Main.imgPhoto, FMRPFaceImg);
    Main.imgPhoto.Picture.Graphic.SaveToFile('MRPImage.jpg');
    JPG2BMP(@FMRPFaceImg, @FFacePrebmp);
    Result := ABC_SUCCESS;
  end;
end;

procedure SetModeRun;
begin
  FRunMode := True;

  LEDControl(DCU_LED_INDICATOR, DCU_LED_OFF);
  LEDControl(DCU_LED_INDICATOR, DCU_LED_GREEN_OFF);
  LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
  LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
  LEDControl(DCU_LED_PRINTER, DCU_LED_RED);
  LEDControl(DCU_LED_TOPWARNING, DCU_LED_OFF);
  LEDControl(DCU_LED_TOPPROCESS, DCU_LED_OFF);

  InitializeClick;
end;

procedure SetModeStop;
begin
  ViewModel.SetCurrentStep(0);

  LEDControl(DCU_LED_INDICATOR, DCU_LED_OFF);
  LEDControl(DCU_LED_INDICATOR, DCU_LED_GREEN);
  LEDControl(DCU_LED_PASSPORT, DCU_LED_OFF);
  LEDControl(DCU_LED_FINGERPRINT, DCU_LED_OFF);
  LEDControl(DCU_LED_PRINTER, DCU_LED_OFF);
  LEDControl(DCU_LED_TOPWARNING, DCU_LED_OFF);
  LEDControl(DCU_LED_TOPPROCESS, DCU_LED_OFF);

  DIM_SetBrightness(0);

  // ���� ���� ����
  PPR_ReadDocumentStop(PSDMContext);
  if not NOEQUIPMENT_RFCARD_VALUE then
    RFC_ReadStop;
  FNS_Cancel(FNDMContext);
  FCC_StopPreVerify();
  if not NOEQUIPMENT_2PERSON_VALUE then
  begin
    FCC_2PStop;
  end;

  SetFlash(fsMain, FlashRec[0].filename);
  SetFlash(fsSub, FlashRec[1].filename);

  FRunMode := False;
end;

{$REGION 'InitSDK'}
function InitSDK: Boolean;
var
  nRetVal: Integer;
  nDeviceType: Integer;
  sDeviceType: string;
begin
  Result := False;

  ShowLog('BorderController::InitSDK');

  if not InitDoorControlUnit then
  begin
    ShowLog(Format('>>>>>>>>DCU InitSDK::Error[%s]', [DCU_ErrorToDescription(nil, DCU_GetLastError(nil))]));
    Exit;
  end;

  if not InitPassportDevice then
  begin
    ShowLog(Format('>>>>Passport Reader InitSDK::Error[%s]', [PPR_ErrorToDescription(nil, PPR_GetLastError(nil))]));
    Exit;
  end;

  if not InitRFCardDevice then
  begin
    ShowLog(Format('>>>>RF Card Reader InitSDK::Error[%s]', ['']));
    Exit;
  end;

  if not InitFingerprintDevice then
  begin
    ShowLog(Format('>>>>Fingerprint Scanner InitSDK::Error[%s]', [FNS_ErrorToDescription(nil, FNS_GetLastError(nil))]));
    Exit;
  end;

  if not InitFingerAlgorithm then
  begin
    ShowLog(Format('>>>>Fingerprint Algorithm InitSDK::Error[%s]', [FNA_ErrorToDescription(nil, FNA_GetLastError(nil))]));
    Exit;
  end;

  if not InitCameraDevice then
  begin
    ShowLog(Format('>>>>Camera InitSDK::Error[%s]', ['']));
    Exit;
  end;

  if not InitLightDevice then
  begin
    ShowLog(Format('>>>>Light InitSDK::Error[%s]', ['']));
    Exit;
  end;

  Result := True;
end;

function InitDoorControlUnit: Boolean;
var
  info: ABC_DEVICE_INFO;
  src: AnsiString;
  nRetVal: Integer;
begin
  Result := False;

  if NOEQUIPMENT_DCU_VALUE then
  begin
    ShowLog('>>>>DCU TEST::������');
    Result := True;
    Exit;
  end
  else
  begin
    nRetVal := DCU_InitSDK;
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>DCU�ʱ�ȭ::����[%s]', [DCU_ErrorToDescription(nil, DCU_GetLastError(nil))]));
      Exit;
    end;

    if DCU_GetDeviceSource(@info) <> ABC_SUCCESS then
    begin
      ShowLog('>>>>DCU�ʱ�ȭ::�˻�����');
      Exit;
    end
    else
    begin
      if info.iDeviceCount > 0 then
      begin
        ShowLog(Format('>>>>DCU�ʱ�ȭ::��񰹼�=%d', [info.iDeviceCount]));
        src := info.strDeviceName[0];
      end
      else
      begin
        ShowLog('>>>>�����ǵ����ʱ�ȭ::������');
      end;
    end;
    ViewModel.SetDCU(0);
  end;

  Result := True;
end;

function InitPassportDevice: Boolean;
var
  info: ABC_DEVICE_INFO;
  src: AnsiString;
  nRetVal: Integer;
begin
  Result := False;

  if NOEQUIPMENT_PASSPORT_VALUE then
  begin
    ShowLog('>>>>�����ǵ���TEST::������');
    Result := True;
    Exit;
  end
  else
  begin
    nRetVal := PPR_InitSDK;
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>�����ǵ����ʱ�ȭ::����[%s]', [PPR_ErrorToDescription(nil, PPR_GetLastError(nil))]));
      Exit;
    end;

    if PPR_GetDeviceSource(@info) <> ABC_SUCCESS then
    begin
      ShowLog('>>>>�����ǵ����ʱ�ȭ::�˻�����');
      Exit;
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
          Exit;
        end;
      end
      else
      begin
        ShowLog('>>>>�����ǵ����ʱ�ȭ::������');
      end;
    end;
  ShowLog('>>>>�����ǵ����ʱ�ȭ::OK');
  end;

  Result := True;
end;

function InitFingerprintDevice: Boolean;
var
  nRetVal: Integer;
  info: ABC_DEVICE_INFO;
  src: AnsiString;
begin
  Result := False;
  ShowLog('>>������ĳ��Open');

  if NOEQUIPMENT_FINGER_VALUE then
  begin
    ShowLog('>>>>������ĳ��TEST::������');
    Result := True;
    Exit;
  end
  else
  begin
    nRetVal := FNS_InitSDK;
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>������ĳ���ʱ�ȭ::����[%s]', [FNS_ErrorToDescription(nil, FNS_GetLastError(nil))]));
      Exit;
    end;

    if FNS_GetDeviceSource(@info) <> ABC_SUCCESS then
    begin
      ShowLog('>>>>������ĳ���ʱ�ȭ::�˻�����');
      Exit;
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
          Exit;
        end;
      end
      else
      begin
        ShowLog('>>>>������ĳ���ʱ�ȭ::������');
      end;
    end;
    ShowLog('>>>>������ĳ���ʱ�ȭ::OK');
  end;

  Result := True;
end;

function InitFingerAlgorithm: Boolean;
var
  info: ABC_ALG_INFO;
  src: AnsiString;
begin
  Result := False;
  ShowLog('>>�����˰���Open');

  if NOEQUIPMENT_FNALG_VALUE then
  begin
    ShowLog('>>>>�����˰���TEST::������');
    Result := True;
    Exit;
  end
  else
  begin
    if FNA_InitSDK <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>�����˰����ʱ�ȭ::����[%s]', [FNA_ErrorToDescription(nil, FNA_GetLastError(nil))]));
      Exit;
    end;

    if FNA_GetAlgorithms(@info) <> ABC_SUCCESS then
    begin
      ShowLog('>>>>�����˰����ʱ�ȭ::�˻�����');
      Exit;
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
          Exit;
        end;
      end
      else
      begin
        ShowLog('>>>>�����˰����ʱ�ȭ::�˰������');
      end;
    end;
    ShowLog('>>>>�����˰����ʱ�ȭ::OK');
  end;

  Result := True;
end;

function InitCameraDevice: Boolean;
var
  nRetVal: Integer;
  info: ABC_ALG_INFO;
  src: AnsiString;
begin
  Result := False;
  ShowLog('>>ī�޶�Open');

  if NOEQUIPMENT_CAMERA_VALUE then
  begin
    ShowLog('>>>>ī�޶�TEST::������');
    Result := True;
    Exit;
  end
  else
  begin
    nRetVal := FCC_InitSDK;
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>ī�޶��ʱ�ȭ::����[%d]', [FCC_GetLastError]));
      Exit;
    end;
    ShowLog('>>ī�޶��ʱ�ȭ::OK');
  end;

  Result := True;
end;

function InitLightDevice: Boolean;
var
  nRetVal : Integer;
begin
  Result := False;
  ShowLog('>>����Open');

  if NOEQUIPMENT_LIGHT_VALUE then
  begin
    ShowLog('>>>>����TEST::������');
    Result := True;
    Exit;
  end
  else
  begin
    nRetVal := DIM_InitSDK;
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>�����ʱ�ȭ::����[%d]', [nRetVal]));
      Exit;
    end;
    nRetVal := DIM_SetConfig(7);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>����SetConfig::����[%d]', [nRetVal]));
      Exit;
    end;
    ShowLog('>>�����ʱ�ȭ::OK');
    Result := True;
  end;
end;

function InitRFCardDevice: Boolean;
var
  nRetVal : Integer;
begin
  Result := False;

  if NOEQUIPMENT_RFCARD_VALUE then
  begin
    ShowLog('>>>>RFCard TEST::������');
    Result := True;
    Exit;
  end
  else
  begin
    nRetVal := RFC_InitSDK;
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>RFCard �ʱ�ȭ::����[%d]', [nRetVal]));
      Exit;
    end;
    ShowLog('>>RFCard �ʱ�ȭ::OK');
  end;

  Result := True;
end;

function Initialize: Boolean;
var
  nRetVal, i: Integer;
begin
  Result := False;

  UnInitialize;
  WaitSleep(300);

  if not NOEQUIPMENT_DCU_VALUE then
  begin
    nRetVal := DCU_RegisterMessageHandle(DCDMContext, Main.Handle, WM_DC_DEVICE);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog('>>>>DCU Open::�޼�����Ͻ���');
      Exit;
    end;

    nRetVal := DCU_DeviceOpen(DCDMContext);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>DCU Open::����[%d]', [DCU_GetLastError(DCDMContext)]));
      Exit;
    end;
    ViewModel.SetDCU(1);
  end;

  if not NOEQUIPMENT_PASSPORT_VALUE then
  begin

    nRetVal := PPR_DeviceOpen(PSDMContext);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>�����ǵ���Open::����[%d]', [PPR_GetLastError(PSDMContext)]));
      Exit;
    end;
    ShowLog('>>�����ǵ���Open::OK');
    nRetVal := PPR_RegisterMessageHandle(PSDMContext, Main.Handle, WM_PS_DEVICE);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog('>>>>�����ǵ���Open::�޼�����Ͻ���');
      Exit;
    end;
  end;

  if not NOEQUIPMENT_RFCARD_VALUE then
  begin
    nRetVal := RFC_RegisterMessageHandle(Main.Handle);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog('>>>>RFCard Open::�޼�����Ͻ���');
      Exit;
    end;
    ShowLog('>>RFCard Open::OK');
  end;

  if not NOEQUIPMENT_FINGER_VALUE then
  begin
    FNS_Cancel(FNDMContext);

    if FNS_RegisterMessageHandle(FNDMContext, Main.Handle, WM_FN_DEVICE) <> ABC_SUCCESS then
    begin
      ShowLog('>>>>������ĳ��Open::�޼�����Ͻ���');
      Exit;
    end;

    if FNS_DeviceOpen(FNDMContext) <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>������ĳ��Open::����[%d]', [FNS_GetLastError(FNDMContext)]));
      Exit;
    end;
    ShowLog('>>������ĳ��Open::OK');
  end;

  if not NOEQUIPMENT_FNALG_VALUE then
  begin
    if FNA_Open(FNAMContext) <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>�����˰���Open::����[%d]', [FNS_GetLastError(FNAMContext)]));
      Exit;
    end;
    ShowLog('>>�����˰���Open::OK');
  end;

  if not NOEQUIPMENT_CAMERA_VALUE then
  begin
    if FCC_RegisterMessageHandle(Main.Handle, WM_FCNC_DEVICE) <> ABC_SUCCESS then
    begin
      ShowLog('>>>>ī�޶�Open::�޼�����Ͻ���');
      Exit;
    end;

    if FCC_ConnectServer(FNetworkInfo) <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>ī�޶�Open::����[%d]', [FCC_GetLastError]));
      ViewModel.SetConnectCAM(0);
      Exit;
    end;
    ViewModel.SetConnectCAM(1);

    ShowLog('>>ī�޶�Open::OK');
  end;

  if not NOEQUIPMENT_LIGHT_VALUE then
  begin
    nRetVal := DIM_Handle(Main.Handle);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog('>>>>����Open::�޼�����Ͻ���');
      Exit;
    end;
    nRetVal := DIM_Connect;
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog(Format('>>>>����Open::����[%d]', [nRetVal]));
      Exit;
    end;

    for i := 9 downto 0 do
    begin
      DIM_SetBrightness(i);
      WaitSleep(50);
    end;
    ShowLog('>>����Open::OK');
  end;

  Result := True;
end;

procedure UnInitialize;
var
  nRetVal: Integer;
begin
  if not NOEQUIPMENT_PASSPORT_VALUE then
  begin
    ShowLog('UnInitialize::PPR_DeviceClose');
    nRetVal := PPR_DeviceClose(PSDMContext);
  end;

  if not NOEQUIPMENT_RFCARD_VALUE then
  begin
    ShowLog('UnInitialize::RFCard_DeviceClose');
    nRetVal := RFC_ReadStop;
  end;

  if not NOEQUIPMENT_FINGER_VALUE then
  begin
    ShowLog('UnInitialize::FNS_DeviceClose');
    nRetVal := FNS_DeviceClose(FNDMContext);
  end;

  if not NOEQUIPMENT_FNALG_VALUE then
  begin
    ShowLog('UnInitialize::FNA_Close');
    nRetVal := FNA_Close(FNAMContext);
  end;

  if not NOEQUIPMENT_CAMERA_VALUE then
  begin
    ShowLog('UnInitialize::FCC_DisconnectServer');
    nRetVal := FCC_DisconnectServer;
  end;

  if not NOEQUIPMENT_LIGHT_VALUE then
  begin
    ShowLog('UnInitialize::DIM_Disconnect');
    DIM_SetBrightness(0);
    WaitSleep(200);
    nRetVal := DIM_DisConnect;
  end;

  if not NOEQUIPMENT_DCU_VALUE then
  begin
    ShowLog('UnInitialize::DCU_DeviceClose');
    LEDControl(DCU_LED_INDICATOR, DCU_LED_OFF);
    LEDControl(DCU_LED_INDICATOR, DCU_LED_GREEN_OFF);
    LEDControl(DCU_LED_PASSPORT, DCU_LED_OFF);
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_OFF);
    LEDControl(DCU_LED_PRINTER, DCU_LED_OFF);
    LEDControl(DCU_LED_TOPWARNING, DCU_LED_OFF);
    LEDControl(DCU_LED_TOPPROCESS, DCU_LED_OFF);
    nRetVal := DCU_DeviceClose(DCDMContext);
  end;
end;

function UnInitSDK: Boolean;
begin
  ShowLog('UnInitSDK::FCC_UnInitSDK');
  // ����� Access Violation
//  FCC_UnInitSDK;
  ShowLog('UnInitSDK::FNA_UnInitSDK');
  FNA_DestroyContext(FNAMContext);
  FNA_UnInitSDK;
  ShowLog('UnInitSDK::FNS_UnInitSDK');
  FNS_DestroyContext(FNDMContext);
  FNS_UnInitSDK;
  ShowLog('UnInitSDK::PPR_UnInitSDK');
  PPR_DestroyContext(PSDMContext);
  PPR_UnInitSDK;
  ShowLog('UnInitSDK::DCU_UnInitSDK');
  DCU_UnInitSDK;
  ShowLog('UnInitSDK::RFC_UnInitSDK');
  if not NOEQUIPMENT_RFCARD_VALUE then
    RFC_UnInitSDK;

  ShowLog('=================================');
  ShowLog('  BorderController::Exit');
  ShowLog('=================================');
end;
{$ENDREGION}

{$REGION 'ControlDevices'}
procedure DOORControl(iDoor : DC_DOOR_POSITION; iCmd: DC_DOOR_COMMAND; iAutoCloseTime: Integer);
begin
  if not NOEQUIPMENT_DCU_VALUE then
  begin
    if DCU_DoorControl(DCDMContext, iDoor, iCmd, iAutoCloseTime*1000) <> ABC_SUCCESS then
    begin
      ShowLog('DOORControl::�����������');
    end
    else
    begin
      ShowLog('DOORControl::iDoor : ' + DOORPositions[iDoor] + ' :: iCmd : ' + DOORCommands[iCmd]);
    end;
  end;
end;

procedure LEDControl(iLED : DC_LED_POSITION; iCmd : DC_LED_COMMAND);
begin
  if not NOEQUIPMENT_DCU_VALUE then
  begin
    if DCU_LEDControl(DCDMContext, iLED, iCmd) <> ABC_SUCCESS then
    begin
      ShowLog('LEDControl::LED������� : ' + IntToStr(DCU_GetLastError(DCDMContext)));
    end
    else
    begin
//      case iCmd of
//        DCU_LED_OFF:
//          begin
//            ShowLog('LEDControl::Position : ' + LEDPositions[iLED] + ' :: OFF : ' + LEDColors[iCmd]);
//          end;
//        DCU_LED_RED:
//          begin
//            ShowLog('LEDControl::Position : ' + LEDPositions[iLED] + ' :: RED : ' + LEDColors[iCmd]);
//          end;
//        DCU_LED_GREEN:
//          begin
//            ShowLog('LEDControl::Position : ' + LEDPositions[iLED] + ' :: GREEN : ' + LEDColors[iCmd]);
//          end;
//        DCU_LED_BLUE:
//          begin
//            ShowLog('LEDControl::Position : ' + LEDPositions[iLED] + ' :: BLUE : ' + LEDColors[iCmd]);
//          end;
//      end;
    end;
  end;
end;

procedure SetFlash(FlashSet : TFlashSet; strFile : string);
var
  filepath : string;
begin
  if not NODISPLAY_VALUE then
  begin
    if DisplayFlash <> nil then
    begin
      case FIsKor of // 0:�ѱ�,1:�����,2:�߱�,3:�Ϻ�
        0:
          begin
            if FileExists(media_directory + 'flash\KOR\' + strFile) then
              filepath := media_directory + 'flash\KOR\' + strFile;
          end;
        1:
          begin
            if FileExists(media_directory + 'flash\ENG\' + strFile) then
              filepath := media_directory + 'flash\ENG\' + strFile;
          end;
        2:
          begin
            if FileExists(media_directory + 'flash\CHN\' + strFile) then
              filepath := media_directory + 'flash\CHN\' + strFile;
          end;
        3:
          begin
            if FileExists(media_directory + 'flash\JPN\' + strFile) then
              filepath := media_directory + 'flash\JPN\' + strFile;
          end;
      end;

      case FlashSet of
        fsAll:
          begin
            DisplayFlash.SetFlashMain(filepath);
            DisplayFlash.SetFlashSub(filepath);
          end;
        fsMain:
          begin
            DisplayFlash.SetFlashMain(filepath);
          end;
        fsSub:
          begin
            DisplayFlash.SetFlashSub(filepath);
          end;
      end;
    end;
  end;
end;

procedure PlaySound(strFile : string);
var
  filepath : string;
begin
  case FIsKor of // 0:�ѱ�,1:�����,2:�߱�,3:�Ϻ�
    0:
      begin
        if FileExists(media_directory + 'wav\KOR\' + strFile + '.wav') then
          filepath := media_directory + 'wav\KOR\' + strFile + '.wav';
      end;
    1:
      begin
        if FileExists(media_directory + 'wav\ENG\' + strFile + '.wav') then
          filepath := media_directory + 'wav\ENG\' + strFile + '.wav';
      end;
    2:
      begin
        if FileExists(media_directory + 'wav\CHN\' + strFile + '.wav') then
          filepath := media_directory + 'wav\CHN\' + strFile + '.wav';
      end;
    3:
      begin
        if FileExists(media_directory + 'wav\JPN\' + strFile + '.wav') then
          filepath := media_directory + 'wav\JPN\' + strFile + '.wav';
      end;
  end;

  if FileExists(filepath) then sndPlaySound(PChar(filepath), SND_ASYNC);
end;
{$ENDREGION}


{$REGION 'BusinessLogic'}
procedure InitializeClick;
begin
  if not NODISPLAY_VALUE then
  begin
    // Show frmDisplayFlash
    if DisplayFlash = nil then DisplayFlash := TDisplayFlash.Create(nil);
    if Main.swiShowFlash.IsOn then DisplayFlash.Show;
    SetFlash(fsAll, FlashRec[0].filename);
  end;

  ShowLog('�ʱ�ȭ::����::�ڵ��ɻ�� ���� ��ȸ');
  if GetSvrData_InitValue('Y') = 0 then
  begin
    ShowLog('�ʱ�ȭ::����::�ڵ��ɻ�� ���� ��ȸ::����');
    FInitializeTag := 0;
    Exit;
  end;
  ShowLog('�ʱ�ȭ::����::�ڵ��ɻ�� ���� ��ȸ::����');

  if FInitializeTag <> 0 then
  begin
    ShowLog('�ʱ�ȭ::�ʱ�ȭ ����');
    UnInitialize;
    ShowLog('�ʱ�ȭ::�ʱ�ȭ ����::����');
  end;

  ShowLog('�ʱ�ȭ::�ʱ�ȭ');
  if not Initialize then
  begin
    ShowLog('�ʱ�ȭ::�ʱ�ȭ::����');
    FInitializeTag := 0;
    Exit;
  end;
  ShowLog('�ʱ�ȭ::�ʱ�ȭ::����::�ɻ���');

  InitVars(caAll);
  // StartProcess  UI�ʱ�ȭ, �����ʱ�ȭ, �����ǵ�����
  StartProcess;
end;

procedure StartProcess;
var
  nRetVal: Integer;
  nDetectMode: Integer;
  env: ABC_PS_RF_CARD_ENV;
  iMode: Integer;
begin
  if ViewModel.BtnCloseClick then Exit;
  if ViewModel.Detect2Person then Exit;
  

  if ViewModel.CurrentStep <> 0 then
  begin
    ShowLog('�����ǵ����::�������û����::g_iCurrentStep=' + IntToStr(ViewModel.CurrentStep));
    Exit;
  end;

  // ȯ�溯��, �۷ι����� �ʱ�ȭ
  if ViewModel.PassportTryCount = 1 then
    ViewModel.LoadConfig;

//  InsertImmigrationLogs('00');
  Processing(paInit);

  // ���� �ǵ��Ⱑ �����ϰ� �ִٸ� ���� ����
  PPR_ReadDocumentStop(PSDMContext);
  if not NOEQUIPMENT_RFCARD_VALUE then
    RFC_ReadStop;

  ShowLog('�����ǵ����');
  LEDControl(DCU_LED_PASSPORT, DCU_LED_BLUE);

  if ViewModel.PassportTryCount <= ViewModel.PassportMaxTry then
  begin
    ViewModel.SetPassportTryCount(ViewModel.PassportTryCount+1);
    SetFlash(fsMain, FlashRec[0].filename);
    SetFlash(fsSub, FlashRec[50].filename);

    // �������԰���

    // �¹��� ī�� ���� �б� ����
    PPR_GetRFCardEnv(PSDMContext, @env);

    // �¹����� ���ν��� ȯ�漳���� ����. �⺻�� 0. ���ν� x
    env.iType := ViewModel.FaceCrewPerson;
    PPR_SetRFCardEnv(PSDMContext, env);

    iMode := SM_WH + SM_IR + SM_UV + SM_RFCARD;

    if not NOEQUIPMENT_RFCARD_VALUE then
    begin
      nRetVal := RFC_Read;
      if nRetVal <> ABC_SUCCESS then
      begin
        RFC_ReadStop;
        ShowLog(Format('RF Card Read ���::����[%d]', [nRetVal]));
        Exit;
      end;
    end;

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

    // ���� ����
    ViewModel.CurrentStep := 1;
  end
  else
  begin
    ShowLog('�����ǵ����::����::�ݺ�����::ó������');
    InsertImmigrationLogs('12');
    SetFlash(fsSub, FlashRec[8].filename);
    PlaySound('008');
    WaitSleep(2000);
    InitVars(caAction);
    StartProcess;
  end;
end;

procedure EndProcess;
begin
//  Main.img2P := nil;
//  Main.imgPhoto := nil;
//  Main.imgRegPhoto := nil;
//  Main.imgEPhoto := nil;
//  Main.imgCurPhoto := nil;

  ShowLog('�ⱸ ����');
  ShowLog('===============================================');

  StartProcess;
end;

procedure TakeFingerprint;
begin
  if ViewModel.BtnCloseClick then Exit;

  if ViewModel.CurrentStep <> 1 then
    Exit;

  // 2�ΰ����� ���������� ��������
  if ViewModel.Detect2Person then
  begin
    // 2�� ���԰��� ����
    Exit;
  end;

  InsertImmigrationLogs('50');
  Processing(paScanning);
  ViewModel.SetFingerOk(0);

  if ViewModel.FingerTryCount = 1 then
  begin
    SetFlash(fsMain, FlashRec[13].filename);
    SetFlash(fsSub, FlashRec[3].filename);
    PlaySound('012');
  end;

  if not NOEQUIPMENT_FINGER_VALUE then
  begin
    FNS_Cancel(FNDMContext);
    if FNS_Capture(FNDMContext, Integer(CT_PLANE_ONE), 15000) <> ABC_SUCCESS then
    begin
      ShowLog(Format('��������û::����[%s]', [FNS_ErrorToDescription(FNDMContext, FNS_GetLastError(FNDMContext))]));
      LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
      RetryTakeFingerprint;
      Exit;
    end;
  end;

  ViewModel.SetCurrentStep(2);
end;

procedure RetryTakeFingerprint;
begin
  if ViewModel.BtnCloseClick then Exit;

  if ViewModel.FingerTryCount < ViewModel.FingerMaxTry then
  begin
    ViewModel.SetCurrentStep(1);
    // SetDisplayFinger
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_BLUE);
    SetFlash(fsMain, FlashRec[25].filename);
    if ViewModel.FingerTryCount > 1 then
      PlaySound('014_2')
    else
      PlaySound('014_1');
    ViewModel.SetFingerTryCount(ViewModel.FingerTryCount+1);
    InsertImmigrationLogs('52');
    TakeFingerprint;
  end
  else
  begin
    // ���� 3�� ����
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
    SetFlash(fsMain, FlashRec[35].filename);
    SetFlash(fsSub, FlashRec[3].filename);
    PlaySound('015');
    WaitSleep(2000);

    ShowLog('���� 3������: ' + inttostr(ViewModel.FingerFailStop));
    InsertImmigrationLogs('52');
    if ViewModel.FingerFailStop = 1 then
      PassengerBack(1);
  end;
end;

procedure MatchFingerprint;
var
  image: ABC_FN_IMAGE;
  imageFinger: ABC_IMAGE;
  fetSrc: ABC_FEATURE;
  iQuality: Integer;
  nRetVal: Integer;
  iMatchedResult: Integer;
  score: Single;
  fLMatchedScore, fRMatchedScore: Single;
  iResult1: Integer;
  iResult2: Integer;
begin
  if ViewModel.BtnCloseClick then Exit;

  ZeroMemory(@fetSrc.info, SizeOf(ABC_FEATURE_INFO));
  fetSrc.data := Nil;
  ShowLog('�����ν�::����');

  // 2�ΰ����� ���������� ��������
  if ViewModel.Detect2Person then
  begin
    // 2�� ���԰��� ����
    Exit;
  end;

  // �������� ������ Ư¡���� ���ٸ�...
  if (FRegFinger1.info.iSize <= 0) or (FRegFinger2.info.iSize <= 0) then
  begin
    ShowLog('�����ν�::�������Ư¡�� ȹ�� ����::�����û');
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
    SetFlash(fsMain, FlashRec[35].filename);
    SetFlash(fsSub, FlashRec[3].filename);
    PlaySound('015');
    WaitSleep(2000);
    PassengerBack(1);
    Exit;
  end;

  if AUTOTEST_VALUE then
  begin
    ShowLog('�����ν�::image :' + inttostr(SizeOf(image)));
    ShowLog('�����ν�::��濵��ȹ��::����');

    SetFlash(fsMain, FlashRec[23].filename);

    GetTestFingerBMP(@imageFinger);
  end
  else
  begin
    nRetVal := FNS_GetCapturedImage(FNDMContext, @image);
    if nRetVal <> ABC_SUCCESS then
    begin
      ShowLog('�����ν�::��濵��ȹ��::����');
      LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
      RetryTakeFingerprint;
      Exit;
    end;
    ShowLog('�����ν�::image :' + inttostr(SizeOf(image)));
    ShowLog('�����ν�::��濵��ȹ��::����');

    SetFlash(fsMain, FlashRec[23].filename);

    FNS_ConvertRawToBMP(@(image.segimages), @imageFinger);
  end;

  // 2017-08-22 dyddyd ::  ����Ʈ �˰��� Verify ���� BMP �̹��� ���
//  if FNA_Extract(FNAMContext, @(image.segimages), 0) <> ABC_SUCCESS then
  if FNA_Extract(FNAMContext, @(imageFinger), 0) <> ABC_SUCCESS then
  begin
    FNS_FreeFingerImage(@image);
    ShowLog('�����ν�::Ư¡������::����');
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
    RetryTakeFingerprint;
    Exit;
  end;
  ShowLog('�����ν�::Ư¡������::����');

  WaitSleep(100);
  // ǰ���˻� �� ǰ���� �������� �� ��� ����
  FNA_GetQuality(FNAMContext, @iQuality);
  if iQuality < 50 then
  begin
    FNS_FreeFingerImage(@image);
    ShowLog('�����ν�::����ǰ�� ���� �̴�::�����');
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
    RetryTakeFingerprint;
    Exit;
  end;

  if FNA_GetFeature(FNAMContext, @fetSrc) <> ABC_SUCCESS then
  begin
    FNS_FreeFingerImage(@image);
    ShowLog('�����ν�::���Ư¡��ȹ��::����');
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
    RetryTakeFingerprint;
    FNA_FreeFeature(@fetSrc);
    Exit;
  end;

  // ���� ���� ����
  FNA_SetParam(FNAMContext, PT_MATCH_LEVEL, ViewModel.FingerSecureLevel);

  iMatchedResult := 0;
  fLMatchedScore := 0;
  fRMatchedScore := 0;

  // ����1�� ��ȿ�ϸ� ��Ī
  if FRegFinger1.info.iSize > 0 then
  begin
    if FNA_Verify(FNAMContext, @fetSrc, @FRegFinger1, @score, @iResult1) = ABC_SUCCESS then
    begin
      ShowLog('�����ν�::#1 (' + IntToStr(iResult1) + ') - ' + FormatFloat('0.0000', score));

      if iResult1 = 1 then
        iMatchedResult := 2;  // 0 : ����ġ, 1 : ������, 2 : �޼�

      fLMatchedScore := score;
    end
    else
    begin
      FNS_FreeFingerImage(@image);
      ShowLog('�����ν�::#1::���� Ư¡��:' + PByteToString(fetSrc.data, fetSrc.info.iSize));
      LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
      RetryTakeFingerprint;
      FNA_FreeFeature(@fetSrc);
      Exit;
    end;
  end;

  // ����2�� ��ȿ�ϸ� ��Ī
  if FRegFinger2.info.iSize > 0 then
  begin
    if FNA_Verify(FNAMContext, @fetSrc, @FRegFinger2, @score, @iResult2) = ABC_SUCCESS then
    begin
      ShowLog('�����ν�::#2 (' + IntToStr(iResult2) + ') - ' + FormatFloat('0.0000', score));

      if iResult2 = 1 then
        iMatchedResult := 1; // 0 : ����ġ, 1 : ������, 2 : �޼�

      fRMatchedScore := score;
    end
    else
    begin
      FNS_FreeFingerImage(@image);
      ShowLog('�����ν�::#2::���� Ư¡��:' + PByteToString(fetSrc.data, fetSrc.info.iSize));
      LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
      RetryTakeFingerprint;
      FNA_FreeFeature(@fetSrc);
      Exit;
    end;
  end;

  // ������ ������ ���ٸ�...
  if (iResult1 = 0) and (iResult2 = 0) then
  begin
    ShowLog('�����ν�::����::����::�����');
    FNS_FreeFingerImage(@image);
    LEDControl(DCU_LED_FINGERPRINT, DCU_LED_RED);
    RetryTakeFingerprint;
    ShowLog('�����ν�::FNA_FreeFeature');
    FNA_FreeFeature(@fetSrc);
    Exit;
  end;
  LEDControl(DCU_LED_FINGERPRINT, DCU_LED_GREEN);
  ShowLog('�����ν� Ư¡������ : ' + inttostr(fetSrc.info.iSize));

  // Save Finger Log
  InsertImmigrationLogs('51');
  Processing(paFinger);

  // ���� �ʱ�ȭ
  ViewModel.SetFingerTryCount(1);

  // ���ܼ���
  ViewModel.SetCurrentStep(2);

  if FRegFinger1.info.iSize > 0 then
    FreeFeature(@FRegFinger1);
  if FRegFinger2.info.iSize > 0 then
    FreeFeature(@FRegFinger2);

  // ����� �̹��� ���� ����
  if image.segimages.info.iSize > 0 then
    FNS_FreeFingerImage(@image);
//  if imageFinger.info.iSize > 0 then
//    FreeImage(@imageFinger);

  FCheck2P := False;

  WaitSleep(100);

  // WalkThrough �ּ� Ǯ��
  if not NOEQUIPMENT_CAMERA_VALUE then
    FCC_StopPreVerify();

  // ��Ī �����̸� �ȸ� �ν� ����
  TakePhoto;
end;

procedure GetOpticalData;
var
  nRetVal: Integer;
  strMRZ: string;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡�� �ǵ���::�����ǵ�');
    SetModeStop;
    Exit;
  end;

  ViewModel.SetPassportOk(0);

  FDocType := DOC_TYPE_NO;
  nRetVal := PPR_GetData(PSDMContext, DT_DOC_TYPE, @FDocType);
  if (nRetVal = ABC_SUCCESS) then
  begin
    case FDocType of
      DOC_TYPE_NO:
        Main.pnlStatusBar.Caption := 'No document!!';
      DOC_TYPE_KOR_PASS:
        Main.pnlStatusBar.Caption := 'Korean Passport';
      DOC_TYPE_FOREIGN_PASS:
        Main.pnlStatusBar.Caption := 'Foreign Passport';
      DOC_TYPE_VISA:
        Main.pnlStatusBar.Caption := 'Visa';
      DOC_TYPE_NONE_ICAO:
        Main.pnlStatusBar.Caption := 'None ICAO Standard';
      DOC_TYPE_KOR_E_PASS:
        Main.pnlStatusBar.Caption := 'Korean e-Passort';
      DOC_TYPE_FOREIGN_E_PASS:
        Main.pnlStatusBar.Caption := 'Foreign e-Passport';
      DOC_TYPE_UNKNOWN:
        Main.pnlStatusBar.Caption := 'unknown';
    end;
  end;

  if not ((FDocType = DOC_TYPE_KOR_PASS) or (FDocType = DOC_TYPE_FOREIGN_PASS) or (FDocType = DOC_TYPE_KOR_E_PASS) or (FDocType = DOC_TYPE_FOREIGN_E_PASS)) then
  begin
    ShowLog('�����ǵ�::����/ī�� �ƴ�...');
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    ViewModel.SetCurrentStep(0);
    StartProcess;
    Exit;
  end;
  ShowLog('�����ǵ�::����');
  ZeroMemory(@FMRZData, sizeof(ABC_PS_MRZ));
  nRetVal := PPR_GetData(PSDMContext, DT_MRZ, @FMRZData);
  if (nRetVal <> ABC_SUCCESS) then
  begin
    ShowLog('�����ǵ�::����MRZ �б� ����');
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    SetFlash(fsSub, FlashRec[8].filename);
    PlaySound('008');
    WaitSleep(2000);
    ViewModel.SetCurrentStep(0);
    StartProcess;
    Exit;
  end;
  ShowLog(StrPas(FMRZData.mrz1));
  ShowLog(StrPas(FMRZData.mrz3));

  strMRZ := StrPas(FMRZData.mrz1) + StrPas(FMRZData.mrz3);

  // MRZ �νİ���� 88�������� �˻�
  if Length(strMRZ) <> 88 then
  begin
    ShowLog('�����ǵ�::mrz 88�ڸ��� �ƴ�: ' + strMRZ);
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    ViewModel.SetCurrentStep(0);
    StartProcess;
    Exit;
  end;

  ZeroMemory(@FMRZAllData, sizeof(ABC_PS_MRZ_DATA));
  nRetVal := PPR_GetData(PSDMContext, DT_MRZ_DATA, @FMRZAllData);

  ShowLog('�����ǵ�::�����ǵ����°˻�');
  if (nRetVal <> ABC_SUCCESS) or (FMRZAllData.DocType[0] = #0) then
  begin
    ShowLog('�����ǵ�::�����ǵ� �ڷ� ����');
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    ViewModel.SetCurrentStep(0);
    StartProcess;
    Exit;
  end;
  ShowLog('�����ǵ�::�����ǵ� ����');

  ZeroMemory(@FVIZData, sizeof(ABC_RP_VIZ_DATA));
//  nRetVal := PPR_GetVizResult(@g_VIZData);
//  if (nRetVal <> ABC_SUCCESS) then
//  begin
//    ShowLog('�����ǵ�::VIZData ����');
//    g_iCurrentStep := 0;
//    StartProcess;
//    Exit;
//  end;

  ShowLog('�����ǵ�::VIZData ����');

  ShowLog('PPR_GetData Success - DT_MRZ');
//  ShowLog('-----------------------------------------');
//  ShowLog('DocType         : ' + FMRZAllData.DocType);
//  ShowLog('IssuingState    : ' + FMRZAllData.IssuingState);
//  ShowLog('Name            : ' + FMRZAllData.Name);
//  ShowLog('PassportNum     : ' + FMRZAllData.PassportNum);
//  ShowLog('PassportNumCD   : ' + FMRZAllData.PassportNumCD);
//  ShowLog('PassportNumCDR  : ' + FMRZAllData.PassportNumCDR);
//  ShowLog('Nationality     : ' + FMRZAllData.Nationality);
//  ShowLog('Birth           : ' + FMRZAllData.Birth);
//  ShowLog('BirthCD         : ' + FMRZAllData.BirthCD);
//  ShowLog('BirthCDR        : ' + FMRZAllData.BirthCDR);
//  ShowLog('Sex             : ' + FMRZAllData.Sex);
//  ShowLog('Expiry          : ' + FMRZAllData.Expiry);
//  ShowLog('ExpiryCD        : ' + FMRZAllData.ExpiryCD);
//  ShowLog('ExpiryCDR       : ' + FMRZAllData.ExpiryCDR);
//  ShowLog('Optional        : ' + FMRZAllData.Optional);
//  ShowLog('OptionalCD      : ' + FMRZAllData.OptionalCD);
//  ShowLog('OptionalCDR     : ' + FMRZAllData.OptionalCDR);
//  ShowLog('CompositeCD     : ' + FMRZAllData.CompositeCD);
//  ShowLog('CompositeCDR    : ' + FMRZAllData.CompositeCDR);
//  ShowLog('-----------------------------------------');
  Main.lblName.Caption := FMRZAllData.Name;
  Main.lblBirthDay.Caption := FMRZAllData.Birth;
  Main.lblNationality.Caption := FMRZAllData.Nationality;
  Main.lblSex.Caption := FMRZAllData.Sex;
  Main.lblDocNumber.Caption := FMRZAllData.PassportNum;
  Main.lblType.Caption := FMRZAllData.DocType;
  Main.lblIssueCountry.Caption := FMRZAllData.IssuingState;
  Main.lblExpiryDate.Caption := FMRZAllData.Expiry;
  Main.lblPersonalData.Caption := FMRZAllData.Optional;

  nRetVal := GetMRP_Photo;
  if (nRetVal <> ABC_SUCCESS) then
  begin
    ShowLog('�����ǵ�::���п��ǻ��� ����');
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    ViewModel.SetCurrentStep(0);
    StartProcess;
    Exit;
  end;
  // Service Call, Passport Check
  nRetVal := PassportCheck(FDocType, FMRZAllData, False);
  case nRetVal of
    1: // Success
      begin

      end;
    0: // Fail to read passport
      begin
        SetFlash(fsSub, FlashRec[4].filename);
        PlaySound('005');
        WaitSleep(3000);
      end;
    -1: // Fail to connect to server or error etc.
      begin

      end;
    -2: // Fail to read and try again
      begin
        SetFlash(fsSub, FlashRec[8].filename);
        PlaySound('008');
        WaitSleep(3000);
      end;
    -3: // EPassport but it reads as normal passport
      begin
        SetFlash(fsSub, FlashRec[53].filename);
        WaitSleep(3000);
      end;
    -4: // No flight information
      begin
        SetFlash(fsSub, FlashRec[6].filename);
        PlaySound('006');
        WaitSleep(3000);
      end;
    -6: // Transit to domestic flight
      begin
        SetFlash(fsSub, FlashRec[55].filename);
        WaitSleep(3000);
      end;
  end;

  if nRetVal <= 0 then
  begin
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    InitVars(caAction);
    StartProcess;
    Exit;
  end;

  LEDControl(DCU_LED_PASSPORT, DCU_LED_GREEN);

  // ������������
  GetServiceFingerFeature(@FRegFinger1, @FRegFinger2);
  ShowLog(Format('ù��° �հ���::ũ��=%d', [FRegFinger1.info.iSize]));
  ShowLog(Format('�ι�° �հ���::ũ��=%d', [FRegFinger2.info.iSize]));
  // ��ϻ��� ��������
  GetServiceFaceImage(@FRegFace);
  ShowLog(Format('�ȸ��̹���::ũ��=%d', [FRegFace.info.iSize]));
  ShowImage(Main.imgRegPhoto, FRegFace);
//  Main.imgRegPhoto.Picture.Graphic.SaveToFile('RegFace.jpg');

  JPG2BMP(@FRegFace, @FFacePrebmp);

  ViewModel.SetPassportOk(1);

  // ���� ���� �ǵ� �غ�
  if ViewModel.UseEPass then
  begin
    if (FDocType = DOC_TYPE_KOR_E_PASS) then //and (ps_elec_pass_yn = 'Y') and (sNat_MasterSpec.Nat_ELEC_CERT_YN = '��') then // ���ڿ��� �ǵ� ����ΰ�?
    begin
      ShowLog('���� ���� ����');
      // ���ڿ��� �б�
//      ReadEPassport(1);
    end;
  end
  else
  begin
    ShowLog('�Ϲ� ���� ó��');
    // 21. ��� ��ȿ�� Ȯ�� �н��ϸ� �Ա� ���� ��û
    ShowLog('�Ա� ���� ��û');
    RequestFrontDoorOpen;
  end;
end;

procedure GetRFCardData;
var
  nRetVal: Integer;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡�� �ǵ���::RF Card �ǵ�');
    SetModeStop;
    Exit;
  end;

  ShowLog('�¹���ī�������б�::����');
  ZeroMemory(@FCrewData, sizeof(ABC_PS_CREW_DATA));

  if RFC_GetData(@FCrewData) <> ABC_SUCCESS then
  begin
    ShowLog('�¹���ī�������б�::����::�����');
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    SetFlash(fsSub, FlashRec[8].filename);
    PlaySound('008');
    WaitSleep(2000);
    ViewModel.SetCurrentStep(0);
    StartProcess;
    Exit;
  end;

  ShowLog('�¹���ī�������б�::�¹���ī���ڷ���°˻�');
  if FCrewData.RegNum[0] = #0 then
  begin
    ShowLog('�¹���ī�������б�::�¹���ī���ڷ� ����');
    ViewModel.SetCurrentStep(0);
    StartProcess;
    Exit;
  end;
  ShowLog('�¹���ī�������б�::����');

  ShowLog('PPR_GetData Success - DT_CREW_DATA');
  ShowLog('-----------------------------------------');
  ShowLog('RegNum         : ' + FCrewData.RegNum);
  ShowLog('RegDay         : ' + FCrewData.RegDay);
  ShowLog('Nationality    : ' + FCrewData.Nationality);
  ShowLog('KoreanName     : ' + FCrewData.KoreanName);
  ShowLog('PersonNum      : ' + FCrewData.PersonNum);
  ShowLog('EnglishName    : ' + FCrewData.EnglishName);
  ShowLog('Sex            : ' + FCrewData.Sex);
  ShowLog('BirthDay       : ' + FCrewData.BirthDay);
  ShowLog('IssuDay        : ' + FCrewData.IssuDay);
  ShowLog('ExpiryDay      : ' + FCrewData.ExpiryDay);
  ShowLog('Respons        : ' + FCrewData.Respons);
  ShowLog('Company        : ' + FCrewData.Company);
  ShowLog('PassNum        : ' + FCrewData.PassNum);
  ShowLog('PassIssuDay    : ' + FCrewData.PassIssuDay);
  ShowLog('PassExpiryDay  : ' + FCrewData.PassExpiryDay);
  ShowLog('-----------------------------------------');
  Main.lblName.Caption := FCrewData.EnglishName;
  Main.lblBirthDay.Caption := FCrewData.BirthDay;
  Main.lblNationality.Caption := FCrewData.Nationality;
  Main.lblSex.Caption := FCrewData.Sex;
  Main.lblDocNumber.Caption := FCrewData.RegNum;
  Main.lblType.Caption := 'Crew';
  Main.lblExpiryDate.Caption := FCrewData.ExpiryDay;
  Main.lblPersonalData.Caption := FCrewData.PersonNum;

  // �¹����� �ȸ��ǵ��� ���� ����

  // �¹��� �ɻ� ���� - ����
  // Service Call, RF Card Check
  nRetVal := RFCardCheck(FCrewData); // �¹���ī��� �ɻ縦 �����Ѵ�.
  case nRetVal of
    1: // Success
      begin

      end;
    0: // Fail to read passport
      begin
        SetFlash(fsSub, FlashRec[4].filename);
        PlaySound('005');
        WaitSleep(3000);
      end;
    -1: // Fail to connect to server or error etc.
      begin

      end;
    -2: // Fail to read and try again
      begin
        SetFlash(fsSub, FlashRec[8].filename);
        PlaySound('008');
        WaitSleep(3000);
      end;
    -3: // EPassport but it reads as normal passport
      begin
        SetFlash(fsSub, FlashRec[53].filename);
        WaitSleep(3000);
      end;
    -4: // No flight information
      begin
        SetFlash(fsSub, FlashRec[6].filename);
        PlaySound('006');
        WaitSleep(3000);
      end;
    -6: // Transit to domestic flight
      begin
        SetFlash(fsSub, FlashRec[55].filename);
        WaitSleep(3000);
      end;
  end;

  if nRetVal <= 0 then
  begin
    LEDControl(DCU_LED_PASSPORT, DCU_LED_RED);
    InitVars(caAction);
    StartProcess;
    Exit;
  end;


  if FCrewData.RegNum = '' then
    FPaxInfo.regNo := 'KORGAN1800000001';

  // ������������
  GetServiceFingerFeature(@FRegFinger1, @FRegFinger2);
  ShowLog(Format('ù��° �հ���::ũ��=%d', [FRegFinger1.info.iSize]));
  ShowLog(Format('�ι�° �հ���::ũ��=%d', [FRegFinger2.info.iSize]));
  // ��ϻ��� ��������
  GetServiceFaceImage(@FRegFace);
  ShowLog(Format('�ȸ��̹���::ũ��=%d', [FRegFace.info.iSize]));
  ShowImage(Main.imgRegPhoto, FRegFace);
//  Main.imgRegPhoto.Picture.Graphic.SaveToFile('RegFace.jpg');

  JPG2BMP(@FRegFace, @FFacePrebmp);

  ViewModel.SetPassportOk(2);

  ShowLog('�Ա� ���� ��û');
  RequestFrontDoorOpen;
end;

procedure TakePhoto;
var
  nRetVal: Integer;
  face1, face2: ABC_IMAGE;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡������::TakePhoto');
    Exit;
  end;

//  FreeImage(@face1bmp);
//  FreeImage(@face2bmp);

  if ViewModel.CurrentStep <> 2 then
    Exit;

  // 2�ΰ����� ���������� ��������
  if ViewModel.Detect2Person then
  begin
    // 2�� ���԰��� ����
    Exit;
  end;

  if not ViewModel.IsPreVerifyOk then
  begin
    InsertImmigrationLogs('60');
    Processing(paTaking);

    // �¹��� ����
    if (ViewModel.ConnectCAM = 0) or ((ViewModel.PassportOk = 2) and (ViewModel.FaceCrewPerson = 0)) then
    begin
      // �������
      DIM_SetBrightness(0);
      ShowLog(IfThen(ViewModel.ConnectCAM = 0, '�ȸ��ν� PASS : �ȸ� ���� ������ ����', IfThen(ViewModel.FaceCrewPerson = 0, '�ȸ��ν� PASS : �¹���', '�ȸ��ν� PASS : OTHER')));
      MatchPhoto;
    end
    else
    begin
      if ViewModel.FaceTryCount = 1 then
      begin
        SetFlash(fsMain, FlashRec[37].filename);
        SetFlash(fsSub, FlashRec[3].filename);
        PlaySound('017');
      end;
      // Light On
      DIM_SetBrightness(ViewModel.Bright);

      // g_iFaceTryCount 1�϶� �ȸ��ν� ó�� ȭ�� ����
      ShowLog('�ȸ��νĿ�û::Ƚ��=' + IntToStr(ViewModel.FaceTryCount) + ' g_MRPEFaceImg.info.iSize: ' + IntToStr(FMRPEFaceImg.info.iSize));
      if FMRPEFaceImg.info.iSize > 0 then
      begin
        CopyImage(@FMRPEFaceImg, @face1);  //���ڿ��ǻ���
        CopyImage(@FRegFace, @face2);      //��ϻ���
        ShowImage(Main.imgEPhoto, face1);
        ShowImage(Main.imgRegPhoto, face2);
      end
      else
      begin
        CopyImage(@FMRPFaceImg, @face1);  //�Ϲݿ��ǻ���
        CopyImage(@FRegFace, @face2);      //��ϻ���
        ShowImage(Main.imgPhoto, face1);
        ShowImage(Main.imgRegPhoto, face2);
      end;

      JPG2BMP(@face1, @FFace1bmp);
      JPG2BMP(@face2, @FFace2bmp);

      WaitSleep(200);

      if FFace2bmp.info.iSize = 0 then
      begin
        if FCC_RequestVerify(@FFace1bmp, @FFace1bmp, ViewModel.FaceScore / 100) <> ABC_SUCCESS then
//        if FCC_RequestFaceVerify(@FFace1bmp, @FFace1bmp, ViewModel.FaceScore / 100) <> ABC_SUCCESS then
        begin
          ShowLog('�ȸ��νĿ�û::����');
          RetryTakePhoto;
        end
        else
        begin
          ShowLog('�ȸ��νĿ�û::����');
          ViewModel.SetCurrentStep(3); // ���� ����
//          SetFlash(fsMain, FlashRec[40].filename);
        end;
      end
      else
      begin
        if FCC_RequestVerify(@FFace1bmp, @FFace2bmp, ViewModel.FaceScore / 100) <> ABC_SUCCESS then
//        if FCC_RequestFaceVerify(@FFace1bmp, @FFace2bmp, ViewModel.FaceScore / 100) <> ABC_SUCCESS then
        begin
          ShowLog('�ȸ��νĿ�û::����');
          RetryTakePhoto;
        end
        else
        begin
          ShowLog('�ȸ��νĿ�û::����');
          ViewModel.SetCurrentStep(3); // ���� ����
//          SetFlash(fsMain, FlashRec[40].filename);
        end;
      end;
    end;
  end
  // ViewModel.IsPreVerifyOk = True
  else
  begin
    ShowLog('�ȸ��ν�WalkThrough:: ����');
    if FMRPEFaceImg.info.iSize > 0 then
    begin
      CopyImage(@FMRPEFaceImg, @face1);  //���ڿ��ǻ���
      CopyImage(@FRegFace, @face2);      //��ϻ���
      ShowImage(Main.imgEPhoto, face1);
      ShowImage(Main.imgRegPhoto, face2);
    end
    else
    begin
      CopyImage(@FMRPFaceImg, @face1);  //�Ϲݿ��ǻ���
      CopyImage(@FRegFace, @face2);      //��ϻ���
      ShowImage(Main.imgPhoto, face1);
      ShowImage(Main.imgRegPhoto, face2);
    end;

    ViewModel.SetCurrentStep(3);
    SetFlash(fsMain, FlashRec[40].filename);
    MatchPrePhoto;
  end;
  // ����� ������� ����
  FreeImage(@face1);
  FreeImage(@face2);
  ShowLog( '�ȸ��νĿ�û(������� ����):�Ϸ�' );
//  nRetVal := FCC_SaveImageBuffer('.\TestFace.bmp');
end;

procedure RetryTakePhoto;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡������::RetryTakePhoto');
    Exit;
  end;

  // 2�ΰ����� ���������� ��������
  if ViewModel.Detect2Person then
  begin
    // 2�� ���԰��� ����
    Exit;
  end;

  if ViewModel.FaceTryCount < ViewModel.FaceMaxTry then
  begin
    ViewModel.SetCurrentStep(2);
    ViewModel.SetFaceTryCount(ViewModel.FaceTryCount+1);
    Processing(paCameraFail);
    WaitSleep(1000);
    InsertImmigrationLogs('62');
    Processing(paTaking);
    TakePhoto;
  end
  else
  begin
    // �ȸ��ν� ���� ������ �ʿ�� �ּ�����
    SetFlash(fsMain, FlashRec[41].filename);
    SetFlash(fsSub, FlashRec[3].filename);
    PlaySound('021');
    WaitSleep(2000);

    ShowLog('�ȸ��ν� 3������: ' + inttostr(ViewModel.FaceFailStop));
    InsertImmigrationLogs('62');
    Processing(paCameraFail);
    // 2017-04-26 dyddyd  3�� �����Ŀ��� ����ؾ���
    if ViewModel.FaceFailStop = 1 then
      PassengerBack(2);
  end;
end;

procedure MatchPhoto;
var
  iLimitScore : Integer;
  MatchedFaceImage : ABC_IMAGE;
  ResizeFaceImage : ABC_IMAGE;
  iMatchedCamIndex, iMatchedGallaryIndex : Integer;
  fMatchedFaceScore : Single;
  sMatchYn : string;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡������::MatchPhoto');
    Exit;
  end;

  iLimitScore := ViewModel.FaceScore;

  ZeroMemory(@MatchedFaceImage.info, SizeOf(ABC_IMAGE_INFO));
  ZeroMemory(@ResizeFaceImage.info, SizeOf(ABC_IMAGE_INFO));

  if not ViewModel.IsPreVerifyOk then
  begin
    ShowLog('�ȸ��������');
    // 2�ΰ����� ���������� ��������
    if ViewModel.Detect2Person then
    begin
      // 2�� ���԰��� ����
      Exit;
    end;

    iMatchedCamIndex := 0;
    iMatchedGallaryIndex := 0;
    fMatchedFaceScore := 0;

    if (ViewModel.ConnectCAM = 1) then
    begin
      ShowLog('�ȸ��������::���ſ�û');
      // �ȸ� ��Ī ��� ����
      FCC_GetVerifyResult(@iMatchedCamIndex, @iMatchedGallaryIndex, @fMatchedFaceScore, @MatchedFaceImage);
      ShowLog('�ȸ��������::���ſϷ�');

      ShowLog('�ȸ��������::' + Format('%s[%.4f][%d]', [IfThen(fMatchedFaceScore > 0, '����', '����'), fMatchedFaceScore, iLimitScore]) + ' g_iPassportOk: ' + inttostr(ViewModel.PassportOk) + ' g_iFaceCrewPerson: ' + inttostr(ViewModel.FaceCrewPerson));
      if (ViewModel.PassportOk <> 2) then //�¹����� �ȸ�������������
      begin
        if ViewModel.FaceFailStop = 1 then
        begin
          if ViewModel.FaceTryCount < ViewModel.FaceMaxTry then
          begin
            if Round(fMatchedFaceScore * 100) < iLimitScore then
            begin
              ShowLog('�ȸ麻������ ����[' + inttostr(Round(fMatchedFaceScore * 100)) + ']�� ����Ȯ�ε����ʽ��ϴ�!');
              SetFlash(fsMain, FlashRec[39].filename);
              SetFlash(fsSub, FlashRec[3].filename);
              PlaySound('033');
              WaitSleep(200);

              // ���� ���� ����
//              FCC_FreeImage(@MatchedFaceImage);
              //�Կ������ѱ�
              DIM_SetBrightness(ViewModel.Bright);
              RetryTakePhoto;
              Exit;
            end;
          end
          else
          begin
            if Round(fMatchedFaceScore * 100) < iLimitScore then
            begin
              ShowLog('�ȸ麻������ ����[' + inttostr(Round(fMatchedFaceScore * 100)) + ']�� ����Ȯ�ε����ʽ��ϴ�!: ' + inttostr(ViewModel.FaceTryCount));
              // ���� ����
              DIM_SetBrightness(0);
              ShowLog('�ȸ���������');
              RetryTakePhoto;
            end;
          end;
        end
        else
          ShowLog('�ȸ麻������ PASS�̰ų� �ȸ麻������ üũ���Ǿ������ʽ��ϴ�. Ȯ���ϼ���!');
      end;
    end
    else
    begin
      ShowLog('�ȸ��������::�ȸ鼭�����Ӿȵ�::�����������');
      Exit;
    end;

    if Round(fMatchedFaceScore * 100) < iLimitScore then
      sMatchYn := 'N'
    else
      sMatchYn := 'Y';

    // ����OFF
    DIM_SetBrightness(0);
    InsertImmigrationLogs('61');
    Processing(paCamera);

    ResizeImage(@MatchedFaceImage, @ResizeFaceImage);
    ShowImage(Main.imgCurPhoto, ResizeFaceImage);

//    FCC_FreeImage(@MatchedFaceImage);

//    FreeImage(@MatchedFaceImage);

    // ���� �ʱ�ȭ
    ViewModel.SetFaceTryCount(1);
    // �ȸ����� �����ص� ��� -> ����
    if (ViewModel.PassportOk <> 2) and (sMatchYn = 'N') then
      Exit;
  end;

  BioSuccess;
end;

procedure MatchPrePhoto;
var
  iLimitScore : Integer;
  MatchedFaceImage : ABC_IMAGE;
  ResizeFaceImage : ABC_IMAGE;
  iMatchedCamIndex, iMatchedGallaryIndex : Integer;
  fMatchedFaceScore : Single;
  sMatchYn : string;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡������::MatchPrePhoto');
    Exit;
  end;

  ShowLog('�ȸ��������');
  // 2�ΰ����� ���������� ��������
  if ViewModel.Detect2Person then
  begin
    // 2�� ���԰��� ����
    Exit;
  end;

  DIM_SetBrightness(0);

  ZeroMemory(@MatchedFaceImage.info, SizeOf(ABC_IMAGE_INFO));
  ZeroMemory(@ResizeFaceImage.info, SizeOf(ABC_IMAGE_INFO));
  iMatchedCamIndex := 0;
  iMatchedGallaryIndex := 0;
  fMatchedFaceScore := 0;

  if (ViewModel.ConnectCAM = 1) then
  begin
    ShowLog('�ȸ��������::���ſ�û');
    // �ȸ� ��Ī ��� ����
    FCC_GetVerifyResult(@iMatchedCamIndex, @iMatchedGallaryIndex, @fMatchedFaceScore, @MatchedFaceImage);
    ShowLog('�ȸ��������::���ſϷ�');

    if fMatchedFaceScore > 0 then
    begin
    end
    else
    begin
    end;

    ShowLog('�ȸ��������::' + Format('%s[%.4f][%d]', [IfThen(fMatchedFaceScore > 0, '����', '����'), fMatchedFaceScore, ViewModel.FaceScore]) + ' g_iPassportOk: ' + inttostr(ViewModel.PassportOk) + ' g_iFaceCrewPerson: ' + inttostr(ViewModel.FaceCrewPerson));
  end
  else
  begin
    ShowLog('�ȸ��������::�ȸ鼭�����Ӿȵ�::�����������');
    Exit;
  end;

  InsertImmigrationLogs('61');
  Processing(paCamera);

  ResizeImage(@MatchedFaceImage, @ResizeFaceImage);
  ShowImage(Main.imgCurPhoto, ResizeFaceImage);

  FCC_FreeImage(@MatchedFaceImage);

//  FreeImage(@MatchedFaceImage);

  // ���� �ʱ�ȭ
  ViewModel.SetFaceTryCount(1);
  ViewModel.SetIsPreVerifyOk(False);

  BioSuccess;
end;

procedure BioSuccess;
var
  nRetVal : Integer;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡������::BioSuccess');
    Exit;
  end;

  if not NOEQUIPMENT_2PERSON_VALUE then
  begin
    ShowLog('BioSuccess FCC_2PStop ' + #13 + #10);
    FCC_2PStop;
    Processing(pa2P);
  end;

  // �ɻ� ��� ��� ����
  if AUTOTEST_VALUE then
  begin
    ViewModel.SetAutoTestCount(ViewModel.AutoTestCount + 1);
    ShowLog('AutoTestCount : ' + IntToStr(ViewModel.AutoTestCount));
  end;

  // ���� �Ϸ� ó��
  ViewModel.SetCurrentStep(99);

  // ����ȭ�� �ⱹ/�Ա� ����
  if FHistObj.edGb = 'E' then
  begin
    SetFlash(fsMain, FlashRec[45].filename);
    PlaySound('025');
  end
  else
  begin
    SetFlash(fsMain, FlashRec[44].filename);
    PlaySound('024');
  end;

  // �ⱸ���� ����
  RequestExitDoorOpen;
end;

function PassengerBack(iType: Integer): Integer;
begin
  if ViewModel.BtnCloseClick then Exit;

  if not FRunMode then
  begin
    ShowLog('�������忡������::PassengerBack');
    Exit;
  end;

  ShowLog('�°� ���� ��û');

  ViewModel.SetCurrentStep(0);

  // �°� �Ա��� ���� ���·� ����.
  ViewModel.SetIsPassBack(True);

  if not NOEQUIPMENT_2PERSON_VALUE then
  begin
    if iType = 0 then
      FCC_2PStop;     //2014.12.31 �߰�
  end;

  DIM_SetBrightness(0);

  // �Ա��� ����
  if ViewModel.DCU = 1 then
  begin
    RequestFrontDoorOpen;
    case iType of
      0: // ���ܻ�Ȳ �°� ���� ��û
        begin
          SetFlash(fsMain, FlashRec[36].filename);
        end;
      1: // �����νĽ���
        begin
        end;
      2: // �ȸ��νĽ���
        begin
          SetFlash(fsMain, FlashRec[41].filename);
          PlaySound('021');
        end;
    end;
  end
  else
  begin
    WaitSleep(2000);
  end;

  Result := 1;
end;

procedure GetResult2P;
var
  nRetVal: Integer;
  iRst: Integer;
  probe: ABC_IMAGE;
  faceinfo: ABC_DETECT_RESULT;
begin
  if ViewModel.BtnCloseClick then Exit;

  ShowLog('FCC_Get2PResult ȣ�� ��');

  nRetVal := FCC_Get2PResult(@iRst, @probe, @faceinfo);
  if nRetVal = ABC_SUCCESS then
  begin
    ShowImage(Main.img2P, probe);
    // 2�ΰ��� ��� ����
    // �����������
  end;

  FCC_FreeImage(@probe);
  // �Ա��� ���� �ʰ� ������ ȣ��
  ViewModel.SetIsPassBack(True);
end;

procedure GetResult2P(ms: TMemoryStream);
var
  nRetVal: Integer;
begin
  if ViewModel.BtnCloseClick then Exit;

  ShowLog('FCC_Get2PResult ȣ�� ��');

  ms.Position := 0;
  Main.img2P.Picture.Bitmap.LoadFromStream(ms);
  // �Ա��� ���� �ʰ� ������ ȣ��
  ViewModel.SetIsPassBack(True);
end;
{$ENDREGION}


{$REGION 'DoorControl'}
procedure RequestFrontDoorOpen;
begin
  ShowLog('�Ա��������û::' + IfThen(not ViewModel.IsPassBack, '�������', '�������'));

  CheckPassengerOutTimer.Interval := (ViewModel.FrontDoorTimeout div 2) * 1000;
  CheckPassengerOutTimer.Tag := 0;
  CheckPassengerOutTimer.Enabled := true;

  if not ViewModel.IsPassBack then // ����
  begin
    FCheck2P := True;
    FCheckInside := False;
    // Display Passport Success
    SetFlash(fsMain, FlashRec[54].filename);
    SetFlash(fsSub, FlashRec[9].filename);
    PlaySound('009');

    PPR_ReadDocumentStop(PSDMContext);
    if not NOEQUIPMENT_RFCARD_VALUE then
      RFC_ReadStop;
    DOORControl(DCU_DOOR_POS_FRONT, DCU_DOOR_COMMAND_OPEN_A, ViewModel.FrontDoorTimeout);
    InsertImmigrationLogs('20');
    // Open A way
    if not NOEQUIPMENT_2PERSON_VALUE then
    begin
      ShowLog('FCC_2PStart ����');
      FCC_2PStart;
      Processing(paDetecting);
    end;

    if not NOEQUIPMENT_CAMERA_VALUE then
    begin
      // �¹����϶� ��ũ���� �н�
      if ViewModel.PassportOk <> 2 then
      begin
        // Walkthrough
        FCC_StopPreVerify();
        DIM_SetBrightness(ViewModel.Bright);
        if FCC_PreVerify(@FFacePrebmp, @FFacePrebmp, ViewModel.FaceScore / 100) <> ABC_SUCCESS then
        begin
          ShowLog('�ȸ��ν� �����Կ���û::����');
          FCC_StopPreVerify();
        end;
      end;
    end;

    if AUTOTEST_VALUE then
    begin
      WaitSleep(2000);
      DOORControl(DCU_DOOR_POS_FRONT, DCU_DOOR_COMMAND_CLOSE, ViewModel.FrontDoorTimeout);
//      FrontDoorClose;
    end;
  end
  else
  begin
    // Open B way
    DOORControl(DCU_DOOR_POS_FRONT, DCU_DOOR_COMMAND_OPEN_B, ViewModel.FrontDoorTimeout);
    InsertImmigrationLogs('20');
  end;
end;

procedure FrontDoorClose;
var
  iCheckInside : Integer;
begin
  // �Ա� ������ ����� ��
  // 1. �ʱ�ȭ
  // 2. ��������
  // 3. ����
  // 4. Ÿ�Ӿƿ�

  // ������ �ƴѻ���(���������� �Ա������� ����)�� �˻�
  if (not ViewModel.IsPassBack) and (ViewModel.CurrentStep <> 1) then
    Exit;

  ShowLog('�Ա�������');

  CheckPassengerOutTimer.Enabled := false;
  // ��ü�� ���� ��� �� ������
  iCheckInside := CheckInside(3);

  if not ViewModel.IsPassBack then // ����
  begin
    ShowLog('�Ա�������::��ü���ν°��˻�');
    if AUTOTEST_VALUE then
    begin
      MatchFingerprint;
    end
    else
    begin
      if ViewModel.PaxIn and (iCheckInside > 0) then
      begin
        // �����ǵ� �� �ɻ簡 �Ϸ���� ���� ���¶��, ����ó��
        if ViewModel.PassportOk = 0 then
        begin
          ShowLog('�Ա�������::��������::�����ǵ�����::�����û');
          PassengerBack(1);
          Exit;
        end;

        LEDControl(DCU_LED_FINGERPRINT, DCU_LED_BLUE);
        InsertImmigrationLogs('21');

        TakeFingerprint;
      end
      else if ViewModel.PaxIn and (iCheckInside = 0) then
      begin
        if CheckInside(3) = 0 then
        begin
          ShowLog('�Ա�������::�°�������::������üũ�ȵ�::�Ա�������');
          SetFlash(fsMain, FlashRec[52].filename);
          SetFlash(fsSub, FlashRec[52].filename);
          PlaySound('032');
          CheckPassengerOutTimer.Tag := 0;
          ViewModel.SetIsPassBack(False);
          ViewModel.SetCurrentStep(0);
          PPR_ReadDocumentStop(PSDMContext);
          if not NOEQUIPMENT_RFCARD_VALUE then
            RFC_ReadStop;
          Exit;
        end;
      end
      else
      begin
        ShowLog('�Ա�������::�°����Ծ���::�ʱ�ȭ');
        InitVars(caAction);
        StartProcess;
      end;
    end;
    // Service �Ա� �α�
  end
  else // ���� ������ �Ա�����
  begin
    ShowLog('�°������û::�Ա�������');

    FCheckInside := True;
    if iCheckInside > 0 then
    begin
      if CheckPassengerOutTimer.Tag >= 0 then
      begin
//        ShowLog('�°������û::�Ա�������::������::������ȣ��');
//        SetFlash(fsMain, FlashRec[52].filename);
//        SetFlash(fsSub, FlashRec[52].filename);
//        PlaySound('032');
        CheckPassengerOutTimer.Tag := 0;
        ViewModel.SetIsPassBack(False);
        ViewModel.SetCurrentStep(0);
//        PPR_ReadDocumentStop(PSDMContext);
//        if not NOEQUIPMENT_RFCARD_VALUE then
//          RFC_ReadStop;
      end;
    end
    else
    begin
      InitVars(caAction);
      StartProcess;
    end;

  end;
end;

procedure RequestExitDoorOpen;
begin
  if ViewModel.CurrentStep <> 99 then
    Exit;

  // 2�ΰ����� ���������� ��������
  if ViewModel.Detect2Person then
  begin
    // 2�� ���԰��� ����
    Exit;
  end;

  ShowLog('�ⱸ��������û');

  CheckPassengerOutTimer.Interval := (ViewModel.ExitDoorTimeout div 2) * 1000;
  CheckPassengerOutTimer.Tag := 0;
  CheckPassengerOutTimer.Enabled := true;

  // �ⱸ ����
  DOORControl(DCU_DOOR_POS_REAR, DCU_DOOR_COMMAND_OPEN_A, ViewModel.ExitDoorTimeout);
  InsertImmigrationLogs('80');

  ShowLog('�ɻ�����');

  if AUTOTEST_VALUE then
  begin
    WaitSleep(2000);
    ViewModel.SetCurrentStep(99);
    DOORControl(DCU_DOOR_POS_REAR, DCU_DOOR_COMMAND_CLOSE, ViewModel.ExitDoorTimeout);
    ExitDoorClose;
  end;
end;

procedure ExitDoorClose;
var
  iCheckInside : Integer;
begin
  if ViewModel.CurrentStep <> 99 then
    Exit;

  ShowLog('�ⱸ������');
  InsertImmigrationLogs('99');
  CheckPassengerOutTimer.Enabled := false;

  if AUTOTEST_VALUE then
  begin
    ShowLog('AUTOTEST CLOSE');
    InitVars(caAction);
    StartProcess;
  end
  else
  begin
    WaitSleep(1000);
    FCheckInside := True;
    iCheckInside := CheckInside(3);
    // ������
    if ViewModel.PaxIn and (iCheckInside > 0) then
    begin
      if CheckPassengerOutTimer.Tag >= 0 then
      begin
//        ShowLog('�ⱸ������::������::������ȣ��');
//        SetFlash(fsMain, FlashRec[52].filename);
//        SetFlash(fsSub, FlashRec[52].filename);
//        PlaySound('032');
//        ViewModel.SetCurrentStep(0);
//        PPR_ReadDocumentStop(PSDMContext);
//        if not NOEQUIPMENT_RFCARD_VALUE then
//          RFC_ReadStop;
      end
      else
      begin
        ShowLog('�ⱸ������::������::�����û�ݺ�');
        SetFlash(fsMain, FlashRec[42].filename);
        PlaySound('022');
        RequestExitDoorOpen;
      end;
    end
    else if ViewModel.PaxIn and (iCheckInside = 0) then
    begin
      ShowLog('�ⱸ������::�ⱸ�������::�������ȵ�::������ȣ��');
      SetFlash(fsMain, FlashRec[52].filename);
      SetFlash(fsSub, FlashRec[52].filename);
      PlaySound('032');
      ViewModel.SetCurrentStep(0);
      PPR_ReadDocumentStop(PSDMContext);
      if not NOEQUIPMENT_RFCARD_VALUE then
        RFC_ReadStop;
    end
    else
    begin
      ShowLog('�ⱸ������::�°�����Ϸ�');
//      ShowLog('�ⱸ ����');
      InitVars(caAction);
      EndProcess;
    end;
  end;
end;
{$ENDREGION}

{ TCheckPassengerOutTimer }

procedure TCheckPassengerOutTimer.OnCheckPassengerOutTimer(Sender: TObject);
begin
  if not FRunMode then Exit;
  
  CheckPassengerOutTimer.Tag := CheckPassengerOutTimer.Tag + 1;
  CheckPassengerOutTimer.Enabled := false;

  if ViewModel.CurrentStep = 1 then
  begin
    ShowLog('�Ա�����::�ż��������û');
    // �ż��� �������ּ���.
    SetFlash(fsSub, FlashRec[10].filename);
    PlaySound('010');
  end
  else
  begin
    // �Ա��� ���� ��Ȳ::�������е�
    if (ViewModel.CurrentStep <= 2) and ViewModel.IsPassBack then
    begin
      ShowLog('�Ա�����::�����û::�ż��������û');
      DoorControl(DCU_DOOR_POS_FRONT, DCU_DOOR_COMMAND_OPEN_B, ViewModel.FrontDoorTimeout);
    end;
    if ViewModel.CurrentStep = 99 then
    begin
      ShowLog('�ⱸ����::�����û::�ż��������û');
      DoorControl(DCU_DOOR_POS_REAR, DCU_DOOR_COMMAND_OPEN_A, ViewModel.ExitDoorTimeout);
    end;
  end;
end;

{ TCheckSensorTimer }

procedure TCheckSensorTimer.OnCheckSensorTimer(Sender: TObject);
begin
  CheckSensorTimer.Enabled := False;

  while CheckSensorTimer.Enabled do
  begin
    CheckSensorInfo;
  end;

  CheckSensorTimer.Enabled := True;
end;

initialization
  ViewModel := TViewModel.Create;
  CheckPassengerOutTimer := TCheckPassengerOutTimer.Create(nil);
  with CheckPassengerOutTimer do
  begin
    Interval := 10000;
    Enabled := False;
    Tag := 0;
    OnTimer := OnCheckPassengerOutTimer;
  end;
  CheckSensorTimer := TCheckSensorTimer.Create(nil);
  with CheckSensorTimer do
  begin
    Interval := 200;
    Enabled := False;
    Tag := 0;
    OnTimer := OnCheckSensorTimer;
  end;

finalization
  FreeAndNil(ViewModel);
  FreeAndNil(CheckPassengerOutTimer);
  FreeAndNil(CheckSensorTimer);


end.

