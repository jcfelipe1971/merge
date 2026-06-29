object FMImportacionNorma43SLucia: TFMImportacionNorma43SLucia
  Left = 304
  Top = 158
  Width = 593
  Height = 359
  Caption = 'Importacion Norma CSB 43'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TLFPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      585
      38)
    object LCarpeta: TLFLabel
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Caption = 'Carpeta'
    end
    object ECarpeta: TLFEdit
      Left = 56
      Top = 8
      Width = 434
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object TButtAbrir: TButton
      Left = 497
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Abrir'
      TabOrder = 1
      OnClick = TButtAbrirClick
    end
  end
  object PNLDetalles: TLFPanel
    Left = 0
    Top = 76
    Width = 585
    Height = 256
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object MErrores: TLFMemo
      Left = 0
      Top = 112
      Width = 585
      Height = 144
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Lines.Strings = (
        'Errores')
      TabOrder = 0
    end
    object MLog: TLFMemo
      Left = 0
      Top = 0
      Width = 585
      Height = 112
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      Lines.Strings = (
        'Log')
      TabOrder = 1
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 38
    Width = 585
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      585
      38)
    object LProceso1: TLFLabel
      Left = 5
      Top = 4
      Width = 573
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Color = clInfoBk
      ParentColor = False
    end
    object LProceso2: TLFLabel
      Left = 5
      Top = 20
      Width = 573
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Color = clInfoBk
      ParentColor = False
    end
  end
end
