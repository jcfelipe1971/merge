inherited FMRemesas: TFMRemesas
  Left = 402
  Top = 163
  Width = 1219
  Height = 493
  HelpContext = 264
  ActiveControl = NavMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Remesas'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1209
    Height = 192
    TabOrder = 2
    inherited TBMain: TLFToolBar
      Width = 1205
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      inherited NavMain: THYMNavigator
        DataSource = DMRemesas.DSQMRemesas
        Hints.Strings = ()
        EditaControl = DBETituloRemesa
        InsertaControl = DBETituloRemesa
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMRemesas.DSQMRemesas
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object ToolButton3: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LTipo: TLFLabel
        Left = 327
        Top = 0
        Width = 40
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object CBTipoRemesa: TLFComboBox
        Left = 367
        Top = 0
        Width = 69
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBTipoRemesaChange
        Items.Strings = (
          'Remesas'
          'Pagar'#233's')
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1205
      Height = 162
      inherited TSFicha: TTabSheet
        object SBABanco: TSpeedButton [0]
          Left = 167
          Top = 59
          Width = 366
          Height = 19
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = ABancoExecute
        end
        inherited PEdit: TLFPanel
          Width = 1197
          Height = 134
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'EMP_CARTERA_REMESAS'
            CampoNum = 'REMESA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'REMESA')
          end
          object LRemesa: TLFLabel
            Left = 51
            Top = 24
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Remesa'
          end
          object LBanco: TLFLabel
            Left = 59
            Top = 46
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LFecha: TLFLabel
            Left = 60
            Top = 68
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LRiesgo: TLFLabel
            Left = 509
            Top = 24
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Riesgo'
          end
          object LImporte: TLFLabel
            Left = 507
            Top = 46
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LBLTipo_asiento: TLFLabel
            Left = 285
            Top = 68
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Asiento'
          end
          object DBERemesa: TLFDbedit
            Left = 94
            Top = 20
            Width = 50
            Height = 21
            Color = clInfoBk
            DataField = 'REMESA'
            DataSource = DMRemesas.DSQMRemesas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBERemesaChange
          end
          object DBEFBanco: TLFDBEditFind2000
            Left = 94
            Top = 42
            Width = 50
            Height = 21
            DataField = 'BANCO'
            DataSource = DMRemesas.DSQMRemesas
            TabOrder = 2
            OnChange = DBEFBancoChange
            OnExit = DBEFBancoExit
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
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloBanco: TLFDbedit
            Left = 145
            Top = 42
            Width = 310
            Height = 21
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMRemesas.DSxBancos
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
            Left = 94
            Top = 64
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMRemesas.DSQMRemesas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DBERiesgo: TLFDbedit
            Left = 546
            Top = 20
            Width = 92
            Height = 21
            Color = clInfoBk
            DataField = 'RIESGO_REMESA'
            DataSource = DMRemesas.DSxInfoActualizada
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
          object DBEImporte: TLFDbedit
            Left = 546
            Top = 42
            Width = 92
            Height = 21
            Color = clInfoBk
            DataField = 'IMPORTE_REMESA'
            DataSource = DMRemesas.DSxInfoActualizada
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
          object DBETituloRemesa: TLFDbedit
            Left = 145
            Top = 20
            Width = 310
            Height = 21
            DataField = 'TITULO'
            DataSource = DMRemesas.DSQMRemesas
            TabOrder = 1
          end
          object DBCHKTipoRemesa: TLFDBCheckBox
            Left = 232
            Top = 87
            Width = 145
            Height = 17
            Caption = '&Remesa a la Vista'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TIPO_REMESA'
            DataSource = DMRemesas.DSQMRemesas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GBEstado: TGroupBox
            Left = 502
            Top = 66
            Width = 227
            Height = 41
            Caption = 'Estado'
            Enabled = False
            TabOrder = 11
            object DBCHKCerrada: TLFDBCheckBox
              Left = 13
              Top = 16
              Width = 60
              Height = 17
              Caption = '&Cerrada'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = DBCHKCerradaChange
              DataField = 'CERRADA'
              DataSource = DMRemesas.DSQMRemesas
              ReadOnly = True
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKAbono: TLFDBCheckBox
              Left = 79
              Top = 16
              Width = 69
              Height = 17
              Caption = '&Abonada'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ABONADA'
              DataSource = DMRemesas.DSQMRemesas
              ReadOnly = True
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKVencida: TLFDBCheckBox
              Left = 152
              Top = 16
              Width = 65
              Height = 17
              Caption = '&Vencida'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Visible = False
              Alignment = taLeftJustify
              DataField = 'VENCIDA'
              DataSource = DMRemesas.DSQMRemesas
              ReadOnly = True
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBEFTipo_asiento: TLFDBEditFind2000
            Left = 363
            Top = 64
            Width = 92
            Height = 21
            DataField = 'TIPO_ASIENTO_KRI'
            DataSource = DMRemesas.DSQMRemesas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBDEFechaVencimiento: TLFDBDateEdit
            Left = 94
            Top = 86
            Width = 87
            Height = 21
            DataField = 'FECHA_VENCIMIENTO'
            DataSource = DMRemesas.DSQMRemesas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBCBFuerzaVencimiento: TLFDBCheckBox
            Left = 0
            Top = 87
            Width = 90
            Height = 17
            Caption = 'Fuerza Venc.'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBFuerzaVencimientoChange
            DataField = 'FUERZA_VENCIMIENTO'
            DataSource = DMRemesas.DSQMRemesas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 810
          Height = 134
          DataSource = DMRemesas.DSQMRemesas
          OnCellClick = DBGMainCellClick
          OnDblClick = DBGMainDblClick
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'CERRADA')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'BANCO'
            'CERRADA'
            'FECHA'
            'IMPORTE_REMESA'
            'REMESA'
            'RIESGO_REMESA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'REMESA'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_REMESA'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIESGO_REMESA'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 341
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CERRADA'
              Width = 41
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 440
    Width = 1209
    ParentColor = False
    TabOrder = 0
  end
  inherited PDetalle: TLFPanel [2]
    Top = 192
    Width = 1209
    Height = 248
    TabOrder = 1
    inherited TBDetalle: TLFToolBar
      Width = 1209
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 176
        DataSource = DMRemesas.DSQMDetalle
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
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
        Hint = 'Mostrar todos los Recibos disponibles'
        Caption = 'Mostrar Disponibles'
        ImageIndex = 83
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMostrarDisponiblesClick
      end
      object EPDetalle: THYMEditPanel
        Left = 207
        Top = 0
        Width = 23
        Height = 22
        DataSource = DMRemesas.DSQMRemesas
        VisibleButtons = [neRango]
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 0
        Flat = True
        Exclusivo = True
        ControlEdit = CEDetalle
        OnClickRango = EPDetalleClickRango
      end
      object TButtSeleccionarTodas: TToolButton
        Left = 230
        Top = 0
        Hint = 'Seleccionar todos los Recibos'
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
      object TButtCerrarRemesa: TToolButton
        Left = 261
        Top = 0
        Hint = 'Cerrar la Remesa'
        Caption = 'Cerrar Remesa'
        ImageIndex = 68
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtCerrarRemesaClick
      end
      object TButtSep4: TToolButton
        Left = 284
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtAbono: TToolButton
        Left = 292
        Top = 0
        Hint = 'Abonar Remesa'
        DropdownMenu = PMAbonarDesabonar
        ImageIndex = 30
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = MIAbonarRemesaClick
      end
      object TButtSep6: TToolButton
        Left = 328
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtGeneraRemesa: TToolButton
        Left = 336
        Top = 0
        Hint = 'Genera formato CSB'
        Caption = 'Genera Remesa'
        ImageIndex = 41
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = TButtGeneraRemesaClick
      end
      object TButtSep3: TToolButton
        Left = 372
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImpagoRecibo: TToolButton
        Left = 380
        Top = 0
        Hint = 'Generar el impagado del Recibo actual'
        DropdownMenu = PMPagoImpago
        ImageIndex = 42
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = TButtImpagoReciboClick
      end
      object TButtSep8: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPagaGastos: TToolButton
        Left = 424
        Top = 0
        Hint = 'Paga los Gastos del Impagado'
        Caption = 'Paga Gastos'
        DropdownMenu = PMPagaImpagoDespagaImpago
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = MIPagaGastosImpagadoClick
      end
      object ButtImprimirUnRecibo: TToolButton
        Left = 460
        Top = 0
        Hint = 'Imprimir el Recibo seleccionado'
        Caption = 'Imprimir Un Recibo'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = ButtImprimirUnReciboClick
      end
      object TButtDesvenceRecibo: TToolButton
        Left = 483
        Top = 0
        Hint = 'Desvence el vencimiento contabilizado'
        Caption = 'Desvence Recibo'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesvenceReciboClick
      end
      object ToolButton1: TToolButton
        Left = 506
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtonIrContabilidad: TToolButton
        Left = 514
        Top = 0
        Hint = 'Ir al Apunte contable'
        Caption = 'Ir al apunte contable'
        DropdownMenu = PMIrApunte
        ImageIndex = 18
        PopupMenu = PMIrApunte
        Style = tbsDropDown
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1209
      Height = 158
      Color = clWhite
      DataSource = DMRemesas.DSQMDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      IniStorage = FSMain
      AutoPostEnCheckBox = True
      Campos.Strings = (
        'AGRUP_COD_CLI_PRO_KRI')
      CamposAMostrar.Strings = (
        'AGRUP_COD_CLI_PRO_KRI'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CamposAOrdernar.Strings = (
        'DOC_NUMERO'
        'COD_CLI_PRO'
        'VENCIMIENTO'
        'CTA_PAGO'
        'LIQUIDO'
        'PAGADO'
        'TIPO_EFECTO'
        'IMPAGADO'
        'EJERCICIO_CARTERA'
        'MONEDA'
        'FECHA_VALOR'
        'ABONO'
        'NOMBRE_COMERCIAL'
        'NOMBRE_R_SOCIAL'
        'PAIS'
        'TITULO'
        'TERCERO'
        'ENTIDAD')
      ColumnasCheckBoxes.Strings = (
        'REMESA'
        'PAGADO'
        'IMPAGADO'
        'ABONO'
        'ORIGEN_IMPAGADO')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0')
      Numericos.Strings = (
        'CLIENTE')
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_CLIENTES_EF')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      CamposCalcAOrdenar.Strings = (
        'LIQUIDO_CANAL')
      CamposCalcReferencia.Strings = (
        'LIQUIDO')
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO_CARTERA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 46
          Visible = True
        end
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
          Width = 56
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
          ReadOnly = True
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOMBRE_COMERCIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 178
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOMBRE_R_SOCIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 219
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TERCERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clInfoBk
          Expanded = False
          FieldName = 'PAIS'
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
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = False
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
          Width = 62
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 62
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ENTIDAD'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CTA_PAGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 96
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO_CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 71
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
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PAGADO'
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
          FieldName = 'TIPO_EFECTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 63
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMESA'
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPAGADO'
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
          Color = clInfoBk
          Expanded = False
          FieldName = 'ORIGEN_IMPAGADO'
          ReadOnly = True
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ABONO'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGRUP_COD_CLI_PRO_KRI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANCO_CLIPRO'
          Visible = True
        end>
    end
    object TCDetalle: TTabControl
      Left = 0
      Top = 180
      Width = 1209
      Height = 23
      Align = alBottom
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      TabPosition = tpBottom
      OnChange = TCDetalleChange
    end
    object PNLInfoSEPA: TLFPanel
      Left = 0
      Top = 203
      Width = 1209
      Height = 45
      Align = alBottom
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 3
      object LIBAN: TLFLabel
        Left = 16
        Top = 4
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'IBAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LFLabel1: TLFLabel
        Left = 24
        Top = 26
        Width = 17
        Height = 13
        Alignment = taRightJustify
        Caption = 'BIC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LTipoAdeudo: TLFLabel
        Left = 276
        Top = 4
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Adeudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LTipoContrato: TLFLabel
        Left = 273
        Top = 26
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LMandato: TLFLabel
        Left = 439
        Top = 4
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Mandato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object LBCuentaCorriente: TLFLabel
        Left = 585
        Top = 3
        Width = 24
        Height = 16
        Hint = 'Cuenta Corriente'
        Alignment = taCenter
        Caption = 'C.C.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
      end
      object DBEIBAN: TLFDbedit
        Left = 45
        Top = 1
        Width = 220
        Height = 21
        Color = clInfoBk
        DataField = 'IBAN'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = DBEIBANChange
      end
      object DBEBIC: TLFDbedit
        Left = 45
        Top = 23
        Width = 220
        Height = 21
        Color = clInfoBk
        DataField = 'BIC'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = DBECuentaBancariaTerceroChange
      end
      object DBETipoAdeudo: TLFDbedit
        Left = 341
        Top = 1
        Width = 92
        Height = 21
        Color = clInfoBk
        DataField = 'TIPO_ADEUDO_SEPA'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnChange = DBETipoAdeudoChange
      end
      object DBETipoContrato: TLFDbedit
        Left = 341
        Top = 23
        Width = 92
        Height = 21
        Color = clInfoBk
        DataField = 'TIPO_CONTRATO_SEPA'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        OnChange = DBETipoContratoChange
      end
      object DBEMandato: TLFDbedit
        Left = 485
        Top = 1
        Width = 92
        Height = 21
        Color = clInfoBk
        DataField = 'FIRMA'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        OnChange = DBEMandatoChange
      end
      object DBEBanco: TLFDbedit
        Left = 614
        Top = 0
        Width = 203
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = DBEBancoChange
      end
      object DBESucursal: TLFDbedit
        Left = 671
        Top = 22
        Width = 31
        Height = 21
        Color = clInfoBk
        DataField = 'SUCURSAL'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnChange = DBESucursalChange
      end
      object DBECuentaBancariaTercero: TLFDbedit
        Left = 614
        Top = 22
        Width = 33
        Height = 21
        Color = clInfoBk
        DataField = 'ENTIDAD'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        OnChange = DBECuentaBancariaTerceroChange
      end
      object DBECuenta: TLFDbedit
        Left = 703
        Top = 22
        Width = 114
        Height = 21
        Color = clInfoBk
        DataField = 'CUENTA'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnChange = DBECuentaChange
      end
      object DBEControl: TLFDbedit
        Left = 648
        Top = 22
        Width = 21
        Height = 21
        Color = clInfoBk
        DataField = 'CONTROL'
        DataSource = DMRemesas.DSxCuentaTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnChange = DBEControlChange
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMRemesas.DSQMRemesas
    Complementario = TBDetalle
    Left = 664
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 696
    Top = 8
  end
  inherited ALMain: TLFActionList
    Left = 632
    Top = 8
    object ALstInformeRemesa: TAction
      Category = 'Listados'
      Caption = 'Informe de la Remesa'
      Hint = 'Informe de la Remesa'
      ImageIndex = 14
      OnExecute = ALstInformeRemesaExecute
    end
    object ALstRecibosRemesa: TAction
      Category = 'Listados'
      Caption = 'Recibos de la Remesa'
      Hint = 'Recibos de la Remesa'
      ImageIndex = 14
      OnExecute = ALstRecibosRemesaExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfInformeRemesa: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Informe de la Remesa'
      Hint = 'Informe de la Remesa'
      ImageIndex = 77
      OnExecute = AConfInformeRemesaExecute
    end
    object AConfRecibosRemesa: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Recibos de la Remesa'
      Hint = 'Recibos de la Remesa'
      ImageIndex = 77
      OnExecute = AConfRecibosRemesaExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AVenceRemesa: TAction
      Category = 'Procesos'
      Caption = 'Vence los vencimientos pendientes de contabilizar'
      Hint = 'Vence los vencimientos pendientes de contabilizar'
      ImageIndex = 15
      OnExecute = AVenceRemesaExecute
    end
    object AVenceRemesaActual: TAction
      Category = 'Procesos'
      Caption = 'Vence los recibos de la remesa actual'
      Hint = 'Vence los recibos de la remesa actual'
      ImageIndex = 134
      OnExecute = AVenceRemesaActualExecute
    end
    object AVenceReciboActual: TAction
      Category = 'Procesos'
      Caption = 'Vence el recibo actual'
      Hint = 'Vence el recibo actual'
      ImageIndex = 9
      OnExecute = AVenceReciboActualExecute
    end
    object LFCategoryAction3: TLFCategoryAction
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGFDetalle.Columns')
    Left = 632
    Top = 40
  end
  inherited CEDetalle: TControlEdit
    DataSource = DMRemesas.DSQMDetalle
    SubComplementario = ALMain
    Left = 664
    Top = 40
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 696
    Top = 40
    inherited CEDetalleMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEDetalleMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEDetalleMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEDetalleMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEDetalleMiinsert: TMenuItem
      ShortCut = 16454
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      ShortCut = 16460
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEDetalleMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEDetalleMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEDetalleMirefresh: TMenuItem
      ShortCut = 16499
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
  object PMNorma19: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 504
    Top = 240
    object MINorma19: TMenuItem
      Caption = 'Cuaderno 19 Pr. 1'
      Hint = 'Norma de Recibos al Cobro CSB19 Procedimiento 1'
      ImageIndex = 123
      OnClick = MINorma19Click
    end
    object MINorma19_2: TMenuItem
      Caption = 'Cuaderno 19 Pr. 2'
      Hint = 'Norma de Recibos al Cobro CSB19 Procedimiento 2'
      ImageIndex = 123
      OnClick = MINorma19_2Click
    end
    object MISEPA_Vista: TMenuItem
      Caption = 'SEPA'
      Hint = 'Genera remesa SEPA'
      ImageIndex = 123
      OnClick = MISEPA_VistaClick
    end
  end
  object PMNorma32_58: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 536
    Top = 240
    object MINorma32: TMenuItem
      Caption = 'Cuaderno 32'
      Hint = 'Norma de Recibos al Cobro CSB32'
      ImageIndex = 123
      OnClick = MINorma32Click
    end
    object MINorma58: TMenuItem
      Caption = 'Cuaderno 58'
      Hint = 'Norma de Recibos al Cobro CSB58'
      ImageIndex = 123
      OnClick = MINorma58Click
    end
    object MISEPA_Descuento: TMenuItem
      Caption = 'SEPA'
      Hint = 'Genera remesa SEPA'
      ImageIndex = 123
      OnClick = MISEPA_DescuentoClick
    end
  end
  object PMIrApunte: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 472
    Top = 240
    object MIIrCierreRemesa: TMenuItem
      Caption = 'Ir al cierre de la Remesa'
      ImageIndex = 68
      OnClick = MIIrCierreRemesaClick
    end
    object MIIrAbonoRemesa: TMenuItem
      Caption = 'Ir al abono de la Remesa'
      ImageIndex = 30
      OnClick = MIIrAbonoRemesaClick
    end
    object MIIrVencimientoRemesa: TMenuItem
      Caption = 'Ir al vencimiento'
      ImageIndex = 9
      OnClick = MIIrVencimientoRemesaClick
    end
  end
  object PMPagoImpago: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 376
    Top = 240
    object MIGenerarImpagoRecibo: TMenuItem
      Caption = 'Generar Impago de Recibo'
      ImageIndex = 42
      OnClick = TButtImpagoReciboClick
    end
    object MIDeshacerImpagoRecibo: TMenuItem
      Caption = 'Deshacer Impago de Recibo'
      ImageIndex = 43
      OnClick = MIDeshacerImpagoReciboClick
    end
  end
  object PMAbonarDesabonar: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 344
    Top = 240
    object MIAbonarRemesa: TMenuItem
      Caption = 'Abonar por l'#237'neas'
      ImageIndex = 42
      OnClick = MIAbonarRemesaClick
    end
    object MIAbonarTodo: TMenuItem
      Caption = 'Abonar todo'
      ImageIndex = 21
      OnClick = MIAbonarTodoClick
    end
    object MIDesabonarRemesa: TMenuItem
      Caption = 'Desabonar Remesa'
      ImageIndex = 29
      OnClick = MIDesabonarRemesaClick
    end
    object MIDesabonaAbono: TMenuItem
      Caption = 'Desabona Abono'
      ImageIndex = 22
      OnClick = MIDesabonaAbonoClick
    end
  end
  object PMPagaImpagoDespagaImpago: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 408
    Top = 240
    object MIPagaGastosImpagado: TMenuItem
      Caption = 'Paga los Gastos del Impagado'
      Hint = 'Paga los Gastos del Impagado'
      ImageIndex = 19
      OnClick = MIPagaGastosImpagadoClick
    end
    object MIDeshacePagoImpagado: TMenuItem
      Caption = 'Deshace el Pago del Impagado'
      Hint = 'Deshace el Pago del Impagado'
      ImageIndex = 27
      OnClick = MIDeshacePagoImpagadoClick
    end
  end
end
