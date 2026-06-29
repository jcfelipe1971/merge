object FGrafico: TFGrafico
  Left = 326
  Top = 132
  Width = 800
  Height = 545
  Caption = 'Gr'#225'fico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PCMain: TLFPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 518
    ActivePage = VentasMeses
    Align = alClient
    OwnerDraw = True
    TabOrder = 0
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object VentasAnuales: TTabSheet
      Caption = 'VentasAnuales'
      ImageIndex = 1
      TabVisible = False
      object DBCAnual: TDBChart
        Left = 0
        Top = 0
        Width = 784
        Height = 508
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'VENTAS ANUALES')
        BottomAxis.LabelStyle = talNone
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          784
          508)
        object BitBtnConfigurarVentasAnuales: TBitBtn
          Left = 689
          Top = 430
          Width = 85
          Height = 30
          Anchors = [akRight, akBottom]
          Caption = '&Configurar'
          Default = True
          ModalResult = 1
          TabOrder = 0
          OnClick = BitBtnConfigurarClick
        end
        object BitBtnAnual: TBitBtn
          Left = 689
          Top = 394
          Width = 85
          Height = 30
          Anchors = [akRight, akBottom]
          Caption = '&Imprimir'
          Default = True
          ModalResult = 1
          TabOrder = 1
          OnClick = BitBtnAnualClick
        end
        object Series7: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasAnualC_3
          SeriesColor = clWhite
          Title = 'Comparado -3'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'TOTAL_BASE'
        end
        object Series6: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasAnualC_2
          SeriesColor = clBlue
          Title = 'Comparado -2'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'TOTAL_BASE'
        end
        object Series5: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasAnualC_1
          SeriesColor = clYellow
          Title = 'Comparado -1'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'TOTAL_BASE'
        end
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasAnualCompara
          SeriesColor = clRed
          Title = 'Comparado'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'TOTAL_BASE'
        end
        object Series2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasAnual
          SeriesColor = clGreen
          Title = 'Actual'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'TOTAL_BASE'
        end
      end
    end
    object VentasMeses: TTabSheet
      Caption = 'VentasMeses'
      TabVisible = False
      object DBCMensual: TDBChart
        Left = 0
        Top = 0
        Width = 784
        Height = 508
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'VENTAS MENSUALES')
        BottomAxis.LabelsSeparation = 0
        BottomAxis.LabelStyle = talText
        OnGetAxisLabel = DBCMensualGetAxisLabel
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          784
          508)
        object BitBtnMensual: TBitBtn
          Left = 689
          Top = 394
          Width = 85
          Height = 30
          Anchors = [akRight, akBottom]
          Caption = '&Imprimir'
          Default = True
          ModalResult = 1
          TabOrder = 0
          OnClick = BitBtnMensualClick
        end
        object BitBtnConfigurarMensual: TBitBtn
          Left = 689
          Top = 430
          Width = 85
          Height = 30
          Anchors = [akRight, akBottom]
          Caption = '&Configurar'
          Default = True
          ModalResult = 1
          TabOrder = 1
          OnClick = BitBtnConfigurarClick
        end
        object Series4: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasMensualCompara
          SeriesColor = clRed
          Title = 'Comparado'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 
            'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
            'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
        end
        object Series3: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasMensual
          SeriesColor = clGreen
          Title = 'Actual'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 
            'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
            'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
        end
      end
    end
    object Prevision: TTabSheet
      Caption = 'Prevision'
      ImageIndex = -1
      TabVisible = False
      object DBCPrevision: TDBChart
        Left = 0
        Top = 0
        Width = 784
        Height = 508
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'PREVISI'#211'N MENSUAL')
        BottomAxis.LabelsSeparation = 0
        BottomAxis.LabelStyle = talText
        OnGetAxisLabel = DBCPrevisionGetAxisLabel
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          784
          508)
        object BitBtnPrevision: TBitBtn
          Left = 689
          Top = 394
          Width = 85
          Height = 30
          Anchors = [akRight, akBottom]
          Caption = '&Imprimir'
          Default = True
          ModalResult = 1
          TabOrder = 0
          OnClick = BitBtnPrevisionClick
        end
        object BitBtnConfigurarPrevision: TBitBtn
          Left = 689
          Top = 430
          Width = 85
          Height = 30
          Anchors = [akRight, akBottom]
          Caption = '&Configurar'
          Default = True
          ModalResult = 1
          TabOrder = 1
          OnClick = BitBtnConfigurarClick
        end
        object BarSeries2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxPrevisionMensual
          SeriesColor = clRed
          Title = 'Previsi'#243'n'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 
            'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
            'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
        end
        object BarSeries1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = DMClientes.DSxFacturasMensual
          SeriesColor = 4227072
          Title = 'Actual'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 
            'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
            'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
        end
      end
    end
  end
end
