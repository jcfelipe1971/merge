object FMNumerosDeSerieKriCompra: TFMNumerosDeSerieKriCompra
  Left = 335
  Top = 195
  Width = 370
  Height = 375
  ActiveControl = Edit1
  Caption = 'Nros. de Serie - Compra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    362
    348)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2K: TLFLabel
    Left = 240
    Top = 48
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
  object Label3K: TLFLabel
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
  object Label4K: TLFLabel
    Left = 120
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
  object Label5K: TLFLabel
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
    Left = 96
    Top = 66
    Width = 81
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '5'
    Color = cl3DLight
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
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label6K: TLFLabel
    Left = 100
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
  object Label1K: TLFLabel
    Left = 32
    Top = 120
    Width = 104
    Height = 16
    Caption = 'Nuevo N'#250'mero'
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
    DataSource = DMNumerosDeSerieKriCompra.DSxArticulos
    ReadOnly = True
    TabOrder = 1
  end
  object DBETitulo: TLFDbedit
    Left = 105
    Top = 18
    Width = 256
    Height = 21
    TabStop = False
    Color = clInfoBk
    DataField = 'TITULO'
    DataSource = DMNumerosDeSerieKriCompra.DSxArticulos
    ReadOnly = True
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 184
    Top = 66
    Width = 175
    Height = 281
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMNumerosDeSerieKriCompra.DSNumerosDeSerie
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Edit1: TLFEdit
    Left = 8
    Top = 136
    Width = 153
    Height = 21
    MaxLength = 25
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object BOK: TButton
    Left = 8
    Top = 208
    Width = 161
    Height = 25
    Caption = 'OK'
    Enabled = False
    TabOrder = 4
    OnClick = BOKClick
  end
end
