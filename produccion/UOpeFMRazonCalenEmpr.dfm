object OpeFMRazonCalenEmpr: TOpeFMRazonCalenEmpr
  Left = 554
  Top = 280
  BorderStyle = bsSingle
  Caption = 'Raz'#243'n de la fiesta'
  ClientHeight = 92
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 92
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LRazon: TLFLabel
      Left = 9
      Top = 9
      Width = 85
      Height = 13
      Caption = 'Raz'#243'n de la fiesta'
    end
    object BBCancel: TBitBtn
      Left = 149
      Top = 55
      Width = 80
      Height = 30
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object BBOk: TBitBtn
      Left = 47
      Top = 55
      Width = 80
      Height = 30
      Caption = 'Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object ERazonFiesta: TLFEdit
      Left = 9
      Top = 25
      Width = 265
      Height = 21
      TabOrder = 2
    end
  end
end
