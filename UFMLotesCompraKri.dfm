object FMLotesCompraKri: TFMLotesCompraKri
  Left = 323
  Top = 154
  Width = 390
  Height = 409
  Caption = 'Lotes - Compra'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TLFPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 30
    Align = alTop
    Enabled = False
    TabOrder = 0
    DesignSize = (
      382
      30)
    object EArticulo: TLFEdit
      Left = 2
      Top = 4
      Width = 103
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object ETitulo: TLFEdit
      Left = 104
      Top = 4
      Width = 275
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TLFPanel
    Left = 0
    Top = 30
    Width = 382
    Height = 51
    Align = alTop
    TabOrder = 1
    object Label1: TLFLabel
      Left = 5
      Top = 3
      Width = 21
      Height = 13
      Caption = 'Lote'
    end
    object Label2: TLFLabel
      Left = 133
      Top = 3
      Width = 51
      Height = 13
      Caption = 'Caducidad'
    end
    object Label3: TLFLabel
      Left = 259
      Top = 3
      Width = 42
      Height = 13
      Caption = 'Cantidad'
    end
    object ELote: TLFEdit
      Left = 3
      Top = 18
      Width = 127
      Height = 21
      TabOrder = 0
    end
    object ECantidad: TLFEdit
      Left = 257
      Top = 18
      Width = 77
      Height = 21
      TabOrder = 2
    end
    object Button1: TButton
      Left = 344
      Top = 16
      Width = 30
      Height = 25
      Caption = 'Ok'
      TabOrder = 3
      OnClick = Button1Click
    end
    object DTPCaducidad: TLFDateEdit
      Left = 132
      Top = 18
      Width = 123
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 81
    Width = 382
    Height = 301
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 380
      Height = 299
      Align = alClient
      Color = clInfoBk
      DataSource = DMLotesCompraKri.DSQLotes
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'LOTE'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CADUCIDAD'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COUNT'
          Width = 79
          Visible = True
        end>
    end
  end
end
