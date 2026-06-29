object FMLotesDevKri: TFMLotesDevKri
  Left = 350
  Top = 190
  Width = 566
  Height = 416
  Caption = 'Lotes - Devoluci'#243'n de Ventas'
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
  object Panel4: TLFPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 29
    Align = alTop
    Enabled = False
    TabOrder = 0
    DesignSize = (
      558
      29)
    object ETitulo: TLFEdit
      Left = 105
      Top = 4
      Width = 450
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object EArticulo: TLFEdit
      Left = 3
      Top = 4
      Width = 103
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 29
    Width = 558
    Height = 52
    Align = alTop
    TabOrder = 1
    object Label1: TLFLabel
      Left = 11
      Top = 11
      Width = 88
      Height = 13
      Caption = 'Cantidad a asignar'
    end
    object Label2: TLFLabel
      Left = 85
      Top = 36
      Width = 48
      Height = 13
      Caption = 'Devueltos'
    end
    object Label3: TLFLabel
      Left = 385
      Top = 36
      Width = 54
      Height = 13
      Caption = 'Disponibles'
    end
    object ECantidad: TLFEdit
      Left = 104
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 0
    end
  end
  object Panel1: TLFPanel
    Left = 0
    Top = 81
    Width = 281
    Height = 308
    Align = alLeft
    TabOrder = 2
    object DBGDevueltos: TDBGrid
      Left = 1
      Top = 1
      Width = 279
      Height = 306
      Align = alClient
      DataSource = DMLotesDevKri.DSQLotesDevueltos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGDevueltosDblClick
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COUNT'
          ReadOnly = True
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Width = 83
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CADUCIDAD'
          ReadOnly = True
          Width = 61
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN_ENT'
          ReadOnly = True
          Width = 48
          Visible = True
        end>
    end
  end
  object Panel2: TLFPanel
    Left = 281
    Top = 81
    Width = 277
    Height = 308
    Align = alClient
    TabOrder = 3
    object DBGDisponibles: TDBGrid
      Left = 1
      Top = 1
      Width = 275
      Height = 306
      Align = alClient
      DataSource = DMLotesDevKri.DSQLotesDisponibles
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGDisponiblesDblClick
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COUNT'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Width = 103
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CADUCIDAD'
          ReadOnly = True
          Width = 86
          Visible = True
        end>
    end
  end
end
