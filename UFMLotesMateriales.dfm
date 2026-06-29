object FMLotesMateriales: TFMLotesMateriales
  Left = 383
  Top = 164
  Width = 725
  Height = 392
  Caption = 
    'Especificar los lotes de materia prima que se utilizaron en la p' +
    'roducci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 365
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 717
      Height = 31
      BorderWidth = 2
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object PNLLote: TLFPanel
        Left = 0
        Top = 0
        Width = 516
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LProdLote: TLFLabel
          Left = 5
          Top = 4
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lote'
        end
        object LSerie: TLFLabel
          Left = 152
          Top = 4
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Serie'
        end
        object LProdArticulo: TLFLabel
          Left = 327
          Top = 4
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art'#237'culo'
        end
        object DBEProdLote: TLFDbedit
          Left = 31
          Top = 0
          Width = 114
          Height = 21
          Color = clInfoBk
          DataField = 'LOTE'
          DataSource = DMLotesMateriales.DSxOrdenLineaLote
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEProdSerie: TLFDbedit
          Left = 196
          Top = 1
          Width = 125
          Height = 21
          Color = clInfoBk
          DataField = 'N_SERIE'
          DataSource = DMLotesMateriales.DSxOrdenLineaLote
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEProdArticulo: TLFDbedit
          Left = 370
          Top = 1
          Width = 143
          Height = 21
          Color = clInfoBk
          DataField = 'ARTICULO'
          DataSource = DMLotesMateriales.DSxOrdenLineaLote
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object TButtSep0: TToolButton
        Left = 516
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtValidar: TToolButton
        Left = 524
        Top = 0
        Hint = 'Valida al producci'#243'n'
        Caption = 'Validar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtValidarClick
      end
      object TButtSalir: TToolButton
        Left = 547
        Top = 0
        Hint = 'Cierra y cancela la producci'#243'n'
        Caption = 'Salir'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtSalirClick
      end
    end
    object PNLArticulos: TLFPanel
      Left = 0
      Top = 31
      Width = 137
      Height = 334
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object LBArticulos: TListBox
        Left = 0
        Top = 28
        Width = 137
        Height = 306
        Align = alClient
        BevelInner = bvNone
        ItemHeight = 13
        TabOrder = 0
        OnClick = LBArticulosClick
      end
      object PNLTituloArticulos: TLFPanel
        Left = 0
        Top = 0
        Width = 137
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        Color = clAppWorkSpace
        TabOrder = 1
        object LArtEscandallo: TLFLabel
          Left = 1
          Top = 9
          Width = 136
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Art'#237'culos del Escandallo'
        end
      end
    end
    object PNLLotes: TLFPanel
      Left = 137
      Top = 31
      Width = 580
      Height = 334
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object PNLSuperior: TLFPanel
        Left = 0
        Top = 0
        Width = 580
        Height = 144
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        OnResize = PNLSuperiorResize
        object DBCGUtilizados: TLFDBCtrlGrid
          Left = 0
          Top = 28
          Width = 580
          Height = 116
          Align = alClient
          ColCount = 1
          DataSource = DMLotesMateriales.DSxLotesUtilizados
          PanelHeight = 23
          PanelWidth = 564
          TabOrder = 0
          RowCount = 5
          SelectedColor = clHighlight
          OnDblClick = DBCGUtilizadosDblClick
          OnKeyDown = DBCGUtilizadosKeyDown
          object DBEUtilLotes: TLFDbedit
            Left = 2
            Top = 2
            Width = 128
            Height = 21
            Color = clInfoBk
            DataField = 'LOTE'
            DataSource = DMLotesMateriales.DSxLotesUtilizados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEUtilFCaducidad: TLFDbedit
            Left = 262
            Top = 2
            Width = 128
            Height = 21
            Color = clInfoBk
            DataField = 'F_CADUCIDAD'
            DataSource = DMLotesMateriales.DSxLotesUtilizados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEUtilCantidad: TLFDbedit
            Left = 391
            Top = 2
            Width = 128
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = DMLotesMateriales.DSxLotesUtilizados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnKeyPress = DBEUtilCantidadKeyPress
          end
          object DBEUtilSerie: TLFDbedit
            Left = 132
            Top = 2
            Width = 128
            Height = 21
            Color = clInfoBk
            DataField = 'SERIE'
            DataSource = DMLotesMateriales.DSxLotesUtilizados
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
        object PNLUtilizados: TLFPanel
          Left = 0
          Top = 0
          Width = 580
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          Color = clAppWorkSpace
          TabOrder = 1
          object LUtilLote: TLFLabel
            Left = 2
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Lote'
          end
          object LUtilSerie: TLFLabel
            Left = 132
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'N'#186' Serie'
          end
          object LUtilFCaducidad: TLFLabel
            Left = 262
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'F. Caducidad'
          end
          object LUtilCantidad: TLFLabel
            Left = 391
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Cantidad'
          end
        end
      end
      object PNLInferior: TLFPanel
        Left = 0
        Top = 144
        Width = 580
        Height = 190
        Align = alClient
        TabOrder = 1
        OnResize = PNLInferiorResize
        object DBCGEnEscandallo: TLFDBCtrlGrid
          Left = 1
          Top = 29
          Width = 578
          Height = 160
          Align = alClient
          ColCount = 1
          DataSource = DMLotesMateriales.DSxLotesEnEscandallo
          PanelHeight = 20
          PanelWidth = 562
          TabOrder = 0
          RowCount = 8
          SelectedColor = clHighlight
          OnDblClick = DBCGEnEscandalloDblClick
          object DBEEscLote: TLFDbedit
            Left = 2
            Top = 2
            Width = 128
            Height = 21
            Color = clInfoBk
            DataField = 'LOTE'
            DataSource = DMLotesMateriales.DSxLotesEnEscandallo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEEscSerie: TLFDbedit
            Left = 132
            Top = 2
            Width = 128
            Height = 21
            Color = clInfoBk
            DataField = 'N_SERIE'
            DataSource = DMLotesMateriales.DSxLotesEnEscandallo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEEscFCaducidad: TLFDbedit
            Left = 262
            Top = 2
            Width = 128
            Height = 21
            Color = clInfoBk
            DataField = 'F_CADUCIDAD'
            DataSource = DMLotesMateriales.DSxLotesEnEscandallo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEEscCantidad: TLFDbedit
            Left = 391
            Top = 2
            Width = 128
            Height = 21
            Color = clInfoBk
            DataField = 'STOCK'
            DataSource = DMLotesMateriales.DSxLotesEnEscandallo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object PNLEnEscandallo: TLFPanel
          Left = 1
          Top = 1
          Width = 578
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          Color = clAppWorkSpace
          TabOrder = 1
          object LEscLote: TLFLabel
            Left = 2
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Lote'
          end
          object LEscSerie: TLFLabel
            Left = 132
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'N'#186' Serie'
          end
          object LEscFCaducidad: TLFLabel
            Left = 262
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'F. Caducidad'
          end
          object LEscCantidad: TLFLabel
            Left = 391
            Top = 9
            Width = 128
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Stock'
          end
        end
      end
    end
  end
end
