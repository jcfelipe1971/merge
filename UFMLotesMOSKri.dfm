object FMLotesMOSKri: TFMLotesMOSKri
  Left = 433
  Top = 144
  Width = 568
  Height = 380
  Caption = 'Lotes - Movimientos Manuales de Salida'
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
    Width = 560
    Height = 29
    Align = alTop
    TabOrder = 0
    DesignSize = (
      560
      29)
    object EArticulo: TLFEdit
      Left = 3
      Top = 4
      Width = 103
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object ETitulo: TLFEdit
      Left = 105
      Top = 4
      Width = 451
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TLFPanel
    Left = 0
    Top = 29
    Width = 560
    Height = 53
    Align = alTop
    TabOrder = 1
    object Label1: TLFLabel
      Left = 11
      Top = 10
      Width = 88
      Height = 13
      Caption = 'Cantidad a asignar'
    end
    object Label2: TLFLabel
      Left = 85
      Top = 35
      Width = 54
      Height = 13
      Caption = 'Disponibles'
    end
    object Label3: TLFLabel
      Left = 313
      Top = 35
      Width = 49
      Height = 13
      Caption = 'Asignados'
    end
    object ECantidad: TLFEdit
      Left = 104
      Top = 7
      Width = 81
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 82
    Width = 281
    Height = 271
    Align = alLeft
    TabOrder = 2
    object DBGDisponibles: TDBGrid
      Left = 1
      Top = 1
      Width = 279
      Height = 269
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
  object Panel4: TLFPanel
    Left = 281
    Top = 82
    Width = 279
    Height = 271
    Align = alClient
    TabOrder = 3
    object DBGAsignados: TDBGrid
      Left = 1
      Top = 1
      Width = 277
      Height = 269
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
end
