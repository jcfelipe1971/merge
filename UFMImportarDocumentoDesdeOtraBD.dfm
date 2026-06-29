inherited FMImportarDocumentoDesdeOtraBD: TFMImportarDocumentoDesdeOtraBD
  Left = 239
  Top = 150
  Width = 555
  Height = 407
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importar Documento Desde Otra BD'
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 545
    Height = 354
    inherited TBMain: TLFToolBar
      Width = 541
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PNLDatos: TLFPanel
      Left = 2
      Top = 28
      Width = 541
      Height = 324
      Align = alClient
      TabOrder = 1
      object GBOrigen: TGroupBox
        Left = 1
        Top = 38
        Width = 539
        Height = 223
        Align = alClient
        Caption = 'Origen'
        TabOrder = 0
        DesignSize = (
          539
          223)
        object LOrigEmpresa: TLFLabel
          Left = 27
          Top = 20
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Empresa'
        end
        object LOrigEjercicio: TLFLabel
          Left = 28
          Top = 42
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ejercicio'
        end
        object LOrigCanal: TLFLabel
          Left = 41
          Top = 64
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal'
        end
        object LOrigSerie: TLFLabel
          Left = 44
          Top = 86
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object LOrigTipo: TLFLabel
          Left = 47
          Top = 108
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo'
        end
        object LOrigRIG: TLFLabel
          Left = 49
          Top = 130
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = 'RIG'
        end
        object EFOrigEmpresa: TLFEditFind2000
          Left = 72
          Top = 16
          Width = 87
          Height = 21
          TabOrder = 0
          OnChange = ONEFOrigChange
          Base_de_datos = DMSincronizacionKri.DataBase
          Transaction = DMSincronizacionKri.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EMPRESA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_EMPRESAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPRESA')
          Filtros = []
        end
        object EFOrigEjercicio: TLFEditFind2000
          Left = 72
          Top = 38
          Width = 87
          Height = 21
          TabOrder = 1
          OnChange = ONEFOrigChange
          Base_de_datos = DMSincronizacionKri.DataBase
          Transaction = DMSincronizacionKri.TLocal
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
          OnBusqueda = EFOrigEjercicioBusqueda
          OrdenadoPor.Strings = (
            'EJERCICIO')
          Filtros = []
        end
        object EFOrigCanal: TLFEditFind2000
          Left = 72
          Top = 60
          Width = 87
          Height = 21
          TabOrder = 2
          OnChange = ONEFOrigChange
          Base_de_datos = DMSincronizacionKri.DataBase
          Transaction = DMSincronizacionKri.TLocal
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
          OnBusqueda = EFOrigCanalBusqueda
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = []
        end
        object EFOrigSerie: TLFEditFind2000
          Left = 72
          Top = 82
          Width = 87
          Height = 21
          TabOrder = 3
          OnChange = ONEFOrigChange
          Base_de_datos = DMSincronizacionKri.DataBase
          Transaction = DMSincronizacionKri.TLocal
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
          OnBusqueda = EFOrigSerieBusqueda
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = []
        end
        object EFOrigTipo: TLFEditFind2000
          Left = 72
          Top = 104
          Width = 87
          Height = 21
          TabOrder = 4
          OnChange = ONEFOrigChange
          Base_de_datos = DMSincronizacionKri.DataBase
          Transaction = DMSincronizacionKri.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO IN ('#39'OFC'#39', '#39'PEC'#39', '#39'ALB'#39', '#39'FAC'#39')'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_TIPO_MOVIMIENTO'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TIPO')
          Filtros = []
        end
        object EFOrigRIG: TLFEditFind2000
          Left = 72
          Top = 126
          Width = 87
          Height = 21
          TabOrder = 5
          OnChange = ONEFOrigChange
          Base_de_datos = DMSincronizacionKri.DataBase
          Transaction = DMSincronizacionKri.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'RIG'
          CampoStr = 'SU_REFERENCIA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_CABECERAS_S'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFOrigRIGBusqueda
          OrdenadoPor.Strings = (
            'RIG')
          Filtros = []
        end
        object MDatosDocumento: TLFMemo
          Left = 166
          Top = 16
          Width = 364
          Height = 196
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
      object GBDestino: TGroupBox
        Left = 1
        Top = 261
        Width = 539
        Height = 62
        Align = alBottom
        Caption = 'Destino'
        TabOrder = 1
        DesignSize = (
          539
          62)
        object LDestCliente: TLFLabel
          Left = 36
          Top = 17
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object LDestSerie: TLFLabel
          Left = 44
          Top = 39
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object EFDestCliente: TLFEditFind2000
          Left = 72
          Top = 13
          Width = 87
          Height = 21
          TabOrder = 0
          OnChange = EFDestClienteChange
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
        object EDestCliente: TLFEdit
          Left = 160
          Top = 13
          Width = 370
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
        object EFDestSerie: TLFEditFind2000
          Left = 72
          Top = 35
          Width = 87
          Height = 21
          TabOrder = 2
          OnChange = EFDestSerieChange
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
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EDestSerie: TLFEdit
          Left = 160
          Top = 35
          Width = 370
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
      end
      object GBBaseDeDatos: TGroupBox
        Left = 1
        Top = 1
        Width = 539
        Height = 37
        Align = alTop
        Caption = 'Base de Datos'
        TabOrder = 2
        object LBaseDeDatos: TLFLabel
          Left = 2
          Top = 15
          Width = 535
          Height = 20
          Align = alClient
          Caption = 'Base de Datos'
          Layout = tlCenter
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 354
    Width = 545
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
    end
    object AImportar: TAction
      Category = 'Procesos'
      Caption = 'Importar'
      Hint = 'Importar el documento en la empresa/ejercicio/canal actual'
      OnExecute = AImportarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EDestCliente.Text'
      'EFDestCliente.Text'
      'EFOrigEmpresa.Text'
      'EFOrigEjercicio.Text'
      'EFOrigCanal.Text'
      'EFOrigSerie.Text'
      'EFOrigTipo.Text'
      'EFOrigRIG.Text')
  end
end
