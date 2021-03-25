object AutoUpdateForm: TAutoUpdateForm
  Left = 544
  Top = 375
  BorderStyle = bsDialog
  Caption = #48260#51204#54869#51064#51473'...'
  ClientHeight = 77
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 77
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 256
      Height = 16
      Caption = 'BorderController '#50629#45936#51060#53944#47484' '#51652#54665#54633#45768#45796'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTotal: TLabel
      Left = 471
      Top = 43
      Width = 34
      Height = 13
      Caption = 'lblTotal'
    end
    object ProgressBar1: TProgressBar
      Left = 24
      Top = 40
      Width = 433
      Height = 17
      TabOrder = 0
    end
  end
  object IdFTP1: TIdFTP
    IPVersion = Id_IPv4
    Passive = True
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 352
    Top = 8
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 424
    Top = 8
  end
end
