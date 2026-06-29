inherited ProFMPantMarcajes: TProFMPantMarcajes
  Left = 303
  Top = 301
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Mantenimiento de Marcajes de Operario'
  ClientHeight = 581
  ClientWidth = 800
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 800
    Height = 557
    inherited TBMain: TLFToolBar
      Width = 796
      inherited NavMain: THYMNavigator
        Width = 23
        VisibleButtons = [nbRefresh]
        Hints.Strings = ()
        Visible = False
      end
      inherited TSepNav: TToolButton
        Left = 23
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 54
      end
      inherited TbuttComp: TToolButton
        Left = 62
        Caption = 'ARefrescar'
        ImageIndex = 19
        OnClick = ARefrescarExecute
      end
      object ToolButton1: TToolButton
        Left = 85
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LblFilas: TLFLabel
        Left = 93
        Top = 0
        Width = 21
        Height = 22
        Caption = 'Filas'
        Layout = tlCenter
      end
      object ToolButton4: TToolButton
        Left = 114
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object EFilas: TLFEdit
        Left = 122
        Top = 0
        Width = 30
        Height = 22
        Enabled = False
        TabOrder = 3
        OnChange = NumImagenesChange
      end
      object ToolButton2: TToolButton
        Left = 152
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LblColumnas: TLFLabel
        Left = 160
        Top = 0
        Width = 46
        Height = 22
        Caption = 'Columnas'
        Layout = tlCenter
      end
      object ToolButton5: TToolButton
        Left = 206
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object EColumnas: TLFEdit
        Left = 214
        Top = 0
        Width = 30
        Height = 22
        Enabled = False
        TabOrder = 2
        OnChange = NumImagenesChange
      end
      object ToolButton3: TToolButton
        Left = 244
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LFecha: TLFLabel
        Left = 252
        Top = 0
        Width = 30
        Height = 22
        Caption = 'Fecha'
        Layout = tlCenter
      end
      object ToolButton6: TToolButton
        Left = 282
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object DTPFecha: TLFDateEdit
        Left = 290
        Top = 0
        Width = 87
        Height = 22
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
        OnChange = DTPFechaChange
      end
      object ToolButton7: TToolButton
        Left = 377
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object RxClock1: TRxClock
        Left = 385
        Top = 0
        Width = 144
        Height = 22
        Color = clBtnHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 796
      Height = 527
      ActivePage = TSMaquina
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSOperario: TTabSheet
        Caption = '&Operarios'
        OnShow = TSOperarioShow
        object PNLOperario: TLFPanel
          Left = 0
          Top = 0
          Width = 788
          Height = 499
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBCGOperario: TLFDBCtrlGrid
            Left = 0
            Top = 0
            Width = 788
            Height = 499
            Align = alClient
            ColCount = 3
            DataSource = ProDMPantMarcajes.DSLstMarcajes
            PanelHeight = 249
            PanelWidth = 257
            TabOrder = 0
            RowCount = 2
            OnPaintPanel = DBCGOperarioPaintPanel
            object ImagenOperario: TImage
              Left = 0
              Top = 0
              Width = 257
              Height = 73
              Align = alTop
              Enabled = False
              Proportional = True
            end
            object DBEEmpleado: TLFDbedit
              Left = 65
              Top = 3
              Width = 25
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              BevelEdges = []
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'Codigo'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              TabOrder = 0
              Visible = False
            end
            object LFDBMemo: TLFDBMemo
              Left = 0
              Top = 83
              Width = 257
              Height = 166
              Align = alBottom
              Color = clMenu
              DataField = 'Notas'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Visible = False
            end
            object LFDBNombre: TLFDbedit
              Left = 89
              Top = 3
              Width = 169
              Height = 21
              Anchors = [akTop, akRight]
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'Titulo'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              TabOrder = 2
              Visible = False
            end
            object LFDHorario: TLFDbedit
              Left = 65
              Top = 24
              Width = 193
              Height = 21
              Anchors = [akTop, akRight]
              BiDiMode = bdRightToLeftReadingOnly
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'Horario'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              ParentBiDiMode = False
              TabOrder = 3
              Visible = False
            end
            object LFDHorasTrab: TLFDbedit
              Left = 65
              Top = 44
              Width = 193
              Height = 21
              Anchors = [akTop, akRight]
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'HorasTrab'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              TabOrder = 4
              Visible = False
            end
          end
        end
      end
      object TSMaquina: TTabSheet
        Caption = '&Maquinas'
        OnShow = TSMaquinaShow
        object PNLMaquina: TLFPanel
          Left = 0
          Top = 0
          Width = 788
          Height = 499
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBCGMaquinas: TLFDBCtrlGrid
            Left = 0
            Top = 0
            Width = 788
            Height = 499
            Align = alClient
            ColCount = 3
            DataSource = ProDMPantMarcajes.DSLstMarcajes
            PanelHeight = 249
            PanelWidth = 257
            TabOrder = 0
            RowCount = 2
            OnPaintPanel = DBCGOperarioPaintPanel
            object ImagenMaquina: TImage
              Left = 0
              Top = 0
              Width = 257
              Height = 73
              Align = alTop
              Enabled = False
              Proportional = True
            end
            object DBECodMaq: TLFDbedit
              Left = 64
              Top = 3
              Width = 25
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              BevelEdges = []
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'Codigo'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              TabOrder = 0
              Visible = False
            end
            object LFDBMemo1: TLFDBMemo
              Left = 0
              Top = 83
              Width = 257
              Height = 166
              Align = alBottom
              Color = clMenu
              DataField = 'Notas'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Visible = False
            end
            object DBENombre1: TLFDbedit
              Left = 88
              Top = 3
              Width = 169
              Height = 21
              Anchors = [akTop, akRight]
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'Titulo'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              TabOrder = 2
              Visible = False
            end
            object DBEMaquina: TLFDbedit
              Left = 64
              Top = 24
              Width = 193
              Height = 21
              Anchors = [akTop, akRight]
              BiDiMode = bdRightToLeftReadingOnly
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'Horario'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              ParentBiDiMode = False
              TabOrder = 3
              Visible = False
            end
            object DBEHorario1: TLFDbedit
              Left = 64
              Top = 44
              Width = 193
              Height = 21
              Anchors = [akTop, akRight]
              BorderStyle = bsNone
              Color = clInfoBk
              DataField = 'HorasTrab'
              DataSource = ProDMPantMarcajes.DSLstMarcajes
              Enabled = False
              TabOrder = 4
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 557
    Width = 800
  end
  inherited CEMain: TControlEdit
    Left = 640
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 676
    Top = 12
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
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
    Left = 744
    Top = 16
  end
  inherited FSMain: TLFFibFormStorage
    Left = 712
    Top = 16
  end
  object Timer1: TTimer
    Interval = 100000
    OnTimer = Timer1Timer
    Left = 312
    Top = 80
  end
end
