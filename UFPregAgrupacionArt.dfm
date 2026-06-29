inherited FPregAgrupacionArt: TFPregAgrupacionArt
  Left = 385
  Top = 277
  Caption = 'Listado por Agrupaci'#243'n'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    inherited TBMain: TLFToolBar
      Width = 392
      object ToolButton1: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLAgrupacion: TLFPanel
      Left = 0
      Top = 36
      Width = 392
      Height = 184
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBLAgrupacion: TLFLabel
        Left = 19
        Top = 58
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupaci'#243'n'
      end
      object EFAgrupacion: TLFEditFind2000
        Left = 78
        Top = 54
        Width = 50
        Height = 21
        TabOrder = 0
        OnChange = EFAgrupacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'AGRUPACION'
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'tipo='#39'T'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitulo: TLFDbedit
        Left = 129
        Top = 54
        Width = 229
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstArticulos.DSxAgrupacion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object RGOrden: TRadioGroup
        Left = 78
        Top = 83
        Width = 280
        Height = 59
        Caption = 'Ordenado por'
        ItemIndex = 0
        Items.Strings = (
          'C'#243'digo  Art'#237'culo'
          'Nombre Art'#237'culo')
        TabOrder = 2
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 274
    Top = 44
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
