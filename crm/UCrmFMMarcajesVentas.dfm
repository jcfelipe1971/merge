object CrmFMMarcajesVentas: TCrmFMMarcajesVentas
  Left = 366
  Top = 184
  Width = 340
  Height = 189
  Caption = 'Marcajes Ventas CRM'
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
  object LFMain: TLFPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 162
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LbContacto: TLFLabel
      Left = 11
      Top = 76
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contacto (C)'
    end
    object LbArticulo: TLFLabel
      Left = 17
      Top = 99
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo (A)'
    end
    object LbCadenaMarcaje: TLFLabel
      Left = 32
      Top = 44
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Marcaje'
    end
    object LFDescArticulo: TLFEdit
      Left = 136
      Top = 95
      Width = 183
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 332
      Height = 29
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object BSalir: TToolButton
        Left = 0
        Top = 0
        Hint = 'Salir'
        Caption = 'BSalir'
        ImageIndex = 0
        OnClick = BSalirClick
      end
      object BProcesa: TToolButton
        Left = 23
        Top = 0
        Hint = 'Procesa'
        Caption = 'BProcesa'
        ImageIndex = 94
        OnClick = BProcesaClick
      end
      object BBorraMarcaje: TToolButton
        Left = 46
        Top = 0
        Hint = 'Limpiar formulario'
        Caption = 'BBorraMarcaje'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = BBorraMarcajeClick
      end
    end
    object LFArticulo: TLFEdit
      Left = 76
      Top = 95
      Width = 59
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object LFContacto: TLFEdit
      Left = 76
      Top = 73
      Width = 59
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object LFMarcaje: TLFEdit
      Left = 76
      Top = 40
      Width = 242
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnChange = LFMarcajeChange
      OnKeyPress = LFMarcajeKeyPress
    end
    object LFError: TLFEdit
      Left = 76
      Top = 119
      Width = 243
      Height = 24
      TabStop = False
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
    object LFDescContacto: TLFEdit
      Left = 136
      Top = 73
      Width = 183
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
  end
end
