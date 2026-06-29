object ProFMSelecImpEsc: TProFMSelecImpEsc
  Left = 737
  Top = 232
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Importaci'#243'n de escandallos'
  ClientHeight = 348
  ClientWidth = 367
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
  object SBCancel: TSpeedButton
    Left = 219
    Top = 312
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    OnClick = SBCancelClick
  end
  object SBLanzar: TSpeedButton
    Left = 73
    Top = 312
    Width = 75
    Height = 25
    Caption = '&Lanzar OF'
    OnClick = SBLanzarClick
  end
  object GBOpciones: TGroupBox
    Left = 16
    Top = 16
    Width = 337
    Height = 289
    Caption = 'Opciones de Importacion'
    TabOrder = 0
    object Importar: TRadioGroup
      Left = 8
      Top = 141
      Width = 321
      Height = 121
      Caption = 'Importar'
      ItemIndex = 0
      Items.Strings = (
        'Escandallo completo'
        'Fases'
        'Fases / Materiales'
        'Fases / Tareas')
      TabOrder = 0
      OnClick = ImportarClick
    end
    object Caso: TRadioGroup
      Left = 8
      Top = 20
      Width = 321
      Height = 113
      Caption = 'En caso de tener Subescandallos'
      ItemIndex = 2
      Items.Strings = (
        'Generar SubOrdenes'
        'Generar Ordenes independientes'
        'No Generar')
      TabOrder = 1
      OnClick = CasoClick
    end
    object CBReserva: TLFCheckBox
      Left = 16
      Top = 265
      Width = 97
      Height = 17
      Caption = 'Reserva stock'
      ClicksDisabled = False
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
  end
end
