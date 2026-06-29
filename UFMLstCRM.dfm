inherited FMLstCRM: TFMLstCRM
  Caption = 'FMLstCRM'
  ClientWidth = 393
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 393
    object LHastaFecha: TLFLabel [0]
      Left = 100
      Top = 153
      Width = 61
      Height = 13
      Caption = 'Hasta Fecha'
    end
    object LHastaCliente: TLFLabel [1]
      Left = 100
      Top = 105
      Width = 63
      Height = 13
      Caption = 'Hasta Cliente'
    end
    object LDesdeFecha: TLFLabel [2]
      Left = 100
      Top = 129
      Width = 64
      Height = 13
      Caption = 'Desde Fecha'
    end
    object LDesdeCliente: TLFLabel [3]
      Left = 100
      Top = 81
      Width = 66
      Height = 13
      Caption = 'Desde Cliente'
    end
    inherited TBMain: TLFToolBar
      Width = 393
      ButtonWidth = 78
      inherited TButtImprimir: TToolButton
        Left = 78
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 156
      end
      inherited TButtSalir: TToolButton
        Left = 234
      end
      object ToolButton1: TToolButton
        Left = 312
        Top = 0
        Action = AConfiguracion
      end
    end
    object EFHastaCliente: TLFEditFind2000
      Left = 172
      Top = 101
      Width = 121
      Height = 21
      TabOrder = 1
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFDesdeCliente: TLFEditFind2000
      Left = 172
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 2
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DEHastaFecha: TLFDateEdit
      Left = 172
      Top = 149
      Width = 121
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
    end
    object DEDesdeFecha: TLFDateEdit
      Left = 172
      Top = 125
      Width = 121
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
  end
  inherited ALMain: TLFActionList
    Left = 364
    Top = 46
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    object AConfiguracion: TAction
      Caption = '&Configuracion'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfiguracionExecute
    end
  end
end
