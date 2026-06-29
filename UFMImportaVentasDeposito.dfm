inherited FMImportaVentasDeposito: TFMImportaVentasDeposito
  Left = 547
  Top = 236
  Caption = 'Generar detalle a partir de ventas en dep'#243'sito'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    object LAlmacen: TLFLabel [0]
      Left = 43
      Top = 120
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alm. Dep'#243'sito'
    end
    object LSerie1: TLFLabel [1]
      Left = 114
      Top = 51
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie 1'
    end
    object LHastaVencimiento: TLFLabel [2]
      Left = 80
      Top = 164
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LDesdeVencimiento: TLFLabel [3]
      Left = 77
      Top = 142
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LCanal1: TLFLabel [4]
      Left = 20
      Top = 51
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Canal 1'
    end
    object LCanal2: TLFLabel [5]
      Left = 20
      Top = 73
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Canal 2'
    end
    object LSerie2: TLFLabel [6]
      Left = 114
      Top = 73
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie 2'
    end
    inherited TBMain: TLFToolBar
      Width = 386
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 10
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtSep: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtAceptar: TToolButton
        Left = 33
        Top = 0
        Hint = 'Crear detalle en el documento'
        Caption = 'Crear'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
    end
    object EFAlmacen: TLFEditFind2000
      Left = 113
      Top = 116
      Width = 56
      Height = 21
      MaxLength = 3
      TabOrder = 4
      OnChange = EFAlmacenChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'ALMACEN'
        'TITULO')
      CampoADevolver = 'ALMACEN'
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMAlbaranes.EntornoDoc
    end
    object EAlmacenTit: TLFEdit
      Left = 170
      Top = 116
      Width = 162
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
    object ESerieTit1: TLFEdit
      Left = 209
      Top = 47
      Width = 162
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
      TabOrder = 8
    end
    object EFSerie1: TLFEditFind2000
      Left = 152
      Top = 47
      Width = 56
      Height = 21
      Hint = 'Primera serie a considerar'
      MaxLength = 10
      TabOrder = 1
      OnChange = EFSerie1Change
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
      OnBusqueda = EFSerie1Busqueda
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object DEFechaH: TLFDateEdit
      Left = 113
      Top = 160
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 6
    end
    object DEFechaD: TLFDateEdit
      Left = 113
      Top = 138
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 5
    end
    object EFCanal1: TLFEditFind2000
      Left = 61
      Top = 47
      Width = 33
      Height = 21
      Hint = 'Primer canal a considerar'
      MaxLength = 3
      TabOrder = 0
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CANAL'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CANAL')
      Filtros = [obEmpresa, obEjercicio, obPais]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFCanal2: TLFEditFind2000
      Left = 61
      Top = 69
      Width = 33
      Height = 21
      Hint = 'Segundo canal a considerar'
      MaxLength = 3
      TabOrder = 2
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CANAL'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CANAL')
      Filtros = [obEmpresa, obEjercicio, obPais]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFSerie2: TLFEditFind2000
      Left = 152
      Top = 69
      Width = 56
      Height = 21
      Hint = 'Segunda serie a considerar'
      MaxLength = 10
      TabOrder = 3
      OnChange = EFSerie2Change
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
      OnBusqueda = EFSerie2Busqueda
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object ESerieTit2: TLFEdit
      Left = 209
      Top = 69
      Width = 162
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
      TabOrder = 9
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
