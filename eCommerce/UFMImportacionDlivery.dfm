inherited FMImportacionDlivery: TFMImportacionDlivery
  Left = 534
  Top = 154
  Width = 1174
  Height = 570
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importacion Dlivery'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1164
    Height = 517
    inherited TBMain: TLFToolBar
      Width = 1160
      inherited NavMain: THYMNavigator
        DataSource = DMImportacionDlivery.DSQMPedidosDlivery
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
      object TSep1: TToolButton
        Left = 288
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TButtRefrescar: TToolButton
        Left = 296
        Top = 0
        Action = ARecargar
      end
      object TBSep1: TToolButton
        Left = 319
        Top = 0
        Width = 8
        ImageIndex = 60
        Style = tbsSeparator
      end
      object TButtMarcarTodos: TToolButton
        Left = 327
        Top = 0
        Action = AMarcarTodos
      end
      object TButtDesmarcarTodos: TToolButton
        Left = 350
        Top = 0
        Action = ADesmarcarTodos
      end
      object TBSep2: TToolButton
        Left = 373
        Top = 0
        Width = 8
        ImageIndex = 60
        Style = tbsSeparator
      end
      object TButtGeneraPedidos: TToolButton
        Left = 381
        Top = 0
        Action = AGeneraPedidos
      end
      object TBSep3: TToolButton
        Left = 404
        Top = 0
        Width = 8
        ImageIndex = 63
        Style = tbsSeparator
      end
      object TBVerTodos: TToolButton
        Left = 412
        Top = 0
        Action = AVerTodos
      end
      object TBVerPendientes: TToolButton
        Left = 435
        Top = 0
        Action = AVerPendientes
      end
      object PNLProgreso: TPanel
        Left = 458
        Top = 0
        Width = 33
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
      end
    end
    object DBGPedidosDlivery: TDBGridFind2000
      Left = 2
      Top = 97
      Width = 1160
      Height = 418
      Align = alClient
      DataSource = DMImportacionDlivery.DSQMPedidosDlivery
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGPedidosDliveryCellClick
      OnDrawColumnCell = DBGPedidosDliveryDrawColumnCell
      OnDblClick = DBGPedidosDliveryDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMImportacionDlivery.TLocal
      BuscarNums = False
      Campos.Strings = (
        'AGENTE'
        'ARTICULO'
        'CLIENTE'
        'DIRECCION')
      CamposAMostrar.Strings = (
        'AGENTE'
        '0'
        'ARTICULO'
        '0'
        'CLIENTE'
        '0'
        'DIRECCION'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'ENTRADA_AGRUPACION')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'AGENTE'
        'ARTICULO'
        'CLIENTE'
        'DIRECCION')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_AGENTES_CUENTAS'
        'VER_ARTICULOS_EF'
        'VER_CLIENTES_EF'
        'VER_DIRECCIONES')
      Acciones.Strings = (
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO')
      Posicion = tpCentrado
      OnBusqueda = DBGPedidosDliveryBusqueda
      Planes.Strings = (
        ''
        ''
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'AGENTE'
        'ARTICULO'
        'CLIENTE'
        'DIRECCION')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'ENTRADA_AGRUPACION'
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENTE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_DETALLES_S'
          Width = 60
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'ID_ORIGEN'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 100
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'NOMBRE_CLIENTE'
          Width = 200
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'DIRECCION_RECOGIDA'
          Width = 200
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'COMUNA_RECOGIDA'
          Width = 200
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'FECHA_RETIRO'
          Width = 100
          Visible = True
        end
        item
          Color = clSkyBlue
          Expanded = False
          FieldName = 'PERSONA_ENTREGA'
          Width = 200
          Visible = True
        end
        item
          Color = clSkyBlue
          Expanded = False
          FieldName = 'TELEFONO_ENTREGA'
          Width = 100
          Visible = True
        end
        item
          Color = clSkyBlue
          Expanded = False
          FieldName = 'DIRECCION_ENTREGA'
          Width = 200
          Visible = True
        end
        item
          Color = clSkyBlue
          Expanded = False
          FieldName = 'COMUNA_ENTREGA'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOVIL'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMENTARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMENTARIO_ENTREGA'
          Visible = True
        end>
    end
    object PNLFiltro: TPanel
      Left = 2
      Top = 28
      Width = 1160
      Height = 69
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object GBCliente: TGroupBox
        Left = 0
        Top = 0
        Width = 311
        Height = 69
        Align = alLeft
        Caption = 'Clientes'
        TabOrder = 0
        object LDesdeCliente: TLFLabel
          Left = 21
          Top = 22
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object LHastaCliente: TLFLabel
          Left = 23
          Top = 43
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object EFHastaCliente: TLFEditFind2000
          Left = 59
          Top = 40
          Width = 50
          Height = 21
          TabOrder = 0
          Text = 'EFHastaCliente'
          OnChange = EFHastaClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'CLIENTE'
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDesdeCliente: TLFEditFind2000
          Left = 59
          Top = 18
          Width = 50
          Height = 21
          TabOrder = 1
          Text = 'EFDesdeCliente'
          OnChange = EFDesdeClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'CLIENTE'
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloClienteDesde: TLFEdit
          Left = 111
          Top = 18
          Width = 190
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object ETituloClienteHasta: TLFEdit
          Left = 111
          Top = 40
          Width = 190
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object GBFechas: TGroupBox
        Left = 311
        Top = 0
        Width = 198
        Height = 69
        Align = alLeft
        Caption = 'Fechas'
        TabOrder = 1
        object Desde: TLFLabel
          Left = 31
          Top = 22
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object Hasta: TLFLabel
          Left = 33
          Top = 44
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object DEHastaFecha: TLFDateEdit
          Left = 68
          Top = 40
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DEHastaFechaChange
        end
        object DEDesdeFecha: TLFDateEdit
          Left = 68
          Top = 18
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = DEDesdeFechaChange
        end
      end
      object RGOrden: TRadioGroup
        Left = 509
        Top = 0
        Width = 100
        Height = 69
        Align = alLeft
        Caption = 'Orden'
        ItemIndex = 0
        Items.Strings = (
          'Id Origen'
          'Nombre')
        TabOrder = 2
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 517
    Width = 1164
  end
  inherited CEMain: TControlEdit
    Left = 544
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 580
    Top = 4
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
    Left = 480
    Top = 0
    object AImportarDlivery: TAction
      Category = 'Procesos'
      Caption = 'Importar Excel'
      Hint = 'Importar datos desde Excel'
      ImageIndex = 98
      OnExecute = AImportarDliveryExecute
    end
    object AMarcarTodos: TAction
      Category = 'Procesos'
      Caption = 'Marcar Todos'
      Hint = 'Marcar Todos'
      ImageIndex = 146
      OnExecute = AMarcarTodosExecute
    end
    object ADesmarcarTodos: TAction
      Category = 'Procesos'
      Caption = 'Desmarcar todos'
      Hint = 'Desmarcar todos'
      ImageIndex = 147
      OnExecute = ADesmarcarTodosExecute
    end
    object ARecargar: TAction
      Category = 'Procesos'
      Caption = 'Recargar'
      Hint = 'Recargar'
      ImageIndex = 26
      OnExecute = ARecargarExecute
    end
    object AGeneraPedidos: TAction
      Category = 'Procesos'
      Caption = 'Genera pedidos'
      Hint = 'Genera pedidos'
      ImageIndex = 62
      OnExecute = AGeneraPedidosExecute
    end
    object AVerTodos: TAction
      Category = 'Procesos'
      Caption = 'Ver Todos'
      Hint = 'Ver Todos'
      ImageIndex = 23
      OnExecute = AVerTodosExecute
    end
    object AVerPendientes: TAction
      Category = 'Procesos'
      Caption = 'Ver Pendientes'
      Hint = 'Ver Pendientes'
      ImageIndex = 22
      OnExecute = AVerPendientesExecute
    end
    object ABorraRegistrosPendientes: TAction
      Category = 'Procesos'
      Caption = 'Borra registros pendientes'
      Hint = 'Borra registros pendientes de traspasar'
      ImageIndex = 20
      OnExecute = ABorraRegistrosPendientesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'RGOrden.ItemIndex')
    Left = 512
    Top = 0
  end
end
