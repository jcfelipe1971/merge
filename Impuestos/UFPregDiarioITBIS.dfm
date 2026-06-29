inherited FPregDiarioITBIS: TFPregDiarioITBIS
  Left = 514
  Top = 128
  HelpContext = 258
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Diario IVA (Listado)'
  ClientHeight = 358
  ClientWidth = 534
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 534
    Height = 358
    inherited TBMain: TLFToolBar
      Width = 534
      ButtonWidth = 75
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtImprimir: TToolButton
        Left = 75
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 150
      end
      inherited TButtSalir: TToolButton
        Left = 225
      end
      object TButtConfigurar: TToolButton
        Left = 300
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtExportar: TToolButton
        Left = 375
        Top = 0
        Hint = 'Exportar fichero'
        Caption = 'Exportar'
        ImageIndex = 78
        OnClick = TButtExportarClick
      end
      object TButtExportarExcel: TToolButton
        Left = 450
        Top = 0
        Caption = 'Exportar Excel'
        ImageIndex = 79
        OnClick = TButtExportarExcelClick
      end
    end
    object RGFacturas: TRadioGroup
      Left = 1
      Top = 43
      Width = 242
      Height = 50
      Caption = 'Facturas'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Modelo 607'
        'Modelo 606')
      TabOrder = 1
    end
    object GBTipoOperacion: TGroupBox
      Left = 248
      Top = 43
      Width = 283
      Height = 50
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Operaciones'
      TabOrder = 2
      object CBTipoOperacion: TLFComboBox
        Left = 37
        Top = 19
        Width = 163
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Nacionales'
          'Intracomunitarias'
          'Extranjeras'
          'Todas')
      end
    end
    object GBSeries: TGroupBox
      Left = 1
      Top = 93
      Width = 530
      Height = 64
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Serie'
      TabOrder = 3
      object EFSerie: TLFEditFind2000
        Left = 88
        Top = 16
        Width = 60
        Height = 21
        TabOrder = 0
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'SERIE'
          'TITULO')
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_CANALES_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBESerie: TLFDbedit
        Left = 145
        Top = 16
        Width = 270
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
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
      object CBTodasSeries: TLFCheckBox
        Left = 84
        Top = 41
        Width = 331
        Height = 17
        Caption = 'Todas las Series'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        OnClick = CBTodasSeriesClick
        Alignment = taLeftJustify
      end
    end
    object GBNum_Fras: TGroupBox
      Left = 248
      Top = 227
      Width = 283
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Num. Facturas'
      TabOrder = 4
      object LFacturaDesde: TLFLabel
        Left = 54
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LFacturaHasta: TLFLabel
        Left = 57
        Top = 43
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFFras_Desde: TLFEditFind2000
        Left = 93
        Top = 17
        Width = 83
        Height = 21
        TabOrder = 0
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'DOC_NUMERO'
        CampoStr = 'DOC_SERIE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_REGISTRO_IVA'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFras_DesdeBusqueda
        OrdenadoPor.Strings = (
          'DOC_SERIE, DOC_NUMERO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFras_Hasta: TLFEditFind2000
        Left = 93
        Top = 39
        Width = 83
        Height = 21
        TabOrder = 1
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'DOC_NUMERO'
        CampoStr = 'DOC_NUMERO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_REGISTRO_IVA'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFras_HastaBusqueda
        OrdenadoPor.Strings = (
          'DOC_SERIE, DOC_NUMERO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBListado: TGroupBox
      Left = 1
      Top = 297
      Width = 530
      Height = 60
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      object LFecha: TLFLabel
        Left = 57
        Top = 15
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object LTitulo: TLFLabel
        Left = 61
        Top = 37
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Titulo'
      end
      object ETituloListado: TLFEdit
        Left = 93
        Top = 33
        Width = 259
        Height = 21
        TabOrder = 1
        Text = 'Libro Registro de Facturas'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 93
        Top = 11
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
    end
    object GBFechas: TGroupBox
      Left = 1
      Top = 227
      Width = 242
      Height = 70
      Caption = 'Fecha Facturas'
      TabOrder = 6
      object LFechaFacturaDesde: TLFLabel
        Left = 55
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LFechaFacturaHasta: TLFLabel
        Left = 58
        Top = 43
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPFecha_Desde: TLFDateEdit
        Left = 93
        Top = 17
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFecha_Hasta: TLFDateEdit
        Left = 93
        Top = 39
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object RGFiltro: TRadioGroup
      Left = 1
      Top = 157
      Width = 242
      Height = 70
      Caption = 'Filtro'
      ItemIndex = 0
      Items.Strings = (
        'Fecha'
        'N'#250'mero Factura')
      TabOrder = 7
    end
    object RGOrden: TRadioGroup
      Left = 248
      Top = 157
      Width = 283
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Orden'
      Items.Strings = (
        'Por fechas'
        'Por Ncf')
      TabOrder = 8
    end
  end
  inherited ALMain: TLFActionList
    Left = 390
    Top = 14
    inherited AImprimir: TAction
      Tag = 1
      OnExecute = Imprimir
    end
    inherited APrev: TAction
      OnExecute = Imprimir
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
