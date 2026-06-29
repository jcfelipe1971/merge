inherited FMHerenciaManual: TFMHerenciaManual
  Caption = 'Herencia Manual'
  ClientHeight = 327
  ClientWidth = 694
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 694
    Height = 303
    inherited TBMain: TLFToolBar
      Width = 690
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBAsociar: TToolButton
        Left = 33
        Top = 0
        Caption = 'TBAsociar'
        ImageIndex = 25
        OnClick = TBAsociarClick
      end
    end
    object PNLOrigen: TLFPanel
      Left = 2
      Top = 28
      Width = 690
      Height = 59
      Align = alTop
      TabOrder = 1
      object LSepSerie: TLFLabel
        Left = 285
        Top = 12
        Width = 5
        Height = 13
        Alignment = taRightJustify
        Caption = '/'
      end
      object LLineaOrigen: TLFLabel
        Left = 419
        Top = 11
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Linea'
      end
      object LDocumento: TLFLabel
        Left = 21
        Top = 12
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Documento'
      end
      object LArticulo: TLFLabel
        Left = 40
        Top = 33
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Articulo'
      end
      object DBEEjercicio: TLFDbedit
        Left = 141
        Top = 8
        Width = 60
        Height = 21
        Color = clInfoBk
        DataField = 'EJERCICIO'
        DataSource = DMHerenciaManual.DSDetalle
        Enabled = False
        TabOrder = 0
      end
      object DBESerie: TLFDbedit
        Left = 202
        Top = 8
        Width = 81
        Height = 21
        Color = clInfoBk
        DataField = 'SERIE'
        DataSource = DMHerenciaManual.DSDetalle
        Enabled = False
        TabOrder = 1
      end
      object DBETipo: TLFDbedit
        Left = 80
        Top = 8
        Width = 60
        Height = 21
        Color = clInfoBk
        DataField = 'TIPO'
        DataSource = DMHerenciaManual.DSDetalle
        Enabled = False
        TabOrder = 2
      end
      object DBERIG: TLFDbedit
        Left = 292
        Top = 8
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'RIG'
        DataSource = DMHerenciaManual.DSDetalle
        Enabled = False
        TabOrder = 3
      end
      object DBELinea: TLFDbedit
        Left = 450
        Top = 8
        Width = 60
        Height = 21
        Color = clInfoBk
        DataField = 'LINEA'
        DataSource = DMHerenciaManual.DSDetalle
        Enabled = False
        TabOrder = 4
      end
      object DBEArticulo: TLFDbedit
        Left = 80
        Top = 30
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = DMHerenciaManual.DSDetalle
        Enabled = False
        TabOrder = 5
      end
      object DBETitulo: TLFDbedit
        Left = 202
        Top = 30
        Width = 471
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMHerenciaManual.DSDetalle
        Enabled = False
        TabOrder = 6
      end
    end
    object PNLSeleccionDestino: TLFPanel
      Left = 2
      Top = 87
      Width = 690
      Height = 155
      Align = alClient
      TabOrder = 2
      object LEjercicio: TLFLabel
        Left = 35
        Top = 15
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
      end
      object LCanal: TLFLabel
        Left = 48
        Top = 37
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Canal'
      end
      object LSerie: TLFLabel
        Left = 51
        Top = 59
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object LTipo: TLFLabel
        Left = 54
        Top = 81
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo'
      end
      object LNroDocumento: TLFLabel
        Left = 29
        Top = 103
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nro. Doc.'
      end
      object LLinea: TLFLabel
        Left = 49
        Top = 125
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Linea'
      end
      object LAdvertencia: TLFLabel
        Left = 208
        Top = 80
        Width = 369
        Height = 13
        Caption = 
          'Esta seguro de que el *destino* de esta linea es un tipo de docu' +
          'mento previo?'
      end
      object LHintReemplazar: TLFLabel
        Left = 522
        Top = 35
        Width = 151
        Height = 46
        Hint = 'Agrega el articulo al documento destino'
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'Agrega la linea al documento destino minorando el art. destino'
        Visible = False
        WordWrap = True
      end
      object EFEjercicio: TLFEditFind2000
        Left = 80
        Top = 11
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = DatosDestinoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'EJERCICIO'
        CampoStr = 'APERTURA'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_EJERCICIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'EJERCICIO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCanal: TLFEditFind2000
        Left = 80
        Top = 33
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = DatosDestinoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CANAL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCanalBusqueda
        OrdenadoPor.Strings = (
          'CANAL')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSerie: TLFEditFind2000
        Left = 80
        Top = 55
        Width = 121
        Height = 21
        TabOrder = 2
        OnChange = DatosDestinoChange
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
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFSerieBusqueda
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTipo: TLFEditFind2000
        Left = 80
        Top = 77
        Width = 121
        Height = 21
        TabOrder = 3
        OnChange = DatosDestinoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 
          'TIPO IN ('#39'OFC'#39', '#39'PEC'#39', '#39'ALB'#39', '#39'FAC'#39', '#39'OFP'#39', '#39'OCP'#39', '#39'PEP'#39', '#39'ALP'#39',' +
          ' '#39'FAP'#39')'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TIPO_MOVIMIENTO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFNroDocumento: TLFEditFind2000
        Left = 80
        Top = 99
        Width = 121
        Height = 21
        TabOrder = 4
        OnChange = DatosDestinoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'RIG'
        CampoStr = 'FECHA'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_S'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFNroDocumentoBusqueda
        OrdenadoPor.Strings = (
          'RIG')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFLinea: TLFEditFind2000
        Left = 80
        Top = 121
        Width = 121
        Height = 21
        TabOrder = 5
        OnChange = DatosDestinoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'LINEA'
        CampoStr = 'ARTICULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_DETALLES_S'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFLineaBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object BReempazar: TButton
        Left = 522
        Top = 8
        Width = 151
        Height = 25
        Hint = 'Agrega el articulo al documento destino'
        Anchors = [akTop, akRight]
        Caption = 'Reemplazar'
        TabOrder = 6
        Visible = False
        OnClick = BReempazarClick
      end
    end
    object PNLDestino: TLFPanel
      Left = 2
      Top = 242
      Width = 690
      Height = 59
      Align = alBottom
      TabOrder = 3
      object LSepSerieDestino: TLFLabel
        Left = 285
        Top = 12
        Width = 5
        Height = 13
        Alignment = taRightJustify
        Caption = '/'
      end
      object LLineaDestino: TLFLabel
        Left = 419
        Top = 11
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Linea'
      end
      object LDocumentoDestino: TLFLabel
        Left = 21
        Top = 12
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Documento'
      end
      object LArticuloDestino: TLFLabel
        Left = 40
        Top = 33
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Articulo'
      end
      object DBEEjercicioDestino: TLFDbedit
        Left = 141
        Top = 8
        Width = 60
        Height = 21
        Color = clInfoBk
        DataField = 'EJERCICIO'
        DataSource = DMHerenciaManual.DSQMDetalleDestino
        Enabled = False
        TabOrder = 0
      end
      object DBESerieDestino: TLFDbedit
        Left = 202
        Top = 8
        Width = 81
        Height = 21
        Color = clInfoBk
        DataField = 'SERIE'
        DataSource = DMHerenciaManual.DSQMDetalleDestino
        Enabled = False
        TabOrder = 1
      end
      object DBETipoDestino: TLFDbedit
        Left = 80
        Top = 8
        Width = 60
        Height = 21
        Color = clInfoBk
        DataField = 'TIPO'
        DataSource = DMHerenciaManual.DSQMDetalleDestino
        Enabled = False
        TabOrder = 2
      end
      object DBERIGDestino: TLFDbedit
        Left = 292
        Top = 8
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'RIG'
        DataSource = DMHerenciaManual.DSQMDetalleDestino
        Enabled = False
        TabOrder = 3
      end
      object DBELineaDestino: TLFDbedit
        Left = 450
        Top = 8
        Width = 60
        Height = 21
        Color = clInfoBk
        DataField = 'LINEA'
        DataSource = DMHerenciaManual.DSQMDetalleDestino
        Enabled = False
        TabOrder = 4
      end
      object DBEArticuloDestino: TLFDbedit
        Left = 80
        Top = 30
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = DMHerenciaManual.DSQMDetalleDestino
        Enabled = False
        TabOrder = 5
      end
      object DBETituloDestino: TLFDbedit
        Left = 202
        Top = 30
        Width = 471
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMHerenciaManual.DSQMDetalleDestino
        Enabled = False
        TabOrder = 6
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 303
    Width = 694
  end
  inherited CEMain: TControlEdit
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 0
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Top = 0
  end
end
