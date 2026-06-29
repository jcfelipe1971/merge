inherited FPregStockUbicacion: TFPregStockUbicacion
  Left = 340
  Top = 397
  Caption = 'Listado de Stock por Ubicaci'#243'n'
  ClientHeight = 289
  ClientWidth = 504
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 289
    inherited TBMain: TLFToolBar
      Width = 504
      ButtonWidth = 79
      inherited TButtImprimir: TToolButton
        Left = 79
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 158
      end
      inherited TButtSalir: TToolButton
        Left = 237
      end
      object TButtMultiSeleccion: TToolButton
        Left = 316
        Top = 0
        Action = AMulti
      end
      object TButtConfRapida: TToolButton
        Left = 395
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 273
      Width = 504
      TabOrder = 4
    end
    object GBUbicacion: TGroupBox
      Left = 8
      Top = 45
      Width = 492
      Height = 73
      Caption = 'Ubicaci'#243'n'
      TabOrder = 1
      object LBUbDesde: TLFLabel
        Left = 36
        Top = 23
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBUbHasta: TLFLabel
        Left = 39
        Top = 45
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFUbicacionD: TLFEditFind2000
        Left = 71
        Top = 19
        Width = 119
        Height = 21
        TabOrder = 0
        OnChange = EFUbicacionDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'COMPOSICION'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFUbicacionDBusqueda
        Filtros = []
      end
      object EFUbicacionH: TLFEditFind2000
        Left = 71
        Top = 42
        Width = 119
        Height = 21
        TabOrder = 1
        OnChange = EFUbicacionHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'COMPOSICION'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFUbicacionHBusqueda
        Filtros = []
      end
      object DBETitUbDesde: TLFDbedit
        Left = 192
        Top = 19
        Width = 281
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstStockUbicacion.DSxUbicacionD
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBETitUbHasta: TLFDbedit
        Left = 192
        Top = 42
        Width = 281
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstStockUbicacion.DSxUbicacionH
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
    object GBOrdenLst: TGroupBox
      Left = 8
      Top = 194
      Width = 492
      Height = 89
      Caption = 'Opciones'
      TabOrder = 3
      object LBOrdenarPor: TLFLabel
        Left = 246
        Top = 18
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ordenar por'
      end
      object LBFechaLst: TLFLabel
        Left = 11
        Top = 19
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Listado'
      end
      object LBComentario: TLFLabel
        Left = 25
        Top = 43
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object CBOrdenLst: TLFComboBox
        Left = 306
        Top = 15
        Width = 122
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Ubicaci'#243'n'
          'Art'#237'culo'
          'Stock'
          'Familia')
      end
      object CBSinStock: TLFCheckBox
        Left = 81
        Top = 67
        Width = 209
        Height = 17
        Caption = 'Mostrar Art'#237'culos sin Stock'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object DEFechaLst: TLFDateEdit
        Left = 82
        Top = 15
        Width = 90
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object EComentario: TLFEdit
        Left = 82
        Top = 39
        Width = 345
        Height = 21
        MaxLength = 35
        TabOrder = 3
      end
    end
    object GBArticulos: TGroupBox
      Left = 9
      Top = 120
      Width = 492
      Height = 73
      Caption = 'Art'#237'culos'
      TabOrder = 2
      object LDesdeArticulo: TLFLabel
        Left = 35
        Top = 22
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 38
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArticuloD: TLFEditFind2000
        Left = 70
        Top = 18
        Width = 119
        Height = 21
        TabOrder = 0
        OnChange = EFArticuloDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloDBusqueda
        Filtros = []
      end
      object EFArticuloH: TLFEditFind2000
        Left = 70
        Top = 41
        Width = 119
        Height = 21
        TabOrder = 1
        OnChange = EFArticuloHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloHBusqueda
        Filtros = []
      end
      object ETitArticuloD: TLFEdit
        Left = 191
        Top = 18
        Width = 281
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ETitArticuloH: TLFEdit
        Left = 191
        Top = 41
        Width = 281
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
    end
  end
  inherited ALMain: TLFActionList
    Left = 380
    Top = 14
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMulti: TAction
      Caption = 'Multi-Selecci'#243'n'
      Hint = 'MultiSelecci'#243'n'
      ImageIndex = 78
      OnExecute = AMultiExecute
    end
  end
end
