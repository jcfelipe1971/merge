object FMReetiquetaLotes: TFMReetiquetaLotes
  Left = 544
  Top = 187
  Width = 494
  Height = 258
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Reetiquetado de Lotes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 25
    Width = 486
    Height = 206
    Align = alClient
    TabOrder = 0
    object LBLLote: TLFLabel
      Left = 68
      Top = 13
      Width = 21
      Height = 13
      Caption = 'Lote'
    end
    object LBLProveedor: TLFLabel
      Left = 41
      Top = 37
      Width = 49
      Height = 13
      Caption = 'Proveedor'
    end
    object LBLAlmacen: TLFLabel
      Left = 48
      Top = 59
      Width = 41
      Height = 13
      Caption = 'Almac'#233'n'
    end
    object LBLSerie: TLFLabel
      Left = 263
      Top = 13
      Width = 24
      Height = 13
      Caption = 'Serie'
    end
    object LBLNuevoLote: TLFLabel
      Left = 34
      Top = 81
      Width = 56
      Height = 13
      Caption = 'Nuevo Lote'
    end
    object EDescProveedor: TLFEdit
      Left = 171
      Top = 32
      Width = 241
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object EDescAlmacen: TLFEdit
      Left = 171
      Top = 55
      Width = 241
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object ESerie: TLFEdit
      Left = 293
      Top = 9
      Width = 119
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
    end
    object RGReetiquetado: TRadioGroup
      Left = 40
      Top = 104
      Width = 372
      Height = 81
      Caption = 'Reetiquetado'
      Items.Strings = (
        'Libre'
        'P + Cod. Proveedor + Lote'
        'P + Cod. Proveedor + Contador de Lotes')
      TabOrder = 0
      OnClick = RGReetiquetadoClick
    end
    object ENuevoLote: TLFEdit
      Left = 96
      Top = 78
      Width = 161
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 7
    end
    object CHKReetiquetado: TLFCheckBox
      Left = 272
      Top = 81
      Width = 139
      Height = 17
      Hint = 'Reetiqueta autom'#225'ticamente este Lote con el Nuevo Lote'
      Caption = 'Reetiquetado Autom'#225'tico'
      ClicksDisabled = False
      Enabled = False
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
    end
    object EProveedor: TLFEdit
      Left = 96
      Top = 32
      Width = 73
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object EAlmacen: TLFEdit
      Left = 96
      Top = 55
      Width = 73
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ELote: TLFEdit
      Left = 96
      Top = 9
      Width = 161
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 486
    Height = 25
    ButtonHeight = 23
    Caption = ''
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object PNLArticulo: TLFPanel
      Left = 0
      Top = 0
      Width = 430
      Height = 23
      TabOrder = 0
      object Label2: TLFLabel
        Left = 4
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Art'#237'culo'
        Layout = tlCenter
      end
      object EArticulo: TLFEdit
        Left = 44
        Top = 0
        Width = 101
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EDescArticulo: TLFEdit
        Left = 145
        Top = 0
        Width = 283
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object ToolButton1: TToolButton
      Left = 430
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBReetiquetar: TToolButton
      Left = 438
      Top = 0
      Hint = 'Reetiquetar el Lote'
      Caption = 'TBReetiquetar'
      ImageIndex = 19
      OnClick = TBReetiquetarClick
    end
    object TBCancelar: TToolButton
      Left = 461
      Top = 0
      Hint = 'Cancelar'
      Caption = 'Cancelar'
      ImageIndex = 27
      OnClick = TBCancelarClick
    end
  end
end
