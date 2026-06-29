inherited FMLstEntreFechasCli: TFMLstEntreFechasCli
  Left = 453
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listados'
  ClientHeight = 553
  ClientWidth = 504
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 553
    inherited TBMain: TLFToolBar
      Width = 504
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
    end
    object GBClientes: TGroupBox [1]
      Left = 0
      Top = 36
      Width = 504
      Height = 71
      Align = alTop
      Caption = 'Clientes'
      TabOrder = 1
      object LDesdeCliente: TLFLabel
        Left = 7
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaCliente: TLFLabel
        Left = 8
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFCliHasta: TLFEditFind2000
        Left = 43
        Top = 38
        Width = 66
        Height = 21
        TabOrder = 1
        OnChange = EFCliHastaChange
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCliDesde: TLFEditFind2000
        Left = 43
        Top = 16
        Width = 66
        Height = 21
        TabOrder = 0
        OnChange = EFCliDesdeChange
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ECliHasta: TLFEdit
        Left = 110
        Top = 38
        Width = 380
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object ECliDesde: TLFEdit
        Left = 110
        Top = 16
        Width = 380
        Height = 21
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
    end
    object GBFechas: TGroupBox [2]
      Left = 0
      Top = 197
      Width = 504
      Height = 129
      Align = alTop
      Caption = 'Fechas'
      TabOrder = 4
      DesignSize = (
        504
        129)
      object LDesdeFecha: TLFLabel
        Left = 41
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFecha: TLFLabel
        Left = 43
        Top = 40
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeFechaCon: TLFLabel
        Left = 15
        Top = 89
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Cont'
      end
      object LHastaFechaCon: TLFLabel
        Left = 18
        Top = 110
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Cont'
      end
      object DTPDesde: TLFDateEdit
        Left = 79
        Top = 14
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPHasta: TLFDateEdit
        Left = 79
        Top = 36
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object PNLEstado: TLFPanel
        Left = 200
        Top = 9
        Width = 297
        Height = 48
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 4
        object RBAbierto: TRadioButton
          Left = 5
          Top = 7
          Width = 150
          Height = 18
          Caption = 'Documentos Abiertos'
          TabOrder = 0
        end
        object RBCerrados: TRadioButton
          Left = 5
          Top = 31
          Width = 150
          Height = 16
          Caption = 'Documentos Cerrados'
          TabOrder = 1
        end
        object RBTodos: TRadioButton
          Left = 168
          Top = 14
          Width = 60
          Height = 25
          Caption = 'Todos'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object CBFechaAlb: TLFCheckBox
        Left = 195
        Top = 102
        Width = 188
        Height = 17
        Caption = 'Mostrar albaranes abiertos a fecha'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        OnClick = CBFechaAlbClick
        Alignment = taLeftJustify
      end
      object DTPFechaAlb: TLFDateEdit
        Left = 383
        Top = 100
        Width = 94
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 6
        Visible = False
      end
      object CBFechaCreacion: TLFCheckBox
        Left = 79
        Top = 57
        Width = 180
        Height = 17
        Hint = 
          'Filtrar por fecha de creacion de documento en vez de la fecha de' +
          'l documento'
        Caption = 'Filtrar por fecha de Creacion'
        ClicksDisabled = False
        ColorCheck = 57088
        ShowHint = True
        TabOrder = 7
        TabStop = True
        Alignment = taLeftJustify
      end
      object DTPDesdeCon: TLFDateEdit
        Left = 79
        Top = 84
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object DTPHastaCon: TLFDateEdit
        Left = 79
        Top = 106
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
    end
    object GBMoneda: TGroupBox [3]
      Left = 0
      Top = 326
      Width = 504
      Height = 45
      Align = alTop
      Caption = 'Moneda a Emplear'
      TabOrder = 5
      object EFMoneda: TLFEditFind2000
        Left = 43
        Top = 15
        Width = 66
        Height = 21
        TabOrder = 0
        OnChange = EFMonedaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'MONEDA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, MONEDA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EMoneda: TLFEdit
        Left = 110
        Top = 15
        Width = 380
        Height = 21
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
    end
    object GBOpciones: TGroupBox [4]
      Left = 0
      Top = 436
      Width = 504
      Height = 117
      Align = alBottom
      Caption = 'Opciones'
      TabOrder = 7
      object LOrdenKri: TLFLabel
        Left = 56
        Top = 47
        Width = 29
        Height = 13
        Caption = 'Orden'
      end
      object LComentario: TLFLabel
        Left = 30
        Top = 69
        Width = 53
        Height = 13
        Caption = 'Comentario'
      end
      object LFechaListado: TLFLabel
        Left = 9
        Top = 91
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object ChkBMostrarBImponible: TLFCheckBox
        Left = 41
        Top = 18
        Width = 136
        Height = 17
        Caption = 'Mostrar Base Imponible'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
      end
      object ChkBMostrarIntrac: TLFCheckBox
        Left = 187
        Top = 18
        Width = 168
        Height = 17
        Caption = 'Mostrar Fac. Intracomunitarias'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBOrdenKri: TLFComboBox
        Left = 90
        Top = 43
        Width = 396
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'Nro. Documento'
        Items.Strings = (
          'Nro. Documento'
          'Fecha'
          'Agente/Cliente/Fecha'
          'Nombre'
          'Forma de pago')
      end
      object ChkBMostrarDetalle: TLFCheckBox
        Left = 361
        Top = 18
        Width = 136
        Height = 17
        Caption = 'Mostrar detalle'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object EComentario: TLFEdit
        Left = 90
        Top = 65
        Width = 396
        Height = 21
        TabOrder = 4
      end
      object TDPFechaListado: TLFDateEdit
        Left = 90
        Top = 87
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
    end
    object GBSerie: TGroupBox [5]
      Left = 0
      Top = 371
      Width = 504
      Height = 49
      Align = alClient
      Caption = ' Serie '
      TabOrder = 6
      object LDesdeSerie: TLFLabel
        Left = 153
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
        Visible = False
      end
      object LHastaSerie: TLFLabel
        Left = 156
        Top = 40
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
        Visible = False
      end
      object CBFiltroSerie: TLFCheckBox
        Left = 42
        Top = 27
        Width = 107
        Height = 15
        Caption = 'Filtrar por series'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CBFiltroSerieClick
        Alignment = taLeftJustify
      end
      object EFSerieD: TLFEditFind2000
        Left = 189
        Top = 14
        Width = 63
        Height = 21
        TabOrder = 1
        Visible = False
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'Activo = 1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GEN_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSerieH: TLFEditFind2000
        Left = 189
        Top = 36
        Width = 63
        Height = 21
        TabOrder = 2
        Visible = False
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'Activo = 1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GEN_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBAgente: TGroupBox [6]
      Left = 0
      Top = 107
      Width = 504
      Height = 45
      Align = alTop
      Caption = 'Agente'
      TabOrder = 2
      object EFAgente: TLFEditFind2000
        Left = 43
        Top = 15
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
      object EAgente: TLFEdit
        Left = 110
        Top = 15
        Width = 380
        Height = 21
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
    end
    object GBUsuario: TGroupBox [7]
      Left = 0
      Top = 152
      Width = 504
      Height = 45
      Align = alTop
      Caption = 'Usuario Creacion'
      TabOrder = 3
      object EFUsuario: TLFEditFind2000
        Left = 43
        Top = 15
        Width = 66
        Height = 21
        TabOrder = 0
        OnChange = EFUsuarioChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'USUARIO'
        CampoStr = 'NOMBRE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_USUARIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'USUARIO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EUsuario: TLFEdit
        Left = 110
        Top = 15
        Width = 380
        Height = 21
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
    end
    inherited PBListado: TProgressBar
      Top = 420
      Width = 504
      TabOrder = 8
    end
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
