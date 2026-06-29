object FPregAnticipo: TFPregAnticipo
  Left = 474
  Top = 298
  Width = 320
  Height = 198
  BorderIcons = [biSystemMenu]
  Caption = 'Utilizar Anticipo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 171
    Align = alClient
    TabOrder = 0
    object LBLPVP: TLFLabel
      Left = 8
      Top = 46
      Width = 297
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Utilizar la siguiente cantidad del Anticipo'
      WordWrap = True
    end
    object LMoneda: TLFLabel
      Left = 204
      Top = 77
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object LImporteMaximo: TLFLabel
      Left = 1
      Top = 157
      Width = 310
      Height = 13
      Align = alBottom
      Caption = 'Importe Maximo: %s'
    end
    object EAnticipo: TLFEdit
      Left = 117
      Top = 73
      Width = 81
      Height = 21
      TabOrder = 0
      OnKeyPress = EAnticipoKeyPress
    end
    object BOk: TButton
      Left = 72
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 1
    end
    object BCancelar: TButton
      Left = 160
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
end
