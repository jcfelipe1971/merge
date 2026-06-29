object FMDivisiones: TFMDivisiones
  Left = 346
  Top = 188
  Width = 315
  Height = 261
  Caption = 'FMDivisiones'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNLDatos: TLFPanel
    Left = 0
    Top = 29
    Width = 307
    Height = 164
    Align = alClient
    TabOrder = 0
    object DBGCab: TDBGridFind2000
      Left = 1
      Top = 1
      Width = 305
      Height = 88
      Align = alTop
      DataSource = DMDivisiones.DSxDivisionesCab
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
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      BuscarChars = False
      Campos.Strings = (
        'DIVISION')
      CamposAMostrar.Strings = (
        'DIVISION'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      Numericos.Strings = (
        'DIVISION')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'CON_DIVISIONES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      OnRowChange = DBGCabRowChange
      Planes.Strings = (
        '')
      OrdenMultiple = True
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          ReadOnly = True
          Width = 33
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIVISION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE'
          Visible = True
        end>
    end
    object DBGDet: TDBGridFind2000
      Left = 1
      Top = 89
      Width = 305
      Height = 74
      Align = alClient
      DataSource = DMDivisiones.DSxDivisionesDet
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 4
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
      BuscarChars = False
      Campos.Strings = (
        'DIVISION')
      CamposAMostrar.Strings = (
        'DIVISION'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      Numericos.Strings = (
        'DIVISION')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'CON_DIVISIONES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      OnRowChange = DBGDetRowChange
      Planes.Strings = (
        '')
      OrdenMultiple = True
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Width = 46
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          ReadOnly = True
          Width = 57
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIVISION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE'
          Width = 57
          Visible = True
        end>
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 307
    Height = 29
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object NavMain: TDBNavigator
      Left = 0
      Top = 2
      Width = 240
      Height = 22
      DataSource = DMDivisiones.DSxDivisionesCab
      TabOrder = 0
      OnClick = NavMainClick
    end
    object ToolButton2: TToolButton
      Left = 240
      Top = 2
      Width = 8
      Style = tbsSeparator
    end
    object TTermina: TToolButton
      Left = 248
      Top = 2
      Caption = 'TTermina'
      ImageIndex = 12
      OnClick = TTerminaClick
    end
  end
  object PNLTotal: TLFPanel
    Left = 0
    Top = 193
    Width = 307
    Height = 41
    Align = alBottom
    TabOrder = 2
    object LTotal: TLFLabel
      Left = 120
      Top = 12
      Width = 37
      Height = 16
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LSumaPorc: TLFLabel
      Left = 176
      Top = 10
      Width = 113
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
  end
end
