object FMNumerosDeSerieMOEKri: TFMNumerosDeSerieMOEKri
  Left = 364
  Top = 290
  Width = 399
  Height = 406
  ActiveControl = ENroSerie
  Caption = 'Nros. de Serie - Movimiento Manual de Entrada'
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
    Width = 391
    Height = 30
    Align = alTop
    Enabled = False
    TabOrder = 0
    DesignSize = (
      391
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
      Width = 282
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
    Width = 391
    Height = 48
    Align = alTop
    TabOrder = 1
    object Label1: TLFLabel
      Left = 5
      Top = 6
      Width = 47
      Height = 13
      Caption = 'Nro. Serie'
    end
    object LAsignados: TLFLabel
      Left = 6
      Top = 28
      Width = 49
      Height = 13
      Caption = 'Asignados'
    end
    object LCantidad: TLFLabel
      Left = 152
      Top = 29
      Width = 42
      Height = 13
      Caption = 'Cantidad'
    end
    object ENroSerie: TLFEdit
      Left = 59
      Top = 2
      Width = 218
      Height = 21
      TabOrder = 0
      OnKeyPress = ENroSerieKeyPress
    end
    object BOK: TButton
      Left = 328
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Ok'
      Enabled = False
      TabOrder = 1
      OnClick = BOKClick
    end
    object EAsignados: TLFEdit
      Left = 59
      Top = 24
      Width = 78
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
    object ECantidad: TLFEdit
      Left = 199
      Top = 24
      Width = 78
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 78
    Width = 391
    Height = 301
    Align = alClient
    Enabled = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 389
      Height = 299
      Align = alClient
      Color = clInfoBk
      DataSource = DMNumerosDeSerieMOEKri.DSAsignado
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
          Width = 343
          Visible = True
        end>
    end
  end
end
