object FMUnidadesExt: TFMUnidadesExt
  Left = 507
  Top = 508
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Unidades'
  ClientHeight = 48
  ClientWidth = 134
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TButtMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 23
    Height = 48
    Align = alLeft
    AutoSize = True
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtAceptar: TToolButton
      Left = 0
      Top = 0
      Caption = 'Aceptar'
      ImageIndex = 19
      Wrap = True
      OnClick = TButtAceptarClick
    end
    object TButtCancelar: TToolButton
      Left = 0
      Top = 22
      Caption = 'Cancelar'
      ImageIndex = 20
      OnClick = TButtCancelarClick
    end
  end
  object PNLUnidades: TLFPanel
    Left = 23
    Top = 0
    Width = 111
    Height = 48
    Align = alClient
    TabOrder = 1
  end
end
