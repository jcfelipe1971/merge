object FSendCorreo: TFSendCorreo
  Left = 471
  Top = 433
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Env'#237'o de correo'
  ClientHeight = 166
  ClientWidth = 592
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 166
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = PNLMainResize
    DesignSize = (
      592
      166)
    object BitBtnOk: TBitBtn
      Left = 255
      Top = 132
      Width = 80
      Height = 30
      Anchors = [akLeft, akBottom]
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = BitBtnOkClick
    end
    object PNLTexto: TLFPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 126
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PNLTexto'
      TabOrder = 1
      object LTexto: TLFLabel
        Left = 0
        Top = 0
        Width = 592
        Height = 85
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object PBProgreso: TProgressBar
        Left = 0
        Top = 85
        Width = 592
        Height = 41
        Align = alBottom
        Min = 0
        Max = 100
        TabOrder = 0
        Visible = False
      end
    end
  end
end
