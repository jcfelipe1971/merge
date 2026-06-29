inherited ProFMCostesTEsc: TProFMCostesTEsc
  Left = 225
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Resumen costes totales del escandallo'
  ClientHeight = 358
  ClientWidth = 1076
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1076
    Height = 334
    object LCosteTotal: TLFLabel [0]
      Left = 886
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Coste Total '
    end
    object LCosteTrabajoExterno: TLFLabel [1]
      Left = 720
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Trab. Ext. (var)'
      FocusControl = DBECosteTrabExt
    end
    object LCosteMaquina: TLFLabel [2]
      Left = 222
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'M'#225'quina (var)'
      FocusControl = DBECosteMaq
    end
    object LCosteManoObra: TLFLabel [3]
      Left = 388
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'M. de Obra (var)'
      FocusControl = DBECosteMO
    end
    object LCosteMaterial: TLFLabel [4]
      Left = 139
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Material'
    end
    object LCosteVarios: TLFLabel [5]
      Left = 554
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Varios (var)'
      FocusControl = DBECosteVarios
    end
    object LCosteFijo: TLFLabel [6]
      Left = 56
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Fijo'
      FocusControl = DBECosteFijo
    end
    object LEscandallo: TLFLabel [7]
      Left = 37
      Top = 34
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Escandallo'
      FocusControl = DBEEscandallo
    end
    object LCompuesto: TLFLabel [8]
      Left = 36
      Top = 56
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Compuesto'
    end
    object LUnidades: TLFLabel [9]
      Left = 2
      Top = 82
      Width = 51
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Unidades'
      FocusControl = DBECosteFijo
    end
    object LCosteUnitario: TLFLabel [10]
      Left = 969
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Coste Unitario'
    end
    object LCosteMaquinaAbs: TLFLabel [11]
      Left = 305
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'M'#225'quina (abs)'
      FocusControl = DBECosteMaqAbs
    end
    object LCosteManoObraAbs: TLFLabel [12]
      Left = 471
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'M. de Obra (abs)'
      FocusControl = DBECosteMOAbs
    end
    object LCosteVariosAbs: TLFLabel [13]
      Left = 637
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Varios (abs)'
      FocusControl = DBECosteVariosAbs
    end
    object LCosteTrabajoExternoAbs: TLFLabel [14]
      Left = 803
      Top = 82
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Trab. Ext. (abs)'
      FocusControl = DBECosteTrabExtAbs
    end
    inherited TBMain: TLFToolBar
      Width = 1072
      TabOrder = 12
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBECosteFijo: TLFDbedit
      Left = 56
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_FIJO'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteVarios: TLFDbedit
      Left = 554
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_VAR_VAR'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteMO: TLFDbedit
      Left = 388
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MOBRA_VAR'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteMaq: TLFDbedit
      Left = 222
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MAQUI_VAR'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteTrabExt: TLFDbedit
      Left = 720
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_TEXTE_VAR'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object ETituloCompuesto: TLFEdit
      Left = 200
      Top = 53
      Width = 286
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEEscandallo: TLFDbedit
      Left = 93
      Top = 31
      Width = 105
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'ESCANDALLO'
      DataSource = ProDMEscandallo.DSQMProEscandallo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBECompuesto: TLFDbedit
      Left = 93
      Top = 53
      Width = 105
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COMPUESTO'
      DataSource = ProDMEscandallo.DSQMProEscandallo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnChange = DBECompuestoChange
    end
    object DBECosteMat: TLFDbedit
      Left = 139
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MATER'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteTotal: TLFDbedit
      Left = 886
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_TOTAL'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object SGCostesEsc: TStringGrid
      Left = 2
      Top = 120
      Width = 1071
      Height = 225
      ColCount = 13
      DefaultColWidth = 82
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 10
      OnDrawCell = SGCostesEscDrawCell
      OnSelectCell = SGCostesEscSelectCell
      OnSetEditText = SGCostesEscSetEditText
      ColWidths = (
        50
        82
        82
        82
        82
        82
        82
        82
        82
        82
        82
        82
        82)
    end
    object DBEUnidad: TLFDbedit
      Left = 2
      Top = 97
      Width = 51
      Height = 21
      TabStop = False
      Color = clInfoBk
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
    object DBECOSTE_UNITARIO: TLFDbedit
      Left = 969
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_UNITARIO'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteMaqAbs: TLFDbedit
      Left = 305
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MAQUI_ABS'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteMOAbs: TLFDbedit
      Left = 471
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MOBRA_ABS'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteVariosAbs: TLFDbedit
      Left = 637
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_VAR_ABS'
      DataSource = ProDMEscandallo.DSxCostesTEsc
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
    object DBECosteTrabExtAbs: TLFDbedit
      Left = 803
      Top = 97
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_TEXTE_ABS'
      DataSource = ProDMEscandallo.DSxCostesTEsc
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
  end
  inherited TBActions: TLFToolBar
    Top = 334
    Width = 1076
  end
  inherited CEMain: TControlEdit
    Left = 16
    Top = 156
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 52
    Top = 156
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
    Left = 16
    Top = 192
  end
  inherited FSMain: TLFFibFormStorage
    Left = 56
    Top = 192
  end
end
