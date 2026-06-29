inherited ZFMVerEstadoPedCli: TZFMVerEstadoPedCli
  Left = 451
  Top = 163
  Width = 1305
  Height = 576
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Estado de Pedidos pendientes de Clientes'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1295
    Height = 523
    object Splitter1: TSplitter [0]
      Left = 2
      Top = 413
      Width = 1291
      Height = 8
      Cursor = crVSplit
      Align = alBottom
      Color = clGray
      Constraints.MinHeight = 8
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 1291
      TabOrder = 1
      inherited NavMain: THYMNavigator
        DataSource = ZDMVerEstadoPedCli.DSQMVerPedidos
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        DataSource = ZDMVerEstadoPedCli.DSQMVerPedidos
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 3
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
      object PnlCliente: TLFPanel
        Left = 288
        Top = 0
        Width = 415
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LCliente: TLFLabel
          Left = 10
          Top = 5
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object EFCliente: TLFEditFind2000
          Left = 44
          Top = 1
          Width = 75
          Height = 21
          TabOrder = 0
          OnChange = EFClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloCliente: TLFEdit
          Left = 120
          Top = 1
          Width = 291
          Height = 21
          TabStop = False
          Color = clInfoBk
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
      object TButtMultiSeleccion: TToolButton
        Left = 703
        Top = 0
        Hint = 'Multi selecci'#243'n de agrupaciones'
        Caption = 'Multi selecci'#243'n por agrupacoines'
        ImageIndex = 4
        OnClick = TButtMultiSeleccionClick
      end
      object TButtMultiZonas: TToolButton
        Left = 726
        Top = 0
        Hint = 'Multi selecci'#243'n de zonas'
        Caption = 'Multi selecci'#243'n por zonas'
        ImageIndex = 81
        OnClick = TButtMultiZonasClick
      end
      object TSep3: TToolButton
        Left = 749
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PnlDatosCab: TLFPanel
        Left = 757
        Top = 0
        Width = 181
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object CBDatosCab: TLFCheckBox
          Left = 8
          Top = 3
          Width = 168
          Height = 15
          Caption = 'Mostrar datos de cabeceras'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 0
          TabStop = True
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Alignment = taLeftJustify
          OnChange = CBDatosCabChange
        end
      end
    end
    object DBGFPedPdtes: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 1291
      Height = 385
      Align = alClient
      Color = clInfoBk
      Constraints.MinHeight = 42
      DataSource = ZDMVerEstadoPedCli.DSQMVerPedidos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGFPedPdtesDrawColumnCell
      OnDblClick = DBGFPedPdtesDblClick
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'FECHA_CORTE'
        'FECHA_ENTREGA_PREV'
        'FECHA_MACARRON'
        'FECHA_MONTAJE'
        'FECHA_PEDIDO'
        'FECHA_TERMINADO'
        'FECHA_UNION'
        'NUM_PEDIDO'
        'OPERARIO_CORTE'
        'OPERARIO_MACARRON'
        'OPERARIO_MONTAJE'
        'OPERARIO_TERMINADO'
        'OPERARIO_UNION'
        'REF_PEDIDO'
        'Z_CB_PEDIDO'
        'FECHA_ALB'
        'FECHA_RUTA'
        'TITULO'
        'CLIENTE'
        'FECHA_MOTOR'
        'OPERARIO_MOTOR')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_PEDIDO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_PEDIDO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_PED'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REF_PEDIDO'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONA'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CORTE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_UNION'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_MACARRON'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_MOTOR'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_MONTAJE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_TERMINADO'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_PREPARADO'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ALB'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_RUTA'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Z_CB_PEDIDO'
          Width = 85
          Visible = True
        end>
    end
    object DBGPedidosCompra: TDBGridFind2000
      Left = 2
      Top = 421
      Width = 1291
      Height = 100
      Align = alBottom
      Color = clInfoBk
      Constraints.MinHeight = 42
      DataSource = ZDMVerEstadoPedCli.DSxPedidosCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGPedidosCompraDrawColumnCell
      OnDblClick = DBGPedidosCompraDblClick
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'FECHA_CORTE'
        'FECHA_ENTREGA_PREV'
        'FECHA_MACARRON'
        'FECHA_MONTAJE'
        'FECHA_PEDIDO'
        'FECHA_TERMINADO'
        'FECHA_UNION'
        'NUM_PEDIDO'
        'OPERARIO_CORTE'
        'OPERARIO_MACARRON'
        'OPERARIO_MONTAJE'
        'OPERARIO_TERMINADO'
        'OPERARIO_UNION'
        'REF_PEDIDO'
        'Z_CB_PEDIDO'
        'FECHA_ALB'
        'FECHA_RUTA'
        'TITULO'
        'CLIENTE'
        'FECHA_MOTOR'
        'OPERARIO_MOTOR')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_R_SOCIAL'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_ORIGINALES'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SERVIDAS'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_POR_SERVIR'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_PRE_DET'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REC_DET'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CONF_KRI'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PLAZO_CONFIRM_KRI'
          Width = 72
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 1295
  end
  inherited CEMain: TControlEdit
    DataSource = ZDMVerEstadoPedCli.DSQMVerPedidos
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  inherited FSMain: TLFFibFormStorage
    Left = 376
    Top = 256
  end
end
