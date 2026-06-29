object FInfoFacturacionAlb: TFInfoFacturacionAlb
  Left = 710
  Top = 366
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Informaci'#243'n de Facturaci'#243'n'
  ClientHeight = 171
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 171
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLGeneral: TLFLabel
      Left = 0
      Top = 0
      Width = 350
      Height = 64
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Traspasando Albaranes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 23
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object GBProcesaCab: TGroupBox
      Left = 33
      Top = 72
      Width = 281
      Height = 91
      Caption = 'Procesando Albaran'
      TabOrder = 0
      object LTitEjercicio: TLFLabel
        Left = 16
        Top = 20
        Width = 62
        Height = 13
        Caption = 'Ejercicio : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBLEjercicio: TLFLabel
        Left = 95
        Top = 20
        Width = 24
        Height = 13
        Caption = '2004'
      end
      object LTitCanal: TLFLabel
        Left = 17
        Top = 36
        Width = 57
        Height = 13
        Caption = 'Canal     :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBLCanal: TLFLabel
        Left = 95
        Top = 36
        Width = 6
        Height = 13
        Caption = '1'
      end
      object LTitSerie: TLFLabel
        Left = 16
        Top = 52
        Width = 62
        Height = 13
        Caption = 'Serie      : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBLSerie: TLFLabel
        Left = 95
        Top = 52
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object LTitRIG: TLFLabel
        Left = 16
        Top = 68
        Width = 63
        Height = 13
        Caption = 'RIG        : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBLRig: TLFLabel
        Left = 95
        Top = 68
        Width = 6
        Height = 13
        Caption = '1'
      end
    end
  end
end
