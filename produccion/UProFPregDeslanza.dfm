object ProFPregDeslanza: TProFPregDeslanza
  Left = 362
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Deslanzamiento de Orden'
  ClientHeight = 171
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGDeslanza: TDBGridFind2000
    Left = 0
    Top = 29
    Width = 312
    Height = 142
    Align = alClient
    DataSource = ProDMPregDeslanza.DSQMLanza_Masivo
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 3
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
    CampoAOrdenarColor = clInfoBk
    CampoAOrdenarBitmaps = DMMain.ILOrdGrid
    ColumnasCheckBoxes.Strings = (
      'MARCA')
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
        Color = clInfoBk
        Expanded = False
        FieldName = 'ID_CAB'
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA'
        Visible = True
      end>
  end
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 312
    Height = 29
    EdgeBorders = []
    HotImages = DMMain.ILMain_In
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Deslanzar Ordenes'
      Caption = 'Deslanzar'
      ImageIndex = 51
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 23
      Top = 2
      Width = 8
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 2
      Hint = 'Salir'
      Caption = 'Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
  end
end
