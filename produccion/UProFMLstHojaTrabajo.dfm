inherited ProFMLstHojaTrabajo: TProFMLstHojaTrabajo
  Left = 278
  Top = 224
  Caption = 'Listado de Hojas de Trabajo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    object PanelCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 241
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LDesdeNroPedido: TLFLabel
        Left = 20
        Top = 31
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde N'#186' Pedido'
      end
      object LHastaNroPedido: TLFLabel
        Left = 23
        Top = 54
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta N'#186' Pedido'
      end
      object LDesdeCliente: TLFLabel
        Left = 36
        Top = 112
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Cliente'
      end
      object LHastaCliente: TLFLabel
        Left = 39
        Top = 133
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Cliente'
      end
      object DBEPedidoRefD: TLFDbedit
        Left = 175
        Top = 28
        Width = 318
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'FECHA'
        DataSource = ProDMLstHojaTrabajo.DSxPedidoD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEPedidoRefH: TLFDbedit
        Left = 175
        Top = 50
        Width = 318
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'FECHA'
        DataSource = ProDMLstHojaTrabajo.DSxPedidoH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EFPedidoD: TLFEditFind2000
        Left = 107
        Top = 28
        Width = 67
        Height = 21
        TabOrder = 0
        OnChange = EFPedidoDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'RIG'
        CampoStr = 'SU_REFERENCIA'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CABECERAS_PEDIDO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'RIG')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEDescClienteD: TLFDbedit
        Left = 175
        Top = 108
        Width = 318
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMLstHojaTrabajo.DSxClienteD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEDescClienteH: TLFDbedit
        Left = 175
        Top = 130
        Width = 318
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMLstHojaTrabajo.DSxClienteH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object EFClienteD: TLFEditFind2000
        Left = 107
        Top = 108
        Width = 67
        Height = 21
        TabOrder = 2
        OnChange = EFClienteDChange
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
      object EFPedidoH: TLFEditFind2000
        Left = 107
        Top = 50
        Width = 67
        Height = 21
        TabOrder = 1
        OnChange = EFPedidoHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'RIG'
        CampoStr = 'SU_REFERENCIA'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CABECERAS_PEDIDO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'RIG')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFClienteH: TLFEditFind2000
        Left = 107
        Top = 130
        Width = 67
        Height = 21
        TabOrder = 3
        OnChange = EFClienteHChange
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
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 42
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
