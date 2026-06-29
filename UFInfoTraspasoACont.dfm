object FInfoTraspasoACont: TFInfoTraspasoACont
  Left = 581
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informaci'#243'n de traspaso'
  ClientHeight = 135
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 135
    Align = alClient
    TabOrder = 0
    object LBLGeneral: TLFLabel
      Left = 1
      Top = 1
      Width = 409
      Height = 40
      Align = alTop
      Alignment = taCenter
      Caption = 'Traspasando asientos a contabilidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object GBProcesaCab: TGroupBox
      Left = 1
      Top = 41
      Width = 409
      Height = 93
      Align = alClient
      Caption = 'Procesando Asiento:'
      TabOrder = 0
      object LEjercicio: TLFLabel
        Left = 112
        Top = 28
        Width = 50
        Height = 13
        Caption = 'Ejercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBLEjercicio: TLFLabel
        Left = 191
        Top = 28
        Width = 40
        Height = 13
        Caption = 'Ejercicio'
      end
      object LRIB: TLFLabel
        Left = 112
        Top = 50
        Width = 22
        Height = 13
        Caption = 'RIB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBLRib: TLFLabel
        Left = 191
        Top = 50
        Width = 18
        Height = 13
        Caption = 'RIB'
      end
    end
  end
end
