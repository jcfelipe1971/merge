object ZFMCrearDatosModelo: TZFMCrearDatosModelo
  Left = 482
  Top = 99
  ActiveControl = LFIniLinea
  BorderStyle = bsDialog
  Caption = 'Crear Datos Modelo'
  ClientHeight = 315
  ClientWidth = 414
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
  object LFPanel1: TLFPanel
    Left = 0
    Top = 25
    Width = 414
    Height = 290
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GBCaida: TGroupBox
      Left = 45
      Top = 145
      Width = 321
      Height = 109
      Caption = 'Salida'
      TabOrder = 0
      object LFLabel1: TLFLabel
        Left = 68
        Top = 24
        Width = 27
        Height = 13
        Caption = 'Inicial'
      end
      object LFLabel2: TLFLabel
        Left = 72
        Top = 51
        Width = 22
        Height = 13
        Caption = 'Final'
      end
      object LFLabel3: TLFLabel
        Left = 52
        Top = 78
        Width = 45
        Height = 13
        Caption = 'Cadencia'
      end
      object LFIniSalida: TLFEdit
        Left = 104
        Top = 20
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object LFFinSalida: TLFEdit
        Left = 104
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object LFCadenciaSalida: TLFEdit
        Left = 104
        Top = 76
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object GBLinea: TGroupBox
      Left = 45
      Top = 19
      Width = 321
      Height = 109
      Caption = 'L'#237'nea'
      TabOrder = 1
      object Inicial: TLFLabel
        Left = 68
        Top = 24
        Width = 27
        Height = 13
        Caption = 'Inicial'
      end
      object Final: TLFLabel
        Left = 72
        Top = 51
        Width = 22
        Height = 13
        Caption = 'Final'
      end
      object Cadencia: TLFLabel
        Left = 52
        Top = 78
        Width = 45
        Height = 13
        Caption = 'Cadencia'
      end
      object LFIniLinea: TLFEdit
        Left = 104
        Top = 20
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object LFFinLinea: TLFEdit
        Left = 104
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object LFCadenciaLinea: TLFEdit
        Left = 104
        Top = 76
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
  end
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 414
    Height = 25
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object TBCrear: TToolButton
      Left = 0
      Top = 0
      ImageIndex = 94
      OnClick = TBCrearClick
    end
    object ToolButton3: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBSalir: TToolButton
      Left = 31
      Top = 0
      ImageIndex = 0
      OnClick = TBSalirClick
    end
  end
end
