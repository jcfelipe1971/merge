inherited FMSMSPubli: TFMSMSPubli
  Caption = 'SMS Publi'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    object LApiKey: TLFLabel [0]
      Left = 64
      Top = 69
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Api Key'
    end
    object LReportUrl: TLFLabel [1]
      Left = 52
      Top = 90
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Report Url'
    end
    object LMessageFrom: TLFLabel [2]
      Left = 31
      Top = 112
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Message From'
    end
    object LEncoding: TLFLabel [3]
      Left = 55
      Top = 155
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Encoding'
    end
    object LTo: TLFLabel [4]
      Left = 78
      Top = 204
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Para'
    end
    object LMensaje: TLFLabel [5]
      Left = 60
      Top = 225
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mensaje'
    end
    object LCaracteres: TLFLabel [6]
      Left = 390
      Top = 283
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Caracteres : %d'
    end
    object LResultado: TLFLabel [7]
      Left = 184
      Top = 310
      Width = 48
      Height = 13
      Caption = 'Resultado'
    end
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMSMSPubli.DSxSMSPubliConfig
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 45
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 273
      end
      inherited TbuttComp: TToolButton
        Left = 281
      end
    end
    object DBEApiKey: TLFDbedit
      Left = 104
      Top = 64
      Width = 385
      Height = 21
      DataField = 'APIKEY'
      DataSource = DMSMSPubli.DSxSMSPubliConfig
      PasswordChar = '*'
      TabOrder = 1
    end
    object DBEReportUrl: TLFDbedit
      Left = 104
      Top = 86
      Width = 385
      Height = 21
      DataField = 'REPORT_URL'
      DataSource = DMSMSPubli.DSxSMSPubliConfig
      TabOrder = 2
    end
    object DBEMessageFrom: TLFDbedit
      Left = 104
      Top = 108
      Width = 121
      Height = 21
      DataField = 'MESSAGE_FROM'
      DataSource = DMSMSPubli.DSxSMSPubliConfig
      TabOrder = 3
    end
    object DBEEncoding: TLFDbedit
      Left = 104
      Top = 152
      Width = 121
      Height = 21
      DataField = 'ENCODING'
      DataSource = DMSMSPubli.DSxSMSPubliConfig
      TabOrder = 4
    end
    object DBCBConcat: TLFDBCheckBox
      Left = 6
      Top = 133
      Width = 111
      Height = 17
      Caption = 'Concat'
      ClicksDisabled = False
      ColorCheck = 57088
      Layout = checkboxRight
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
      DataField = 'CONCAT'
      DataSource = DMSMSPubli.DSxSMSPubliConfig
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object ETo: TLFEdit
      Left = 104
      Top = 201
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object MMensaje: TLFMemo
      Left = 104
      Top = 223
      Width = 361
      Height = 55
      Lines.Strings = (
        'Mensaje de prueba')
      TabOrder = 7
      OnChange = MMensajeChange
    end
    object CBPrueba: TLFCheckBox
      Left = 6
      Top = 283
      Width = 111
      Height = 17
      Caption = 'Prueba'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      Layout = checkboxRight
      TabOrder = 8
      TabStop = True
      Alignment = taLeftJustify
    end
    object BEnviar: TButton
      Left = 104
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 9
      OnClick = BEnviarClick
    end
  end
  inherited CEMain: TControlEdit
    Left = 352
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 388
    Top = 4
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 424
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 464
    Top = 8
  end
end
