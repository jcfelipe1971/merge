inherited FMRelacionPedidosVenta: TFMRelacionPedidosVenta
  Left = 285
  Width = 1118
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'FMRelacionPedidosVenta'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1108
    inherited TBMain: TLFToolBar
      Width = 1104
      inherited NavMain: THYMNavigator
        DataSource = DMRelacionPedidosVenta.DSQMPedidos
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      inherited TbuttComp: TToolButton
        Visible = True
        OnClick = Filtrar
      end
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 28
      Width = 1104
      Height = 69
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LPedido: TLFLabel
        Left = 196
        Top = 4
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = '&Pedido'
        FocusControl = EDesdePedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LSerie: TLFLabel
        Left = 20
        Top = 4
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = '&Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LCliente: TLFLabel
        Left = 11
        Top = 26
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = '&Cliente'
        FocusControl = EFDesdeCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LEstado: TLFLabel
        Left = 486
        Top = 4
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = '&Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EDesdePedido: TLFEdit
        Left = 240
        Top = 0
        Width = 81
        Height = 21
        TabOrder = 0
        OnChange = Filtrar
      end
      object EHastaPedido: TLFEdit
        Left = 322
        Top = 0
        Width = 81
        Height = 21
        TabOrder = 1
        OnChange = Filtrar
      end
      object CBSeries: TLFComboBox
        Left = 53
        Top = 0
        Width = 128
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = Filtrar
      end
      object EFDesdeCliente: TLFEditFind2000
        Left = 53
        Top = 22
        Width = 46
        Height = 21
        TabOrder = 3
        OnChange = EFDesdeClienteChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'EJERCICIO')
        CampoNum = 'CLIENTE'
        CampoStr = 'NOMBRE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_CLIENTES_VENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCliente: TLFEditFind2000
        Left = 365
        Top = 22
        Width = 46
        Height = 21
        TabOrder = 4
        OnChange = EFHastaClienteChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'EJERCICIO')
        CampoNum = 'CLIENTE'
        CampoStr = 'NOMBRE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_CLIENTES_VENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeCliente: TLFEdit
        Left = 100
        Top = 22
        Width = 245
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 5
      end
      object EHastaCliente: TLFEdit
        Left = 412
        Top = 22
        Width = 245
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 6
      end
      object CBEstado: TLFComboBox
        Left = 529
        Top = 0
        Width = 128
        Height = 21
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 7
        Text = 'Abiertos'
        OnChange = Filtrar
        Items.Strings = (
          'Todos'
          'Abiertos'
          'Cerrados')
      end
    end
    object DBGPedidos: THYTDBGrid
      Left = 2
      Top = 97
      Width = 1104
      Height = 233
      Align = alClient
      Color = clInfoBk
      DataSource = DMRelacionPedidosVenta.DSQMPedidos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'CANAL'
        'CLIENTE'
        'FECHA'
        'FORMA_PAGO'
        'MONEDA'
        'RIG'
        'SERIE'
        'SU_REFERENCIA'
        'TITULO'
        'TOTAL_A_COBRAR')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TERCERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPANYA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BULTOS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BRUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_DTO_LINEAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_BASES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'M_BRUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C_TOTAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_CUOTA_IVA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_CUOTA_RE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'B_DTO_LINEAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO_PP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO_CIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_DTO_CIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_DTO_PP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'B_COMISION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_COMISION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POR_FINANCIACION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_FINANCIACION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REC_CAB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERVIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_COMERCIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORTES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TARIFA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGRUPACION_KRI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_S'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDIOMA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARGEN_KRI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_PORTES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POR_PORTES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_PORTES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_PORTES_CANAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMBIO_FIJO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CAMB_FIJO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTAS_INTERNAS_KRI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_LINEA_KRI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIT_CONTACTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CREACION_KRI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO_CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RANGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INDICE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRANSPORTISTA'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 1108
  end
  inherited CEMain: TControlEdit
    Left = 456
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 496
    Top = 8
  end
  inherited ALMain: TLFActionList
    Left = 392
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 424
    Top = 8
  end
end
