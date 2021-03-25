unit frmUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WUpdate, Vcl.StdCtrls, uVersionInfo, System.Win.Registry,
  Vcl.ComCtrls;

type
  TUpdateForm = class(TForm)
    WebUpdate1: TWebUpdate;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    procedure WebUpdate1AppDoClose(Sender: TObject);
    procedure WebUpdate1AppRestart(Sender: TObject; var Allow: Boolean);
    procedure WebUpdate1Status(Sender: TObject; StatusStr: string; StatusCode,
      ErrCode: Integer);
    procedure WebUpdate1FileProgress(Sender: TObject; FileName: string; Pos,
      Size: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    class function IsAvailable : Boolean;
    { Public declarations }
  end;

var
  UpdateForm: TUpdateForm;

implementation

uses
  frmMain;

{$R *.dfm}

const
  D102 = '\Software\Embarcadero\BDS\19.0';
  C102 = '\Software\Embarcadero\C++Builder\19.0';

procedure TUpdateForm.FormActivate(Sender: TObject);
var
  VerInfo: TOSVersionInfo;
  OSVersion: string;
  DevPlatforms: string;

  function IsPlatformInstalled (const Platform: string): Boolean;
  var
    Reg: TRegistry;
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      Result := Reg.OpenKey (Platform, False);
      Reg.CloseKey;
    finally
      Reg.Free
    end;
  end;
begin
  VerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(verinfo);
  OSVersion := IntToStr(verinfo.dwMajorVersion)+':'+IntToStr(verinfo.dwMinorVersion);

  DevPlatforms := '';

  label1.Caption := fnGetVersionInfo(tvFileVersion);

  WebUpdate1.PostUpdateInfo.Data :=
    WebUpdate1.PostUpdateInfo.Data + '&TIME='+FormatDateTime('yyyy/mm/dd@hh:nn',Now)+'&OS='+OSVersion+'&DEV='+DevPlatforms;

  WebUpdate1.DoUpdate;
end;

class function TUpdateForm.IsAvailable: Boolean;
begin
  with TUpdateForm.Create(nil) do
    try
      Result := WebUpdate1.NewVersionAvailable;
    finally
      Free;
    end;
end;

procedure TUpdateForm.WebUpdate1AppDoClose(Sender: TObject);
begin
  Close;
end;

procedure TUpdateForm.WebUpdate1AppRestart(Sender: TObject; var Allow: Boolean);
begin
  if MessageDlg('프로그램을 재시작하시겠습니까?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Allow := True;
  end
  else
  begin
    Allow := False;
    Application.Terminate;
  end;
end;

procedure TUpdateForm.WebUpdate1FileProgress(Sender: TObject; FileName: string;
  Pos, Size: Integer);
begin
  progressbar1.max:=size;
  progressbar1.position:=pos;
end;

procedure TUpdateForm.WebUpdate1Status(Sender: TObject; StatusStr: string;
  StatusCode, ErrCode: Integer);
begin
  if StatusCode = WebUpdateNoNewVersion then
//    MessageDlg('No new version available',mtinformation,[mbok],0);

  if StatusCode = WebUpdateNotFound then
//    MessageDlg(StatusStr + #13'Update discontinued',mtinformation,[mbok],0);
end;

end.
