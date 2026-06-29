object FMPonderarDocs: TFMPonderarDocs
  Left = 427
  Top = 300
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ponderar Documentos'
  ClientHeight = 343
  ClientWidth = 592
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 29
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TBRecargar: TToolButton
      Left = 0
      Top = 0
      Action = ARecargar
      ParentShowHint = False
      ShowHint = True
    end
    object TBPonderarDocs: TToolButton
      Left = 23
      Top = 0
      Hint = 'Ponderar los Documentos'
      Action = APonderarDocs
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPPonderarDocs: THYMEditPanel
      Left = 54
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
  end
  object PnPonderarDocs: TLFPanel
    Left = 0
    Top = 29
    Width = 592
    Height = 314
    Align = alClient
    TabOrder = 1
    object RGTipoDoc: TRadioGroup
      Left = 1
      Top = 6
      Width = 193
      Height = 106
      BiDiMode = bdLeftToRight
      Caption = 'Tipo de documento'
      ItemIndex = 3
      Items.Strings = (
        'Ofertas'
        'Pedidos'
        'Albaranes'
        'Facturas')
      ParentBiDiMode = False
      TabOrder = 0
    end
    object GBArticulos: TGroupBox
      Left = 1
      Top = 204
      Width = 590
      Height = 109
      Align = alBottom
      Caption = 'Art'#237'culos'
      TabOrder = 5
      object Label2: TLFLabel
        Left = 29
        Top = 33
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Label3: TLFLabel
        Left = 32
        Top = 55
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArtDesde: TLFEditFind2000
        Left = 66
        Top = 30
        Width = 100
        Height = 21
        TabOrder = 0
        OnExit = EFArtDesdeExit
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArtDesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArtDesde: TLFDbedit
        Left = 167
        Top = 30
        Width = 376
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPonderarDocs.DSxArt_Desde
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEArtHasta: TLFDbedit
        Left = 167
        Top = 52
        Width = 376
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPonderarDocs.DSxArt_Hasta
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object EFArtHasta: TLFEditFind2000
        Left = 66
        Top = 52
        Width = 100
        Height = 21
        TabOrder = 1
        OnExit = EFArtHastaExit
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArtDesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object CBTodosArt: TLFCheckBox
        Left = 65
        Top = 81
        Width = 111
        Height = 17
        Caption = 'Todos los Art'#237'culos'
        ClicksDisabled = False
        TabOrder = 2
        TabStop = True
        OnClick = CBTodosArtClick
        Alignment = taLeftJustify
      end
    end
    object GBAlmacen: TGroupBox
      Left = 1
      Top = 115
      Width = 292
      Height = 86
      Caption = 'Almac'#233'n'
      TabOrder = 3
      object EFAlmacen: TLFEditFind2000
        Left = 10
        Top = 30
        Width = 48
        Height = 21
        TabOrder = 0
        OnChange = EFAlmacenChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ALMACEN'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ALMACENES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ALMACEN')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBAlmacen: TLFDbedit
        Left = 59
        Top = 30
        Width = 224
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPonderarDocs.DSxAlmacen
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object CBTodosAlm: TLFCheckBox
        Left = 13
        Top = 56
        Width = 122
        Height = 17
        Caption = 'Todos los Almacenes'
        ClicksDisabled = False
        TabOrder = 2
        TabStop = True
        OnClick = CBTodosAlmClick
        Alignment = taLeftJustify
      end
    end
    object GBFechas: TGroupBox
      Left = 397
      Top = 6
      Width = 194
      Height = 106
      Caption = 'Fechas'
      TabOrder = 2
      object Label4: TLFLabel
        Left = 34
        Top = 33
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Label5: TLFLabel
        Left = 36
        Top = 55
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPDesde: TLFDateEdit
        Left = 72
        Top = 30
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPHasta: TLFDateEdit
        Left = 72
        Top = 52
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GBSerie: TGroupBox
      Left = 299
      Top = 115
      Width = 292
      Height = 86
      Caption = 'Serie'
      TabOrder = 4
      object EFSerie: TLFEditFind2000
        Left = 9
        Top = 30
        Width = 48
        Height = 21
        TabOrder = 0
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBESerieD: TLFDbedit
        Left = 58
        Top = 30
        Width = 224
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPonderarDocs.DSxSerie
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object CBTodasSeries: TLFCheckBox
        Left = 19
        Top = 56
        Width = 111
        Height = 17
        Caption = 'Todas las Series'
        ClicksDisabled = False
        TabOrder = 2
        TabStop = True
        OnClick = CBTodasSeriesClick
        Alignment = taLeftJustify
      end
    end
    object GBNDoc: TGroupBox
      Left = 199
      Top = 6
      Width = 192
      Height = 106
      Caption = 'N'#186' Documento'
      TabOrder = 1
      object Label1: TLFLabel
        Left = 37
        Top = 33
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Label6: TLFLabel
        Left = 39
        Top = 55
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EdDocDesde: TLFEdit
        Left = 75
        Top = 30
        Width = 80
        Height = 21
        TabOrder = 0
      end
      object EdDocHasta: TLFEdit
        Left = 75
        Top = 52
        Width = 80
        Height = 21
        TabOrder = 1
      end
    end
    object CBTodosDoc: TLFCheckBox
      Left = 95
      Top = 89
      Width = 81
      Height = 17
      Caption = 'Todos Doc.'
      ClicksDisabled = False
      TabOrder = 6
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 472
    Top = 207
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Cerrar esta ventana'
      ImageIndex = 0
    end
    object APonderarDocs: TAction
      Caption = 'APonderarDocs'
      Hint = 'Ponderar Documentos'
      ImageIndex = 70
      OnExecute = APonderarDocsExecute
    end
    object ARecargar: TAction
      Caption = 'ARecargar'
      Hint = 'Recargar'
      ImageIndex = 39
      OnExecute = ARecargarExecute
    end
  end
  object FSMain: TLFFibFormStorage
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 670
    Top = 14
  end
end
