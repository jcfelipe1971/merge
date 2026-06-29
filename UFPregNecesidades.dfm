inherited FPregNecesidades: TFPregNecesidades
  Left = 387
  Top = 480
  HelpContext = 280
  ActiveControl = EFSerieKRI
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Necesidades'
  ClientHeight = 255
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 255
    object LBLOrden: TLFLabel [0]
      Left = 13
      Top = 98
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Orden Prod.'
    end
    object LBLArticulo: TLFLabel [1]
      Left = 33
      Top = 120
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo'
    end
    object LBLCantidad: TLFLabel [2]
      Left = 28
      Top = 142
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object LSerieKri: TLFLabel [3]
      Left = 44
      Top = 74
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    inherited TBMain: TLFToolBar
      Width = 592
      TabOrder = 6
      inherited TButtRecargar: TToolButton
        Visible = False
      end
      object TButtConf: TToolButton
        Left = 288
        Top = 0
        Action = AConfiguracion
      end
    end
    object CHKExplosion: TLFCheckBox
      Left = 77
      Top = 164
      Width = 97
      Height = 17
      Caption = 'Explosi'#243'n'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
    object EFOrdenProduccion: TLFEditFind2000
      Left = 77
      Top = 94
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
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArticulo: TLFEditFind2000
      Left = 77
      Top = 116
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
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EDTCantidad: TLFEdit
      Left = 77
      Top = 138
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object DBETitArticulo: TLFDbedit
      Left = 199
      Top = 116
      Width = 386
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
    object EFSerieKRI: TLFEditFind2000
      Left = 77
      Top = 71
      Width = 121
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
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  inherited ALMain: TLFActionList
    Left = 296
    Top = 42
    object AConfiguracion: TAction
      Caption = '&Configurar'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
  end
end
