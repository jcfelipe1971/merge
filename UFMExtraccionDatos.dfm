inherited FMExtraccionDatos: TFMExtraccionDatos
  Width = 600
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Extracci'#243'n de datos'
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = DMExtraccionDatos.DSQMExtraccion
        Hints.Strings = ()
        EditaControl = DBMSentencia
        InsertaControl = DBETitulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMExtraccionDatos.DSQMExtraccion
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TbuttComp: TToolButton
        Action = AEjecutar
      end
      object ToolButton2: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtEjecutar: TToolButton
        Left = 327
        Top = 0
        Action = AEjecutar
      end
      object ProgressBar: TProgressBar
        Left = 350
        Top = 0
        Width = 150
        Height = 22
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 2
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Top = 28
          Width = 578
          Height = 246
          Enabled = True
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMExtraccionDatos.DSQMExtraccion
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_EXTRACCION_DATOS'
            CampoNum = 'ID'
            CampoStr = 'TITULO'
          end
          object PNLFicha: TLFPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 246
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
        object PNLTitulo: TLFPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            578
            28)
          object DBETituloFicha: TLFDbedit
            Left = 8
            Top = 6
            Width = 561
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMExtraccionDatos.DSQMExtraccion
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object TSSentencia: TTabSheet [1]
        Caption = 'Sentencia SQL'
        ImageIndex = 2
        object DBMSentencia: TLFDBMemo
          Left = 0
          Top = 41
          Width = 578
          Height = 233
          Align = alClient
          DataField = 'SENTENCIA'
          DataSource = DMExtraccionDatos.DSQMExtraccion
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object PNLEdicion: TLFPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            578
            41)
          object LSentencia: TLFLabel
            Left = 0
            Top = 28
            Width = 578
            Height = 13
            Align = alBottom
            Caption = 'Sentencia'
          end
          object LTitulo: TLFLabel
            Left = 16
            Top = 8
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object DBETitulo: TLFDbedit
            Left = 48
            Top = 3
            Width = 433
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TITULO'
            DataSource = DMExtraccionDatos.DSQMExtraccion
            TabOrder = 0
          end
          object DBCHKTransaccionReadOnly: TLFDBCheckBox
            Left = 483
            Top = 5
            Width = 93
            Height = 17
            Caption = 'Solo Lectura'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 1
            TabStop = True
            Anchors = [akTop, akRight]
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'TRANSACCION_READONLY'
            DataSource = DMExtraccionDatos.DSQMExtraccion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          DataSource = DMExtraccionDatos.DSQMExtraccion
          OnDblClick = DBGMainDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 455
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Width = 590
    Height = 215
    OnResize = PDetalleResize
    inherited TBDetalle: TLFToolBar
      Width = 590
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 96
        DataSource = DMExtraccionDatos.DSxResultado
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 96
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 162
      ReadOnly = True
      UsaDicG2K = False
    end
    object DBGDetalle: THYTDBGrid
      Left = 0
      Top = 22
      Width = 590
      Height = 162
      Align = alClient
      Color = clInfoBk
      DataSource = DMExtraccionDatos.DSxResultado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGDetalleColEnter
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      TabFicha = TSFicha
      PermutaPaneles = True
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
    end
    object PNLTotales: TLFPanel
      Left = 0
      Top = 184
      Width = 590
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 590
  end
  inherited CEMain: TControlEdit
    DataSource = DMExtraccionDatos.DSQMExtraccion
    FichaEdicion = TSSentencia
    FichaExclusiva = TSSentencia
    PanelEdicion = PNLEdicion
    Left = 344
    Top = 24
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 364
    Top = 8
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 400
    Top = 8
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Ejecucion'
      Caption = 'Ejecuci'#243'n'
      ImageIndex = 94
    end
    object AEjecutar: TAction
      Category = 'Ejecucion'
      Caption = 'Ejecutar'
      Hint = 'Ejecutar sentencia SQL'
      ImageIndex = 94
      OnExecute = AEjecutarExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Exportacion'
      Caption = 'Exportaci'#243'n'
      ImageIndex = 36
    end
    object AExportaExcel: TAction
      Category = 'Exportacion'
      Caption = 'Exporta a Excel'
      ImageIndex = 36
      OnExecute = AExportaExcelExecute
    end
    object AExportarHTML: TAction
      Category = 'Exportacion'
      Caption = 'Exportar a HTML'
      ImageIndex = 43
      OnExecute = AExportarHTMLExecute
    end
    object AExportarCSV: TAction
      Category = 'Exportacion'
      Caption = 'Exportar CSV'
      ImageIndex = 25
      OnExecute = AExportarCSVExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 440
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    Left = 366
    Top = 328
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 418
    Top = 330
    inherited CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      Visible = False
    end
    inherited CEDetalleMipost: TMenuItem
      Visible = False
    end
    inherited CEDetalleMicancel: TMenuItem
      Visible = False
    end
    inherited CEDetalleMirefresh: TMenuItem
      Visible = False
    end
  end
end
