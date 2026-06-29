inherited FMLstArtEscandallo: TFMLstArtEscandallo
  Left = 451
  Top = 514
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Fichas del Escandallo de Art'#237'culos'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
      inherited TButtPrevisualizar: TToolButton
        Tag = 1
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 327
      Width = 592
      TabOrder = 2
    end
    object PNLMain: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 291
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LHasta: TLFLabel
        Left = 18
        Top = 127
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesde: TLFLabel
        Left = 15
        Top = 105
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EArticulo_D: TLFEdit
        Left = 160
        Top = 101
        Width = 421
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
        TabOrder = 2
      end
      object EFArt_Hasta: TLFEditFind2000
        Left = 50
        Top = 123
        Width = 109
        Height = 21
        TabOrder = 1
        OnChange = EFArt_HastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArt_HastaBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArt_Desde: TLFEditFind2000
        Left = 50
        Top = 101
        Width = 109
        Height = 21
        TabOrder = 0
        OnChange = EFArt_DesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArt_DesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticulo_H: TLFEdit
        Left = 160
        Top = 123
        Width = 421
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
        TabOrder = 3
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 368
    Top = 2
    inherited ARecargar: TAction
      OnExecute = ARecargaExecute
    end
  end
end
