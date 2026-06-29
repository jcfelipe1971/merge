object FMEscCond: TFMEscCond
  Left = 643
  Top = 322
  HelpContext = 92
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Escalado de Condiciones'
  ClientHeight = 343
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
      DataSource = DMEscCond.DSQMDetalle
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
    Height = 123
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object LBLArticulo: TLFLabel
      Left = 43
      Top = 8
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
      Left = 48
      Top = 30
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
    object LBLPerfil: TLFLabel
      Left = 57
      Top = 52
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Perfil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LBLCliente: TLFLabel
      Left = 48
      Top = 74
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LBLAgrupacion: TLFLabel
      Left = 9
      Top = 96
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Agrup. Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEArticulo: TLFDbedit
      Left = 84
      Top = 4
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'ARTICULO'
      DataSource = DMEscCond.DSxCondCli
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
      Left = 175
      Top = 4
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_ARTICULO'
      DataSource = DMEscCond.DSxCondCli
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
      Left = 84
      Top = 26
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'FAMILIA'
      DataSource = DMEscCond.DSxCondCli
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
      Left = 175
      Top = 26
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_FAMILIA'
      DataSource = DMEscCond.DSxCondCli
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
    object DBEPerfil: TLFDbedit
      Left = 84
      Top = 48
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'PERFIL'
      DataSource = DMEscCond.DSxCondCli
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
    object DBETitPerfil: TLFDbedit
      Left = 175
      Top = 48
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_PERFIL'
      DataSource = DMEscCond.DSxCondCli
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
    object DBECliente: TLFDbedit
      Left = 84
      Top = 70
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'CLIENTE'
      DataSource = DMEscCond.DSxCondCli
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
    object DBETitCliente: TLFDbedit
      Left = 175
      Top = 70
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_CLIENTE'
      DataSource = DMEscCond.DSxCondCli
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
    object DBEAgrupacion: TLFDbedit
      Left = 84
      Top = 92
      Width = 90
      Height = 21
      Color = clInfoBk
      DataField = 'AGRUPACION'
      DataSource = DMEscCond.DSxCondCli
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBETitAgrupacion: TLFDbedit
      Left = 175
      Top = 92
      Width = 370
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO_AGRUPACION'
      DataSource = DMEscCond.DSxCondCli
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object DBGFDetalle: TDBGridFind2000
    Left = 0
    Top = 149
    Width = 592
    Height = 194
    Align = alClient
    DataSource = DMEscCond.DSQMDetalle
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
  object CETarifasPArticulo: TControlEdit
    PopUpMenu = PopupTarifasPArticulo
    Teclas = DMMain.Teclas
    Left = 280
    Top = 176
  end
  object PopupTarifasPArticulo: TPopUpTeclas
    Left = 328
    Top = 176
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
