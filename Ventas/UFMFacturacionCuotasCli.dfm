inherited FMFacturacionCuotasCli: TFMFacturacionCuotasCli
  Left = 364
  Top = 249
  Width = 1215
  Height = 578
  HelpContext = 205
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturaci'#243'n autom'#225'tica de cuotas a clientes'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1205
    Height = 525
    inherited TBMain: TLFToolBar
      Width = 1201
      TabOrder = 2
      object PNLSerieDoc: TLFPanel [0]
        Left = 0
        Top = 0
        Width = 224
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBLSerie: TLFLabel
          Left = 21
          Top = 4
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = '&Serie Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object CBSeries: TLFComboBox
          Left = 101
          Top = 0
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSeriesChange
        end
      end
      object PNLFechaDoc: TLFPanel [1]
        Left = 224
        Top = 0
        Width = 200
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBLFFactura: TLFLabel
          Left = 7
          Top = 4
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = 'F&echa documento'
          FocusControl = DTPFechaFactura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DTPFechaFactura: TLFDateEdit
          Left = 112
          Top = 0
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object TButtSep4: TToolButton [2]
        Left = 424
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtTodos: TToolButton [3]
        Left = 432
        Top = 0
        Hint = 'Marcar todas las cuotas'
        Caption = 'Todos'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodosClick
      end
      object TButtDesmarcar: TToolButton [4]
        Left = 455
        Top = 0
        Hint = 'Quita la marca de todas las cuotas'
        Caption = 'Desmarcar'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesmarcarClick
      end
      object TButtRefrescar: TToolButton [5]
        Left = 478
        Top = 0
        Hint = 'Procesar cuotas pendientes'
        Caption = 'Refrescar'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object TButtSep2: TToolButton [6]
        Left = 501
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMostrarFiltros: TToolButton [7]
        Left = 509
        Top = 0
        Hint = 'Mostrar los filtros de marcado'
        Caption = 'Mostrar Filtros'
        ImageIndex = 5
        OnClick = TButtMostrarFiltrosClick
      end
      object TButtSep3: TToolButton [8]
        Left = 532
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBBorrar: TToolButton [9]
        Left = 540
        Top = 0
        Hint = 'Borrar la linea seleccionada'
        Caption = 'TBBorrar'
        ImageIndex = 27
        ParentShowHint = False
        ShowHint = True
        OnClick = TBBorrarClick
      end
      object TButtFacturar: TToolButton [10]
        Left = 563
        Top = 0
        Hint = 'Facturar las cuotas seleccionadas'
        ImageIndex = 61
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtFacturarClick
      end
      object TButSep3: TToolButton [11]
        Left = 586
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 594
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 617
        Top = 0
        Width = 8
        ImageIndex = 0
        Style = tbsSeparator
      end
      object PNLValorUF: TLFPanel
        Left = 625
        Top = 0
        Width = 184
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object FValorUF: TLFLabel
          Left = 7
          Top = 4
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EValorUF: TLFEdit
          Left = 61
          Top = 0
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '0'
        end
      end
    end
    object TBFiltroClientes: TLFToolBar
      Left = 2
      Top = 28
      Width = 1201
      Height = 25
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Visible = False
      Separators = True
      object TButtAnyadirSelecClientes: TToolButton
        Left = 0
        Top = 0
        Hint = 'A'#241'adir la selecci'#243'n por Clientes'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtAnyadirSelecClientesClick
      end
      object TButtQuitarSelecClientes: TToolButton
        Left = 23
        Top = 0
        Hint = 'Quitar la selecci'#243'n por Clientes'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtQuitarSelecClientesClick
      end
      object PNLDesdeCliente: TLFPanel
        Left = 46
        Top = 0
        Width = 353
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LDesdeCliente: TLFLabel
          Left = 5
          Top = 5
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EFClienteDesde: TLFEditFind2000
          Left = 44
          Top = 0
          Width = 59
          Height = 21
          TabOrder = 0
          OnChange = EFClienteDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloClienteDesde: TLFEdit
          Left = 104
          Top = 0
          Width = 248
          Height = 21
          Color = clInfoBk
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
      object PNLHastaCliente: TLFPanel
        Left = 399
        Top = 0
        Width = 353
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LHastaCliente: TLFLabel
          Left = 6
          Top = 5
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EFClienteHasta: TLFEditFind2000
          Left = 44
          Top = 0
          Width = 59
          Height = 21
          TabOrder = 0
          OnChange = EFClienteHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloClienteHasta: TLFEdit
          Left = 104
          Top = 0
          Width = 248
          Height = 21
          Color = clInfoBk
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
    end
    object TBFiltros: TLFToolBar
      Left = 2
      Top = 53
      Width = 1201
      Height = 25
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Visible = False
      Separators = True
      object TButtAnyadirSelecFechas: TToolButton
        Left = 0
        Top = 0
        Hint = 'A'#241'adir la selecci'#243'n por Fechas'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtAnyadirSelecFechasClick
      end
      object TButtQuitarSelecFechas: TToolButton
        Left = 23
        Top = 0
        Hint = 'Quitar la selecci'#243'n por Fechas'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtQuitarSelecFechasClick
      end
      object PNLDesdeFecha: TLFPanel
        Left = 46
        Top = 0
        Width = 177
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LDesdeFecha: TLFLabel
          Left = 6
          Top = 4
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DTPDesdeFecha: TLFDateEdit
          Left = 86
          Top = 0
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object PNLHastaFecha: TLFPanel
        Left = 223
        Top = 0
        Width = 178
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LHastaFecha: TLFLabel
          Left = 12
          Top = 5
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DTPHastaFecha: TLFDateEdit
          Left = 89
          Top = 0
          Width = 87
          Height = 21
          AutoSelect = False
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
      end
    end
    object DBGFCuotas: TDBGridFind2000
      Left = 2
      Top = 78
      Width = 1201
      Height = 445
      Align = alClient
      DataSource = DMFacturacionCuotasCli.DSQMCuotas
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGFCuotasCellClick
      OnDrawColumnCell = DBGFCuotasDrawColumnCell
      OnDblClick = DBGFCuotasDblClick
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMFacturacionCuotasCli.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'FECHA'
        'CLIENTE'
        'ARTICULO'
        'PROYECTO')
      ColumnasCheckBoxes.Strings = (
        'PROCESADA')
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
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 49
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 152
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCRIPCION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 173
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_DOC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 42
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROCESADA'
          Width = 33
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROYECTO'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_PROYECTO'
          ReadOnly = True
          Width = 196
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CODIGO_INTERNO_PROYECTO'
          ReadOnly = True
          Width = 78
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDAD_FOMENTO'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 525
    Width = 1205
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
    Left = 456
    Top = 184
  end
end
