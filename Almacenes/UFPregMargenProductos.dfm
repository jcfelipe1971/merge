inherited FPregMargenProductos: TFPregMargenProductos
  Left = 362
  Top = 259
  HelpContext = 142
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Margen de Productos'
  ClientHeight = 418
  ClientWidth = 592
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 418
    inherited TBMain: TLFToolBar
      Width = 592
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtImprimir: TToolButton
        Tag = 1
      end
      object TButtConfiguracionRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 402
      Width = 592
      TabOrder = 2
    end
    object PNLInventarioStocks: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 366
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBArticulo: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 75
        Align = alTop
        Caption = 'Articulo'
        TabOrder = 0
        object LDesdeArticulo: TLFLabel
          Left = 20
          Top = 25
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaArticulo: TLFLabel
          Left = 23
          Top = 47
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticulo_D: TLFEditFind2000
          Left = 56
          Top = 21
          Width = 108
          Height = 21
          TabOrder = 0
          OnChange = EFArticulo_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_DBusqueda
          OrdenadoPor.Strings = (
            'articulo')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFArticulo_H: TLFEditFind2000
          Left = 56
          Top = 43
          Width = 108
          Height = 21
          TabOrder = 1
          OnChange = EFArticulo_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_HBusqueda
          OrdenadoPor.Strings = (
            'articulo')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEArticuloDesde: TLFDbedit
          Left = 165
          Top = 21
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRMargenProductos.DSxArt_Desde
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
          Left = 165
          Top = 43
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDepositosActivos.DSxArt_Hasta
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
      object GBFechas: TGroupBox
        Left = 0
        Top = 150
        Width = 293
        Height = 67
        Align = alLeft
        Caption = 'Fechas'
        TabOrder = 2
        object LDesdeFecha: TLFLabel
          Left = 62
          Top = 21
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 65
          Top = 43
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 98
          Top = 18
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHasta: TLFDateEdit
          Left = 98
          Top = 40
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object RGModo: TRadioGroup
        Left = 293
        Top = 150
        Width = 299
        Height = 67
        Align = alClient
        Caption = ' Modo de Trabajo '
        Items.Strings = (
          'Por Almacenes'
          'Por Totales')
        TabOrder = 3
      end
      object GBMoneda: TGroupBox
        Left = 0
        Top = 217
        Width = 592
        Height = 75
        Align = alBottom
        Caption = 'Moneda a Emplear'
        TabOrder = 4
        object EFMoneda: TLFEditFind2000
          Left = 98
          Top = 32
          Width = 66
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
          Left = 165
          Top = 32
          Width = 272
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRMargenProductos.DSxMonedas
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
      object GBOpciones: TGroupBox
        Left = 0
        Top = 292
        Width = 592
        Height = 74
        Align = alBottom
        TabOrder = 5
        object LBLFechaListado: TLFLabel
          Left = 28
          Top = 43
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha listado'
        end
        object LBLComentario: TLFLabel
          Left = 206
          Top = 43
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comentario'
        end
        object ChkBMostrarCeros: TLFCheckBox
          Left = 98
          Top = 18
          Width = 205
          Height = 17
          Caption = 'Mostrar Articulos con Unidades a Cero'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object EComentario: TLFEdit
          Left = 266
          Top = 39
          Width = 276
          Height = 21
          MaxLength = 35
          TabOrder = 2
        end
        object DTPFechaListado: TLFDateEdit
          Left = 98
          Top = 39
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GBProveedor: TGroupBox
        Left = 0
        Top = 75
        Width = 592
        Height = 75
        Align = alTop
        Caption = 'Proveedor'
        TabOrder = 1
        object LDesdeProveedor: TLFLabel
          Left = 20
          Top = 25
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaProveedor: TLFLabel
          Left = 23
          Top = 47
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LFEFDProveedor: TLFEditFind2000
          Left = 56
          Top = 21
          Width = 108
          Height = 21
          TabOrder = 0
          OnChange = LFEFDProveedorChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'proveedor')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object LFEFHProveedor: TLFEditFind2000
          Left = 56
          Top = 43
          Width = 108
          Height = 21
          TabOrder = 1
          OnChange = LFEFHProveedorChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'proveedor')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EHProveedor: TLFEdit
          Left = 165
          Top = 43
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          TabOrder = 2
        end
        object EDProveedor: TLFEdit
          Left = 165
          Top = 21
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 462
    Top = 26
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
