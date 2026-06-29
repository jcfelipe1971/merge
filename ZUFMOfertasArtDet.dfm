inherited ZFMOfertasArtDet: TZFMOfertasArtDet
  Left = 294
  Top = 248
  Caption = 'Datos Especiales de Compuestos'
  ClientWidth = 535
  OldCreateOrder = False
  PopupMenu = CEDetPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 535
    Height = 153
    Align = alTop
    object G2KTableLoc: TG2KTBLoc [0]
      Left = 71
      Top = 27
      Hint = 'Localizar'
      ImageIndex = 81
      Filtros = []
    end
    object LblPCoste: TLFLabel [1]
      Left = 70
      Top = 58
      Width = 75
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'P. Coste'
    end
    object LblPVenta: TLFLabel [2]
      Left = 146
      Top = 58
      Width = 75
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'P. Venta'
    end
    object LblMargen: TLFLabel [3]
      Left = 222
      Top = 58
      Width = 75
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Margen'
    end
    object LblCompuesto: TLFLabel [4]
      Left = 14
      Top = 33
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Compuesto'
    end
    object LblLacado: TLFLabel [5]
      Left = 30
      Top = 108
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lacado'
    end
    object LblModelo: TLFLabel [6]
      Left = 377
      Top = 65
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    object LblLineal: TLFLabel [7]
      Left = 383
      Top = 87
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lineal'
    end
    object LblSalida: TLFLabel [8]
      Left = 382
      Top = 109
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Salida'
    end
    object LblM2: TLFLabel [9]
      Left = 396
      Top = 132
      Width = 15
      Height = 13
      Alignment = taRightJustify
      Caption = 'M2'
    end
    object LblUdsLona: TLFLabel [10]
      Left = 319
      Top = 132
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds.'
    end
    inherited TBMain: TLFToolBar
      Width = 531
      TabOrder = 17
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = ZDMOfertasArtDet.DSQMOfertasCab
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = EFLacado
        InsertaControl = EFLacado
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 25
        DataSource = ZDMOfertasArtDet.DSQMOfertasCab
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
      Left = 70
      Top = 74
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'P_COSTE'
      DataSource = ZDMOfertasArtDet.DSxDatosTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBEPVenta: TLFDbedit
      Left = 146
      Top = 74
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'P_VENTA'
      DataSource = ZDMOfertasArtDet.DSxDatosTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBEMargen: TLFDbedit
      Left = 222
      Top = 74
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'MARGEN'
      DataSource = ZDMOfertasArtDet.DSxDatosTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object ECompuesto: TLFEdit
      Left = 70
      Top = 30
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
      TabOrder = 11
      Text = 'ECompuesto'
    end
    object EDescCompuesto: TLFEdit
      Left = 146
      Top = 30
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
      TabOrder = 12
      Text = 'EDescCompuesto'
    end
    object EFLacado: TLFDBEditFind2000
      Left = 70
      Top = 105
      Width = 36
      Height = 21
      DataField = 'LACADO'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      TabOrder = 0
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
      Left = 107
      Top = 105
      Width = 114
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Tabla_a_buscar = 'Z_SYS_COLORES'
      Campo_Descripcion = 'DESCRIPCION'
      Base_de_datos = DMMain.DataBase
      CamposWhereOrigen.Strings = (
        'LACADO')
      CamposWhereTabla.Strings = (
        'CODIGO')
    end
    object DBChkBMotor: TLFDBCheckBox
      Left = 236
      Top = 107
      Width = 60
      Height = 17
      Caption = 'Motor'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
      DataField = 'MOTOR'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBChkBIncr: TLFDBCheckBox
      Left = 70
      Top = 130
      Width = 103
      Height = 17
      Caption = 'Incr. Lacado PVP'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
      DataField = 'INCR_LACADO_PVP'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBEIncLacado: TLFDbedit
      Left = 173
      Top = 127
      Width = 48
      Height = 21
      DataField = 'P_INCR_LACADO_PVP'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      TabOrder = 3
    end
    object DBELineal: TLFDbedit
      Left = 416
      Top = 83
      Width = 46
      Height = 21
      DataField = 'LINEAL'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnChange = DBELinealChange
    end
    object DBESalida: TLFDbedit
      Left = 416
      Top = 105
      Width = 46
      Height = 21
      DataField = 'SALIDA'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = DBESalidaChange
    end
    object DBEFModelo: TLFDBEditFind2000
      Left = 416
      Top = 61
      Width = 46
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'MODELO'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
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
      Left = 416
      Top = 127
      Width = 46
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TOTAL_M2_LONA'
      DataSource = ZDMOfertasArtDet.DSxLonaM2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object DBEUdsLona: TLFDbedit
      Left = 345
      Top = 128
      Width = 37
      Height = 21
      DataField = 'UNIDADES_LONA'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      TabOrder = 7
      OnChange = DBEUdsLonaChange
    end
    object EM2Lona: TLFEdit
      Left = 463
      Top = 127
      Width = 46
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
      TabOrder = 15
      Text = 'EM2Lona'
      Visible = False
    end
    object LFIncLacado: TLFDbedit
      Left = 239
      Top = 128
      Width = 74
      Height = 21
      DataField = 'TOTAL_INC_LACADO'
      DataSource = ZDMOfertasArtDet.DSQMOfertasCab
      TabOrder = 16
    end
  end
  inherited TBActions: TLFToolBar
    Width = 535
    TabOrder = 2
  end
  object PnlDetalle: TLFPanel [2]
    Left = 0
    Top = 153
    Width = 535
    Height = 179
    Align = alClient
    TabOrder = 1
    object TBDetalle: TLFToolBar
      Left = 1
      Top = 1
      Width = 533
      Height = 22
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
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
        DataSource = ZDMOfertasArtDet.DSQMOfertasDet
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
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 1
      Top = 23
      Width = 533
      Height = 155
      Align = alClient
      DataSource = ZDMOfertasArtDet.DSQMOfertasDet
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
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
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
        '')
      Posicion = tpCentrado
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        '')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TipoArt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DETALLE'
          Width = 70
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
          Width = 160
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
          Width = 44
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
          Width = 47
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
          Width = 55
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDet
    Left = 424
    Top = 228
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 464
    Top = 228
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
    DataSource = ZDMOfertasArtDet.DSQMOfertasDet
    EnlazadoA = CEMain
    PopUpMenu = CEDetPMEdit
    Teclas = DMMain.Teclas
    Left = 424
    Top = 262
  end
  object CEDetPMEdit: TPopUpTeclas
    Left = 464
    Top = 263
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
