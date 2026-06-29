inherited FMExportarClientes: TFMExportarClientes
  Left = 507
  Top = 304
  Caption = 'Exportar Clientes'
  ClientHeight = 285
  ClientWidth = 407
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 407
    Height = 285
    inherited TBMain: TLFToolBar
      Width = 407
      Anchors = []
      inherited TButtImprimir: TToolButton
        Visible = False
      end
      inherited TButtPrevisualizar: TToolButton
        Visible = False
      end
      object TButtExportar: TToolButton
        Left = 288
        Top = 0
        Action = AExportar
      end
    end
    object PNLMain: TLFPanel
      Left = 0
      Top = 36
      Width = 407
      Height = 249
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LProvincia: TLFLabel
        Left = 51
        Top = 68
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Provincia'
      end
      object LDesdeAgente: TLFLabel
        Left = 27
        Top = 90
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Agente'
      end
      object LHastaAgente: TLFLabel
        Left = 30
        Top = 112
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Agente'
      end
      object LRuta: TLFLabel
        Left = 72
        Top = 134
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ruta'
      end
      object LDepartamento1: TLFLabel
        Left = 18
        Top = 156
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Departamento 1'
      end
      object LDepartamento2: TLFLabel
        Left = 18
        Top = 178
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Departamento 2'
      end
      object LAgrupacion1: TLFLabel
        Left = 31
        Top = 200
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupacion 1'
      end
      object LAgrupacion2: TLFLabel
        Left = 31
        Top = 222
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupacion 2'
      end
      object LPais: TLFLabel
        Left = 75
        Top = 46
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pais'
      end
      object EFProvincia: TLFEditFind2000
        Left = 98
        Top = 64
        Width = 73
        Height = 21
        TabOrder = 2
        OnChange = EFProvinciaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROVINCIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PROVINCIAS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
      end
      object EProvincia: TLFEdit
        Left = 172
        Top = 64
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 10
      end
      object EFDesdeAgente: TLFEditFind2000
        Left = 98
        Top = 86
        Width = 73
        Height = 21
        TabOrder = 3
        OnChange = EFDesdeAgenteChange
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
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeAgente: TLFEdit
        Left = 172
        Top = 86
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 11
      end
      object EHastaAgente: TLFEdit
        Left = 172
        Top = 108
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 12
      end
      object EFHastaAgente: TLFEditFind2000
        Left = 98
        Top = 108
        Width = 73
        Height = 21
        TabOrder = 4
        OnChange = EFHastaAgenteChange
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
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDepartamento1: TLFEditFind2000
        Left = 98
        Top = 152
        Width = 73
        Height = 21
        TabOrder = 6
        OnChange = EFDepartamento1Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'DEPARTAMENTO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_DEPARTAMENTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEPARTAMENTO')
        Filtros = []
      end
      object EFDepartamento2: TLFEditFind2000
        Left = 98
        Top = 174
        Width = 73
        Height = 21
        TabOrder = 7
        OnChange = EFDepartamento2Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'DEPARTAMENTO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_DEPARTAMENTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEPARTAMENTO')
        Filtros = []
      end
      object EDepartamento1: TLFEdit
        Left = 172
        Top = 152
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 13
      end
      object EDepartamento2: TLFEdit
        Left = 172
        Top = 174
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 14
      end
      object EFAgrupacion1: TLFEditFind2000
        Left = 98
        Top = 196
        Width = 73
        Height = 21
        TabOrder = 8
        OnChange = EFAgrupacion1Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO = '#39'C'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
        Filtros = []
      end
      object EFAgrupacion2: TLFEditFind2000
        Left = 98
        Top = 218
        Width = 73
        Height = 21
        TabOrder = 9
        OnChange = EFAgrupacion2Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO = '#39'C'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
        Filtros = []
      end
      object EAgrupacion1: TLFEdit
        Left = 172
        Top = 196
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 15
      end
      object EAgrupacion2: TLFEdit
        Left = 172
        Top = 218
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 16
      end
      object EFPais: TLFEditFind2000
        Left = 98
        Top = 42
        Width = 73
        Height = 21
        TabOrder = 1
        OnChange = EFPaisChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PAIS'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PAISES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PAIS')
        Filtros = []
      end
      object EPais: TLFEdit
        Left = 172
        Top = 42
        Width = 214
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 17
      end
      object RGTipo: TRadioGroup
        Left = 0
        Top = 0
        Width = 407
        Height = 40
        Align = alTop
        Caption = 'Tipo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Clientes'
          'Clientes Potenciales')
        TabOrder = 0
        OnClick = RGTipoClick
      end
      object ERuta: TLFEdit
        Left = 98
        Top = 130
        Width = 73
        Height = 21
        TabOrder = 5
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 284
    Top = 86
    inherited ARecargar: TAction [1]
      OnExecute = ARecargarExecute
    end
    inherited APrev: TAction [2]
    end
    inherited AConfigurar: TAction [3]
    end
    inherited ASalir: TAction [4]
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 
      'Coma Separated Values|*.csv|Excel Files|*.xls|Fichero de Texto|*' +
      '.txt'
    Title = 'Exportaci'#243'n de Clientes'
    Left = 216
    Top = 96
  end
end
