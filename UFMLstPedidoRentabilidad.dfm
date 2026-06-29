inherited FMLstPedidoRentabilidad: TFMLstPedidoRentabilidad
  Left = 405
  Top = 310
  Caption = 'Listado Rentabilidad Pedido/Orden'
  ClientHeight = 296
  ClientWidth = 456
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 456
    Height = 296
    inherited TBMain: TLFToolBar
      Width = 456
      inherited TButtRecargar: TToolButton
        OnClick = TButtRecargarClick
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLFiltros: TLFPanel
      Left = 0
      Top = 36
      Width = 456
      Height = 260
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBFechas: TGroupBox
        Left = 0
        Top = 150
        Width = 456
        Height = 110
        Align = alClient
        Caption = 'Fechas'
        TabOrder = 0
        object LDesdeFecha: TLFLabel
          Left = 41
          Top = 22
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 44
          Top = 44
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DTPDesde: TDateEdit
          Left = 79
          Top = 18
          Width = 87
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHasta: TDateEdit
          Left = 79
          Top = 40
          Width = 87
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GBPedido: TGroupBox
        Left = 0
        Top = 0
        Width = 456
        Height = 75
        Align = alTop
        Caption = 'Pedido'
        TabOrder = 1
        object LDesdePedido: TLFLabel
          Left = 41
          Top = 22
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaPedido: TLFLabel
          Left = 44
          Top = 44
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LFPedidoD: TLFEditFind2000
          Left = 77
          Top = 18
          Width = 71
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'RIG'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CABECERAS_PEDIDO'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = LFPedidoDBusqueda
          OrdenadoPor.Strings = (
            'RIG')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object LFPedidoH: TLFEditFind2000
          Left = 77
          Top = 40
          Width = 71
          Height = 21
          TabOrder = 1
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'RIG'
          CampoStr = 'TITULO'
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
      end
      object GBCliente: TGroupBox
        Left = 0
        Top = 75
        Width = 456
        Height = 75
        Align = alTop
        Caption = 'Cliente'
        TabOrder = 2
        object LDesdeCliente: TLFLabel
          Left = 41
          Top = 22
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaCliente: TLFLabel
          Left = 44
          Top = 44
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EClienteDesde: TLFEdit
          Left = 149
          Top = 17
          Width = 220
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 1
        end
        object EClienteHasta: TLFEdit
          Left = 149
          Top = 39
          Width = 220
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 3
        end
        object LFClienteD: TLFEditFind2000
          Left = 77
          Top = 17
          Width = 71
          Height = 21
          TabOrder = 0
          OnChange = LFClienteDChange
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
        object LFClienteH: TLFEditFind2000
          Left = 77
          Top = 39
          Width = 71
          Height = 21
          TabOrder = 2
          OnChange = LFClienteHChange
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
  end
  inherited ALMain: TLFActionList
    Left = 380
    Top = 34
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
  end
end
