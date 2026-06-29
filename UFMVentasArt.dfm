inherited FMVentasArt: TFMVentasArt
  Left = 472
  Top = 227
  Width = 770
  Height = 476
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ventas del Art'#237'culo a Clientes'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 760
    Height = 423
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 756
      Font.Style = [fsBold]
      ParentFont = False
      DesignSize = (
        752
        22)
      object PNLOpciones: TLFPanel [0]
        Left = 0
        Top = 0
        Width = 341
        Height = 22
        Anchors = []
        BevelOuter = bvNone
        TabOrder = 0
        object CBEjercicio: TLFCheckBox
          Left = 0
          Top = 0
          Width = 121
          Height = 22
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
          Top = 0
          Width = 103
          Height = 22
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
          Left = 234
          Top = 0
          Width = 102
          Height = 22
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
      object TSepOpciones: TToolButton [1]
        Left = 341
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLMoneda: TLFPanel [2]
        Left = 349
        Top = 0
        Width = 287
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBLMoneda: TLFLabel
          Left = 7
          Top = 3
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
          DataSource = DMVentasArt.DSxMonedas
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
      object ToolButton4: TToolButton [3]
        Left = 636
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimir: TToolButton [4]
        Left = 644
        Top = 0
        Hint = 'Visualizar Listado'
        Caption = 'Visualizar Listado'
        ImageIndex = 14
        OnClick = TButtImprimirClick
      end
      object TButtConfigurar: TToolButton [5]
        Left = 667
        Top = 0
        Hint = 'Configuracion R'#225'pida del listado'
        Caption = 'Configurar'
        ImageIndex = 77
        OnClick = TButtConfigurarClick
      end
      object ToolButton5: TToolButton [6]
        Left = 690
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 698
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        SalirMensaje = ' '#191' Abandonar esta Ventana ? '
        TabOrder = 1
      end
    end
    object PNLTotal: TLFPanel
      Left = 2
      Top = 397
      Width = 756
      Height = 24
      Align = alBottom
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object LTotalUnidades: TLFLabel
        Left = 358
        Top = 4
        Width = 68
        Height = 16
        Alignment = taRightJustify
        Caption = 'Unidades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTotalImporte: TLFLabel
        Left = 574
        Top = 4
        Width = 53
        Height = 16
        Alignment = taRightJustify
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RMETotalVentas: THYGRightEdit
        Left = 633
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
      object RMETotalUnidades: THYGRightEdit
        Left = 433
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
        TabOrder = 1
      end
    end
    object DBGFClientesArt: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 756
      Height = 369
      Align = alClient
      Color = clInfoBk
      DataSource = DMVentasArt.DSxVentasCliente
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
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      Transaction = DMVentasArt.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
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
          FieldName = 'CLIENTE'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 410
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 72
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
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARGEN_PORC'
          Width = 72
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 423
    Width = 760
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
