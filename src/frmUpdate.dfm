object UpdateForm: TUpdateForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'BorderController_v2 Update'
  ClientHeight = 56
  ClientWidth = 306
  Color = clBtnFace
  TransparentColorValue = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 258
    Top = 9
    Width = 18
    Height = 16
    Caption = '1.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 224
    Height = 16
    Caption = 'Web update download progress'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #45208#45588#44256#46357#53076#46377
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 30
    Width = 289
    Height = 16
    TabOrder = 0
  end
  object WebUpdate1: TWebUpdate
    Agent = 'TWebUpdate'
    DateFormat = 'dd/mm/yyyy'
    DateSeparator = '/'
    ExtractCAB = True
    FTPPassive = True
    Host = '192.168.2.99'
    Logging = True
    LogFileName = 'WUPDATE.LOG'
    Password = 'dyddyd'
    PostUpdateInfo.Enabled = False
    Signature = 'GAnTech'
    TempDirectory = '.'
    TimeFormat = 'hh:nn'
    TimeSeparator = ':'
    UpdateUpdate = wuuSilent
    URL = 'http://192.168.2.99/BorderController_v2.INF'
    UserID = 'ganuser1'
    OnFileProgress = WebUpdate1FileProgress
    OnStatus = WebUpdate1Status
    OnAppRestart = WebUpdate1AppRestart
    OnAppDoClose = WebUpdate1AppDoClose
    Version = '2.3.0.1'
    Left = 224
    Top = 8
  end
end
