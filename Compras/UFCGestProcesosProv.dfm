object FCGestProcesosProv: TFCGestProcesosProv
  Left = 268
  Top = 166
  Width = 768
  Height = 474
  HelpContext = 206
  Caption = 'Hist'#243'rico de Procesos Autom'#225'ticos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 760
    Height = 22
    AutoSize = True
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    object LBLSerie: TLFLabel
      Left = 0
      Top = 0
      Width = 40
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object DBLCBSerie: TDBLookupComboBox
      Left = 40
      Top = 0
      Width = 133
      Height = 21
      DropDownWidth = 250
      KeyField = 'SERIE'
      ListField = 'SERIE;TITULO'
      ListFieldIndex = 1
      ListSource = DMGestProcesosProv.DSxSeries
      TabOrder = 0
    end
    object LBLProceso: TLFLabel
      Left = 173
      Top = 0
      Width = 60
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'Proceso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object DBLCBProc: TDBLookupComboBox
      Left = 233
      Top = 0
      Width = 105
      Height = 21
      KeyField = 'TIPO'
      ListField = 'TIPO;TITULO'
      ListFieldIndex = 1
      ListSource = DMGestProcesosProv.DSxProcesos
      TabOrder = 1
    end
    object TButtSeparador1: TToolButton
      Left = 338
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtDeshacer: TToolButton
      Left = 346
      Top = 0
      Hint = 'Deshacer la facturaci'#243'n'
      Caption = 'Deshacer'
      ImageIndex = 27
      OnClick = TButtDeshacerClick
    end
    object TButtRefresca: TToolButton
      Left = 369
      Top = 0
      Hint = 'Refresca la informaci'#243'n en Pantalla'
      Caption = 'Refrescar'
      ImageIndex = 26
      OnClick = TButtRefrescaClick
    end
    object TButtImprimir: TToolButton
      Left = 392
      Top = 0
      Hint = 'Imprime las Facturas seleccionadas'
      Caption = 'Imprimir'
      ImageIndex = 14
      OnClick = TButtImprimirClick
    end
    object TButtSeparador2: TToolButton
      Left = 415
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtCierra: TToolButton
      Left = 423
      Top = 0
      Hint = 'Cerrar la ventana'
      Caption = 'Cierra'
      ImageIndex = 0
      OnClick = TButtCierraClick
    end
  end
  object HYTDBGMain: THYTDBGrid
    Left = 0
    Top = 22
    Width = 760
    Height = 425
    Align = alClient
    Color = clInfoBk
    DataSource = DMGestProcesosProv.DSxVerGesPrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FSMain
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    Idioma = 'CAS'
    AutoDeseleccionar = True
    PermutaPaneles = False
    CamposAOrdenar.Strings = (
      'ANTERIOR'
      'CONTADOR'
      'FECHA_E'
      'FECHA_S'
      'NOMBRE'
      'PROCESO'
      'SIGNO'
      'TIPO'
      'UBICACION'
      'USUARIO')
    CamposAOrdenarImgs = DMMain.ILOrdGrid
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Expanded = False
        FieldName = 'PROCESO'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTADOR'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANTERIOR'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_E'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_S'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UBICACION'
        Width = 100
        Visible = True
      end>
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 355
    Top = 80
  end
end
