inherited FPregArticulos: TFPregArticulos
  Left = 392
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Art'#237'culos'
  ClientHeight = 289
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 289
    object LDesde: TLFLabel [0]
      Left = 6
      Top = 70
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LHasta: TLFLabel [1]
      Left = 9
      Top = 92
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    inherited TBMain: TLFToolBar
      Width = 504
      ButtonWidth = 75
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      inherited TButtImprimir: TToolButton
        Left = 75
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 150
        OnClick = nil
      end
      inherited TButtSalir: TToolButton
        Left = 225
      end
      object TButtConfRapida: TToolButton
        Left = 300
        Top = 0
        Action = AConfigurar
        Caption = '&Conf. R'#225'pida'
      end
    end
    object EFArt_Desde: TLFEditFind2000
      Left = 40
      Top = 66
      Width = 104
      Height = 21
      TabOrder = 0
      OnChange = EFArt_DesdeChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = True
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArt_DesdeBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArt_Hasta: TLFEditFind2000
      Left = 40
      Top = 88
      Width = 104
      Height = 21
      TabOrder = 1
      OnChange = EFArt_HastaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArt_HastaBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEArticuloDesde: TLFDbedit
      Left = 145
      Top = 66
      Width = 352
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstTarifas.DSxArt_Desde
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
    object DBEArticuloHasta: TLFDbedit
      Left = 145
      Top = 88
      Width = 352
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstTarifas.DSxArt_Hasta
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
    object ChkBOrden: TLFCheckBox
      Left = 48
      Top = 118
      Width = 300
      Height = 17
      Caption = 'Ordenar por T'#237'tulo de Art'#237'culo'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
    object ChkBVender: TLFCheckBox
      Left = 48
      Top = 138
      Width = 300
      Height = 17
      Caption = 'Mostrar Art'#237'culos sin Disponibilidad para Vender'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBArticulosBaja: TLFCheckBox
      Left = 48
      Top = 158
      Width = 300
      Height = 18
      Caption = 'Incluir Articulos de Baja'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 7
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited ALMain: TLFActionList
    Left = 406
    Top = 30
    inherited AImprimir: TAction
      Hint = 'Imprimir'
    end
    inherited APrev: TAction
      Hint = 'Visualizar'
      ImageIndex = 19
    end
    inherited ASalir: TAction
      Hint = 'Salir'
    end
    inherited ARecargar: TAction
      ImageIndex = 39
      OnExecute = ARecargarExecute
    end
    inherited AConfigurar: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
    end
  end
end
