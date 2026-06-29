inherited ZFMLSTDiarioVentas: TZFMLSTDiarioVentas
  Caption = 'Diario ventas'
  ClientWidth = 377
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 377
    inherited TBMain: TLFToolBar
      Width = 377
      object ToolButton1: TToolButton
        Left = 288
        Top = 0
        Action = AConfList
      end
    end
    object PNLLimites: TPanel
      Left = 0
      Top = 36
      Width = 377
      Height = 182
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LTienda: TLFLabel
        Left = 27
        Top = 68
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tienda'
      end
      object LFecha: TLFLabel
        Left = 30
        Top = 47
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object DEFecha: TLFDateEdit
        Left = 64
        Top = 42
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object EFSerie: TLFEditFind2000
        Left = 64
        Top = 64
        Width = 72
        Height = 21
        TabOrder = 1
        OnChange = EFSerieChange
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
        Tabla_a_buscar = 'VER_CANALES_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ESerie: TLFEdit
        Left = 137
        Top = 64
        Width = 224
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        TabOrder = 2
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 316
    Top = 46
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfList: TAction
      Caption = 'Configurar'
      Hint = 'Configurar'
      ImageIndex = 77
      OnExecute = AConfListExecute
    end
  end
end
