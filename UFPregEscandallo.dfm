inherited FPregEscandallo: TFPregEscandallo
  Left = 341
  Top = 318
  ActiveControl = EFEscandallo
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Escandallo'
  ClientHeight = 260
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 260
    object LBLEscandallo: TLFLabel [0]
      Left = 17
      Top = 77
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Escandallo'
    end
    object LBLArticulo: TLFLabel [1]
      Left = 32
      Top = 55
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo'
    end
    object LBLCantidad: TLFLabel [2]
      Left = 27
      Top = 99
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    inherited TBMain: TLFToolBar
      Width = 592
      TabOrder = 8
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
      Left = 76
      Top = 133
      Width = 97
      Height = 17
      Caption = 'Explosi'#243'n'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
    object EFEscandallo: TLFEditFind2000
      Left = 76
      Top = 73
      Width = 121
      Height = 21
      TabOrder = 0
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'NUMERO'
      CampoStr = 'ARTICULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS_ESC_PRODUCCION'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFEscandalloBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArticulo: TLFEditFind2000
      Left = 76
      Top = 51
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
      Tabla_a_buscar = 'VER_ARTICULOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloBusqueda
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EDTCantidad: TLFEdit
      Left = 76
      Top = 95
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object DBETitArticulo: TLFDbedit
      Left = 198
      Top = 51
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
    object CBValorado: TLFCheckBox
      Left = 172
      Top = 133
      Width = 97
      Height = 17
      Caption = 'Valorado'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBTodos: TLFCheckBox
      Left = 278
      Top = 133
      Width = 156
      Height = 17
      Caption = 'Todos los Escandallos'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 6
      TabStop = True
      Alignment = taLeftJustify
    end
    object RGOrden: TRadioGroup
      Left = 72
      Top = 162
      Width = 449
      Height = 74
      Caption = 'Orden'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Entrada'
        'Hijo'
        'Ubicaci'#243'n')
      TabOrder = 7
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
