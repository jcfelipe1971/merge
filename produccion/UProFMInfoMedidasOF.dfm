object ProFMInfoMedidasOF: TProFMInfoMedidasOF
  Left = 576
  Top = 389
  ActiveControl = EMedida1
  BorderStyle = bsDialog
  Caption = 'Introducci'#243'n medidas'
  ClientHeight = 218
  ClientWidth = 288
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
    Width = 288
    Height = 218
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LMedida1: TLFLabel
      Left = 40
      Top = 46
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 1'
    end
    object LMedida2: TLFLabel
      Left = 40
      Top = 69
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 2'
    end
    object LMedida3: TLFLabel
      Left = 40
      Top = 92
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 3'
    end
    object LMedida4: TLFLabel
      Left = 40
      Top = 114
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 4'
    end
    object EMedida1: TLFEdit
      Left = 89
      Top = 44
      Width = 86
      Height = 21
      TabOrder = 0
      OnKeyPress = EMedida1KeyPress
    end
    object EMedida2: TLFEdit
      Left = 89
      Top = 66
      Width = 86
      Height = 21
      TabOrder = 1
      OnKeyPress = EMedida1KeyPress
    end
    object EMedida3: TLFEdit
      Left = 89
      Top = 88
      Width = 86
      Height = 21
      TabOrder = 2
      OnKeyPress = EMedida1KeyPress
    end
    object EMedida4: TLFEdit
      Left = 89
      Top = 110
      Width = 86
      Height = 21
      TabOrder = 3
      OnKeyPress = EMedida1KeyPress
    end
    object BCalcular: TBitBtn
      Left = 60
      Top = 165
      Width = 80
      Height = 30
      Caption = 'Calcular'
      Default = True
      ModalResult = 1
      TabOrder = 4
      OnClick = BCalcularClick
    end
    object BCancelar: TBitBtn
      Left = 156
      Top = 165
      Width = 80
      Height = 30
      Cancel = True
      Caption = 'Salir'
      ModalResult = 2
      TabOrder = 5
      OnClick = BCancelarClick
    end
  end
end
