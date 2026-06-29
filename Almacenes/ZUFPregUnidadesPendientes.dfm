inherited ZFPregUnidadesPendientes: TZFPregUnidadesPendientes
  Left = 339
  Top = 266
  HelpContext = 144
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Unidades Pendientes de Servir'
  ClientHeight = 493
  ClientWidth = 621
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 621
    Height = 493
    inherited TBMain: TLFToolBar
      Width = 621
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
      Width = 621
      Height = 457
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBArticulo: TGroupBox
        Left = 0
        Top = 68
        Width = 621
        Height = 68
        Align = alTop
        Caption = 'Art'#237'culo'
        TabOrder = 1
        object LDesdeArticulo: TLFLabel
          Left = 10
          Top = 18
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object LHastaArticulo: TLFLabel
          Left = 13
          Top = 40
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object EFArticulo_D: TLFEditFind2000
          Left = 46
          Top = 14
          Width = 108
          Height = 21
          MaxLength = 15
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
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFArticulo_H: TLFEditFind2000
          Left = 46
          Top = 36
          Width = 108
          Height = 21
          MaxLength = 15
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
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEArticuloDesde: TLFDbedit
          Left = 155
          Top = 14
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMRUnidadesPendientes.DSxArt_Desde
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
          Left = 155
          Top = 36
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMRUnidadesPendientes.DSxArt_Hasta
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
        Width = 621
        Height = 68
        Align = alTop
        Caption = 'Cliente'
        TabOrder = 0
        object LHastaCliente: TLFLabel
          Left = 57
          Top = 40
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object LDesdeCliente: TLFLabel
          Left = 54
          Top = 18
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object EFClienteD: TLFEditFind2000
          Left = 90
          Top = 14
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFClienteDChange
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
        object EFClienteH: TLFEditFind2000
          Left = 90
          Top = 36
          Width = 64
          Height = 21
          TabOrder = 1
          OnChange = EFClienteHChange
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
        object DBEClienterH: TLFDbedit
          Left = 155
          Top = 36
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'NOMBRE_COMERCIAL'
          DataSource = ZDMRUnidadesPendientes.DSxClienteH
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
        object DBEClienterD: TLFDbedit
          Left = 155
          Top = 14
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'NOMBRE_COMERCIAL'
          DataSource = ZDMRUnidadesPendientes.DSxClienteD
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
        Top = 204
        Width = 621
        Height = 68
        Align = alTop
        Caption = 'Almacen'
        TabOrder = 3
        object LDesdeAlmacen: TLFLabel
          Left = 64
          Top = 18
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object LHastaAlmacen: TLFLabel
          Left = 67
          Top = 39
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object EFAlmacen_D: TLFEditFind2000
          Left = 100
          Top = 14
          Width = 54
          Height = 21
          MaxLength = 3
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
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmacen_H: TLFEditFind2000
          Left = 100
          Top = 36
          Width = 54
          Height = 21
          MaxLength = 3
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
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEAlmacenDesde: TLFDbedit
          Left = 155
          Top = 14
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMRUnidadesPendientes.DSxAlm_Desde
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
          Left = 155
          Top = 36
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMRUnidadesPendientes.DSxAlm_Hasta
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
        Top = 410
        Width = 621
        Height = 47
        Align = alBottom
        TabOrder = 6
        object LBLFechaListado: TLFLabel
          Left = 23
          Top = 20
          Width = 63
          Height = 13
          Caption = 'Fecha listado'
        end
        object LBLComentario: TLFLabel
          Left = 201
          Top = 20
          Width = 53
          Height = 13
          Caption = 'Comentario'
        end
        object EComentario: TLFEdit
          Left = 261
          Top = 16
          Width = 276
          Height = 21
          MaxLength = 35
          TabOrder = 1
        end
        object DTPFechaListado: TDateEdit
          Left = 93
          Top = 16
          Width = 87
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object GBFamilia: TGroupBox
        Left = 0
        Top = 136
        Width = 621
        Height = 68
        Align = alTop
        Caption = 'Familia'
        TabOrder = 2
        object LBLFamDesde: TLFLabel
          Left = 29
          Top = 19
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object LBLFamHasta: TLFLabel
          Left = 32
          Top = 38
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object EFFamiliaD: TLFEditFind2000
          Left = 64
          Top = 14
          Width = 90
          Height = 21
          MaxLength = 5
          TabOrder = 0
          OnChange = EFFamiliaDChange
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
          OnBusqueda = EFFamiliaDBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEFamiliaD: TLFDbedit
          Left = 155
          Top = 14
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMRUnidadesPendientes.DSxFamiliaD
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
        object EFFamiliaH: TLFEditFind2000
          Left = 64
          Top = 36
          Width = 90
          Height = 21
          MaxLength = 5
          TabOrder = 2
          OnChange = EFFamiliaHChange
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
          OnBusqueda = EFFamiliaHBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEFamiliaH: TLFDbedit
          Left = 155
          Top = 36
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMRUnidadesPendientes.DSxFamiliaH
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
        Top = 272
        Width = 621
        Height = 68
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object GBFechas: TGroupBox
          Left = 0
          Top = 0
          Width = 226
          Height = 68
          Align = alLeft
          Caption = 'Fechas'
          TabOrder = 0
          object LDesdeFecha: TLFLabel
            Left = 57
            Top = 17
            Width = 31
            Height = 13
            Caption = 'Desde'
          end
          object LHastaFecha: TLFLabel
            Left = 60
            Top = 39
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object DEFechaDesde: TDateEdit
            Left = 93
            Top = 14
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 0
            OnChange = DEFechaDesdeChange
          end
          object DEFechaHasta: TDateEdit
            Left = 93
            Top = 36
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            OnChange = DEFechaHastaChange
          end
        end
        object GBSeries: TGroupBox
          Left = 226
          Top = 0
          Width = 395
          Height = 68
          Align = alClient
          Caption = 'Serie'
          TabOrder = 1
          object LDesdeSerie: TLFLabel
            Left = 19
            Top = 18
            Width = 31
            Height = 13
            Caption = 'Desde'
          end
          object LHastaSerie: TLFLabel
            Left = 22
            Top = 39
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object EFSerieD: TLFEditFind2000
            Left = 56
            Top = 14
            Width = 49
            Height = 21
            TabOrder = 0
            OnChange = EFSerieDChange
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
          object EFSerieH: TLFEditFind2000
            Left = 56
            Top = 36
            Width = 49
            Height = 21
            TabOrder = 1
            OnChange = EFSerieHChange
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
          object DBESerieD: TLFDbedit
            Left = 106
            Top = 14
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMRUnidadesPendientes.DSxSerie_Desde
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBESerieH: TLFDbedit
            Left = 106
            Top = 36
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMRUnidadesPendientes.DSxSerie_Hasta
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
      object PNLCanalOrden: TLFPanel
        Left = 0
        Top = 340
        Width = 621
        Height = 70
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 5
        object GBCanal: TGroupBox
          Left = 0
          Top = 0
          Width = 393
          Height = 70
          Align = alLeft
          Caption = ' Canal '
          TabOrder = 0
          object LDesdeCanal: TLFLabel
            Left = 10
            Top = 18
            Width = 31
            Height = 13
            Caption = 'Desde'
          end
          object LHastaCanal: TLFLabel
            Left = 13
            Top = 38
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object EFCanalD: TLFEditFind2000
            Left = 46
            Top = 14
            Width = 48
            Height = 21
            TabOrder = 0
            OnChange = EFCanalDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFCanalH: TLFEditFind2000
            Left = 46
            Top = 36
            Width = 48
            Height = 21
            TabOrder = 1
            OnChange = EFCanalHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECanadD: TLFDbedit
            Left = 95
            Top = 14
            Width = 237
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMRUnidadesPendientes.DSxCanalDesde
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
          object DBECanalH: TLFDbedit
            Left = 95
            Top = 36
            Width = 237
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMRUnidadesPendientes.DSxCanalHasta
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
        object RBOrdenar: TRadioGroup
          Left = 393
          Top = 0
          Width = 228
          Height = 70
          Align = alClient
          Caption = 'Ordenaci'#243'n'
          ItemIndex = 0
          Items.Strings = (
            'Por Cliente'
            'Por Art'#237'culo')
          TabOrder = 1
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 421
    Top = 21
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
