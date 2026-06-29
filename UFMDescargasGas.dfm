inherited FMDescargasGas: TFMDescargasGas
  Left = 310
  Top = 150
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Mantenimiento Descargas de Gas'
  ClientHeight = 607
  ClientWidth = 821
  OldCreateOrder = True
  PopupMenu = CEMonedasPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 821
    Height = 583
    inherited TBMain: TLFToolBar
      Width = 817
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMDescargasGas.DSQMDescargasGas
        Hints.Strings = ()
        EditaControl = DBEFechaInicio
        InsertaControl = DBEFechaInicio
        InsertaUltimo = True
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 248
      end
      inherited TbuttComp: TToolButton
        Left = 256
        Visible = False
      end
      object TButtInforme: TToolButton
        Left = 279
        Top = 0
        Hint = 'Ver Informe de Escandallo'
        Caption = 'Ver Informe Gas'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtInformeClick
      end
      object PNLSerie: TLFPanel
        Left = 302
        Top = 0
        Width = 266
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 16
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object EFSerie: TLFEditFind2000
          Left = 44
          Top = 0
          Width = 58
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
        object DBETitSerie: TLFDbedit
          Left = 103
          Top = 0
          Width = 161
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMDescargasGas.DSxSeries
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
    end
    inherited PCMain: TLFPageControl
      Width = 817
      Height = 484
      inherited TSFicha: TTabSheet
        object SBAAlabaran: TSpeedButton [0]
          Left = 112
          Top = 91
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAAlabaranDblClick
        end
        inherited PEdit: TLFPanel
          Width = 809
          Height = 251
          Align = alTop
          object LblGas: TLFLabel [0]
            Left = 64
            Top = 3
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gas'
            FocusControl = DBERig
          end
          object LblFecha: TLFLabel [1]
            Left = 11
            Top = 24
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha H. Inicio'
          end
          object LblTurno: TLFLabel [2]
            Left = 55
            Top = 46
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Turno'
          end
          object LFechaCierre: TLFLabel [3]
            Left = 266
            Top = 25
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha H. Cierre'
          end
          object LNotas: TLFLabel [4]
            Left = 55
            Top = 90
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LEstado: TLFLabel [5]
            Left = 379
            Top = 4
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LPrecio: TLFLabel [6]
            Left = 594
            Top = 46
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LSuNumero: TLFLabel
            Left = 571
            Top = 1
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su N'#250'mero'
          end
          object LGalones: TLFLabel
            Left = 585
            Top = 25
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Galones'
          end
          object LAlbaran: TLFLabel
            Left = 581
            Top = 69
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conduce'
          end
          object LAsiento: TLFLabel
            Left = 589
            Top = 93
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LBLProveedor: TLFLabel
            Left = 34
            Top = 68
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LFLabel1: TLFLabel
            Left = 62
            Top = 123
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cola'
          end
          object LFLabel2: TLFLabel
            Left = 358
            Top = 124
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cap. Cola'
          end
          object LFLabel3: TLFLabel
            Left = 10
            Top = 146
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'H. Salida Term.'
          end
          object LFLabel4: TLFLabel
            Left = 6
            Top = 168
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'H. Llegada Suc.'
          end
          object LFLabel5: TLFLabel
            Left = 579
            Top = 124
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Densidad'
          end
          object LDuracionCola: TLFLabel
            Left = 539
            Top = 147
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tiempo Dur'#243' Cola'
          end
          object LFLabel7: TLFLabel
            Left = 292
            Top = 145
            Width = 112
            Height = 13
            Alignment = taRightJustify
            Caption = 'Presi'#243'n Ant. Desc. Cola'
          end
          object LFLabel8: TLFLabel
            Left = 286
            Top = 167
            Width = 118
            Height = 13
            Alignment = taRightJustify
            Caption = 'Presi'#243'n Final. Desc. Cola'
          end
          object LFLabel9: TLFLabel
            Left = 291
            Top = 212
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = 'Temp. Final. Desc. Cola'
          end
          object LFLabel10: TLFLabel
            Left = 297
            Top = 189
            Width = 107
            Height = 13
            Alignment = taRightJustify
            Caption = 'Temp. Ant. Desc. Cola'
          end
          object LFLabel11: TLFLabel
            Left = 11
            Top = 189
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = '% Roto Gauge '
          end
          object LFLabel12: TLFLabel
            Left = 518
            Top = 169
            Width = 106
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recibidos Temp/Amb.'
          end
          object LFLabel13: TLFLabel
            Left = 539
            Top = 189
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#233'todo Descarga'
          end
          object LFLabel14: TLFLabel
            Left = 28
            Top = 211
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Chofer Cola'
          end
          object LFLabel15: TLFLabel
            Left = 170
            Top = 190
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cabezote'
          end
          object LFLabel16: TLFLabel
            Left = 341
            Top = 233
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recibido por:'
          end
          object DBERig: TLFDbedit
            Left = 86
            Top = 0
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMDescargasGas.DSQMDescargasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
          end
          object DBEFechaInicio: TLFDBDateEdit
            Left = 86
            Top = 22
            Width = 105
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMDescargasGas.DSQMDescargasGas
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 0
          end
          object DBETurno: TLFDBEditFind2000
            Left = 86
            Top = 44
            Width = 65
            Height = 21
            AutoSize = False
            DataField = 'TURNO'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 4
            OnChange = DBETurnoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_TURNOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TURNO'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'TURNO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TURNO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFechaCierre: TLFDBDateEdit
            Left = 343
            Top = 22
            Width = 103
            Height = 21
            DataField = 'FECHA_CIERRE'
            DataSource = DMDescargasGas.DSQMDescargasGas
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBMNotas: TLFDBMemo
            Left = 86
            Top = 88
            Width = 431
            Height = 31
            DataField = 'NOTAS'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 6
          end
          object DBDTInicio: TDBDateTimePicker
            Left = 192
            Top = 22
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963
            Time = 42963
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 1
            DataField = 'FECHA_INICIO'
            DataSource = DMDescargasGas.DSQMDescargasGas
          end
          object DBDTCierre: TDBDateTimePicker
            Left = 447
            Top = 22
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963
            Time = 42963
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 3
            DataField = 'FECHA_CIERRE'
            DataSource = DMDescargasGas.DSQMDescargasGas
          end
          object LFDBEstado: TLFDbedit
            Left = 416
            Top = 0
            Width = 101
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescEstado'
            DataSource = DMDescargasGas.DSQMDescargasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
          end
          object DBEOrden: TLFDbedit
            Left = 456
            Top = 44
            Width = 61
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ORDEN'
            DataSource = DMDescargasGas.DSQMDescargasGas
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
          object DBEPrecio: TLFDbedit
            Left = 628
            Top = 44
            Width = 121
            Height = 21
            TabStop = False
            DataField = 'PRECIO'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 23
          end
          object ETituloTurno: TLFEdit
            Left = 152
            Top = 44
            Width = 303
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 33
          end
          object DBEDescargaF: TLFDbedit
            Left = 628
            Top = 0
            Width = 121
            Height = 21
            AutoSize = False
            DataField = 'NUMERO_FAC'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 21
          end
          object DBEPrecioF: TLFDbedit
            Left = 628
            Top = 22
            Width = 121
            Height = 21
            AutoSize = False
            DataField = 'DESCARGA_FAC'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 22
          end
          object DBEAsiento: TLFDbedit
            Left = 628
            Top = 88
            Width = 121
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'RIC'
            DataSource = DMDescargasGas.DSQMDescargasGas
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
          object DBEAlbaran: TLFDbedit
            Left = 628
            Top = 66
            Width = 121
            Height = 21
            Color = clAqua
            DataField = 'ID_DOC'
            DataSource = DMDescargasGas.DSQMDescargasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
            OnDblClick = DBEAlbaranDblClick
          end
          object DBEFProveedor: TLFDBEditFind2000
            Left = 86
            Top = 66
            Width = 65
            Height = 21
            DataField = 'PROVEDOR'
            DataSource = DMDescargasGas.DSQMDescargasGas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnChange = DBEFProveedorChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloProveedor: TLFEdit
            Left = 152
            Top = 66
            Width = 365
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
            TabOrder = 34
          end
          object DBECola: TLFDBEditFind2000
            Left = 86
            Top = 120
            Width = 65
            Height = 21
            AutoSize = False
            DataField = 'COD_CAMION'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 7
            OnChange = DBEColaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_GAS_COLA_CAMION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'COD_CAMION'
            CampoStr = 'TITULO'
            CampoADevolver = 'COD_CAMION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'COD_CAMION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCola: TLFEdit
            Left = 152
            Top = 120
            Width = 187
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 35
          end
          object DBECapacidad: TLFDbedit
            Left = 408
            Top = 120
            Width = 109
            Height = 21
            Color = clInfoBk
            DataField = 'CAPACIDAD_COLA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object DBDateTimePicker1: TDBDateTimePicker
            Left = 191
            Top = 142
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963
            Time = 42963
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 9
            DataField = 'FECHA_SALIDA_TERMINAL'
            DataSource = DMDescargasGas.DSQMDescargasGas
          end
          object DBDateTimePicker2: TDBDateTimePicker
            Left = 191
            Top = 164
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963
            Time = 42963
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 11
            DataField = 'FECHA_LLEGADA_SUCURSAL'
            DataSource = DMDescargasGas.DSQMDescargasGas
          end
          object DBEDensidad: TLFDbedit
            Left = 628
            Top = 120
            Width = 121
            Height = 21
            AutoSize = False
            DataField = 'DENSIDAD'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 26
          end
          object DBEHsalioTerm: TLFDBDateEdit
            Left = 86
            Top = 142
            Width = 105
            Height = 21
            DataField = 'FECHA_SALIDA_TERMINAL'
            DataSource = DMDescargasGas.DSQMDescargasGas
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 8
          end
          object DBEHllegoSuc: TLFDBDateEdit
            Left = 86
            Top = 164
            Width = 105
            Height = 21
            DataField = 'FECHA_LLEGADA_SUCURSAL'
            DataSource = DMDescargasGas.DSQMDescargasGas
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 10
          end
          object DBEDuracionCola: TLFDbedit
            Left = 628
            Top = 142
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'TIEMPO_DESCARGA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
          end
          object DBEPreInicialCola: TLFDbedit
            Left = 408
            Top = 142
            Width = 109
            Height = 21
            AutoSize = False
            DataField = 'PRESION_ANTE_DESC_COLA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 16
          end
          object DBEPreFinalCola: TLFDbedit
            Left = 408
            Top = 164
            Width = 109
            Height = 21
            AutoSize = False
            DataField = 'PRESION_FINAL_DESC_COLA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 17
          end
          object DBETemInicialCola: TLFDbedit
            Left = 408
            Top = 186
            Width = 109
            Height = 21
            AutoSize = False
            DataField = 'TEMPERATURA_INICIAL_COLA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 18
          end
          object DBETemFinalCola: TLFDbedit
            Left = 408
            Top = 208
            Width = 109
            Height = 21
            AutoSize = False
            DataField = 'TEMPERATURA_FINAL_COLA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 19
          end
          object DBERotoGauge: TLFDbedit
            Left = 86
            Top = 186
            Width = 66
            Height = 21
            AutoSize = False
            DataField = 'ROTO_GAUGE'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 12
          end
          object DBERecTempAmb: TLFDbedit
            Left = 628
            Top = 164
            Width = 121
            Height = 21
            AutoSize = False
            DataField = 'GLS_REC_TEMP_AMBIENTE'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 28
          end
          object DBEMetDescarga: TLFDbedit
            Left = 628
            Top = 186
            Width = 121
            Height = 21
            AutoSize = False
            DataField = 'METODO_DESCARGA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 29
          end
          object DBEChoferCola: TLFDbedit
            Left = 86
            Top = 208
            Width = 198
            Height = 21
            AutoSize = False
            DataField = 'CHOFER_COLA'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 14
          end
          object DBENumCabezote: TLFDbedit
            Left = 218
            Top = 186
            Width = 66
            Height = 21
            AutoSize = False
            DataField = 'NUM_CABEZOTE'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 13
          end
          object DBERecibidoPor: TLFDbedit
            Left = 408
            Top = 230
            Width = 341
            Height = 21
            AutoSize = False
            DataField = 'RECIBIDO'
            DataSource = DMDescargasGas.DSQMDescargasGas
            TabOrder = 20
          end
        end
        object PnlDetGas: TLFPanel
          Left = 0
          Top = 251
          Width = 809
          Height = 205
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object PCDetGas: TLFPageControl
            Left = 0
            Top = 0
            Width = 809
            Height = 205
            ActivePage = TSTanque
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSTanque: TTabSheet
              Caption = 'Tanque'
              OnShow = TSTanqueShow
              object TBTanque: TLFToolBar
                Left = 0
                Top = 0
                Width = 801
                Height = 21
                AutoSize = True
                ButtonHeight = 21
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object NavTanque: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 21
                  Flat = True
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFTanque
                  InsertaControl = DBGFTanque
                  Exclusivo = True
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
              object DBGFTanque: TDBGridFind2000
                Left = 0
                Top = 21
                Width = 801
                Height = 156
                Align = alClient
                DataSource = DMDescargasGas.DSQMTanque
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGFTanqueCellClick
                OnDblClick = DBGFTanqueDblClick
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
                  'COD_TANQUE')
                CamposAMostrar.Strings = (
                  'COD_TANQUE'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80')
                CamposADevolver.Strings = (
                  '')
                CamposDesplegar.Strings = (
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                MensajeNoExiste = False
                Numericos.Strings = (
                  'COD_TANQUE')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_GAS_TANQUE')
                Acciones.Strings = (
                  '')
                Titulos.Strings = (
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGFTanqueBusqueda
                Planes.Strings = (
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  '')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA'
                    ReadOnly = True
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_TANQUE'
                    Width = 40
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescTanque'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'Capacidad'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'POR_INICIAL'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'POR_FINAL'
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CAP_INICIAL'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CAP_FINAL'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'UNID_CARGA'
                    ReadOnly = True
                    Width = 60
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
                    FieldName = 'IMPORTE_TOTAL'
                    ReadOnly = True
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TEMPERATURA_INICIAL'
                    Title.Caption = 'Temp. Inicial'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TEMPERATURA_FINAL'
                    Title.Caption = 'Temp. Final'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRESION_INICIAL'
                    Title.Caption = 'Presi'#243'n Inicial'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRESION_FINAL'
                    Title.Caption = 'Presi'#243'n Final'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'RIG_MOV'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end>
              end
            end
            object TSDispensador: TTabSheet
              Caption = 'Dispensador'
              ImageIndex = 119
              object DBGFDispensador: TDBGridFind2000
                Left = 0
                Top = 21
                Width = 801
                Height = 156
                Align = alClient
                DataSource = DMDescargasGas.DSQMDispensador
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
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
                  'COD_DISP')
                CamposAMostrar.Strings = (
                  'COD_DISP'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80')
                CamposADevolver.Strings = (
                  '')
                CamposDesplegar.Strings = (
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                MensajeNoExiste = False
                Numericos.Strings = (
                  'COD_DISPENSADOR')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_GAS_DISPENSADOR')
                Acciones.Strings = (
                  '')
                Titulos.Strings = (
                  'TITULO')
                Posicion = tpCentrado
                Planes.Strings = (
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  '')
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA'
                    ReadOnly = True
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_DISP'
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescDispensador'
                    ReadOnly = True
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LECTURA_INICIAL'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LECTURA_FINAL'
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'UNID_DISPENSADAS'
                    ReadOnly = True
                    Visible = True
                  end>
              end
              object LFEmpleado: TLFToolBar
                Left = 0
                Top = 0
                Width = 801
                Height = 21
                AutoSize = True
                ButtonHeight = 21
                EdgeBorders = []
                Flat = True
                TabOrder = 1
                Separators = True
                object NavDispensador: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 21
                  Flat = True
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFDispensador
                  InsertaControl = DBGFDispensador
                  Exclusivo = True
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 809
          Height = 456
          DataSource = DMDescargasGas.DSQMDescargasGas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'COMPUESTO'
            'ESCANDALLO'
            'FECHA_CREAC'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_DESCARGA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TURNO'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_DESCARGA_O'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_DESCARGA_D'
              Visible = True
            end>
        end
      end
    end
    object PnlTotales: TLFPanel
      Left = 2
      Top = 512
      Width = 817
      Height = 69
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object PCTotales: TLFPageControl
        Left = 0
        Top = 0
        Width = 817
        Height = 69
        ActivePage = TSTotales
        Align = alClient
        MultiLine = True
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 0
        TabPosition = tpBottom
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSTotales: TTabSheet
          Caption = '&Totales'
          object PNLTotal: TLFPanel
            Left = 0
            Top = 0
            Width = 809
            Height = 43
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LInicio: TLFLabel
              Left = 22
              Top = 4
              Width = 113
              Height = 13
              Alignment = taRightJustify
              Caption = 'Uds. Desc. en Tanques'
            end
            object LFinal: TLFLabel
              Left = 315
              Top = 4
              Width = 101
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unidades Facturadas'
            end
            object LDiferencia: TLFLabel
              Left = 652
              Top = 4
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'Diferencia'
            end
            object LVentaMetrosDrteDesc: TLFLabel
              Left = 10
              Top = 25
              Width = 125
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ventas Metros Drte. Desc.'
            end
            object LTotalGalMasVtaMetros: TLFLabel
              Left = 265
              Top = 25
              Width = 152
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Gls. Rec. + Vta. en Metros'
            end
            object LOverTotogateGlsRec: TLFLabel
              Left = 536
              Top = 25
              Width = 165
              Height = 13
              Alignment = taRightJustify
              Caption = 'Over Rotogate Gls. Rec. Vrs. Fact.'
            end
            object LFDFinalTanques: TLFDbedit
              Left = 420
              Top = 0
              Width = 105
              Height = 21
              Color = clInfoBk
              DataField = 'DESCARGA_FAC'
              DataSource = DMDescargasGas.DSQMDescargasGas
              ReadOnly = True
              TabOrder = 0
            end
            object DBETotalUnidades: TLFDbedit
              Left = 139
              Top = 0
              Width = 106
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL_UNID'
              DataSource = DMDescargasGas.DSxInfoSumTanque
              ReadOnly = True
              TabOrder = 1
            end
            object DBEDiferencia: TLFDbedit
              Left = 704
              Top = 0
              Width = 101
              Height = 21
              Color = clInfoBk
              DataField = 'DIFERENCIA'
              DataSource = DMDescargasGas.DSxInfoSumTanque
              ReadOnly = True
              TabOrder = 2
            end
            object DBETotalMtrDispen: TLFDbedit
              Left = 139
              Top = 22
              Width = 106
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL_UNID'
              DataSource = DMDescargasGas.DSxInfoSumDispensador
              ReadOnly = True
              TabOrder = 3
            end
            object DBETotalGalMasVtaMetros: TLFDbedit
              Left = 420
              Top = 22
              Width = 105
              Height = 21
              Color = clInfoBk
              DataField = 'RECIBIDOS_SUMINISTRADOS'
              DataSource = DMDescargasGas.DSxInfoSumTanque
              ReadOnly = True
              TabOrder = 4
            end
            object DBELOverRotogateGlsRec: TLFDbedit
              Left = 704
              Top = 22
              Width = 101
              Height = 21
              Color = clInfoBk
              DataField = 'ROTOGATE'
              DataSource = DMDescargasGas.DSQMDescargasGas
              ReadOnly = True
              TabOrder = 5
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 583
    Width = 821
  end
  inherited CEMain: TControlEdit
    Left = 632
    Top = 416
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 636
    Top = 384
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
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 664
    Top = 384
    object ATraspasoAlb: TAction
      Category = 'Procesos'
      Caption = 'Cerrar y Generar Conduce'
      OnExecute = ATraspasoAlbExecute
    end
    object ACerrarDescarga: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Descarga'
      ImageIndex = 68
      OnExecute = ACerrarDescargaExecute
    end
    object ALstDescGas: TAction
      Category = 'Listados'
      Caption = 'Listado Descargas Gas'
      Hint = 'Listado Descargas Gas'
      ImageIndex = 14
      OnExecute = ALstDescGasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAbrirDescarga: TAction
      Category = 'Procesos'
      Caption = 'Abrir Descarga'
      ImageIndex = 67
      OnExecute = AAbrirDescargaExecute
    end
    object AIniciarDescarga: TAction
      Category = 'Procesos'
      Caption = 'Iniciar Descarga'
      ImageIndex = 94
      OnExecute = AIniciarDescargaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AConfDescGas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Descargas Gas'
      Hint = 'Listado Descargas Gas'
      ImageIndex = 77
      OnExecute = AConfDescGasExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGMain.Columns'
      'DBGFTanque.Columns')
    Left = 702
    Top = 383
  end
  object CETanque: TControlEdit
    FichaEdicion = TSTanque
    FichaExclusiva = TSTanque
    PopUpMenu = CETanquePMEdit
    Teclas = DMMain.Teclas
    Left = 724
    Top = 89
  end
  object CETanquePMEdit: TPopUpTeclas
    Left = 724
    Top = 60
    object CEMainMifirst1: TMenuItem
      Caption = 'Primero'
      Enabled = False
    end
    object CEMainMiprior1: TMenuItem
      Caption = 'Anterior'
      Enabled = False
    end
    object CEMainMinext1: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
    end
    object CEMainMilast1: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
    end
    object CEMainMiinsert1: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
    end
    object CEMainMidelete1: TMenuItem
      Caption = 'Borrar'
      Enabled = False
    end
    object CEMainMiedit1: TMenuItem
      Caption = 'Modificar'
      Enabled = False
    end
    object CEMainMipost1: TMenuItem
      Caption = 'Grabar'
      Enabled = False
    end
    object CEMainMicancel1: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
    end
    object CEMainMirefresh1: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
    end
    object CEMainMiSep1: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar1: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEMainMiaprox1: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta1: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime1: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango1: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEMainMireport1: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy1: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut1: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste1: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir1: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object CEEmpleadoPMEdit: TPopUpTeclas
    Left = 764
    Top = 60
  end
  object CEEmpleado: TControlEdit
    DataSource = DMVentasGas.DSQMEmpleado
    FichaEdicion = TSDispensador
    FichaExclusiva = TSDispensador
    PopUpMenu = CEEmpleadoPMEdit
    Teclas = DMMain.Teclas
    Left = 764
    Top = 89
  end
  object CEDispensadorPMEdit: TPopUpTeclas
    Left = 724
    Top = 112
  end
  object CEDispensador: TControlEdit
    DataSource = DMVentasGas.DSQMDispensador
    PopUpMenu = CEDispensadorPMEdit
    Teclas = DMMain.Teclas
    Left = 724
    Top = 141
  end
  object CEFPagoPMEdit: TPopUpTeclas
    Left = 764
    Top = 112
  end
  object CEFPago: TControlEdit
    DataSource = DMVentasGas.DSQMFPago
    PopUpMenu = CEFPagoPMEdit
    Teclas = DMMain.Teclas
    Left = 764
    Top = 141
  end
  object CEMonedasPMEdit: TPopUpTeclas
    Left = 752
    Top = 172
  end
  object CEMonedas: TControlEdit
    DataSource = DMVentasGas.DSQMMonedas
    PopUpMenu = CEMonedasPMEdit
    Teclas = DMMain.Teclas
    Left = 752
    Top = 201
  end
end
