object FMInterPedido: TFMInterPedido
  Left = 208
  Top = 125
  Width = 800
  Height = 500
  Caption = 'Interpretar Pedido'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PPrincipal: TLFPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 288
      Top = 0
      Width = 3
      Height = 447
      Cursor = crHSplit
    end
    object PCabecera: TLFPanel
      Left = 0
      Top = 0
      Width = 288
      Height = 447
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object TBCabecera: TLFToolBar
        Left = 0
        Top = 0
        Width = 288
        Height = 26
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Separators = True
        object NavCabecera: THYMNavigator
          Left = 0
          Top = 0
          Width = 100
          Height = 22
          DataSource = DMInterPedido.DSQMCabecera
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Flat = True
          ParentShowHint = False
          PopupMenu = CECabeceraPMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFCabecera
          InsertaControl = DBGFCabecera
          Exclusivo = True
          ControlEdit = CECabecera
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object ToolButton2: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 108
          Top = 0
          Action = AEliminaPedido
        end
        object ToolButton10: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object ToolButton9: TToolButton
          Left = 139
          Top = 0
          Action = ARefrescar
        end
      end
      object DBGFCabecera: TDBGridFind2000
        Left = 0
        Top = 26
        Width = 288
        Height = 297
        Align = alClient
        DataSource = DMInterPedido.DSQMCabecera
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = -1
        IndiceBitmapDescendente = 0
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CLIENTE'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NUM_PEDIDO_CLI'
            ReadOnly = True
            Visible = True
          end>
      end
      object PDatosPedido: TLFPanel
        Left = 0
        Top = 323
        Width = 288
        Height = 124
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          288
          124)
        object LDireccionPedido: TLFLabel
          Left = 4
          Top = 26
          Width = 81
          Height = 13
          Caption = 'Direccion Pedido'
        end
        object LDireccion: TLFLabel
          Left = 5
          Top = 81
          Width = 45
          Height = 13
          Caption = 'Direccion'
        end
        object MDireccionPedido: TLFDBMemo
          Left = 3
          Top = 40
          Width = 281
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'DIRECCIONDESTINO'
          DataSource = DMInterPedido.DSQMDetalle
          Enabled = False
          TabOrder = 0
        end
        object EFDireccion: TLFDBEditFind2000
          Left = 56
          Top = 78
          Width = 65
          Height = 21
          DataField = 'DIRECCION'
          DataSource = DMInterPedido.DSQMDetalle
          TabOrder = 1
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'DIRECCION'
          CampoStr = 'DIR_COMPLETA_N'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          OrdenadoPor.Strings = (
            'DIR_DEFECTO DESC, DIRECCION')
          Filtros = [obTercero]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBECliente: TLFDbedit
          Left = 3
          Top = 3
          Width = 281
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMInterPedido.DSQMCabecera
          Enabled = False
          TabOrder = 2
        end
        object DBEDireccionCompleta: TLFDbedit
          Left = 3
          Top = 100
          Width = 281
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'DIR_COMPLETA_N'
          DataSource = DMInterPedido.DSQMCabecera
          Enabled = False
          TabOrder = 3
        end
      end
    end
    object PDetalle: TLFPanel
      Left = 291
      Top = 0
      Width = 501
      Height = 447
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 501
        Height = 26
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 180
          Height = 22
          DataSource = DMInterPedido.DSQMDetalle
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = True
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 26
        Width = 501
        Height = 299
        Align = alClient
        DataSource = DMInterPedido.DSQMDetalle
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        AutoCambiarColumna = False
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        Campos.Strings = (
          'ARTICULO')
        CamposAMostrar.Strings = (
          'ARTICULO'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0')
        CamposADevolver.Strings = (
          '')
        CamposDesplegar.Strings = (
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'TRASPASAR'
          'ERROR')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'ARTICULO')
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tablas.Strings = (
          'VER_ARTICULOS_EF')
        Acciones.Strings = (
          '')
        Titulos.Strings = (
          'TITULO')
        Posicion = tpCentrado
        Planes.Strings = (
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'TRASPASAR'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescArt'
            ReadOnly = True
            Width = 310
            Visible = True
          end>
      end
      object TBOpcDetalle: TLFToolBar
        Left = 0
        Top = 421
        Width = 501
        Height = 26
        Align = alBottom
        ButtonWidth = 108
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        List = True
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = False
        TabOrder = 2
        Separators = True
        object ToolButton3: TToolButton
          Left = 0
          Top = 0
          Action = ASelecTodo
          ImageIndex = 146
        end
        object ToolButton8: TToolButton
          Left = 108
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 116
          Top = 0
          Action = ADesmarcaTodo
          ImageIndex = 147
        end
      end
      object GBObs: TGroupBox
        Left = 0
        Top = 325
        Width = 501
        Height = 96
        Align = alBottom
        Caption = 'Observaciones'
        TabOrder = 3
        object DBMObs: TLFDBMemo
          Left = 2
          Top = 15
          Width = 497
          Height = 79
          Align = alClient
          DataField = 'OBSERVACIONES_CLI'
          DataSource = DMInterPedido.DSQMDetalle
          TabOrder = 0
        end
      end
    end
  end
  object TBGeneral: TLFToolBar
    Left = 0
    Top = 447
    Width = 792
    Height = 26
    Align = alBottom
    ButtonWidth = 98
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    Separators = True
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ACargarFichero
      ImageIndex = 41
    end
    object ToolButton6: TToolButton
      Left = 98
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 106
      Top = 0
      Action = ATraspasarPed
      ImageIndex = 36
    end
  end
  object ALMain: TActionList
    Images = DMMain.ILMain_Ac
    Left = 347
    Top = 224
    object ACargarFichero: TAction
      Caption = 'Cargar Fichero'
      Hint = 'Cargar la informaci'#243'n del fichero de pedidos'
      ImageIndex = 126
      OnExecute = ACargarFicheroExecute
    end
    object ARefrescar: TAction
      Caption = 'Refrescar'
      Hint = 'Refrescar Toda la informaci'#243'n'
      ImageIndex = 39
      OnExecute = ARefrescarExecute
    end
    object ATraspasarPed: TAction
      Caption = 'Trasp. Pedidos'
      Hint = 'Traspasar a Pedidos'
      ImageIndex = 25
      OnExecute = ATraspasarPedExecute
    end
    object ASelecTodo: TAction
      Tag = 1
      Caption = 'Selecciona Todo'
      Hint = 'Marca todos los pedidos de un cliente'
      ImageIndex = 146
      OnExecute = MarcarCliente
    end
    object ADesmarcaTodo: TAction
      Caption = 'DesmarcaTodo'
      Hint = 'Desmarca todos los pedidos de un cliente'
      ImageIndex = 147
      OnExecute = MarcarCliente
    end
    object AEliminaPedido: TAction
      Caption = 'Elimina Pedido'
      Hint = 'Elimina el pedido del cliente seleccionado'
      ImageIndex = 20
      OnExecute = AEliminaPedidoExecute
    end
  end
  object CECabecera: TControlEdit
    EnlazadoA = CEDetalle
    PopUpMenu = CECabeceraPMEdit
    Teclas = DMMain.Teclas
    Left = 200
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CECabecera
    Complementario = TBCabecera
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 584
    Top = 8
  end
  object CECabeceraPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 232
    object CECabeceraMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECabeceraMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECabeceraMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECabeceraMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECabeceraMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CECabeceraMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CECabeceraMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CECabeceraMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CECabeceraMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CECabeceraMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 616
    Top = 8
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
