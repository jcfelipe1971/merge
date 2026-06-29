inherited FPregInventarioStocks: TFPregInventarioStocks
  Left = 369
  Top = 223
  HelpContext = 138
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Inventario de Stocks'
  ClientHeight = 426
  ClientWidth = 592
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 426
    inherited TBMain: TLFToolBar
      Width = 592
      ButtonWidth = 85
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtImprimir: TToolButton
        Tag = 1
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
        Hint = 'Configuraci'#243'n R'#225'pida del Listado'
        Caption = '&Configurar'
        ImageIndex = 77
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfiguracionRapidaClick
      end
      object TButtMultiSeleccion: TToolButton
        Left = 425
        Top = 0
        Action = AMultiSeleccion
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 410
      Width = 592
      TabOrder = 2
    end
    object PNLInventarioStocks: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 374
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PSinLimite: TLFPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 171
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LPeriodo: TLFLabel
          Left = 80
          Top = 23
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object LAlmacen: TLFLabel
          Left = 75
          Top = 44
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almac'#233'n'
        end
        object EFPeriodo: TLFEditFind2000
          Left = 122
          Top = 19
          Width = 47
          Height = 21
          MaxLength = 2
          TabOrder = 0
          OnChange = EFPeriodoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PERIODO')
          Filtros = []
        end
        object EFSelAlmacen: TLFEditFind2000
          Left = 122
          Top = 41
          Width = 47
          Height = 21
          MaxLength = 3
          TabOrder = 1
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
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object GBRecuadro: TGroupBox
          Left = 233
          Top = 66
          Width = 255
          Height = 96
          TabOrder = 4
          object CBAcuPar: TLFCheckBox
            Left = 12
            Top = 12
            Width = 231
            Height = 17
            Caption = 'Acumulado parcial hasta el Periodo indicado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBSinStock: TLFCheckBox
            Left = 12
            Top = 32
            Width = 89
            Height = 17
            Caption = 'Art. sin stock'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBResumido: TLFCheckBox
            Left = 116
            Top = 32
            Width = 76
            Height = 17
            Caption = 'Resumido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBNSeries: TLFCheckBox
            Left = 12
            Top = 53
            Width = 229
            Height = 17
            Caption = ' Desglosado en n'#250'meros de serie actuales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBLotes: TLFCheckBox
            Left = 12
            Top = 73
            Width = 229
            Height = 17
            Caption = ' Desglosado en lotes actuales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
        end
        object EPeriodoDesc: TLFEdit
          Left = 170
          Top = 19
          Width = 270
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object EAlmacenDesc: TLFEdit
          Left = 170
          Top = 41
          Width = 270
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object RGTipoCalculo: TRadioGroup
          Left = 74
          Top = 66
          Width = 155
          Height = 63
          TabOrder = 7
        end
        object RBPCoste: TRadioButton
          Left = 82
          Top = 104
          Width = 101
          Height = 17
          Caption = 'Precio de Coste'
          TabOrder = 3
        end
        object RBPMP: TRadioButton
          Left = 82
          Top = 80
          Width = 141
          Height = 17
          Caption = 'Precio Medio Ponderado'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object GBArticulo: TGroupBox
        Left = 0
        Top = 234
        Width = 592
        Height = 68
        Align = alTop
        Caption = 'Art'#237'culo'
        TabOrder = 2
        object LArticuloDesde: TLFLabel
          Left = 24
          Top = 19
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LArticuloHasta: TLFLabel
          Left = 27
          Top = 41
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticulo_D: TLFEditFind2000
          Left = 61
          Top = 15
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
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EFArticulo_H: TLFEditFind2000
          Left = 61
          Top = 37
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
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object DBEArticuloDesde: TLFDbedit
          Left = 170
          Top = 15
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInventarioStocks.DSxArt_Desde
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
          Left = 170
          Top = 37
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInventarioStocks.DSxArt_Hasta
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
        Top = 171
        Width = 592
        Height = 63
        Align = alTop
        Caption = 'Familia'
        TabOrder = 1
        object LFamiliaDesde: TLFLabel
          Left = 85
          Top = 17
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LFamiliaHasta: TLFLabel
          Left = 88
          Top = 39
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFFamilia_H: TLFEditFind2000
          Left = 122
          Top = 35
          Width = 47
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
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EFFamilia_D: TLFEditFind2000
          Left = 122
          Top = 13
          Width = 47
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
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object DBEFamiliaDesde: TLFDbedit
          Left = 170
          Top = 13
          Width = 272
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInventarioStocks.DSxFamilia_Desde
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
          Left = 170
          Top = 35
          Width = 272
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInventarioStocks.DSxFamilia_Hasta
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
        Top = 302
        Width = 293
        Height = 72
        Align = alLeft
        Caption = 'Moneda a Emplear'
        TabOrder = 3
        object EFMoneda: TLFEditFind2000
          Left = 10
          Top = 38
          Width = 49
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
          Tabla_a_buscar = 'SYS_MONEDAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'DEFECTO DESC'
            'MONEDA')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEMoneda: TLFDbedit
          Left = 60
          Top = 38
          Width = 222
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRInventarioStocks.DSxMonedas
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
        Left = 299
        Top = 302
        Width = 293
        Height = 72
        Align = alRight
        TabOrder = 4
        object LBLFechaListado: TLFLabel
          Left = 8
          Top = 13
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha listado'
        end
        object LComentario: TLFLabel
          Left = 8
          Top = 61
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comentario'
        end
        object LOrden: TLFLabel
          Left = 8
          Top = 35
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ordenado por'
          Layout = tlCenter
        end
        object EComentario: TLFEdit
          Left = 64
          Top = 57
          Width = 222
          Height = 21
          MaxLength = 35
          TabOrder = 2
        end
        object DTPFechaListado: TLFDateEdit
          Left = 78
          Top = 9
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object CBOrden: TLFComboBox
          Left = 78
          Top = 33
          Width = 208
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = 'C'#243'digo Art'#237'culo'
          Items.Strings = (
            'C'#243'digo Art'#237'culo'
            'T'#237'tulo Art'#237'culo')
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 498
    inherited ARecargar: TAction
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
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 500
    Top = 108
  end
end
