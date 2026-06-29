inherited FMIncidencias: TFMIncidencias
  Left = 369
  Top = 163
  Width = 778
  Height = 576
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = ' Incidencias'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 768
    Height = 523
    inherited TBMain: TLFToolBar
      Width = 764
      inherited NavMain: THYMNavigator
        DataSource = DMIncidencias.DSQMIncidencias
        Hints.Strings = ()
        EditaControl = LFDbTitIncidencia
        InsertaControl = DBEFMaestro
        OnClickBefore = NavMainClickBefore
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
      object CBTipo: TLFComboBox
        Left = 319
        Top = 0
        Width = 79
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBTipoChange
        Items.Strings = (
          'Cliente'
          'Proveedor'
          'Acreedor'
          'Agente')
      end
      object ToolButton1: TToolButton
        Left = 398
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLDireccion: TLFPanel
        Left = 406
        Top = 0
        Width = 172
        Height = 22
        BevelOuter = bvNone
        TabOrder = 4
        object LFiltraDireccionFiltro: TLFLabel
          Left = 5
          Top = 4
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dir.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFDireccionFiltro: TLFEditFind2000
          Left = 26
          Top = 0
          Width = 53
          Height = 21
          TabOrder = 0
          OnChange = EFDireccionFiltroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO_LOCALIDAD')
          CampoNum = 'DIRECCION'
          CampoStr = 'DIR_COMPLETA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_TERCEROS_DIRECCION_TODAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFDireccionFiltroBusqueda
          OrdenadoPor.Strings = (
            'DIRECCION')
          Filtros = []
        end
        object ETituloDireccionFiltro: TLFEdit
          Left = 80
          Top = 0
          Width = 90
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object PNLFiltro: TLFPanel
        Left = 578
        Top = 0
        Width = 181
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LMaestroFiltro: TLFLabel
          Left = 6
          Top = 4
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Filtro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFMaestroFiltro: TLFEditFind2000
          Left = 38
          Top = 0
          Width = 51
          Height = 21
          TabOrder = 0
          OnChange = EFMaestroFiltroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloMaestroFiltro: TLFEdit
          Left = 90
          Top = 0
          Width = 88
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 764
      Height = 493
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        object SBAContacto: TSpeedButton [0]
          Left = 514
          Top = 51
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAContactoDblClick
        end
        object SBAAgente: TSpeedButton [1]
          Left = 368
          Top = 8
          Width = 97
          Height = 25
          GroupIndex = -1
          OnDblClick = SBAAgenteDblClick
        end
        object SBCodCliPro: TSpeedButton [2]
          Left = 136
          Top = 16
          Width = 247
          Height = 25
          GroupIndex = -1
          OnDblClick = SBCodCliProDblClick
        end
        object SBDireccion: TSpeedButton [3]
          Left = 136
          Top = 56
          Width = 247
          Height = 25
          GroupIndex = -1
          OnDblClick = SBDireccionDblClick
        end
        object SBAContacto2: TSpeedButton [4]
          Left = 522
          Top = 59
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAContactoDblClick
        end
        object SBAContacto3: TSpeedButton [5]
          Left = 530
          Top = 67
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAContactoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 756
          Height = 465
          inherited G2KTableLoc: TG2KTBLoc
            Top = 39
            DataSource = DMIncidencias.DSQMIncidencias
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_INCIDENCIAS'
            CampoNum = 'INCIDENCIA'
            CampoStr = 'TITULO_INCIDENCIA'
            OrdenadoPor.Strings = (
              'INCIDENCIA')
          end
          object LBLIncidencia: TLFLabel
            Left = 7
            Top = 72
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Incidencia'
          end
          object LBLRespuesta: TLFLabel
            Left = 5
            Top = 250
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Respuesta'
          end
          object LBLFecha: TLFLabel
            Left = 438
            Top = 95
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLRecepcion: TLFLabel
            Left = 593
            Top = 93
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recepci'#243'n'
          end
          object LBUsuario: TLFLabel
            Left = 19
            Top = 6
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LTipoIncidenciaKri: TLFLabel
            Left = 34
            Top = 94
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LHoras: TLFLabel
            Left = 196
            Top = 250
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas'
          end
          object LDireccionKri: TLFLabel
            Left = 11
            Top = 50
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
          end
          object LContactoKri: TLFLabel
            Left = 389
            Top = 29
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LBLMaestro: TLFLabel
            Left = 24
            Top = 28
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LAgenteKri: TLFLabel
            Left = 397
            Top = 8
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LContactoKri2: TLFLabel
            Left = 389
            Top = 51
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LContactoKri3: TLFLabel
            Left = 389
            Top = 73
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LFDbTitIncidencia: TLFDbedit
            Left = 60
            Top = 69
            Width = 328
            Height = 21
            DataField = 'TITULO_INCIDENCIA'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 7
          end
          object DBMMDatosIncidencia: TLFDBMemo
            Left = 60
            Top = 113
            Width = 676
            Height = 133
            BevelInner = bvNone
            DataField = 'DATOS_INCIDENCIA'
            DataSource = DMIncidencias.DSQMIncidencias
            ScrollBars = ssVertical
            TabOrder = 11
          end
          object LFDBRespuestaIncidencia: TLFDBMemo
            Left = 60
            Top = 269
            Width = 677
            Height = 100
            Anchors = [akLeft, akTop, akBottom]
            BevelInner = bvNone
            DataField = 'RESPUESTA_INCIDENCIA'
            DataSource = DMIncidencias.DSQMIncidencias
            ScrollBars = ssVertical
            TabOrder = 16
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 473
            Top = 91
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMIncidencias.DSQMIncidencias
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBDEFechaResp: TLFDBDateEdit
            Left = 60
            Top = 247
            Width = 87
            Height = 21
            DataField = 'FECHA_RESPUESTA'
            DataSource = DMIncidencias.DSQMIncidencias
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 12
          end
          object DBDEFechaRecep: TLFDBDateEdit
            Left = 649
            Top = 91
            Width = 87
            Height = 21
            DataField = 'FECHA_RECEPCION'
            DataSource = DMIncidencias.DSQMIncidencias
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
          object GBDoc: TLFPanel
            Left = 0
            Top = 376
            Width = 756
            Height = 89
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 17
            object LBLEjercicio: TLFLabel
              Left = 31
              Top = 20
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
            end
            object LBLSerie: TLFLabel
              Left = 46
              Top = 40
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LBLTipo: TLFLabel
              Left = 374
              Top = 19
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo'
            end
            object LBLNumero: TLFLabel
              Left = 358
              Top = 41
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#250'mero'
            end
            object LBLCanal: TLFLabel
              Left = 45
              Top = 62
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Canal'
            end
            object LDocumento: TLFLabel
              Left = 0
              Top = 0
              Width = 756
              Height = 13
              Align = alTop
              Caption = 'Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEFSerie: TLFDBEditFind2000
              Left = 76
              Top = 38
              Width = 69
              Height = 21
              DataField = 'DOC_SERIE'
              DataSource = DMIncidencias.DSQMIncidencias
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'GEN_SERIES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'SERIE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'SERIE')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFEjercicio: TLFDBEditFind2000
              Left = 76
              Top = 16
              Width = 69
              Height = 21
              DataField = 'DOC_EJERCICIO'
              DataSource = DMIncidencias.DSQMIncidencias
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'GEN_EJERCICIOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'EJERCICIO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'EJERCICIO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBERig: TLFDbedit
              Left = 400
              Top = 38
              Width = 87
              Height = 21
              DataField = 'DOC_RIG'
              DataSource = DMIncidencias.DSQMIncidencias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBEFCanal: TLFDBEditFind2000
              Left = 76
              Top = 60
              Width = 69
              Height = 21
              DataField = 'DOC_CANAL'
              DataSource = DMIncidencias.DSQMIncidencias
              TabOrder = 2
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CANAL'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'CANAL')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBETitTipo: TLFDbedit
              Left = 446
              Top = 16
              Width = 227
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMIncidencias.DSxTipoMov
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
            object DBEFTipoMov: TLFDBEditFind2000
              Left = 400
              Top = 16
              Width = 45
              Height = 21
              DataField = 'DOC_TIPO'
              DataSource = DMIncidencias.DSQMIncidencias
              TabOrder = 3
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TIPO_MOVIMIENTO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'TIPO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OnBusqueda = DBEFTipoMovBusqueda
              OrdenadoPor.Strings = (
                'TIPO')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object DBETitCanal: TLFDbedit
              Left = 146
              Top = 60
              Width = 183
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMIncidencias.DSxCanal
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBETitSerie: TLFDbedit
              Left = 146
              Top = 38
              Width = 183
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMIncidencias.DSxSerie
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
          end
          object DBEUsuario: TLFDbedit
            Left = 60
            Top = 3
            Width = 67
            Height = 21
            Color = clInfoBk
            DataField = 'USUARIO'
            DataSource = DMIncidencias.DSxUsuarios
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
          object DBETituloUsuario: TLFDbedit
            Left = 128
            Top = 3
            Width = 260
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE'
            DataSource = DMIncidencias.DSxUsuarios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object DBEFTipoIncidenciaKri: TLFDBEditFind2000
            Left = 60
            Top = 91
            Width = 67
            Height = 21
            DataField = 'TIPO_INCIDENCIA_KRI'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 8
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_INCIDENCIA_KRI'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFTipoMovBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETipoIncidenciaKri: TLFDbedit
            Left = 128
            Top = 91
            Width = 260
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIT_TIPO_INCIDENCIA_KRI'
            DataSource = DMIncidencias.DSQMIncidencias
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object DBHoras: TLFDbedit
            Left = 309
            Top = 247
            Width = 78
            Height = 21
            Color = clInfoBk
            DataField = 'HORASEDIT'
            DataSource = DMIncidencias.DSQMIncidencias
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
          object DBCBFinalizada: TLFDBCheckBox
            Left = 416
            Top = 249
            Width = 121
            Height = 17
            Caption = 'Finalizada'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FINALIZADO'
            DataSource = DMIncidencias.DSQMIncidencias
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBEDireccionKri: TLFDbedit
            Left = 128
            Top = 47
            Width = 260
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'DIR_NOMBRE'
            DataSource = DMIncidencias.DSQMIncidencias
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
            OnDblClick = LFDBEDireccionKriDblClick
          end
          object DBERTitulo: TLFDbedit
            Left = 128
            Top = 25
            Width = 260
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TITULO_TERCERO'
            DataSource = DMIncidencias.DSQMIncidencias
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
            OnDblClick = DBERTituloDblClick
          end
          object DBEFMaestro: TLFDBEditFind2000
            Left = 60
            Top = 25
            Width = 67
            Height = 21
            DataField = 'COD_CLI_PRO'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 1
            OnExit = DBEFMaestroExit
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFTipoMovBusqueda
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFDireccionKri: TLFDBEditFind2000
            Left = 60
            Top = 47
            Width = 67
            Height = 21
            DataField = 'DIRECCION'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'LOCALIDAD'
              'COD_POSTAL')
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFDireccionKriBusqueda
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFContactoKri: TLFDBEditFind2000
            Left = 435
            Top = 25
            Width = 67
            Height = 21
            DataField = 'CONTACTO'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 4
            OnChange = DBEFContactoKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_CONTACTOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE')
            CampoNum = 'CONTACTO'
            CampoStr = 'APELLIDOS'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFContactoKriBusqueda
            OrdenadoPor.Strings = (
              'CONTACTO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAgenteKri: TLFDBEditFind2000
            Left = 435
            Top = 3
            Width = 67
            Height = 21
            DataField = 'AGENTE'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEContactoKri: TLFDbedit
            Tag = 1
            Left = 503
            Top = 25
            Width = 233
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TIT_CONTACTO'
            DataSource = DMIncidencias.DSQMIncidencias
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
            OnDblClick = DBEContactoKriDblClick
          end
          object DBEAgenteKri: TLFDbedit
            Left = 503
            Top = 3
            Width = 233
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TIT_AGENTE'
            DataSource = DMIncidencias.DSQMIncidencias
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
            OnDblClick = DBEAgenteKriDblClick
          end
          object DBEFContactoKri2: TLFDBEditFind2000
            Left = 435
            Top = 47
            Width = 67
            Height = 21
            DataField = 'CONTACTO2'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 5
            OnChange = DBEFContactoKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_CONTACTOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE')
            CampoNum = 'CONTACTO'
            CampoStr = 'APELLIDOS'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFContactoKriBusqueda
            OrdenadoPor.Strings = (
              'CONTACTO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEContactoKri2: TLFDbedit
            Tag = 2
            Left = 503
            Top = 47
            Width = 233
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TIT_CONTACTO2'
            DataSource = DMIncidencias.DSQMIncidencias
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
            OnDblClick = DBEContactoKriDblClick
          end
          object DBEContactoKri3: TLFDbedit
            Tag = 3
            Left = 503
            Top = 69
            Width = 233
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TIT_CONTACTO3'
            DataSource = DMIncidencias.DSQMIncidencias
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 25
            OnDblClick = DBEContactoKriDblClick
          end
          object DBEFContactoKri3: TLFDBEditFind2000
            Left = 435
            Top = 69
            Width = 67
            Height = 21
            DataField = 'CONTACTO3'
            DataSource = DMIncidencias.DSQMIncidencias
            TabOrder = 6
            OnChange = DBEFContactoKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_CONTACTOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE')
            CampoNum = 'CONTACTO'
            CampoStr = 'APELLIDOS'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFContactoKriBusqueda
            OrdenadoPor.Strings = (
              'CONTACTO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEHorasDec: TLFDbedit
            Left = 230
            Top = 247
            Width = 78
            Height = 21
            DataField = 'HORAS'
            DataSource = DMIncidencias.DSQMIncidencias
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
        end
      end
      object TSVentas: TTabSheet [1]
        Caption = 'Ventas'
        ImageIndex = 2
        object TBVentas: TLFToolBar
          Left = 0
          Top = 0
          Width = 756
          Height = 30
          ButtonHeight = 25
          EdgeBorders = []
          TabOrder = 0
          Separators = True
          object NavVentas: THYMNavigator
            Left = 0
            Top = 2
            Width = 110
            Height = 25
            DataSource = DMIncidencias.DSxVentas
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
          object PNLVentasCliente: TLFPanel
            Left = 110
            Top = 2
            Width = 311
            Height = 25
            BevelOuter = bvNone
            TabOrder = 1
            object LVentasCliente: TLFLabel
              Left = 17
              Top = 6
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
            end
            object DBEVentasCliente: TLFEditFind2000
              Left = 52
              Top = 2
              Width = 69
              Height = 21
              TabStop = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = DBEVentasClienteChange
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
            object ETituloClientesVentas: TLFEdit
              Left = 122
              Top = 2
              Width = 186
              Height = 21
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object PNLVentasDireccion: TLFPanel
            Left = 421
            Top = 2
            Width = 332
            Height = 25
            BevelOuter = bvNone
            TabOrder = 2
            object LVentasDireccion: TLFLabel
              Left = 4
              Top = 6
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Direccion'
            end
            object EFVentasDireccion: TLFEditFind2000
              Left = 52
              Top = 2
              Width = 69
              Height = 21
              TabStop = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = EFVentasDireccionChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              Campos_Desplegar.Strings = (
                'LOCALIDAD'
                'COD_POSTAL')
              CampoNum = 'DIRECCION'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_DIRECCIONES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object EVentasDireccion: TLFEdit
              Left = 122
              Top = 2
              Width = 207
              Height = 21
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
        object DBGVentas: THYTDBGrid
          Left = 0
          Top = 30
          Width = 756
          Height = 266
          Align = alClient
          DataSource = DMIncidencias.DSxVentas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGVentasDblClick
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
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Width = 94
              Visible = True
            end
            item
              Color = clAqua
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 43
              Visible = True
            end
            item
              Color = clAqua
              Expanded = False
              FieldName = 'SERIE'
              Width = 47
              Visible = True
            end
            item
              Color = clAqua
              Expanded = False
              FieldName = 'TIPO'
              Width = 30
              Visible = True
            end
            item
              Color = clAqua
              Expanded = False
              FieldName = 'RIG'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Width = 71
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 162
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTADO'
              Width = 37
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 28
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DIRECCION'
              Width = 28
              Visible = True
            end>
        end
        object DBGVentasDetalle: THYTDBGrid
          Left = 0
          Top = 296
          Width = 756
          Height = 169
          Align = alBottom
          DataSource = DMIncidencias.DSxVentasDetalle
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGVentasDblClick
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
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              Width = 34
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Width = 329
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO_2'
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO_3'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_IVA'
              Width = 41
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_RECARGO'
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'B_DTO_LINEA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'I_COMISION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'C_IVA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'C_RECARGO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Width = 66
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ORDEN'
              Width = 37
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 756
          Height = 332
          DataSource = DMIncidencias.DSQMIncidencias
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
            'FINALIZADO'
            'HORAS'
            'INCIDENCIA'
            'NOMBRE_USUARIO'
            'TERCERO'
            'TIPO_INCIDENCIA_KRI'
            'TIT_AGENTE'
            'TIT_CONTACTO'
            'TIT_TIPO_INCIDENCIA_KRI'
            'TITULO_INCIDENCIA'
            'TITULO_TERCERO'
            'USUARIO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TITULO_INCIDENCIA'
              Width = 405
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RESPUESTA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTACTO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENTE'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIT_CONTACTO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIT_AGENTE'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_NOMBRE'
              Width = 200
              Visible = True
            end>
        end
        object DBMMDatosIncidenciaNotas: TLFDBMemo
          Left = 0
          Top = 332
          Width = 756
          Height = 133
          Align = alBottom
          BevelInner = bvNone
          Color = clInfoBk
          DataField = 'DATOS_INCIDENCIA'
          DataSource = DMIncidencias.DSQMIncidencias
          Enabled = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 768
  end
  inherited CEMain: TControlEdit
    Left = 520
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 564
    Top = 12
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 624
    Top = 16
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadoIncidencias: TAction
      Category = 'Listados'
      Caption = 'Listado de Incidencias'
      ImageIndex = 14
      OnExecute = AListadoIncidenciasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ADuplicarIncidencia: TAction
      Category = 'Procesos'
      Caption = '&Duplicar Incidencia'
      Hint = 'Duplicar Incidencia'
      ImageIndex = 37
      OnExecute = ADuplicarIncidenciaExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntoIncidencia: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de Incidencia'
      Hint = 'Adjuntos de Incidencia'
      ImageIndex = 59
      OnExecute = AAdjuntoIncidenciaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 672
    Top = 16
  end
  object ALIncidencias: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 624
    Top = 48
    object AAgente: TAction
      Caption = 'Ver Datos Agente'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
      ShortCut = 49217
      OnExecute = AAgenteExecute
    end
    object AContacto: TAction
      Caption = 'Ver Datos Contacto'
      Hint = 'Doble Click'
      OnExecute = AContactoExecute
    end
    object ACodCliPro: TAction
      Caption = 'Ver datos del Cliente/Prov./Acr.'
      OnExecute = ACodCliProExecute
    end
    object ADireccion: TAction
      Caption = 'ADireccion'
      OnExecute = ADireccionExecute
    end
  end
end
