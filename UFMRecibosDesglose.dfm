inherited FMRecibosDesglose: TFMRecibosDesglose
  Left = 412
  Top = 174
  Width = 886
  Height = 595
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recibos por Clientes Desglosados'
  PopupMenu = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 876
    Height = 241
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 872
      inherited NavMain: THYMNavigator
        Width = 216
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBRecibo
        InsertaControl = DBRecibo
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        Width = 56
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
        Hint = 'Marcar como servidas todas las l'#237'neas'
        Caption = 'Bloquear'
        ImageIndex = 68
      end
      object TBSep3: TToolButton
        Left = 311
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLTitSerie: TLFPanel
        Left = 319
        Top = 0
        Width = 218
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        DesignSize = (
          218
          22)
        object LSerie: TLFLabel
          Left = 11
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object ETitSerie: TLFEdit
          Left = 74
          Top = 0
          Width = 142
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Color = clInfoBk
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
        object EFSerie: TLFEditFind2000
          Left = 39
          Top = 0
          Width = 34
          Height = 21
          TabStop = False
          TabOrder = 1
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
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 872
      Height = 211
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 864
          Height = 183
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'Z_RECIBOS_CAB'
            CampoNum = 'ID'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object LFRIg: TLFLabel
            Left = 12
            Top = 8
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro Recibo'
          end
          object LabEstado: TLFLabel
            Left = 173
            Top = 7
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LCliente: TLFLabel
            Left = 34
            Top = 52
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LBLDescripcion: TLFLabel
            Left = 2
            Top = 117
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conc. Recibo'
          end
          object LBLFecha: TLFLabel
            Left = 36
            Top = 139
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLLugar: TLFLabel
            Left = 176
            Top = 139
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar'
          end
          object LCuenta: TLFLabel
            Left = 32
            Top = 73
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LCuentaCaja: TLFLabel
            Left = 8
            Top = 95
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Caja'
          end
          object LBLTalon: TLFLabel
            Left = 11
            Top = 30
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Documento'
          end
          object LMontoPendiente: TLFLabel
            Left = 69
            Top = 162
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Monto Pendiente'
          end
          object LMontoAplicado: TLFLabel
            Left = 301
            Top = 162
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Monto Aplicado'
          end
          object LMontoEfectivo: TLFLabel
            Left = 531
            Top = 3
            Width = 72
            Height = 13
            Caption = 'Monto Efectivo'
            Layout = tlCenter
          end
          object LMontoTarjeta: TLFLabel
            Left = 529
            Top = 40
            Width = 66
            Height = 13
            Caption = 'Monto Tarjeta'
            Layout = tlCenter
          end
          object LMontoCheque: TLFLabel
            Left = 529
            Top = 76
            Width = 110
            Height = 13
            Caption = 'Monto Cheque o Tranf.'
            Layout = tlCenter
          end
          object LCuentaCom: TLFLabel
            Left = 177
            Top = 95
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Com.'
            Enabled = False
          end
          object LComisionADistribuir: TLFLabel
            Left = 529
            Top = 112
            Width = 94
            Height = 13
            Caption = 'Comisi'#243'n a Distribuir'
            Enabled = False
            Layout = tlCenter
          end
          object DBEID: TLFDbedit
            Left = 70
            Top = 4
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NRO_RECIBO'
            DataSource = DMRecibosDesglose.DSCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBEIDChange
          end
          object DBEDescripcion: TLFDbedit
            Left = 70
            Top = 114
            Width = 451
            Height = 21
            Color = clInfoBk
            DataField = 'TEXTO'
            DataSource = DMRecibosDesglose.DSxDescripcion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 70
            Top = 136
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMRecibosDesglose.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 13
          end
          object DBELugar: TLFDbedit
            Left = 207
            Top = 136
            Width = 314
            Height = 21
            DataField = 'LUGAR'
            DataSource = DMRecibosDesglose.DSCabecera
            TabOrder = 14
          end
          object DBECliente: TLFDBEditFind2000
            Left = 70
            Top = 48
            Width = 97
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMRecibosDesglose.DSCabecera
            TabOrder = 6
            OnChange = DBEClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            CampoADevolver = 'CLIENTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCliente: TLFEdit
            Left = 168
            Top = 48
            Width = 353
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBCuentaCobro: TLFDBEditFind2000
            Left = 70
            Top = 92
            Width = 97
            Height = 21
            DataField = 'CUENTA_COBRO'
            DataSource = DMRecibosDesglose.DSCabecera
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBRecibo: TLFDbedit
            Left = 70
            Top = 26
            Width = 97
            Height = 21
            DataField = 'RECIBO'
            DataSource = DMRecibosDesglose.DSCabecera
            TabOrder = 2
          end
          object DBETituloEstado: TLFDbedit
            Left = 212
            Top = 4
            Width = 309
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMRecibosDesglose.DSCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object LFDBCobros: TLFDbedit
            Left = 161
            Top = 158
            Width = 136
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'LIQUIDO'
            DataSource = DMRecibosDesglose.DSxTotales
            Enabled = False
            ReadOnly = True
            TabOrder = 15
          end
          object RBEfectivo: TRadioButton
            Left = 212
            Top = 28
            Width = 73
            Height = 17
            Caption = 'Efectivo'
            TabOrder = 3
            Visible = False
          end
          object RBCheque: TRadioButton
            Left = 356
            Top = 28
            Width = 133
            Height = 17
            Caption = 'Cheque o Tranferencia'
            TabOrder = 5
            Visible = False
          end
          object LFDCuenta: TLFDbedit
            Left = 70
            Top = 70
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CUENTA'
            DataSource = DMRecibosDesglose.DSCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            OnChange = LFDCuentaChange
          end
          object DBEMontoRecibido: TLFDbedit
            Left = 380
            Top = 158
            Width = 141
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MONTO_RECIBO'
            DataSource = DMRecibosDesglose.DSCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object ETituloCuenta: TLFEdit
            Left = 168
            Top = 70
            Width = 353
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object LFDMontoefectivo: TLFDbedit
            Left = 529
            Top = 16
            Width = 128
            Height = 21
            DataField = 'MONTO_EFECTIVO'
            DataSource = DMRecibosDesglose.DSCabecera
            TabOrder = 17
            OnKeyUp = ActSumaRecibo
          end
          object LFDMontoTarjeta: TLFDbedit
            Left = 530
            Top = 53
            Width = 128
            Height = 21
            DataField = 'MONTO_TARJETA'
            DataSource = DMRecibosDesglose.DSCabecera
            TabOrder = 18
            OnKeyUp = ActSumaRecibo
          end
          object LFDMontoCheque: TLFDbedit
            Left = 530
            Top = 89
            Width = 128
            Height = 21
            DataField = 'MONTO_CHEQUE'
            DataSource = DMRecibosDesglose.DSCabecera
            TabOrder = 19
            OnKeyUp = ActSumaRecibo
          end
          object DBEFCuentaCom: TLFDBEditFind2000
            Left = 242
            Top = 92
            Width = 97
            Height = 21
            Color = clInfoBk
            DataSource = DMRecibosDesglose.DSCabecera
            Enabled = False
            TabOrder = 11
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object RBTarjeta: TRadioButton
            Left = 288
            Top = 28
            Width = 65
            Height = 17
            Caption = 'Tarjeta'
            Enabled = False
            TabOrder = 4
            Visible = False
          end
          object DBEComisionADistribuir: TLFDbedit
            Left = 529
            Top = 125
            Width = 128
            Height = 21
            Color = clInfoBk
            DataSource = DMRecibosDesglose.DSCabecera
            Enabled = False
            TabOrder = 20
            OnKeyUp = ActSumaRecibo
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 864
          Height = 183
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'ID'
            'RECIBO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_RECIBO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_RECIBO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECIBO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LUGAR'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_COBRO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 542
    Width = 876
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 241
    Width = 876
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 0
      Width = 876
      Height = 301
      ActivePage = TSCobros
      Align = alClient
      MultiLine = True
      OwnerDraw = True
      ParentShowHint = False
      ScrollOpposite = True
      ShowHint = True
      TabIndex = 0
      TabOrder = 0
      TabPosition = tpBottom
      TabActiveColor = clWindow
      TabInactiveColor = 14936298
      object TSCobros: TTabSheet
        Caption = 'Cobros'
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 868
          Height = 26
          Anchors = [akTop, akRight]
          AutoSize = True
          BorderWidth = 1
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          Separators = True
          object NavCobros: THYMNavigator
            Left = 0
            Top = 0
            Width = 160
            Height = 22
            DataSource = ZDMRecibos.DsCobros
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 160
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object ButtCobrar: TToolButton
            Left = 168
            Top = 0
            Hint = 'Cobrar los recibos Marcados'
            Caption = 'Cobrar'
            ImageIndex = 56
            OnClick = ButtCobrarClick
          end
          object TBDescobrarRecibo: TToolButton
            Left = 191
            Top = 0
            Action = ADescobrarRecibo
          end
          object PNLSeleccion: TLFPanel
            Left = 214
            Top = 0
            Width = 166
            Height = 22
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              166
              22)
            object BTodos: TButton
              Left = 2
              Top = 0
              Width = 86
              Height = 22
              Anchors = [akTop, akRight]
              Caption = 'Todos'
              TabOrder = 0
              OnClick = BTodosClick
            end
            object BMarcados: TButton
              Left = 88
              Top = 0
              Width = 76
              Height = 22
              Anchors = [akTop, akRight]
              Caption = 'Marcados'
              TabOrder = 1
              OnClick = BMarcadosClick
            end
          end
          object TBSep2: TToolButton
            Left = 380
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object PNLMontoTotal: TLFPanel
            Left = 388
            Top = 0
            Width = 169
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              169
              22)
            object LDiferencia: TLFLabel
              Left = 13
              Top = 4
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Anchors = []
              Caption = 'Monto total'
              Layout = tlCenter
            end
            object EDTMontoRecibo: TLFEdit
              Left = 69
              Top = 0
              Width = 100
              Height = 21
              Anchors = []
              AutoSize = False
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 868
          Height = 239
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DMRecibosDesglose.DsCobros
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalleCellClick
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
          CamposNoAccesibles.Strings = (
            'LINEA'
            'VENCIMIENTO'
            'CTA_PAGO'
            'LIQUIDO'
            'PAGADO'
            'TIPO_EFECTO'
            'IMPAGADO'
            'COD_CLI_PRO'
            'DOC_NUMERO')
          ColumnasCheckBoxes.Strings = (
            'MARCADO'
            'PAGADO')
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
              Expanded = False
              FieldName = 'MARCADO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCIMIENTO'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_PAGO'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Z_MONTO_APLICAR'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Z_PENDIENTE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              ReadOnly = True
              Width = 45
              Visible = True
            end>
        end
      end
      object TsFacDesglose: TTabSheet
        Caption = 'Facturas a Desglosar'
        ImageIndex = 1
        object TBDesglose: TLFToolBar
          Left = 0
          Top = 0
          Width = 868
          Height = 26
          AutoSize = True
          ButtonHeight = 26
          ButtonWidth = 25
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          Separators = True
          object NavDesglose: THYMNavigator
            Left = 0
            Top = 0
            Width = 208
            Height = 26
            DataSource = DMRecibosDesglose.DSFacturasDesglose
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFaDesglose
            InsertaControl = DBGFaDesglose
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep4: TToolButton
            Left = 208
            Top = 0
            Width = 8
            ImageIndex = 1
            Style = tbsSeparator
          end
          object TBMarcarTodo: TToolButton
            Left = 216
            Top = 0
            Action = AMarcarTodo
          end
          object TBDesmarcarTodo: TToolButton
            Left = 241
            Top = 0
            Action = ADesmarcarTodo
          end
          object TBSep5: TToolButton
            Left = 266
            Top = 0
            Width = 8
            ImageIndex = 1
            Style = tbsSeparator
          end
          object PNLBusqueda: TLFPanel
            Left = 274
            Top = 0
            Width = 487
            Height = 26
            BevelOuter = bvNone
            TabOrder = 0
            object EBuscar: TLFEdit
              Left = 342
              Top = 3
              Width = 141
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
              OnChange = EBuscarChange
            end
            object RGBusqueda: TRadioGroup
              Left = 2
              Top = -2
              Width = 337
              Height = 28
              Caption = 'Busqueda'
              Columns = 4
              ItemIndex = 0
              Items.Strings = (
                'Nro. Doc.'
                'Titulo'
                'Nombre Pac.'
                'Nro. Autoriz.')
              TabOrder = 1
              OnClick = RGBusquedaClick
            end
          end
        end
        object DBGFaDesglose: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 868
          Height = 249
          Align = alClient
          DataSource = DMRecibosDesglose.DSFacturasDesglose
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = True
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
            'CAMPANYA'
            'FECHA'
            'RIG'
            'CLIENTE'
            'TITULO'
            'TITULO_IDIOMA'
            'SU_REFERENCIA'
            'LIQUIDO'
            'MONEDA'
            'ALMACEN'
            'PRO_NUM_PLANO'
            'IMPORTE_DESGLOSE'
            'ID_RECIBO')
          ColumnasCheckBoxes.Strings = (
            'ID_RECIBO')
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
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_REGISTRO'
              ReadOnly = True
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              ReadOnly = True
              Width = 51
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'BRUTO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_IDIOMA'
              ReadOnly = True
              Title.Caption = 'Paciente'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRO_NUM_PLANO'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_DESGLOSE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RECIBO'
              PickList.Strings = (
                'Si'
                'No')
              Title.Caption = 'Validar'
              Width = 39
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 380
    Top = 116
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 392
    Top = 140
    inherited CEMainMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 16460
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 16499
    end
    inherited CEMainMibuscar: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiaprox: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiexacta: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiimprime: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirango: TMenuItem
      ShortCut = 0
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      ShortCut = 0
      Visible = False
    end
    inherited CEMainMicopy: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicut: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipaste: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMisalir: TMenuItem
      ShortCut = 0
    end
  end
  inherited ALMain: TLFActionList
    Left = 432
    Top = 180
    object AListadoRecibo: TAction
      Tag = 9010
      Category = 'Listados'
      Caption = 'Listado Impresora Recibo Ingreso'
      GroupIndex = 21
      ImageIndex = 14
      OnExecute = AreciboExecute
    end
    object ADescobrarRecibo: TAction
      Category = 'Procesos'
      Caption = 'Anular Cobro Recibo'
      Hint = 'Anular Cobro'
      ImageIndex = 22
      OnExecute = ADescobrarRecibosExecute
    end
    object APrevisualizacion: TAction
      Tag = 9012
      Category = 'Listados'
      Caption = 'Previsualizar Listado Recibo Ingreso'
      ImageIndex = 14
      OnExecute = APrevisualizacionExecute
    end
    object AListadoLimites: TAction
      Tag = 9011
      Category = 'Listados'
      Caption = 'Listado Detallado'
      ImageIndex = 14
      OnExecute = AListadoLimitesExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAbrirReciboIngreso: TAction
      Category = 'Procesos'
      Caption = 'Abrir Recibo Ingreso'
      Hint = 'Abrir Recibo Ingreso'
      ImageIndex = 67
      OnExecute = AAbrirReciboIngresoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfListadoRecibo: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Impresora Recibo Ingreso'
      ImageIndex = 77
      OnExecute = AConfListadoReciboExecute
    end
    object AConfListadoLimites: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Detallado'
      ImageIndex = 77
      OnExecute = AConfListadoLimitesExecute
    end
    object ADesgloseFactura: TAction
      Category = 'Procesos'
      Caption = 'Desglosar Facturas'
      Enabled = False
      Visible = False
      OnExecute = ADesgloseFacturaExecute
    end
    object AMarcarTodo: TAction
      Category = 'Procesos'
      Caption = 'Marca todos los registros'
      Hint = 'Marca todos los registros'
      ImageIndex = 146
      OnExecute = AMarcarTodoExecute
    end
    object ADesmarcarTodo: TAction
      Category = 'Procesos'
      Caption = 'Desmarca todos los registros'
      Hint = 'Desmarca todos los registros'
      ImageIndex = 147
      OnExecute = ADesmarcarTodoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 336
    Top = 120
  end
end
