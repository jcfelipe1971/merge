inherited ZFMLstPreciosModelo: TZFMLstPreciosModelo
  Left = 630
  Top = 228
  Caption = 'Listado de Precios por Modelo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
      end
    end
    object PNLLimites: TPanel
      Left = 0
      Top = 36
      Width = 369
      Height = 182
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LblTipoLona: TLFLabel
        Left = 22
        Top = 72
        Width = 63
        Height = 13
        Caption = 'Tipo de Lona'
      end
      object LblModelo: TLFLabel
        Left = 50
        Top = 50
        Width = 35
        Height = 13
        Caption = 'Modelo'
      end
      object DBEDescTipoLona: TLFDbedit
        Left = 126
        Top = 68
        Width = 181
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ZDMLstPreciosModelo.DSxTipoLona
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EFTipoLona: TLFEditFind2000
        Left = 89
        Top = 68
        Width = 36
        Height = 21
        TabOrder = 1
        OnChange = EFTipoLonaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CODIGO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'Z_SYS_LONAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CODIGO')
        Filtros = []
      end
      object DBEDescModelo: TLFDbedit
        Left = 126
        Top = 46
        Width = 181
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ZDMLstPreciosModelo.DSxModelo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object EFModelo: TLFEditFind2000
        Left = 89
        Top = 46
        Width = 36
        Height = 21
        TabOrder = 3
        OnChange = EFModeloChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CODIGO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'Z_SYS_MODELOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CODIGO')
        Filtros = []
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
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
