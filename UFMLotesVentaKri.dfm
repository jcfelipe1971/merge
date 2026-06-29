object FMLotesVentaKri: TFMLotesVentaKri
  Left = 221
  Top = 162
  Width = 568
  Height = 422
  Caption = 'Lotes - Ventas'
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 29
    Align = alTop
    Enabled = False
    TabOrder = 0
    DesignSize = (
      560
      29)
    object ETitulo: TLFEdit
      Left = 105
      Top = 4
      Width = 452
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
  object PNLDisponibles: TLFPanel
    Left = 0
    Top = 65
    Width = 281
    Height = 330
    Align = alLeft
    TabOrder = 1
    object LDisponibles: TLFLabel
      Left = 1
      Top = 1
      Width = 279
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Disponibles'
    end
    object DBGDisponibles: TDBGrid
      Left = 1
      Top = 14
      Width = 279
      Height = 315
      Align = alClient
      DataSource = DMLotesVentaKri.DSQLotesDisponibles
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
  object PNLAsignados: TLFPanel
    Left = 281
    Top = 65
    Width = 279
    Height = 330
    Align = alClient
    TabOrder = 2
    object LAsignados: TLFLabel
      Left = 1
      Top = 1
      Width = 277
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Asignados'
    end
    object DBGAsignados: TDBGrid
      Left = 1
      Top = 14
      Width = 277
      Height = 315
      Align = alClient
      DataSource = DMLotesVentaKri.DSQLotesAsignados
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGAsignadosDblClick
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
  object PNLCantidad: TLFPanel
    Left = 0
    Top = 29
    Width = 560
    Height = 36
    Align = alTop
    TabOrder = 3
    object LCantidad: TLFLabel
      Left = 11
      Top = 11
      Width = 88
      Height = 13
      Caption = 'Cantidad a asignar'
    end
    object ECantidad: TLFEdit
      Left = 104
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 0
    end
  end
end
