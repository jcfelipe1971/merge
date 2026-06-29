inherited FPregDatosCsB58: TFPregDatosCsB58
  Left = 623
  Top = 337
  Caption = 'Datos de la Norma'
  ClientHeight = 169
  ClientWidth = 310
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 310
    Height = 145
    object LCodigoOrdenante: TLFLabel [0]
      Left = 65
      Top = 39
      Width = 101
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo de Ordenante'
    end
    object LSucursalReceptora: TLFLabel [1]
      Left = 15
      Top = 61
      Width = 151
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo de la Sucursal receptora'
    end
    object LAlfanumero: TLFLabel [2]
      Left = 113
      Top = 83
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alfan'#250'mero'
    end
    inherited TBMain: TLFToolBar
      Width = 306
      TabOrder = 6
      object TButtConfirmar: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Confirmar Datos'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
      inherited EPMain: THYMEditPanel
        Left = 23
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object ECodigo: TLFEdit
      Left = 173
      Top = 36
      Width = 33
      Height = 21
      MaxLength = 3
      TabOrder = 0
      Text = '000'
    end
    object EEntidad: TLFEdit
      Left = 173
      Top = 58
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '0000'
    end
    object ESucursal: TLFEdit
      Left = 207
      Top = 58
      Width = 33
      Height = 21
      TabOrder = 2
      Text = '0000'
    end
    object EAlfanumero: TLFEdit
      Left = 173
      Top = 80
      Width = 99
      Height = 21
      MaxLength = 11
      TabOrder = 3
    end
    object CBSinDetalle: TLFCheckBox
      Left = 54
      Top = 122
      Width = 219
      Height = 17
      Caption = 'Sin detalle'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBRef: TLFCheckBox
      Left = 54
      Top = 103
      Width = 219
      Height = 17
      Caption = 'Usar referencia para descripci'#243'n'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      Alignment = taLeftJustify
    end
  end
  inherited TBActions: TLFToolBar
    Top = 145
    Width = 310
  end
  inherited CEMain: TControlEdit
    Left = 240
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 176
    Top = 0
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
    Left = 208
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBSinDetalle.Checked'
      'CBRef.Checked')
    Left = 272
    Top = 0
  end
end
