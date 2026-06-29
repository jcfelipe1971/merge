object FMReportesReportSmith: TFMReportesReportSmith
  Left = 349
  Top = 226
  Width = 640
  Height = 480
  ActiveControl = LBReportes
  Caption = 'Reportes Report Smith'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNLCabecera: TLFPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      632
      49)
    object LCarpeta: TLFLabel
      Left = 24
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Carpeta'
    end
    object LTipoReporte: TLFLabel
      Left = 40
      Top = 29
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    object ECarpetaReportes: TLFEdit
      Left = 64
      Top = 3
      Width = 555
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object ETipoReporte: TLFEdit
      Left = 64
      Top = 25
      Width = 555
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
      OnChange = ETipoReporteChange
    end
  end
  object PNLPie: TLFPanel
    Left = 0
    Top = 412
    Width = 632
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BImprimir: TButton
      Left = 280
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = BImprimirClick
    end
  end
  object PNLListados: TLFPanel
    Left = 0
    Top = 49
    Width = 632
    Height = 363
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object LBReportes: TListBox
      Left = 0
      Top = 0
      Width = 632
      Height = 363
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = LBReportesDblClick
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 568
    Top = 8
  end
end
