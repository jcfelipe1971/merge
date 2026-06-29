object FMLotesMOEKri: TFMLotesMOEKri
  Left = 521
  Top = 163
  Width = 411
  Height = 406
  Caption = 'Lotes - Movimiento Manual de Entrada'
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
  object Panel1: TLFPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 30
    Align = alTop
    Enabled = False
    TabOrder = 0
    DesignSize = (
      403
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
      Width = 294
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
    Width = 403
    Height = 56
    Align = alTop
    TabOrder = 1
    object Label1: TLFLabel
      Left = 5
      Top = 7
      Width = 21
      Height = 13
      Caption = 'Lote'
    end
    object LCantidad: TLFLabel
      Left = 245
      Top = 7
      Width = 42
      Height = 13
      Caption = 'Cantidad'
    end
    object LCaducidad: TLFLabel
      Left = 149
      Top = 7
      Width = 51
      Height = 13
      Caption = 'Caducidad'
    end
    object ELote: TLFEdit
      Left = 3
      Top = 27
      Width = 142
      Height = 21
      TabOrder = 0
    end
    object BOK: TButton
      Left = 328
      Top = 26
      Width = 33
      Height = 24
      Caption = 'Ok'
      TabOrder = 3
      OnClick = BOKClick
    end
    object DTPCaducidad: TLFDateEdit
      Left = 146
      Top = 27
      Width = 95
      Height = 22
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object ECantidad: TLFEdit
      Left = 243
      Top = 27
      Width = 64
      Height = 21
      TabOrder = 2
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 86
    Width = 403
    Height = 293
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 401
      Height = 291
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
