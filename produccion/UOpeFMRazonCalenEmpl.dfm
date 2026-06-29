object OpeFMRazonCalenEmpl: TOpeFMRazonCalenEmpl
  Left = 393
  Top = 256
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Raz'#243'n de las fiestas del empleado'
  ClientHeight = 115
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
    Height = 115
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LRazonFiesta: TLFLabel
      Left = 9
      Top = 35
      Width = 85
      Height = 13
      Caption = 'Raz'#243'n de la fiesta'
    end
    object LHorasTrab: TLFLabel
      Left = 9
      Top = 11
      Width = 78
      Height = 13
      Caption = 'Horas de trabajo'
    end
    object BBCancel: TBitBtn
      Left = 149
      Top = 79
      Width = 80
      Height = 30
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object BBOk: TBitBtn
      Left = 47
      Top = 79
      Width = 80
      Height = 30
      Caption = 'Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = BBOkClick
    end
    object EHorasTrab: TLFEdit
      Left = 91
      Top = 8
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object ERazonFiesta: TLFEdit
      Left = 9
      Top = 51
      Width = 265
      Height = 21
      TabOrder = 3
    end
  end
end
