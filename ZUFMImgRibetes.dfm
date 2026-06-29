object ZFMImgRibetes: TZFMImgRibetes
  Left = 220
  Top = 107
  Width = 766
  Height = 576
  BorderIcons = [biSystemMenu]
  Caption = 'Selecci'#243'n de Ribete'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBCGRibetes: TLFDBCtrlGrid
    Left = 0
    Top = 0
    Width = 758
    Height = 549
    Align = alClient
    ColCount = 3
    DataSource = ZDMImgRibetes.DSxRibetes
    PanelHeight = 183
    PanelWidth = 247
    TabOrder = 0
    RowCount = 3
    object DBEDescRibete: TLFDbedit
      Left = 40
      Top = 161
      Width = 205
      Height = 21
      Color = clInfoBk
      DataField = 'DESCRIPCION'
      DataSource = ZDMImgRibetes.DSxRibetes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnDblClick = DBImageDblClick
    end
    object DBERibete: TLFDbedit
      Left = 2
      Top = 161
      Width = 37
      Height = 21
      Color = clInfoBk
      DataField = 'CODIGO'
      DataSource = ZDMImgRibetes.DSxRibetes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnDblClick = DBImageDblClick
    end
    object DBImage: TDBImage
      Left = 2
      Top = 2
      Width = 243
      Height = 158
      DataField = 'IMAGEN'
      DataSource = ZDMImgRibetes.DSxRibetes
      Stretch = True
      TabOrder = 2
      OnDblClick = DBImageDblClick
    end
  end
end
