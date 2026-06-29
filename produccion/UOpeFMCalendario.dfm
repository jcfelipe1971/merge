inherited OpeFMCalendario: TOpeFMCalendario
  Left = 646
  Top = 165
  Caption = 'Mantenimiento del Calendario de la Empresa'
  ClientHeight = 547
  ClientWidth = 756
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 523
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = OpeDMCalendario.DSQMCalendario
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEDescripcion
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object PNLIgnorar: TLFPanel
        Left = 319
        Top = 0
        Width = 232
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
        object CBIgnorarFestivo: TLFCheckBox
          Left = 163
          Top = 3
          Width = 72
          Height = 17
          Caption = 'Festivo'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object ToolButton2: TToolButton
        Left = 551
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 559
        Top = 0
        DropdownMenu = PTDiaSemanaFiest
        Enabled = False
        ImageIndex = 9
        Style = tbsDropDown
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 493
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 744
          Height = 68
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = OpeDMCalendario.DSQMCalendario
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'OPE_CALENDARIO_C'
            CampoNum = 'CALENDARIO'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CALENDARIO')
          end
          object LCalendario: TLFLabel
            Left = 14
            Top = 4
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calendario'
            FocusControl = DBECalendario
          end
          object LDescripcion: TLFLabel
            Left = 8
            Top = 26
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object LHorario: TLFLabel
            Left = 31
            Top = 48
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
          end
          object LTotalHorasLaborables: TLFLabel
            Left = 311
            Top = 48
            Width = 110
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Horas Laborables'
          end
          object DBECalendario: TLFDbedit
            Left = 70
            Top = 0
            Width = 42
            Height = 21
            Color = clInfoBk
            DataField = 'CALENDARIO'
            DataSource = OpeDMCalendario.DSQMCalendario
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
          object DBEDescripcion: TLFDbedit
            Left = 70
            Top = 22
            Width = 231
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMCalendario.DSQMCalendario
            TabOrder = 1
          end
          object GBLeyenda: TGroupBox
            Left = 533
            Top = 0
            Width = 209
            Height = 63
            Caption = 'Leyenda'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object Shape1: TShape
              Left = 100
              Top = 20
              Width = 11
              Height = 11
              Brush.Color = clAqua
            end
            object LFest_Renum: TLFLabel
              Left = 115
              Top = 43
              Width = 82
              Height = 13
              Caption = 'Festivo / Remun.'
            end
            object Shape2: TShape
              Left = 100
              Top = 44
              Width = 11
              Height = 11
              Brush.Color = clOlive
            end
            object LFestivo: TLFLabel
              Left = 23
              Top = 19
              Width = 34
              Height = 13
              Caption = 'Festivo'
              Color = clBtnFace
              ParentColor = False
            end
            object Shape3: TShape
              Left = 7
              Top = 20
              Width = 11
              Height = 11
              Brush.Color = clTeal
            end
            object LRemunerada: TLFLabel
              Left = 115
              Top = 19
              Width = 66
              Height = 13
              Caption = 'Remuneradas'
            end
            object Shape4: TShape
              Left = 7
              Top = 44
              Width = 11
              Height = 11
              Brush.Color = clYellow
            end
            object LOtroHorario: TLFLabel
              Left = 22
              Top = 43
              Width = 57
              Height = 13
              Caption = 'Otro Horario'
            end
          end
          object DBCSabados: TLFDBCheckBox
            Left = 310
            Top = 2
            Width = 95
            Height = 15
            Hint = 'Considerar los Sabados como festivos'
            Caption = 'Sabados Fest.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Visible = False
            Alignment = taLeftJustify
            DataField = 'SABADO_FEST'
            DataSource = OpeDMCalendario.DSQMCalendario
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCDomingos: TLFDBCheckBox
            Left = 310
            Top = 23
            Width = 95
            Height = 15
            Hint = 'Considerar los Domingos como festivos'
            Caption = 'Domingos Fest.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Visible = False
            Alignment = taLeftJustify
            DataField = 'DOMINGO_FEST'
            DataSource = OpeDMCalendario.DSQMCalendario
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFHorario: TLFDBEditFind2000
            Left = 70
            Top = 44
            Width = 42
            Height = 21
            DataField = 'HORARIO'
            DataSource = OpeDMCalendario.DSQMCalendario
            TabOrder = 5
            OnChange = DBEFHorarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_HORARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'HORARIO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'HORARIO')
            Filtros = []
          end
          object DescHorario: TLFHYDBDescription
            Left = 113
            Top = 44
            Width = 188
            Height = 21
            Color = clInfoBk
            DataSource = OpeDMCalendario.DSQMCalendario
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Tabla_a_buscar = 'OPE_HORARIOS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'HORARIO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'HORARIO')
          end
          object DBEHoras: TLFDbedit
            Left = 427
            Top = 44
            Width = 78
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'HORAS_LAB'
            DataSource = OpeDMCalendario.DSxHorasTotales
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
          Top = 68
          Width = 744
          Height = 352
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
          Year = 2019
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
          Top = 420
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
          Height = 465
          DataSource = OpeDMCalendario.DSQMCalendario
          CamposAOrdenar.Strings = (
            'CALENDARIO'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'CALENDARIO'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 617
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 756
  end
  inherited CEMain: TControlEdit
    Left = 680
    Top = 40
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 712
    Top = 40
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 712
    Top = 8
    object AMarcarFestivo: TAction
      Tag = 1
      Category = 'Procesos'
      Caption = 'Marcar Festivo'
      OnExecute = DiasEspeciales
    end
    object AMarcarLaboral: TAction
      Category = 'Procesos'
      Caption = 'Marcar Laboral'
      OnExecute = DiasEspeciales
    end
    object AMarcarRenumerado: TAction
      Tag = 3
      Category = 'Procesos'
      Caption = 'Marcar Renumerado'
      OnExecute = DiasEspeciales
    end
    object AMarcarNoRenumerado: TAction
      Tag = 2
      Category = 'Procesos'
      Caption = 'Marcar No Renumerado'
      OnExecute = DiasEspeciales
    end
    object ASep: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ACambiarHorario: TAction
      Tag = 4
      Category = 'Procesos'
      Caption = 'Cambiar Horario'
      OnExecute = DiasEspeciales
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBIgnorarDomingo.Checked'
      'CBIgnorarSabado.Checked'
      'CBIgnorarFestivo.Checked')
    Left = 680
    Top = 8
  end
  object PTCalendario: TPopUpTeclas
    Left = 96
    Top = 152
    object MISeleccion: TMenuItem
      Caption = 'Seleccion'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Laboral1: TMenuItem
      Action = ALaboral
      Hint = 
        'Marcar los dias seleccionados como laborables (Quita marca de fe' +
        'stivo)'
    end
    object MarcarFestivo1: TMenuItem
      Tag = 1
      Action = AFestivo
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Remunerado1: TMenuItem
      Tag = 3
      Action = ARemunerado
      Caption = 'Remunerado'
      Hint = 'D'#237'a Remunerado'
    end
    object NoRemunerado1: TMenuItem
      Tag = 2
      Action = ANoRemun
      Hint = 'D'#237'a No Remunerado (Quita la marca de remunerado)'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Horario1: TMenuItem
      Tag = 4
      Action = AHorario
      Hint = 'Horario Especial para este dia'
    end
  end
  object ALCalendario: TActionList
    Images = DMMain.ILMain_Ac
    Left = 640
    Top = 8
    object AFestivo: TAction
      Tag = 1
      Category = 'DiasEspeciales'
      Caption = 'Festivo'
      Hint = 'Marcar los dias seleccionados como festivos'
      OnExecute = DiasEspeciales
    end
    object ALaboral: TAction
      Category = 'DiasEspeciales'
      Caption = 'Laboral'
      Hint = 'Marcar los dias seleccionados como laborables'
      OnExecute = DiasEspeciales
    end
    object ASabadoFest: TAction
      Tag = 7
      Category = 'FinSemana'
      Caption = 'Marcar'
      Hint = 'Marcar los sabados como festivos.'
      OnExecute = DiaSemanaFiesta
    end
    object ADomingoFest: TAction
      Tag = 1
      Category = 'FinSemana'
      Caption = 'Marcar'
      Hint = 'Marcar los domingos como festivos.'
      OnExecute = DiaSemanaFiesta
    end
    object ASabadoNoFest: TAction
      Tag = 17
      Category = 'FinSemana'
      Caption = 'Desmarcar'
      Hint = 'Desmarcar los sabados como festivos.'
      OnExecute = DiaSemanaFiesta
    end
    object ADomingoNoFest: TAction
      Tag = 11
      Category = 'FinSemana'
      Caption = 'Desmarcar'
      Hint = 'Desmarcar los domingos como festivos.'
      OnExecute = DiaSemanaFiesta
    end
    object ANoRemun: TAction
      Tag = 2
      Category = 'DiasEspeciales'
      Caption = 'No remunerado'
      OnExecute = DiasEspeciales
    end
    object ARemunerado: TAction
      Tag = 3
      Category = 'DiasEspeciales'
      Caption = 'ARemunerado'
      OnExecute = DiasEspeciales
    end
    object AHorario: TAction
      Tag = 4
      Category = 'DiasEspeciales'
      Caption = 'Horario'
      OnExecute = DiasEspeciales
    end
  end
  object PTDiaSemanaFiest: TPopUpTeclas
    Left = 504
    Top = 40
    object SabadosFestivos1: TMenuItem
      Caption = 'Sabados Festivos'
      object SabadosFestivos2: TMenuItem
        Tag = 7
        Action = ASabadoFest
      end
      object Desmarcar2: TMenuItem
        Tag = 17
        Action = ASabadoNoFest
      end
    end
    object Domingos1: TMenuItem
      Caption = 'Domingos Festivos'
      object DomingosFestivos1: TMenuItem
        Tag = 1
        Action = ADomingoFest
      end
      object Desmarcar1: TMenuItem
        Tag = 11
        Action = ADomingoNoFest
      end
    end
  end
end
