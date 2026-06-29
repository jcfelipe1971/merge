inherited FPregOrdenEsc: TFPregOrdenEsc
  Left = 433
  Top = 407
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Escandallo de Orden'
  ClientHeight = 343
  ClientWidth = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
      inherited TButtRecargar: TToolButton
        Visible = False
      end
      object TButtConf: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 592
      Height = 307
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 307
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LBLOrden: TLFLabel
        Left = 6
        Top = 106
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Orden Prod.'
      end
      object LBLArticulo: TLFLabel
        Left = 26
        Top = 129
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo'
      end
      object LSerieKri: TLFLabel
        Left = 212
        Top = 19
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object CHKExplosion: TLFCheckBox
        Left = 70
        Top = 152
        Width = 97
        Height = 17
        Caption = 'Explosi'#243'n'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object EFOrdenProduccion: TLFEditFind2000
        Left = 70
        Top = 104
        Width = 121
        Height = 21
        TabOrder = 5
        OnChange = EFOrdenProduccionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NORDEN'
        CampoStr = 'NORDEN'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ORDENES_PRODUCCION'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NORDEN')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArticulo: TLFEditFind2000
        Left = 70
        Top = 126
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = EFArticuloChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitArticulo: TLFDbedit
        Left = 192
        Top = 126
        Width = 392
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstNecesidades.DSxArt
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
      object CBValorado: TLFCheckBox
        Left = 188
        Top = 152
        Width = 97
        Height = 17
        Caption = 'Valorado'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
      object EFSerieKRI: TLFEditFind2000
        Left = 245
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 0
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
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 266
    Top = 64
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
  end
end
