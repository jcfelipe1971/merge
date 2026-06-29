inherited FMLoteSimpleCreaRango: TFMLoteSimpleCreaRango
  Caption = 'Lote Simple - Crea Rango'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    object LLoteDesde: TLFLabel [0]
      Left = 9
      Top = 69
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lote Desde'
    end
    object LFamilia: TLFLabel [1]
      Left = 32
      Top = 169
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Familia'
    end
    object LArticulo: TLFLabel [2]
      Left = 29
      Top = 191
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object LLoteHasta: TLFLabel [3]
      Left = 12
      Top = 91
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lote Hasta'
    end
    object LFLabel1: TLFLabel [4]
      Left = 35
      Top = 47
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prefijo'
    end
    object LLongitud: TLFLabel [5]
      Left = 198
      Top = 80
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Longitud'
    end
    object LEjemploDesde: TLFLabel [6]
      Left = 290
      Top = 69
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ejemplo'
    end
    object LEjemploHasta: TLFLabel [7]
      Left = 290
      Top = 92
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ejemplo'
    end
    inherited TBMain: TLFToolBar
      TabOrder = 11
      inherited EPMain: THYMEditPanel
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object ELoteDesde: TLFEdit
      Left = 68
      Top = 66
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = ELoteDesdeChange
    end
    object EFFamilia: TLFEditFind2000
      Left = 68
      Top = 166
      Width = 59
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'FAMILIA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_FAMILIAS                   '
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'FAMILIA')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETitFamilia: TLFEdit
      Left = 128
      Top = 166
      Width = 345
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Constraints.MinWidth = 345
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object EFArticulo: TLFEditFind2000
      Left = 68
      Top = 188
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
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
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETitArticulo: TLFEdit
      Left = 190
      Top = 188
      Width = 283
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Constraints.MinWidth = 283
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object ELoteHasta: TLFEdit
      Left = 68
      Top = 88
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = ELoteHastaChange
    end
    object BCrearLotes: TButton
      Left = 212
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Crear Lotes'
      TabOrder = 10
      OnClick = BCrearLotesClick
    end
    object EPrefijo: TLFEdit
      Left = 68
      Top = 44
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EPrefijoChange
    end
    object ELongitud: TLFEdit
      Left = 243
      Top = 77
      Width = 37
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnChange = ELongitudChange
    end
    object EEjemploDesde: TLFEdit
      Left = 331
      Top = 65
      Width = 142
      Height = 22
      CharCase = ecUpperCase
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EEjemploHasta: TLFEdit
      Left = 331
      Top = 88
      Width = 142
      Height = 22
      CharCase = ecUpperCase
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  inherited CEMain: TControlEdit
    Left = 288
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 328
    Top = 0
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Top = 0
  end
end
