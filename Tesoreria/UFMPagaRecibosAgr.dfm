inherited FMPagaRecibosAgr: TFMPagaRecibosAgr
  Left = 265
  Top = 162
  Width = 951
  Height = 577
  HelpContext = 269
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'C/P de Recibos Agrupados'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 941
    Height = 524
    inherited TBMain: TLFToolBar
      Width = 937
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 3
      inherited NavMain: THYMNavigator
        Width = 110
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
      object ToolButton1: TToolButton
        Left = 195
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPaga: TToolButton
        Left = 203
        Top = 0
        Hint = 'Paga/Cobra los Recibos'
        Caption = 'Paga/Cobra los Recibos'
        ImageIndex = 19
        OnClick = TButtPagaClick
      end
      object TButtRecibosAgrupados: TToolButton
        Left = 226
        Top = 0
        Hint = 'Muestra los Recibos Agrupados'
        Caption = 'Recibos Agrupados'
        ImageIndex = 4
        OnClick = TButtRecibosAgrupadosClick
      end
      object TBImprimeReciboKri: TToolButton
        Left = 249
        Top = 0
        Caption = 'Imprimir Recibo'
        ImageIndex = 14
        OnClick = TBImprimeReciboKriClick
      end
      object TButtSeparador1: TToolButton
        Left = 272
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LBLTipo: TLFLabel
        Left = 280
        Top = 0
        Width = 40
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object CBSigno: TLFComboBox
        Left = 320
        Top = 0
        Width = 95
        Height = 21
        Hint = 'Signo de la operaci'#243'n'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBSignoChange
        OnExit = CBSignoExit
        Items.Strings = (
          'Cobros'
          'Pagos'
          'Cobros/Pagos')
      end
      object ToolButton2: TToolButton
        Left = 415
        Top = 0
        Width = 10
        Style = tbsSeparator
      end
      object CBProcedimiento: TLFComboBox
        Left = 425
        Top = 0
        Width = 180
        Height = 21
        Hint = 'Signo de la operaci'#243'n'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        OnChange = CBProcedimientoChange
        Items.Strings = (
          'Pago Agrupado de Recibos'
          'Agrupacion de Recibos'
          'Agrupacion y Pago de Recibos')
      end
      object EFTipoAsientoKri: TLFEditFind2000
        Left = 605
        Top = 0
        Width = 44
        Height = 22
        AutoSize = False
        TabOrder = 4
        OnChange = EFTipoAsientoKriChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
      end
      object TButtSeparador2: TToolButton
        Left = 649
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object BSoloAgrupaKri: TButton
        Left = 657
        Top = 0
        Width = 75
        Height = 22
        Hint = 'Agrupacion de recibos de Cliente y Proveedor/Acreedor.'
        Caption = 'Solo Agrupa'
        TabOrder = 5
        OnClick = BSoloAgrupaKriClick
      end
      object TButtListado: TToolButton
        Left = 732
        Top = 0
        Hint = 'Listado de Agrupaci'#243'n de Recibos'
        Caption = 'Listado de Agrupaci'#243'n de Recibos'
        DropdownMenu = PMListado
        ImageIndex = 14
        Style = tbsDropDown
        OnClick = TButtListadoClick
      end
      object TButReciboNuevo: TToolButton
        Left = 768
        Top = 0
        Hint = 'Crear un recibo'
        Caption = 'Crear recibo'
        ImageIndex = 75
        Visible = False
        OnClick = TButReciboNuevoClick
      end
    end
    object PNDatos: TLFPanel
      Left = 2
      Top = 28
      Width = 937
      Height = 88
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object LBLCuenta: TLFLabel
        Left = 4
        Top = 27
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cuenta de Cobro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LBLCliPro: TLFLabel
        Left = 52
        Top = 6
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LBLFecha: TLFLabel
        Left = 595
        Top = 6
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha de Cobro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LBLCantidad: TLFLabel
        Left = 586
        Top = 27
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cantidad a Cobrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LImportes: TLFLabel
        Left = 609
        Top = 49
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tot. Importes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object SPBPermuta: TSpeedButton
        Left = 484
        Top = 0
        Width = 77
        Height = 23
        Caption = 'Permuta'
        Flat = True
        OnClick = TButtPermutaProvAcreeClick
      end
      object LSerie: TLFLabel
        Left = 60
        Top = 49
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LTipoEfecto: TLFLabel
        Left = 319
        Top = 48
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Efe.'
      end
      object LObservacionesVencimiento: TLFLabel
        Left = 13
        Top = 70
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observaciones'
      end
      object LCodigoBarras: TLFLabel
        Left = 616
        Top = 70
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cod. Barras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LErrorConversion: TLabel
        Left = 768
        Top = 23
        Width = 97
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = 'Error Conversion.'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
      object ETituloCuenta: TLFEdit
        Left = 180
        Top = 23
        Width = 300
        Height = 21
        TabStop = False
        Color = clInfoBk
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
      object EFCtaPago: TLFEditFind2000
        Left = 88
        Top = 23
        Width = 91
        Height = 21
        TabOrder = 2
        OnChange = EFCtaPagoChange
        OnExit = EFCtaPagoExit
        OnKeyDown = EFCtaPagoKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO=5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFormaPago: TLFEdit
        Left = 132
        Top = 23
        Width = 348
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Visible = False
      end
      object EFFormaPago: TLFEditFind2000
        Left = 101
        Top = 23
        Width = 43
        Height = 21
        TabOrder = 4
        Visible = False
        OnChange = EFFormaPagoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FORMA_PAGO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFormaPagoBusqueda
        OrdenadoPor.Strings = (
          'FORMA_PAGO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ECli_Pro: TLFEdit
        Left = 180
        Top = 1
        Width = 300
        Height = 21
        TabStop = False
        Color = clInfoBk
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
      object EFCli_Pro: TLFEditFind2000
        Left = 88
        Top = 1
        Width = 91
        Height = 21
        TabOrder = 0
        OnChange = EFCli_ProChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'NOMBRE_COMERCIAL')
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF_ALL'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DTPFecha: TLFDateEdit
        Left = 675
        Top = 1
        Width = 91
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 12
      end
      object HYGRECantidad: TLFEdit
        Left = 675
        Top = 23
        Width = 91
        Height = 21
        TabOrder = 13
        OnChange = HYGRECantidadChange
        OnExit = HYGRECantidadExit
      end
      object RETOTImportes: THYGRightEdit
        Left = 675
        Top = 45
        Width = 91
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        Text = '0'
      end
      object CBUnificaCuentaGastos: TLFCheckBox
        Left = 483
        Top = 26
        Width = 95
        Height = 17
        Hint = 'Unifica la cuenta de cobro/pago'
        Caption = 'Unifica Cuentas Cobro/Pago'
        ClicksDisabled = False
        ColorCheck = 57088
        ShowHint = True
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
      end
      object ESerie: TLFEdit
        Left = 159
        Top = 45
        Width = 150
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object ETipoEfecto: TLFEdit
        Left = 426
        Top = 45
        Width = 150
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object EFSerie: TLFEditFind2000
        Left = 88
        Top = 45
        Width = 70
        Height = 21
        TabOrder = 7
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTipoEfecto: TLFEditFind2000
        Left = 365
        Top = 45
        Width = 60
        Height = 21
        TabOrder = 9
        OnChange = EFTipoEfectoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TIPO_EFECTO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EObservaciones: TLFEdit
        Left = 88
        Top = 67
        Width = 488
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 11
      end
      object ECodigoBarras: TLFEdit
        Left = 675
        Top = 67
        Width = 91
        Height = 21
        Hint = 'Id del vencimiento a cobrar/pagar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        OnKeyPress = ECodigoBarrasKeyPress
      end
    end
    object PNLRecibos: TLFPanel
      Left = 2
      Top = 116
      Width = 937
      Height = 242
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object HYDBGRecibos: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 937
        Height = 242
        Align = alClient
        DataSource = DMPagaRecibosAgr.DSQMRecibos
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = HYDBGRecibosCellClick
        OnDrawColumnCell = HYDBGRecibosDrawColumnCell
        OnDblClick = HYDBGRecibosDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = False
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'DOC_NUMERO'
          'DOC_SERIE'
          'REGISTRO'
          'LINEA'
          'RECIBIDO'
          'VENCIMIENTO'
          'MONEDA'
          'LIQUIDO'
          'NUM_FACTURA'
          'FORMA_PAGO')
        CamposNoAccesibles.Strings = (
          'LINEA'
          'RECIBIDO'
          'VENCIMIENTO'
          'LIQUIDO'
          'MONEDA')
        ColumnasCheckBoxes.Strings = (
          'ENTRADA'
          'RECIBIDO')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        CamposCalcAOrdenar.Strings = (
          'LIQUIDO_MONEDA')
        CamposCalcReferencia.Strings = (
          'LIQUIDO')
        OrdenMultiple = True
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DOC_NUMERO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DOC_SERIE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'REGISTRO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VENCIMIENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'liquido_moneda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 88
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'MONEDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 36
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clInfoBk
            Expanded = False
            FieldName = 'RECIBIDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Caption = 'Recibido'
            Width = 45
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ENTRADA'
            Width = 36
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SU_REFERENCIA'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NUM_FACTURA'
            ReadOnly = True
            Width = 120
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FORMA_PAGO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FOLIO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'OBSERVACIONES'
            ReadOnly = True
            Visible = True
          end>
      end
    end
    object PNLCPRecMarcados: TLFPanel
      Left = 2
      Top = 358
      Width = 937
      Height = 164
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object TBCPRecMarcados: TLFToolBar
        Left = 0
        Top = 0
        Width = 937
        Height = 24
        ButtonHeight = 21
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        TabOrder = 0
        Separators = True
        object NavCPRecMarc: THYMNavigator
          Left = 0
          Top = 2
          Width = 110
          Height = 21
          DataSource = DMPagaRecibosAgr.DSQMCPRecMarcados
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
      object HYDBGCPRecMarc: THYTDBGrid
        Left = 0
        Top = 24
        Width = 937
        Height = 140
        Align = alClient
        DataSource = DMPagaRecibosAgr.DSQMCPRecMarcados
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = False
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIPO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 41
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COD_CLI_PRO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CUENTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 142
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CANTIDAD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 94
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 115
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RECIBOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 87
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 524
    Width = 941
    ActionList = nil
  end
  inherited CEMain: TControlEdit
    Left = 848
    Top = 40
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 880
    Top = 8
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 880
    Top = 40
    object APaga: TAction
      Caption = 'Pagar'
      Hint = 'Paga los Recibos'
      ImageIndex = 19
      ShortCut = 16468
      OnExecute = APagaExecute
    end
    object AAbreDocumento: TAction
      Caption = 'Abrir Documento'
      Hint = 'Abrir documento'
      OnExecute = AAbreDocumentoExecute
    end
    object AAbreRecibo: TAction
      Caption = 'Abrir Recibo'
      Hint = 'Abrir Recibo'
      OnExecute = AAbreReciboExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 848
    Top = 72
  end
  object PMListado: TPopupMenu
    Left = 848
    Top = 8
    object CartadeRecibosAgrupados: TMenuItem
      Caption = 'Carta de Recibos Agrupados'
      Hint = 'Carta de Recibos Agrupados'
      OnClick = TButtListadoClick
    end
    object EnviarCartadeRecibosAgrupados1: TMenuItem
      Caption = 'Enviar Carta de Recibos Agrupados por email'
      Hint = 'Enviar Carta de Recibos Agrupados por email'
      OnClick = EnviarCartadeRecibosAgrupados1Click
    end
    object Sep1: TMenuItem
      Caption = '-'
    end
    object ConfCartadeRecibosAgr: TMenuItem
      Caption = 'Conf. R'#225'pida de Carta de Recibos Agr.'
      Hint = 'Conf. R'#225'pida de Carta de Recibos Agr.'
      OnClick = ConfCartadeRecibosAgrClick
    end
  end
end
