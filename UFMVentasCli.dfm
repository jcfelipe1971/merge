inherited FMVentasCli: TFMVentasCli
  Left = 392
  Top = 157
  Width = 1019
  Height = 476
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ventas de Art'#237'culos al Cliente'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1009
    Height = 423
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 1005
      Font.Style = [fsBold]
      ParentFont = False
      DesignSize = (
        1001
        22)
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        TabOrder = 3
      end
      inherited TSepTerc: TToolButton [2]
        Left = 228
      end
      inherited TbuttComp: TToolButton [3]
        Left = 236
      end
      object PNLOpciones: TLFPanel [4]
        Left = 259
        Top = 0
        Width = 341
        Height = 22
        Anchors = []
        BevelOuter = bvNone
        TabOrder = 0
        object CBEjercicio: TLFCheckBox
          Left = 4
          Top = 2
          Width = 120
          Height = 20
          Caption = 'Todos Ejercicios'
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 0
          TabStop = True
          OnClick = CBEjercicioClick
          Alignment = taLeftJustify
        end
        object CBCanal: TLFCheckBox
          Left = 128
          Top = 2
          Width = 107
          Height = 20
          Caption = 'Todos Canales'
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 1
          TabStop = True
          OnClick = CBCanalClick
          Alignment = taLeftJustify
        end
        object CBSerie: TLFCheckBox
          Left = 236
          Top = 2
          Width = 100
          Height = 20
          Caption = 'Todas Series'
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 2
          TabStop = True
          OnClick = CBSerieClick
          Alignment = taLeftJustify
        end
      end
      object TSepOpciones: TToolButton [5]
        Left = 600
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLMoneda: TLFPanel [6]
        Left = 608
        Top = 0
        Width = 287
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBLMoneda: TLFLabel
          Left = 13
          Top = 4
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moneda'
          Layout = tlCenter
        end
        object DBEFMoneda: TLFEditFind2000
          Left = 63
          Top = 1
          Width = 36
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'DBEFMoneda'
          OnChange = DBEFMonedaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'MONEDA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_MONEDAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'DEFECTO DESC, MONEDA')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitMoneda: TLFDbedit
          Left = 100
          Top = 1
          Width = 186
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMVentasCli.DSxMonedas
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
      end
      object ToolButton4: TToolButton [7]
        Left = 895
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimir: TToolButton [8]
        Left = 903
        Top = 0
        Hint = 'Visualizar Listado'
        Caption = 'Visualizar Listado'
        ImageIndex = 14
        OnClick = TButtImprimirClick
      end
      object TButtConfigurar: TToolButton [9]
        Left = 926
        Top = 0
        Hint = 'Configuracion R'#225'pida del listado'
        Caption = 'Configurar'
        ImageIndex = 77
        OnClick = TButtConfigurarClick
      end
      object ToolButton5: TToolButton [10]
        Left = 949
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel [11]
        Left = 957
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        SalirMensaje = ' '#191' Abandonar esta Ventana ? '
      end
    end
    object TBTotales: TLFToolBar
      Left = 2
      Top = 393
      Width = 1005
      Height = 28
      Align = alBottom
      AutoSize = True
      ButtonHeight = 24
      TabOrder = 1
      Separators = True
      object PNLTotal: TLFPanel
        Left = 0
        Top = 2
        Width = 711
        Height = 24
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object LBLTotal: TLFLabel
          Left = 537
          Top = 4
          Width = 37
          Height = 16
          Alignment = taRightJustify
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RMETotal: THYGRightEdit
          Left = 577
          Top = 0
          Width = 121
          Height = 24
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object DBGFArticulosCli: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 1005
      Height = 365
      Align = alClient
      Color = clInfoBk
      DataSource = DMVentasCli.DSxVentasCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'TITULO'
        'TOTAL_VENTAS'
        'UNIDADES'
        'PV'
        'MARGEN'
        'COSTE')
      ColumnasCheckBoxes.Strings = (
        'RECIBIDO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 409
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TOTAL_VENTAS'
          Width = 130
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 423
    Width = 1009
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBEjercicio.Checked'
      'CBCanal.Checked'
      'CBSerie.Checked')
  end
end
