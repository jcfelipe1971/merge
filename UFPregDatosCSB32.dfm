inherited FPregDatosCsB32: TFPregDatosCsB32
  Left = 684
  Top = 539
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
    object LOrdenSoporte: TLFLabel [0]
      Left = 79
      Top = 32
      Width = 101
      Height = 13
      Caption = 'N'#186' Orden del Soporte'
    end
    object LIdentificacionCedente: TLFLabel [1]
      Left = 57
      Top = 54
      Width = 123
      Height = 13
      Caption = 'Identificaci'#243'n del Cedente'
    end
    object LSucursalReceptora: TLFLabel [2]
      Left = 29
      Top = 75
      Width = 151
      Height = 13
      Caption = 'C'#243'digo de la Sucursal receptora'
    end
    inherited TBMain: TLFToolBar
      Width = 306
      TabOrder = 7
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
    object CBFisicos: TLFCheckBox
      Left = 54
      Top = 95
      Width = 233
      Height = 17
      Caption = 'Se acompa'#241'an efectos F'#237'sicos al Disquette'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
    object ENumOrden: TLFEdit
      Left = 187
      Top = 28
      Width = 33
      Height = 21
      TabOrder = 0
      Text = '0001'
    end
    object ECedente: TLFEdit
      Left = 187
      Top = 50
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '40854'
    end
    object EEntidad: TLFEdit
      Left = 187
      Top = 72
      Width = 33
      Height = 21
      TabOrder = 2
      Text = '0093'
    end
    object ESucursal: TLFEdit
      Left = 221
      Top = 72
      Width = 33
      Height = 21
      TabOrder = 3
      Text = '0093'
    end
    object CBRef: TLFCheckBox
      Left = 54
      Top = 114
      Width = 180
      Height = 17
      Caption = 'Usar referencia para descripci'#243'n'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      Alignment = taLeftJustify
    end
    object CBDetalle: TLFCheckBox
      Left = 54
      Top = 133
      Width = 76
      Height = 17
      Caption = 'Sin detalle'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 6
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited TBActions: TLFToolBar
    Top = 145
    Width = 310
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
