object FMovContaINFO: TFMovContaINFO
  Left = 408
  Top = 317
  Width = 600
  Height = 451
  Caption = 'Informaci'#243'n Extendida del Asiento'
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 26
    Width = 592
    Height = 398
    Align = alClient
    TabOrder = 0
    object DBLabelMaestro: TDBText
      Left = 17
      Top = 65
      Width = 73
      Height = 17
      Alignment = taRightJustify
      DataField = 'TIPO_MAESTRO'
      DataSource = DMMovConta.DSxDatosExtendido
    end
    object Label8: TLFLabel
      Left = 53
      Top = 43
      Width = 37
      Height = 13
      Caption = 'Tercero'
    end
    object Label10: TLFLabel
      Left = 56
      Top = 87
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object Label11: TLFLabel
      Left = 33
      Top = 109
      Width = 57
      Height = 13
      Caption = 'Forma Pago'
    end
    object Label9: TLFLabel
      Left = 34
      Top = 131
      Width = 56
      Height = 13
      Caption = 'Modo I.V.A.'
    end
    object Label12: TLFLabel
      Left = 40
      Top = 175
      Width = 50
      Height = 13
      Caption = 'Doc. Serie'
    end
    object Label13: TLFLabel
      Left = 27
      Top = 153
      Width = 63
      Height = 13
      Caption = 'Doc. N'#250'mero'
    end
    object Label14: TLFLabel
      Left = 34
      Top = 197
      Width = 56
      Height = 13
      Caption = 'Signo I.V.A.'
    end
    object Label15: TLFLabel
      Left = 22
      Top = 219
      Width = 68
      Height = 13
      Caption = 'Registro I.V.A.'
    end
    object Label16: TLFLabel
      Left = 14
      Top = 241
      Width = 76
      Height = 13
      Caption = 'Registro Cartera'
    end
    object SBVerRegistro: TSpeedButton
      Left = 142
      Top = 215
      Width = 30
      Height = 21
      Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
      GroupIndex = -1
      OnDblClick = SBVerRegistroDblClick
    end
    object SBVerRegistroCartera: TSpeedButton
      Left = 142
      Top = 237
      Width = 30
      Height = 21
      Hint = 
        'Doble click o Ctrl+Alt+S para ver el registro de Cartera generad' +
        'o'
      GroupIndex = -1
      OnDblClick = SBVerRegistroCarteraDblClick
    end
    object GBTotales: TGroupBox
      Left = 11
      Top = 276
      Width = 570
      Height = 113
      Caption = 'Totales'
      TabOrder = 0
      object Label1: TLFLabel
        Left = 103
        Top = 16
        Width = 72
        Height = 13
        Caption = 'Base Imponible'
      end
      object Label2: TLFLabel
        Left = 9
        Top = 36
        Width = 88
        Height = 13
        Caption = 'Bases y Cuotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLFLabel
        Left = 38
        Top = 59
        Width = 59
        Height = 13
        Caption = 'Retenci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLFLabel
        Left = 21
        Top = 80
        Width = 76
        Height = 13
        Caption = 'Total Asiento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLFLabel
        Left = 218
        Top = 16
        Width = 57
        Height = 13
        Caption = 'Cuota I.V.A.'
      end
      object Label6: TLFLabel
        Left = 332
        Top = 16
        Width = 72
        Height = 13
        Caption = 'Cuota Recargo'
      end
      object Label7: TLFLabel
        Left = 446
        Top = 16
        Width = 36
        Height = 13
        Caption = 'L'#237'quido'
      end
      object DBEBaseImponible: TLFDbedit
        Left = 102
        Top = 33
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'BASE_IMPONIBLE'
        DataSource = DMMovConta.DSxDatosExtendido
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBERetencion: TLFDbedit
        Left = 102
        Top = 55
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'C_RET'
        DataSource = DMMovConta.DSxDatosExtendido
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBETotal: TLFDbedit
        Left = 102
        Top = 77
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'TOTAL'
        DataSource = DMMovConta.DSxDatosExtendido
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEIVA: TLFDbedit
        Left = 216
        Top = 33
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'C_IVA'
        DataSource = DMMovConta.DSxDatosExtendido
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBERecargo: TLFDbedit
        Left = 330
        Top = 33
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'C_REC'
        DataSource = DMMovConta.DSxDatosExtendido
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBELiquido: TLFDbedit
        Left = 444
        Top = 33
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'LIQUIDO'
        DataSource = DMMovConta.DSxDatosExtendido
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object DBETercero: TLFDbedit
      Left = 96
      Top = 39
      Width = 44
      Height = 21
      Color = clInfoBk
      DataField = 'TERCERO'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBETitTercero: TLFDbedit
      Left = 141
      Top = 39
      Width = 441
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE_R_SOCIAL'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEMaestro: TLFDbedit
      Left = 96
      Top = 61
      Width = 44
      Height = 21
      Color = clInfoBk
      DataField = 'MAESTRO'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBECuenta: TLFDbedit
      Left = 96
      Top = 83
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'CUENTA'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBETitCuenta: TLFDbedit
      Left = 218
      Top = 83
      Width = 364
      Height = 21
      Color = clInfoBk
      DataField = 'TIT_CUENTA'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBESignoIVA: TLFDbedit
      Left = 96
      Top = 193
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'SIGNO_IVA'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEDocSerie: TLFDbedit
      Left = 96
      Top = 171
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'DOC_SERIE'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBEDocNumero: TLFDbedit
      Left = 96
      Top = 149
      Width = 44
      Height = 21
      Color = clInfoBk
      DataField = 'DOC_NUMERO'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBETitFormaPago: TLFDbedit
      Left = 141
      Top = 105
      Width = 441
      Height = 21
      Color = clInfoBk
      DataField = 'TIT_FORMA_PAGO'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBETitDocSerie: TLFDbedit
      Left = 218
      Top = 171
      Width = 364
      Height = 21
      Color = clInfoBk
      DataField = 'TIT_DOC_SERIE'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object DBEFormaPago: TLFDbedit
      Left = 96
      Top = 105
      Width = 44
      Height = 21
      Color = clInfoBk
      DataField = 'FORMA_PAGO'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object DBETitCliente: TLFDbedit
      Left = 141
      Top = 61
      Width = 441
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE_R_SOCIAL'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object DBEModoIVA: TLFDbedit
      Left = 96
      Top = 127
      Width = 44
      Height = 21
      Color = clInfoBk
      DataField = 'MODO_IVA'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object DBETitModoIVA: TLFDbedit
      Left = 141
      Top = 127
      Width = 441
      Height = 21
      Color = clInfoBk
      DataField = 'TIT_MODO_IVA'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object DBERegistro: TLFDbedit
      Left = 96
      Top = 215
      Width = 44
      Height = 21
      TabStop = False
      Color = clAqua
      DataField = 'REGISTRO'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object DBERGC: TLFDbedit
      Left = 96
      Top = 237
      Width = 44
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'RGC'
      DataSource = DMMovConta.DSxDatosExtendido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 26
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object TButtSalir: TToolButton
      Left = 0
      Top = 0
      Hint = 'Cerrar la ventana'
      Caption = 'Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtSalirClick
    end
  end
  object ALMovContaINFO: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 473
    Top = 219
    object ARegistroIVA: TAction
      Caption = 'Ver registro de IVA'
      Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
      ShortCut = 49234
      OnExecute = ARegistroIVAExecute
    end
    object ARegistroCartera: TAction
      Caption = 'Ver registro generado'
      Hint = 'Doble click o Ctrl+Alt+S para ver el registro generado'
      ShortCut = 49235
      OnExecute = ARegistroCarteraExecute
    end
  end
end
