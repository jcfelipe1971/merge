object FMMantenimientoNroSerie: TFMMantenimientoNroSerie
  Left = 136
  Top = 180
  Width = 796
  Height = 386
  Caption = 'Mantenimiento de Nros. de Serie'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TLFPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 57
    Align = alTop
    TabOrder = 0
    DesignSize = (
      788
      57)
    object Label1: TLFLabel
      Left = 533
      Top = 32
      Width = 80
      Height = 16
      Anchors = [akTop]
      Caption = 'Nro de Serie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLFLabel
      Left = 8
      Top = 32
      Width = 49
      Height = 16
      Caption = 'Articulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNroSerie: TLFLabel
      Left = 404
      Top = 7
      Width = 47
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nro. Serie'
    end
    object LArticulo: TLFLabel
      Left = 605
      Top = 7
      Width = 35
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Articulo'
    end
    object EFNroSerie: TEditFind2000
      Left = 456
      Top = 3
      Width = 133
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnChange = EFNroSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'NRO_SERIE'
      CampoStr = 'ARTICULO'
      CondicionBusqueda = 'nro_serie > '#39' '#39
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'NRO_SERIE_KRI'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EditTitulo: TLFEdit
      Left = 152
      Top = 30
      Width = 305
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object HYMNavigator1: THYMNavigator
      Left = 1
      Top = 2
      Width = 240
      Height = 25
      DataSource = DMMantenimientoNroSerie.DSxNroSerie
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = HYMNavigator1Click
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object HYDBENroSerie: THYDBEdit
      Left = 460
      Top = 30
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      DataField = 'NRO_SERIE'
      DataSource = DMMantenimientoNroSerie.DSxNroSerie
      Enabled = False
      TabOrder = 2
    end
    object DBEFArticulo: TDBEditFind2000
      Left = 63
      Top = 30
      Width = 89
      Height = 21
      Color = clInfoBk
      DataField = 'ARTICULO'
      DataSource = DMMantenimientoNroSerie.DSxNroSerie
      Enabled = False
      TabOrder = 1
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArticulo: TEditFind2000
      Left = 644
      Top = 3
      Width = 141
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      OnChange = EFArticuloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'serializado_kri = 1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  object PageControl1: TLFPageControl
    Left = 0
    Top = 57
    Width = 788
    Height = 302
    ActivePage = TSFicha
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 1
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSFicha: TTabSheet
      Caption = 'Ficha'
      object Panel2: TLFPanel
        Left = 0
        Top = 0
        Width = 780
        Height = 274
        Align = alClient
        TabOrder = 0
        DesignSize = (
          780
          274)
        object Label2: TLFLabel
          Left = 8
          Top = 1
          Width = 51
          Height = 14
          Caption = 'Compras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLFLabel
          Left = 70
          Top = 15
          Width = 27
          Height = 13
          Caption = 'Canal'
        end
        object Label4: TLFLabel
          Left = 127
          Top = 15
          Width = 24
          Height = 13
          Caption = 'Serie'
        end
        object Label5: TLFLabel
          Left = 185
          Top = 15
          Width = 36
          Height = 13
          Caption = 'Albaran'
        end
        object Label6: TLFLabel
          Left = 332
          Top = 15
          Width = 26
          Height = 13
          Caption = 'Linea'
        end
        object Label7: TLFLabel
          Left = 389
          Top = 15
          Width = 41
          Height = 13
          Caption = 'Almacen'
        end
        object Label8: TLFLabel
          Left = 11
          Top = 15
          Width = 40
          Height = 13
          Caption = 'Ejercicio'
        end
        object Label10: TLFLabel
          Left = 8
          Top = 56
          Width = 39
          Height = 14
          Caption = 'Ventas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLFLabel
          Left = 243
          Top = 15
          Width = 30
          Height = 13
          Caption = 'Fecha'
        end
        object Label12: TLFLabel
          Left = 8
          Top = 99
          Width = 189
          Height = 14
          Caption = 'Movimientos Manuales de Entrada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLFLabel
          Left = 8
          Top = 143
          Width = 180
          Height = 14
          Caption = 'Movimientos Manuales de Salida'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLFLabel
          Left = 8
          Top = 185
          Width = 124
          Height = 14
          Caption = 'Devolucion de Compra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLFLabel
          Left = 8
          Top = 226
          Width = 112
          Height = 14
          Caption = 'Devolucion de Venta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLFLabel
          Left = 448
          Top = 15
          Width = 25
          Height = 13
          Caption = 'Prov.'
        end
        object DBEditFind20001: TDBEditFind2000
          Left = 66
          Top = 31
          Width = 57
          Height = 21
          DataField = 'CANAL_ENT'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 1
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEditFind20002: TDBEditFind2000
          Left = 124
          Top = 31
          Width = 57
          Height = 21
          DataField = 'SERIE_ENT'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 2
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object HYDBEdit1: THYDBEdit
          Left = 329
          Top = 31
          Width = 57
          Height = 21
          DataField = 'LINEA_ENT'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 5
        end
        object DBEditFind20004: TDBEditFind2000
          Left = 387
          Top = 31
          Width = 57
          Height = 21
          DataField = 'ALMACEN_ENT'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 6
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object HYDBEdit2: THYDBEdit
          Left = 8
          Top = 31
          Width = 57
          Height = 21
          DataField = 'EJERCICIO_ENT'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 0
        end
        object HYDBEdit3: THYDBEdit
          Left = 182
          Top = 31
          Width = 57
          Height = 21
          DataField = 'RIG_ENT'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 3
        end
        object HYDBEdit5: THYDBEdit
          Left = 8
          Top = 74
          Width = 57
          Height = 21
          DataField = 'EJERCICIO_SAL'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 7
        end
        object DBEditFind20003: TDBEditFind2000
          Left = 66
          Top = 74
          Width = 57
          Height = 21
          DataField = 'CANAL_SAL'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 8
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEditFind20005: TDBEditFind2000
          Left = 124
          Top = 74
          Width = 57
          Height = 21
          DataField = 'SERIE_SAL'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 9
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object HYDBEdit6: THYDBEdit
          Left = 182
          Top = 74
          Width = 57
          Height = 21
          DataField = 'RIG_SAL'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 10
        end
        object HYDBEdit7: THYDBEdit
          Left = 329
          Top = 74
          Width = 57
          Height = 21
          DataField = 'LINEA_SAL'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 12
        end
        object DBEditFind20006: TDBEditFind2000
          Left = 387
          Top = 74
          Width = 57
          Height = 21
          DataField = 'ALMACEN_SAL'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 13
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBDateTimePicker1: TDBDateTimePicker
          Left = 240
          Top = 31
          Width = 88
          Height = 21
          CalAlignment = dtaLeft
          Date = 42957.7467182986
          Time = 42957.7467182986
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 4
          DataField = 'FECHA_ENT'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
        end
        object DBDateTimePicker2: TDBDateTimePicker
          Left = 240
          Top = 74
          Width = 88
          Height = 21
          CalAlignment = dtaLeft
          Date = 42957.7468892593
          Time = 42957.7468892593
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 11
          DataField = 'FECHA_SAL'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
        end
        object EdProveedor: TLFEdit
          Left = 503
          Top = 31
          Width = 270
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 14
        end
        object EdCliente: TLFEdit
          Left = 503
          Top = 74
          Width = 270
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 15
        end
        object HYDBEdit4: THYDBEdit
          Left = 8
          Top = 117
          Width = 57
          Height = 21
          DataField = 'EJERCICIO_MOE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 16
        end
        object DBEditFind20008: TDBEditFind2000
          Left = 66
          Top = 117
          Width = 57
          Height = 21
          DataField = 'CANAL_MOE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 17
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEditFind20009: TDBEditFind2000
          Left = 124
          Top = 117
          Width = 57
          Height = 21
          DataField = 'SERIE_MOE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 18
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object HYDBEdit9: THYDBEdit
          Left = 182
          Top = 117
          Width = 57
          Height = 21
          DataField = 'RIG_MOE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 19
        end
        object HYDBEdit10: THYDBEdit
          Left = 329
          Top = 117
          Width = 57
          Height = 21
          DataField = 'LINEA_MOE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 20
        end
        object DBEditFind200010: TDBEditFind2000
          Left = 387
          Top = 117
          Width = 57
          Height = 21
          DataField = 'ALMACEN_MOE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 21
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBDateTimePicker3: TDBDateTimePicker
          Left = 240
          Top = 117
          Width = 88
          Height = 21
          CalAlignment = dtaLeft
          Date = 42957.7468892593
          Time = 42957.7468892593
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 22
          DataField = 'FECHA_MOE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
        end
        object HYDBEdit11: THYDBEdit
          Left = 8
          Top = 161
          Width = 57
          Height = 21
          DataField = 'EJERCICIO_MOS'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 23
        end
        object DBEditFind200011: TDBEditFind2000
          Left = 66
          Top = 161
          Width = 57
          Height = 21
          DataField = 'CANAL_MOS'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 24
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEditFind200012: TDBEditFind2000
          Left = 124
          Top = 161
          Width = 57
          Height = 21
          DataField = 'SERIE_MOS'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 25
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object HYDBEdit12: THYDBEdit
          Left = 182
          Top = 161
          Width = 57
          Height = 21
          DataField = 'RIG_MOS'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 26
        end
        object HYDBEdit13: THYDBEdit
          Left = 329
          Top = 161
          Width = 57
          Height = 21
          DataField = 'LINEA_MOS'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 27
        end
        object DBEditFind200013: TDBEditFind2000
          Left = 387
          Top = 161
          Width = 57
          Height = 21
          DataField = 'ALMACEN_MOS'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 28
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBDateTimePicker4: TDBDateTimePicker
          Left = 240
          Top = 161
          Width = 88
          Height = 21
          CalAlignment = dtaLeft
          Date = 42957.7468892593
          Time = 42957.7468892593
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 29
          DataField = 'FECHA_MOS'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
        end
        object HYDBEdit14: THYDBEdit
          Left = 8
          Top = 203
          Width = 57
          Height = 21
          DataField = 'EJERCICIO_DEC'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 30
        end
        object DBEditFind200014: TDBEditFind2000
          Left = 66
          Top = 203
          Width = 57
          Height = 21
          DataField = 'CANAL_DEC'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 31
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEditFind200015: TDBEditFind2000
          Left = 124
          Top = 203
          Width = 57
          Height = 21
          DataField = 'SERIE_DEC'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 32
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object HYDBEdit15: THYDBEdit
          Left = 182
          Top = 203
          Width = 57
          Height = 21
          DataField = 'RIG_DEC'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 33
        end
        object HYDBEdit16: THYDBEdit
          Left = 329
          Top = 203
          Width = 57
          Height = 21
          DataField = 'LINEA_DEC'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 34
        end
        object DBEditFind200016: TDBEditFind2000
          Left = 387
          Top = 203
          Width = 57
          Height = 21
          DataField = 'ALMACEN_DEC'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 35
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBDateTimePicker5: TDBDateTimePicker
          Left = 240
          Top = 203
          Width = 88
          Height = 21
          CalAlignment = dtaLeft
          Date = 42957.7468892593
          Time = 42957.7468892593
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 36
          DataField = 'FECHA_DEC'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
        end
        object HYDBEdit17: THYDBEdit
          Left = 8
          Top = 244
          Width = 57
          Height = 21
          DataField = 'EJERCICIO_DEV'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 37
        end
        object DBEditFind200017: TDBEditFind2000
          Left = 66
          Top = 244
          Width = 57
          Height = 21
          DataField = 'CANAL_DEV'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 38
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEditFind200018: TDBEditFind2000
          Left = 124
          Top = 244
          Width = 57
          Height = 21
          DataField = 'SERIE_DEV'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 39
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object HYDBEdit18: THYDBEdit
          Left = 182
          Top = 244
          Width = 57
          Height = 21
          DataField = 'RIG_DEV'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 40
        end
        object HYDBEdit19: THYDBEdit
          Left = 329
          Top = 244
          Width = 57
          Height = 21
          DataField = 'LINEA_DEV'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Enabled = False
          TabOrder = 41
        end
        object DBEditFind200019: TDBEditFind2000
          Left = 387
          Top = 244
          Width = 57
          Height = 21
          DataField = 'ALMACEN_DEV'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 42
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBDateTimePicker6: TDBDateTimePicker
          Left = 240
          Top = 244
          Width = 88
          Height = 21
          CalAlignment = dtaLeft
          Date = 42957.7468892593
          Time = 42957.7468892593
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 43
          DataField = 'FECHA_DEV'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
        end
        object DBCHKDevolucionVenta: TLFDBCheckBox
          Left = 464
          Top = 247
          Width = 137
          Height = 17
          Caption = 'Devolucion Venta'
          ClicksDisabled = False
          TabOrder = 44
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'DEVOLUCION_VENTA'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCHKDevolucionCompra: TLFDBCheckBox
          Left = 464
          Top = 206
          Width = 129
          Height = 17
          Caption = 'Devolucion Compra'
          ClicksDisabled = False
          TabOrder = 45
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'DEVOLUCION'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBEFProveedor: TDBEditFind2000
          Left = 445
          Top = 31
          Width = 57
          Height = 21
          DataField = 'PROVEEDOR'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 46
          OnChange = DBEFProveedorChange
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_PROVEEDORES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEFCliente: TDBEditFind2000
          Left = 445
          Top = 74
          Width = 57
          Height = 21
          DataField = 'CLIENTE'
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          TabOrder = 47
          OnChange = DBEFClienteChange
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    object TSMovimientos: TTabSheet
      Caption = 'Movimientos'
      ImageIndex = 2
      OnShow = TSMovimientosShow
      object Panel3: TLFPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 274
        Align = alClient
        TabOrder = 0
        object HYTDBGMovimientos: THYTDBGrid
          Left = 1
          Top = 1
          Width = 782
          Height = 272
          Align = alClient
          DataSource = DMMantenimientoNroSerie.DSxMovimientos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO'
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE_ENT'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG_ENT'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_ENT'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NRO_SERIE'
              Width = 182
              Visible = True
            end>
        end
      end
    end
    object TSTabla: TTabSheet
      Caption = 'Tabla'
      ImageIndex = 1
      object Panel4: TLFPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 274
        Align = alClient
        TabOrder = 0
        object HYTDBGTabla: THYTDBGrid
          Left = 1
          Top = 1
          Width = 782
          Height = 272
          Align = alClient
          DataSource = DMMantenimientoNroSerie.DSxNroSerie
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NRO_SERIE'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DEVOLUCION_VENTA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DEVOLUCION'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MOVIMIENTO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Visible = True
            end>
        end
      end
    end
  end
  object FSMain: TFormStorage
    UseRegistry = False
    StoredValues = <>
    Left = 192
    Top = 56
  end
end
