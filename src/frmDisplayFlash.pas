{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit frmDisplayFlash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, OleCtrls, ShockwaveFlashObjects_TLB;

// 키보드 훅 구조체
type
  PKeyHookStruct = ^TKeyHookStruct;

  TKeyHookStruct = record
    vkCode: Integer;
    ScanCode: Integer;
    Flags: Integer;
    Time: Integer;
    dwExtraInfo: Integer;
  end;

type
  TFlashRec = record
    filename : string;
    desc : string;
  end;

const
  FlashRec : array[0..57] of TFlashRec = (
    (filename: '000.swf'; 			desc: '초기화면'                         ), // 0
    (filename: '001.swf'; 			desc: '운영종료'                         ), // 1
    (filename: '002.swf'; 			desc: '여권판독중'                       ), // 2
    (filename: '003.swf'; 			desc: '앞사람이용중'                     ), // 3
    (filename: '004.swf'; 			desc: '이용대상자가아님'                 ), // 4
    (filename: '005.swf'; 			desc: '자동심사대이용불가'               ), // 5
    (filename: '006.swf'; 			desc: '항공사탑승정보없음'               ), // 6
    (filename: '007.swf'; 			desc: '여권판독실패다시시도'             ), // 7
    (filename: '008.swf'; 			desc: '여권판독실패다시시도'             ), // 8
    (filename: '009.swf'; 			desc: '확인.안으로이동'                  ), // 9
    (filename: '010.swf'; 			desc: '안으로이동반복'                   ), // 10
    (filename: '011.swf'; 			desc: '문안닫힘.짐걸림'                  ), // 11
    (filename: '012_aa.swf';		desc: '오른손엄지'                       ), // 12
    (filename: '012_ab.swf';		desc: '오른손검지'                       ), // 13
    (filename: '012_ac.swf';		desc: '오른손중지'                       ), // 14
    (filename: '012_ba.swf';		desc: '왼손엄지'                         ), // 15
    (filename: '012_bb.swf';		desc: '왼손검지'                         ), // 16
    (filename: '012_bc.swf';		desc: '왼손중지'                         ), // 17
    (filename: '012_ca.swf';		desc: '오른손엄지'                       ), // 18
    (filename: '012_cb.swf';		desc: '오른손검지'                       ), // 19
    (filename: '012_cc.swf';		desc: '오른손중지'                       ), // 20
    (filename: '012_ll.swf';		desc: '왼손'                             ), // 21
    (filename: '012_rr.swf';		desc: '오른손'                           ), // 22
    (filename: '013.swf'; 			desc: '지문인식중'                       ), // 23
    (filename: '014_aa.swf'; 		desc: '오른손엄지'                       ), // 24
    (filename: '014_ab.swf'; 		desc: '오른손검지'                       ), // 25
    (filename: '014_ac.swf'; 		desc: '오른손중지'                       ), // 26
    (filename: '014_ba.swf'; 		desc: '왼손엄지'                         ), // 27
    (filename: '014_bb.swf'; 		desc: '왼손검지'                         ), // 28
    (filename: '014_bc.swf'; 		desc: '왼손중지'                         ), // 29
    (filename: '014_ca.swf'; 		desc: '오른손엄지'                       ), // 30
    (filename: '014_cb.swf'; 		desc: '오른손검지'                       ), // 31
    (filename: '014_cc.swf'; 		desc: '오른손중지'                       ), // 32
    (filename: '014_ll.swf'; 		desc: '왼손'                             ), // 33
    (filename: '014_rr.swf'; 		desc: '오른손'                           ), // 34
    (filename: '015.swf';				desc: '지문일치실패.밖으로이동'          ), // 35
    (filename: '016.swf';				desc: '밖으로이동반복'                   ), // 36
    (filename: '017.swf';				desc: '카메라여기를보세요'               ), // 37
    (filename: '018.swf';				desc: '발판위치'                         ), // 38
    (filename: '019.swf';				desc: '카메라다시보기'                   ), // 39
    (filename: '020.swf';				desc: '얼굴인식중'                       ), // 40
    (filename: '021.swf';				desc: '얼굴일치실패.밖으로이동'          ), // 41
    (filename: '022.swf';				desc: '밖으로이동반복'                   ), // 42
    (filename: '023.swf';				desc: '출구밖으로이동'                   ), // 43
    (filename: '024.swf';				desc: '심사완료.안녕'                    ), // 44
    (filename: '025.swf';				desc: '심사완료.귀국환영'                ), // 45
    (filename: '026.swf';				desc: '관리자호출'                       ), // 46
    (filename: '027.swf';				desc: '점검중'                           ), // 47
    (filename: '028.swf';				desc: '축산관계자'                       ), // 48
    (filename: '029.swf';				desc: '안내문출력'                       ), // 49
    (filename: '030.swf';				desc: '여권대기'                         ), // 50
    (filename: '031.swf';				desc: '문안닫힘.짐걸림'                  ), // 51
    (filename: '032.swf';				desc: '관리자문의'                       ), // 52
    (filename: '034.swf';				desc: '여권판독실패.다시시도'            ), // 53
    (filename: '035.swf';				desc: '발판'                             ), // 54
    (filename: '036.swf';				desc: '환승전용기승객.관리자문의'        ), // 55
    (filename: '037.swf';				desc: '관리자확인중'                     ), // 56
    (filename: '038.swf';				desc: '2인진입'                          )  // 57
  );

type
  TDisplayFlash = class(TForm)
    FlashMain: TShockwaveFlash;
    FlashSub: TShockwaveFlash;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetFlashMain(filepath : string);
    procedure SetFlashSub(filepath: string);
    { Public declarations }
  end;

var
  DisplayFlash: TDisplayFlash;
  HookID: HHOOK;

implementation

uses frmMain;

{$R *.dfm}


function LLKeyHookFunc(HookCode: Integer; KeyCode: wParam; kStrokeInfo: lParam): LResult; stdcall;
var
  PKeyHook: PKeyHookStruct;
begin
  // 키 정보 받아오기
  PKeyHook := Ptr(kStrokeInfo);

  if HookCode >= 0 then
  begin
    if pKeyHook.vkCode = VK_F10 then
    begin
      SetWindowPos(Main.Handle, HWND_TOP, Main.Left, Main.Top, Main.Width, Main.Height, SWP_SHOWWINDOW);
    end;
  end;

  // 필터링 된 키가 아니라면 계속 진행
  Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
end;

procedure KeybdHook;
const
  WH_KEYBOARD_LL = 13;
begin
  HookID := SetWindowsHookEx(WH_KEYBOARD_LL, @LLKeyHookFunc, hInstance, 0);
  if HookID=0 then RaiseLastOSError;
end;

procedure KeybdUnhook;
begin
  if HookID <> 0 then
    UnHookWindowsHookEx(HookID);
end;

procedure TDisplayFlash.FormActivate(Sender: TObject);
begin
  if Tag = 1 then Exit;
  Tag := 1;

  if Screen.MonitorCount = 1 then
  begin
    FlashSub.Hide;
    FlashMain.Align := alClient;
  end
  else if Screen.MonitorCount = 2 then
  begin
    Top := Screen.Monitors[0].Top;
    Height := Screen.Monitors[0].Height;
    Left := Screen.Monitors[0].Left;//-1024;//Screen.Monitors[1].Left;
    Width := Screen.Monitors[0].Width + Screen.Monitors[1].Width;

    FlashMain.Top := Screen.Monitors[0].Top;
    FlashMain.Height := Screen.Monitors[0].Height;
    FlashMain.Left := 0;//Abs(Screen.Monitors[0].Width);// Screen.Monitors[0].Left;
    FlashMain.Width := Screen.Monitors[0].Width;

    FlashSub.Top := Screen.Monitors[1].Top;
    FlashSub.Height := Screen.Monitors[1].Height;
    FlashSub.Left := 1024;//0;//Screen.Monitors[1].Left;
    FlashSub.Width := Screen.Monitors[1].Width;
  end
  else if Screen.MonitorCount >= 3 then
  begin
    Top := Screen.Monitors[0].Top;
    Height := Screen.Monitors[0].Height;
    Left := -2048;//Screen.Monitors[1].Left;
    Width := Screen.Monitors[0].Width + Screen.Monitors[1].Width;

    FlashMain.Top := Screen.Monitors[0].Top;
    FlashMain.Height := Screen.Monitors[0].Height;
    FlashMain.Left := Abs(Screen.Monitors[0].Width);// Screen.Monitors[0].Left;
    FlashMain.Width := Screen.Monitors[0].Width;

    FlashSub.Top := Screen.Monitors[1].Top;
    FlashSub.Height := Screen.Monitors[1].Height;
    FlashSub.Left := 0;//Screen.Monitors[1].Left;
    FlashSub.Width := Screen.Monitors[1].Width;
  end;
end;

procedure TDisplayFlash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FlashMain.Stop;
  FlashSub.Stop;
end;

procedure TDisplayFlash.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F10 then
    SetWindowPos(Main.Handle, HWND_TOP, Main.Left, Main.Top, Main.Width, Main.Height, SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
end;

procedure TDisplayFlash.SetFlashMain(filepath: string);
begin
  FlashMain.LoadMovie(0, filepath);
  FlashMain.Perform(CM_UIACTIVATE, 0, 0);
  FlashMain.Visible := True;
end;

procedure TDisplayFlash.SetFlashSub(filepath: string);
begin
  FlashSub.LoadMovie(0, filepath);
  FlashSub.Perform(CM_UIACTIVATE, 0, 0);
  FlashSub.Visible := True;
end;

initialization
  KeybdHook;

finalization
  KeybdUnhook;

end.
