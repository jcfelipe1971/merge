object FMVentasCliFec: TFMVentasCliFec
  Left = 351
  Top = 240
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Factura mas reciente de cliente'
  ClientHeight = 447
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 825
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    object TButtImprimir: TToolButton
      Left = 0
      Top = 0
      Hint = 'Visualizar Listado'
      Caption = 'Visualizar Listado'
      ImageIndex = 14
    end
    object TButtConfigurar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Configuracion R'#225'pida del listado'
      Caption = 'Configurar'
      ImageIndex = 77
    end
    object ToolButton5: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPMain: THYMEditPanel
      Left = 54
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
  end
  object DBGFArticulosCli: TDBGridFind2000
    Left = 0
    Top = 22
    Width = 825
    Height = 425
    Align = alClient
    Color = clInfoBk
    DataSource = DMVentasCliFec.DSxClienteFec
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
    BaseDeDatos = DMMain.DataBase
    BuscarNums = False
    CampoAOrdenarColor = clInfoBk
    ColumnasCheckBoxes.Strings = (
      'RECIBIDO')
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
    Entorno = DMMain.EntornoBusqueda
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Title.Alignment = taCenter
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Alignment = taCenter
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_R_SOCIAL'
        Title.Alignment = taCenter
        Width = 344
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO01'
        Title.Alignment = taCenter
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RIG'
        Title.Alignment = taCenter
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS'
        Title.Alignment = taRightJustify
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end>
  end
end
