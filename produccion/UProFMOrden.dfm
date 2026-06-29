inherited ProFMOrden: TProFMOrden
  Left = 642
  Top = 230
  Width = 970
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Orden Producci'#243'n'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 970
  FormStyle = fsNormal
  PopupMenu = CECostesPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 960
    Height = 547
    inherited TBMain: TLFToolBar
      Width = 956
      Height = 22
      BorderWidth = 0
      Wrapable = True
      inherited NavMain: THYMNavigator
        Align = alTop
        Hints.Strings = ()
        EditaControl = DBEFCompuesto
        InsertaControl = DBEFCompuesto
        InsertaUltimo = True
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object TButtInfoStocksCompuesto: TToolButton
        Left = 319
        Top = 0
        Hint = 'Informaci'#243'n de Stocks'
        Caption = 'Informaci'#243'n de Stocks'
        ImageIndex = 1
        OnClick = AInfoStocksExecute
      end
      object TButtInforme: TToolButton
        Left = 342
        Top = 0
        Hint = 'Ver Informe de Orden'
        Caption = 'Ver Informe de Orden'
        DropdownMenu = PMInformeOrden
        ImageIndex = 14
        Style = tbsDropDown
        OnClick = TButtInformeClick
      end
      object TBDocumentos: TToolButton
        Left = 378
        Top = 0
        Action = ADocumentos
      end
      object TBCarpetas: TToolButton
        Left = 401
        Top = 0
        Hint = 'Explorar Carpetas'
        Caption = 'Carpetas'
        ImageIndex = 81
        OnClick = TBCarpetasClick
      end
      object TBMovimientos: TToolButton
        Left = 424
        Top = 0
        Caption = 'Movimientos'
        ImageIndex = 128
        OnClick = TBMovimientosClick
      end
      object ToolButton5: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object BtIntroduceMedidas: TToolButton
        Left = 455
        Top = 0
        Hint = 'Introducci'#243'n medidas'
        Caption = 'Introducci'#243'n medidas'
        ImageIndex = 3
        OnClick = BtIntroduceMedidasClick
      end
      object TButtFiltraOrdenesYSubordenes: TToolButton
        Left = 478
        Top = 0
        Action = AFiltraOrdenesYSubordenes
      end
      object PnlSerie: TLFPanel
        Left = 501
        Top = 0
        Width = 262
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object LblSerie: TLFLabel
          Left = 18
          Top = 3
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object EFSerie: TLFEditFind2000
          Left = 45
          Top = 0
          Width = 60
          Height = 21
          TabOrder = 0
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
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESerie: TLFEdit
          Left = 106
          Top = 0
          Width = 155
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object BSituacionAnterior: TToolButton
        Left = 763
        Top = 0
        Action = ASituacionAnterior
      end
      object ToolButton13: TToolButton
        Left = 786
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object BSituacionSiguiente: TToolButton
        Left = 794
        Top = 0
        Action = ASituacionSiguiente
      end
      object TButtCierreParcialOrden: TToolButton
        Left = 817
        Top = 0
        Action = ACierreParcialOrden
      end
      object TButtReservarNuevamente: TToolButton
        Left = 840
        Top = 0
        Action = AReservarNuevamente
      end
    end
    inherited PCMain: TLFPageControl
      Top = 46
      Width = 956
      Height = 499
      OnChange = PCMainChange
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBACompuesto: TSpeedButton [0]
          Left = 289
          Top = 28
          Width = 144
          Height = 26
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
          GroupIndex = -1
          OnDblClick = SBACompuestoDblClick
        end
        object SBACliente: TSpeedButton [1]
          Left = 124
          Top = 48
          Width = 74
          Height = 26
          Hint = 'Doble click o Ctrl+Alt+E para ver los datos del Cliente'
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        object SBAEscandallo: TSpeedButton [2]
          Left = 76
          Top = 86
          Width = 65
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+S para ver los datos del Escandallo'
          GroupIndex = -1
          OnDblClick = SBAEscandalloDblClick
        end
        object SBAPedido: TSpeedButton [3]
          Left = 400
          Top = 35
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAPedidoDblClick
        end
        object SBALote: TSpeedButton [4]
          Left = 632
          Top = 213
          Width = 113
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+S para ver los datos del Escandallo'
          GroupIndex = -1
          OnDblClick = SBALoteDblClick
        end
        object SBAProyecto: TSpeedButton [5]
          Left = 224
          Top = 149
          Width = 89
          Height = 17
          GroupIndex = -1
          Caption = 'AAProyecto'
          OnDblClick = SBAProyectoDblClick
        end
        object SBALoteReserva: TSpeedButton [6]
          Left = 640
          Top = 221
          Width = 113
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+S para ver los datos del Escandallo'
          GroupIndex = -1
          OnDblClick = SBALoteReservaDblClick
        end
        object SBAEscandallo2: TSpeedButton [7]
          Left = 76
          Top = 86
          Width = 65
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+S para ver los datos del Escandallo'
          GroupIndex = -1
          OnDblClick = SBAEscandallo2DblClick
        end
        inherited PEdit: TLFPanel
          Width = 948
          Height = 471
          inherited G2KTableLoc: TG2KTBLoc
            Left = 16
            Top = 2
            CamposADesplegar.Strings = (
              'COMPUESTO')
            Tabla_a_buscar = 'VER_PRO_ORD'
            CampoNum = 'ID_ORDEN'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID_ORDEN')
          end
          object LblOrden: TLFLabel
            Left = 41
            Top = 39
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
            FocusControl = DBEOrden
          end
          object LblSuborden: TLFLabel
            Left = 10
            Top = 61
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden Padre'
            FocusControl = DBESubOrden
          end
          object LblCliente: TLFLabel
            Left = 38
            Top = 127
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LblAlmSalida: TLFLabel
            Left = 18
            Top = 215
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Salida'
          end
          object LblFecha: TLFLabel
            Left = 526
            Top = 17
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Orden'
          end
          object LPedido: TLFLabel
            Left = 555
            Top = 127
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
          end
          object LLineaPedido: TLFLabel
            Left = 527
            Top = 149
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea Pedido'
          end
          object LFechaPedido: TLFLabel
            Left = 522
            Top = 171
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Pedido'
          end
          object LblMerma: TLFLabel
            Left = 38
            Top = 369
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Merma'
            FocusControl = DBEMerma
          end
          object LblPrioridad: TLFLabel
            Left = 29
            Top = 347
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prioridad'
            FocusControl = DBEPrioridad
          end
          object LblFechaFin: TLFLabel
            Left = 541
            Top = 259
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Fin'
          end
          object LblFechaIni: TLFLabel
            Left = 530
            Top = 237
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inicio'
          end
          object LblFechaEnt: TLFLabel
            Left = 518
            Top = 215
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Entrega'
          end
          object LblUdsPed: TLFLabel
            Left = 388
            Top = 127
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Pedido'
            FocusControl = DBEUdsPedido
          end
          object LblUndsMan: TLFLabel
            Left = 386
            Top = 149
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Manual'
            FocusControl = DBEUniManual
          end
          object LblUdsTot: TLFLabel
            Left = 397
            Top = 172
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Total'
            FocusControl = DBEUdsTotal
          end
          object LblUdsProd: TLFLabel
            Left = 367
            Top = 238
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Producci'#243'n'
            FocusControl = DBEUdsProd
            Visible = False
          end
          object LblUdsPend: TLFLabel
            Left = 368
            Top = 193
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Pendientes'
            FocusControl = DBEUdsPend
          end
          object LblAlmLanz: TLFLabel
            Left = 21
            Top = 237
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Lanz.'
          end
          object LblAlmEntrada: TLFLabel
            Left = 10
            Top = 259
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Entrada'
          end
          object LEscandallo: TLFLabel
            Left = 18
            Top = 83
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object LPadreOF: TLFLabel
            Left = 165
            Top = 61
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Padre OF'
          end
          object LNumeroSub: TLFLabel
            Left = 294
            Top = 61
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. Sub.'
          end
          object LReferencia: TLFLabel
            Left = 18
            Top = 148
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
          end
          object LIDOrden: TLFLabel
            Left = 30
            Top = 18
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'IDOrden'
          end
          object LEstado: TLFLabel
            Left = 177
            Top = 18
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LblMedida1: TLFLabel
            Left = 249
            Top = 347
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 1'
            FocusControl = DBEMedida1
          end
          object LblMedida2: TLFLabel
            Left = 249
            Top = 369
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 2'
            FocusControl = DBEMedida2
          end
          object LblMedida3: TLFLabel
            Left = 249
            Top = 391
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 3'
            FocusControl = DBEMedida3
          end
          object LblMedida4: TLFLabel
            Left = 249
            Top = 413
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 4'
          end
          object LResponsable: TLFLabel
            Left = 148
            Top = 39
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LFUniFabricadas: TLFLabel
            Left = 369
            Top = 215
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Fabricadas'
          end
          object LLote: TLFLabel
            Left = 49
            Top = 282
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
          end
          object LUbicacion: TLFLabel
            Left = 22
            Top = 323
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ubicaci'#243'n'
          end
          object LblUnidad: TLFLabel
            Left = 440
            Top = 60
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidad'
          end
          object LCopiasPMP: TLFLabel
            Left = 388
            Top = 280
            Width = 58
            Height = 13
            Caption = 'Copias PMP'
          end
          object LBLVersion: TLFLabel
            Left = 643
            Top = 83
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Versi'#243'n'
          end
          object LUnidadesReservadas: TLFLabel
            Left = 364
            Top = 259
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Reservadas'
            FocusControl = DBEUnidadesReservadas
          end
          object LProyecto: TLFLabel
            Left = 28
            Top = 171
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object LLoteReserva: TLFLabel
            Left = 6
            Top = 304
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote Reserva'
          end
          object LEscandallo2: TLFLabel
            Left = 9
            Top = 105
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo 2'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object DBESubOrden: TLFDbedit
            Left = 74
            Top = 57
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SUBORDEN'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 40
          end
          object DBEOrden: TLFDbedit
            Left = 74
            Top = 35
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG_OF'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 771
            Top = 15
            Width = 130
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 29
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = ProDMOrden.DSQMProOrd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPrioridad: TLFDbedit
            Left = 74
            Top = 343
            Width = 63
            Height = 21
            DataField = 'PRIORIDAD'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 13
          end
          object DBEMerma: TLFDbedit
            Left = 74
            Top = 365
            Width = 63
            Height = 21
            DataField = 'MERMA'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 14
          end
          object DBEUdsPend: TLFDbedit
            Left = 449
            Top = 189
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNI_PENDIENTES'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 41
          end
          object DBEUdsProd: TLFDbedit
            Left = 449
            Top = 233
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNI_PRODUC'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 56
            Visible = False
          end
          object DBEUdsTotal: TLFDbedit
            Left = 449
            Top = 167
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNI_TOTAL'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 55
          end
          object DBEUniManual: TLFDbedit
            Left = 449
            Top = 145
            Width = 65
            Height = 21
            DataField = 'UNI_MANUAL'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 22
          end
          object DBEUdsPedido: TLFDbedit
            Left = 449
            Top = 123
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNI_PEDID'
            DataSource = ProDMOrden.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 52
          end
          object DBEFAlmSal: TLFDBEditFind2000
            Left = 74
            Top = 211
            Width = 63
            Height = 21
            DataField = 'ALMACEN_SAL'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 8
            OnChange = DBEFAlmSalChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAlmLan: TLFDBEditFind2000
            Left = 74
            Top = 233
            Width = 63
            Height = 21
            DataField = 'ALMACEN_LAN'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 9
            OnChange = DBEFAlmLanChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAlmEnt: TLFDBEditFind2000
            Left = 74
            Top = 255
            Width = 63
            Height = 21
            DataField = 'ALMACEN_ENT'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 10
            OnChange = DBEFAlmEntChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFEscandallo: TLFDBEditFind2000
            Left = 74
            Top = 79
            Width = 63
            Height = 21
            Color = clAqua
            DataField = 'ESCANDALLO'
            DataSource = ProDMOrden.DSQMProOrd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnDblClick = SBAEscandalloDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'VERSION_ESCANDALLO')
            CampoNum = 'ESCANDALLO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFEscandalloBusqueda
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 583
            Top = 13
            Width = 94
            Height = 21
            DataField = 'FECHA_ORD'
            DataSource = ProDMOrden.DSQMProOrd
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEFechaPedido: TLFDbedit
            Left = 592
            Top = 167
            Width = 93
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_PED'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 42
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 74
            Top = 123
            Width = 63
            Height = 21
            DataField = 'CLIENTE'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 5
            OnExit = DBEFClienteExit
            Accion = ANewCliente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCompuesto: TLFDBEditFind2000
            Left = 138
            Top = 79
            Width = 85
            Height = 21
            DataField = 'COMPUESTO'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 3
            OnChange = DBEFCompuestoChange
            OnDblClick = SBACompuestoDblClick
            Accion = ANewArticulo
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PRO_COMPUESTOS_ESC_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'estado=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDFechaIni: TLFDBDateEdit
            Left = 592
            Top = 233
            Width = 93
            Height = 21
            DataField = 'FECHA_INI'
            DataSource = ProDMOrden.DSQMProOrd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 25
          end
          object DBDFechaFin: TLFDBDateEdit
            Left = 592
            Top = 255
            Width = 93
            Height = 21
            DataField = 'FECHA_FIN'
            DataSource = ProDMOrden.DSQMProOrd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 27
          end
          object DBDFechaEnt: TLFDBDateEdit
            Left = 592
            Top = 211
            Width = 93
            Height = 21
            DataField = 'FECHA_ENTREGA'
            DataSource = ProDMOrden.DSQMProOrd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 24
          end
          object GBFirmas: TGroupBox
            Left = 765
            Top = 178
            Width = 144
            Height = 95
            Caption = 'Firmas ISO'
            Enabled = False
            TabOrder = 33
            object ChkBAprobado: TLFCheckBox
              Left = 6
              Top = 23
              Width = 130
              Height = 17
              Caption = 'Aprobado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
            end
            object ChkBVerificado: TLFCheckBox
              Left = 6
              Top = 45
              Width = 130
              Height = 17
              Caption = 'Verificado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
            end
            object ChkBValidado: TLFCheckBox
              Left = 6
              Top = 67
              Width = 130
              Height = 17
              Caption = 'Validado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
            end
          end
          object DBEDescCompuesto: TLFDbedit
            Left = 224
            Top = 79
            Width = 409
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 43
            OnDblClick = SBACompuestoDblClick
            OnEnter = DBEDescCompuestoEnter
          end
          object EDescAlmacenSal: TLFEdit
            Left = 138
            Top = 211
            Width = 222
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 44
          end
          object EDescAlmacenLan: TLFEdit
            Left = 138
            Top = 233
            Width = 222
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 45
          end
          object EDescAlmacenEnt: TLFEdit
            Left = 138
            Top = 255
            Width = 222
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 46
          end
          object DBEDescCliente: TLFDbedit
            Left = 138
            Top = 123
            Width = 222
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_CLIENTE'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 47
            OnDblClick = SBAClienteDblClick
          end
          object DBEPedido: TLFDbedit
            Left = 592
            Top = 123
            Width = 93
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'PEDIDO'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 48
          end
          object DBELineaPed: TLFDbedit
            Left = 592
            Top = 145
            Width = 93
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'LINEA_PED'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 49
          end
          object DBDTPFechaIniTime: TDBDateTimePicker
            Left = 686
            Top = 233
            Width = 68
            Height = 21
            CalAlignment = dtaLeft
            Date = 46162
            Time = 46162
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 26
            DataField = 'FECHA_INI'
            DataSource = ProDMOrden.DSQMProOrd
          end
          object DBDTPFechaFinTime: TDBDateTimePicker
            Left = 686
            Top = 255
            Width = 68
            Height = 21
            CalAlignment = dtaLeft
            Date = 46162
            Time = 46162
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 28
            DataField = 'FECHA_FIN'
            DataSource = ProDMOrden.DSQMProOrd
          end
          object LFDBPadreOF: TLFDbedit
            Left = 213
            Top = 57
            Width = 63
            Height = 21
            Color = clInfoBk
            DataField = 'PADRE_SUBORDEN'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            ReadOnly = True
            TabOrder = 50
          end
          object LFDBExecSuborden: TLFDbedit
            Left = 348
            Top = 57
            Width = 63
            Height = 21
            Color = clInfoBk
            DataField = 'CONT_SUBORDEN'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            ReadOnly = True
            TabOrder = 51
          end
          object DBERef: TLFDbedit
            Left = 74
            Top = 145
            Width = 286
            Height = 21
            DataField = 'REFERENCIA'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 6
          end
          object LFDBIdOrden: TLFDbedit
            Left = 74
            Top = 13
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_ORDEN'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            ReadOnly = True
            TabOrder = 53
            OnChange = LFDBIdOrdenChange
          end
          object LFDBEstado: TLFDbedit
            Left = 214
            Top = 13
            Width = 268
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_SITUACION'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            ReadOnly = True
            TabOrder = 54
          end
          object RGImportar: TRadioGroup
            Left = 765
            Top = 279
            Width = 144
            Height = 120
            Caption = 'Importar'
            ItemIndex = 0
            Items.Strings = (
              'Escandallo completo'
              'Fases'
              'Fases / Materiales'
              'Fases / Tareas'
              'Fases / Tareas / Materiales'
              'Segun Despiece')
            TabOrder = 35
            OnClick = RGImportarClick
          end
          object RGCaso: TRadioGroup
            Left = 429
            Top = 310
            Width = 325
            Height = 89
            Caption = 'Sub-Orden'
            ItemIndex = 0
            Items.Strings = (
              'Generar Sub-Ordenes'
              'Generar Ordenes Independientes'
              'No Generar Sub-Ordenes')
            TabOrder = 34
            OnClick = RGCasoClick
          end
          object LFCerrarSubOP: TLFDBCheckBox
            Left = 589
            Top = 326
            Width = 152
            Height = 17
            Caption = 'Cerrar Sub-Ordenes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 38
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CERRAR_SUBORDENES'
            DataSource = ProDMOrden.DSQMProOrd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCheckPrevaleceAlm: TLFDBCheckBox
            Left = 771
            Top = 37
            Width = 130
            Height = 17
            Caption = 'Prevalece Alm de OF'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PREVALECE_ALM_ORDEN'
            DataSource = ProDMOrden.DSQMProOrd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFReservaStock: TLFDBCheckBox
            Left = 771
            Top = 59
            Width = 130
            Height = 17
            Caption = 'Reserva Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RESERVA_STOCK_OP'
            DataSource = ProDMOrden.DSQMProOrd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEMedida1: TLFDbedit
            Left = 297
            Top = 343
            Width = 63
            Height = 21
            DataField = 'MEDIDA_1'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 15
          end
          object DBEMedida2: TLFDbedit
            Left = 297
            Top = 365
            Width = 63
            Height = 21
            DataField = 'MEDIDA_2'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 16
          end
          object DBEMedida3: TLFDbedit
            Left = 297
            Top = 387
            Width = 63
            Height = 21
            DataField = 'MEDIDA_3'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 17
          end
          object DBEMedida4: TLFDbedit
            Left = 297
            Top = 409
            Width = 63
            Height = 21
            DataField = 'MEDIDA_4'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 18
          end
          object LFResponsable: TLFDBEditFind2000
            Left = 214
            Top = 35
            Width = 50
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 19
            OnChange = LFResponsableChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescResponsable: TLFEdit
            Left = 265
            Top = 35
            Width = 217
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 57
          end
          object LFCompVirtuales: TLFDBCheckBox
            Left = 589
            Top = 375
            Width = 160
            Height = 17
            Caption = 'No Mov. en Comp. Virtuales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 39
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'COMPUESTOS_VIRTUALES'
            DataSource = ProDMOrden.DSQMProOrd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBUndsFabri: TLFDbedit
            Left = 449
            Top = 211
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNI_FABRICADAS'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 37
          end
          object DBELote: TLFDbedit
            Left = 74
            Top = 277
            Width = 63
            Height = 21
            DataField = 'ID_LOTE'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 11
            OnKeyUp = DBELoteKeyUp
          end
          object DBETituloLote: TLFDbedit
            Left = 138
            Top = 277
            Width = 222
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'DESC_LOTE'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            ReadOnly = True
            TabOrder = 58
            OnDblClick = SBALoteDblClick
          end
          object LFDTituloUbi: TLFDbedit
            Left = 138
            Top = 321
            Width = 222
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_UBICACION'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            ReadOnly = True
            TabOrder = 59
          end
          object LFDUbicacion: TLFDBEditFind2000
            Left = 74
            Top = 321
            Width = 63
            Height = 21
            DataField = 'ID_UBICACION'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 12
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_UBICACION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = False
            OnBusqueda = LFDUbicacionBusqueda
            OrdenadoPor.Strings = (
              'GENERAL DESC, ID_UBICACION')
            Filtros = []
          end
          object EDescTipoUnidad: TLFEdit
            Left = 529
            Top = 57
            Width = 217
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 60
          end
          object DBEFUnidad: TLFDBEditFind2000
            Left = 478
            Top = 57
            Width = 50
            Height = 21
            AutoSize = False
            DataField = 'UNIDAD'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 20
            OnChange = DBEFUnidadChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_UNIDADES_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object LFDBCopiasPMP: TLFDbedit
            Left = 449
            Top = 277
            Width = 65
            Height = 21
            DataField = 'COPIAS_PMP'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 23
          end
          object GBVistoBueno: TGroupBox
            Left = 765
            Top = 78
            Width = 144
            Height = 95
            Caption = 'Visto Bueno'
            TabOrder = 32
            object DBCBVistoBueno1: TLFDBCheckBox
              Left = 6
              Top = 23
              Width = 130
              Height = 17
              Caption = 'Operario'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VISTOBUENO1'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBVistoBueno3: TLFDBCheckBox
              Left = 6
              Top = 67
              Width = 130
              Height = 17
              Caption = 'Jefe'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VISTOBUENO3'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBVistoBueno2: TLFDBCheckBox
              Left = 6
              Top = 45
              Width = 130
              Height = 17
              Caption = 'Encargado'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VISTOBUENO2'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBEVersion: TLFDbedit
            Left = 682
            Top = 79
            Width = 63
            Height = 21
            DataField = 'VERSION_ORDEN'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 21
          end
          object DBEUnidadesReservadas: TLFDbedit
            Left = 449
            Top = 255
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNIDADES_RESERVADAS'
            DataSource = ProDMOrden.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 61
          end
          object EFProyecto: TLFDBEditFind2000
            Left = 74
            Top = 167
            Width = 63
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 7
            OnChange = EFProyectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMPedidos.EntornoDoc
          end
          object ETitProyecto: TLFEdit
            Left = 138
            Top = 167
            Width = 222
            Height = 21
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 62
          end
          object DBELoteReserva: TLFDbedit
            Left = 74
            Top = 299
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_LOTE_RESERVA'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            TabOrder = 63
          end
          object DBETituloLoteReserva: TLFDbedit
            Left = 138
            Top = 299
            Width = 222
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'DESC_LOTE_RESERVA'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            ReadOnly = True
            TabOrder = 64
            OnDblClick = SBALoteDblClick
          end
          object DBEFEscandallo2: TLFDBEditFind2000
            Left = 74
            Top = 101
            Width = 63
            Height = 21
            Color = clAqua
            DataField = 'ESCANDALLO_2'
            DataSource = ProDMOrden.DSQMProOrd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = DBEFEscandallo2Change
            OnDblClick = SBAEscandalloDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'VERSION_ESCANDALLO')
            CampoNum = 'ESCANDALLO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFEscandallo2Busqueda
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescCompuesto2: TLFDbedit
            Left = 224
            Top = 101
            Width = 409
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_2'
            DataSource = ProDMOrden.DSQMProOrd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 65
          end
          object GBTyC: TGroupBox
            Left = 429
            Top = 402
            Width = 324
            Height = 68
            Caption = 'Estados'
            TabOrder = 36
            object DBCBRetenido: TLFDBCheckBox
              Left = 6
              Top = 45
              Width = 100
              Height = 17
              Caption = 'Retenido'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'RETENIDO_COMERCIAL'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBUrgente: TLFDBCheckBox
              Left = 6
              Top = 23
              Width = 100
              Height = 17
              Caption = 'Urgente'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'URGENTE'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBSinHerraje: TLFDBCheckBox
              Left = 110
              Top = 43
              Width = 100
              Height = 17
              Caption = 'Sin Herraje'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'SIN_HERRAJE'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBSinLona: TLFDBCheckBox
              Left = 110
              Top = 23
              Width = 100
              Height = 17
              Caption = 'Son Lona'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'SIN_LONA'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBSinRotulacion: TLFDBCheckBox
              Left = 214
              Top = 43
              Width = 100
              Height = 17
              Caption = 'Sin Rotulacion'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'SIN_ROTULACION'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBSinMotor: TLFDBCheckBox
              Left = 214
              Top = 23
              Width = 100
              Height = 17
              Caption = 'Sin Motor'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'SIN_MOTOR'
              DataSource = ProDMOrden.DSQMProOrd
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      object TSDesarrollo: TTabSheet [1]
        Caption = '&Desarrollo'
        ImageIndex = 3
        OnShow = TSDesarrolloShow
        object PNFases: TLFPanel
          Left = 0
          Top = 0
          Width = 948
          Height = 193
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PCFases: TLFPageControl
            Left = 0
            Top = 0
            Width = 948
            Height = 193
            ActivePage = TSDibujoFases
            Align = alClient
            OwnerDraw = True
            TabIndex = 2
            TabOrder = 0
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSFases: TTabSheet
              Caption = 'F&ases'
              OnShow = TSFasesShow
              object DBGFFases: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 940
                Height = 143
                Align = alClient
                DataSource = ProDMOrden.DSQMProOrdFases
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGFFasesDrawColumnCell
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 1
                UsaDicG2K = True
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
                Campos.Strings = (
                  'TIPOFASE')
                CamposAMostrar.Strings = (
                  'TIPOFASE'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80')
                CamposADevolver.Strings = (
                  '')
                CamposDesplegar.Strings = (
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'FASE'
                  'FECHA_FIN_FASE'
                  'FECHA_INICIO_FASE'
                  'LINEA_FASE'
                  'ORDEN'
                  'TIPOFASE')
                ColumnasCheckBoxes.Strings = (
                  'ESTADO')
                ColumnasChecked.Strings = (
                  '1')
                ColumnasNoChecked.Strings = (
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'FASE')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'PRO_SYS_FASES')
                Acciones.Strings = (
                  '')
                Titulos.Strings = (
                  'TITULO')
                Posicion = tpCentrado
                Planes.Strings = (
                  '')
                OrdenMultiple = False
                OrdenadosPor.Strings = (
                  'FASE')
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA_FASE'
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
                    Expanded = False
                    FieldName = 'TIPOFASE'
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'FASE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 300
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEN'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_INICIO_FASE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_FIN_FASE'
                    Width = 111
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REBAJE'
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CANTIDAD_ENTRADA'
                    ReadOnly = True
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CANTIDAD_TERMINADA'
                    ReadOnly = True
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PIEZAS_HORA_PREV'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MERMA_FASE_PREV'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TIEMPO'
                    ReadOnly = True
                    Width = 83
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TIEMPO_UTIL'
                    ReadOnly = True
                    Width = 67
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DIFERENCIA_TIEMPO'
                    ReadOnly = True
                    Visible = True
                  end>
              end
              object TBFases: TLFToolBar
                Left = 0
                Top = 0
                Width = 940
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Separators = True
                object NavFases: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ProDMOrden.DSQMProOrdFases
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEFasesPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFFases
                  InsertaControl = DBGFFases
                  Exclusivo = True
                  ControlEdit = CEFases
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
                object ToolButton7: TToolButton
                  Left = 200
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtGraficoCostesFases: TToolButton
                  Left = 208
                  Top = 0
                  Hint = 'Costes por Fases'
                  Caption = 'Costes por Fase'
                  ImageIndex = 56
                  OnClick = TButtGraficoCostesFasesClick
                end
                object BtIncidencia: TToolButton
                  Left = 231
                  Top = 0
                  Hint = 'Inc. Materiales'
                  Caption = 'Inc. Materiales'
                  ImageIndex = 6
                  OnClick = BtIncidenciaClick
                end
              end
            end
            object TSNotasFases: TTabSheet
              Caption = 'N&otas'
              ImageIndex = 2
              OnShow = TSNotasFasesShow
              object PNNotasFases: TLFPanel
                Left = 0
                Top = 43
                Width = 940
                Height = 122
                Align = alClient
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 2
                object DBMNotasFases: TDBRichEdit
                  Left = 0
                  Top = 0
                  Width = 940
                  Height = 122
                  Align = alClient
                  DataField = 'NOTAS'
                  DataSource = ProDMOrden.DSQMProOrdFases
                  TabOrder = 0
                  OnSelectionChange = SelectionChangeFase
                end
              end
              object TBNotasDesarrollo: TLFToolBar
                Left = 0
                Top = 0
                Width = 940
                Height = 21
                AutoSize = True
                ButtonHeight = 21
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object DBENotasFaseRig: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 81
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'TIPOFASE'
                  DataSource = ProDMOrden.DSQMProOrdFases
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBENotasFaseCompuesto: TLFDbedit
                  Left = 81
                  Top = 0
                  Width = 264
                  Height = 21
                  TabStop = False
                  AutoSize = False
                  Color = clInfoBk
                  DataField = 'FASE'
                  DataSource = ProDMOrden.DSQMProOrdFases
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object NavNotasFases: THYMNavigator
                  Left = 345
                  Top = 0
                  Width = 80
                  Height = 21
                  DataSource = ProDMOrden.DSQMProOrdFases
                  VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CENotasFasesPMEdit
                  ShowHint = True
                  TabOrder = 2
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBMNotasFases
                  Exclusivo = True
                  ControlEdit = CENotasFases
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
              object TBNotasDesarrolloEstilo: TLFToolBar
                Left = 0
                Top = 21
                Width = 940
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                Images = DMMain.ToolbarImages
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Separators = True
                object TButtUndoFase: TToolButton
                  Left = 0
                  Top = 0
                  Caption = 'Deshacer'
                  ImageIndex = 4
                  OnClick = TButtUndoFaseClick
                end
                object TButtCutFase: TToolButton
                  Left = 23
                  Top = 0
                  Caption = 'Cortar'
                  ImageIndex = 5
                  OnClick = TButtCutFaseClick
                end
                object TButtCopyFase: TToolButton
                  Left = 46
                  Top = 0
                  Caption = 'Copiar'
                  ImageIndex = 6
                  OnClick = TButtCopyFaseClick
                end
                object TButtPasteFase: TToolButton
                  Left = 69
                  Top = 0
                  Caption = 'Pegar'
                  ImageIndex = 7
                  OnClick = TButtPasteFaseClick
                end
                object ToolButton9: TToolButton
                  Left = 92
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object FontNameFase: TLFComboBox
                  Left = 100
                  Top = 0
                  Width = 145
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  OnChange = FontNameFaseChange
                end
                object FontSizeFase: TLFEdit
                  Left = 245
                  Top = 0
                  Width = 22
                  Height = 22
                  TabOrder = 0
                  Text = '0'
                  OnChange = FontSizeFaseChange
                end
                object UpDown2: TUpDown
                  Left = 267
                  Top = 0
                  Width = 16
                  Height = 22
                  Associate = FontSizeFase
                  Min = 0
                  Position = 0
                  TabOrder = 2
                  Wrap = False
                end
                object ToolButton10: TToolButton
                  Left = 283
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtNegritaFase: TToolButton
                  Left = 291
                  Top = 0
                  Caption = 'Negrita'
                  ImageIndex = 8
                  Style = tbsCheck
                  OnClick = TButtNegritaFaseClick
                end
                object TButtCursivaFase: TToolButton
                  Left = 314
                  Top = 0
                  Caption = 'Cursiva'
                  ImageIndex = 9
                  Style = tbsCheck
                  OnClick = TButtCursivaFaseClick
                end
                object TButtSubrayadoFase: TToolButton
                  Left = 337
                  Top = 0
                  Caption = 'Subrayado'
                  ImageIndex = 10
                  Style = tbsCheck
                  OnClick = TButtSubrayadoFaseClick
                end
                object ToolButton14: TToolButton
                  Left = 360
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtLeftAlignFase: TToolButton
                  Left = 368
                  Top = 0
                  Caption = 'Alinear izquierda'
                  Grouped = True
                  ImageIndex = 11
                  Style = tbsCheck
                  OnClick = TButtLeftAlignFaseClick
                end
                object TButtCenterAlignFase: TToolButton
                  Tag = 2
                  Left = 391
                  Top = 0
                  Caption = 'Centrar'
                  Grouped = True
                  ImageIndex = 12
                  Style = tbsCheck
                  OnClick = TButtCenterAlignFaseClick
                end
                object TButtRightAlignFase: TToolButton
                  Tag = 1
                  Left = 414
                  Top = 0
                  Caption = 'Alinear derecha'
                  Grouped = True
                  ImageIndex = 13
                  Style = tbsCheck
                  OnClick = TButtRightAlignFaseClick
                end
                object TButtColorFase: TToolButton
                  Left = 437
                  Top = 0
                  Caption = 'Color'
                  ImageIndex = 15
                  OnClick = TButtColorFaseClick
                end
              end
            end
            object TSDibujoFases: TTabSheet
              Caption = 'Dibu&jo'
              ImageIndex = 3
              OnShow = TSDibujoFasesShow
              object Imagen: TImage
                Left = 401
                Top = 22
                Width = 539
                Height = 143
                Align = alClient
                Center = True
                Proportional = True
              end
              object TBDibujo: TLFToolBar
                Left = 0
                Top = 0
                Width = 940
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object DBEDibFaseRig: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 81
                  Height = 22
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'TIPOFASE'
                  DataSource = ProDMOrden.DSQMProOrdFases
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEDibFaseCompuesto: TLFDbedit
                  Left = 81
                  Top = 0
                  Width = 264
                  Height = 22
                  TabStop = False
                  AutoSize = False
                  Color = clInfoBk
                  DataField = 'FASE'
                  DataSource = ProDMOrden.DSQMProOrdFases
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object NavDibujoFases: THYMNavigator
                  Left = 345
                  Top = 0
                  Width = 80
                  Height = 22
                  DataSource = ProDMOrden.DSQMProOrdFases
                  VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEImagenesFasesPMEdit
                  ShowHint = True
                  TabOrder = 2
                  OnClick = NavDibujoFasesClick
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBEFImagen
                  Exclusivo = True
                  ControlEdit = CEImagenesFases
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
              object PNLDibujo: TLFPanel
                Left = 0
                Top = 22
                Width = 401
                Height = 143
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object LblImagen: TLFLabel
                  Left = 19
                  Top = 70
                  Width = 35
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imagen'
                end
                object ETituloImagen: TLFEdit
                  Left = 109
                  Top = 66
                  Width = 280
                  Height = 21
                  Color = clInfoBk
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEFImagen: TLFFibDBEditFind
                  Left = 58
                  Top = 66
                  Width = 50
                  Height = 21
                  DataField = 'ID_IMAGEN'
                  DataSource = ProDMOrden.DSQMProOrdFases
                  TabOrder = 1
                  OnChange = DBEFImagenChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = False
                  Tabla_a_buscar = 'SYS_IMAGENES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CODIGO'
                  CampoStr = 'NOMBRE'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OrdenadoPor.Strings = (
                    'CODIGO')
                end
                object BCargarImagen: TButton
                  Left = 341
                  Top = 68
                  Width = 23
                  Height = 18
                  Caption = '...'
                  TabOrder = 2
                  Visible = False
                  OnClick = BCargarImagenClick
                end
                object BClipboard: TButton
                  Left = 364
                  Top = 68
                  Width = 23
                  Height = 18
                  Hint = 'Cargar imagen desde porta papeles'
                  Caption = 'P'
                  TabOrder = 3
                  Visible = False
                  OnClick = BClipboardClick
                end
              end
            end
          end
        end
        object PNMatTarea: TLFPanel
          Left = 0
          Top = 193
          Width = 948
          Height = 278
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object PCMatTarea: TLFPageControl
            Left = 0
            Top = 0
            Width = 948
            Height = 278
            ActivePage = TSTareas
            Align = alClient
            OwnerDraw = True
            TabIndex = 3
            TabOrder = 0
            OnChange = PCMatTareaChange
            OnChanging = PCMatTareaChanging
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSMateriales: TTabSheet
              Caption = '&Materiales'
              OnShow = TSMaterialesShow
              object TBMateriales: TLFToolBar
                Left = 0
                Top = 0
                Width = 940
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Separators = True
                object NavMateriales: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ProDMOrden.DSQMProOrdMat
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEMaterialesPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFMateriales
                  InsertaControl = DBGFMateriales
                  Exclusivo = True
                  ControlEdit = CEMateriales
                  OrdenAscendente = True
                  OnChangeState = NavMaterialesChangeState
                  InsertaUltimo = True
                end
                object TSepMat1: TToolButton
                  Left = 200
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtInfStocksMaterial: TToolButton
                  Left = 208
                  Top = 0
                  Hint = 'Informaci'#243'n de Stocks'
                  Caption = 'Informaci'#243'n de Stocks'
                  ImageIndex = 1
                  OnClick = AInfoStocksExecute
                end
                object TSepMat2: TToolButton
                  Left = 231
                  Top = 0
                  Width = 7
                  Style = tbsSeparator
                end
                object TBInfoLotes: TToolButton
                  Left = 238
                  Top = 0
                  Hint = 'Lotes'
                  Caption = 'Lotes'
                  ImageIndex = 120
                  OnClick = TBInfoLotesClick
                end
                object TBSerializacion: TToolButton
                  Left = 261
                  Top = 0
                  Action = ASerializacion
                end
                object TBUbicacion: TToolButton
                  Left = 284
                  Top = 0
                  Action = AUbicacion
                end
                object TSepMat3: TToolButton
                  Left = 307
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtEquivalenciaLinea: TToolButton
                  Left = 315
                  Top = 0
                  Action = AEquivalenciaLinea
                end
                object TSepMat4: TToolButton
                  Left = 338
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtGraficoMateriales: TToolButton
                  Left = 346
                  Top = 0
                  Hint = 'Coste de todos los materiales de la orden'
                  Caption = 'Coste por Materiales'
                  ImageIndex = 56
                  OnClick = TButtGraficoMaterialesClick
                end
                object TButtNotasMat: TToolButton
                  Left = 369
                  Top = 0
                  Action = ANotasMateriales
                end
                object ButtSep: TToolButton
                  Left = 392
                  Top = 0
                  Width = 8
                  Caption = 'ButtSep'
                  Style = tbsSeparator
                end
                object TBRefrescaStockMateriales: TToolButton
                  Left = 400
                  Top = 0
                  Hint = 'Refresca Stock de Materiales'
                  Caption = 'Refresca Stock Materiales'
                  ImageIndex = 116
                  OnClick = TBRefrescaStockMaterialesClick
                end
                object TBSep3: TToolButton
                  Left = 423
                  Top = 0
                  Width = 8
                  ImageIndex = 117
                  Style = tbsSeparator
                end
                object TBEscandalloMaterial: TToolButton
                  Left = 431
                  Top = 0
                  Action = AEscandalloMaterial
                end
              end
              object DBGFMateriales: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 940
                Height = 228
                Align = alClient
                DataSource = ProDMOrden.DSQMProOrdMat
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGFMaterialesCellClick
                OnColEnter = DBGFMaterialesColEnter
                OnDrawColumnCell = DBGFMaterialesDrawColumnCell
                OnDblClick = DBGFMaterialesDblClick
                OnKeyUp = DBGFMaterialesKeyUp
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 1
                UsaDicG2K = True
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
                Campos.Strings = (
                  'ALMACEN'
                  'COMPONENTE'
                  'MATESC'
                  'UNIDAD_FAB'
                  'UNIDAD_ART'
                  'ID_EQUIVAL'
                  'PROVEEDOR_COMPRA'
                  'FORMULA'
                  'LINEA_TAREA'
                  'ID_UBICACION'
                  'ALMACEN_SAL')
                CamposAMostrar.Strings = (
                  'ALMACEN'
                  '0'
                  'COMPONENTE'
                  '0'
                  'MATESC'
                  '0'
                  'UNIDAD_FAB'
                  '0'
                  'UNIDAD_ART'
                  '0'
                  'ID_EQUIVAL'
                  '0'
                  'PROVEEDOR_COMPRA'
                  '0'
                  'FORMULA'
                  '0'
                  'LINEA_TAREA'
                  '0'
                  'ID_UBICACION'
                  '0'
                  'ALMACEN_SAL'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80'
                  '80'
                  '80'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0')
                CamposADevolver.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  'ID_FORMULA'
                  ''
                  ''
                  '')
                CamposDesplegar.Strings = (
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
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'ALMACEN'
                  'ALMACEN_DEVOLVER'
                  'ALMACEN_SAL'
                  'COMPONENTE'
                  'COMPRAR'
                  'DES_ALTO'
                  'DES_ANCHO'
                  'DES_GRUESO'
                  'ESTADO'
                  'FORMULA'
                  'ID_LOTE'
                  'ID_ORDEN_MAT'
                  'LINEA_MAT'
                  'LINEA_TAREA'
                  'LOTE'
                  'MATESC'
                  'PEDIDOS_A_PRO'
                  'TITULO'
                  'TITULO_UBICACION')
                ColumnasCheckBoxes.Strings = (
                  'COMPRAR'
                  'MOV_STOCK_COMPRA'
                  'RESERVA_STOCK')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'ALMACEN'
                  'ARTICULO'
                  'ESCANDALLO'
                  'TIPO'
                  'TIPO'
                  'ID_EQUIVAL'
                  'PROVEEDOR'
                  'ID_FORMULA'
                  'LINEA_TAREA'
                  'ID_UBICACION'
                  'ALMACEN')
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'ART_ALMACENES'
                  'VER_ARTICULOS_EF'
                  'PRO_ESCANDALLO'
                  'SYS_UNIDADES_ARTICULOS'
                  'SYS_UNIDADES_ARTICULOS'
                  'PRO_SYS_CAB_EQUIVAL'
                  'VER_PROVEEDORES'
                  'PRO_FORMULAS'
                  'PRO_ORD_TAREA'
                  'ART_ALMACENES_UBICACIONES'
                  'ART_ALMACENES')
                Acciones.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
                Titulos.Strings = (
                  'TITULO'
                  'TITULO'
                  'COMPUESTO'
                  'TITULO'
                  'TITULO'
                  'DESC_EQUIVAL'
                  'TITULO'
                  'NOMBRE'
                  'TAREA'
                  'TITULO'
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGFMaterialesBusqueda
                Planes.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
                OrdenMultiple = False
                OrdenadosPor.Strings = (
                  'ALMACEN'
                  'ARTICULO'
                  'ESCANDALLO'
                  'TIPO'
                  'TIPO'
                  'ID_EQUIVAL'
                  'PROVEEDOR'
                  'ID_FORMULA'
                  'LINEA_TAREA'
                  'ID_UBICACION'
                  'ALMACEN')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA_MAT'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 30
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALMACEN_SAL'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALMACEN'
                    Width = 35
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESCRALMACEN'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 130
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMPONENTE'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TITULO_LARGO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 190
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MATESC'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_EQUIVAL'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PORCENTAJE'
                    Title.Alignment = taCenter
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES_STOCK'
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'STOCK'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'STOCK_ALM_LAN'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PEDIDOS_A_PRO'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDAD_ART'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES_FAB'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDAD_FAB'
                    Width = 35
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'UNIDADES_NEC'
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
                    FieldName = 'UNIDADES_UTIL'
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
                    FieldName = 'UNIDADES_PREV'
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
                    FieldName = 'PRE_COS_UNI'
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
                    FieldName = 'TOTAL_VAR'
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
                    FieldName = 'PRECIO_FIJO'
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
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 57
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRE_COS_UNI_REAL'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECIO_FIJO_REAL'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_VAR_REAL'
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
                    FieldName = 'TOTAL_REAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEN'
                    Width = 34
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MEDIDAS'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_PIEZA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_PIEZAS'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMPRAR'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UDS_COMPRA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PROVEEDOR_COMPRA'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESCRIPPROVEEDOR'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 161
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MOV_STOCK_COMPRA'
                    Width = 98
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RESERVA_STOCK'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMULA'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'RESULTADO_FORMULA'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_ALTO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_ANCHO'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_GRUESO'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ID_LOTE'
                    ReadOnly = True
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LOTE'
                    ReadOnly = True
                    Width = 100
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ID_UBICACION'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TITULO_UBICACION'
                    ReadOnly = True
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LINEA_TAREA'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MERMA'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'UNIDADES_DEVOLVER'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ALMACEN_DEVOLVER'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end>
              end
            end
            object TSIncMaterial: TTabSheet
              Caption = 'Inc. Material'
              ImageIndex = 3
              object TBIncMaterial: TLFToolBar
                Left = 0
                Top = 0
                Width = 940
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Separators = True
                object NavIncMaterial: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 100
                  Height = 22
                  DataSource = ProDMOrden.DSxInfoIncMaterial
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
                object ToolButton12: TToolButton
                  Left = 100
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtIncMaterial: TToolButton
                  Left = 108
                  Top = 0
                  Action = AIncMatDet
                end
                object TButtInfStocksIncMaterial: TToolButton
                  Left = 131
                  Top = 0
                  Hint = 'Informaci'#243'n de Stocks'
                  Caption = 'Informaci'#243'n de Stocks'
                  ImageIndex = 1
                  OnClick = AInfoStocksExecute
                end
              end
              object DBGIncMaterial: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 940
                Height = 228
                Align = alClient
                Color = clInfoBk
                DataSource = ProDMOrden.DSxInfoIncMaterial
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = DBGIncMaterialDblClick
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
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
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'RIG_OF'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LINEA'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMPONENTE'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNDS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRE_COS_UNI'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_INC_C'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_ORDEN'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'FASES'
                    Visible = False
                  end>
              end
            end
            object TSMatCompra: TTabSheet
              Caption = 'Compras'
              ImageIndex = 2
              OnShow = TSMatCompraShow
              object TBMatCompras: TLFToolBar
                Left = 0
                Top = 0
                Width = 940
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Separators = True
                object NavMatCompras: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 100
                  Height = 22
                  DataSource = ProDMOrden.DSQMProOrdMatCompra
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
                  InsertaUltimo = True
                end
                object TSepCompras: TToolButton
                  Left = 100
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object CBFiltroCompras: TLFComboBox
                  Left = 108
                  Top = 0
                  Width = 117
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  Text = 'Todas las Compras'
                  OnClick = CambiaEstadoCompras
                  Items.Strings = (
                    'Todas las Compras'
                    'Materiales'
                    'Pedidos'
                    'Albaranes'
                    'Facturas')
                end
                object TSepComprasBut: TToolButton
                  Left = 225
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtOrigenCompra: TToolButton
                  Left = 233
                  Top = 0
                  Action = AOrigenCompra
                end
                object TButtInfStocksCompras: TToolButton
                  Left = 256
                  Top = 0
                  Hint = 'Informaci'#243'n de Stocks'
                  Caption = 'Informaci'#243'n de Stocks'
                  ImageIndex = 1
                  OnClick = AInfoStocksExecute
                end
              end
              object DBGFMatCompras: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 940
                Height = 228
                Align = alClient
                DataSource = ProDMOrden.DSQMProOrdMatCompra
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawDataCell = DBGFMatComprasDrawDataCell
                OnDrawColumnCell = DBGFMatComprasDrawColumnCell
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 9
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
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA_COMPRA'
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
                    FieldName = 'TIPO_COMPRA'
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
                    FieldName = 'PROVEEDOR'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TITULO_PROV'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ALMACEN'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TITULO_ALMACEN'
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
                    FieldName = 'BRUTO'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ARTICULO'
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
                    FieldName = 'TITULO'
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
                    FieldName = 'B_DTO_LINEAS'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'UNIDADES'
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
                    FieldName = 'UDS_UTILIZADAS'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'BRUTO'
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
                    FieldName = 'INCR_COSTE'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'COSTE_MAT_TOTAL'
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
                    FieldName = 'FECHA'
                    ReadOnly = True
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'UNIDADES_PENDIENTES'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'NUM_DOC'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'COSTE_MAT_COMPRA'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end>
              end
            end
            object TSTareas: TTabSheet
              Caption = 'Tar&eas'
              ImageIndex = 1
              OnShow = TSTareasShow
              object TBTareas: TLFToolBar
                Left = 0
                Top = 0
                Width = 940
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Separators = True
                object NavTarea: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ProDMOrden.DSQMProOrdTarea
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CETareasPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFTareas
                  InsertaControl = DBGFTareas
                  Exclusivo = True
                  ControlEdit = CETareas
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
                object TButtSepTareas: TToolButton
                  Left = 200
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtGraficoTareas: TToolButton
                  Left = 208
                  Top = 0
                  Hint = 'Coste de todas las tareas de la orden'
                  Caption = 'Coste por Tareas'
                  ImageIndex = 56
                  OnClick = TButtGraficoTareasClick
                end
                object TButtNotasTarea: TToolButton
                  Left = 231
                  Top = 0
                  Action = ANotasTareas
                end
                object TSepTrabExt: TToolButton
                  Left = 254
                  Top = 0
                  Width = 7
                  Style = tbsSeparator
                end
                object TButtTrabExt: TToolButton
                  Left = 261
                  Top = 0
                  Hint = 'Ver Trabajo Externo'
                  Caption = 'Ver Trabajo Externo'
                  Enabled = False
                  ImageIndex = 92
                  OnClick = TButtTrabExtClick
                end
              end
              object DBGFTareas: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 940
                Height = 228
                Align = alClient
                DataSource = ProDMOrden.DSQMProOrdTarea
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGFTareasCellClick
                OnColEnter = GetTime
                OnDrawColumnCell = DBGFTareasDrawColumnCell
                OnDblClick = DBGFTareasDblClick
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 1
                UsaDicG2K = True
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
                Campos.Strings = (
                  'TIPOTAREA'
                  'RECURSO'
                  'ID_UTILLAJE'
                  'MAQUINA'
                  'FORMULA'
                  'SECCION')
                CamposAMostrar.Strings = (
                  'TIPOTAREA'
                  '0'
                  'RECURSO'
                  '0'
                  'ID_UTILLAJE'
                  '0'
                  'MAQUINA'
                  '0'
                  'FORMULA'
                  '0'
                  'SECCION'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80'
                  '80'
                  '80'
                  '80'
                  '0'
                  '0')
                CamposADevolver.Strings = (
                  ''
                  ''
                  ''
                  ''
                  'ID_FORMULA'
                  '')
                CamposDesplegar.Strings = (
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                ColumnasCheckBoxes.Strings = (
                  'ESTADO'
                  'NO_PRODUCTIVA')
                ColumnasChecked.Strings = (
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'TAREA'
                  'RECURSO'
                  'CODIGO'
                  'CODMAQ'
                  'ID_FORMULA'
                  'SECCION')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'PRO_SYS_TAREAS'
                  'PRO_RECURSOS'
                  'PRO_SYS_UTILLAJES'
                  'PRO_MAQUINAS_C'
                  'PRO_FORMULAS'
                  'OPE_SECCIONES')
                Acciones.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
                Titulos.Strings = (
                  'TITULO'
                  'TITULO'
                  'DESCRIPCION'
                  'DESCRIPCION'
                  'NOMBRE'
                  'DESCRIPCION')
                BeforeColExit = DBGFTareasBeforeColExit
                Posicion = tpCentrado
                OnBusqueda = DBGFTareasBusqueda
                Planes.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
                OrdenMultiple = False
                OrdenadosPor.Strings = (
                  'TAREA'
                  'RECURSO'
                  'CODIGO'
                  'CODMAQ'
                  'ID_FORMULA'
                  'SECCION')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA_TAREA'
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
                    Expanded = False
                    FieldName = 'TIPOTAREA'
                    Width = 62
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TAREA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 160
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RECURSO'
                    Width = 49
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescrRecurso'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 133
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CANTIDAD'
                    Width = 46
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PRE_COS_UNI_PRE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 104
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MAQUINA'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescMaquina'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_VAR_PRE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 95
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECIO_FIJO_PRE'
                    Width = 102
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_PRE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 99
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    ButtonStyle = cbsEllipsis
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TIME_UTIL'
                    ReadOnly = True
                    Width = 81
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CANTIDAD_UTIL'
                    ReadOnly = True
                    Width = 80
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CANTIDAD_IMPUTADA'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRE_COS_UNI_REAL'
                    Width = 84
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_VAR_REAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECIO_FIJO_REAL'
                    Width = 80
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_REAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 80
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_IMP'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECIO_IMP'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UDS_FABRICADAS'
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES_DEFECTUOSAS'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_INICIO_TAREA'
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_FIN_TAREA'
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_UTILLAJE'
                    Width = 39
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESC_UTILLAJE'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEN'
                    Width = 33
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO'
                    Width = 39
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OPERACIONES_NUM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OPERACIONES_TIEMPO'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CosteOperacionPre'
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
                    FieldName = 'CosteOperacionReal'
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
                    Expanded = False
                    FieldName = 'TIME'
                    ReadOnly = True
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL_HORAS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIEMPO'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIEMPO_UTIL'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TIEMPO_PRODUCCION'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMULA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SECCION'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEN_OF'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NO_PRODUCTIVA'
                    Width = 65
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      object TSCostes: TTabSheet [2]
        Caption = '&Costes'
        OnShow = TSCostesShow
        object LFTBCostes: TLFToolBar
          Left = 0
          Top = 0
          Width = 948
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavCostes: THYMNavigator
            Left = 0
            Top = 0
            Width = 92
            Height = 22
            DataSource = ProDMOrden.DSQMProOrd
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CECostesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBECosteFijoReal
            Exclusivo = True
            ControlEdit = CECostes
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 92
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBCopiarAPortapapeles: TToolButton
            Left = 100
            Top = 0
            Hint = 'Copiar A Portapapeles'
            Caption = 'Copiar A Portapapeles'
            ImageIndex = 37
            ParentShowHint = False
            ShowHint = True
            OnClick = TBCopiarAPortapapelesClick
          end
        end
        object PCostes: TLFPanel
          Left = 0
          Top = 22
          Width = 948
          Height = 449
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBChartCostes: TDBChart
            Left = 489
            Top = 0
            Width = 459
            Height = 449
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            BackWall.Color = clSilver
            BackWall.Pen.Visible = False
            Foot.Text.Strings = (
              '')
            Foot.Visible = False
            LeftWall.Color = clWhite
            Title.Text.Strings = (
              'TDBChart')
            Title.Visible = False
            BackColor = clSilver
            BottomAxis.Visible = False
            ClipPoints = False
            Frame.Visible = False
            LeftAxis.Labels = False
            LeftAxis.Ticks.Width = 4
            LeftAxis.Visible = False
            Legend.Alignment = laBottom
            Legend.Color = clBtnFace
            Legend.Frame.Visible = False
            Legend.LegendStyle = lsSeries
            Legend.ShadowSize = 0
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Series3: TBarSeries
              Marks.ArrowLength = 20
              Marks.Style = smsPercent
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clRed
              Title = 'Coste Fijo R.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_FIJO_REAL'
            end
            object Series9: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clFuchsia
              Title = 'Coste Fijo P.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_FIJO_PRE'
            end
            object Series4: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clGreen
              Title = 'Coste Material R.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_MAT_REAL'
            end
            object Series10: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clTeal
              Title = 'Coste Material P.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_MAT_PRE'
            end
            object Series5: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clYellow
              Title = 'Coste MO R.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_MO_REAL'
            end
            object Series11: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clNavy
              Title = 'Coste MO P.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_MO_PRE'
            end
            object Series6: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clBlue
              Title = 'Coste M'#225'q. R.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_MAQ_REAL'
            end
            object Series12: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clMaroon
              Title = 'Coste M'#225'q. P.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_MAQ_PRE'
            end
            object Series7: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clWhite
              Title = 'Coste TExt. R.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_TEX_REAL'
            end
            object Series13: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clLime
              Title = 'Coste TExt. P.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_TEX_PRE'
            end
            object Series8: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clGray
              Title = 'Coste Varios R.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_VAR_REAL'
            end
            object Series14: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clOlive
              Title = 'Coste Varios P.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_VAR_PRE'
            end
            object Series15: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clPurple
              Title = 'Coste Compras P.'
              XLabelsSource = 'COSTE_COMPRAS_PRE'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_COMPRAS_PRE'
            end
            object Series16: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ProDMOrden.DSxInfoActualizada
              SeriesColor = clSilver
              Title = 'Coste Compras R.'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'COSTE_COMPRAS'
            end
          end
          object PNLDatosCoste: TLFPanel
            Left = 0
            Top = 0
            Width = 489
            Height = 449
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object LCosteTotPre: TLFLabel
              Left = 34
              Top = 231
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Total'
              FocusControl = DBECosteTotalPre
            end
            object LblCosteFijoPre: TLFLabel
              Left = 42
              Top = 45
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Fijo'
              FocusControl = DBECosteFijoPre
            end
            object LblCosteMaqPre: TLFLabel
              Left = 34
              Top = 111
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste M'#225'q.'
              FocusControl = DBECosteMaqPre
            end
            object LblCosteMatPre: TLFLabel
              Left = 18
              Top = 67
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Material '
              FocusControl = DBECosteMatPre
            end
            object LblCosteMOPre: TLFLabel
              Left = 41
              Top = 89
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste MO'
              FocusControl = DBECosteMOPre
            end
            object LblCosteTextPre: TLFLabel
              Left = 34
              Top = 134
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Text.'
              FocusControl = DBECosteTExtPre
            end
            object LblCosteUds: TLFLabel
              Left = 35
              Top = 358
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Und.'
              FocusControl = DBECosteUdsPre
            end
            object LblCosteVarPre: TLFLabel
              Left = 29
              Top = 156
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Varios'
              FocusControl = DBECosteVarioPre
            end
            object LblHorasTotales: TLFLabel
              Left = 17
              Top = 430
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Horas Operario'
              FocusControl = DBEHorasOperarioReal
            end
            object LblMargen: TLFLabel
              Left = 41
              Top = 283
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'M'#225'rgen %'
              FocusControl = DBEMargenPre
            end
            object LblMargenTotal: TLFLabel
              Left = 25
              Top = 253
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'M'#225'rgen Total'
              FocusControl = DBEMargenTotalPre
            end
            object LblMargenUnd: TLFLabel
              Left = 26
              Top = 379
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'M'#225'rgen Und.'
              FocusControl = DBEMargenUdsPre
            end
            object LblPrecioVenta: TLFLabel
              Left = 27
              Top = 23
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Precio Venta'
              FocusControl = DBEPrecioVUniReal
            end
            object LCosteMerma: TLFLabel
              Left = 26
              Top = 200
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Merma'
            end
            object LCostesCosteCompra: TLFLabel
              Left = 17
              Top = 178
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Compras'
            end
            object LCostesDiferencia: TLFLabel
              Left = 349
              Top = 0
              Width = 124
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Diferencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LCostesHorasMaquina: TLFLabel
              Left = 16
              Top = 408
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Horas M'#225'quina'
            end
            object LCostesPrecioVentaUnidades: TLFLabel
              Left = 1
              Top = 335
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Precio Venta Und.'
            end
            object LCostesPrevistos: TLFLabel
              Left = 90
              Top = 0
              Width = 124
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Previstos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LCostesReales: TLFLabel
              Left = 219
              Top = 0
              Width = 124
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Reales'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LCostesUnidades: TLFLabel
              Left = 43
              Top = 314
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unidades'
            end
            object DBDifCosteCompras: TLFDbedit
              Left = 349
              Top = 174
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_COMPRAS'
              DataSource = ProDMOrden.DSxInfoActualizada
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
            object DBDifCosteFijo: TLFDbedit
              Left = 349
              Top = 41
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_FIJO'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBDifCosteMaq: TLFDbedit
              Left = 349
              Top = 107
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_MAQ'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBDifCosteMat: TLFDbedit
              Left = 349
              Top = 63
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_MAT'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object DBDifCosteMO: TLFDbedit
              Left = 349
              Top = 85
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_MO'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBDifCosteText: TLFDbedit
              Left = 349
              Top = 130
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_TEXT'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object DBDifCosteTot: TLFDbedit
              Left = 349
              Top = 227
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_TOTAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBDifCosteUds: TLFDbedit
              Left = 349
              Top = 354
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_COSTE_UNI'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBDifCosteVar: TLFDbedit
              Left = 349
              Top = 152
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_VAR'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object DBDifHorasMaquina: TLFDbedit
              Left = 349
              Top = 404
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_HORAS_MAQUINA'
              DataSource = ProDMOrden.DSxInfoActualizada
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
            object DBDifHorasOperario: TLFDbedit
              Left = 349
              Top = 426
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_HORAS_OPERARIO'
              DataSource = ProDMOrden.DSxInfoActualizada
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
            object DBDifMargenCent: TLFDbedit
              Left = 349
              Top = 279
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_MARGEN_UNI_CIEN'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
            end
            object DBDifMargenUds: TLFDbedit
              Left = 349
              Top = 376
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_MARGEN_UNI'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 12
            end
            object DBDifPrecioVenta: TLFDbedit
              Left = 349
              Top = 19
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_PRECIO_VENTA_TOT'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 13
            end
            object DBDifPrecioVUni: TLFDbedit
              Left = 349
              Top = 332
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_PRECIO_VENTA_UNI'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 14
            end
            object DBECosteCompras: TLFDbedit
              Left = 219
              Top = 174
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_COMPRAS'
              DataSource = ProDMOrden.DSxInfoActualizada
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
            object DBECosteComprasPre: TLFDbedit
              Left = 90
              Top = 174
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'COSTE_COMPRAS_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 16
            end
            object DBECosteFijoPre: TLFDbedit
              Left = 90
              Top = 41
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_FIJO_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 17
            end
            object DBECosteFijoReal: TLFDbedit
              Left = 219
              Top = 41
              Width = 124
              Height = 21
              DataField = 'COSTE_FIJO_REAL'
              DataSource = ProDMOrden.DSQMProOrd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 18
            end
            object DBECosteMaqPre: TLFDbedit
              Left = 90
              Top = 107
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_MAQ_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 19
            end
            object DBECosteMaqReal: TLFDbedit
              Left = 219
              Top = 107
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_MAQ_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 20
            end
            object DBECosteMatPre: TLFDbedit
              Left = 90
              Top = 63
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_MAT_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 21
            end
            object DBECosteMatReal: TLFDbedit
              Left = 219
              Top = 63
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_MAT_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 22
            end
            object DBECosteMermaPre: TLFDbedit
              Left = 90
              Top = 196
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'COSTE_MERMA_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 23
            end
            object DBECosteMermaReal: TLFDbedit
              Left = 219
              Top = 196
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_MERMA_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 24
            end
            object DBECosteMOPre: TLFDbedit
              Left = 90
              Top = 85
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_MO_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 25
            end
            object DBECosteMOReal: TLFDbedit
              Left = 219
              Top = 85
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_MO_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 26
            end
            object DBECosteTExtPre: TLFDbedit
              Left = 90
              Top = 130
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_TEX_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 27
            end
            object DBECosteTExtReal: TLFDbedit
              Left = 219
              Top = 130
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_TEX_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 28
            end
            object DBECosteTotalPre: TLFDbedit
              Left = 90
              Top = 227
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_TOT_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 29
            end
            object DBECosteTotalReal: TLFDbedit
              Left = 219
              Top = 227
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_TOT_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 30
            end
            object DBECosteUdsPre: TLFDbedit
              Left = 90
              Top = 354
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_UNITARIO_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 31
            end
            object DBECosteUdsReal: TLFDbedit
              Left = 219
              Top = 354
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'COSTE_UNITARIO'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 32
            end
            object DBECosteVarioPre: TLFDbedit
              Left = 90
              Top = 152
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_VAR_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 33
            end
            object DBECosteVariosReal: TLFDbedit
              Left = 219
              Top = 152
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_VAR_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 34
            end
            object DBEDifCosteMerma: TLFDbedit
              Left = 349
              Top = 196
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DIF_COSTE_MERMA'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 35
            end
            object DBEDifMargenTot: TLFDbedit
              Left = 349
              Top = 249
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_MARGEN_TOTAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 36
            end
            object DBEDifUni: TLFDbedit
              Left = 349
              Top = 310
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'UNI_TOTAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 37
            end
            object DBEHorasMaquinaPre: TLFDbedit
              Left = 90
              Top = 404
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'HORAS_MAQUINA_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 38
            end
            object DBEHorasMaquinaReal: TLFDbedit
              Left = 220
              Top = 404
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'HORAS_MAQUINA'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 39
            end
            object DBEHorasOperarioPre: TLFDbedit
              Left = 90
              Top = 426
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'HORAS_OPERARIO_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 40
            end
            object DBEHorasOperarioReal: TLFDbedit
              Left = 220
              Top = 426
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'HORAS_OPERARIO'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 41
            end
            object DBEMargenCentReal: TLFDbedit
              Left = 219
              Top = 279
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'MARGEN_UNI_CIEN'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 42
            end
            object DBEMargenPre: TLFDbedit
              Left = 90
              Top = 279
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'MARGEN_UNI_CIEN_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 43
            end
            object DBEMargenTotalPre: TLFDbedit
              Left = 90
              Top = 249
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'MARGEN_TOTAL_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 44
            end
            object DBEMargenTReal: TLFDbedit
              Left = 219
              Top = 249
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'MARGEN_TOTAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 45
            end
            object DBEMargenUdsPre: TLFDbedit
              Left = 90
              Top = 376
              Width = 124
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'MARGEN_UNI_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 46
            end
            object DBEMargenUdsReal: TLFDbedit
              Left = 219
              Top = 376
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'MARGEN_UNI'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 47
            end
            object DBEPrecioVentaPre: TLFDbedit
              Left = 90
              Top = 19
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'PRECIO_VENTA_TOT_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 48
            end
            object DBEPrecioVentaReal: TLFDbedit
              Left = 219
              Top = 19
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'PRECIO_VENTA_TOT_REAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 49
            end
            object DBEPrecioVUniPre: TLFDbedit
              Left = 90
              Top = 332
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'PRECIO_VENTA_PRE'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 50
            end
            object DBEPrecioVUniReal: TLFDbedit
              Left = 219
              Top = 332
              Width = 124
              Height = 21
              DataField = 'PRECIO_VENTA'
              DataSource = ProDMOrden.DSQMProOrd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 51
            end
            object DBEUniPre: TLFDbedit
              Left = 90
              Top = 310
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'UNI_TOTAL'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 52
            end
            object DBEUniReal: TLFDbedit
              Left = 219
              Top = 310
              Width = 124
              Height = 21
              Color = clInfoBk
              DataField = 'UNI_FABRICADAS'
              DataSource = ProDMOrden.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 53
            end
          end
        end
      end
      object TSNotas: TTabSheet [3]
        Caption = '&Notas'
        ImageIndex = 1
        OnShow = TSNotasShow
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 948
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            DataSource = ProDMOrden.DSQMProOrd
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object TBNotasEstilo: TLFToolBar
          Left = 0
          Top = 21
          Width = 948
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          Images = DMMain.ToolbarImages
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Separators = True
          object TButtUndo: TToolButton
            Left = 0
            Top = 0
            Caption = 'Deshacer'
            ImageIndex = 4
            OnClick = TButtUndoClick
          end
          object TButtCut: TToolButton
            Left = 23
            Top = 0
            Caption = 'Cortar'
            ImageIndex = 5
            OnClick = TButtCutClick
          end
          object TButtCopy: TToolButton
            Left = 46
            Top = 0
            Caption = 'Copiar'
            ImageIndex = 6
            OnClick = TButtCopyClick
          end
          object TButtPaste: TToolButton
            Left = 69
            Top = 0
            Caption = 'Pegar'
            ImageIndex = 7
            OnClick = TButtPasteClick
          end
          object ToolButton6: TToolButton
            Left = 92
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object FontName: TLFComboBox
            Left = 100
            Top = 0
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = FontNameChange
          end
          object FontSize: TLFEdit
            Left = 245
            Top = 0
            Width = 22
            Height = 22
            TabOrder = 1
            Text = '0'
            OnChange = FontSizeChange
          end
          object UpDown1: TUpDown
            Left = 267
            Top = 0
            Width = 15
            Height = 22
            Associate = FontSize
            Min = 0
            Position = 0
            TabOrder = 2
            Wrap = False
          end
          object ToolButton3: TToolButton
            Left = 282
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtNegrita: TToolButton
            Left = 290
            Top = 0
            Caption = 'Negrita'
            ImageIndex = 8
            Style = tbsCheck
            OnClick = TButtNegritaClick
          end
          object TButtCursiva: TToolButton
            Left = 313
            Top = 0
            Caption = 'Cursiva'
            ImageIndex = 9
            Style = tbsCheck
            OnClick = TButtCursivaClick
          end
          object TButtSubrayado: TToolButton
            Left = 336
            Top = 0
            Caption = 'Subrayado'
            ImageIndex = 10
            Style = tbsCheck
            OnClick = TButtSubrayadoClick
          end
          object ToolButton1: TToolButton
            Left = 359
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtLeftAlign: TToolButton
            Left = 367
            Top = 0
            Caption = 'Alinear izquierda'
            Grouped = True
            ImageIndex = 11
            Style = tbsCheck
            OnClick = TButtLeftAlignClick
          end
          object TButtCenterAlign: TToolButton
            Tag = 2
            Left = 390
            Top = 0
            Caption = 'Centrar'
            Grouped = True
            ImageIndex = 12
            Style = tbsCheck
            OnClick = TButtCenterAlignClick
          end
          object TButtRightAlign: TToolButton
            Tag = 1
            Left = 413
            Top = 0
            Caption = 'Alinear derecha'
            Grouped = True
            ImageIndex = 13
            Style = tbsCheck
            OnClick = TButtRightAlignClick
          end
          object TButtColor: TToolButton
            Left = 436
            Top = 0
            ImageIndex = 15
            OnClick = TButtColorClick
          end
        end
        object PNNotas: TLFPanel
          Left = 0
          Top = 43
          Width = 948
          Height = 428
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object DBMNotas: TDBRichEdit
            Left = 0
            Top = 0
            Width = 948
            Height = 428
            Align = alClient
            DataField = 'OBSERVACIONES'
            DataSource = ProDMOrden.DSQMProOrd
            TabOrder = 0
            OnSelectionChange = SelectionChange
          end
        end
      end
      object TSNav: TTabSheet [4]
        Caption = '&Relaci'#243'n Ordenes/SubOrdenes'
        OnShow = TSNavShow
        object PNLRelacionLeft: TLFPanel
          Left = 0
          Top = 0
          Width = 337
          Height = 471
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object LRelacionOrdenes: TLFLabel
            Left = 0
            Top = 0
            Width = 53
            Height = 13
            Align = alTop
            Caption = 'ORDENES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LRelacionSubordenes: TLFLabel
            Left = 0
            Top = 133
            Width = 75
            Height = 13
            Align = alTop
            Caption = 'SUBORDENES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBGRelacionOrdenes: THYTDBGrid
            Left = 0
            Top = 13
            Width = 337
            Height = 120
            Align = alTop
            Color = clInfoBk
            DataSource = ProDMOrden.DSQMProOrd
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGRelacionOrdenesCellClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_ORDEN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RIG_OF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPUESTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_ORD'
                Width = 65
                Visible = True
              end>
          end
          object DBGRelacionSubordenes: THYTDBGrid
            Left = 0
            Top = 146
            Width = 337
            Height = 325
            Align = alClient
            Color = clInfoBk
            DataSource = ProDMOrden.DSQSubOrdenes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGRelacionSubordenesCellClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'SUBORDEN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RIG_OF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPUESTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESCANDALLO'
                Visible = True
              end>
          end
        end
        object PNLRelacionRight: TLFPanel
          Left = 337
          Top = 0
          Width = 611
          Height = 471
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Orden: TLFLabel
            Left = 0
            Top = 0
            Width = 611
            Height = 16
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Desarrollo de la orden n'#186' '
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LRelacionFases: TLFLabel
            Left = 0
            Top = 16
            Width = 34
            Height = 13
            Align = alTop
            Caption = 'FASES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LRelacionMateriales: TLFLabel
            Left = 0
            Top = 149
            Width = 68
            Height = 13
            Align = alTop
            Caption = 'MATERIALES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LRelacionTareas: TLFLabel
            Left = 0
            Top = 280
            Width = 43
            Height = 13
            Align = alTop
            Caption = 'TAREAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBGRelacionFases: THYTDBGrid
            Left = 0
            Top = 29
            Width = 611
            Height = 120
            Align = alTop
            Color = clInfoBk
            DataSource = ProDMOrden.DSxInfoFase
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
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
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'LINEA_FASE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPOFASE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FASE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN'
                Visible = True
              end>
          end
          object DBGRelacionMateriales: THYTDBGrid
            Left = 0
            Top = 162
            Width = 611
            Height = 118
            Align = alTop
            Color = clInfoBk
            DataSource = ProDMOrden.DSxInfoMat
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
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
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'LINEA_MAT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPONENTE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_STOCK'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_FAB'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_NEC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_UTIL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_PREV'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PORCENTAJE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA_FASE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRE_COS_UNI'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_VAR'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_FIJO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DescrAlmacen'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PrecioMat'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DescArt'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRODUCCION'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MATESC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENTRADA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_ORDEN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_ORDEN_MAT'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_MOV_STOCK'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRE_COS_UNI_REAL'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_FIJO_REAL'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_VAR_REAL'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_REAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTAS_MAT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MEDIDAS'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_PIEZA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_PIEZAS'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDAD_ART'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDAD_FAB'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_MOV_STOCK_B'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_MOV_STOCK_C'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_EQUIVAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPRAR'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROVEEDOR_COMPRA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOV_STOCK_COMPRA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_A'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UDS_COMPRA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RESERVA_STOCK'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DescripProveedor'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RESULTADO_FORMULA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FORMULA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DES_ALTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DES_ANCHO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DES_GRUESO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_MOV_STOCK'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MINI_NOTA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESACTIVA_TRIGGER'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESTADO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA_TAREA'
                Visible = True
              end>
          end
          object DBGRelacionTareas: THYTDBGrid
            Left = 0
            Top = 293
            Width = 611
            Height = 178
            Align = alClient
            Color = clInfoBk
            DataSource = ProDMOrden.DSxInfoTar
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 2
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
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'LINEA_TAREA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPOTAREA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DescrTarea'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RECURSO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DescrRecurso'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANTIDAD'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRE_COS_UNI_REAL'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_VAR_REAL'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_FIJO_REAL'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_REAL'
                Visible = True
              end>
          end
        end
      end
      object TSGrafico: TTabSheet [5]
        Caption = '&Gr'#225'fico'
        OnShow = TSGraficoShow
        object TBGrafico: TLFToolBar
          Left = 0
          Top = 0
          Width = 948
          Height = 24
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
        end
        object PNLGrafico: TLFPanel
          Left = 0
          Top = 24
          Width = 948
          Height = 447
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBChartRecursos: TDBChart
            Left = 0
            Top = 0
            Width = 948
            Height = 447
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            LeftWall.Color = clWhite
            MarginLeft = 20
            Title.Text.Strings = (
              'Gr'#225'fica de Tiempos y Recursos')
            BottomAxis.Title.Caption = 'Horas / Porcentaje'
            LeftAxis.Axis.Visible = False
            LeftAxis.LabelsMultiLine = True
            LeftAxis.Title.Caption = 'Fases'
            Legend.Alignment = laBottom
            Legend.Color = clBtnFace
            Legend.Frame.Visible = False
            Legend.ShadowColor = clWhite
            Legend.ShadowSize = 0
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 14
            TabOrder = 0
            object Series1: TBarSeries
              Marks.ArrowLength = 20
              Marks.Frame.Visible = False
              Marks.Style = smsXValue
              Marks.Transparent = True
              Marks.Visible = True
              DataSource = ProDMOrden.xGrafRecursosFases
              SeriesColor = 15204352
              Title = 'Horas'
              XLabelsSource = 'FASE'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loNone
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'HORAS_FASE'
            end
            object Series2: TBarSeries
              Marks.ArrowLength = 20
              Marks.Style = smsPercent
              Marks.Transparent = True
              Marks.Visible = True
              DataSource = ProDMOrden.xGrafRecursosFases
              SeriesColor = clRed
              Title = 'Porcentajes'
              XLabelsSource = 'FASE'
              Dark3D = False
              SideMargins = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loNone
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'PORCENTAJE_FASE'
            end
          end
          object ButtZoomMas: TFlatButton
            Left = 2
            Top = 5
            Width = 50
            Height = 50
            Hint = 'Acercar el gr'#225'fico'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabStop = True
            TabOrder = 1
            OnClick = ButtZoomMasClick
          end
          object ButtZoomMenos: TFlatButton
            Left = 2
            Top = 59
            Width = 50
            Height = 50
            Hint = 'Alejar el gr'#225'fico'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabStop = True
            TabOrder = 2
            OnClick = ButtZoomMenosClick
          end
          object ButtCopiarPortapapeles: TFlatButton
            Left = 2
            Top = 113
            Width = 50
            Height = 50
            Hint = 'Copiar al portapapeles'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabStop = True
            TabOrder = 3
            OnClick = ButtCopiarPortapapelesClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 948
          Height = 471
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          CamposAMarcar.Strings = (
            'CERRAR_SUBORDENES'
            'COMPUESTOS_VIRTUALES'
            'ESTADO_FIRMA_ISO_APROBADO'
            'ESTADO_FIRMA_ISO_VALIDADO'
            'ESTADO_FIRMA_ISO_VERIFICADO'
            'ESTADO_RESERVA'
            'IMPORTAR_OP'
            'ISO_APROBADO'
            'ISO_VALIDADO'
            'ISO_VERIFICADO'
            'LOTEABLE'
            'PREVALECE_ALM_ORDEN'
            'RETENIDO_COMERCIAL'
            'SEGUIR_SIN_STOCK'
            'SELECCIONADA'
            'SERIALIZADO'
            'SIN_HERRAJE'
            'SIN_LONA'
            'SIN_MOTOR'
            'SIN_ROTULACION'
            'URGENTE'
            'VISTOBUENO1'
            'VISTOBUENO2'
            'VISTOBUENO3')
          CamposChecked.Strings = (
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
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
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
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ALMACEN_ENT'
            'ALMACEN_LAN'
            'ALMACEN_SAL'
            'CANT_RESERVAR'
            'CLIENTE'
            'COMPUESTO'
            'CONT_SUBORDEN'
            'DESC_LOTE'
            'ESCANDALLO'
            'ESTADO'
            'FECHA_ENTREGA'
            'FECHA_FIN'
            'FECHA_INI'
            'FECHA_ORD'
            'FECHA_PED'
            'ID_LOTE'
            'ID_ORDEN'
            'ISO_APROBADO'
            'ISO_VALIDADO'
            'ISO_VERIFICADO'
            'MEDIDA_1'
            'MEDIDA_2'
            'MEDIDA_3'
            'MEDIDA_4'
            'PADRE_SUBORDEN'
            'PEDIDO'
            'PLANIFICACION'
            'REFERENCIA'
            'RESERVA'
            'RESPONSABLE'
            'RETENIDO_COMERCIAL'
            'RIG_OF'
            'SIN_LONA'
            'SIN_MOTOR'
            'SIN_ROTULACION'
            'SITUACION'
            'SUBORDEN'
            'TITULO'
            'UNI_PENDIENTES'
            'URGENTE'
            'VERSION_ORDEN'
            'VISTOBUENO1'
            'VISTOBUENO2'
            'VISTOBUENO3')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_OF'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBORDEN'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ORD'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 326
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CLIENTE'
              Width = 188
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESCANDALLO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPUESTO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA_PED'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PED'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_PEDID'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_MANUAL'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_TOTAL'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIORIDAD'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MERMA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_PRODUC'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_PENDIENTES'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INI'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_SAL'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_LAN'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_ENT'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_LOTE'
              Width = 167
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESERVA'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANT_RESERVAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_RESERVA'
              Visible = True
            end>
        end
      end
    end
    object PNLInfoGeneral: TLFPanel
      Left = 2
      Top = 24
      Width = 956
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        956
        22)
      object LIDOrdenCabecera: TLFLabel
        Left = 12
        Top = 5
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IDOrden'
      end
      object LOrdenCabecera: TLFLabel
        Left = 133
        Top = 5
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Orden'
        FocusControl = DBEOrdenCabecera
      end
      object LEstadoCabecera: TLFLabel
        Left = 234
        Top = 5
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object DBEIdOrdenCabecera: TLFDbedit
        Left = 56
        Top = 1
        Width = 63
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'ID_ORDEN'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEOrdenCabecera: TLFDbedit
        Left = 166
        Top = 1
        Width = 63
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'RIG_OF'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEEstadoCabecera: TLFDbedit
        Left = 271
        Top = 1
        Width = 200
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO_SITUACION'
        DataSource = ProDMOrden.DSQMProOrd
        ReadOnly = True
        TabOrder = 2
        OnChange = DBEEstadoCabeceraChange
      end
      object DBEComponenteCabecera: TLFDBEditFind2000
        Left = 478
        Top = 1
        Width = 94
        Height = 21
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        TabOrder = 3
        OnDblClick = SBACompuestoDblClick
        Accion = ANewArticulo
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'VER_PRO_COMPUESTOS_ESC_EF'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'COMPUESTO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'estado=1'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        OrdenadoPor.Strings = (
          'COMPUESTO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEDescripcionComponenteCabecera: TLFDbedit
        Left = 573
        Top = 1
        Width = 378
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnDblClick = SBACompuestoDblClick
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 960
  end
  inherited CEMain: TControlEdit
    Left = 472
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 502
    Top = 8
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
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
    Left = 440
    Top = 8
    object LFCategoryAction7: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object AProLstOrden: TAction
      Category = 'Listados'
      Caption = 'Listado de Orden'
      ImageIndex = 14
      OnExecute = AProLstOrdenExecute
    end
    object AHojaDeTrabajo: TAction
      Category = 'Otros'
      Caption = 'Hojas de trabajo'
      ImageIndex = 105
      OnExecute = AHojaDeTrabajoExecute
    end
    object AFiltrarSituacionTodo: TAction
      Tag = -1
      Category = 'Filtros;Situacion'
      Caption = 'Quitar filtro'
      ImageIndex = 5
      OnExecute = AFiltrarSituacionExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ALstEtiOrden: TAction
      Category = 'Listados'
      Caption = 'Listado de Etiquetas'
      ImageIndex = 95
      OnExecute = ALstEtiOrdenExecute
    end
    object ALstOrdenDet: TAction
      Category = 'Listados'
      Caption = 'Listado de Ordenes'
      ImageIndex = 14
      OnExecute = ALstOrdenDetExecute
    end
    object ASerializarComp: TAction
      Category = 'Procesos'
      Caption = 'Serializar Compuesto'
      ImageIndex = 115
      OnExecute = ASerializarCompExecute
    end
    object AHistNSeries: TAction
      Category = 'Procesos'
      Caption = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      Hint = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      ImageIndex = 115
      OnExecute = AHistNSeriesExecute
    end
    object ALotesCompuesto: TAction
      Category = 'Procesos'
      Caption = 'Crear Lote'
      ImageIndex = 120
      OnExecute = ALotesCompuestoExecute
    end
    object AVisualizarCostes: TAction
      Category = 'Procesos'
      Caption = 'Visualizar costes totales de la Orden'
      ImageIndex = 56
      OnExecute = AVisualizarCostesExecute
    end
    object ASituacionSiguiente: TAction
      Category = 'Procesos'
      Caption = 'Lanzar '
      Hint = 'Lanza la orden'
      ImageIndex = 25
      OnExecute = ASituacionSiguienteExecute
    end
    object ALanzarMasSubordenes: TAction
      Category = 'Procesos'
      Caption = 'Lanzar Orden y Subordenes'
      Hint = 'Lanzar Orden y Subordenes'
      ImageIndex = 25
      OnExecute = ALanzarMasSubordenesExecute
    end
    object ALanzarMasReservar: TAction
      Category = 'Procesos'
      Caption = 'Lanzar, etc..'
      Hint = 'Lanza la orden y la reserva'
      ImageIndex = 25
      Visible = False
      OnExecute = ALanzarMasReservarExecute
    end
    object AReservarNuevamente: TAction
      Category = 'Procesos'
      Caption = 'Reservar Nuevamente'
      Hint = 'Reservar'
      ImageIndex = 26
      OnExecute = AReservarNuevamenteExecute
    end
    object ASituacionAnterior: TAction
      Category = 'Procesos'
      Caption = 'Deslanzar, etc.'
      ImageIndex = 51
      OnExecute = ASituacionAnteriorExecute
    end
    object AProLstNecesidades: TAction
      Category = 'Listados'
      Caption = 'Listado de Necesidades'
      Hint = 'Listado de Necesidades'
      ImageIndex = 14
      OnExecute = AProLstNecesidadesExecute
    end
    object AProLstNecesidadesEsc: TAction
      Category = 'Listados'
      Caption = 'Listado de Necesidades desde Escandallo'
      Hint = 'Listado de Necesidades desde Escandallo'
      ImageIndex = 14
      OnExecute = AProLstNecesidadesEscExecute
    end
    object AProLstHojaMontaje: TAction
      Category = 'Listados'
      Caption = 'Listado de Hoja de Montaje'
      ImageIndex = 14
      OnExecute = AProLstHojaMontajeExecute
    end
    object AProLstHojaTrabajo: TAction
      Category = 'Listados'
      Caption = 'Listado de Hoja de Trabajo'
      ImageIndex = 14
      OnExecute = AProLstHojaTrabajoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos;Firmas'
      Caption = 'Firmas ISO'
      ImageIndex = 19
    end
    object AIsoAprobado: TAction
      Category = 'Procesos;Firmas'
      Caption = 'Firma Aprobado'
      ImageIndex = 7
      OnExecute = AIsoAprobadoExecute
    end
    object AIsoVerificado: TAction
      Category = 'Procesos;Firmas'
      Caption = 'Firma Verificado'
      ImageIndex = 118
      OnExecute = AIsoVerificadoExecute
    end
    object AIsoValidado: TAction
      Category = 'Procesos;Firmas'
      Caption = 'Firma Validado'
      ImageIndex = 19
      OnExecute = AIsoValidadoExecute
    end
    object AUbicacionComp: TAction
      Category = 'Procesos'
      Caption = 'Ubicaci'#243'n compuesto'
      Hint = 'Ubicacion del compuesto'
      ImageIndex = 81
      OnExecute = AUbicacionCompExecute
    end
    object ALstOrdenCodBar: TAction
      Category = 'Listados'
      Caption = 'Listado C'#243'digo Barras'
      ImageIndex = 38
      OnExecute = ALstOrdenCodBarExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Z_Especiales'
      Caption = 'Especiales'
      ImageIndex = 58
    end
    object AMovStocks: TAction
      Category = 'Z_Especiales'
      Caption = 'Mov. Stocks OP'
      ImageIndex = 128
      OnExecute = AMovStocksExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Procesos;Recalculo'
      Caption = 'Rec'#225'lculos'
      ImageIndex = 3
    end
    object ARecalculoTodos: TAction
      Category = 'Procesos;Recalculo;Marcajes'
      Caption = 'Rec'#225'culo todas OF'
      ImageIndex = 3
      OnExecute = ARecalculoTodosExecute
    end
    object AProRecalculoID: TAction
      Category = 'Procesos;Recalculo;Marcajes'
      Caption = 'Rec'#225'lculo OF Actual'
      ImageIndex = 3
      OnExecute = AProRecalculoIDExecute
    end
    object ARecuperarPrecioV: TAction
      Category = 'Procesos'
      Caption = 'Recuperar Precio Venta'
      ImageIndex = 26
      OnExecute = ARecuperarPrecioVExecute
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Procesos;Recalculo;Marcajes'
      Caption = 'Marcajes'
      ImageIndex = 3
    end
    object ARecalculoCostes: TAction
      Category = 'Procesos;Recalculo'
      Caption = 'Rec'#225'lculo costes'
      ImageIndex = 3
      OnExecute = ARecalculoCostesExecute
    end
    object ARecuperarMarcajes: TAction
      Category = 'Procesos'
      Caption = 'Recuperar Marcajes'
      Enabled = False
      ImageIndex = 26
      OnExecute = ARecuperarMarcajesExecute
    end
    object AFichaTecnica: TAction
      Category = 'Procesos'
      Caption = 'Crear Certificado de An'#225'lisis'
      ImageIndex = 32
      OnExecute = AFichaTecnicaExecute
    end
    object AInfoCierre: TAction
      Category = 'Z_Especiales'
      Caption = 'Informaci'#243'n Cierre'
      ImageIndex = 1
      OnExecute = AInfoCierreExecute
    end
    object AInfoCierresParciales: TAction
      Category = 'Z_Especiales'
      Caption = 'Informaci'#243'n Cierres Parciales'
      ImageIndex = 3
      OnExecute = AInfoCierresParcialesExecute
    end
    object ACierreParcialOrden: TAction
      Category = 'Procesos'
      Caption = 'Cierre Parcial'
      Hint = 'Cierre Parcial'
      ImageIndex = 68
      OnExecute = ACierreParcialOrdenExecute
    end
    object APropagaAlmacenLanzamientoAMateriales: TAction
      Category = 'Procesos'
      Caption = 'Propaga Alm. Lanzamiento a Materiales'
      Hint = 'Propaga alm. lanzamiento a materiales de TODAS las fases'
      ImageIndex = 86
      OnExecute = APropagaAlmacenLanzamientoAMaterialesExecute
    end
    object AFiltrarSituacionSoloActivas: TAction
      Tag = 5
      Category = 'Filtros;Situacion'
      Caption = 'Solo Activas'
      Hint = 'Muestra las ordenes que no estan cerradas totalmente'
      ImageIndex = 5
      OnExecute = AFiltrarSituacionExecute
    end
    object AFiltrarSituacionNoLanzada: TAction
      Category = 'Filtros;Situacion'
      Caption = 'No Lanzada'
      ImageIndex = 5
      OnExecute = AFiltrarSituacionExecute
    end
    object AFiltrarSituacionLanzada: TAction
      Tag = 1
      Category = 'Filtros;Situacion'
      Caption = 'Lanzada'
      ImageIndex = 5
      OnExecute = AFiltrarSituacionExecute
    end
    object AFiltrarSituacionReservada: TAction
      Tag = 2
      Category = 'Filtros;Situacion'
      Caption = 'Reservada'
      ImageIndex = 5
      OnExecute = AFiltrarSituacionExecute
    end
    object AFiltrarSituacionCerradaParcialmente: TAction
      Tag = 3
      Category = 'Filtros;Situacion'
      Caption = 'Cerrada Parcialmente'
      ImageIndex = 5
      OnExecute = AFiltrarSituacionExecute
    end
    object AFiltrarSituacionCerradaTotalmente: TAction
      Tag = 4
      Category = 'Filtros;Situacion'
      Caption = 'Cerrada Totalmente'
      ImageIndex = 5
      OnExecute = AFiltrarSituacionExecute
    end
    object LFCategoryAction8: TLFCategoryAction
      Category = 'Filtros;Situacion'
      Caption = 'Situaci'#243'n'
      ImageIndex = 5
    end
    object LFCategoryAction9: TLFCategoryAction
      Category = 'Filtros;AlmacenLanzamiento'
      Caption = 'Almac'#233'n Lanzamiento'
      ImageIndex = 5
    end
    object AEnviarATrabajoExterno: TAction
      Category = 'Procesos'
      Caption = 'Enviar a Trabajo Externo'
      Hint = 'Enviar a Trabajo Externo'
      ImageIndex = 25
      OnExecute = AEnviarATrabajoExternoExecute
    end
    object ARecibirTrabajoExterno: TAction
      Category = 'Procesos'
      Caption = 'Recibir Trabajo Externo'
      Hint = 'Recibir Trabajo Externo'
      ImageIndex = 51
      OnExecute = ARecibirTrabajoExternoExecute
    end
    object ACreaMovimientoComponente: TAction
      Category = 'Procesos'
      Caption = 'Crear Movimiento de Componente'
      ImageIndex = 25
      OnExecute = ACreaMovimientoComponenteExecute
    end
    object AInfoReserva: TAction
      Category = 'Z_Especiales'
      Caption = 'Informaci'#243'n Reserva'
      Hint = 'Informaci'#243'n Reserva'
      ImageIndex = 7
      OnExecute = AInfoReservaExecute
    end
    object AInfoMarcajes: TAction
      Category = 'Z_Especiales'
      Caption = 'Informaci'#243'n de Marcajes'
      ImageIndex = 105
      OnExecute = AInfoMarcajesExecute
    end
    object ADesvinculaSubordenes: TAction
      Category = 'Z_Especiales'
      Caption = 'Desvincula Subordenes'
      Hint = 
        'Desvincula Subordenes de esta orden y las marca para que no lanc' +
        'en subordenes.'
      ImageIndex = 27
      OnExecute = ADesvinculaSubordenesExecute
    end
    object ACierraSubordenes: TAction
      Category = 'Procesos'
      Caption = 'Cierra Subordenes'
      Hint = 'Cierra todas las subordenes de esta orden'
      ImageIndex = 15
      OnExecute = ACierraSubordenesExecute
    end
    object AGeneraPropuestaPedido: TAction
      Category = 'Procesos'
      Caption = 'Generar Propuesta Pedido'
      Hint = 'Generar propuesta de pedido a proveedor'
      ImageIndex = 73
      OnExecute = AGeneraPropuestaPedidoExecute
    end
    object LFCategoryAction10: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object LFCategoryAction11: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosOrden: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos Orden'
      ImageIndex = 59
      OnExecute = AAdjuntosOrdenExecute
    end
    object AListarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Listar Etiquetas de Materiales'
      Hint = 'Lista Etiquetas de los articulos del documento'
      ImageIndex = 95
      OnExecute = AListarEtiquetasExecute
    end
    object AExportarDatosOrdenes: TAction
      Category = 'Otros'
      Caption = 'Exportar datos de Coste de Ordenes'
      Hint = 'Exportar datos de Coste de Ordenes'
      ImageIndex = 99
      OnExecute = AExportarDatosOrdenesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 478
    Top = 42
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 588
    Top = 40
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 620
    Top = 40
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEFases: TControlEdit
    FichaEdicion = TSFases
    FichaExclusiva = TSFases
    Complementario = TBMateriales
    PopUpMenu = CEFasesPMEdit
    Teclas = DMMain.Teclas
    Left = 540
    Top = 8
  end
  object CEFasesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 572
    Top = 8
    object CEFasesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEFasesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFasesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFasesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEFasesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEFasesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEFasesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFasesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFasesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFasesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENotasFases: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotasFases
    FichaExclusiva = TSNotasFases
    PanelEdicion = PNNotasFases
    Complementario = TBMain
    PopUpMenu = CENotasFasesPMEdit
    Teclas = DMMain.Teclas
    Left = 612
    Top = 8
  end
  object CENotasFasesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 644
    Top = 8
    object CENotasFasesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasFasesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasFasesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasFasesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasFasesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasFasesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasFasesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasFasesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasFasesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasFasesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEMateriales: TControlEdit
    FichaEdicion = TSMateriales
    FichaExclusiva = TSMateriales
    PopUpMenu = CEMaterialesPMEdit
    Teclas = DMMain.Teclas
    Left = 684
    Top = 8
  end
  object CEMaterialesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 716
    Top = 8
    object CEMaterialesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMaterialesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMaterialesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMaterialesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMaterialesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMaterialesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMaterialesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMaterialesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMaterialesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMaterialesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CETareas: TControlEdit
    FichaEdicion = TSTareas
    FichaExclusiva = TSTareas
    PopUpMenu = CETareasPMEdit
    Teclas = DMMain.Teclas
    Left = 660
    Top = 40
  end
  object CETareasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 692
    Top = 40
    object CETareasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CETareasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CETareasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CETareasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CETareasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CETareasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CETareasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETareasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETareasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETareasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALOrden: TActionList
    Images = DMMain.ILMain_Ac
    Left = 443
    Top = 39
    object AACompuesto: TAction
      Caption = 'Ficha de Articulo'
      Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
      ShortCut = 49219
      OnExecute = AACompuestoExecute
    end
    object ANewArticulo: TAction
      Caption = 'Crear Articulo'
      Hint = 'Crear Articulo'
      OnExecute = ANewArticuloExecute
    end
    object AACliente: TAction
      Caption = 'Ficha de Cliente'
      Hint = 'Ficha de Cliente'
      ShortCut = 49221
      OnExecute = AAClienteExecute
    end
    object AAEscandallo: TAction
      Caption = 'Ficha de Escandallo'
      Hint = 'Informacion de Escandallo'
      ShortCut = 49235
      OnExecute = AAEscandalloExecute
    end
    object ANewCliente: TAction
      Caption = 'Nuevo Cliente'
      Hint = 'Nuevo Cliente'
      OnExecute = ANewClienteExecute
    end
    object ASerializacion: TAction
      Caption = 'Serializaci'#243'n'
      Hint = 'Serializaci'#243'n de componentes'
      ImageIndex = 115
      OnExecute = ASerializacionExecute
    end
    object ANotasMateriales: TAction
      Caption = 'Editar Notas Materiales (Ctrl+M)'
      Hint = 'Editar Notas Materiales (Ctrl+M)'
      ImageIndex = 18
      ShortCut = 16461
      OnExecute = ANotasMaterialesExecute
    end
    object ANotasTareas: TAction
      Caption = 'Editar Notas Tareas (Ctrl+T)'
      Hint = 'Editar Notas Tareas (Ctrl+T)'
      ImageIndex = 18
      ShortCut = 16468
      OnExecute = ANotasTareasExecute
    end
    object AInfoStocks: TAction
      Caption = 'Informaci'#243'n de Stocks'
      Hint = 'Informaci'#243'n de Stocks'
      ImageIndex = 1
      OnExecute = AInfoStocksExecute
    end
    object AEquivalenciaLinea: TAction
      Caption = 'Equivalencia de la Linea'
      Hint = 'Equivalencia de la Linea'
      ImageIndex = 42
      OnExecute = AEquivalenciaLineaExecute
    end
    object AUbicacion: TAction
      Caption = 'Ubicacion'
      Hint = 'Ubicaci'#243'n de componentes'
      ImageIndex = 81
      OnExecute = AUbicacionExecute
    end
    object AOrigenCompra: TAction
      Caption = 'Ver Origen de la Compra'
      Hint = 'Ver Origen de la Compra'
      ImageIndex = 97
      OnExecute = AOrigenCompraExecute
    end
    object ADocumentos: TAction
      Caption = 'Documentos de orden producci'#243'n'
      Hint = 'Documentos de orden producci'#243'n'
      ImageIndex = 87
      OnExecute = ADocumentosExecute
    end
    object APedido: TAction
      Caption = 'Pedido'
      Hint = 'Ir a Pedido'
      OnExecute = APedidoExecute
    end
    object AIncMatDet: TAction
      Caption = 'Incidencia Material'
      Hint = 'Incidencia Material'
      ImageIndex = 6
      OnExecute = AIncMatDetExecute
    end
    object ALote: TAction
      Caption = 'Lote'
      Hint = 'Informacion de Lote'
    end
    object AFiltraOrdenesYSubordenes: TAction
      Caption = 'Filtra Ordenes + Subordenes'
      Hint = 'Filtra Ordenes + Subordenes'
      ImageIndex = 19
      OnExecute = AFiltraOrdenesYSubordenesExecute
    end
    object AProyecto: TAction
      Caption = 'Proyecto'
      Hint = 'Ir a Proyecto'
      OnExecute = AProyectoExecute
    end
    object AAEscandallo2: TAction
      Caption = 'Ficha de Escandallo'
      Hint = 'Informacion de Escandallo'
      OnExecute = AAEscandallo2Execute
    end
    object AEscandalloMaterial: TAction
      Caption = 'Ficha de Escandallo Material'
      Hint = 'Ficha de Escandallo Material'
      ImageIndex = 10
      OnExecute = AEscandalloMaterialExecute
    end
  end
  object CEImagenesFases: TControlEdit
    EnlazadoA = CEFases
    FichaEdicion = TSDibujoFases
    FichaExclusiva = TSDibujoFases
    Complementario = TBFases
    PopUpMenu = CEImagenesFasesPMEdit
    Teclas = DMMain.Teclas
    Left = 732
    Top = 40
  end
  object CEImagenesFasesPMEdit: TPopUpTeclas
    Left = 764
    Top = 40
    object CEImagenesFasesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEImagenesFasesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEImagenesFasesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEImagenesFasesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEImagenesFasesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEImagenesFasesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEImagenesFasesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenesFasesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenesFasesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenesFasesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECostes: TControlEdit
    FichaEdicion = TSCostes
    FichaExclusiva = TSCostes
    PanelEdicion = PCostes
    Complementario = TBMain
    PopUpMenu = CECostesPMEdit
    Teclas = DMMain.Teclas
    Left = 518
    Top = 40
  end
  object CECostesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 554
    Top = 40
    object CECostesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CECostesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CECostesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CECostesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CECostesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CECostesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CECostesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECostesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECostesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECostesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object PMInformeOrden: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 696
    Top = 72
    object MIInformePrevisto: TMenuItem
      Tag = 1
      Caption = 'Previsto'
      ImageIndex = 14
      OnClick = TButtInformeClick
    end
    object MIInformeReal: TMenuItem
      Tag = 2
      Caption = 'Real'
      ImageIndex = 14
      OnClick = TButtInformeClick
    end
    object MIInformeMontaje: TMenuItem
      Tag = 3
      Caption = 'Montaje'
      ImageIndex = 14
      OnClick = TButtInformeClick
    end
  end
end
