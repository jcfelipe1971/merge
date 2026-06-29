inherited ZFMLSTVentasFamilia: TZFMLSTVentasFamilia
  Left = 340
  Top = 335
  Caption = 'Diario ventas'
  ClientHeight = 180
  ClientWidth = 445
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 445
    Height = 180
    inherited TBMain: TLFToolBar
      Width = 445
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfList
      end
    end
    object PNLLimites: TPanel
      Left = 0
      Top = 36
      Width = 445
      Height = 144
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LFechaHasta: TLFLabel
        Left = 212
        Top = 22
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Hasta'
      end
      object LSerie: TLFLabel
        Left = 50
        Top = 68
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object LFechaDesde: TLFLabel
        Left = 10
        Top = 23
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Desde'
      end
      object ESerie: TLFEdit
        Left = 138
        Top = 64
        Width = 259
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 0
      end
      object DEFechaHasta: TLFDateEdit
        Left = 277
        Top = 18
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object EFSerie: TLFEditFind2000
        Left = 78
        Top = 64
        Width = 59
        Height = 21
        TabOrder = 2
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'activo=1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GEN_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DEFechaDesde: TLFDateEdit
        Left = 78
        Top = 19
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
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
