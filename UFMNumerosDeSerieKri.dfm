object FMNumerosDeSerieKri: TFMNumerosDeSerieKri
  Left = 387
  Top = 157
  Width = 402
  Height = 375
  Caption = 'Nros. De Serie - Ventas'
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
  object Label1: TLFLabel
    Left = 40
    Top = 93
    Width = 76
    Height = 16
    Caption = 'Disponible'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLFLabel
    Left = 240
    Top = 93
    Width = 67
    Height = 16
    Caption = 'Asignado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLFLabel
    Left = 8
    Top = 0
    Width = 51
    Height = 16
    Caption = 'Codigo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLFLabel
    Left = 128
    Top = 0
    Width = 53
    Height = 16
    Caption = 'Articulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLFLabel
    Left = 9
    Top = 48
    Width = 63
    Height = 16
    Caption = 'Cantidad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LCantAsignada: TLFLabel
    Left = 112
    Top = 66
    Width = 81
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '5'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object LCantidad: TLFLabel
    Left = 0
    Top = 66
    Width = 81
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '5'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label6: TLFLabel
    Left = 116
    Top = 48
    Width = 75
    Height = 16
    Caption = 'Asignados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEArticulo: TLFDbedit
    Left = 0
    Top = 18
    Width = 106
    Height = 21
    TabStop = False
    Color = clInfoBk
    DataField = 'ARTICULO'
    DataSource = DMNumerosDeSerieKri.DSxArticulos
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object DBETitulo: TLFDbedit
    Left = 105
    Top = 18
    Width = 288
    Height = 21
    TabStop = False
    Color = clInfoBk
    DataField = 'TITULO'
    DataSource = DMNumerosDeSerieKri.DSxArticulos
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBGAsignado: TDBGrid
    Left = 216
    Top = 112
    Width = 177
    Height = 233
    DataSource = DMNumerosDeSerieKri.DSNroSerieAsignado
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGAsignadoDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_SERIE'
        Width = 151
        Visible = True
      end>
  end
  object DBGDisponible: TDBGrid
    Left = 0
    Top = 112
    Width = 217
    Height = 233
    DataSource = DMNumerosDeSerieKri.DSNroSerieDisponible
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGDisponibleDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_SERIE'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALMACEN_ENT'
        Visible = True
      end>
  end
  object BOK: TButton
    Left = 232
    Top = 56
    Width = 145
    Height = 33
    Caption = 'OK'
    Enabled = False
    TabOrder = 4
    OnClick = BOKClick
  end
end
