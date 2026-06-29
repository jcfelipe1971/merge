object ProFMReloj: TProFMReloj
  Left = 255
  Top = 95
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Importar datos reloj SPEC'
  ClientHeight = 478
  ClientWidth = 590
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
  object Bevel2: TBevel
    Left = 8
    Top = 429
    Width = 582
    Height = 42
  end
  object Bevel1: TBevel
    Left = 8
    Top = 376
    Width = 609
    Height = 41
  end
  object LblRecurso: TLFLabel
    Left = 19
    Top = 392
    Width = 46
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Recurso'
    Enabled = False
  end
  object LblIncidencias: TLFLabel
    Left = 9
    Top = 264
    Width = 60
    Height = 13
    AutoSize = False
    Caption = 'Incidencias:'
  end
  object LblParametro: TLFLabel
    Left = 19
    Top = 371
    Width = 50
    Height = 13
    AutoSize = False
    Caption = 'Parametro'
    Enabled = False
  end
  object LblResumen: TLFLabel
    Left = 18
    Top = 424
    Width = 134
    Height = 13
    Caption = 'Resumen importaci'#243'n datos:'
  end
  object LblRegTotal: TLFLabel
    Left = 26
    Top = 445
    Width = 81
    Height = 13
    Alignment = taRightJustify
    Caption = 'Registros totales:'
  end
  object LblRegCorrecto: TLFLabel
    Left = 205
    Top = 446
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = 'Registros Correctos:'
  end
  object LblRegIncorr: TLFLabel
    Left = 410
    Top = 445
    Width = 103
    Height = 13
    Alignment = taRightJustify
    Caption = 'Registros Incorrectos:'
  end
  object LblRegTot: TLFLabel
    Left = 123
    Top = 446
    Width = 46
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRegCor: TLFLabel
    Left = 323
    Top = 446
    Width = 46
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRegInc: TLFLabel
    Left = 528
    Top = 446
    Width = 46
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblReloj: TLFLabel
    Left = 9
    Top = 33
    Width = 34
    Height = 13
    Caption = 'Reloj:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTipoReloj: TLFLabel
    Left = 50
    Top = 33
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 590
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtAbrir: TToolButton
      Left = 0
      Top = 0
      Hint = 'Seleccionar fichero datos reloj'
      Caption = 'Seleccionar fichero datos reloj'
      DropdownMenu = PMAbrir
      ImageIndex = 65
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
      OnClick = TButtAbrirClick
    end
    object TButtImportar: TToolButton
      Left = 36
      Top = 0
      Hint = 'Importar datos a marcajes operario'
      ImageIndex = 43
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtImportarClick
    end
    object TSep1: TToolButton
      Left = 59
      Top = 0
      Width = 19
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 78
      Top = 0
      Hint = 'Salir'
      Caption = 'Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtSalirClick
    end
  end
  object DBEDescRecurso: TLFDbedit
    Left = 210
    Top = 389
    Width = 369
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clInfoBk
    DataField = 'TITULO'
    DataSource = ProDMReloj.DSxDescRecurso
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
  object DBLCBRecurso: TDBLookupComboBox
    Left = 72
    Top = 389
    Width = 137
    Height = 21
    DropDownRows = 10
    DropDownWidth = 300
    Enabled = False
    KeyField = 'RECURSO'
    ListField = 'RECURSO ; TITULO'
    ListSource = ProDMReloj.DSxRecursos
    TabOrder = 2
    OnClick = DBLCBRecursoChange
  end
  object TextoPre: TListBox
    Left = 530
    Top = 16
    Width = 37
    Height = 17
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object Texto: TListBox
    Left = 466
    Top = 16
    Width = 37
    Height = 17
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object LVIncidencia: TListView
    Left = 8
    Top = 278
    Width = 577
    Height = 91
    Columns = <
      item
        Caption = 'Linea'
      end
      item
        Caption = 'Problema'
        Width = 556
      end>
    RowSelect = True
    PopupMenu = PMVerInc
    TabOrder = 5
    ViewStyle = vsReport
  end
  object SGDetalle: TStringGrid
    Left = 8
    Top = 52
    Width = 580
    Height = 208
    ColCount = 2
    DefaultRowHeight = 15
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 6
  end
  object Dialogo: TOpenDialog
    Filter = 'Toma Reloj (*.spe)|*.spe'
    InitialDir = 'C:\'
    Title = 'Abrir fichero reloj SPEC'
    Left = 544
    Top = 64
  end
  object PMVerInc: TPopupMenu
    AutoHotkeys = maManual
    Left = 208
    Top = 4
    object VerFicheroIncidencias: TMenuItem
      Caption = '&Ver Fichero Incidencias'
      Enabled = False
      OnClick = VerFicheroIncidenciasClick
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = False
    StoredValues = <>
    Left = 544
    Top = 132
  end
  object PMAbrir: TPopupMenu
    AutoHotkeys = maManual
    Left = 148
    Top = 5
    object MIAbrirMarc: TMenuItem
      Caption = 'Abrir &Marcajes'
      OnClick = TButtAbrirClick
    end
    object MIAbrirInc: TMenuItem
      Caption = 'Abrir &Incidencias'
      OnClick = TButtAbrirClick
    end
  end
end
