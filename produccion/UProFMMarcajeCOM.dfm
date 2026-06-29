object ProFMMarcajeCom: TProFMMarcajeCom
  Left = 532
  Top = 355
  Width = 304
  Height = 110
  ActiveControl = EMarcaje
  Caption = 'Marcaje Manual'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 296
    Height = 25
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TSalir: TToolButton
      Left = 0
      Top = 2
      Hint = 'Cerrar esta ventana'
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TSalirClick
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 2
      ImageIndex = 94
      OnClick = ToolButton1Click
    end
    object LFDate: TLFDateEdit
      Left = 46
      Top = 2
      Width = 95
      Height = 22
      TabStop = False
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object LFTime: TDateTimePicker
      Left = 141
      Top = 2
      Width = 96
      Height = 22
      CalAlignment = dtaLeft
      Date = 39343.5350933102
      Time = 39343.5350933102
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 1
      TabStop = False
      OnClick = LFTimeClick
    end
  end
  object LFPanel1: TLFPanel
    Left = 0
    Top = 25
    Width = 296
    Height = 58
    Align = alClient
    TabOrder = 1
    object EMarcaje: TLFEdit
      Left = 16
      Top = 20
      Width = 261
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = EMarcajeKeyPress
    end
  end
  object TempMarc: TTimer
    OnTimer = TempMarcTimer
    Left = 264
    Top = 8
  end
end
