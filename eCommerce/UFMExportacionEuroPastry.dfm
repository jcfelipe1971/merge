inherited FMExportacionEuroPastry: TFMExportacionEuroPastry
  Caption = 'Exportaci'#243'n EuroPastry'
  ClientHeight = 242
  ClientWidth = 405
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 405
    Height = 218
    object LDesdeFecha: TLFLabel [0]
      Left = 36
      Top = 92
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Fecha'
    end
    object LHastaFecha: TLFLabel [1]
      Left = 39
      Top = 114
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Fecha'
    end
    object LCodigoDistribuidor: TLFLabel [2]
      Left = 12
      Top = 46
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Distribuidor'
    end
    object LRutaExportacion: TLFLabel [3]
      Left = 18
      Top = 68
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ruta Exportaci'#243'n'
    end
    inherited TBMain: TLFToolBar
      Width = 401
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtExportar: TToolButton
        Left = 33
        Top = 0
        Action = AExportar
      end
    end
    object DEDesde: TLFDateEdit
      Left = 104
      Top = 88
      Width = 121
      Height = 21
      CheckOnExit = True
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object DEHasta: TLFDateEdit
      Left = 104
      Top = 110
      Width = 121
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
      OnChange = DEHastaChange
    end
    object ECodigoDistribuidor: TLFEdit
      Left = 104
      Top = 42
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object DERutaExportacion: TDirectoryEdit
      Left = 104
      Top = 64
      Width = 289
      Height = 21
      DialogOptions = [sdAllowCreate]
      NumGlyphs = 1
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object CBRestar45Dias: TLFCheckBox
      Left = 232
      Top = 90
      Width = 161
      Height = 17
      Caption = 'Fecha Hasta - 45 Dias'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      OnClick = CBRestar45DiasClick
      Alignment = taLeftJustify
    end
  end
  inherited TBActions: TLFToolBar
    Top = 218
    Width = 405
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
  inherited ALMain: TLFActionList
    Left = 350
    Top = 36
    object AExportar: TAction
      Caption = 'Exportar'
      Hint = 'Exportar datos a fichero'
      ImageIndex = 36
      OnExecute = AExportarExecute
    end
  end
end
