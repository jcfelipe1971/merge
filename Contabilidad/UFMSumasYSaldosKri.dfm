object FMSumasYSaldosKri: TFMSumasYSaldosKri
  Left = 448
  Top = 206
  Width = 207
  Height = 162
  Caption = 'Sumas y Saldos Consolidado'
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
  object LPeriodos: TLFLabel
    Left = 51
    Top = 16
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'Per'#237'odo'
  end
  object ComboBoxMes: TLFComboBox
    Left = 96
    Top = 12
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      '01'
      '02'
      '03'
      '04'
      '05'
      '06'
      '07'
      '08'
      '09'
      '10'
      '11'
      '12')
  end
  object BGenerar: TButton
    Left = 64
    Top = 96
    Width = 75
    Height = 25
    Caption = '&Generar'
    TabOrder = 4
    OnClick = BGenerarClick
  end
  object RBTodosCentros: TRadioButton
    Left = 8
    Top = 40
    Width = 177
    Height = 17
    Caption = 'Todos los Centros de Coste'
    Checked = True
    TabOrder = 1
    TabStop = True
    OnClick = RBTodosCentrosClick
  end
  object RBCentro: TRadioButton
    Left = 8
    Top = 64
    Width = 57
    Height = 17
    Caption = 'Centro'
    TabOrder = 2
    OnClick = RBCentroClick
  end
  object ECentro: TLFEdit
    Left = 72
    Top = 60
    Width = 25
    Height = 21
    Enabled = False
    TabOrder = 3
  end
end
