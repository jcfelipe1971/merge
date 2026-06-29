inherited FMCartera: TFMCartera
  Left = 423
  Top = 258
  Width = 914
  Height = 424
  HelpContext = 261
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cartera'
  Constraints.MinHeight = 380
  Constraints.MinWidth = 865
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 904
    Height = 213
    inherited TBMain: TLFToolBar
      Width = 900
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = DMCartera.DSQMCartera
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        ConfirmDelete = False
        EditaControl = DBDTPFecha
        InsertaControl = DBDTPFecha
        OnClickBefore = NavMainClickBefore
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Imprime Recibos'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 266
      end
      inherited TbuttComp: TToolButton
        Left = 274
      end
      object TButtRefresca: TToolButton
        Left = 297
        Top = 0
        Hint = 'Refrescar'
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = TButtRefrescaClick
      end
      object TButtLimpiaRegistro: TToolButton
        Left = 320
        Top = 0
        Hint = 'Limpia el registro de cartera actual'
        Caption = 'Limpia Registro'
        ImageIndex = 57
        Visible = False
        OnClick = TButtLimpiaRegistroClick
      end
      object TButtLimpiaTodo: TToolButton
        Left = 343
        Top = 0
        Hint = 'Limpia todos los registros de cartera del signo seleccionado'
        Caption = 'Limpia Todo'
        ImageIndex = 87
        Visible = False
        OnClick = TButtLimpiaTodoClick
      end
      object TButtSep2: TToolButton
        Left = 366
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLTipo: TLFPanel
        Left = 374
        Top = 0
        Width = 139
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LTipo: TLFLabel
          Left = 11
          Top = 4
          Width = 26
          Height = 13
          Alignment = taRightJustify
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
          Left = 41
          Top = 0
          Width = 97
          Height = 21
          Hint = 'Signo de la operaci'#243'n'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSignoChange
          Items.Strings = (
            'Cobros'
            'Pagos')
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 900
      Height = 183
      inherited TSFicha: TTabSheet
        object SBVerFactura: TSpeedButton [0]
          Left = 190
          Top = 30
          Width = 472
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+F para ver la factura asociada'
          GroupIndex = -1
          OnDblClick = AFacturaExecute
        end
        object SBVerRegistro: TSpeedButton [1]
          Left = 616
          Top = 112
          Width = 105
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
          GroupIndex = -1
          OnDblClick = SBVerRegistroDblClick
        end
        object SBVerAsientos: TSpeedButton [2]
          Left = 689
          Top = 24
          Width = 85
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          OnDblClick = SBVerAsientosDblClick
        end
        object SBAContaExtracto: TSpeedButton [3]
          Left = 689
          Top = 24
          Width = 85
          Height = 17
          Hint = 'Doble click para ver extracto contable'
          GroupIndex = -1
          Down = True
          OnDblClick = SBAContaExtractoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 892
          Height = 155
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            OnClick = G2KTableLocClick
            CamposADesplegar.Strings = (
              'REGISTRO'
              'DOC_SERIE'
              'DOC_NUMERO'
              'DOC_TIPO'
              'CUENTA')
            DataSource = DMCartera.DSQMCartera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CARTERA'
            CampoNum = 'ID_CARTERA'
            CampoStr = 'NOMBRE'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LNRegistro: TLFLabel
            Left = 49
            Top = 2
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Registro'
          end
          object LFecha: TLFLabel
            Left = 761
            Top = 2
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LCuenta: TLFLabel
            Left = 69
            Top = 70
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LFormaSerie: TLFLabel
            Left = 46
            Top = 91
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LBase: TLFLabel
            Left = 577
            Top = 2
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bases'
          end
          object LSerie: TLFLabel
            Left = 79
            Top = 48
            Width = 24
            Height = 13
            Alignment = taCenter
            Caption = 'Serie'
          end
          object LBLNumero: TLFLabel
            Left = 226
            Top = 48
            Width = 37
            Height = 13
            Alignment = taCenter
            Caption = 'N'#250'mero'
          end
          object LFechaFicha: TLFLabel
            Left = 397
            Top = 48
            Width = 30
            Height = 13
            Alignment = taCenter
            Caption = 'Fecha'
          end
          object LRegIVA: TLFLabel
            Left = 717
            Top = 114
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registro IVA'
          end
          object LAsiento: TLFLabel
            Left = 713
            Top = 91
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. Asiento'
          end
          object LLiquido: TLFLabel
            Left = 570
            Top = 25
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'quido'
          end
          object LDocumento: TLFLabel
            Left = 48
            Top = 25
            Width = 55
            Height = 13
            Alignment = taCenter
            Caption = 'Documento'
          end
          object LDescripcion: TLFLabel
            Left = 47
            Top = 113
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LMoneda: TLFLabel
            Left = 430
            Top = 25
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LCPagada: TLFLabel
            Left = 553
            Top = 48
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Cobrada'
          end
          object LTipoAsiento: TLFLabel
            Left = 395
            Top = 2
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Asiento'
          end
          object LObservacionesPago: TLFLabel
            Left = 4
            Top = 136
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones Pago'
          end
          object LPerteneceAgrupacion: TLFLabel
            Left = 221
            Top = 4
            Width = 162
            Height = 13
            Caption = 'Pertenece a una agrupaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LFechaValor: TLFLabel
            Left = 734
            Top = 25
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Valor'
          end
          object DBERegistro: TLFDbedit
            Left = 108
            Top = 0
            Width = 103
            Height = 21
            Color = clInfoBk
            DataField = 'REGISTRO'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBERegistroChange
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 795
            Top = 0
            Width = 90
            Height = 21
            DataField = 'FECHA_REGISTRO'
            DataSource = DMCartera.DSQMCartera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBEFCuenta: TLFDBEditFind2000
            Left = 108
            Top = 66
            Width = 103
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CUENTA'
            DataSource = DMCartera.DSQMCartera
            TabOrder = 6
            OnChange = DBEFCuentaChange
            OnExit = DBEFCuentaExit
            OnKeyDown = DBEFCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION         '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFCuentaBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitCuenta: TLFEdit
            Left = 212
            Top = 66
            Width = 309
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 108
            Top = 88
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FORMA_PAGO'
            DataSource = DMCartera.DSQMCartera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnChange = DBEFFormaPagoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'FORMA_PAGO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFormaPago: TLFEdit
            Left = 169
            Top = 88
            Width = 352
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBEBases: TLFDbedit
            Left = 611
            Top = 0
            Width = 103
            Height = 21
            Color = clInfoBk
            DataField = 'BASES'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBCBPagado: TLFDBCheckBox
            Left = 795
            Top = 46
            Width = 60
            Height = 17
            Caption = 'Pagado'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            ParentColor = False
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PAGADO'
            DataSource = DMCartera.DSQMCartera
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBESerie: TLFDbedit
            Left = 108
            Top = 44
            Width = 103
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'DOC_SERIE'
            DataSource = DMCartera.DSQMCartera
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
          object DBENumero: TLFDbedit
            Left = 268
            Top = 44
            Width = 117
            Height = 21
            Color = clInfoBk
            DataField = 'DOC_NUMERO'
            DataSource = DMCartera.DSQMCartera
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
          object DBDTPFechaDoc: TLFDBDateEdit
            Left = 431
            Top = 44
            Width = 90
            Height = 21
            DataField = 'DOC_FECHA'
            DataSource = DMCartera.DSQMCartera
            ReadOnly = True
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
            TabOrder = 5
          end
          object DBERegIva: TLFDbedit
            Left = 781
            Top = 110
            Width = 103
            Height = 21
            Color = clAqua
            DataField = 'REG_IVA'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBEAsiento: TLFDbedit
            Left = 781
            Top = 88
            Width = 103
            Height = 21
            Color = clAqua
            DataField = 'ASIENTO'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBELiquido: TLFDbedit
            Left = 611
            Top = 22
            Width = 103
            Height = 21
            Color = clInfoBk
            DataField = 'LIQUIDO'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBETipoDocumento: TLFDbedit
            Left = 108
            Top = 22
            Width = 277
            Height = 21
            Color = clAqua
            DataField = 'TIPO_FACTURA'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object DBEDescripcion: TLFDbedit
            Left = 108
            Top = 110
            Width = 413
            Height = 21
            Color = clInfoBk
            DataField = 'TEXTO'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
          end
          object DBEMoneda: TLFDbedit
            Left = 473
            Top = 22
            Width = 48
            Height = 21
            Color = clInfoBk
            DataField = 'MONEDA'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            OnChange = DBEMonedaChange
          end
          object DBECPagada: TLFDbedit
            Left = 611
            Top = 44
            Width = 103
            Height = 21
            Color = clInfoBk
            DataField = 'C_PAGADA'
            DataSource = DMCartera.DSQMCartera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
          end
          object DBEFTipoAsiento: TLFDBEditFind2000
            Left = 473
            Top = 0
            Width = 48
            Height = 21
            DataField = 'TIPO_ASIENTO_KRI'
            DataSource = DMCartera.DSQMCartera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
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
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEObservacionesPago: TLFDbedit
            Left = 108
            Top = 132
            Width = 413
            Height = 21
            DataField = 'OBSERVACIONES'
            DataSource = DMCartera.DSQMCartera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object DBDTPFechaValor: TLFDBDateEdit
            Left = 795
            Top = 22
            Width = 90
            Height = 21
            DataField = 'VALOR'
            DataSource = DMCartera.DSQMCartera
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            NumGlyphs = 2
            TabOrder = 20
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 892
          Height = 155
          DataSource = DMCartera.DSQMCartera
          CamposAMarcar.Strings = (
            'PAGADO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'CUENTA'
            'DOC_FECHA'
            'DOC_NUMERO'
            'DOC_SERIE'
            'FECHA_REGISTRO'
            'FORMA_PAGO'
            'LINEAS'
            'LIQUIDO'
            'PAGADO'
            'REGISTRO'
            'SIGNO')
          CamposCalcAOrdenar.Strings = (
            'LIQUIDO_MONEDA')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          Columns = <
            item
              Expanded = False
              FieldName = 'SIGNO'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              Title.Alignment = taRightJustify
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REGISTRO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEAS'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO_MONEDA'
              Title.Alignment = taRightJustify
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 54
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 213
    Width = 904
    Height = 158
    inherited TBDetalle: TLFToolBar
      Width = 904
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        DataSource = DMCartera.DSQMCarteraDetalle
        Hints.Strings = ()
        Exclusivo = True
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object ToolButton1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPagaRecibos: TToolButton
        Left = 228
        Top = 0
        Hint = 'Pago Autom'#225'tico de Recibos'
        Caption = 'Paga Recibos'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtPagaRecibosClick
      end
      object ToolButton2: TToolButton
        Left = 251
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInvisible: TToolButton
        Left = 259
        Top = 0
        Hint = 'Hacer Invisibles los Recibos'
        Caption = 'Invisible'
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtInvisibleClick
      end
      object TButtVisible: TToolButton
        Left = 282
        Top = 0
        Hint = 'Hacer Visibles los Recibos'
        Caption = 'Visible'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtVisibleClick
      end
      object ToolButton3: TToolButton
        Left = 305
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRecibosAgrupados: TToolButton
        Left = 313
        Top = 0
        Hint = 'Muestra los Recibos Agrupados'
        Caption = 'Recibos Agrupados'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRecibosAgrupadosClick
      end
      object TButtImprimirUnRecibo: TToolButton
        Left = 336
        Top = 0
        Hint = 'Imprimir el recibo seleccionado'
        Caption = 'Imprimir Un Recibo'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtImprimirUnReciboClick
      end
      object TButtAsiento: TToolButton
        Left = 359
        Top = 0
        Action = AAsientoPago
        DropdownMenu = PMAsiento
        Style = tbsDropDown
      end
      object ToolButton4: TToolButton
        Left = 395
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBDatosReciboKri: TToolButton
        Left = 403
        Top = 0
        Hint = 'Informacion sobre recibos importados.'
        Caption = 'TBDatosReciboKri'
        ImageIndex = 1
        OnClick = TBDatosReciboKriClick
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 904
      Height = 113
      DataSource = DMCartera.DSQMCarteraDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnColEnter = DBGFDetalleColEnter
      OnDblClick = TButtRecibosAgrupadosClick
      OnKeyDown = DBGFDetalleKeyDown
      IniStorage = FSMain
      AutoCambiarColumna = True
      IndiceBitmapOrdenable = 1
      IndiceBitmapAscendente = 2
      IndiceBitmapDescendente = 3
      BuscarNums = True
      Campos.Strings = (
        'CTA_PAGO'
        'TIPO_RETENCION'
        'TIPO_EFECTO'
        'BANCO_CLIPRO')
      CamposAMostrar.Strings = (
        'CTA_PAGO'
        '0'
        'TIPO_RETENCION'
        '0'
        'TIPO_EFECTO'
        '0'
        'BANCO_CLIPRO'
        '1'
        'IBAN')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1')
      CampoAOrdenarColor = clBlack
      CamposNoAccesibles.Strings = (
        'TITULO'
        'REMESA')
      ColumnasCheckBoxes.Strings = (
        'PAGADO'
        'RECIBIDO'
        'RETENCION'
        'CARTA1'
        'CARTA2'
        'CARTA3'
        'CARTA4'
        'CARTA5')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1'
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
        '0'
        '0'
        '0'
        '0')
      CondicionBusqueda = 'tipo=5'
      Numericos.Strings = (
        'CUENTA'
        'ID'
        'TIPO'
        'BANCO')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'CON_CUENTAS'
        'DOM_TIPO_RETENCION'
        'SYS_TIPO_EFECTO'
        'SYS_TERCEROS_BANCOS')
      Acciones.Strings = (
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'DESCRIPCION'
        'TITULO'
        'TITULO')
      BeforeColExit = DBGFDetalleBeforeColExit
      OnBusqueda = DBEFCuentaBusqueda
      Planes.Strings = (
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        'CUENTA'
        'ID'
        'TIPO'
        'BANCO')
      Columns = <
        item
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Width = 65
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'CTA_PAGO'
          Width = 95
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 225
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Title.Alignment = taRightJustify
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGADO'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECIBIDO'
          Width = 25
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REMESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOCUMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CONFIRMING'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ORD_PAGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RETENCION'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_RETENCION'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_EFECTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANCO_CLIPRO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIC'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_CIERRE'
          ReadOnly = True
          Width = 65
          Visible = True
        end>
    end
    object PNLObservaciones: TLFPanel
      Left = 0
      Top = 135
      Width = 904
      Height = 23
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        904
        23)
      object LTipoEfecto: TLFLabel
        Left = 6
        Top = 4
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Efe.'
      end
      object LObservacionesVencimiento: TLFLabel
        Left = 133
        Top = 5
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observ.'
      end
      object DBEFTipoEfecto: TLFFibDBEditFind
        Left = 54
        Top = 1
        Width = 59
        Height = 21
        DataField = 'TIPO_EFECTO'
        DataSource = DMCartera.DSQMCarteraDetalle
        TabOrder = 0
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'SYS_TIPO_EFECTO'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        OrdenadoPor.Strings = (
          'TIPO')
      end
      object DBEObservaciones: TLFDbedit
        Left = 176
        Top = 1
        Width = 725
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OBSERVACIONES'
        DataSource = DMCartera.DSQMCarteraDetalle
        TabOrder = 1
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 371
    Width = 904
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 84
    Top = 280
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 84
    Top = 315
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CEMainVerFactura: TMenuItem
      Action = AFactura
    end
  end
  inherited ALMain: TLFActionList
    Left = 48
    Top = 280
    object ALstTesoreria: TAction
      Category = 'Listados'
      Caption = 'Listado de Tesorer'#237'a'
      Hint = 'Listado de Tesorer'#237'a'
      ImageIndex = 14
      OnExecute = ALstTesoreriaExecute
    end
    object ALstPrevisionPagos: TAction
      Category = 'Listados'
      Caption = 'Listado de Previsi'#243'n de Pagos'
      Hint = 'Listado de Previsi'#243'n de Pagos'
      ImageIndex = 14
      OnExecute = ALstPrevisionPagosExecute
    end
    object ALstPrevisionCobros: TAction
      Category = 'Listados'
      Caption = 'Listado de Previsi'#243'n de Cobros'
      Hint = 'Listado de Previsi'#243'n de Cobros'
      ImageIndex = 14
      OnExecute = ALstPrevisionCobrosExecute
    end
    object ALstPrevisionCuentas: TAction
      Category = 'Listados'
      Caption = 'Listado de Previsi'#243'n por Cuentas'
      Hint = 'Listado de Previsi'#243'n por Cuentas'
      ImageIndex = 14
      OnExecute = ALstPrevisionCuentasExecute
    end
    object ALstRecibosAgrupacion: TAction
      Category = 'Listados'
      Caption = 'Listado de Recibos por Agrupaci'#243'n'
      Hint = 'Listado de Recibos por Agrupaci'#243'n'
      ImageIndex = 14
      OnExecute = ALstRecibosAgrupacionExecute
    end
    object ALstCartera: TAction
      Category = 'Listados'
      Caption = 'Listados de Cartera'
      Hint = 'Listados de Cartera'
      ImageIndex = 14
      OnExecute = ALstCarteraExecute
    end
    object ALstCobrosVencidos: TAction
      Category = 'Listados'
      Caption = 'Listado de Cobros Vencidos'
      ImageIndex = 14
      OnExecute = ALstCobrosVencidosExecute
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
    object AConfRecibos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Recibos'
      Hint = 'Listados de Recibos'
      ImageIndex = 77
      OnExecute = AConfRecibosExecute
    end
    object AConfRecibosAgente: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Recibos por Agente'
      Hint = 'Listados de Recibos por Agente'
      ImageIndex = 77
      OnExecute = AConfRecibosAgenteExecute
    end
    object AConfTesoreria: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Tesorer'#237'a'
      Hint = 'Listados de Tesorer'#237'a'
      ImageIndex = 77
      OnExecute = AConfTesoreriaExecute
    end
    object AConfPrevPagos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Prev. Pagos'
      Hint = 'Listados de Prev. Pagos'
      ImageIndex = 77
      OnExecute = AConfPrevPagosExecute
    end
    object AConfPagosCodigo: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Prev. Pagos (C'#243'digo)'
      Hint = 'Listados de Prev. Pagos (C'#243'digo)'
      ImageIndex = 77
      OnExecute = AConfPagosCodigoExecute
    end
    object AConfPrevCobros: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Prev. Cobros'
      Hint = 'Listados de Prev. Cobros'
      ImageIndex = 77
      OnExecute = AConfPrevCobrosExecute
    end
    object AConfCobrosCodigo: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Prev. Cobros (C'#243'digo)'
      Hint = 'Listados de Prev. Cobros (C'#243'digo)'
      ImageIndex = 77
      OnExecute = AConfCobrosCodigoExecute
    end
    object AConfRecibosAgrupacion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Recibos por Agrupaci'#243'n'
      Hint = 'Listados de Recibos por Agrupaci'#243'n'
      ImageIndex = 77
      OnExecute = AConfRecibosAgrupacionExecute
    end
    object AConfRecibosCartera: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Recibos de la Cartera'
      Hint = 'Recibos de la Cartera'
      ImageIndex = 77
      OnExecute = AConfRecibosCarteraExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object ARecibosFacturas: TAction
      Category = 'Otros'
      Caption = 'Muestra los recibos de una Factura'
      Hint = 'Muestra los recibos de una Factura'
      ImageIndex = 75
      OnExecute = ARecibosFacturasExecute
    end
    object ADesagrupaRecibos: TAction
      Category = 'Procesos'
      Caption = 'Desagrupa Recibos'
      Hint = 'Desagrupa Recibos'
      ImageIndex = 111
      OnExecute = ADesagrupaRecibosExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AControlIVA: TAction
      Category = 'Otros'
      Caption = 'Control de IVA'
      Hint = 'Control de IVA'
      ImageIndex = 110
      OnExecute = AControlIVAExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object ABuscarxImporte: TAction
      Category = 'Otros'
      Caption = 'Buscar Recibos por Importe'
      ImageIndex = 83
      OnExecute = ABuscarxImporteExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 12
    Top = 280
  end
  inherited CEDetalle: TControlEdit
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    SubComplementario = ALMain
    Left = 120
    Top = 280
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 120
    Top = 315
  end
  object ALCartera: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 48
    Top = 315
    object AFactura: TAction
      Caption = 'Acceso a Factura'
      Hint = 
        'Doble click o Ctrl+Alt+F para ver la Factura o el Asiento asocia' +
        'dos'
      ShortCut = 49222
      OnExecute = AFacturaExecute
    end
    object AAsientoPago: TAction
      Caption = 'Ir al Asiento de Pago'
      Hint = 'Ir al Asiento de Pago'
      ImageIndex = 30
      OnExecute = AAsientoPagoExecute
    end
    object AAsientoRecibido: TAction
      Caption = 'Ir al Asiento de Recibido'
      Hint = 'Ir al Asiento de Recibido'
      ImageIndex = 30
      OnExecute = AAsientoRecibidoExecute
    end
    object AReciboAgrupaKri: TAction
      Caption = 'Ir a Recibo que Agrupa'
      Hint = 'Ir a recibo que agrupa este recibo'
      ImageIndex = 21
      OnExecute = AReciboAgrupaKriExecute
    end
    object ARegistroIVA: TAction
      Caption = 'ARegistroIVA'
      OnExecute = ARegistroIVAExecute
    end
    object AAsientoFactura: TAction
      Caption = 'AAsientoFactura'
      OnExecute = AAsientoFacturaExecute
    end
    object AContaExtracto: TAction
      Caption = 'Extracto Contable'
      Hint = 'Doble click para ver extracto contable'
      ImageIndex = 30
      OnExecute = AContaExtractoExecute
    end
  end
  object PMAsiento: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 12
    Top = 315
    object MIAsientodePago: TMenuItem
      Action = AAsientoPago
    end
    object MIAsientoRecibido: TMenuItem
      Action = AAsientoRecibido
    end
    object MIIraReciboqueAgrupaKRI1: TMenuItem
      Action = AReciboAgrupaKri
    end
  end
end
