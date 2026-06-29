object ProFMRelacionUds: TProFMRelacionUds
  Left = 192
  Top = 107
  Width = 400
  Height = 247
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Mantenimiento de Relaci'#243'n de Unidades'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 392
    Height = 23
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 220
      Height = 22
      DataSource = ProDMRelacionUds.DSRelacionUds
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TSepNav: TToolButton
      Left = 220
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBSalir: TToolButton
      Left = 228
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TBSalirClick
    end
  end
  object PnlMain: TLFPanel
    Left = 0
    Top = 23
    Width = 392
    Height = 197
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGFMain: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 392
      Height = 197
      Align = alClient
      DataSource = ProDMRelacionUds.DSRelacionUds
      TabOrder = 0
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
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'UNIDAD'
        'UNIDAD_DEST')
      CamposAMostrar.Strings = (
        'UNIDAD'
        '0'
        'UNIDAD_DEST'
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
      CamposAOrdernar.Strings = (
        'CANTIDAD_DEST'
        'UNIDAD'
        'UNIDAD_DEST')
      MensajeNoExiste = False
      Numericos.Strings = (
        'TIPO'
        'TIPO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'SYS_UNIDADES_ARTICULOS'
        'SYS_UNIDADES_ARTICULOS')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      Posicion = tpCentrado
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        '')
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANTIDAD_ORIG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDAD'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD_DEST'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDAD_DEST'
          Width = 83
          Visible = True
        end>
    end
  end
end
