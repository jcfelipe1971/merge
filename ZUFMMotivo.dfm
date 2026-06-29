object ZFMMotivo: TZFMMotivo
  Left = 535
  Top = 147
  Width = 405
  Height = 118
  Caption = 'Motivo Anulaci'#243'n Recibo Ingresos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LMotivoAnulacion: TLFLabel
    Left = 11
    Top = 42
    Width = 88
    Height = 13
    Alignment = taRightJustify
    Caption = 'Motivo Anulaci'#243'n :'
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 397
    Height = 29
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TSalir: TToolButton
      Left = 0
      Top = 2
      Hint = 'Salir'
      Action = ASalir
      ParentShowHint = False
      ShowHint = True
    end
    object TAnulaFactura: TToolButton
      Left = 23
      Top = 2
      Hint = 'Anular Cobro Recibo'
      Action = AAnula
      ImageIndex = 27
      ParentShowHint = False
      ShowHint = True
    end
  end
  object LFMotivos: TLFEdit
    Left = 102
    Top = 39
    Width = 277
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 208
    Top = 28
    object ASalir: TAction
      Caption = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AAnula: TAction
      Caption = 'Anula'
      ImageIndex = 12
      OnExecute = AAnulaExecute
    end
  end
end
