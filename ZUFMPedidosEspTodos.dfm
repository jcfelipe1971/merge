object ZFMPedidosEspTodos: TZFMPedidosEspTodos
  Left = 192
  Top = 107
  Width = 783
  Height = 540
  Caption = 'Mantenimiento de Pedidos Especiales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEPedidosPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 775
    Height = 24
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtSalir: TToolButton
      Left = 0
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
    object TSep1: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object NavMain: THYMNavigator
      Left = 31
      Top = 0
      Width = 88
      Height = 22
      DataSource = ZDMPedidosEspTodos.DSPedidosEsp
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEPedidosPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEPedidos
      OrdenAscendente = True
      InsertaUltimo = False
    end
  end
  object DBGFPedidos: TDBGridFind2000
    Left = 0
    Top = 47
    Width = 775
    Height = 466
    Align = alClient
    Color = clInfoBk
    DataSource = ZDMPedidosEspTodos.DSPedidosEsp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGFPedidosDblClick
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
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
      'RIG'
      'ESTADO_PED'
      'CLIENTE'
      'FECHA'
      'FECHA_ENTREGA_PREV')
    ColumnasCheckBoxes.Strings = (
      'ESTADO_PED')
    ColumnasChecked.Strings = (
      '1')
    ColumnasNoChecked.Strings = (
      '0')
    MensajeNoExiste = False
    SalirSiVacio = False
    SalirSiNoExiste = False
    Posicion = tpCentrado
    OrdenMultiple = True
    Filtros = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RIG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_REFERENCIA'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS_SERVIR'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ENTREGA_PREV'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO_PED'
        Width = 41
        Visible = True
      end>
  end
  object PnlFiltros: TLFPanel
    Left = 0
    Top = 24
    Width = 775
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object LEstado: TLFLabel
      Left = 6
      Top = 4
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Estado'
    end
    object LCliente: TLFLabel
      Left = 152
      Top = 4
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object LSuReferencia: TLFLabel
      Left = 517
      Top = 4
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Su Referencia'
    end
    object CBEstado: TLFComboBox
      Left = 43
      Top = 0
      Width = 81
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Pendiente'
      OnChange = CBEstadoChange
      Items.Strings = (
        'Pendiente'
        'Entregado'
        'Todos')
    end
    object EFCliente: TLFEditFind2000
      Left = 189
      Top = 0
      Width = 50
      Height = 21
      TabOrder = 1
      OnChange = EFClienteChange
      Base_de_datos = DMMain.DataBase
      Transaction = ZDMPedidosEspTodos.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object ESuRef: TLFEdit
      Left = 590
      Top = 0
      Width = 168
      Height = 21
      TabOrder = 2
      OnChange = ESuRefChange
    end
    object DBEDescCliente: TLFDbedit
      Left = 240
      Top = 0
      Width = 233
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ZDMPedidosEspTodos.DSxDescCliente
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
  object CEPedidos: TControlEdit
    PopUpMenu = CEPedidosPMEdit
    Teclas = DMMain.Teclas
    Left = 656
  end
  object CEPedidosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 704
    object CEPedidosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPedidosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPedidosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPedidosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPedidosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEPedidosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEPedidosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEPedidosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEPedidosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEPedidosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
