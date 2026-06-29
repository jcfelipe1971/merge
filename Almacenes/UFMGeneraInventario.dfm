object FMGeneraInventario: TFMGeneraInventario
  Left = 278
  Top = 273
  Width = 232
  Height = 121
  Caption = 'Genera Inventario'
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
  object Label1: TLFLabel
    Left = 8
    Top = 8
    Width = 139
    Height = 13
    Caption = 'Seleccione mes de inventario'
  end
  object ComboBoxMes: TLFComboBox
    Left = 154
    Top = 5
    Width = 57
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
  object Button1: TButton
    Left = 72
    Top = 48
    Width = 75
    Height = 25
    Caption = '&Generar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 40
  end
  object SPGeneraInventario: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure genera_inv_kri (?empresa,?mes,?ejercicio)')
    Transaction = TLocal
    AutoTrans = True
    Left = 184
    Top = 40
  end
end
