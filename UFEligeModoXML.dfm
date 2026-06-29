object FEligeModoXML: TFEligeModoXML
  Left = 609
  Top = 414
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cambiar precios y/o margen'
  ClientHeight = 111
  ClientWidth = 149
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 149
    Height = 26
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtConfirmar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Confirmar cambio de m'#225'rgen'
      Caption = 'Confirmar'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtConfirmarClick
    end
    object EPMain: THYMEditPanel
      Left = 23
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
  end
  object PNMain: TLFPanel
    Left = 0
    Top = 26
    Width = 149
    Height = 85
    Align = alClient
    TabOrder = 1
    object RGVersion: TRadioGroup
      Left = 1
      Top = 1
      Width = 147
      Height = 83
      Align = alClient
      Caption = 'Versi'#243'n XML'
      ItemIndex = 0
      Items.Strings = (
        'Versi'#243'n 2'
        'Versi'#243'n 3')
      TabOrder = 0
    end
  end
end
