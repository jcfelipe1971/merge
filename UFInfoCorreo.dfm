object FInfoCorreo: TFInfoCorreo
  Left = 424
  Top = 348
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Env'#237'o de Correo Electr'#243'nico'
  ClientHeight = 220
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 220
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Mensajes: TLFLabel
      Left = 29
      Top = 53
      Width = 333
      Height = 19
      Caption = 'Mensajes varios producidos por el compon.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object IProgreso: TLFLabel
      Left = 335
      Top = 97
      Width = 35
      Height = 13
      Caption = '100 %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ANITempo: TAnimate
      Left = 18
      Top = 96
      Width = 48
      Height = 45
      Active = False
      CommonAVI = aviFindComputer
      StopFrame = 8
      Visible = False
    end
    object Progreso: TProgressBar
      Left = 80
      Top = 95
      Width = 241
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 1
    end
    object BitButtOK: TBitBtn
      Left = 158
      Top = 147
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 2
    end
  end
end
