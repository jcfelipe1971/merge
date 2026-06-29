inherited FPregUnidadesPendientes: TFPregUnidadesPendientes
  Left = 331
  Top = 221
  HelpContext = 144
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Unidades Pendientes de Servir'
  ClientHeight = 500
  ClientWidth = 592
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 500
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
      Top = 484
      Width = 592
      TabOrder = 2
    end
    object PNLInventarioStocks: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 448
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBArticulo: TGroupBox
        Left = 0
        Top = 64
        Width = 592
        Height = 64
        Align = alTop
        Caption = 'Articulo'
        TabOrder = 1
        object LDesdeArticulo: TLFLabel
          Left = 10
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaArticulo: TLFLabel
          Left = 13
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticuloDesde: TLFEditFind2000
          Left = 46
          Top = 14
          Width = 108
          Height = 21
          MaxLength = 15
          TabOrder = 0
          OnChange = EFArticuloDesdeChange
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
          OnBusqueda = EFArticuloDesdeBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFArticuloHasta: TLFEditFind2000
          Left = 46
          Top = 36
          Width = 108
          Height = 21
          MaxLength = 15
          TabOrder = 2
          OnChange = EFArticuloHastaChange
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
          OnBusqueda = EFArticuloHastaBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EArticuloDesde: TLFEdit
          Left = 155
          Top = 14
          Width = 402
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
          TabOrder = 1
        end
        object EArticuloHasta: TLFEdit
          Left = 155
          Top = 36
          Width = 402
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
      end
      object GBCli: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 64
        Align = alTop
        Caption = 'Cliente'
        TabOrder = 0
        object LHastaCliente: TLFLabel
          Left = 57
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LDesdeCliente: TLFLabel
          Left = 54
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object EFClienteDesde: TLFEditFind2000
          Left = 90
          Top = 14
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFClienteDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFClienteHasta: TLFEditFind2000
          Left = 90
          Top = 36
          Width = 64
          Height = 21
          TabOrder = 2
          OnChange = EFClienteHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EClienteHasta: TLFEdit
          Left = 155
          Top = 36
          Width = 402
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
        object EClienteDesde: TLFEdit
          Left = 155
          Top = 14
          Width = 402
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
          TabOrder = 1
        end
      end
      object GBAlmacen: TGroupBox
        Left = 0
        Top = 192
        Width = 592
        Height = 64
        Align = alTop
        Caption = 'Almacen'
        TabOrder = 3
        object LDesdeAlmacen: TLFLabel
          Left = 64
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaAlmacen: TLFLabel
          Left = 67
          Top = 39
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFAlmacenDesde: TLFEditFind2000
          Left = 100
          Top = 14
          Width = 54
          Height = 21
          TabOrder = 0
          OnChange = EFAlmacenDesdeChange
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
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmacenHasta: TLFEditFind2000
          Left = 100
          Top = 36
          Width = 54
          Height = 21
          TabOrder = 2
          OnChange = EFAlmacenHastaChange
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
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacenDesde: TLFEdit
          Left = 155
          Top = 14
          Width = 402
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EAlmacenHasta: TLFEdit
          Left = 155
          Top = 36
          Width = 402
          Height = 21
          Color = clInfoBk
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
      object GBDatos: TGroupBox
        Left = 0
        Top = 384
        Width = 592
        Height = 64
        Align = alClient
        TabOrder = 6
        object LBLFechaListado: TLFLabel
          Left = 23
          Top = 23
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha listado'
        end
        object LBLComentario: TLFLabel
          Left = 201
          Top = 23
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comentario'
        end
        object EComentario: TLFEdit
          Left = 261
          Top = 20
          Width = 276
          Height = 21
          MaxLength = 35
          TabOrder = 1
        end
        object DTPFechaListado: TLFDateEdit
          Left = 93
          Top = 20
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object GBFamilia: TGroupBox
        Left = 0
        Top = 128
        Width = 592
        Height = 64
        Align = alTop
        Caption = 'Familia'
        TabOrder = 2
        object LDesdeFamilia: TLFLabel
          Left = 31
          Top = 19
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFamilia: TLFLabel
          Left = 34
          Top = 38
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFFamiliaDesde: TLFEditFind2000
          Left = 66
          Top = 14
          Width = 90
          Height = 21
          TabOrder = 0
          OnChange = EFFamiliaDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamiliaDesdeBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFamiliaDesde: TLFEdit
          Left = 157
          Top = 14
          Width = 400
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
          TabOrder = 1
        end
        object EFFamiliaHasta: TLFEditFind2000
          Left = 66
          Top = 36
          Width = 90
          Height = 21
          TabOrder = 2
          OnChange = EFFamiliaHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamiliaHastaBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFamiliaHasta: TLFEdit
          Left = 157
          Top = 36
          Width = 400
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
      end
      object PNLFechaSerie: TLFPanel
        Left = 0
        Top = 256
        Width = 592
        Height = 64
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object GBFechas: TGroupBox
          Left = 0
          Top = 0
          Width = 244
          Height = 64
          Align = alLeft
          Caption = 'Fechas'
          TabOrder = 0
          object LDesdeFecha: TLFLabel
            Left = 35
            Top = 17
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaFecha: TLFLabel
            Left = 38
            Top = 39
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object DEFechaDesde: TLFDateEdit
            Left = 71
            Top = 14
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DEFechaHasta: TLFDateEdit
            Left = 71
            Top = 36
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object BFiltraMes: TButton
            Left = 186
            Top = 14
            Width = 25
            Height = 21
            Caption = 'M'
            TabOrder = 3
            OnClick = BFiltraMesClick
          end
          object BFiltraEjercicio: TButton
            Left = 186
            Top = 35
            Width = 25
            Height = 21
            Caption = 'A'
            TabOrder = 5
            OnClick = BFiltraEjercicioClick
          end
          object BMesAnt: TButton
            Left = 160
            Top = 14
            Width = 25
            Height = 21
            Caption = '<'
            TabOrder = 2
            OnClick = BMesAntClick
          end
          object BMesSig: TButton
            Left = 212
            Top = 14
            Width = 25
            Height = 21
            Caption = '>'
            TabOrder = 4
            OnClick = BMesSigClick
          end
        end
        object GBSeries: TGroupBox
          Left = 244
          Top = 0
          Width = 348
          Height = 64
          Align = alClient
          Caption = 'Serie'
          TabOrder = 1
          object LDesdeSerie: TLFLabel
            Left = 16
            Top = 18
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaSerie: TLFLabel
            Left = 19
            Top = 39
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object EFSerieDesde: TLFEditFind2000
            Left = 53
            Top = 14
            Width = 49
            Height = 21
            TabOrder = 0
            OnChange = EFSerieDesdeChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              '')
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFSerieHasta: TLFEditFind2000
            Left = 53
            Top = 36
            Width = 49
            Height = 21
            TabOrder = 2
            OnChange = EFSerieHastaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              '')
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ESerieDesde: TLFEdit
            Left = 103
            Top = 14
            Width = 210
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object ESerieHasta: TLFEdit
            Left = 103
            Top = 36
            Width = 210
            Height = 21
            Color = clInfoBk
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
      end
      object GBOrden: TGroupBox
        Left = 0
        Top = 320
        Width = 592
        Height = 64
        Align = alTop
        Caption = 'Orden'
        TabOrder = 5
        object LOrden: TLFLabel
          Left = 59
          Top = 23
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Orden'
        end
        object CBOrden: TLFComboBox
          Left = 93
          Top = 20
          Width = 465
          Height = 21
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 0
          Text = 'Almacen, Articulo, Fecha'
          Items.Strings = (
            'Almacen, Cliente, Fecha'
            'Almacen, Articulo, Fecha'
            'Almacen, Fecha, Cliente'
            'Almacen, Rig, Fecha')
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 405
    Top = 5
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBOrden.ItemIndex')
    Left = 372
    Top = 8
  end
end
