object FMNumerosDeSerieMOSKri: TFMNumerosDeSerieMOSKri
  Left = 498
  Top = 300
  Width = 605
  Height = 407
  Caption = 'Nros. de serie - Movimiento Manual de Salida'
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
    Width = 597
    Height = 30
    Align = alTop
    Enabled = False
    TabOrder = 0
    DesignSize = (
      597
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
      Width = 488
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
    Width = 597
    Height = 41
    Align = alTop
    TabOrder = 1
    DesignSize = (
      597
      41)
    object LAsignados: TLFLabel
      Left = 6
      Top = 15
      Width = 49
      Height = 13
      Caption = 'Asignados'
    end
    object LCantidad: TLFLabel
      Left = 152
      Top = 15
      Width = 42
      Height = 13
      Caption = 'Cantidad'
    end
    object BOK: TButton
      Left = 542
      Top = 5
      Width = 49
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Enabled = False
      TabOrder = 0
      OnClick = BOKClick
    end
    object EAsignados: TLFEdit
      Left = 59
      Top = 11
      Width = 78
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object ECantidad: TLFEdit
      Left = 199
      Top = 11
      Width = 78
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 71
    Width = 297
    Height = 309
    Align = alLeft
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 295
      Height = 307
      Align = alClient
      Color = clInfoBk
      DataSource = DMNumerosDeSerieMOSKri.DSDisponible
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
          FieldName = 'NRO_SERIE'
          Width = 213
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Visible = True
        end>
    end
  end
  object Panel4: TLFPanel
    Left = 297
    Top = 71
    Width = 300
    Height = 309
    Align = alClient
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 298
      Height = 307
      Align = alClient
      Color = clInfoBk
      DataSource = DMNumerosDeSerieMOSKri.DSAsignado
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid2DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NRO_SERIE'
          Width = 216
          Visible = True
        end>
    end
  end
end
