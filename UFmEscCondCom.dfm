object FMEscCondCom: TFMEscCondCom
  Left = 638
  Top = 271
  HelpContext = 92
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Escalado de Condiciones de Compras'
  ClientHeight = 382
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupTarifasPArticulo
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 26
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 220
      Height = 22
      DataSource = DMEscCondCom.DSQMDetalle
      Flat = True
      ParentShowHint = False
      PopupMenu = PopupTarifasPArticulo
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = DBGFDetalle
      Exclusivo = True
      ControlEdit = CETarifasPArticulo
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object ToolButton1: TToolButton
      Left = 220
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPMain: THYMEditPanel
      Left = 228
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
    end
  end
  object PMain: TLFPanel
    Left = 0
    Top = 26
    Width = 592
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object LBLArticulo: TLFLabel
      Left = 35
      Top = 32
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LBLFamilia: TLFLabel
      Left = 40
      Top = 53
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Familia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LBLProveedor: TLFLabel
      Left = 23
      Top = 10
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LBLAgrupacion: TLFLabel
      Left = 18
      Top = 75
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Agrupaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEArticulo: TLFDbedit
      Left = 76
      Top = 28
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'ARTICULO'
      DataSource = DMEscCondCom.DSxCondProv
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBETitArticulo: TLFDbedit
      Left = 167
      Top = 28
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_ARTICULO'
      DataSource = DMEscCondCom.DSxCondProv
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
    object DBEFamilia: TLFDbedit
      Left = 76
      Top = 50
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'FAMILIA'
      DataSource = DMEscCondCom.DSxCondProv
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
    object DBETitFamilia: TLFDbedit
      Left = 167
      Top = 50
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_FAMILIA'
      DataSource = DMEscCondCom.DSxCondProv
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
    object DBEProveedor: TLFDbedit
      Left = 76
      Top = 6
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'PROVEEDOR'
      DataSource = DMEscCondCom.DSxCondProv
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBETitProveedor: TLFDbedit
      Left = 167
      Top = 6
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_PROVEEDOR'
      DataSource = DMEscCondCom.DSxCondProv
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBETitAgrupacion: TLFDbedit
      Left = 167
      Top = 72
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_AGRUPACION'
      DataSource = DMEscCondCom.DSxCondProv
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEAgrupacion: TLFDbedit
      Left = 76
      Top = 72
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'AGRUPACION'
      DataSource = DMEscCondCom.DSxCondProv
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object DBGFDetalle: TDBGridFind2000
    Left = 0
    Top = 126
    Width = 592
    Height = 132
    Align = alClient
    DataSource = DMEscCondCom.DSQMDetalle
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 1
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
    BaseDeDatos = DMMain.DataBase
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
        FieldName = 'LINEA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNID_MINIMAS'
        Width = 85
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'UNID_MAXIMAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTO_2'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTO_3'
        Width = 70
        Visible = True
      end>
  end
  object DBGFDetallePorPrecio: TDBGridFind2000
    Left = 0
    Top = 258
    Width = 592
    Height = 124
    Align = alBottom
    DataSource = DMEscCondCom.DSQMDetallePorPrecio
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 1
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
    BaseDeDatos = DMMain.DataBase
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
        FieldName = 'LINEA'
        ReadOnly = True
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_MIN'
        Width = 85
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'PRECIO_MAX'
        ReadOnly = True
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTO_2'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTO_3'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADES'
        Width = 80
        Visible = True
      end>
  end
  object CETarifasPArticulo: TControlEdit
    PopUpMenu = PopupTarifasPArticulo
    Teclas = DMMain.Teclas
    Left = 256
    Top = 232
  end
  object PopupTarifasPArticulo: TPopUpTeclas
    Left = 304
    Top = 232
    object CETarifasPArticuloMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CETarifasPArticuloMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CETarifasPArticuloMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CETarifasPArticuloMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CETarifasPArticuloMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CETarifasPArticuloMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CETarifasPArticuloMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETarifasPArticuloMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETarifasPArticuloMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETarifasPArticuloMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
