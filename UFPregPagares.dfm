inherited FPregPagares: TFPregPagares
  Left = 466
  Top = 239
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Pagar'#233's'
  ClientHeight = 110
  ClientWidth = 497
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 497
    Height = 110
    object LblPagareDesde: TLFLabel [0]
      Left = 15
      Top = 56
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Pagar'#233
    end
    object LBLPagareHasta: TLFLabel [1]
      Left = 18
      Top = 80
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Pagar'#233
    end
    inherited TBMain: TLFToolBar
      Width = 497
      ButtonWidth = 61
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      inherited TButtImprimir: TToolButton
        Left = 61
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 122
      end
      inherited TButtSalir: TToolButton
        Left = 183
      end
      object TBButtConfigurar: TToolButton
        Left = 244
        Top = 0
        Action = AConfigurar
      end
    end
    object EFPagare_Hasta: TLFEditFind2000
      Left = 90
      Top = 76
      Width = 108
      Height = 21
      TabOrder = 1
      OnChange = EFpagare_HastaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PAGARE'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PAGARES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PAGARE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EPagareDesde: TLFEdit
      Left = 199
      Top = 52
      Width = 290
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
    object EPagareHasta: TLFEdit
      Left = 199
      Top = 76
      Width = 290
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
    object EFPagare_desde: TLFEditFind2000
      Left = 90
      Top = 52
      Width = 108
      Height = 21
      TabOrder = 0
      OnChange = EFPagare_DesdeChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PAGARE'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PAGARES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PAGARE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  inherited ALMain: TLFActionList
    Left = 320
    Top = 2
    inherited AImprimir: TAction
      Hint = 'Imprimir'
    end
    inherited APrev: TAction
      Caption = '&Visualizar'
      Hint = 'Visualizar'
      ImageIndex = 19
    end
    inherited ASalir: TAction
      Hint = 'Salir'
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
