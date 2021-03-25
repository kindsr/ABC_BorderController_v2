unit AutoUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, ExtCtrls, StdCtrls, ComCtrls, IniFiles,
  IdFTPCommon, IdFTPList, IdFTPServer, IdExplicitTLSClientServerBase, uViewModel;

const
  MAXTIDENT = 30;
  TUXWS     = 'TMAX.DLL';
  FTP_USERID = 'tmaxdev';
  FTP_PASSWD = 'tmax1';
  FTP_HOST   = '192.168.2.23';

type
  TAutoUpdateForm = class(TForm)
    IdFTP1: TIdFTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Panel1: TPanel;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    lblTotal: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    function GetFileDateTime(FileName: string): TDateTime;
    function SetFileDateTime(const FileName: String;
      const FileDate: TDateTime): Boolean;
    { Private declarations }
  public
    function Update: Boolean;
    { Public declarations }
  end;

var
  AutoUpdateForm: TAutoUpdateForm;

  FTP_PATH  : string;
  TMP_PATH  : string;
  DEST_PATH : string;
  UpdateIni : TIniFile;

implementation

{$R *.dfm}

procedure TAutoUpdateForm.FormCreate(Sender: TObject);
begin
  UpdateIni := TIniFile.Create(ExtractFilePath(ExcludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))))+'Ini\AutoUpdate.Ini');

  try
    FTP_PATH := UpdateIni.ReadString('PATH', 'FTP_PATH', 'ABC\');
    TMP_PATH := UpdateIni.ReadString('PATH', 'TMP_PATH', 'C:\Temp\');
    DEST_PATH := UpdateIni.ReadString('PATH', 'DEST_PATH', ExtractFilePath(ParamStr(0)));
  finally
    UpdateIni.Free;
  end;

  try
    IdFTP1.Disconnect;
    IdFTP1.Username := 'gansvr';
    IdFTP1.Password := '!1gan123';
    IdFTP1.Host := 'file.g-antech.com';

    IdFTP1.Connect;

    IdFTP1.ChangeDir(FTP_PATH);
    IdFTP1.TransferType := ftBinary;
  except
  end;

  lblTotal.Caption := '';
end;

function TAutoUpdateForm.Update: Boolean;
var
  Index, i: Integer;
  Item: TIdFTPListItem;

  sSourceFile: string;
  sDestFile: string;
  slFileList : TStringList;

  BatchFile: TextFile;
  sOrg: string;
  sNew: string;
begin
  Result := False;

  sSourceFile := '';
  sDestFile := '';
  slFileList := TStringList.Create;

  try
  //  IdFTP1.ListParserClass := TIdFTPLPUnix;
    IdFTP1.List(nil);
    ProgressBar1.Max := IdFTP1.DirectoryListing.Count;
    ProgressBar1.Position := 0;

    for Index := 0 to IdFTP1.DirectoryListing.Count - 1 do
    begin

      Item := IdFTP1.DirectoryListing.Items[Index];

      if FileExists(TMP_PATH+Item.FileName) then
        DeleteFile(TMP_PATH+Item.FileName);

      sSourceFile := FormatDateTime('yyyy-mm-dd hh:nn:ss', Item.ModifiedDate);
      
      if FileExists(DEST_PATH+Item.FileName) then
        sDestFile := FormatDateTime('yyy-mm-dd hh:nn:ss', GetFileDateTime(DEST_PATH+Item.FileName));

      if ((Item.FileName <> EmptyStr) and
         (((sSourceFile <> EmptyStr) and (sDestFile <> EmptyStr)) and (sSourceFile <> sDestFile)))  then
      begin
        IdFTP1.Get(Item.FileName, TMP_PATH+Item.FileName);

        SetFileDateTime(TMP_PATH+Item.FileName, StrToDateTime(sSourceFile));

        slFileList.Add(Item.FileName);
      end;
    end;

    Application.ProcessMessages;

    if slFileList.Count > 0 then
    begin
      if FileExists(DEST_PATH + ChangeFileExt(ParamStr(0),'.bat')) then
          DeleteFile(DEST_PATH + ChangeFileExt(ParamStr(0),'.bat'));

      AssignFile(BatchFile, ChangeFileExt(ParamStr(0),'.bat'));
      Rewrite(BatchFile);
      Writeln(BatchFile, '@echo off');
      Writeln(BatchFile, ':try');
//      Writeln(BatchFile, 'del "' + DEST_PATH+Item.FileName + '"');
      for i := 0 to slFileList.Count - 1 do
      begin
        ProgressBar1.StepBy(i);
        lblTotal.Caption := IntToStr(ProgressBar1.Position * 100 div ProgressBar1.Max ) + '% done.';
        Application.ProcessMessages;
        Writeln(BatchFile, 'taskkill /im ' + slFileList.Strings[i]);
        Writeln(BatchFile, 'ping 127.0.0.1 -n 1 > nul');
        Writeln(BatchFile, 'move "' + DEST_PATH+slFileList.Strings[i] + '" "' +
                DEST_PATH+ChangeFileExt(slFileList.Strings[i],'') + '_' +
                FormatDateTime('yyyymmdd', now) +
                ExtractFileExt(slFileList.Strings[i]) + '"');
        Writeln(BatchFile, 'ping 127.0.0.1 -n 2 > nul');
        Writeln(BatchFile, 'if exist "' + DEST_PATH+slFileList.Strings[i] + '"' + ' goto try');
        Writeln(BatchFile,  'copy "' + TMP_PATH+slFileList.Strings[i] + '" "' +  DEST_PATH+slFileList.Strings[i] + '"' );
      end;

      Writeln(BatchFile, 'ping 127.0.0.1 -n 2 > nul');
      Writeln(BatchFile, ParamStr(0));
//      Writeln(BatchFile, 'del "' + ChangeFileExt(ParamStr(0),'.bat') + '"');
      CloseFile(BatchFile);
      Result := True;
    end;
  finally
    slFileList := nil;
    slFileList.Free;
  end;

  IdFTP1.DisConnect;
  if Result then
  begin
    ShowMessage('업데이트가 완료되어 프로그램을 재시작 합니다.');
    uViewModel.FormClose;
    Winexec(PAnsiChar(AnsiString(ChangeFileExt(ParamStr(0),'.bat'))), SW_HIDE);
    Halt;
  end;
end;

function TAutoUpdateForm.GetFileDateTime(FileName: string): TDateTime;
var intFileAge: LongInt;
begin
  intFileAge := FileAge(FileName);
  if intFileAge = -1 then
    Result := 0
  else
    Result := FileDateToDateTime(intFileAge)
end;

function TAutoUpdateForm.SetFileDateTime(
   Const FileName : String;
   Const FileDate : TDateTime): Boolean;
var
  FileHandle : THandle;
  FileSetDateResult : Integer;
begin
  try
    try
      FileHandle := FileOpen
      (FileName,
      fmOpenWrite OR fmShareDenyNone) ;
      if FileHandle > 0 Then begin
        FileSetDateResult :=
        FileSetDate(
        FileHandle,
        DateTimeToFileDate(FileDate)) ;
        result := (FileSetDateResult = 0) ;
      end;
    except
      Result := False;
    end;
  finally
    FileClose (FileHandle) ;
  end;
end;

procedure TAutoUpdateForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAutoUpdateForm.FormShow(Sender: TObject);
begin
  Update;
end;

end.
