object FMOrdenesDePago: TFMOrdenesDePago
  Left = 238
  Top = 188
  Width = 1070
  Height = 586
  HelpContext = 272
  Caption = 'Ordenes de Pago'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 1062
    Height = 22
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 220
      Height = 22
      DataSource = DMOrdenesDePago.DSQMOrdenPago
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = DBETituloOrden
      InsertaControl = DBETituloOrden
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TSepNav: TToolButton
      Left = 220
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPMain: THYMEditPanel
      Left = 228
      Top = 0
      Width = 46
      Height = 22
      VisibleButtons = [neRango, neSalir]
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
      ControlEdit = CEMain
      OnClickRango = EPMainClickRango
    end
    object PNLVerSaldos: TLFPanel
      Left = 274
      Top = 0
      Width = 96
      Height = 22
      BevelOuter = bvNone
      TabOrder = 2
      object CBVerSaldos: TLFCheckBox
        Left = 4
        Top = 3
        Width = 90
        Height = 17
        Caption = 'Ver Saldos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBVerSaldosChange
      end
    end
  end
  object PCMain: TLFPageControl
    Left = 0
    Top = 22
    Width = 1062
    Height = 513
    ActivePage = TSFicha
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSFicha: TTabSheet
      Caption = '&Ficha'
      OnShow = TSFichaShow
      object SBARic: TSpeedButton
        Left = 264
        Top = 96
        Width = 57
        Height = 25
        GroupIndex = -1
        OnDblClick = MIIrAAsiento1Click
      end
      object SBABanco: TSpeedButton
        Left = 167
        Top = 59
        Width = 366
        Height = 19
        Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
        GroupIndex = -1
        OnClick = ABancoExecute
      end
      object PEdit: TLFPanel
        Left = 0
        Top = 0
        Width = 1054
        Height = 133
        Align = alTop
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object LBLOrden: TLFLabel
          Left = 39
          Top = 8
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Orden'
        end
        object LBanco: TLFLabel
          Left = 37
          Top = 30
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Banco'
        end
        object LFecha: TLFLabel
          Left = 38
          Top = 51
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha'
        end
        object LImporte: TLFLabel
          Left = 386
          Top = 51
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe'
        end
        object LFLCodigo: TLFLabel
          Left = 388
          Top = 74
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo'
        end
        object LBLNAsiento: TLFLabel
          Left = 358
          Top = 96
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'm. Asiento'
        end
        object DBEConfirming: TLFDbedit
          Left = 71
          Top = 4
          Width = 50
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'NUM_ORDEN'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEFBanco: TLFDBEditFind2000
          Left = 71
          Top = 26
          Width = 50
          Height = 21
          DataField = 'BANCO'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          TabOrder = 2
          OnChange = DBEFBancoChange
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'BANCO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'ACTIVO = 1'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloBanco: TLFEdit
          Left = 122
          Top = 26
          Width = 401
          Height = 21
          TabStop = False
          Color = clAqua
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
        object DBDTPFecha: TLFDBDateEdit
          Left = 71
          Top = 48
          Width = 106
          Height = 21
          DataField = 'FECHA'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 4
        end
        object DBEImporte: TLFDbedit
          Left = 423
          Top = 48
          Width = 100
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'IMPORTE'
          DataSource = DMOrdenesDePago.DSxInfoActualizada
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBETituloOrden: TLFDbedit
          Left = 122
          Top = 4
          Width = 401
          Height = 21
          DataField = 'TITULO'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          TabOrder = 1
        end
        object DBCHKCerrada: TLFDBCheckBox
          Left = 71
          Top = 114
          Width = 98
          Height = 17
          Caption = '&Cerrada'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 7
          TabStop = True
          Alignment = taLeftJustify
          OnChange = DBCHKCerradaChange
          DataField = 'CERRADO'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          ReadOnly = True
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCHKDetalleCargos: TLFDBCheckBox
          Left = 71
          Top = 99
          Width = 210
          Height = 17
          Hint = 'Cargos del banco detallados'
          Caption = '&Detalle de cargos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 6
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'DETALLE_CARGOS'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFDBECodigo: TLFDbedit
          Left = 423
          Top = 70
          Width = 100
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'COD_NORMA34'
          DataSource = DMOrdenesDePago.DSxInfoActualizada
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
        object DBERic: TLFDbedit
          Left = 423
          Top = 92
          Width = 100
          Height = 21
          AutoSize = False
          Color = clAqua
          DataField = 'ASIENTO'
          DataSource = DMOrdenesDePago.DSxInfoActualizada
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          OnDblClick = MIIrAAsiento1Click
        end
        object DBCHKNormaGenerada: TLFDBCheckBox
          Left = 176
          Top = 113
          Width = 129
          Height = 17
          Caption = 'Norma Generada'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'NORMA_CREADA'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBRGGastos: TDBRadioGroup
          Left = 72
          Top = 69
          Width = 265
          Height = 30
          Caption = 'Gastos'
          Columns = 3
          DataField = 'GASTOS'
          DataSource = DMOrdenesDePago.DSQMOrdenPago
          Items.Strings = (
            'Ordenante'
            'Beneficiario'
            'Compartidos')
          TabOrder = 5
          Values.Strings = (
            '0'
            '1'
            '2')
        end
      end
      object PDetalle: TLFPanel
        Left = 0
        Top = 133
        Width = 1054
        Height = 352
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1054
          Height = 301
          Align = alClient
          DataSource = DMOrdenesDePago.DSQMDetalle
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalleCellClick
          OnDrawColumnCell = DBGFDetalleDrawColumnCell
          OnDblClick = DBGFDetalleDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = True
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
            'COD_CLI_PRO'
            'CTA_PAGO'
            'DOC_NUMERO'
            'LIQUIDO'
            'MONEDA'
            'TIPO_EFECTO'
            'VENCIMIENTO'
            'PAGADO'
            'TITULO'
            'REGISTRO'
            'NUM_FACTURA')
          ColumnasCheckBoxes.Strings = (
            'PAGADO'
            'ORD_PAGO')
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
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REGISTRO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DOC_SERIE'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DOC_NUMERO'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COD_CLI_PRO'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 190
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VENCIMIENTO'
              ReadOnly = True
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CTA_PAGO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              ReadOnly = True
              Width = 29
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PAGADO'
              ReadOnly = True
              Width = 29
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_EFECTO'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORD_PAGO'
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NUM_FACTURA'
              ReadOnly = True
              Visible = True
            end>
        end
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 1054
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 176
            Height = 22
            DataSource = DMOrdenesDePago.DSQMDetalle
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ConfirmDelete = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = False
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TButtSep2: TToolButton
            Left = 176
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtMostrarDisponibles: TToolButton
            Left = 184
            Top = 0
            Hint = 'Mostrar todos los recibos disponibles'
            Caption = 'Mostrar Disponibles'
            ImageIndex = 30
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtMostrarDisponiblesClick
          end
          object EPDetalle: THYMEditPanel
            Left = 207
            Top = 0
            Width = 23
            Height = 22
            VisibleButtons = [neRango]
            Hints.Strings = (
              'Buscar'
              'B'#250'squeda aproximada'
              'B'#250'squeda exacta'
              'Imprime pantalla'
              'Filtrar los recibos disponibles'
              'Imprime report'
              'Copiar'
              'Cortar'
              'Pegar'
              'Cerrar la ventana')
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            SalirCaption = 'Salida'
            SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
            ShowHint = True
            TabOrder = 1
            Flat = True
            Exclusivo = True
            ControlEdit = CEDetalle
            OnClickRango = EPDetalleClickRango
          end
          object TButtSeleccionarTodas: TToolButton
            Left = 230
            Top = 0
            Hint = 'Seleccionar todos los recibos'
            Caption = 'Seleccionar Todas'
            ImageIndex = 146
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtSeleccionarTodasClick
          end
          object TButtSep5: TToolButton
            Left = 253
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtAbreOCierra: TToolButton
            Left = 261
            Top = 0
            Hint = 'Abrir la Orden de Pago'
            Caption = 'Abrir'
            ImageIndex = 67
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtAbreOCierraClick
          end
          object ToolButton1: TToolButton
            Left = 284
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtGeneraConfirming: TToolButton
            Left = 292
            Top = 0
            Hint = 'Generamos Formato CSB 34'
            Caption = 'Genera Confirming'
            DropdownMenu = PPFormatos
            ImageIndex = 41
            ParentShowHint = False
            ShowHint = True
            Style = tbsDropDown
          end
          object ToolButton2: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBDatosRecibo: TToolButton
            Left = 336
            Top = 0
            Hint = 'Informacion sobre recibos importados.'
            Caption = 'TBDatosRecibo'
            ImageIndex = 1
            OnClick = TBDatosReciboClick
          end
          object ToolButton4: TToolButton
            Left = 359
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object PNLFiltro: TLFPanel
            Left = 367
            Top = 0
            Width = 98
            Height = 22
            TabOrder = 2
            object SBAcreedores: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 22
              Hint = 'Acreedores'
              Caption = 'A'
              OnClick = BotonPNLFiltroClick
            end
            object SBProveedores: TSpeedButton
              Left = 25
              Top = 0
              Width = 23
              Height = 22
              Hint = 'Proveedores'
              Caption = 'P'
              OnClick = BotonPNLFiltroClick
            end
            object SBIndemnizaciones: TSpeedButton
              Left = 48
              Top = 0
              Width = 23
              Height = 22
              Hint = 'Indemnizaciones'
              Caption = 'I'
              OnClick = BotonPNLFiltroClick
            end
            object EFEmpresaIndemnizacion: TLFEditFind2000
              Left = 72
              Top = 0
              Width = 25
              Height = 21
              TabOrder = 0
              OnChange = EFEmpresaIndemnizacionChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'LET_DIGITO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'NUM_DIGITO=1'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'CON_CENTROS_COSTE'
              Tabla_asociada.DesplegarBusqueda = False
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
        object PNLSaldos: TLFPanel
          Left = 0
          Top = 323
          Width = 1054
          Height = 29
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object LSaldoDeudor: TLFLabel
            Left = 148
            Top = 8
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo Deu.'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object LSaldoAcreedor: TLFLabel
            Left = 298
            Top = 8
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo Acr.'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object LSaldo: TLFLabel
            Left = 465
            Top = 8
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object DBESaldoDeudor: TLFDbedit
            Left = 205
            Top = 4
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO_DEUDOR'
            DataSource = DMOrdenesDePago.DSQMDetalle
            Enabled = False
            TabOrder = 0
          end
          object DBESaldoAcreedor: TLFDbedit
            Left = 351
            Top = 4
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO_ACREEDOR'
            DataSource = DMOrdenesDePago.DSQMDetalle
            Enabled = False
            TabOrder = 1
          end
          object DBESaldo: TLFDbedit
            Left = 496
            Top = 4
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMOrdenesDePago.DSQMDetalle
            Enabled = False
            TabOrder = 2
          end
        end
      end
    end
    object TSTabla: TTabSheet
      Caption = '&Tabla'
      ImageIndex = 1
      OnShow = TSTablaShow
      object HYDBGConfirming: THYTDBGrid
        Left = 0
        Top = 0
        Width = 1054
        Height = 485
        Align = alClient
        Color = clInfoBk
        DataSource = DMOrdenesDePago.DSQMOrdenPago
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        TabFicha = TSFicha
        PermutaPaneles = True
        CamposAMarcar.Strings = (
          'CERRADO')
        CamposChecked.Strings = (
          '1')
        CamposNoChecked.Strings = (
          '0')
        CamposAOrdenar.Strings = (
          'BANCO'
          'CERRADO'
          'FECHA'
          'IMPORTE'
          'NUM_CONFIRMING'
          'TITULO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'NUM_ORDEN'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Width = 298
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CERRADO'
            Width = 42
            Visible = True
          end>
      end
    end
  end
  object TBActions: TLFToolBar
    Left = 0
    Top = 535
    Width = 1062
    Height = 24
    Align = alBottom
    ButtonHeight = 21
    ButtonWidth = 51
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    List = True
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    ActionList = ALMain
    Separators = True
  end
  object CEMain: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PanelEdicion = PEdit
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 412
    Top = 18
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 440
    Top = 18
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEMainMiSep: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEMainMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 476
    Top = 17
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 505
    Top = 17
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEDetalleMiSep: TMenuItem
      Caption = '-'
    end
    object CEDetalleMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEDetalleMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEDetalleMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEDetalleMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEDetalleMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEDetalleMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEDetalleMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEDetalleMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEDetalleMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEDetalleMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
      Visible = False
    end
  end
  object PPFormatos: TPopUpTeclas
    Images = DMMain.ILMain_Ac
    Left = 537
    Top = 17
    object MINormaCSB34: TMenuItem
      Caption = 'Norma CSB 34'
      Hint = 'Norma CSB 34 (Noviembre 2003)'
      ImageIndex = 143
      OnClick = MINormaCSB34Click
    end
    object MINormaCSB34_1: TMenuItem
      Caption = 'Norma CSB 34.1'
      Hint = 'Norma CSB 34.1'
      ImageIndex = 143
      OnClick = MINormaCSB34_1Click
    end
    object MINormaCSB34_1_Banesto: TMenuItem
      Caption = 'Norma CSB 34.1 Banesto'
      Hint = 'Norma CSB 34.1 Banesto'
      ImageIndex = 143
      OnClick = MINormaCSB34_1_BanestoClick
    end
    object MINormaCSB34_1_Pastor: TMenuItem
      Caption = 'Norma CSB 34.1 Pastor'
      Hint = 'Norma CSB 34.1 Pastor'
      ImageIndex = 143
      OnClick = MINormaCSB34_1_PastorClick
    end
    object MINormaCSB34_1_Bankinter: TMenuItem
      Caption = 'Norma CSB 34.1 Bankinter'
      Hint = 'Norma CSB 34.1 Bankinter'
      ImageIndex = 143
      OnClick = MINormaCSB34_1_BankinterClick
    end
    object MINormaCSB34_1_BancoPopular: TMenuItem
      Caption = 'Norma CSB 34.14 Banco Popular'
      Hint = 'Norma CSB 34.14 Banco Popular'
      ImageIndex = 143
      OnClick = MINormaCSB34_1_BancoPopularClick
    end
    object MISEPA: TMenuItem
      Caption = 'SEPA'
      OnClick = MISEPAClick
    end
    object MIIrAAsiento1: TMenuItem
      Caption = 'Ir a Asiento de cierre'
      Hint = 'Ir al asiento de cierre de la norma 34'
      ImageIndex = 30
      OnClick = MIIrAAsiento1Click
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 346
    Top = 20
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 380
    Top = 18
    object AImpresion: TAction
      Category = 'Listados'
      Caption = 'Listados de Orden de Pago'
      Hint = 'Listados de Orden de Pago'
      ImageIndex = 14
      OnExecute = AImpresionExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ABanco: TAction
      Category = 'Procesos'
      Caption = 'Filtrar Banco'
      Hint = 'Muestra banco asociado a la remesa'
      ImageIndex = 30
      OnExecute = ABancoExecute
    end
  end
end
