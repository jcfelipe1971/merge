inherited ProFMGrafCostesFases: TProFMGrafCostesFases
  Caption = 'Gr'#225'fico de costes por fase'
  PixelsPerInch = 96
  TextHeight = 13
  inherited LFPanel1: TLFPanel
    inherited DBMainChart: TDBChart
      Title.Text.Strings = (
        'Costes por Fase')
      BottomAxis.Title.Caption = 'Fases'
      LeftAxis.Title.Caption = 'Coste'
      object Series1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = True
        DataSource = ProDMGrafCostesFases.xGrafCostesFases
        SeriesColor = clRed
        Title = 'Costes Tarea Prev.'
        XLabelsSource = 'FASE'
        BarStyle = bsCilinder
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'TAREA_PREV'
      end
      object Series2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = True
        DataSource = ProDMGrafCostesFases.xGrafCostesFases
        SeriesColor = clGreen
        Title = 'Costes Tarea Real'
        XLabelsSource = 'FASE'
        BarStyle = bsCilinder
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'TAREA_REAL'
      end
      object Series3: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = True
        DataSource = ProDMGrafCostesFases.xGrafCostesFases
        SeriesColor = clYellow
        Title = 'Costes Material Prev.'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'MATERIAL_PREV'
      end
      object Series4: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = True
        DataSource = ProDMGrafCostesFases.xGrafCostesFases
        SeriesColor = clBlue
        Title = 'Costes Material Real'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'MATERIAL_REAL'
      end
    end
  end
end
