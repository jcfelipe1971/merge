inherited FMCuAnuales: TFMCuAnuales
  Left = 559
  Top = 104
  Width = 1122
  Height = 450
  HelpContext = 243
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cuentas anuales'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 705
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1112
    Height = 153
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 1108
      inherited NavMain: THYMNavigator
        Width = 216
        DataSource = DMCuAnuales.DSQMCuentasAn
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        TabOrder = 2
        DelMessage = #191'Desea borrar el balance? '
        EditaControl = EComentario
        InsertaControl = EFBalance
        Exclusivo = False
        InsertaUltimo = True
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 216
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton [2]
        Left = 241
      end
      inherited TSepTerc: TToolButton
        Left = 249
      end
      inherited TbuttComp: TToolButton
        Left = 257
      end
      object TButtAlta: TToolButton
        Left = 280
        Top = 0
        Action = AAlta
        Grouped = True
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfirma: TToolButton
        Left = 303
        Top = 0
        Action = AConfirma
        Grouped = True
        ParentShowHint = False
        ShowHint = True
      end
      object TButtCancela: TToolButton
        Left = 326
        Top = 0
        Action = ACancela
        ParentShowHint = False
        ShowHint = True
      end
      object TButtSeparador1: TToolButton
        Left = 349
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtExporta: TToolButton
        Left = 357
        Top = 0
        Hint = 'Exporta la cuenta a Excel'
        Caption = 'Exportar'
        ImageIndex = 36
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object TButtImprime: TToolButton
        Left = 380
        Top = 0
        Action = AImprimir
        ParentShowHint = False
        ShowHint = True
      end
      object TButtPrevisu: TToolButton
        Left = 403
        Top = 0
        Action = APrevisualizar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtSeparador3: TToolButton
        Left = 426
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtDelete: TToolButton
        Left = 434
        Top = 0
        Action = ABorrar
        ParentShowHint = False
        ShowHint = True
      end
      object TBComprobar: TToolButton
        Left = 457
        Top = 0
        Action = AComprobar
      end
      object B1: TToolButton
        Left = 480
        Top = 0
        Width = 8
        ImageIndex = 119
        Style = tbsSeparator
      end
      object TBExportacionBalanceCierreExcel: TToolButton
        Left = 488
        Top = 0
        Action = AExportacionBalanceCierreExcel
      end
      object TBExportacionBalancePerdidasYGananciasExcel: TToolButton
        Left = 511
        Top = 0
        Action = AExportacionBalancePerdidasYGananciasExcel
      end
      object TBMultiBalance: TToolButton
        Left = 534
        Top = 0
        Action = AMultiBalance
      end
      object TBSep2: TToolButton
        Left = 557
        Top = 0
        Width = 8
        ImageIndex = 141
        Style = tbsSeparator
      end
      object PNLArrastre: TLFPanel
        Left = 565
        Top = 0
        Width = 112
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object CBArrastre: TLFCheckBox
          Left = 1
          Top = 3
          Width = 110
          Height = 17
          Hint = 'Crear balances mensuales nuevos arrastrando desde la apertura'
          Caption = 'Arrastrar apertura'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object PNLProgreso: TLFPanel
        Left = 677
        Top = 0
        Width = 185
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object ProgressBar: TProgressBar
          Left = 0
          Top = 0
          Width = 185
          Height = 22
          Align = alClient
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
    end
    object PNLEdit: TLFPanel
      Left = 2
      Top = 28
      Width = 1108
      Height = 123
      Align = alClient
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object LMultiseleccion: TLFLabel
        Left = 376
        Top = 52
        Width = 116
        Height = 13
        Caption = 'Multi Selecci'#243'n de canal'
        Visible = False
      end
      object SBMultiBalance: TSpeedButton
        Left = 622
        Top = 46
        Width = 24
        Height = 25
        Action = AMultiBalance
        Flat = True
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object LBLBalance: TLFLabel
        Left = 52
        Top = 8
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Balance'
      end
      object LBLPeriodo: TLFLabel
        Left = 55
        Top = 30
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object LCentroCoste: TLFLabel
        Left = 10
        Top = 75
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Centros de Coste'
      end
      object LComentario: TLFLabel
        Left = 38
        Top = 95
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LEmpresaAConsolidar: TLFLabel
        Left = 380
        Top = 8
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Consolidar con'
        Visible = False
      end
      object LFecha: TLFLabel
        Left = 687
        Top = 8
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object LMoneda: TLFLabel
        Left = 52
        Top = 52
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object CBArratraApertura: TLFDBCheckBox
        Left = 543
        Top = 28
        Width = 157
        Height = 17
        Caption = 'Arrastrar desde la Apertura'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 10
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBArratraAperturaChange
        DataField = 'ARRASTRAR'
        DataSource = DMCuAnuales.DSQMCuentasAn
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DEPeriodoDesde: TLFDateEdit
        Left = 367
        Top = 26
        Width = 87
        Height = 21
        CheckOnExit = True
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 12
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BevelWidth = 2
      end
      object DEPeriodoHasta: TLFDateEdit
        Left = 453
        Top = 26
        Width = 87
        Height = 21
        CheckOnExit = True
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 13
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BevelWidth = 2
      end
      object ETituloPeriodo: TLFEdit
        Left = 143
        Top = 26
        Width = 220
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object ETituloMoneda: TLFEdit
        Left = 143
        Top = 48
        Width = 220
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object DTPFecha: TLFDBDateEdit
        Left = 721
        Top = 4
        Width = 87
        Height = 21
        DataField = 'FECHA'
        DataSource = DMCuAnuales.DSQMCuentasAn
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 11
      end
      object EComentario: TLFDbedit
        Left = 96
        Top = 92
        Width = 267
        Height = 21
        DataField = 'COMENTARIO'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 8
      end
      object EEmpresaAConsolidar: TLFEdit
        Left = 503
        Top = 4
        Width = 170
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clInfoBk
        Enabled = False
        TabOrder = 16
        Visible = False
      end
      object EFBalance: TLFDBEditFind2000
        Left = 96
        Top = 4
        Width = 45
        Height = 21
        Color = clInfoBk
        DataField = 'BALANCE'
        DataSource = DMCuAnuales.DSQMCuentasAn
        Enabled = False
        TabOrder = 0
        OnChange = EFBalanceChange
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'SYS_BALANCES'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'BALANCE'
        CampoStr = 'TITULO'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        OnBusqueda = EFBalanceBusqueda
        OrdenadoPor.Strings = (
          'BALANCE')
        Filtros = []
      end
      object EFDigito1: TLFDBEditFind2000
        Left = 96
        Top = 70
        Width = 45
        Height = 21
        DataField = 'DIGITO_1'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 3
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'CON_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'LET_DIGITO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'num_digito=1'
        ReemplazarCaracter = True
        SalirSiNoExiste = True
        SalirSiVacio = True
        OrdenadoPor.Strings = (
          'LET_DIGITO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDigito2: TLFDBEditFind2000
        Left = 151
        Top = 70
        Width = 45
        Height = 21
        DataField = 'DIGITO_2'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 4
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'CON_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'LET_DIGITO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'num_digito=2'
        ReemplazarCaracter = True
        SalirSiNoExiste = True
        SalirSiVacio = True
        OrdenadoPor.Strings = (
          'LET_DIGITO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDigito3: TLFDBEditFind2000
        Left = 207
        Top = 70
        Width = 45
        Height = 21
        DataField = 'DIGITO_3'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 5
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'CON_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'LET_DIGITO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'num_digito=3'
        ReemplazarCaracter = True
        SalirSiNoExiste = True
        SalirSiVacio = True
        OrdenadoPor.Strings = (
          'LET_DIGITO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDigito4: TLFDBEditFind2000
        Left = 262
        Top = 70
        Width = 45
        Height = 21
        DataField = 'DIGITO_4'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 6
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'CON_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'LET_DIGITO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'num_digito=4'
        ReemplazarCaracter = True
        SalirSiNoExiste = True
        SalirSiVacio = True
        OrdenadoPor.Strings = (
          'LET_DIGITO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDigito5: TLFDBEditFind2000
        Left = 318
        Top = 70
        Width = 45
        Height = 21
        DataField = 'DIGITO_5'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 7
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'CON_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'LET_DIGITO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'num_digito=5'
        ReemplazarCaracter = True
        SalirSiNoExiste = True
        SalirSiVacio = True
        OrdenadoPor.Strings = (
          'LET_DIGITO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFEmpresaAConsolidar: TLFEditFind2000
        Left = 456
        Top = 4
        Width = 45
        Height = 21
        TabOrder = 9
        Visible = False
        OnChange = EFEmpresaAConsolidarChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'EMPRESA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'activo=1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_EMPRESAS_EJERCICIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'empresa')
        Filtros = [obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFMoneda: TLFDBEditFind2000
        Left = 96
        Top = 48
        Width = 45
        Height = 21
        DataField = 'MONEDA'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 2
        OnChange = EFMonedaChange
        OnExit = EFMonedaExit
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'SYS_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'MONEDA'
        CampoStr = 'TITULO'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, MONEDA')
        Filtros = []
      end
      object EFPeriodo: TLFDBEditFind2000
        Left = 96
        Top = 26
        Width = 45
        Height = 21
        Color = clInfoBk
        DataField = 'PERIODO'
        DataSource = DMCuAnuales.DSQMCuentasAn
        Enabled = False
        TabOrder = 1
        OnChange = EFPeriodoChange
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'VER_PERIODOS'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'PERIODO'
        CampoStr = 'TITULO'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        OrdenadoPor.Strings = (
          'PERIODO')
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloBalance: TLFEdit
        Left = 143
        Top = 4
        Width = 220
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clInfoBk
        Enabled = False
        TabOrder = 17
      end
      object DBEMultiCanal: TLFDbedit
        Left = 496
        Top = 48
        Width = 121
        Height = 21
        DataField = 'MULTI_CANAL'
        DataSource = DMCuAnuales.DSQMCuentasAn
        TabOrder = 18
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 397
    Width = 1112
  end
  object DBGMain: THYTDBGrid [2]
    Left = 0
    Top = 153
    Width = 1112
    Height = 244
    Align = alClient
    DataSource = DMCuAnuales.DSQMCuentasAn
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGMainDblClick
    OnKeyDown = DBGMainKeyDown
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    Idioma = 'CAS'
    AutoDeseleccionar = True
    PermutaPaneles = False
    CamposAMarcar.Strings = (
      'ARRASTRAR')
    CamposChecked.Strings = (
      '1')
    CamposNoChecked.Strings = (
      '0')
    CamposAOrdenarImgs = DMMain.ILOrdGrid
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'BALANCE'
        ReadOnly = True
        Width = 25
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'B_TITULO'
        ReadOnly = True
        Width = 186
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'PERIODO'
        ReadOnly = True
        Width = 27
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'P_TITULO'
        ReadOnly = True
        Width = 154
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'COMENTARIO'
        Width = 219
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'FECHA'
        ReadOnly = True
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'ARRASTRAR'
        Width = 43
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'MONEDA'
        ReadOnly = True
        Width = 60
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'DIGITO_1'
        Width = 35
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'DIGITO_2'
        Width = 35
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'DIGITO_3'
        Width = 35
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'DIGITO_4'
        Width = 35
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'DIGITO_5'
        Width = 35
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'MULTI_CANAL'
        Width = 70
        Visible = True
      end>
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PNLEdit
    Left = 304
    Top = 204
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 340
    Top = 204
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 304
    Top = 240
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos;"CrearCuentaAnual31"'
      Caption = 'Crear Cuenta Anual Bal. Cierre PYME'
      Hint = 'Crear Cuenta Anual Bal. Cierre PYME'
      ImageIndex = 65
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Procesos;"CrearCuentaAnual32"'
      Caption = 'Crear Cuenta Anual PyG PYME'
      Hint = 'Crear Cuenta Anual P&G PYME'
      ImageIndex = 65
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      Hint = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Exportacion'
      Caption = 'Exportacion'
      Hint = 'Exportacion'
      ImageIndex = 36
    end
    object AAlta: TAction
      Category = 'Procesos'
      Caption = 'Alta'
      Hint = 'Genera una nueva cuenta anual'
      ImageIndex = 57
      Visible = False
    end
    object AConfirma: TAction
      Category = 'Procesos'
      Caption = 'Confirmar'
      Hint = 'Confirma la creaci'#243'n de la cuenta anual'
      ImageIndex = 19
      Visible = False
    end
    object ACancela: TAction
      Category = 'Procesos'
      Caption = 'Cancelar'
      Hint = 'Cancela el proceso de creaci'#243'n'
      ImageIndex = 20
      Visible = False
    end
    object AImprimir: TAction
      Category = 'Procesos'
      Caption = 'Imprimir'
      Hint = 'Imprime la cuenta anual'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object APrevisualizar: TAction
      Category = 'Procesos'
      Caption = 'Previsualizar'
      Hint = 'Visualiza la cuenta'
      ImageIndex = 125
      OnExecute = APrevisualizarExecute
    end
    object ABorrar: TAction
      Category = 'Procesos'
      Caption = 'Borrar'
      Hint = 'Elimina la cuenta anual activa'
      ImageIndex = 27
      Visible = False
    end
    object AComprobar: TAction
      Category = 'Procesos'
      Caption = 'Comprobar'
      Hint = 'Comprobaci'#243'n de Balances'
      ImageIndex = 118
      OnExecute = AComprobarExecute
    end
    object AExportacionBalanceCierreExcel: TAction
      Category = 'Exportacion'
      Caption = 'Exportar Bal. de Cierre Excel'
      Hint = 'Exportacion Excel del Balance de Cierre PYME'
      ImageIndex = 36
      OnExecute = AExportacionBalanceCierreExcelExecute
    end
    object AExportacionBalancePerdidasYGananciasExcel: TAction
      Category = 'Exportacion'
      Caption = 'Exportar Bal. Perd. y Ganancias Excel'
      Hint = 'Exportacion Excel del Balance de Perdidas y Ganancias PYME'
      ImageIndex = 36
      OnExecute = AExportacionBalancePerdidasYGananciasExcelExecute
    end
    object AMultiBalance: TAction
      Category = 'Procesos'
      Caption = 'Multi-Balance'
      Hint = 'Seleccionar canales a consolidar'
      ImageIndex = 140
      OnExecute = AMultiBalanceExecute
    end
    object ARecreaCuentasAnuales31: TAction
      Category = 'Procesos'
      Caption = 'Crea Balances mensuales de cierre PYME'
      Hint = 'Crea Balances mensuales de cierre PYME'
      ImageIndex = 50
      OnExecute = ARecreaCuentasAnuales31Execute
    end
    object ARecreaCuentasAnuales32: TAction
      Category = 'Procesos'
      Caption = 'Crea Balances mensuales de Perdidas y Ganancias PYME'
      Hint = 'Crea Balances mensuales de Perdidas y Ganancias PYME'
      ImageIndex = 50
      OnExecute = ARecreaCuentasAnuales32Execute
    end
    object ARecreaCuentasAnuales33: TAction
      Category = 'Procesos'
      Caption = 'Crea Balances mensuales de cierre'
      Hint = 'Crea Balances mensuales de cierre'
      ImageIndex = 50
      OnExecute = ARecreaCuentasAnuales33Execute
    end
    object ARecreaCuentasAnuales34: TAction
      Category = 'Procesos'
      Caption = 'Crea Balances mensuales de Perdidas y Ganancias'
      Hint = 'Crea Balances mensuales de Perdidas y Ganancias'
      ImageIndex = 50
      OnExecute = ARecreaCuentasAnuales34Execute
    end
    object ARecreaCuentasAnuales35: TAction
      Category = 'Procesos'
      Caption = 'Crea Balances mensuales de Estado de Gastos e Ingresos'
      Hint = 'Crea Balances mensuales de Estado de Gastos e Ingresos'
      ImageIndex = 50
      OnExecute = ARecreaCuentasAnuales35Execute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Procesos;"CrearCuentaAnual33"'
      Caption = 'Crear Cuenta Anual Bal. Cierre'
      Hint = 'Crear Cuenta Anual Bal. Cierre'
      ImageIndex = 65
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Procesos;"CrearCuentaAnual34"'
      Caption = 'Crear Cuenta Anual PyG'
      Hint = 'Crear Cuenta Anual P&G'
      ImageIndex = 65
    end
    object LFCategoryAction7: TLFCategoryAction
      Category = 'Procesos;"CrearCuentaAnual35"'
      Caption = 'Crear Cuenta Anual Estado de Gastos e Ingresos'
      Hint = 'Crear Cuenta Anual Estado de Gastos e Ingresos'
      ImageIndex = 65
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBArrastre.Checked')
    Left = 340
    Top = 240
  end
end
