inherited FMGestionCobros: TFMGestionCobros
  Left = 267
  Top = 171
  Width = 1240
  Height = 639
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Gestion de Cobros'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1230
    Height = 584
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 1226
      ButtonWidth = 33
      ActionList = ALGestionCobros
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      object ButtRefresca: TToolButton
        Left = 40
        Top = 0
        Action = ARefrescaDatos
        AutoSize = True
      end
      object TSep1: TToolButton
        Left = 63
        Top = 0
        Width = 8
        ImageIndex = 27
        Style = tbsSeparator
      end
      object PNLFiltroSigno: TLFPanel
        Left = 71
        Top = 0
        Width = 101
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object LFiltroSigno: TLFLabel
          Left = 0
          Top = 3
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
        end
        object CBSigno: TLFComboBox
          Left = 32
          Top = 0
          Width = 69
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Cobros'
          OnChange = CBSignoChange
          Items.Strings = (
            'Cobros'
            'Pagos')
        end
      end
      object TBSep2: TToolButton
        Left = 172
        Top = 0
        Width = 8
        ImageIndex = 28
        Style = tbsSeparator
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1226
      Height = 554
      ActivePage = TSCartas
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      OnChange = PCMainChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCartas: TTabSheet
        Caption = 'Cartera'
        object PNLCartas: TLFPanel
          Left = 0
          Top = 0
          Width = 1218
          Height = 526
          Align = alClient
          BevelOuter = bvNone
          Caption = #161
          TabOrder = 0
          object TBCartas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1218
            Height = 24
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavCartas: THYMNavigator
              Left = 0
              Top = 2
              Width = 220
              Height = 22
              DataSource = DMGestionCobros.DSxCartas
              Flat = True
              ParentShowHint = False
              PopupMenu = CEMainPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CEMain
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TBSep4: TToolButton
              Left = 220
              Top = 2
              Width = 8
              ImageIndex = 35
              Style = tbsSeparator
            end
            object PNLFiltroTercero: TPanel
              Left = 228
              Top = 2
              Width = 114
              Height = 21
              Alignment = taRightJustify
              AutoSize = True
              BevelOuter = bvNone
              TabOrder = 2
              object LFiltroTercero: TLFLabel
                Left = 0
                Top = 3
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tercero'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object EFFiltroTercero: TLFEditFind2000
                Left = 50
                Top = 0
                Width = 64
                Height = 21
                TabOrder = 0
                OnChange = EFFiltroTerceroChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'TERCERO'
                CampoStr = 'NOMBRE_R_SOCIAL'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = True
                Tabla_a_buscar = 'SYS_TERCEROS'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'TERCERO')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
            end
            object TBSep1: TToolButton
              Left = 342
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object BImprimirCarta: TToolButton
              Left = 350
              Top = 2
              Action = AImprimirCarta
            end
            object BEnviarCarta: TToolButton
              Left = 373
              Top = 2
              Action = AEnviarCartaReclamacion
            end
            object PNLTotalCartera: TPanel
              Left = 396
              Top = 2
              Width = 148
              Height = 22
              Alignment = taRightJustify
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object LTotalCartera: TLFLabel
                Left = 3
                Top = 3
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBETotalCartera: TLFDbedit
                Left = 36
                Top = 0
                Width = 112
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL'
                DataSource = DMGestionCobros.DSxTotal
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object DBGFCartas: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 1218
            Height = 502
            Align = alClient
            DataSource = DMGestionCobros.DSxCartas
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGFCartasCellClick
            OnDrawColumnCell = DBGFCartasDrawColumnCell
            OnDblClick = DBGFCartasDblClick
            IniStorage = FSMain
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
              'AGENTE'
              'BANCO'
              'CARTA1'
              'CARTA2'
              'CARTA3'
              'CARTA4'
              'CARTA5'
              'COD_CLI_PRO'
              'CTA_PAGO'
              'CUENTA'
              'DOC_FECHA'
              'DOC_NUMERO'
              'DOC_SERIE'
              'DOC_TIPO'
              'EJERCICIO'
              'EMAIL'
              'FECHA_REGISTRO'
              'FORMA_PAGO'
              'LINEA'
              'LIQUIDO'
              'LISTADO'
              'NIF'
              'NOMBRE_COMERCIAL'
              'NOMBRE_R_SOCIAL'
              'OBSERVACIONES'
              'REGISTRO'
              'RESPONSABLE'
              'TELEFAX'
              'TELEFONO01'
              'TELEFONO02'
              'TERCERO'
              'TIPO_EFECTO'
              'VENCIMIENTO'
              'ORIGEN_IMPAGADO'
              'TEXTO'
              'SU_DOCUMENTO'
              'PAGO_AUTORIZADO')
            ColumnasCheckBoxes.Strings = (
              'CARTA1'
              'CARTA2'
              'CARTA3'
              'CARTA4'
              'CARTA5'
              'LISTADO'
              'ORIGEN_IMPAGADO'
              'VISIBLE'
              'PAGADO'
              'RECIBIDO'
              'PAGO_AUTORIZADO')
            ColumnasChecked.Strings = (
              '1'
              '1'
              '1'
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
              '0'
              '0'
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
                Expanded = False
                FieldName = 'PAGO_AUTORIZADO'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'REGISTRO'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Width = 35
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
                FieldName = 'DOC_TIPO'
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
                Width = 70
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SU_DOCUMENTO'
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DOC_FECHA'
                ReadOnly = True
                Width = 72
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CTA_PAGO'
                ReadOnly = True
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORMA_PAGO'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO_EFECTO'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CUENTA'
                ReadOnly = True
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COD_CLI_PRO'
                ReadOnly = True
                Title.Caption = 'Cliente / Proveedor'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE_R_SOCIAL'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE_COMERCIAL'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'AGENTE'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RESPONSABLE'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CARTA1'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CARTA2'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CARTA3'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CARTA4'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CARTA5'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ORIGEN_IMPAGADO'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'OBSERVACIONES'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_REGISTRO'
                ReadOnly = True
                Width = 72
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NIF'
                ReadOnly = True
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TELEFONO01'
                ReadOnly = True
                Width = 120
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TELEFONO02'
                ReadOnly = True
                Width = 120
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TELEFAX'
                ReadOnly = True
                Width = 120
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EMAIL'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TEXTO'
                Visible = True
              end>
          end
        end
      end
      object TSClientes: TTabSheet
        Caption = 'Clientes'
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 375
          Width = 1218
          Height = 6
          Cursor = crVSplit
          Align = alTop
          Color = clGray
          ParentColor = False
        end
        object PNDetalle: TLFPanel
          Left = 0
          Top = 0
          Width = 1218
          Height = 375
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNCliente: TLFPanel
            Left = 0
            Top = 0
            Width = 1218
            Height = 88
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LCliente: TLFLabel
              Left = 28
              Top = 16
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
            end
            object LAgente: TLFLabel
              Left = 369
              Top = 15
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Agente'
            end
            object LDireccion: TLFLabel
              Left = 15
              Top = 38
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Direcci'#243'n'
            end
            object LTelefono: TLFLabel
              Left = 18
              Top = 59
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tel'#233'fono'
            end
            object LTeleFax: TLFLabel
              Left = 217
              Top = 60
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tele-Fax'
            end
            object LEMail: TLFLabel
              Left = 315
              Top = 37
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'E-Mail'
            end
            object LTercero: TLFLabel
              Left = 486
              Top = 15
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tercero'
            end
            object LFormaPago: TLFLabel
              Left = 391
              Top = 59
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Pago'
            end
            object SBAAgente: TSpeedButton
              Left = 416
              Top = 4
              Width = 69
              Height = 20
              Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Agente'
              GroupIndex = -1
              Flat = True
              OnDblClick = SBAAgenteDblClick
            end
            object SBACliente: TSpeedButton
              Left = 536
              Top = 4
              Width = 73
              Height = 20
              Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
              GroupIndex = -1
              Flat = True
              OnDblClick = SBAClienteDblClick
            end
            object SBATercero: TSpeedButton
              Left = 136
              Top = 4
              Width = 229
              Height = 20
              Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Cliente'
              GroupIndex = -1
              Flat = True
              OnDblClick = SBATerceroDblClick
            end
            object EFCliente: TLFEditFind2000
              Left = 64
              Top = 12
              Width = 67
              Height = 21
              TabOrder = 0
              OnChange = EFClienteChange
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
            object EClienteTitulo: TLFEdit
              Left = 132
              Top = 12
              Width = 220
              Height = 21
              Color = clAqua
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              OnDblClick = AClienteExecute
            end
            object DBEAgente: TLFDbedit
              Left = 407
              Top = 12
              Width = 67
              Height = 21
              Color = clAqua
              DataField = 'AGENTE'
              DataSource = DMGestionCobros.DSxClientes
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              OnDblClick = AAgenteExecute
            end
            object DBETelefono01: TLFDbedit
              Left = 64
              Top = 56
              Width = 145
              Height = 21
              Color = clInfoBk
              DataField = 'TELEFONO01'
              DataSource = DMGestionCobros.DSxClientes
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBETelefax: TLFDbedit
              Left = 262
              Top = 56
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'TELEFAX'
              DataSource = DMGestionCobros.DSxClientes
              Enabled = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBECorreo: TLFDbedit
              Left = 354
              Top = 34
              Width = 246
              Height = 21
              Color = clInfoBk
              DataField = 'EMAIL'
              DataSource = DMGestionCobros.DSxClientes
              Enabled = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBETercero: TLFDbedit
              Left = 527
              Top = 12
              Width = 73
              Height = 21
              Color = clAqua
              DataField = 'TERCERO'
              DataSource = DMGestionCobros.DSxClientes
              Enabled = False
              ReadOnly = True
              TabOrder = 6
              OnDblClick = ATerceroExecute
            end
            object DBEDireccion: TLFDbedit
              Left = 64
              Top = 34
              Width = 225
              Height = 21
              Color = clInfoBk
              DataField = 'DIR_COMPLETA_N'
              DataSource = DMGestionCobros.DSxClientes
              Enabled = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBEFPago: TLFDbedit
              Left = 432
              Top = 56
              Width = 41
              Height = 21
              Color = clInfoBk
              DataField = 'FORMA_PAGO'
              DataSource = DMGestionCobros.DSxClientes
              Enabled = False
              ReadOnly = True
              TabOrder = 8
              OnChange = DBEFPagoChange
            end
            object ETituloFPago: TLFEdit
              Left = 474
              Top = 56
              Width = 126
              Height = 21
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 9
            end
          end
          object PNRecibo: TLFPanel
            Left = 0
            Top = 88
            Width = 1218
            Height = 287
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object PCRecibos: TLFPageControl
              Left = 0
              Top = 0
              Width = 1218
              Height = 260
              ActivePage = TSCliente
              Align = alClient
              OwnerDraw = True
              TabIndex = 0
              TabOrder = 0
              OnChange = PCRecibosChange
              TabActiveColor = clWhite
              TabInactiveColor = 14936298
              object TSCliente: TTabSheet
                Caption = 'Cliente'
                object DBClienteRecibos: TDBGridFind2000
                  Left = 0
                  Top = 22
                  Width = 1210
                  Height = 210
                  Align = alClient
                  DataSource = DMGestionCobros.DSRecibosCobroCliente
                  Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBClienteRecibosDrawColumnCell
                  OnDblClick = AReciboClienteExecute
                  IniStorage = FSMain
                  Insercion = False
                  ColumnaInicial = 0
                  UsaDicG2K = False
                  Changed = False
                  Idioma = 'CAS'
                  AutoCambiarColumna = True
                  AutoPostEnCheckBox = False
                  AutoStartDrag = False
                  AutoStartDragInterval = 0
                  IndiceBitmapOrdenable = 0
                  IndiceBitmapAscendente = 1
                  IndiceBitmapChecked = 3
                  IndiceBitmapDescendente = 2
                  BaseDeDatos = DMMain.DataBase
                  BuscarNums = False
                  Campos.Strings = (
                    'RESPONSABLE')
                  CamposAMostrar.Strings = (
                    'RESPONSABLE'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '0')
                  CamposADevolver.Strings = (
                    'EMPLEADO')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  CamposAOrdernar.Strings = (
                    'BASES'
                    'CARTA1'
                    'CARTA2'
                    'CARTA3'
                    'CARTA4'
                    'CARTA5'
                    'CONFIRMING'
                    'CUENTA'
                    'DOC_NUMERO'
                    'DOC_SERIE'
                    'DOC_TIPO'
                    'EJERCICIO'
                    'FECHA_REGISTRO'
                    'LIQUIDO'
                    'MONEDA'
                    'NOMBRE_R_SOCIAL'
                    'ORD_PAGO'
                    'REGISTRO'
                    'REMESA'
                    'RESPONSABLE'
                    'TIPO_EFECTO'
                    'VENCIMIENTO')
                  ColumnasCheckBoxes.Strings = (
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
                    '1')
                  ColumnasNoChecked.Strings = (
                    '0'
                    '0'
                    '0'
                    '0'
                    '0')
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'EMPLEADO')
                  SalirSiVacio = True
                  SalirSiNoExiste = True
                  Tablas.Strings = (
                    'VER_EMPLEADOS_EF')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'TITULO')
                  Posicion = tpCentrado
                  OnBusqueda = DBClienteRecibosBusqueda
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    'EMPLEADO')
                  Filtros = []
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'EJERCICIO'
                      ReadOnly = True
                      Width = 44
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'REGISTRO'
                      ReadOnly = True
                      Width = 48
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'FECHA_REGISTRO'
                      ReadOnly = True
                      Width = 82
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'VENCIMIENTO'
                      ReadOnly = True
                      Width = 70
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'BASES'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LIQUIDO'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'RESPONSABLE'
                      Width = 43
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'NOMBRE_R_SOCIAL'
                      ReadOnly = True
                      Width = 196
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CUENTA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DOC_TIPO'
                      ReadOnly = True
                      Width = 58
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DOC_SERIE'
                      ReadOnly = True
                      Width = 65
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DOC_NUMERO'
                      ReadOnly = True
                      Width = 81
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CARTA1'
                      ReadOnly = True
                      Width = 38
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CARTA2'
                      ReadOnly = True
                      Width = 38
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CARTA3'
                      ReadOnly = True
                      Width = 38
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CARTA4'
                      ReadOnly = True
                      Width = 38
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CARTA5'
                      ReadOnly = True
                      Width = 38
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'MONEDA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TIPO_EFECTO'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'REMESA'
                      ReadOnly = True
                      Width = 45
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'ORD_PAGO'
                      ReadOnly = True
                      Width = 55
                      Visible = True
                    end>
                end
                object TBClientes: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 1210
                  Height = 22
                  AutoSize = True
                  DisabledImages = DMMain.ILMain_In
                  EdgeBorders = []
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Flat = True
                  HotImages = DMMain.ILMain_Ac
                  Images = DMMain.ILMain_Ac
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  Separators = True
                  object TBMarcarCarta: TToolButton
                    Left = 0
                    Top = 0
                    Action = AMarcarCarta
                  end
                  object TBDesmarcarCarta: TToolButton
                    Left = 23
                    Top = 0
                    Action = ADesmarcarCarta
                  end
                  object TSep3: TToolButton
                    Left = 46
                    Top = 0
                    Width = 8
                    ImageIndex = 0
                    Style = tbsSeparator
                  end
                  object TBRefrescaDatosCliente: TToolButton
                    Left = 54
                    Top = 0
                    Action = ARefrescaDatosCliente
                  end
                  object TSep4: TToolButton
                    Left = 77
                    Top = 0
                    Width = 8
                    ImageIndex = 27
                    Style = tbsSeparator
                  end
                  object TBVerPrevisionCobros: TToolButton
                    Left = 85
                    Top = 0
                    Action = AVerPrevisionCobros
                  end
                end
              end
              object TSProveedor: TTabSheet
                Caption = 'Proveedor'
                ImageIndex = 1
                object DBProveedorRecibos: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 1210
                  Height = 232
                  Align = alClient
                  DataSource = DMGestionCobros.DSRecibosCobroProveedor
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBClienteRecibosDrawColumnCell
                  OnDblClick = AReciboProveedorExecute
                  IniStorage = FSMain
                  Insercion = False
                  ColumnaInicial = 0
                  UsaDicG2K = False
                  Changed = False
                  Idioma = 'CAS'
                  AutoCambiarColumna = True
                  AutoPostEnCheckBox = False
                  AutoStartDrag = False
                  AutoStartDragInterval = 0
                  IndiceBitmapOrdenable = 0
                  IndiceBitmapAscendente = 1
                  IndiceBitmapChecked = 3
                  IndiceBitmapDescendente = 2
                  BaseDeDatos = DMMain.DataBase
                  BuscarNums = False
                  Campos.Strings = (
                    'RESPONSABLE')
                  CamposAMostrar.Strings = (
                    'RESPONSABLE'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '0')
                  CamposADevolver.Strings = (
                    'TERCERO')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  ColumnasCheckBoxes.Strings = (
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
                    '1')
                  ColumnasNoChecked.Strings = (
                    '0'
                    '0'
                    '0'
                    '0'
                    '0')
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'TERCERO')
                  SalirSiVacio = True
                  SalirSiNoExiste = True
                  Tablas.Strings = (
                    'SYS_TERCEROS')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'NOMBRE_COMERCIAL')
                  Posicion = tpCentrado
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    '')
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'EJERCICIO'
                      ReadOnly = True
                      Width = 44
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'REGISTRO'
                      ReadOnly = True
                      Width = 48
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'FECHA_REGISTRO'
                      ReadOnly = True
                      Width = 82
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'VENCIMIENTO'
                      ReadOnly = True
                      Width = 70
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CUENTA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DOC_NUMERO'
                      ReadOnly = True
                      Width = 81
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'BASES'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LIQUIDO'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DOC_SERIE'
                      ReadOnly = True
                      Width = 65
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DOC_TIPO'
                      ReadOnly = True
                      Width = 58
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'MONEDA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TIPO_EFECTO'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'REMESA'
                      ReadOnly = True
                      Width = 45
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CONFIRMING'
                      ReadOnly = True
                      Width = 56
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'ORD_PAGO'
                      ReadOnly = True
                      Width = 55
                      Visible = True
                    end>
                end
              end
            end
            object PNPieRecibos: TLFPanel
              Left = 0
              Top = 260
              Width = 1218
              Height = 27
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object PNLTotales: TLFPanel
                Left = 885
                Top = 0
                Width = 333
                Height = 27
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object LLiquido: TLFLabel
                  Left = 190
                  Top = 6
                  Width = 36
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'L'#237'quido'
                end
                object LBases: TLFLabel
                  Left = 45
                  Top = 6
                  Width = 29
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Bases'
                end
                object DBETotalBases: TLFDbedit
                  Left = 78
                  Top = 3
                  Width = 95
                  Height = 21
                  Color = clInfoBk
                  DataField = 'BASE'
                  DataSource = DMGestionCobros.DSxTotalRecibos
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBETotalLiquido: TLFDbedit
                  Left = 230
                  Top = 3
                  Width = 95
                  Height = 21
                  Color = clInfoBk
                  DataField = 'LIQUIDO'
                  DataSource = DMGestionCobros.DSxTotalRecibos
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 1
                end
              end
            end
          end
        end
        object PNIncidencias: TLFPanel
          Left = 0
          Top = 381
          Width = 1218
          Height = 145
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter3: TSplitter
            Left = 0
            Top = 98
            Width = 1218
            Height = 6
            Cursor = crVSplit
            Align = alBottom
            Color = clGray
            ParentColor = False
          end
          object TBIncidencias: TLFToolBar
            Left = 0
            Top = 0
            Width = 1218
            Height = 29
            DisabledImages = DMMain.ILMain_In
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object BFiltraIncidenciasAbiertasOTodas: TToolButton
              Left = 0
              Top = 2
              Action = AFiltraIncidenciasAbiertasOTodas
            end
            object TSep2: TToolButton
              Left = 23
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object PNLFiltroTipoIncidencia: TLFPanel
              Left = 31
              Top = 2
              Width = 323
              Height = 22
              BevelOuter = bvNone
              TabOrder = 0
              object LTipoIncidencia: TLFLabel
                Left = 16
                Top = 4
                Width = 73
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Incidencia'
                Layout = tlCenter
              end
              object ETipoIncidenciaTitulo: TLFEdit
                Left = 138
                Top = 0
                Width = 183
                Height = 21
                Color = clInfoBk
                Enabled = False
                ReadOnly = True
                TabOrder = 0
              end
              object EFTipoIncidencia: TLFEditFind2000
                Left = 92
                Top = 0
                Width = 45
                Height = 21
                TabOrder = 1
                OnChange = EFTipoIncidenciaChange
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
                Tabla_a_buscar = 'SYS_TIPO_INCIDENCIA_KRI'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'TIPO')
                Filtros = []
              end
            end
          end
          object PNLNotasIncidencia: TLFPanel
            Left = 0
            Top = 104
            Width = 1218
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Splitter2: TSplitter
              Left = 304
              Top = 0
              Width = 6
              Height = 41
              Cursor = crHSplit
              Color = clGray
              ParentColor = False
            end
            object DBMDatosIncidencia: TLFDBMemo
              Left = 0
              Top = 0
              Width = 304
              Height = 41
              Align = alLeft
              BevelOuter = bvNone
              DataField = 'DATOS_INCIDENCIA'
              DataSource = DMGestionCobros.DSIncidencias
              TabOrder = 0
            end
            object DBMRespuestaIncidencia: TLFDBMemo
              Left = 310
              Top = 0
              Width = 908
              Height = 41
              Align = alClient
              BevelOuter = bvNone
              DataField = 'RESPUESTA_INCIDENCIA'
              DataSource = DMGestionCobros.DSIncidencias
              TabOrder = 1
            end
          end
          object DBIncidencias: THYTDBGrid
            Left = 0
            Top = 29
            Width = 1218
            Height = 69
            Align = alClient
            DataSource = DMGestionCobros.DSIncidencias
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBIncidenciasDrawColumnCell
            OnDblClick = DBIncidenciasDblClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'AGENTE'
              'COD_CLI_PRO'
              'CONTACTO'
              'DIR_NOMBRE'
              'DIRECCION'
              'DOC_CANAL'
              'DOC_EJERCICIO'
              'DOC_RIG'
              'DOC_SERIE'
              'DOC_TIPO'
              'FECHA'
              'FECHA_RECEPCION'
              'FECHA_RESPUESTA'
              'INCIDENCIA'
              'NOMBRE_USUARIO'
              'TERCERO'
              'TIPO_INCIDENCIA_KRI'
              'TIPO_TERCERO'
              'TIT_AGENTE'
              'TIT_CONTACTO'
              'TIT_TIPO_INCIDENCIA_KRI'
              'TITULO_INCIDENCIA'
              'TITULO_TERCERO'
              'USUARIO')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_INCIDENCIA'
                ReadOnly = True
                Width = 213
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
                FieldName = 'FECHA_RECEPCION'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_RESPUESTA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DOC_TIPO'
                ReadOnly = True
                Width = 58
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO_INCIDENCIA_KRI'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
                ReadOnly = True
                Width = 208
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DOC_RIG'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DIRECCION'
                ReadOnly = True
                Width = 53
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DIR_NOMBRE'
                ReadOnly = True
                Width = 290
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'USUARIO'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE_USUARIO'
                ReadOnly = True
                Visible = True
              end>
          end
        end
      end
      object TSCobrados: TTabSheet
        Caption = 'Cobrados'
        ImageIndex = 2
        object TBCarteraDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 1218
          Height = 24
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavCarteraDetalle: THYMNavigator
            Left = 0
            Top = 2
            Width = 220
            Height = 22
            DataSource = DMGestionCobros.DSxCarteraDetalle
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEMain
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSeparador: TToolButton
            Left = 220
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object PNLCobradosFiltroFecha: TLFPanel
            Left = 228
            Top = 2
            Width = 485
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFecha: TLFLabel
              Left = -3
              Top = 3
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Pago'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DEDesdeFechaPago: TDateEdit
              Left = 69
              Top = 0
              Width = 119
              Height = 21
              NumGlyphs = 2
              TabOrder = 0
              OnChange = DEDesdeFechaPagoChange
            end
            object DEHastaFechaPago: TDateEdit
              Left = 189
              Top = 0
              Width = 119
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
              OnChange = DEDesdeFechaPagoChange
            end
            object CBPendientesPago: TLFCheckBox
              Left = 405
              Top = 2
              Width = 81
              Height = 17
              Caption = 'Pendientes'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              OnChange = DEDesdeFechaPagoChange
            end
            object TButtFechaAnt: TButton
              Left = 309
              Top = 0
              Width = 23
              Height = 22
              Caption = '<'
              TabOrder = 2
              OnClick = TButtFechaAntClick
            end
            object TButtFechaHoy: TButton
              Left = 333
              Top = 0
              Width = 23
              Height = 22
              Caption = 'Hoy'
              TabOrder = 3
              OnClick = TButtFechaHoyClick
            end
            object TButtFechaSig: TButton
              Left = 381
              Top = 0
              Width = 23
              Height = 22
              Caption = '>'
              TabOrder = 5
              OnClick = TButtFechaSigClick
            end
            object TButtFechaMes: TButton
              Left = 357
              Top = 0
              Width = 23
              Height = 22
              Caption = 'Mes'
              TabOrder = 4
              OnClick = TButtFechaMesClick
            end
          end
          object PNLCobradosFiltroRuta: TLFPanel
            Left = 713
            Top = 2
            Width = 114
            Height = 22
            BevelOuter = bvNone
            TabOrder = 2
            object LRutaCarteraDetalle: TLFLabel
              Left = 15
              Top = 3
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ruta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EFRuta: TLFEdit
              Left = 46
              Top = 0
              Width = 66
              Height = 21
              TabOrder = 0
              OnChange = EFRutaChange
            end
          end
          object PNLCobradosFiltroAgente: TLFPanel
            Left = 827
            Top = 2
            Width = 124
            Height = 22
            BevelOuter = bvNone
            TabOrder = 3
            object LAgenteCarteraDetalle: TLFLabel
              Left = 13
              Top = 3
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EFAgente: TLFEditFind2000
              Left = 57
              Top = 0
              Width = 66
              Height = 21
              TabOrder = 0
              OnChange = EFAgenteChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'AGENTE'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGENTE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object TBSep3: TToolButton
            Left = 951
            Top = 2
            Width = 8
            ImageIndex = 0
            Style = tbsSeparator
          end
          object PNLTotalCobrados: TPanel
            Left = 959
            Top = 2
            Width = 149
            Height = 22
            Alignment = taRightJustify
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object LTotalCobrados: TLFLabel
              Left = 11
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBETotalCobrados: TLFDbedit
              Left = 45
              Top = 0
              Width = 102
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL'
              DataSource = DMGestionCobros.DSxTotalCarteraDetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        object DBGCarteraDetalle: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 1218
          Height = 502
          Align = alClient
          Color = clInfoBk
          DataSource = DMGestionCobros.DSxCarteraDetalle
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFCartasCellClick
          OnDrawColumnCell = DBGCarteraDetalleDrawColumnCell
          OnDblClick = DBGCarteraDetalleDblClick
          OnTitleClick = DBGCarteraDetalleTitleClick
          IniStorage = FSMain
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'PAGADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 252
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCIMIENTO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PAGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_TIPO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 60
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
              FieldName = 'LIQUIDO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMESA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGRUPACION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Width = 80
              Visible = True
            end>
        end
      end
      object TSPagados: TTabSheet
        Caption = 'Pagados'
        ImageIndex = 3
        object TBPagados: TLFToolBar
          Left = 0
          Top = 0
          Width = 1218
          Height = 24
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavPagados: THYMNavigator
            Left = 0
            Top = 2
            Width = 220
            Height = 22
            DataSource = DMGestionCobros.DSxPagados
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEMain
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 220
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object LFPanel1: TLFPanel
            Left = 228
            Top = 2
            Width = 493
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFechaPagadosDesde: TLFLabel
              Left = -3
              Top = 3
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Pago'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DEFechaPagadosDesde: TDateEdit
              Left = 69
              Top = 0
              Width = 119
              Height = 21
              NumGlyphs = 2
              TabOrder = 0
              OnChange = DEFechaPagadosHastaChange
            end
            object DEFechaPagadosHasta: TDateEdit
              Left = 189
              Top = 0
              Width = 119
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
              OnChange = DEFechaPagadosHastaChange
            end
            object TButtFechaPagadosAnt: TButton
              Left = 309
              Top = 0
              Width = 23
              Height = 22
              Caption = '<'
              TabOrder = 2
              OnClick = TButtFechaPagadosAntClick
            end
            object TButtFechaPagadosHoy: TButton
              Left = 333
              Top = 0
              Width = 23
              Height = 22
              Caption = 'Hoy'
              TabOrder = 3
              OnClick = TButtFechaPagadosHoyClick
            end
            object TButtFechaPagadosSig: TButton
              Left = 381
              Top = 0
              Width = 23
              Height = 22
              Caption = '>'
              TabOrder = 5
              OnClick = TButtFechaPagadosSigClick
            end
            object TButtFechaPagadosMes: TButton
              Left = 357
              Top = 0
              Width = 23
              Height = 22
              Caption = 'Mes'
              TabOrder = 4
              OnClick = TButtFechaPagadosMesClick
            end
            object CBPagadosPendientes: TLFCheckBox
              Left = 405
              Top = 2
              Width = 81
              Height = 17
              Caption = 'Pendientes'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              OnChange = DEFechaPagadosHastaChange
            end
          end
          object PNLTotalPagados: TPanel
            Left = 721
            Top = 2
            Width = 149
            Height = 22
            Alignment = taRightJustify
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object LTotalPagados: TLFLabel
              Left = 11
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBETotalPagados: TLFDbedit
              Left = 45
              Top = 0
              Width = 102
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL'
              DataSource = DMGestionCobros.DSxTotalPagados
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        object DBGPagados: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 1218
          Height = 502
          Align = alClient
          Color = clInfoBk
          DataSource = DMGestionCobros.DSxPagados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFCartasCellClick
          OnDrawColumnCell = DBGCarteraDetalleDrawColumnCell
          OnDblClick = DBGPagadosDblClick
          OnTitleClick = DBGPagadosTitleClick
          IniStorage = FSMain
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'PAGADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 252
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCIMIENTO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PAGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_TIPO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 60
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
              FieldName = 'LIQUIDO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONFIRMING'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORD_PAGO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGRUPACION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Width = 100
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 584
    Width = 1230
    Height = 26
  end
  inherited CEMain: TControlEdit
    Left = 448
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 484
    Top = 4
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 600
    Top = 0
    object AImprimirCarta: TAction
      Category = 'Listados'
      Caption = 'Carta de reclamaci'#243'n'
      ImageIndex = 14
      OnExecute = AImprimirCartaExecute
    end
    object AConfigurarCarta1: TAction
      Tag = 1
      Category = 'Listados;Configuracion'
      Caption = 'Carta &1'
      Hint = 'Configura listado de carta 1'
      ImageIndex = 77
      OnExecute = AConfigurar
    end
    object AConfigurarCarta2: TAction
      Tag = 2
      Category = 'Listados;Configuracion'
      Caption = 'Carta &2'
      Hint = 'Configura listado de carta 2'
      ImageIndex = 77
      OnExecute = AConfigurar
    end
    object AConfigurarCarta3: TAction
      Tag = 3
      Category = 'Listados;Configuracion'
      Caption = 'Carta &3'
      Hint = 'Configura listado de carta 3'
      ImageIndex = 77
      OnExecute = AConfigurar
    end
    object AConfigurarCarta4: TAction
      Tag = 4
      Category = 'Listados;Configuracion'
      Caption = 'Carta &4'
      Hint = 'Configura listado de carta 4'
      ImageIndex = 77
      OnExecute = AConfigurar
    end
    object AConfigurarCarta5: TAction
      Tag = 5
      Category = 'Listados;Configuracion'
      Caption = 'Carta &5'
      Hint = 'Configura listado de carta 5'
      ImageIndex = 77
      OnExecute = AConfigurar
    end
    object AEnviaMails: TAction
      Category = 'Procesos'
      Caption = 'Envia Notifiacion a Responsable'
      Hint = 'Envia notificacion de recibos asignados a responsable'
      ImageIndex = 30
      OnExecute = AEnviaMailsExecute
    end
    object AEnviarCartaReclamacion: TAction
      Category = 'Procesos'
      Caption = 'Enviar siguiente Carta de Reclamacion'
      Hint = 'Enviar siguiente Carta de Reclamacion'
      ImageIndex = 34
      OnExecute = AEnviarCartaReclamacionExecute
    end
    object AConfiguracionListado: TLFCategoryAction
      Category = 'Listados;Configuracion'
      Caption = 'Configuraci'#243'n de Listado'
      ImageIndex = 77
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 524
    Top = 2
  end
  object ALGestionCobros: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 560
    object ARefrescaDatos: TAction
      Caption = 'Refresca Datos'
      Hint = 'Refresca Datos'
      ImageIndex = 26
      OnExecute = ARefrescaDatosExecute
    end
    object ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir del formulario'
      ImageIndex = 0
    end
    object ATercero: TAction
      Caption = 'ATercero'
      ImageIndex = 54
      OnExecute = ATerceroExecute
    end
    object AAgente: TAction
      Caption = 'AAgente'
      ImageIndex = 106
      OnExecute = AAgenteExecute
    end
    object AIncidencia: TAction
      Caption = 'AIncidencia'
      ImageIndex = 6
      OnExecute = AIncidenciaExecute
    end
    object AReciboCliente: TAction
      Caption = 'AReciboCliente'
      ImageIndex = 75
      OnExecute = AReciboClienteExecute
    end
    object AReciboProveedor: TAction
      Caption = 'AReciboProveedor'
      ImageIndex = 75
      OnExecute = AReciboProveedorExecute
    end
    object ACliente: TAction
      Caption = 'ACliente'
      ImageIndex = 104
      OnExecute = AClienteExecute
    end
    object AFiltraIncidenciasAbiertasOTodas: TAction
      Caption = 'Muestra Todas las Incidencias'
      Hint = 'Muestra Todas las Incidencias'
      ImageIndex = 23
      OnExecute = AFiltraIncidenciasAbiertasOTodasExecute
    end
    object AMarcarCarta: TAction
      Caption = 'Desmarcar carta'
      Hint = 'Marcar como enviada la siguiente carta'
      ImageIndex = 7
      OnExecute = AMarcarCartaExecute
    end
    object ADesmarcarCarta: TAction
      Caption = 'Desmarcar Carta'
      Hint = 'Desmarcar como enviada la ultima carta'
      ImageIndex = 6
      OnExecute = ADesmarcarCartaExecute
    end
    object ARefrescaDatosCliente: TAction
      Caption = 'Refresca Datos'
      Hint = 'Refresca Datos'
      ImageIndex = 26
      OnExecute = ARefrescaDatosClienteExecute
    end
    object AVerPrevisionCobros: TAction
      Caption = 'Ver Prevision de Cobros'
      Hint = 'Ver Prevision de Cobros'
      ImageIndex = 143
      OnExecute = AVerPrevisionCobrosExecute
    end
  end
end
