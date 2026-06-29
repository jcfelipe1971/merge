inherited FMLstArticulosCliente: TFMLstArticulosCliente
  Left = 393
  Top = 426
  Caption = 'Articulos por cliente'
  ClientHeight = 236
  ClientWidth = 443
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 443
    Height = 236
    object LDesdeCliente: TLFLabel [0]
      Left = 10
      Top = 48
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Cliente'
    end
    object LHastaCliente: TLFLabel [1]
      Left = 13
      Top = 71
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Cliente'
    end
    inherited TBMain: TLFToolBar
      Width = 443
      object ToolButtonConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object EHastaCliente: TLFEdit
      Left = 154
      Top = 67
      Width = 271
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
    object EFDesdeCliente: TLFEditFind2000
      Left = 80
      Top = 45
      Width = 73
      Height = 21
      TabOrder = 2
      OnChange = EFDesdeClienteChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        '')
      CampoNum = 'CLIENTE'
      CampoStr = 'NOMBRE_COMERCIAL'
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
    object EFHastaCliente: TLFEditFind2000
      Left = 80
      Top = 67
      Width = 73
      Height = 21
      TabOrder = 3
      OnChange = EFHastaClienteChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'NOMBRE_COMERCIAL'
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
    object EDesdeCliente: TLFEdit
      Left = 154
      Top = 45
      Width = 271
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
      TabOrder = 5
    end
    object CBMargen: TLFCheckBox
      Left = 80
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Listar Margen'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
