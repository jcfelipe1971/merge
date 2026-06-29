inherited FMPrevisionCuentas: TFMPrevisionCuentas
  Left = 226
  Top = 178
  Width = 1176
  Height = 596
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Previsi'#243'n cuentas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1166
    Height = 543
    inherited TBMain: TLFToolBar
      Width = 1162
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMPrevisionCuentas.DSQMPrevisionCuentas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 241
      end
      inherited TbuttComp: TToolButton
        Left = 249
      end
      object TBDistribuyePrevision: TToolButton
        Left = 272
        Top = 0
        Action = ADistribuyePrevision
      end
      object TBActualizaSaldos: TToolButton
        Left = 295
        Top = 0
        Action = AActualizaSaldos
      end
      object TSep1: TToolButton
        Left = 318
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TBAbreGrafico: TToolButton
        Left = 326
        Top = 0
        Hint = 'Abre Grafico'
        Caption = 'Abre Grafico'
        ImageIndex = 25
        Visible = False
      end
      object ProgressBar: TProgressBar
        Left = 349
        Top = 0
        Width = 150
        Height = 22
        Min = 0
        Max = 100
        TabOrder = 2
        Visible = False
      end
    end
    object PnlPrevisionCuentas: TLFPanel
      Left = 2
      Top = 28
      Width = 1162
      Height = 513
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGPrevisionCuentas: THYTDBGrid
        Left = 0
        Top = 0
        Width = 1162
        Height = 297
        Align = alClient
        Ctl3D = True
        DataSource = DMPrevisionCuentas.DSQMPrevisionCuentas
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGPrevisionCuentasDrawColumnCell
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CUENTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_CUENTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 234
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_01'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_01'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_01'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_02'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_02'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_02'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_03'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_03'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_03'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_04'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_04'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_04'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_05'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_05'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_05'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_06'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_06'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_06'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_07'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_07'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_07'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_08'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_08'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_08'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_09'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_09'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_09'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_10'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_10'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_10'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_11'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_11'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_11'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_12'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_12'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_12'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREVISION_20'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SALDO_20'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIFERENCIA_20'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end>
      end
      object PNLGraficoPRevision: TLFPanel
        Left = 0
        Top = 297
        Width = 1162
        Height = 216
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PNLGraficoPRevision'
        TabOrder = 1
        object DBGraficoCuentas: TDBChart
          Left = 0
          Top = 0
          Width = 1162
          Height = 216
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            'Previsi'#243'n de cuentas')
          OnGetAxisLabel = DBGraficoCuentasGetAxisLabel
          Align = alClient
          TabOrder = 0
          object Series1: TBarSeries
            Marks.ArrowLength = 8
            Marks.Style = smsValue
            Marks.Visible = False
            DataSource = DMPrevisionCuentas.DSQMPrevisionCuentas
            SeriesColor = clRed
            Title = 'Saldo'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 
              'SALDO_01;SALDO_02;SALDO_03;SALDO_04;SALDO_05;SALDO_06;SALDO_07;S' +
              'ALDO_08;SALDO_09;SALDO_10;SALDO_11;SALDO_12'
          end
          object Series2: TBarSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DMPrevisionCuentas.DSQMPrevisionCuentas
            SeriesColor = clGreen
            Title = 'Previsi'#243'n'
            XLabelsSource = 'CUENTA'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 
              'PREVISION_01;PREVISION_02;PREVISION_03;PREVISION_04;PREVISION_05' +
              ';PREVISION_06;PREVISION_07;PREVISION_08;PREVISION_09;PREVISION_1' +
              '0;PREVISION_11;PREVISION_12'
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 543
    Width = 1166
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
    object ADistribuyePrevision: TAction
      Category = 'Procesos'
      Caption = 'Distribuye prevision'
      Hint = 'Distribuye importe de prevision'
      ImageIndex = 86
      OnExecute = ADistribuyePrevisionExecute
    end
    object AActualizaSaldos: TAction
      Category = 'Procesos'
      Caption = 'Actualiza saldos de cuenta'
      Hint = 'Actualiza saldos de cuenta'
      ImageIndex = 26
      OnExecute = AActualizaSaldosExecute
    end
    object AExportaAExcel: TAction
      Category = 'Procesos'
      Caption = 'Exportar a Excel'
      Hint = 'Exportar a Excel'
      ImageIndex = 36
      OnExecute = AExportaAExcelExecute
    end
    object AAbreGrafico: TAction
      Category = 'Procesos'
      Caption = 'Abre Gr'#225'fico'
      Hint = 'Abre Gr'#225'fico'
      ImageIndex = 45
    end
  end
end
