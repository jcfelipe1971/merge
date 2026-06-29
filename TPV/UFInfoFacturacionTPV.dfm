object FInfoFacturacionTPV: TFInfoFacturacionTPV
  Left = 616
  Top = 304
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Informaci'#243'n de Facturaci'#243'n'
  ClientHeight = 202
  ClientWidth = 342
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
  object PNLMain: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 202
    Align = alClient
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 0
    object LInfoGeneral: TLFLabel
      Left = 0
      Top = 68
      Width = 342
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Traspasando Albaranes'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object GBProcesaCab: TGroupBox
      Left = 40
      Top = 96
      Width = 257
      Height = 97
      Caption = 'Procesando Albar'#225'n'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object LEjercicio: TLFLabel
        Left = 64
        Top = 20
        Width = 50
        Height = 13
        Caption = 'Ejercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LInfoEjercicio: TLFLabel
        Left = 143
        Top = 20
        Width = 40
        Height = 13
        Caption = 'Ejercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LCanal: TLFLabel
        Left = 64
        Top = 38
        Width = 33
        Height = 13
        Caption = 'Canal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LInfoCanal: TLFLabel
        Left = 143
        Top = 38
        Width = 27
        Height = 13
        Caption = 'Canal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LSerie: TLFLabel
        Left = 64
        Top = 56
        Width = 30
        Height = 13
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LInfoSerie: TLFLabel
        Left = 143
        Top = 56
        Width = 24
        Height = 13
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LTipo: TLFLabel
        Left = 64
        Top = 74
        Width = 23
        Height = 13
        Caption = 'RIG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LInfoRig: TLFLabel
        Left = 143
        Top = 74
        Width = 19
        Height = 13
        Caption = 'RIG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 342
      Height = 68
      BorderWidth = 2
      ButtonHeight = 57
      ButtonWidth = 58
      Color = clSilver
      DisabledImages = DMMain.ILTPV_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      HotImages = DMMain.ILTPV_Ac
      Images = DMMain.ILTPV_Ac
      ParentColor = False
      TabOrder = 1
      Separators = True
      object BSalir: TToolButton
        Left = 0
        Top = 2
        Action = ASalir
        Enabled = False        
      end
    end
  end
  object ActionList1: TActionList
    Left = 192
    Top = 16
    object ASalir: TAction
      Caption = 'ASalir'
      ImageIndex = 8
      OnExecute = ASalirExecute
    end
  end
end
