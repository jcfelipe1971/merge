object FPregTiempo: TFPregTiempo
  Left = 360
  Top = 296
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Tiempo'
  ClientHeight = 104
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLTiempo: TLFPanel
    Left = 0
    Top = 0
    Width = 236
    Height = 104
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LTiempo: TLFLabel
      Left = 42
      Top = 35
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tiempo'
    end
    object SeparadorHoraMinuto: TLFLabel
      Left = 108
      Top = 32
      Width = 7
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
      Color = clWhite
      ParentColor = False
    end
    object LSeparadorMinutoSegundo: TLFLabel
      Left = 140
      Top = 32
      Width = 7
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
      Color = clWhite
      ParentColor = False
    end
    object LFEHoras: TLFEdit
      Left = 82
      Top = 31
      Width = 25
      Height = 21
      TabOrder = 0
      Text = '00'
      OnEnter = LFEHorasEnter
      OnExit = LFEHorasExit
      OnKeyPress = LFEHorasKeyPress
    end
    object LFEMinutos: TLFEdit
      Left = 114
      Top = 31
      Width = 25
      Height = 21
      TabOrder = 1
      Text = '00'
      OnExit = LFEMinutosExit
      OnKeyPress = LFEMinutosKeyPress
    end
    object LFESegundos: TLFEdit
      Left = 148
      Top = 31
      Width = 25
      Height = 21
      TabOrder = 2
      Text = '00'
      OnExit = LFESegundosExit
      OnKeyPress = LFESegundosKeyPress
    end
    object BOk: TButton
      Left = 35
      Top = 68
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 3
    end
    object BCancel: TButton
      Left = 126
      Top = 68
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 4
    end
  end
end
