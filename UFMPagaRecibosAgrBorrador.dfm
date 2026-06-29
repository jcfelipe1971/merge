inherited FMPagaRecibosAgrBorrador: TFMPagaRecibosAgrBorrador
  Left = 256
  Top = 227
  HelpContext = 269
  ActiveControl = CBUnificaCuentaGastos
  Caption = 'Cobro Pago de Recibos desde Borrador'
  ClientHeight = 550
  ClientWidth = 941
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 941
    Height = 526
    OnExit = PMainExit
    inherited TBMain: TLFToolBar
      Width = 937
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabStop = True
      inherited NavMain: THYMNavigator
        Width = 110
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
      object TButtSeparador2: TToolButton
        Left = 195
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPaga: TToolButton
        Left = 203
        Top = 0
        Hint = 'Paga los Recibos'
        Caption = 'Paga los Recibos'
        ImageIndex = 19
        OnClick = TButtPagaClick
      end
      object TButtRecibosAgrupados: TToolButton
        Left = 226
        Top = 0
        Hint = 'Muestra los Recibos Agrupados'
        Caption = 'Muestra los Recibos Agrupados'
        ImageIndex = 83
        OnClick = TButtRecibosAgrupadosClick
      end
      object TButtSeparador1: TToolButton
        Left = 249
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LBLTipo: TLFLabel
        Left = 257
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
      object PNLCBSigno: TLFPanel
        Left = 297
        Top = 0
        Width = 99
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object CBSigno: TLFComboBox
          Left = 0
          Top = 0
          Width = 99
          Height = 21
          Hint = 'Signo de la operaci'#243'n'
          Style = csDropDownList
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = CBSignoChange
          OnExit = CBSignoExit
          Items.Strings = (
            'Cobros'
            'Pagos'
            'Cobros/Pagos')
        end
      end
      object ToolButton3: TToolButton
        Left = 396
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLCBProcedimiento: TLFPanel
        Left = 404
        Top = 0
        Width = 182
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object CBProcedimiento: TLFComboBox
          Left = 1
          Top = 0
          Width = 180
          Height = 21
          Hint = 'Signo de la operaci'#243'n'
          Style = csDropDownList
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = CBProcedimientoChange
          Items.Strings = (
            'Pago Agrupado de Recibos'
            'Agrupacion de Recibos'
            'Agrupacion y Pago de Recibos')
        end
      end
      object EFTipoAsientoKri: TLFEditFind2000
        Left = 586
        Top = 0
        Width = 44
        Height = 22
        TabOrder = 4
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
      object TButReciboNuevo: TToolButton
        Left = 630
        Top = 0
        Hint = 'Crear un recibo'
        Caption = 'Crear recibo'
        ImageIndex = 75
        OnClick = TButReciboNuevoClick
      end
    end
    object PNDatos: TLFPanel
      Left = 2
      Top = 28
      Width = 937
      Height = 102
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LBLCuenta: TLFLabel
        Left = 3
        Top = 31
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
        Left = 51
        Top = 8
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
        Left = 594
        Top = 8
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
        Left = 585
        Top = 30
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
        Left = 608
        Top = 52
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
        Top = 3
        Width = 71
        Height = 23
        Caption = 'Permuta'
        Flat = True
        Visible = False
        OnClick = TButtPermutaProvAcreeClick
      end
      object LSerie: TLFLabel
        Left = 59
        Top = 52
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
      object LCodigoBarras: TLFLabel
        Left = 615
        Top = 74
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
        Top = 26
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
      object EFCtaPago: TLFEditFind2000
        Left = 88
        Top = 26
        Width = 91
        Height = 21
        TabOrder = 4
        OnChange = EFCtaPagoChange
        OnEnter = EFCtaPagoEnter
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
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCtaPagoBusqueda
        OrdenadoPor.Strings = (
          'cuenta')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMBorradorContabilidad.EntornoFind
      end
      object ECuenta: TLFEdit
        Left = 180
        Top = 26
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
        TabOrder = 5
      end
      object EFCli_Pro: TLFEditFind2000
        Left = 88
        Top = 4
        Width = 91
        Height = 21
        TabOrder = 0
        OnChange = EFCli_ProChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ECli_Pro: TLFEdit
        Left = 180
        Top = 4
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
      object HYGRECantidad: TLFEdit
        Left = 675
        Top = 26
        Width = 91
        Height = 21
        TabOrder = 10
        OnChange = HYGRECantidadChange
        OnExit = HYGRECantidadExit
      end
      object RETOTImportes: THYGRightEdit
        Left = 675
        Top = 48
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
        TabOrder = 11
        Text = '0'
      end
      object EFormaPago: TLFEdit
        Left = 132
        Top = 26
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
        TabOrder = 3
      end
      object DBDTPApunte: TLFDBDateEdit
        Left = 675
        Top = 4
        Width = 91
        Height = 21
        Hint = 'Fecha de asiento'
        DataField = 'FECHA'
        DataSource = DMBorradorContabilidad.DSQMAsientos
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 9
      end
      object CBUnificaCuentaGastos: TLFCheckBox
        Left = 483
        Top = 28
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
      object EFFormaPago: TLFEditFind2000
        Left = 88
        Top = 26
        Width = 43
        Height = 21
        TabOrder = 2
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FORMA_PAGO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSerie: TLFEditFind2000
        Left = 88
        Top = 48
        Width = 64
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
      object ESerie: TLFEdit
        Left = 153
        Top = 48
        Width = 327
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
        TabOrder = 8
      end
      object ECodigoBarras: TLFEdit
        Left = 675
        Top = 70
        Width = 91
        Height = 21
        Hint = 'Id del vencimiento a cobrar/pagar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnKeyPress = ECodigoBarrasKeyPress
      end
    end
    object PNLCPRecMarcados: TLFPanel
      Left = 2
      Top = 392
      Width = 937
      Height = 132
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object TBCPRecMarcados: TLFToolBar
        Left = 0
        Top = 0
        Width = 937
        Height = 23
        ButtonHeight = 21
        EdgeBorders = []
        EdgeInner = esNone
        Flat = True
        TabOrder = 0
        Separators = True
        object NavCPRecMarc: THYMNavigator
          Left = 0
          Top = 0
          Width = 110
          Height = 21
          DataSource = DMPagaRecibosAgrBorrador.DSQMCPRecMarcados
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
        Top = 23
        Width = 937
        Height = 109
        TabStop = False
        Align = alClient
        DataSource = DMPagaRecibosAgrBorrador.DSQMCPRecMarcados
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
            Width = 106
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
            Visible = True
          end>
      end
    end
    object PNLRecibos: TLFPanel
      Left = 2
      Top = 130
      Width = 937
      Height = 262
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PNLRecibos'
      TabOrder = 3
      object HYDBGRecibos: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 937
        Height = 262
        Align = alClient
        DataSource = DMPagaRecibosAgrBorrador.DSQMRecibos
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 8
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
          'LIQUIDO')
        CamposNoAccesibles.Strings = (
          'DOC_SERIE'
          'DOC_NUMERO'
          'LINEA'
          'RECIBIDO'
          'REGISTRO'
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
            Width = 70
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
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ENTRADA'
            Width = 40
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
            FieldName = 'OBSERVACIONES'
            ReadOnly = True
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 526
    Width = 941
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PMain
    Left = 440
    Top = 166
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 520
    Top = 166
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
    object APaga: TAction
      Caption = 'Pagar'
      Hint = 'Parar recibos'
      ImageIndex = 19
      ShortCut = 16468
      OnExecute = APagaExecute
    end
  end
end
