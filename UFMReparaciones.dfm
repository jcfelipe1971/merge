inherited FMReparaciones: TFMReparaciones
  Left = 371
  Top = 204
  Width = 984
  Height = 596
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Reparaciones'
  Constraints.MinHeight = 550
  Constraints.MinWidth = 984
  PopupMenu = CETareaPMEdit
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 974
    Height = 409
    inherited TBMain: TLFToolBar
      Width = 970
      inherited NavMain: THYMNavigator
        DataSource = DMReparaciones.DSCabReparar
        Hints.Strings = ()
        EditaControl = DBEFCliente
        InsertaControl = DBEFCliente
        InsertaUltimo = True
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 80
        VisibleButtons = [neBuscar, neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 308
      end
      inherited TbuttComp: TToolButton
        Left = 316
      end
      object ToolButton3: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBDocumentos: TToolButton
        Left = 347
        Top = 0
        Hint = 'Documentos'
        Caption = 'TBDocumentos'
        ImageIndex = 87
        OnClick = TBDocumentosClick
      end
      object PNLTitSerie: TLFPanel
        Left = 370
        Top = 0
        Width = 207
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object LBLSerie: TLFLabel
          Left = 12
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object ETitSerie: TLFEdit
          Left = 104
          Top = 0
          Width = 102
          Height = 21
          TabStop = False
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
          TabOrder = 1
        end
        object EFSerie: TLFEditFind2000
          Left = 39
          Top = 0
          Width = 64
          Height = 21
          TabStop = False
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
      object PNLFiltro: TLFPanel
        Left = 577
        Top = 0
        Width = 337
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LFiltro: TLFLabel
          Left = 8
          Top = 3
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Filtro'
          Layout = tlCenter
        end
        object LClienteFiltro: TLFLabel
          Left = 257
          Top = 3
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cli.'
        end
        object EFiltro: TLFEdit
          Left = 34
          Top = 0
          Width = 215
          Height = 21
          TabOrder = 0
          OnChange = EFiltroChange
        end
        object EFClienteFiltro: TLFEditFind2000
          Left = 272
          Top = 0
          Width = 62
          Height = 21
          TabOrder = 1
          OnChange = EFiltroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'NIF'
            'TELEFONOS')
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
      end
    end
    inherited PCMain: TLFPageControl
      Width = 970
      Height = 379
      inherited TSFicha: TTabSheet
        object SBACliente: TSpeedButton [0]
          Left = 372
          Top = 7
          Width = 23
          Height = 22
          GroupIndex = -1
          Caption = 'AACliente'
          OnDblClick = SBAClienteDblClick
        end
        object SBADocumentoRIG: TSpeedButton [1]
          Left = 728
          Top = 208
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBADocumentoRIGDblClick
        end
        object SBDocumentoTipo: TSpeedButton [2]
          Left = 728
          Top = 208
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBADocumentoRIGDblClick
        end
        object SBAEquipo: TSpeedButton [3]
          Left = 380
          Top = 15
          Width = 37
          Height = 22
          GroupIndex = -1
          Caption = 'AEquipo'
          OnDblClick = SBAEquipoDblClick
        end
        object SBAProyecto: TSpeedButton [4]
          Left = 388
          Top = 23
          Width = 23
          Height = 22
          GroupIndex = -1
          Caption = 'AACliente'
          OnDblClick = SBAProyectoDblClick
        end
        object SBAReparar: TSpeedButton [5]
          Left = 396
          Top = 31
          Width = 23
          Height = 22
          GroupIndex = -1
          Caption = 'AACliente'
          OnDblClick = SBARepararDblClick
        end
        inherited PEdit: TLFPanel
          Width = 962
          Height = 351
          inherited G2KTableLoc: TG2KTBLoc
            Left = 480
            Top = -3
            DataSource = DMReparaciones.DSCabReparar
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_REPAR_CAB_REPARACIONES'
            CampoNum = 'IDCABREPARAR'
            CampoStr = 'NOMBRE_R_SOCIAL'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'IDCABREPARAR')
          end
          object LReparacion: TLFLabel
            Left = 1
            Top = 4
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Reparaci'#243'n'
          end
          object LCliente: TLFLabel
            Left = 24
            Top = 26
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LEquipo: TLFLabel
            Left = 23
            Top = 154
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Equipo'
          end
          object LMarca: TLFLabel
            Left = 26
            Top = 176
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Marca'
          end
          object LModelo: TLFLabel
            Left = 21
            Top = 198
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LNroSerie: TLFLabel
            Left = 9
            Top = 220
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Serie'
          end
          object LOrdenTrabajo: TLFLabel
            Left = 412
            Top = 176
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden Trab.'
          end
          object LTecnico: TLFLabel
            Left = 430
            Top = 198
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#233'cnico'
          end
          object LFechaAviso: TLFLabel
            Left = 611
            Top = 154
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Aviso'
          end
          object LFichaEntrada: TLFLabel
            Left = 600
            Top = 176
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Entrada'
          end
          object LFechaSalida: TLFLabel
            Left = 608
            Top = 220
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Salida'
          end
          object LCondicion: TLFLabel
            Left = 9
            Top = 241
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Condici'#243'n'
          end
          object LObservacionesCliente: TLFLabel
            Left = 20
            Top = 286
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observ.'
          end
          object LDatosEquipo: TLFLabel
            Left = 3
            Top = 134
            Width = 122
            Height = 13
            Caption = 'DATOS DEL EQUIPO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LTipoActuacion: TLFLabel
            Left = 397
            Top = 220
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Actuaci'#243'n'
          end
          object LCosteTotal: TLFLabel
            Left = 823
            Top = 309
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste Total'
          end
          object LKilometros: TLFLabel
            Left = 414
            Top = 241
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nota simple'
          end
          object LFechaPrevSalida: TLFLabel
            Left = 599
            Top = 198
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Prevista'
          end
          object LKmsEntrada: TLFLabel
            Left = 407
            Top = 154
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Kms. entrada'
          end
          object LContacto: TLFLabel
            Left = 452
            Top = 4
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LEmail: TLFLabel
            Left = 470
            Top = 92
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email'
          end
          object LTelefono: TLFLabel
            Left = 454
            Top = 114
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tel'#233'fono'
          end
          object LProyecto: TLFLabel
            Left = 13
            Top = 70
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object LTipoReparacion: TLFLabel
            Left = 246
            Top = 92
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LSituacion: TLFLabel
            Left = 11
            Top = 92
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Situacion'
          end
          object LDireccion: TLFLabel
            Left = 450
            Top = 26
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
          end
          object LLocalidad: TLFLabel
            Left = 449
            Top = 70
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Localidad'
          end
          object LHorario: TLFLabel
            Left = 18
            Top = 114
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LHorarioSep1: TLFLabel
            Left = 116
            Top = 114
            Width = 3
            Height = 13
            Caption = '-'
          end
          object LHorarioSep2: TLFLabel
            Left = 252
            Top = 114
            Width = 3
            Height = 13
            Caption = '-'
          end
          object LFirma: TLFLabel
            Left = 584
            Top = 286
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Firma'
          end
          object LIdReparacion: TLFLabel
            Left = 305
            Top = 4
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Reparaci'#243'n'
          end
          object LDireccionDocumento: TLFLabel
            Left = 14
            Top = 48
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dir. Doc.'
          end
          object LRecepcion: TLFLabel
            Left = 318
            Top = 114
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recepci'#243'n'
          end
          object LIDEOrigen: TLFLabel
            Left = 323
            Top = 70
            Width = 58
            Height = 13
            Caption = 'ID_E Origen'
          end
          object LFormaPago: TLFLabel
            Left = 399
            Top = 264
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma de Pago'
          end
          object GBDocumento: TGroupBox
            Left = 822
            Top = 196
            Width = 140
            Height = 107
            Caption = 'Documento'
            TabOrder = 50
            object LSerieDocumento: TLFLabel
              Left = 32
              Top = 40
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LDocumento: TLFLabel
              Left = 36
              Top = 83
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nro.'
            end
            object LTipoDocumento: TLFLabel
              Left = 35
              Top = 62
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo'
            end
            object LEjercicioDocument: TLFLabel
              Left = 16
              Top = 18
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
            end
            object DBEFSeries: TLFDBEditFind2000
              Left = 60
              Top = 36
              Width = 60
              Height = 21
              Color = clInfoBk
              DataField = 'SERIE_DOC'
              DataSource = DMReparaciones.DSCabReparar
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_SERIES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'SERIE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'SERIE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBERIG: TLFDbedit
              Left = 60
              Top = 80
              Width = 60
              Height = 21
              Color = clAqua
              DataField = 'RIG_DESTINO'
              DataSource = DMReparaciones.DSCabReparar
              TabOrder = 3
            end
            object DBETipo: TLFDbedit
              Left = 60
              Top = 58
              Width = 60
              Height = 21
              Color = clAqua
              DataField = 'TIPO_DESTINO'
              DataSource = DMReparaciones.DSCabReparar
              TabOrder = 2
            end
            object DBEFEmpresa: TLFDBEditFind2000
              Left = 60
              Top = 14
              Width = 60
              Height = 21
              Color = clInfoBk
              DataField = 'EJERCICIO_DESTINO'
              DataSource = DMReparaciones.DSCabReparar
              Enabled = False
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_EMPRESAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'EMPRESA'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'ABIERTA = 1'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'EMPRESA')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object DBEIdReparacion: TLFDbedit
            Left = 375
            Top = 0
            Width = 66
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'IDCABREPARAR'
            DataSource = DMReparaciones.DSCabReparar
            Enabled = False
            ReadOnly = True
            TabOrder = 2
            OnChange = DBEIdReparacionChange
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 60
            Top = 22
            Width = 57
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 3
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE_R_SOCIAL')
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEMarca: TLFDbedit
            Left = 60
            Top = 172
            Width = 328
            Height = 21
            DataField = 'MARCA'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 26
          end
          object DBEModelo: TLFDbedit
            Left = 60
            Top = 194
            Width = 328
            Height = 21
            DataField = 'MODELO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 27
          end
          object DBEOT: TLFDbedit
            Left = 474
            Top = 172
            Width = 121
            Height = 21
            DataField = 'OT'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 32
          end
          object DBETecnico: TLFDbedit
            Left = 474
            Top = 194
            Width = 121
            Height = 21
            DataField = 'TECNICO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 33
          end
          object DBDEFechaAviso: TLFDBDateEdit
            Left = 675
            Top = 150
            Width = 87
            Height = 21
            DataField = 'FECHA_AVISO'
            DataSource = DMReparaciones.DSCabReparar
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 35
          end
          object DBDEFechaEntrada: TLFDBDateEdit
            Left = 675
            Top = 172
            Width = 87
            Height = 21
            DataField = 'FECHA_ENTRADA'
            DataSource = DMReparaciones.DSCabReparar
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 37
          end
          object DBDEFechaSalida: TLFDBDateEdit
            Left = 675
            Top = 216
            Width = 87
            Height = 21
            DataField = 'FECHA_SALIDA'
            DataSource = DMReparaciones.DSCabReparar
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 41
          end
          object DBECondicion: TLFDbedit
            Left = 60
            Top = 238
            Width = 328
            Height = 21
            DataField = 'CONDICION'
            DataSource = DMReparaciones.DSCabReparar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
          end
          object LFDBObservClient: TLFDBMemo
            Left = 60
            Top = 283
            Width = 509
            Height = 66
            DataField = 'OBSERVACIONES_CLIENTE'
            DataSource = DMReparaciones.DSCabReparar
            ScrollBars = ssVertical
            TabOrder = 46
          end
          object DBCBActuacion: TDBComboBoxValue
            Left = 474
            Top = 216
            Width = 121
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_ACTUACION'
            DataSource = DMReparaciones.DSCabReparar
            ItemHeight = 13
            Items.Strings = (
              'Reparaci'#243'n'
              'Mantenimiento'
              'Instalaci'#243'n')
            Values.Strings = (
              '1'
              '2'
              '3')
            TabOrder = 34
          end
          object DBRBEstado: TDBRadioGroup
            Left = 822
            Top = 20
            Width = 140
            Height = 94
            Caption = 'Estado'
            DataField = 'ESTADO'
            DataSource = DMReparaciones.DSCabReparar
            Items.Strings = (
              'Aceptado'
              'Descartado'
              'Pendiente'
              'Facturable')
            TabOrder = 48
            Values.Strings = (
              '1'
              '2'
              '3'
              '4')
          end
          object DBRBCCoste: TDBRadioGroup
            Left = 822
            Top = 115
            Width = 140
            Height = 78
            Caption = 'Cargo Coste'
            DataField = 'CARGO_COSTE'
            DataSource = DMReparaciones.DSCabReparar
            Items.Strings = (
              'Garant'#237'a Venta'
              'Garant'#237'a Reparaci'#243'n'
              'Facturable')
            TabOrder = 49
            Values.Strings = (
              '1'
              '2'
              '3')
          end
          object DBEFNumeroSerie: TLFDBEditFind2000
            Left = 60
            Top = 216
            Width = 43
            Height = 21
            DataField = 'ID_NUM_SERIE'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 28
            OnChange = DBEFNumeroSerieChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS_SERIALIZACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NSERIE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFNumeroSerieBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFEquipo: TLFDBEditFind2000
            Left = 60
            Top = 150
            Width = 77
            Height = 21
            DataField = 'EQUIPO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 24
            OnChange = DBEFEquipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFEquipoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescNumSerie: TLFEdit
            Left = 104
            Top = 216
            Width = 284
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
            TabOrder = 29
          end
          object LFDBCosteTotal: TLFDbedit
            Left = 883
            Top = 305
            Width = 74
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TOTAL_COSTE'
            DataSource = DMReparaciones.DSQMTotales
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 51
          end
          object DBEEstado: TLFDbedit
            Left = 118
            Top = 0
            Width = 178
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMReparaciones.DSCabReparar
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnChange = DBEEstadoChange
          end
          object DBEDescCliente: TLFDbedit
            Left = 118
            Top = 22
            Width = 323
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'NOMBRE_COMERCIAL_CLIENTE'
            DataSource = DMReparaciones.DSCabReparar
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
          object EDescEquipo: TLFEdit
            Left = 138
            Top = 150
            Width = 250
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
            TabOrder = 25
          end
          object BCrearClienteRapido: TButton
            Left = 414
            Top = 23
            Width = 25
            Height = 19
            Caption = '+'
            TabOrder = 5
            TabStop = False
            OnClick = BCrearClienteRapidoClick
          end
          object DBEKilometros: TLFDbedit
            Left = 474
            Top = 238
            Width = 343
            Height = 21
            DataField = 'KILOMETROS'
            DataSource = DMReparaciones.DSCabReparar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 43
          end
          object DBDEFechaPrevSalida: TLFDBDateEdit
            Left = 675
            Top = 194
            Width = 87
            Height = 21
            DataField = 'FECHA_PREV_SALIDA'
            DataSource = DMReparaciones.DSCabReparar
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 39
          end
          object DBEKmsEntrada: TLFDbedit
            Left = 474
            Top = 150
            Width = 121
            Height = 21
            DataField = 'KILOMETROS_ENTRADA'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 31
          end
          object DBEContactoNombre: TLFDbedit
            Left = 500
            Top = 0
            Width = 316
            Height = 21
            DataField = 'CONTACTO_NOMBRE'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 17
          end
          object DBEContactoEmail: TLFDbedit
            Left = 500
            Top = 88
            Width = 316
            Height = 21
            DataField = 'CONTACTO_EMAIL'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 22
          end
          object DBETelefono: TLFDbedit
            Left = 500
            Top = 110
            Width = 157
            Height = 21
            DataField = 'CONTACTO_TELEFONO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 23
          end
          object EFProyecto: TLFDBEditFind2000
            Left = 60
            Top = 66
            Width = 57
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 8
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
              'proyecto')
            Filtros = [obEmpresa]
            Entorno = DMPedidos.EntornoDoc
          end
          object ETitProyecto: TLFEdit
            Left = 118
            Top = 66
            Width = 323
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
            TabOrder = 9
          end
          object DBCBTipoReparacion: TLFDBComboBoxValue
            Left = 271
            Top = 88
            Width = 170
            Height = 21
            DataField = 'TIPO'
            DataSource = DMReparaciones.DSCabReparar
            ItemHeight = 13
            TabOrder = 11
          end
          object DBEDireccion1: TLFDbedit
            Left = 500
            Top = 22
            Width = 316
            Height = 21
            DataField = 'CONTACTO_DIR_NOMBRE'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 18
          end
          object DBEDireccion2: TLFDbedit
            Left = 500
            Top = 44
            Width = 316
            Height = 21
            DataField = 'CONTACTO_DIR_NOMBRE_2'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 19
          end
          object DBEFContactoLocalidad: TLFDBEditFind2000
            Left = 500
            Top = 66
            Width = 61
            Height = 21
            DataField = 'CONTACTO_LOCALIDAD'
            DataSource = DMReparaciones.DSCabReparar
            ParentShowHint = False
            ShowHint = False
            TabOrder = 20
            OnChange = DBEFContactoLocalidadChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_LOCALIDADES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'provincia'
              'c_pais')
            CampoNum = 'CODPOSTAL'
            CampoStr = 'TITULO'
            CampoADevolver = 'LOCALIDAD'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ELocalidad: TLFEdit
            Left = 562
            Top = 66
            Width = 254
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
            TabOrder = 21
          end
          object DBCBSituacion: TLFDBComboBoxValue
            Left = 60
            Top = 88
            Width = 170
            Height = 21
            DataField = 'SITUACION'
            DataSource = DMReparaciones.DSCabReparar
            ItemHeight = 13
            TabOrder = 10
            OnChange = DBCBSituacionChange
          end
          object DTPHorario1Desde: TDBDateTimePicker
            Left = 60
            Top = 110
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 12
            DataField = 'HORARIO_1_DESDE'
            DataSource = DMReparaciones.DSCabReparar
          end
          object DTPHorario1Hasta: TDBDateTimePicker
            Left = 122
            Top = 110
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 13
            DataField = 'HORARIO_1_HASTA'
            DataSource = DMReparaciones.DSCabReparar
          end
          object DTPHorario2Desde: TDBDateTimePicker
            Left = 194
            Top = 110
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 14
            DataField = 'HORARIO_2_DESDE'
            DataSource = DMReparaciones.DSCabReparar
          end
          object DTPHorario2Hasta: TDBDateTimePicker
            Left = 258
            Top = 110
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 15
            DataField = 'HORARIO_2_HASTA'
            DataSource = DMReparaciones.DSCabReparar
          end
          object PNLFirma: TLFPanel
            Left = 616
            Top = 283
            Width = 201
            Height = 66
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 52
            DesignSize = (
              201
              66)
            object ImgFirma: TImage
              Left = 0
              Top = 0
              Width = 201
              Height = 66
              Align = alClient
              Center = True
              Proportional = True
              Stretch = True
            end
            object DBTFirmaNombre: TDBText
              Left = 0
              Top = 40
              Width = 201
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              Color = clBtnFace
              DataField = 'NOMBRE'
              DataSource = DMReparaciones.DSQMFirmas
              ParentColor = False
              Transparent = True
            end
            object DBTNIFFirma: TDBText
              Left = 0
              Top = 53
              Width = 201
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              DataField = 'NIF'
              DataSource = DMReparaciones.DSQMFirmas
              Transparent = True
            end
          end
          object DBEReparacion: TLFDbedit
            Left = 60
            Top = 0
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'REPARACION'
            DataSource = DMReparaciones.DSCabReparar
            ReadOnly = True
            TabOrder = 0
            OnChange = DBEIdReparacionChange
          end
          object BRellenarObservaciones: TButton
            Left = 521
            Top = 285
            Width = 46
            Height = 19
            Hint = 'Rellenar observaciones con texto segun tipo de actuaci'#243'n.'
            Caption = 'Rellenar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 47
            Visible = False
            OnClick = BRellenarObservacionesClick
          end
          object DBEFDireccionDocumento: TLFDBEditFind2000
            Left = 60
            Top = 44
            Width = 57
            Height = 21
            DataField = 'DIRECCION_DOCUMENTO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 6
            OnChange = DBEFDireccionDocumentoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'DIR_COMPLETA_N'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFDireccionDocumentoBusqueda
            OrdenadoPor.Strings = (
              'DIR_DEFECTO DESC, DIRECCION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDireccionDocumento: TLFEdit
            Left = 118
            Top = 44
            Width = 323
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
            TabOrder = 7
          end
          object DBERecepcion: TLFDbedit
            Left = 373
            Top = 110
            Width = 66
            Height = 21
            DataField = 'ID_REP_RECEPCION'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 16
          end
          object DBDEFechaEntradaHora: TDBDateTimePicker
            Left = 762
            Top = 172
            Width = 55
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 38
            DataField = 'FECHA_ENTRADA'
            DataSource = DMReparaciones.DSCabReparar
          end
          object DBDEFechaAvisoHora: TDBDateTimePicker
            Left = 762
            Top = 150
            Width = 55
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 36
            DataField = 'FECHA_AVISO'
            DataSource = DMReparaciones.DSCabReparar
          end
          object DBDEFechaPrevSalidaHora: TDBDateTimePicker
            Left = 762
            Top = 194
            Width = 55
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 40
            DataField = 'FECHA_PREV_SALIDA'
            DataSource = DMReparaciones.DSCabReparar
          end
          object DBDEFechaSalidaHora: TDBDateTimePicker
            Left = 762
            Top = 216
            Width = 55
            Height = 21
            CalAlignment = dtaLeft
            Date = 45745.3871174653
            Format = 'HH:mm'
            Time = 45745.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 42
            DataField = 'FECHA_SALIDA'
            DataSource = DMReparaciones.DSCabReparar
          end
          object DBEEstadoRepar: TLFDbedit
            Left = 822
            Top = 0
            Width = 19
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ESTADO_REPAR'
            DataSource = DMReparaciones.DSCabReparar
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 53
            OnChange = DBEEstadoReparChange
          end
          object DBETituloEstadoRepar: TLFEdit
            Left = 842
            Top = 0
            Width = 118
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
            TabOrder = 54
            OnChange = DBEEstadoReparChange
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 474
            Top = 260
            Width = 57
            Height = 21
            DataField = 'FORMA_PAGO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 44
            OnChange = DBEFFormaPagoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'FORMA_PAGO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloFormaPago: TLFEdit
            Left = 532
            Top = 260
            Width = 285
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
            TabOrder = 45
          end
        end
      end
      object TSEmpleado: TTabSheet [1]
        Caption = 'Mec'#225'nico'
        ImageIndex = 3
        object splmecanico: TSplitter
          Left = 441
          Top = 29
          Width = 8
          Height = 322
          Cursor = crHSplit
          Color = clAppWorkSpace
          ParentColor = False
        end
        object PNLEmpleado: TLFPanel
          Left = 449
          Top = 29
          Width = 513
          Height = 322
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGEmpleado: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 513
            Height = 300
            Align = alClient
            DataSource = DMReparaciones.DSxEmpleado
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGEmpleadoCellClick
            OnDrawColumnCell = DBGEmpleadoDrawColumnCell
            OnDblClick = DBGEmpleadoDblClick
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
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'EMPLEADO'
              'LINEA_TAREA')
            CamposAMostrar.Strings = (
              'EMPLEADO'
              '0'
              'LINEA_TAREA'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'EMPLEADO'
              'LINEA_TAREA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_EMPLEADOS_EF'
              'PRO_REP_TAREA')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TAREA')
            Posicion = tpCentrado
            OnBusqueda = DBGEmpleadoBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'EMPLEADO'
              'LINEA_TAREA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'EMPLEADO'
                Width = 52
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 335
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA_TAREA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIEMPO_PRODUCCION'
                Width = 100
                Visible = True
              end>
          end
          object TBEmpleado: TLFToolBar
            Left = 0
            Top = 0
            Width = 513
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavEmpleado: THYMNavigator
              Left = 0
              Top = 0
              Width = 216
              Height = 22
              DataSource = DMReparaciones.DSxEmpleado
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = ptclsCEEmpleadoPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGEmpleado
              InsertaControl = DBGEmpleado
              Exclusivo = True
              ControlEdit = CEEmpleado
              OrdenAscendente = True
              InsertaUltimo = True
            end
          end
        end
        object PnlTareas: TPanel
          Left = 0
          Top = 29
          Width = 441
          Height = 322
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object TBTareas: TLFToolBar
            Left = 0
            Top = 0
            Width = 441
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
            object NavTareas: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMReparaciones.DSxTarea
              ParentShowHint = False
              PopupMenu = CETareaPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              InsertaControl = DBGTareas
              Exclusivo = True
              ControlEdit = CETarea
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGTareas: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 441
            Height = 298
            Align = alClient
            DataSource = DMReparaciones.DSxTarea
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
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = DMReparaciones.TLocal
            BuscarNums = False
            Campos.Strings = (
              'TIPOTAREA')
            CamposAMostrar.Strings = (
              'TIPOTAREA'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposNoAccesibles.Strings = (
              'LINEA_TAREA')
            ColumnasCheckBoxes.Strings = (
              'PRODUCIENDO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'TAREA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'PRO_SYS_TAREAS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'TAREA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_TAREA'
                ReadOnly = True
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPOTAREA'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TAREA'
                ReadOnly = True
                Width = 311
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIEMPO_PRODUCCION'
                Width = 60
                Visible = True
              end>
          end
        end
        object TBMecanico: TLFToolBar
          Left = 0
          Top = 0
          Width = 962
          Height = 29
          ButtonWidth = 28
          Caption = 'TBMecanico'
          DisabledImages = DMMain.ILMain_In
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 2
          Separators = True
          object PNLMecanicoReparacion: TLFPanel
            Left = 0
            Top = 2
            Width = 336
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object DBEMecanicoIdReparacion: TLFDbedit
              Left = 0
              Top = 0
              Width = 57
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'IDCABREPARAR'
              DataSource = DMReparaciones.DSCabReparar
              Enabled = False
              TabOrder = 0
            end
            object DBEMecanicoCliente: TLFDbedit
              Left = 58
              Top = 0
              Width = 275
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMReparaciones.DSCabReparar
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
          end
          object PNLFiltroMecanicos: TLFPanel
            Left = 336
            Top = 2
            Width = 181
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object CBRelacionarTareaMecanico: TLFCheckBox
              Left = 5
              Top = 3
              Width = 172
              Height = 17
              Caption = 'Ver solo mecanicos de la tarea'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CBRelacionarTareaMecanicoChange
            end
          end
          object ToolButton1: TToolButton
            Left = 517
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object LTiempoProduccion: TLFLabel
            Left = 525
            Top = 2
            Width = 67
            Height = 22
            Caption = 'T. Produccion'
            Layout = tlCenter
          end
          object ToolButton2: TToolButton
            Left = 592
            Top = 2
            Width = 8
            ImageIndex = 12
            Style = tbsSeparator
          end
          object DBETiempoProduccion: TLFDbedit
            Left = 600
            Top = 2
            Width = 65
            Height = 22
            Color = clInfoBk
            DataField = 'TIEMPO_PRODUCCION'
            DataSource = DMReparaciones.DSCabReparar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object ToolButton4: TToolButton
            Left = 665
            Top = 2
            Width = 8
            ImageIndex = 13
            Style = tbsSeparator
          end
          object TBActualizaTiempoHojasDeTrabajo: TToolButton
            Left = 673
            Top = 2
            Hint = 'Actualiza tiempos Hojas de Trabajo'
            Caption = 'Actualiza tiempos Hojas de Trabajo'
            ImageIndex = 11
            ParentShowHint = False
            ShowHint = True
            OnClick = TBActualizaTiempoHojasDeTrabajoClick
          end
        end
      end
      object TSTrabajo: TTabSheet [2]
        Caption = 'Trabajo Realizado'
        ImageIndex = 2
        object LFPanelTrabajo: TLFPanel
          Left = 0
          Top = 22
          Width = 962
          Height = 329
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBMTrabajo: TLFDBMemo
            Left = 0
            Top = 0
            Width = 962
            Height = 329
            Align = alClient
            DataField = 'TRABAJO_REALIZADO'
            DataSource = DMReparaciones.DSCabReparar
            TabOrder = 0
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 962
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLTRabajoRealizadoDatosCab: TLFPanel
            Left = 0
            Top = 0
            Width = 336
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object DBEIdTrabajo: TLFDbedit
              Left = 1
              Top = 0
              Width = 57
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'IDCABREPARAR'
              DataSource = DMReparaciones.DSCabReparar
              Enabled = False
              TabOrder = 0
            end
            object DBEDescClienteTrabajo: TLFDbedit
              Left = 59
              Top = 0
              Width = 275
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMReparaciones.DSCabReparar
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
          end
          object TSep1: TToolButton
            Left = 336
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavTrabajo: THYMNavigator
            Left = 344
            Top = 0
            Width = 80
            Height = 22
            DataSource = DMReparaciones.DSCabReparar
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CETrabajoPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMTrabajo
            InsertaControl = DBMTrabajo
            Exclusivo = True
            ControlEdit = CETrabajo
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 962
          Height = 351
          DataSource = DMReparaciones.DSCabReparar
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'ANTENA'
            'APERTURA_PUERTAS_DELANTERAS'
            'APERTURA_PUERTAS_TRASERAS'
            'AUTORIZA_PRESUPUESTO'
            'AUTORIZA_PRUEBAS'
            'ELEVALUNAS_DELATEROS'
            'ELEVALUNAS_TRASEROS'
            'ESTADO_CRISTALES'
            'ESTADO_ESCOBILLAS'
            'ESTADO_PLACAS_MATRICULA'
            'PIEZAS_DEL_CLIENTE'
            'PILOTOS_Y_FAROS'
            'RECOGER_PIEZAS_SUSTITUIDAS'
            'RETROVISORES'
            'TESTIGO_AVERIA')
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
            '0')
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'CODIGO_POSTAL'
            'CONDICION'
            'CONTACTO_DIR_NOMBRE'
            'CONTACTO_DIR_NOMBRE_2'
            'CONTACTO_EMAIL'
            'CONTACTO_LATITUD'
            'CONTACTO_LOCALIDAD'
            'CONTACTO_LONGITUD'
            'CONTACTO_NOMBRE'
            'CONTACTO_TELEFONO'
            'DIRECCION_DOCUMENTO'
            'EQUIPO'
            'ESTADO'
            'ESTADO_REPAR'
            'FECHA'
            'FECHA_AVISO'
            'FECHA_ENTRADA'
            'FECHA_HORA_CIERRE'
            'FECHA_HORA_CIERRE_ITV'
            'FECHA_PREV_SALIDA'
            'FECHA_SALIDA'
            'ID_FICHA_TECNICA'
            'ID_INSPECCION_ITV'
            'ID_NUM_SERIE'
            'ID_REP_RECEPCION'
            'IDCABREPARAR'
            'KILOMETROS'
            'KILOMETROS_ENTRADA'
            'MARCA'
            'MATRICULA'
            'MODELO'
            'NOMBRE_COMERCIAL'
            'NOMBRE_COMERCIAL_CLIENTE'
            'NOMBRE_EMPLEADO'
            'NOMBRE_EMPLEADO_ITV'
            'NOMBRE_R_SOCIAL'
            'NOMBRE_R_SOCIAL_CLIENTE'
            'NUM_SERIE'
            'OT'
            'PROYECTO'
            'REPARACION'
            'RIG_DESTINO'
            'RIG_ORIGEN'
            'SERIE_DESTINO'
            'SERIE_DOC'
            'SERIE_ORIGEN'
            'SITUACION'
            'TECNICO'
            'TERCERO'
            'TIPO'
            'TIPO_ACTUACION'
            'TIPO_DESTINO'
            'TIPO_ORIGEN'
            'TITULO_EMPLEADOS_TAREAS'
            'TITULO_ESTADO'
            'TITULO_LOCALIDAD'
            'TITULO_PROYECTO'
            'TITULO_SITUACION'
            'TITULO_TIPO_ACTUACION'
            'TITULO_TIPO_REPARACION'
            'TOTAL_COSTE')
          Columns = <
            item
              Expanded = False
              FieldName = 'IDCABREPARAR'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REPARACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 357
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TECNICO'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_AVISO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTRADA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_SALIDA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ACTUACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROYECTO'
              Width = 60
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Top = 284
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 409
    Width = 974
    Height = 134
    inherited TBDetalle: TLFToolBar
      Width = 974
      inherited NavDetalle: THYMNavigator
        DataSource = DMReparaciones.DSDetReparar
        Hints.Strings = ()
        InsertaUltimo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 974
      Height = 87
      DataSource = DMReparaciones.DSDetReparar
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      OnKeyPress = DBGFDetalleKeyPress
      OnKeyUp = DBGFDetalleKeyUp
      ColumnaInicial = 1
      Transaction = DMReparaciones.TLocal
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '2'
        'AGRUPACIONES_TITULOS'
        'AGRUPACIONES'
        'ARTICULO'
        '1'
        'ARTICULO')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        'ARTICULO')
      CamposDesplegar.Strings = (
        '1'
        '0')
      Numericos.Strings = (
        'ARTICULO'
        'BARRAS')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_EF'
        'VER_ARTICULOS_CON_BARRAS')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      OnRowChange = DBGFDetalleRowChange
      Planes.Strings = (
        ''
        '')
      OrdenadosPor.Strings = (
        'ARTICULO'
        'BARRAS')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_LINEA'
          ReadOnly = True
          Width = 41
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
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_ART'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_VENTA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPORTE_DESCUENTO'
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_IVA'
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PORCENTAJE_IVA'
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPORTE_IVA'
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_DETALLES_E_ORIGEN'
          Visible = True
        end>
    end
    object PNLTotal: TLFPanel
      Left = 0
      Top = 109
      Width = 974
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LPieTotal: TLFLabel
        Left = 762
        Top = 6
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LPieBaseImponible: TLFLabel
        Left = 472
        Top = 6
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'B. Imponible'
        Layout = tlCenter
      end
      object LPieIVA: TLFLabel
        Left = 649
        Top = 6
        Width = 17
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA'
        Layout = tlCenter
      end
      object LMargen: TLFLabel
        Left = 335
        Top = 6
        Width = 36
        Height = 13
        Caption = 'Margen'
      end
      object DBETotalaCobrar: TLFDbedit
        Left = 807
        Top = 2
        Width = 72
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DataField = 'LIQUIDO'
        DataSource = DMReparaciones.DSQMTotales
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBES_BaseImponible: TLFDbedit
        Left = 534
        Top = 2
        Width = 72
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DataField = 'BASE_IMPONIBLE'
        DataSource = DMReparaciones.DSQMTotales
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
      object DBECuotaIVA: TLFDbedit
        Left = 670
        Top = 2
        Width = 72
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DataField = 'IMPORTE_IVA'
        DataSource = DMReparaciones.DSQMTotales
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
      object DBEMargen: TLFDbedit
        Left = 375
        Top = 2
        Width = 72
        Height = 21
        Color = clInfoBk
        DataField = 'MARGEN'
        DataSource = DMReparaciones.DSQMTotales
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 543
    Width = 974
  end
  inherited CEMain: TControlEdit
    Left = 888
    Top = 112
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 920
    Top = 112
    inherited CEMainMireport: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    Left = 648
    Top = 8
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListado: TAction
      Category = 'Listado'
      Caption = 'Listado Reparaciones'
      Hint = 'Listado Reparaciones'
      ImageIndex = 14
      OnExecute = AListadoExecute
    end
    object AConfig: TAction
      Category = 'Listado'
      Caption = 'Configuraci'#243'n Listado Reparacion'
      Hint = 'Configuraci'#243'n Listado Reparacion'
      ImageIndex = 77
      OnExecute = AConfigExecute
    end
    object AListarRecepcion: TAction
      Category = 'Listado'
      Caption = 'Listado Recepcion'
      Hint = 'Listado Recepcion'
      ImageIndex = 14
      OnExecute = AListarRecepcionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Proceso'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ATraspasoAlbaran: TAction
      Category = 'Proceso'
      Caption = 'Traspaso a Albar'#225'n'
      Hint = 'Traspaso a Albar'#225'n'
      ImageIndex = 60
      OnExecute = ATraspasoDocumentoExecute
    end
    object ATraspasoFactura: TAction
      Category = 'Proceso'
      Caption = 'Traspaso a Factura'
      Hint = 'Traspaso a Factura'
      ImageIndex = 61
      OnExecute = ATraspasoDocumentoExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AFiltrarNroSerie: TAction
      Category = 'Otros'
      Caption = 'Filtrar Nro. Serie'
      Hint = 'Filtrar por Nro. Serie'
      ImageIndex = 115
      OnExecute = AFiltrarNroSerieExecute
    end
    object AHojaDeTrabajo: TAction
      Category = 'Otros'
      Caption = 'Hoja De Trabajo'
      Hint = 'Abre Hoja De Trabajo'
      ImageIndex = 105
      OnExecute = AHojaDeTrabajoExecute
    end
    object ASincronizacionSkrit: TAction
      Category = 'Otros'
      Caption = 'Sincronizacion Skrit'
      Hint = 'Obtiene datos de albaranes de skirt'
      ImageIndex = 98
      OnExecute = ASincronizacionSkritExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntoReparacion: TAction
      Category = 'Adjuntos'
      Caption = 'Reparacion'
      Hint = 'Adjuntos de la reparaci'#243'n'
      ImageIndex = 59
      OnExecute = AAdjuntoReparacionExecute
    end
    object AAdjuntoCliente: TAction
      Category = 'Adjuntos'
      Caption = 'Cliente'
      Hint = 'Adjuntos del cliente'
      ImageIndex = 59
      OnExecute = AAdjuntoClienteExecute
    end
    object AAdjuntoFichaTecnica: TAction
      Category = 'Adjuntos'
      Caption = 'Ficha T'#233'cnica'
      Hint = 'Adjuntos Ficha Tecnica'
      ImageIndex = 59
      OnExecute = AAdjuntoFichaTecnicaExecute
    end
    object AAbrirCerrar: TAction
      Category = 'Proceso'
      Caption = 'Cerrarr Reparacion'
      Hint = 'Cerrar Reparacion'
      ImageIndex = 68
      OnExecute = AAbrirCerrarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBRelacionarTareaMecanico.Checked')
    Left = 712
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CETarea
    Left = 888
    Top = 144
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 920
    Top = 144
    inherited CEDetalleMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMirefresh: TMenuItem
      ShortCut = 0
    end
  end
  object CETrabajo: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSTrabajo
    FichaExclusiva = TSTrabajo
    PanelEdicion = LFPanelTrabajo
    PopUpMenu = CETrabajoPMEdit
    Teclas = DMMain.Teclas
    Left = 888
    Top = 176
  end
  object CETrabajoPMEdit: TPopUpTeclas
    Left = 920
    Top = 176
    object CETrabajoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CETrabajoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CETrabajoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CETrabajoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CETrabajoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CETrabajoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CETrabajoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETrabajoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETrabajoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETrabajoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALReparaciones: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 680
    Top = 8
    object AACliente: TAction
      Caption = 'Cliente'
      OnExecute = AAClienteExecute
    end
    object ADocumento: TAction
      Caption = 'Muestra Documento'
      OnExecute = ADocumentoExecute
    end
    object ANuveoCliente: TAction
      Caption = 'Nuevo Cliente'
    end
    object ANuevaFichaTecnica: TAction
      Caption = 'New F. Tec.'
      OnExecute = ANuevaFichaTecnicaExecute
    end
    object AEquipo: TAction
      Caption = 'Equipo'
      OnExecute = AEquipoExecute
    end
    object AProyecto: TAction
      Caption = 'Proyecto'
      OnExecute = AProyectoExecute
    end
  end
  object CEEmpleado: TControlEdit
    EnlazadoA = CETrabajo
    FichaEdicion = TSEmpleado
    PopUpMenu = ptclsCEEmpleadoPMEdit
    Teclas = DMMain.Teclas
    Left = 888
    Top = 208
  end
  object PopUpTeclas1: TPopUpTeclas
    Left = 920
    Top = 176
    object MenuItem1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object MenuItem2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object MenuItem3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object MenuItem4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object MenuItem5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ptclsCEEmpleadoPMEdit: TPopUpTeclas
    Left = 920
    Top = 208
    object CEEmpleadoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEEmpleadoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEEmpleadoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEEmpleadoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEEmpleadoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEEmpleadoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEEmpleadoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEEmpleadoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEEmpleadoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEEmpleadoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CETarea: TControlEdit
    DataSource = DMReparaciones.DSxTarea
    EnlazadoA = CEEmpleado
    FichaEdicion = TSEmpleado
    PopUpMenu = CETareaPMEdit
    Teclas = DMMain.Teclas
    Left = 888
    Top = 240
  end
  object CETareaPMEdit: TPopUpTeclas
    Left = 920
    Top = 240
    object CETareaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CETareaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CETareaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CETareaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CETareaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CETareaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CETareaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETareaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETareaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETareaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
