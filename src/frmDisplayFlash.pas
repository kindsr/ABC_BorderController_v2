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

// Ű���� �� ����ü
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
    (filename: '000.swf'; 			desc: '�ʱ�ȭ��'                         ), // 0
    (filename: '001.swf'; 			desc: '�����'                         ), // 1
    (filename: '002.swf'; 			desc: '�����ǵ���'                       ), // 2
    (filename: '003.swf'; 			desc: '�ջ���̿���'                     ), // 3
    (filename: '004.swf'; 			desc: '�̿����ڰ��ƴ�'                 ), // 4
    (filename: '005.swf'; 			desc: '�ڵ��ɻ���̿�Ұ�'               ), // 5
    (filename: '006.swf'; 			desc: '�װ���ž����������'               ), // 6
    (filename: '007.swf'; 			desc: '�����ǵ����дٽýõ�'             ), // 7
    (filename: '008.swf'; 			desc: '�����ǵ����дٽýõ�'             ), // 8
    (filename: '009.swf'; 			desc: 'Ȯ��.�������̵�'                  ), // 9
    (filename: '010.swf'; 			desc: '�������̵��ݺ�'                   ), // 10
    (filename: '011.swf'; 			desc: '���ȴ���.���ɸ�'                  ), // 11
    (filename: '012_aa.swf';		desc: '�����վ���'                       ), // 12
    (filename: '012_ab.swf';		desc: '�����հ���'                       ), // 13
    (filename: '012_ac.swf';		desc: '����������'                       ), // 14
    (filename: '012_ba.swf';		desc: '�޼վ���'                         ), // 15
    (filename: '012_bb.swf';		desc: '�޼հ���'                         ), // 16
    (filename: '012_bc.swf';		desc: '�޼�����'                         ), // 17
    (filename: '012_ca.swf';		desc: '�����վ���'                       ), // 18
    (filename: '012_cb.swf';		desc: '�����հ���'                       ), // 19
    (filename: '012_cc.swf';		desc: '����������'                       ), // 20
    (filename: '012_ll.swf';		desc: '�޼�'                             ), // 21
    (filename: '012_rr.swf';		desc: '������'                           ), // 22
    (filename: '013.swf'; 			desc: '�����ν���'                       ), // 23
    (filename: '014_aa.swf'; 		desc: '�����վ���'                       ), // 24
    (filename: '014_ab.swf'; 		desc: '�����հ���'                       ), // 25
    (filename: '014_ac.swf'; 		desc: '����������'                       ), // 26
    (filename: '014_ba.swf'; 		desc: '�޼վ���'                         ), // 27
    (filename: '014_bb.swf'; 		desc: '�޼հ���'                         ), // 28
    (filename: '014_bc.swf'; 		desc: '�޼�����'                         ), // 29
    (filename: '014_ca.swf'; 		desc: '�����վ���'                       ), // 30
    (filename: '014_cb.swf'; 		desc: '�����հ���'                       ), // 31
    (filename: '014_cc.swf'; 		desc: '����������'                       ), // 32
    (filename: '014_ll.swf'; 		desc: '�޼�'                             ), // 33
    (filename: '014_rr.swf'; 		desc: '������'                           ), // 34
    (filename: '015.swf';				desc: '������ġ����.�������̵�'          ), // 35
    (filename: '016.swf';				desc: '�������̵��ݺ�'                   ), // 36
    (filename: '017.swf';				desc: 'ī�޶󿩱⸦������'               ), // 37
    (filename: '018.swf';				desc: '������ġ'                         ), // 38
    (filename: '019.swf';				desc: 'ī�޶�ٽú���'                   ), // 39
    (filename: '020.swf';				desc: '���ν���'                       ), // 40
    (filename: '021.swf';				desc: '����ġ����.�������̵�'          ), // 41
    (filename: '022.swf';				desc: '�������̵��ݺ�'                   ), // 42
    (filename: '023.swf';				desc: '�ⱸ�������̵�'                   ), // 43
    (filename: '024.swf';				desc: '�ɻ�Ϸ�.�ȳ�'                    ), // 44
    (filename: '025.swf';				desc: '�ɻ�Ϸ�.�ͱ�ȯ��'                ), // 45
    (filename: '026.swf';				desc: '������ȣ��'                       ), // 46
    (filename: '027.swf';				desc: '������'                           ), // 47
    (filename: '028.swf';				desc: '��������'                       ), // 48
    (filename: '029.swf';				desc: '�ȳ������'                       ), // 49
    (filename: '030.swf';				desc: '���Ǵ��'                         ), // 50
    (filename: '031.swf';				desc: '���ȴ���.���ɸ�'                  ), // 51
    (filename: '032.swf';				desc: '�����ڹ���'                       ), // 52
    (filename: '034.swf';				desc: '�����ǵ�����.�ٽýõ�'            ), // 53
    (filename: '035.swf';				desc: '����'                             ), // 54
    (filename: '036.swf';				desc: 'ȯ�������°�.�����ڹ���'        ), // 55
    (filename: '037.swf';				desc: '������Ȯ����'                     ), // 56
    (filename: '038.swf';				desc: '2������'                          )  // 57
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
  // Ű ���� �޾ƿ���
  PKeyHook := Ptr(kStrokeInfo);

  if HookCode >= 0 then
  begin
    if pKeyHook.vkCode = VK_F10 then
    begin
      SetWindowPos(Main.Handle, HWND_TOP, Main.Left, Main.Top, Main.Width, Main.Height, SWP_SHOWWINDOW);
    end;
  end;

  // ���͸� �� Ű�� �ƴ϶�� ��� ����
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
