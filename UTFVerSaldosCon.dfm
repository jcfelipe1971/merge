object FVerSaldosCon: TFVerSaldosCon
  Left = 378
  Top = 313
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ver Saldos Contables'
  ClientHeight = 466
  ClientWidth = 792
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
  object DBGMain: THYTDBGrid
    Left = 0
    Top = 26
    Width = 792
    Height = 440
    Align = alClient
    Color = clInfoBk
    DataSource = DMSaldosCon.DSxSalida
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    AutoDeseleccionar = True
    PermutaPaneles = False
    CamposAOrdenar.Strings = (
      'CANAL'
      'CONSULTA'
      'CUENTA'
      'DEBE'
      'HABER'
      'SALDO'
      'TITULO')
    CamposAOrdenarImgs = DMMain.ILOrdGrid
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Alignment = taRightJustify
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONSULTA'
        Title.Alignment = taRightJustify
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Width = 305
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBE'
        Title.Alignment = taRightJustify
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HABER'
        Title.Alignment = taRightJustify
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taRightJustify
        Width = 87
        Visible = True
      end>
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 26
    AutoSize = True
    Caption = ''
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Separators = True
    object PTitulo: TLFPanel
      Left = 0
      Top = 0
      Width = 604
      Height = 22
      AutoSize = True
      BevelOuter = bvNone
      Caption = ''
      Enabled = False
      TabOrder = 0
      object Label1: TLFLabel
        Left = 0
        Top = 0
        Width = 51
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Consulta'
        Layout = tlCenter
      end
      object DBConsulta: TLFDbedit
        Left = 52
        Top = 0
        Width = 42
        Height = 21
        Color = clInfoBk
        DataField = 'CONSULTA'
        DataSource = DMSaldosCon.DSQMConsultas
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBETitulo: TLFDbedit
        Left = 95
        Top = 0
        Width = 326
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMSaldosCon.DSQMConsultas
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEFecha: TLFDbedit
        Left = 422
        Top = 0
        Width = 66
        Height = 21
        Color = clInfoBk
        DataField = 'FECHA'
        DataSource = DMSaldosCon.DSxSalida
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBESaldo: TLFDbedit
        Left = 489
        Top = 0
        Width = 115
        Height = 21
        Color = clInfoBk
        DataField = 'SALDOS'
        DataSource = DMSaldosCon.DSxSaldo
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object ToolButton2: TToolButton
      Left = 604
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object NavMain: THYMNavigator
      Left = 612
      Top = 0
      Width = 88
      Height = 22
      DataSource = DMSaldosCon.DSxSalida
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object ToolButton1: TToolButton
      Left = 700
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtImprime: TToolButton
      Left = 708
      Top = 0
      Hint = 'Imprime el contenido de esta pantalla'
      Caption = 'Imprimir'
      ImageIndex = 14
      OnClick = TButtImprimeClick
    end
    object TButtRefresca: TToolButton
      Left = 731
      Top = 0
      Hint = 'Refresca la informaci'#243'n'
      Caption = 'Refrescar'
      ImageIndex = 39
      OnClick = TButtRefrescaClick
    end
    object TButtSalir: TToolButton
      Left = 754
      Top = 0
      Hint = 'Sale de esta ventana'
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
  end
end
