inherited FMCalendarioZona: TFMCalendarioZona
  Left = 639
  Top = 183
  Caption = 'Mantenimiento de Calendario de Zonas'
  ClientHeight = 544
  ClientWidth = 756
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 520
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        Width = 100
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 100
      end
      inherited EPMain: THYMEditPanel
        Left = 108
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 148
      end
      inherited TbuttComp: TToolButton
        Left = 156
      end
      object PNLIgnorar: TLFPanel
        Left = 179
        Top = 0
        Width = 171
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LIgnorar: TLFLabel
          Left = 6
          Top = 4
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ignorar'
        end
        object CBIgnorarSabado: TLFCheckBox
          Left = 40
          Top = 3
          Width = 57
          Height = 17
          Caption = 'Sabado'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBIgnorarDomingo: TLFCheckBox
          Left = 97
          Top = 3
          Width = 72
          Height = 17
          Caption = 'Domingo'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 490
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 744
          Height = 76
          Align = alTop
          object LZona: TLFLabel
            Left = 37
            Top = 10
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Zona'
            FocusControl = DBETitulo
          end
          object LCalendario: TLFLabel
            Left = 12
            Top = 32
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calendario'
            FocusControl = DBECalenDesc
          end
          object LHorario: TLFLabel
            Left = 28
            Top = 54
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
            FocusControl = DBECalenDesc
          end
          object LHoraLaborable: TLFLabel
            Left = 346
            Top = 34
            Width = 83
            Height = 13
            Caption = 'Horas Laborables'
          end
          object GBLeyenda: TGroupBox
            Left = 441
            Top = 2
            Width = 300
            Height = 72
            Caption = 'Leyenda'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Shape1: TShape
              Left = 91
              Top = 15
              Width = 11
              Height = 11
              Brush.Color = clOlive
            end
            object LFest_Rem: TLFLabel
              Left = 103
              Top = 14
              Width = 98
              Height = 13
              Caption = 'Fest.Empr. / Remun.'
            end
            object Shape2: TShape
              Left = 209
              Top = 15
              Width = 11
              Height = 11
              Brush.Color = clTeal
            end
            object LFestivo: TLFLabel
              Left = 221
              Top = 14
              Width = 67
              Height = 13
              Caption = 'Fest. Empresa'
            end
            object Shape3: TShape
              Left = 209
              Top = 34
              Width = 11
              Height = 11
              Brush.Color = clGreen
            end
            object LFestEmpl: TLFLabel
              Left = 221
              Top = 33
              Width = 73
              Height = 13
              Caption = 'Fest. Empleado'
            end
            object LRemun: TLFLabel
              Left = 17
              Top = 14
              Width = 66
              Height = 13
              Caption = 'Remuneradas'
            end
            object LRemFestEmpl: TLFLabel
              Left = 103
              Top = 33
              Width = 97
              Height = 13
              Caption = 'Fest.Empl. / Remun.'
            end
            object Shape5: TShape
              Left = 5
              Top = 15
              Width = 11
              Height = 11
              Brush.Color = clAqua
            end
            object Shape6: TShape
              Left = 91
              Top = 34
              Width = 11
              Height = 11
              Hint = ' '
              Brush.Color = clLime
            end
            object Shape4: TShape
              Left = 5
              Top = 34
              Width = 11
              Height = 11
              Brush.Color = clBlue
            end
            object LHorasAsig: TLFLabel
              Left = 17
              Top = 33
              Width = 63
              Height = 13
              Caption = 'H. Asignadas'
            end
            object LOtroHorarioEmpresa: TLFLabel
              Left = 17
              Top = 52
              Width = 101
              Height = 13
              Caption = 'Otro Horario Empresa'
            end
            object Shape7: TShape
              Left = 5
              Top = 53
              Width = 11
              Height = 11
              Brush.Color = clYellow
            end
            object LOtroHorarioEmpleado: TLFLabel
              Left = 187
              Top = 52
              Width = 107
              Height = 13
              Caption = 'Otro Horario Empleado'
            end
            object Shape8: TShape
              Left = 174
              Top = 53
              Width = 11
              Height = 11
              Brush.Color = clMoneyGreen
            end
          end
          object DBETitulo: TLFDbedit
            Left = 96
            Top = 7
            Width = 241
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMCalendarioZona.DSQMZonas
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
          object DBECalenDesc: TLFDbedit
            Left = 96
            Top = 29
            Width = 241
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = DMCalendarioZona.DSxCalendario
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
          object DBEZona: TLFDbedit
            Left = 66
            Top = 7
            Width = 29
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ZONA'
            DataSource = DMCalendarioZona.DSQMZonas
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
          object DBECalendario: TLFDbedit
            Left = 66
            Top = 29
            Width = 29
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CALENDARIO'
            DataSource = DMCalendarioZona.DSQMZonas
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
          object DBEHorario: TLFDbedit
            Left = 66
            Top = 51
            Width = 29
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'HORARIO'
            DataSource = DMCalendarioZona.DSxCalendario
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
          object DBEDescHorario: TLFDbedit
            Left = 96
            Top = 51
            Width = 241
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESC_HORARIO'
            DataSource = DMCalendarioZona.DSxCalendario
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
          object DBEHoras: TLFDbedit
            Left = 346
            Top = 50
            Width = 78
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'HORAS_LAB'
            DataSource = DMCalendarioZona.DSxHorasTotales
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
        end
        object YPCalendario: TYearPlanner
          Left = 0
          Top = 76
          Width = 744
          Height = 341
          Align = alClient
          Color = clGray
          DayFont.Charset = DEFAULT_CHARSET
          DayFont.Color = clWindowText
          DayFont.Height = -11
          DayFont.Name = 'MS Sans Serif'
          DayFont.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          HintColor = clInfoBk
          HintFont.Charset = DEFAULT_CHARSET
          HintFont.Color = clWindowText
          HintFont.Height = -11
          HintFont.Name = 'MS Sans Serif'
          HintFont.Style = []
          MonthFont.Charset = DEFAULT_CHARSET
          MonthFont.Color = clWindowText
          MonthFont.Height = -11
          MonthFont.Name = 'MS Sans Serif'
          MonthFont.Style = []
          NoDayPriority = True
          ParentFont = False
          PopupMenu = PTCalendario
          PrintOptions.PrintHeader.Font.Charset = DEFAULT_CHARSET
          PrintOptions.PrintHeader.Font.Color = clWindowText
          PrintOptions.PrintHeader.Font.Height = -11
          PrintOptions.PrintHeader.Font.Name = 'MS Sans Serif'
          PrintOptions.PrintHeader.Font.Style = []
          PrintOptions.PrintFooter.Font.Charset = DEFAULT_CHARSET
          PrintOptions.PrintFooter.Font.Color = clWindowText
          PrintOptions.PrintFooter.Font.Height = -11
          PrintOptions.PrintFooter.Font.Name = 'MS Sans Serif'
          PrintOptions.PrintFooter.Font.Style = []
          SelectionColor = clHighlight
          SelectionFont.Charset = DEFAULT_CHARSET
          SelectionFont.Color = clWindowText
          SelectionFont.Height = -11
          SelectionFont.Name = 'MS Sans Serif'
          SelectionFont.Style = []
          ShowToday = False
          TodayCircleColour = clMaroon
          TodayTextColour = clWhite
          Year = 2008
          YearFont.Charset = DEFAULT_CHARSET
          YearFont.Color = clWindowText
          YearFont.Height = -11
          YearFont.Name = 'MS Sans Serif'
          YearFont.Style = []
          OnMouseUp = YPCalendarioMouseUp
          OnMouseRightClick = YPCalendarioMouseRightClick
          OnYearChange = YPCalendarioYearChange
          OnYearChanged = YPCalendarioYearChanged
        end
        object PNLHorarioDet: TLFPanel
          Left = 0
          Top = 417
          Width = 744
          Height = 45
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            744
            45)
          object EComentario: TLFEdit
            Left = 0
            Top = 2
            Width = 743
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object EDatosFecha: TLFEdit
            Left = 0
            Top = 24
            Width = 743
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 462
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'CALENDARIO'
            'EMPLEADO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ZONA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALENDARIO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 520
    Width = 756
  end
  inherited CEMain: TControlEdit
    Left = 664
    Top = 40
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 696
    Top = 40
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
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 664
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 696
    Top = 8
  end
  object ALCalendario: TActionList
    Left = 624
    Top = 8
    object AFestivo: TAction
      Tag = 1
      Caption = 'Festivo'
      Hint = 'Marcar los dias seleccionados como festivos'
      OnExecute = Accion
    end
    object ALaboral: TAction
      Caption = 'Laboral'
      Hint = 'Marcar los dias seleccionados como laborables'
      OnExecute = Accion
    end
    object ANoRemunerado: TAction
      Tag = 2
      Caption = 'No remunerado'
      Hint = 'Marcar los d'#237'as seleccionados como no remunerados'
      OnExecute = Accion
    end
    object ARemunerado: TAction
      Tag = 3
      Caption = 'Remunerado'
      Hint = 'Marcar los d'#237'as seleccionados como remunerados'
      OnExecute = Accion
    end
    object AHoras: TAction
      Tag = 4
      Caption = 'Horas'
      OnExecute = Accion
    end
    object AHorario: TAction
      Tag = 5
      Caption = 'Horario'
      OnExecute = Accion
    end
    object AReparto: TAction
      Tag = 7
      Caption = 'Reparto'
      Hint = 'Marcar los dias seleccionados para reparto'
      OnExecute = Accion
    end
    object ASinReparto: TAction
      Tag = 8
      Caption = 'Sin Reparto'
      OnExecute = Accion
    end
  end
  object PTCalendario: TPopUpTeclas
    Left = 88
    Top = 168
    object MISeleccion: TMenuItem
      Caption = 'Seleccion'
    end
    object MarcarFestivo1: TMenuItem
      Tag = 1
      Action = AFestivo
    end
    object Laboral1: TMenuItem
      Action = ALaboral
    end
    object Noremunerado1: TMenuItem
      Tag = 2
      Action = ANoRemunerado
    end
    object Remunerado1: TMenuItem
      Tag = 3
      Action = ARemunerado
    end
    object Horas1: TMenuItem
      Tag = 4
      Action = AHoras
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Horario1: TMenuItem
      Tag = 5
      Action = AHorario
    end
    object MIReparto: TMenuItem
      Action = AReparto
    end
    object MISinReparto: TMenuItem
      Action = ASinReparto
    end
  end
end
