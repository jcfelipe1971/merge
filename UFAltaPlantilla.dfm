object FAltaPlantilla: TFAltaPlantilla
  Left = 498
  Top = 421
  ActiveControl = EDTNom
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Alta de Plantillas contables'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLEdit: TLFPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 220
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLPlantilla: TLFLabel
      Left = 24
      Top = 78
      Width = 51
      Height = 13
      Caption = 'N'#186' Plantilla'
    end
    object LBLTitulo: TLFLabel
      Left = 47
      Top = 100
      Width = 28
      Height = 13
      Caption = 'T'#237'tulo'
    end
    object LBLAviso: TLFLabel
      Left = 134
      Top = 76
      Width = 189
      Height = 13
      Caption = '(Dejar a 0 para numeraci'#243'n autom'#225'tica )'
    end
    object EDTNom: TLFEdit
      Left = 82
      Top = 96
      Width = 297
      Height = 21
      MaxLength = 40
      TabOrder = 1
    end
    object RECod: THYGRightEdit
      Left = 82
      Top = 74
      Width = 40
      Height = 21
      MaxLength = 5
      TabOrder = 0
    end
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 168
    Width = 392
    Height = 52
    BevelOuter = bvNone
    TabOrder = 1
    object BBAceptar: TBitBtn
      Left = 96
      Top = 6
      Width = 90
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object BBCancelar: TBitBtn
      Left = 202
      Top = 6
      Width = 90
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
