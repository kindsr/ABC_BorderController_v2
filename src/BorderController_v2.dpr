program BorderController_v2;

uses
  Windows,
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Main},
  frmDisplayFlash in 'frmDisplayFlash.pas' {DisplayFlash},
  ABC_DC_DM in 'ABC_DC_DM.pas',
  ABC_FC_DM in 'ABC_FC_DM.pas',
  ABC_FN_DM in 'ABC_FN_DM.pas',
  ABC_PS_DM in 'ABC_PS_DM.pas',
  FaceInfo in 'FaceInfo.pas',
  FingerInfo in 'FingerInfo.pas',
  HistObj in 'HistObj.pas',
  KioskInfo in 'KioskInfo.pas',
  CrewInfo in 'CrewInfo.pas',
  PaxInfo in 'PaxInfo.pas',
  ResInfo in 'ResInfo.pas',
  S510 in 'S510.pas',
  uConst in 'uConst.pas',
  uFunction in 'uFunction.pas',
  uHTTP in 'uHTTP.pas',
  uService in 'uService.pas',
  uVersionInfo in 'uVersionInfo.pas',
  frmControlDevice in 'frmControlDevice.pas' {ControlDevice},
  uViewModel in 'uViewModel.pas',
  frmUpdate in 'frmUpdate.pas' {UpdateForm},
  PassportInfo in 'PassportInfo.pas';

{$R *.res}

var
  hm: THandle;
  UpdateForm : TUpdateForm;
begin
  hm := CreateMutex(Nil, False, 'BorderControllerMutex');
  if WaitforSingleObject(hm, 0) <> Wait_TimeOut then
  begin
    if TUpdateForm.IsAvailable then
    begin
      Application.Initialize;
      Application.CreateForm(TUpdateForm, UpdateForm);
      Application.Run;
    end
    else
    begin
      Application.Initialize;
      Application.CreateForm(TMain, Main);
      Application.Run;
    end;
  end;
end.
