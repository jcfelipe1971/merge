inherited FMStockTallas: TFMStockTallas
  Left = 640
  Top = 160
  Caption = 'Stocks TYC'
  ClientHeight = 321
  ClientWidth = 890
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 890
    Height = 297
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 886
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      object TBSep1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TCTipo: TTabControl
        Left = 41
        Top = 0
        Width = 142
        Height = 22
        Style = tsFlatButtons
        TabOrder = 0
        Tabs.Strings = (
          'Modelo'
          'Modelo-Color')
        TabIndex = 0
        OnChange = TCTipoChange
      end
      object TCModo: TTabControl
        Left = 183
        Top = 0
        Width = 173
        Height = 22
        Style = tsFlatButtons
        TabOrder = 1
        Tabs.Strings = (
          'Stock'
          'Entradas'
          'Salidas')
        TabIndex = 0
        OnChange = TCModoChange
      end
    end
    object HYTDBGModelo: THYTDBGrid
      Left = 2
      Top = 28
      Width = 886
      Height = 267
      Align = alClient
      Color = clInfoBk
      DataSource = DSxStocksAlmacenesModelo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FSMain
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
          Expanded = False
          FieldName = 'ALMACEN'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_COLOR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORMA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T01'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T02'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T03'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T04'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T05'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T06'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T07'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T08'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T09'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T10'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T11'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T12'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T13'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T14'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T15'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T16'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T17'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T18'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T19'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T20'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T21'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T22'
          Width = 25
          Visible = True
        end>
    end
    object HYTDBGModeloColor: THYTDBGrid
      Left = 2
      Top = 28
      Width = 886
      Height = 267
      Align = alClient
      Color = clInfoBk
      DataSource = DSxStocksAlmacenesModeloColor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      IniStorage = FSMain
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
          Expanded = False
          FieldName = 'ALMACEN'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_COLOR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORMA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T01'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T02'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T03'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T04'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T05'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T06'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T07'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T08'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T09'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T10'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T11'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T12'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T13'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T14'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T15'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T16'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T17'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T18'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T19'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T20'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T21'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T22'
          Width = 25
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 297
    Width = 890
  end
  object DSxStocksAlmacenesModeloColor: TDataSource
    DataSet = DMStockTallas.xStocksAlmacenesModeloColor
    Left = 16
    Top = 136
  end
  object DSxStocksAlmacenesModelo: TDataSource
    DataSet = DMStockTallas.xStocksAlmacenesModelo
    Left = 88
    Top = 136
  end
end
