inherited ProFMGrafTareas: TProFMGrafTareas
  Caption = 'Gr'#225'fico de Tareas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LFPanel1: TLFPanel
    inherited DBMainChart: TDBChart
      Title.Text.Strings = (
        'Costes Previstos y Reales de Tareas')
      BottomAxis.Title.Caption = 'Coste'
      LeftAxis.Title.Caption = 'Tareas'
      object Series1: THorizBarSeries
        Marks.ArrowLength = 8
        Marks.Style = smsXValue
        Marks.Visible = True
        DataSource = ProDMGrafTareas.xGrafCosteTareas
        SeriesColor = clRed
        Title = 'Previsi'#243'n Tareas'
        XLabelsSource = 'TAREA'
        AutoMarkPosition = False
        SideMargins = False
        XValues.DateTime = False
        XValues.Name = 'Bar'
        XValues.Multiplier = 1
        XValues.Order = loNone
        XValues.ValueSource = 'TOTAL_PREV'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loAscending
      end
      object Series2: THorizBarSeries
        Marks.ArrowLength = 8
        Marks.Style = smsXValue
        Marks.Visible = True
        DataSource = ProDMGrafTareas.xGrafCosteTareas
        SeriesColor = clGreen
        Title = 'Tareas Real'
        XLabelsSource = 'TAREA'
        AutoMarkPosition = False
        SideMargins = False
        XValues.DateTime = False
        XValues.Name = 'Bar'
        XValues.Multiplier = 1
        XValues.Order = loNone
        XValues.ValueSource = 'TOTAL_REAL'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loAscending
      end
    end
  end
end
