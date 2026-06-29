inherited ZFMPedidosArtDet: TZFMPedidosArtDet
  Left = 580
  Top = 256
  Caption = 'Datos Especiales de Compuestos'
  ClientHeight = 321
  ClientWidth = 620
  Constraints.MinHeight = 350
  Constraints.MinWidth = 630
  OldCreateOrder = False
  PopupMenu = CEDetPMEdit
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 620
    Height = 145
    Align = alTop
    object G2KTableLoc: TG2KTBLoc [0]
      Left = 80
      Top = 26
      Hint = 'Localizar'
      ImageIndex = 81
      Filtros = []
    end
    object LblPCoste: TLFLabel [1]
      Left = 15
      Top = 55
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio Coste'
    end
    object LblPVenta: TLFLabel [2]
      Left = 14
      Top = 76
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio Venta'
    end
    object LblMargen: TLFLabel [3]
      Left = 39
      Top = 99
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Margen'
    end
    object LblCompuesto: TLFLabel [4]
      Left = 22
      Top = 32
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Compuesto'
    end
    object LblLacado: TLFLabel [5]
      Left = 184
      Top = 55
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lacado'
    end
    object LblModelo: TLFLabel [6]
      Left = 517
      Top = 33
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    object LblLineal: TLFLabel [7]
      Left = 134
      Top = 121
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lineal'
    end
    object LblSalida: TLFLabel [8]
      Left = 219
      Top = 121
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Salida'
    end
    object LblM2: TLFLabel [9]
      Left = 315
      Top = 121
      Width = 15
      Height = 13
      Alignment = taRightJustify
      Caption = 'M2'
    end
    object LblUdsLona: TLFLabel [10]
      Left = 31
      Top = 121
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidades'
    end
    object LAsociarOrden: TLFLabel [11]
      Left = 457
      Top = 121
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Asociar a l'#237'nea n'#250'm.'
    end
    inherited TBMain: TLFToolBar
      Width = 616
      TabOrder = 17
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = ZDMPedidosArtDet.DSQMPedidosCab
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = EFLacado
        InsertaControl = EFLacado
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 25
        DataSource = ZDMPedidosArtDet.DSQMPedidosCab
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 121
      end
      inherited TbuttComp: TToolButton
        Left = 129
      end
    end
    object DBEPCoste: TLFDbedit
      Left = 79
      Top = 51
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'P_COSTE'
      DataSource = ZDMPedidosArtDet.DSxDatosTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBEPVenta: TLFDbedit
      Left = 79
      Top = 73
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'P_VENTA'
      DataSource = ZDMPedidosArtDet.DSxDatosTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object DBEMargen: TLFDbedit
      Left = 79
      Top = 95
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'MARGEN'
      DataSource = ZDMPedidosArtDet.DSxDatosTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object ECompuesto: TLFEdit
      Left = 79
      Top = 29
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Text = 'ECompuesto'
    end
    object EDescCompuesto: TLFEdit
      Left = 155
      Top = 29
      Width = 316
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Text = 'EDescCompuesto'
    end
    object EFLacado: TLFDBEditFind2000
      Left = 223
      Top = 51
      Width = 36
      Height = 21
      DataField = 'LACADO'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      TabOrder = 2
      OnChange = EFLacadoChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'Z_SYS_COLORES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CODIGO'
      CampoStr = 'DESCRIPCION'
      CondicionBusqueda = 'ACTIVO=1'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'CODIGO')
      Filtros = []
    end
    object DescLacado: TLFHYDBDescription
      Left = 260
      Top = 51
      Width = 211
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      Tabla_a_buscar = 'Z_SYS_COLORES'
      Campo_Descripcion = 'DESCRIPCION'
      Base_de_datos = DMMain.DataBase
      CamposWhereOrigen.Strings = (
        'LACADO')
      CamposWhereTabla.Strings = (
        'CODIGO')
    end
    object DBChkBMotor: TLFDBCheckBox
      Left = 223
      Top = 97
      Width = 60
      Height = 17
      Caption = 'Motor'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 0
      TabStop = True
      Alignment = taLeftJustify
      DataField = 'MOTOR'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBChkBIncr: TLFDBCheckBox
      Left = 223
      Top = 75
      Width = 139
      Height = 17
      Caption = 'Incremento Lacado PVP'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
      DataField = 'INCR_LACADO_PVP'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBEIncLacado: TLFDbedit
      Left = 396
      Top = 73
      Width = 75
      Height = 21
      DataField = 'P_INCR_LACADO_PVP'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      TabOrder = 4
    end
    object DBELineal: TLFDbedit
      Left = 166
      Top = 117
      Width = 46
      Height = 21
      DataField = 'LINEAL'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBESalida: TLFDbedit
      Left = 252
      Top = 117
      Width = 46
      Height = 21
      DataField = 'SALIDA'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEFModelo: TLFDBEditFind2000
      Left = 558
      Top = 29
      Width = 46
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'MODELO'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'Z_SYS_MODELOS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CODIGO'
      CampoStr = 'DESCRIPCION'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = []
    end
    object DBEM2Lona: TLFDbedit
      Left = 335
      Top = 117
      Width = 55
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TOTAL_M2_LONA'
      DataSource = ZDMPedidosArtDet.DSxLonaM2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object DBEUdsLona: TLFDbedit
      Left = 79
      Top = 117
      Width = 45
      Height = 21
      DataField = 'UNIDADES_LONA'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      TabOrder = 1
    end
    object EM2Lona: TLFEdit
      Left = 392
      Top = 117
      Width = 55
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
      TabOrder = 16
      Text = 'EM2Lona'
      Visible = False
    end
    object DBELINEA_PEDIDO_ASOCIADA: TLFDbedit
      Left = 558
      Top = 117
      Width = 46
      Height = 21
      DataField = 'LINEA_PEDIDO_ASOCIADA'
      DataSource = ZDMPedidosArtDet.DSQMPedidosCab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnKeyUp = DBELINEA_PEDIDO_ASOCIADAKeyUp
    end
  end
  inherited TBActions: TLFToolBar
    Top = 297
    Width = 620
    TabOrder = 2
  end
  object PnlDetalle: TLFPanel [2]
    Left = 0
    Top = 145
    Width = 620
    Height = 152
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 620
      Height = 22
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = ZDMPedidosArtDet.DSQMPedidosDet
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFDetalle
        InsertaControl = DBGFDetalle
        Exclusivo = True
        ControlEdit = CEDet
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TSepDet1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButEscandalloCorte: TToolButton
        Left = 228
        Top = 0
        Hint = 'Asignacion del escandallo tipo corte'
        Caption = 'Escandallo Corte'
        ImageIndex = 10
        OnClick = TButEscandalloCorteClick
      end
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 22
      Width = 620
      Height = 130
      Align = alClient
      DataSource = ZDMPedidosArtDet.DSQMPedidosDet
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGFDetalleCellClick
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      Insercion = False
      ColumnaInicial = 1
      UsaDicG2K = True
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
      Campos.Strings = (
        'DETALLE'
        'ESCANDALLO')
      CamposAMostrar.Strings = (
        'DETALLE'
        '0'
        'ESCANDALLO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'Corte')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'ARTICULO'
        'ESCANDALLO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_ARTICULOS_EF'
        'PRO_ESCANDALLO')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'COMPUESTO')
      Posicion = tpCentrado
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        'ESCANDALLO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_ARTICULO_TYC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Corte'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DETALLE'
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescArt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 27
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PCoste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 51
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PVenta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 51
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Margen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESCANDALLO'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDA'
          Width = 45
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    DataSource = ZDMPedidosArtDet.DSQMPedidosCab
    EnlazadoA = CEDet
    Left = 472
    Top = 232
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 472
    Top = 264
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
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
  object CEDet: TControlEdit
    DataSource = ZDMPedidosArtDet.DSQMPedidosDet
    EnlazadoA = CEMain
    PopUpMenu = CEDetPMEdit
    Teclas = DMMain.Teclas
    Left = 440
    Top = 232
  end
  object CEDetPMEdit: TPopUpTeclas
    Left = 440
    Top = 264
    object CEDetMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
