inherited ProFMGrafMateriales: TProFMGrafMateriales
  Caption = 'ProFMGrafMateriales'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LFPanel1: TLFPanel
    inherited DBMainChart: TDBChart
      Title.Text.Strings = (
        'Costes Previstos y Reales de Materiales')
      BottomAxis.Title.Caption = 'Coste'
      LeftAxis.Title.Caption = 'Materiales'
      object Series1: THorizBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsXValue
        Marks.Visible = True
        DataSource = ProDMGrafMateriales.xGrafCosteMateriales
        SeriesColor = clRed
        Title = 'Materiales Prev.'
        XValues.DateTime = False
        XValues.Name = 'Bar'
        XValues.Multiplier = 1
        XValues.Order = loNone
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
      object Series2: THorizBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsXValue
        Marks.Visible = True
        DataSource = ProDMGrafMateriales.xGrafCosteMateriales
        SeriesColor = clGreen
        Title = 'Materiales Real'
        XLabelsSource = 'COMPONENTE'
        XValues.DateTime = False
        XValues.Name = 'Bar'
        XValues.Multiplier = 1
        XValues.Order = loNone
        XValues.ValueSource = 'TOTAL_REAL'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
    end
  end
end
