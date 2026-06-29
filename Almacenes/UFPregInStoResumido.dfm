inherited FPregInStoResumido: TFPregInStoResumido
  Left = 744
  Top = 187
  HelpContext = 140
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado resumido de Inventario de Stocks'
  ClientHeight = 424
  ClientWidth = 592
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 424
    inherited TBMain: TLFToolBar
      Width = 592
      ButtonWidth = 85
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtImprimir: TToolButton
        Left = 85
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 170
      end
      inherited TButtSalir: TToolButton
        Left = 255
      end
      object TButtConfiguracionRapida: TToolButton
        Left = 340
        Top = 0
        Action = AConfigurar
      end
      object TButtMultiSeleccion: TToolButton
        Left = 425
        Top = 0
        Action = AMultiSeleccion
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLInvStockResumido: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 388
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PSinLimite: TLFPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 76
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LAlmacen: TLFLabel
          Left = 66
          Top = 14
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almacen'
        end
        object EFSelAlmacen: TLFEditFind2000
          Left = 111
          Top = 11
          Width = 45
          Height = 21
          MaxLength = 3
          TabOrder = 0
          OnChange = EFSelAlmacenChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object DBEAlmacenDesc: TLFDbedit
          Left = 157
          Top = 11
          Width = 271
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInStoResumido.DSxArt_Almacen
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object RGTipoCalculo: TRadioGroup
          Left = 111
          Top = 32
          Width = 318
          Height = 34
          TabOrder = 4
        end
        object RBPMP: TRadioButton
          Left = 135
          Top = 43
          Width = 141
          Height = 17
          Caption = 'Precio Medio Ponderado'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
        object RBPCoste: TRadioButton
          Left = 304
          Top = 43
          Width = 101
          Height = 17
          Caption = 'Precio de Coste'
          TabOrder = 3
        end
      end
      object GBArticulo: TGroupBox
        Left = 0
        Top = 152
        Width = 592
        Height = 76
        Align = alTop
        Caption = 'Articulo'
        TabOrder = 2
        object LDesdeArticulo: TLFLabel
          Left = 12
          Top = 25
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaArticulo: TLFLabel
          Left = 15
          Top = 46
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticulo_D: TLFEditFind2000
          Left = 48
          Top = 21
          Width = 108
          Height = 21
          TabOrder = 0
          OnChange = EFArticulo_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_DBusqueda
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EFArticulo_H: TLFEditFind2000
          Left = 48
          Top = 43
          Width = 108
          Height = 21
          TabOrder = 1
          OnChange = EFArticulo_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_HBusqueda
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object DBEArticuloDesde: TLFDbedit
          Left = 157
          Top = 21
          Width = 403
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInStoResumido.DSxArt_Desde
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
          Left = 157
          Top = 43
          Width = 403
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInStoResumido.DSxArt_Hasta
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
      object GBFamilia: TGroupBox
        Left = 0
        Top = 76
        Width = 592
        Height = 76
        Align = alTop
        Caption = 'Familia'
        TabOrder = 1
        object LDesdeFamilia: TLFLabel
          Left = 74
          Top = 23
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFamilia: TLFLabel
          Left = 77
          Top = 45
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFFamilia_H: TLFEditFind2000
          Left = 111
          Top = 41
          Width = 45
          Height = 21
          TabOrder = 1
          OnChange = EFFamilia_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamilia_HBusqueda
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EFFamilia_D: TLFEditFind2000
          Left = 111
          Top = 19
          Width = 45
          Height = 21
          TabOrder = 0
          OnChange = EFFamilia_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamilia_DBusqueda
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object DBEFamiliaDesde: TLFDbedit
          Left = 157
          Top = 19
          Width = 271
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInStoResumido.DSxFamilia_Desde
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
        object DBEFamiliaHasta: TLFDbedit
          Left = 157
          Top = 41
          Width = 271
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInStoResumido.DSxFamilia_Hasta
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
      object GBMoneda: TGroupBox
        Left = 0
        Top = 228
        Width = 592
        Height = 76
        Align = alTop
        Caption = 'Moneda a emplear'
        TabOrder = 3
        object EFMoneda: TLFEditFind2000
          Left = 111
          Top = 29
          Width = 45
          Height = 21
          TabOrder = 0
          OnChange = EFMonedaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'MONEDA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_MONEDAS'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEMoneda: TLFDbedit
          Left = 157
          Top = 29
          Width = 271
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInStoResumido.DSxMonedas
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GBDatos: TGroupBox
        Left = 0
        Top = 310
        Width = 592
        Height = 78
        Align = alBottom
        TabOrder = 4
        object LBLFechaListado: TLFLabel
          Left = 87
          Top = 20
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha listado'
        end
        object LBLComentario: TLFLabel
          Left = 97
          Top = 42
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comentario'
        end
        object EComentario: TLFEdit
          Left = 157
          Top = 38
          Width = 276
          Height = 21
          MaxLength = 35
          TabOrder = 1
        end
        object DTPFechaListado: TLFDateEdit
          Left = 157
          Top = 16
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 456
    Top = 120
    inherited ASalir: TAction
      Tag = 2
    end
    inherited ARecargar: TAction
      Tag = 2
      OnExecute = ARecargarExecute
    end
    object AMultiSeleccion: TAction
      Caption = '&Multi-Selecci'#243'n'
      Hint = 'Multi-Selecci'#243'n'
      ImageIndex = 132
      OnExecute = AMultiSeleccionExecute
    end
  end
  object EF2000Filtra: TEntornoFind2000
    Empresa = 1
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 516
    Top = 128
  end
end
