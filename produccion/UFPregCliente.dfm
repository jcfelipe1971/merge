inherited FPregCliente: TFPregCliente
  Left = 682
  Top = 260
  Caption = 'Cliente'
  ClientWidth = 491
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 491
    inherited TBMain: TLFToolBar
      Width = 491
      ParentShowHint = False
      ShowHint = True
      inherited TButtRecargar: TToolButton
        Visible = False
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLCPostal: TLFPanel
      Left = 0
      Top = 36
      Width = 491
      Height = 182
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LCliente: TLFLabel
        Left = 41
        Top = 67
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
      end
      object EFCPCliente: TLFEditFind2000
        Left = 79
        Top = 64
        Width = 70
        Height = 21
        MaxLength = 10
        TabOrder = 0
        OnChange = EFCPClienteChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = True
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
      object ETitulo: TLFEdit
        Left = 150
        Top = 64
        Width = 305
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
  end
end
