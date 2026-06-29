object FBuscaRO: TFBuscaRO
  Left = 508
  Top = 364
  HelpContext = 706
  VertScrollBar.Smooth = True
  VertScrollBar.Style = ssHotTrack
  VertScrollBar.Tracking = True
  BorderStyle = bsDialog
  Caption = 'Filtrar'
  ClientHeight = 105
  ClientWidth = 657
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object rgKind: TRadioGroup
      Left = 33
      Top = 0
      Width = 574
      Height = 43
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Filtrar tambi'#233'n con esta condici'#243'n  ( O )'
        'Filtrar teniendo en cuenta todas las condiciones ( Y )')
      TabOrder = 0
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 49
    Width = 657
    Height = 22
    AutoSize = True
    ButtonWidth = 81
    Ctl3D = False
    DisabledImages = DMMain.ILMain_In
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = DMMain.ILMain_Ac
    Indent = 10
    List = True
    ShowCaptions = True
    TabOrder = 1
    Wrapable = False
    Separators = True
    object btnInc: TToolButton
      Left = 10
      Top = 0
      Action = act_Mas
      Caption = 'M&'#225's'
    end
    object ToolButton3: TToolButton
      Left = 91
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnDec: TToolButton
      Left = 99
      Top = 0
      Action = act_Menos
    end
    object ToolButton1: TToolButton
      Left = 180
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnConfirmar: TToolButton
      Left = 188
      Top = 0
      Action = act_Confirmar
    end
    object ToolButton4: TToolButton
      Left = 269
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object tbNoDate: TToolButton
      Left = 277
      Top = 0
      Action = act_SinDias
      Caption = '&Fechas'
      Down = True
      Style = tbsCheck
    end
    object ToolButton6: TToolButton
      Left = 358
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object tbNoFiltro: TToolButton
      Left = 366
      Top = 0
      Action = act_NoFiltro
      Caption = 'Si&n filtros'
    end
    object ToolButton2: TToolButton
      Left = 447
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnCancelar: TToolButton
      Left = 455
      Top = 0
      Action = act_Cancelar
      Caption = '&Salir'
    end
    object TBSep1: TToolButton
      Left = 536
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
    end
    object TBConfigurar: TToolButton
      Left = 544
      Top = 0
      Action = act_Configurar
    end
  end
  object pnlDate: TLFPanel
    Left = 0
    Top = 71
    Width = 657
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    TabOrder = 2
    Visible = False
    object LFecha_Entre: TLFLabel
      Left = 184
      Top = 11
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'entre el'
    end
    object LFecha_1: TLFLabel
      Left = 14
      Top = 11
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'La Fecha'
    end
    object L_Fecha_ElDia: TLFLabel
      Left = 402
      Top = 11
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'y el d'#237'a'
    end
    object cbDate: TLFComboBox
      Left = 65
      Top = 7
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnClick = cbDateClick
    end
    object cbDateFirst: TLFDateEdit
      Left = 229
      Top = 6
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object cbDateLast: TLFDateEdit
      Left = 445
      Top = 6
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
    end
    object cbTimeFirst: TDateTimePicker
      Left = 317
      Top = 6
      Width = 76
      Height = 21
      CalAlignment = dtaLeft
      Date = 37447.3773188657
      Time = 37447.3773188657
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 2
    end
    object cbTimeLast: TDateTimePicker
      Left = 533
      Top = 6
      Width = 76
      Height = 21
      CalAlignment = dtaLeft
      Date = 37447.3773188657
      Time = 37447.3773188657
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 4
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 610
    Top = 2
    object act_Mas: TAction
      Caption = 'M&as'
      Hint = 'A'#241'adir una nueva condici'#243'n de filtrado'
      ImageIndex = 23
      ShortCut = 187
      OnExecute = act_MasExecute
    end
    object act_Menos: TAction
      Caption = 'M&enos'
      Enabled = False
      Hint = 'Eliminar la '#250'ltima condici'#243'n de filtrado'
      ImageIndex = 22
      ShortCut = 111
      OnExecute = act_MenosExecute
    end
    object act_Confirmar: TAction
      Caption = '&Confirmar'
      Hint = 'Confirmar'
      ImageIndex = 19
      ShortCut = 13
      OnExecute = act_ConfirmarExecute
    end
    object act_SinDias: TAction
      Caption = 'Sin Dias'
      Hint = 'Sin Dias'
      ImageIndex = 134
      OnExecute = tbNoDateClick
    end
    object act_Cancelar: TAction
      Caption = 'Cancelar'
      Hint = 'Cancelar el filtro'
      ImageIndex = 0
      ShortCut = 27
      OnExecute = act_CancelarExecute
    end
    object act_NoFiltro: TAction
      Caption = '&No Filtrar'
      ImageIndex = 21
      OnExecute = act_NoFiltroExecute
    end
    object act_Configurar: TAction
      Caption = 'Confi&gurar'
      Hint = 'Configurar'
      ImageIndex = 2
      OnExecute = act_ConfigurarExecute
    end
  end
end
