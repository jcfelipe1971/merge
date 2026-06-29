inherited FPregDepositosActivos: TFPregDepositosActivos
  Left = 359
  Top = 340
  HelpContext = 143
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Dep'#243'sitos Activos'
  ClientHeight = 424
  ClientWidth = 592
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 424
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
    object PNLInventarioStocks: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 388
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBArticulo: TGroupBox
        Left = 0
        Top = 65
        Width = 592
        Height = 65
        Align = alTop
        Caption = 'Articulo'
        TabOrder = 1
        object LDesdeArticulo: TLFLabel
          Left = 9
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaArticulo: TLFLabel
          Left = 12
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticulo_D: TLFEditFind2000
          Left = 44
          Top = 14
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
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_DBusqueda
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFArticulo_H: TLFEditFind2000
          Left = 44
          Top = 36
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
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_HBusqueda
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEArticuloDesde: TLFDbedit
          Left = 153
          Top = 14
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDepositosActivos.DSxArt_Desde
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
          Left = 153
          Top = 36
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
      object GBProv: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 65
        Align = alTop
        Caption = 'Proveedor'
        TabOrder = 0
        object LHasteProveedor: TLFLabel
          Left = 55
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LDesdeProveedor: TLFLabel
          Left = 52
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object EFProveedorD: TLFEditFind2000
          Left = 88
          Top = 14
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFProveedorDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFProveedorH: TLFEditFind2000
          Left = 88
          Top = 36
          Width = 64
          Height = 21
          TabOrder = 1
          OnChange = EFProveedorHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEProveedorH: TLFDbedit
          Left = 153
          Top = 36
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDepositosActivos.DSxProveedorH
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
        object DBEProveedorD: TLFDbedit
          Left = 153
          Top = 14
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDepositosActivos.DSxProveedorD
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
      object GBAlmacen: TGroupBox
        Left = 0
        Top = 130
        Width = 592
        Height = 65
        Align = alTop
        Caption = 'Almacen'
        TabOrder = 2
        object LDesdeAlmacen: TLFLabel
          Left = 62
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaAlmacen: TLFLabel
          Left = 65
          Top = 39
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFAlmacen_D: TLFEditFind2000
          Left = 98
          Top = 14
          Width = 54
          Height = 21
          TabOrder = 0
          OnChange = EFAlmacen_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            '')
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmacen_H: TLFEditFind2000
          Left = 98
          Top = 36
          Width = 54
          Height = 21
          TabOrder = 1
          OnChange = EFAlmacen_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            '')
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEAlmacenDesde: TLFDbedit
          Left = 153
          Top = 14
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDepositosActivos.DSxAlm_Desde
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBEAlmacenHasta: TLFDbedit
          Left = 153
          Top = 36
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDepositosActivos.DSxAlm_Hasta
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object GBFechas: TGroupBox
        Left = 1
        Top = 197
        Width = 292
        Height = 65
        Caption = 'Fechas'
        TabOrder = 3
        object LDesdeFecha: TLFLabel
          Left = 62
          Top = 16
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 65
          Top = 38
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 98
          Top = 13
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DTPDesdeChange
        end
        object DTPHasta: TLFDateEdit
          Left = 98
          Top = 35
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = DTPHastaChange
        end
      end
      object RGModo: TRadioGroup
        Left = 298
        Top = 197
        Width = 293
        Height = 65
        Caption = ' Modo de Trabajo '
        Items.Strings = (
          'Por Almacenes'
          'Por Totales')
        TabOrder = 4
      end
      object GBMoneda: TGroupBox
        Left = 1
        Top = 262
        Width = 590
        Height = 60
        Caption = 'Moneda a emplear'
        TabOrder = 5
        object EFMoneda: TLFEditFind2000
          Left = 98
          Top = 25
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
          Top = 25
          Width = 272
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDepositosActivos.DSxMonedas
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
        Top = 328
        Width = 592
        Height = 60
        Align = alBottom
        TabOrder = 6
        object LBLFechaListado: TLFLabel
          Left = 30
          Top = 26
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha listado'
        end
        object LBLComentario: TLFLabel
          Left = 208
          Top = 26
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comentario'
        end
        object EComentario: TLFEdit
          Left = 266
          Top = 22
          Width = 276
          Height = 21
          MaxLength = 35
          TabOrder = 1
        end
        object DTPFechaListado: TLFDateEdit
          Left = 98
          Top = 22
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
    Top = 28
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
