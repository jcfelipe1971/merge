inherited FMFacturaAlbaranesProv: TFMFacturaAlbaranesProv
  Left = 246
  Top = 120
  Width = 1112
  Height = 612
  HelpContext = 178
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturaci'#243'n Autom'#225'tica de Proveedores'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1102
    Height = 559
    inherited TBMain: TLFToolBar
      Width = 1098
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      object TButtSep5: TToolButton
        Left = 25
        Top = 0
        Width = 8
        ImageIndex = 62
        Style = tbsSeparator
      end
      object PNLProv: TLFPanel
        Left = 33
        Top = 0
        Width = 788
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object PNLSeleccionDestino: TLFPanel
          Left = 0
          Top = 0
          Width = 746
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LCanalDestino: TLFLabel
            Left = 312
            Top = 4
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LSerieDestino: TLFLabel
            Left = 15
            Top = 3
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie Dst.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFCanales: TLFEditFind2000
            Left = 353
            Top = 0
            Width = 36
            Height = 21
            TabOrder = 0
            OnChange = EFCanalesChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECanalDestino: TLFEdit
            Left = 390
            Top = 0
            Width = 163
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
          object EFSerieDestino: TLFEditFind2000
            Left = 76
            Top = 0
            Width = 65
            Height = 21
            TabOrder = 2
            OnChange = EFSerieDestinoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_CANALES_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFSerieDestinoBusqueda
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object ESerieDestino: TLFEdit
            Left = 142
            Top = 0
            Width = 163
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object PNLFecha: TLFPanel
          Left = 558
          Top = 0
          Width = 230
          Height = 21
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object LBLFechaCon: TLFLabel
            Left = 0
            Top = 4
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = '&Fecha Con.'
            FocusControl = DTPFechaCon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DTPFechaCon: TLFDateEdit
            Left = 70
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPHora: TDateTimePicker
            Left = 158
            Top = 0
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 37426.4576513889
            Time = 37426.4576513889
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 1
          end
        end
      end
      object TButtSep2: TToolButton
        Left = 821
        Top = 0
        Width = 8
        ImageIndex = 62
        Style = tbsSeparator
      end
      object TButtRegenera: TToolButton
        Left = 829
        Top = 0
        Hint = 'Genera o regenera la tabla de recepci'#243'n de Pedidos'
        Caption = 'Regenera'
        ImageIndex = 26
        OnClick = TButtRegeneraClick
      end
      object TButtSep1: TToolButton
        Left = 852
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMarcarTodas: TToolButton
        Left = 860
        Top = 0
        Hint = 'Marcar todas las l'#237'neas'
        Caption = 'Marcar Todas'
        ImageIndex = 146
        OnClick = TButtMarcarTodasClick
      end
      object TButtDesmarca: TToolButton
        Left = 883
        Top = 0
        Hint = 'Desmarca los Albaranes'
        Caption = 'Desmarca los albaranes'
        ImageIndex = 147
        OnClick = TButtDesmarcaClick
      end
      object TButtSep4: TToolButton
        Left = 906
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNTotal: TLFPanel
        Left = 914
        Top = 0
        Width = 149
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object LTotalFactura: TLFLabel
          Left = 0
          Top = 4
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a fac.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RETotalFactura: THYGRightEdit
          Left = 71
          Top = 0
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
      end
      object ToolButton1: TToolButton
        Left = 1063
        Top = 0
        Width = 8
        Style = tbsSeparator
        Visible = False
      end
      object TButtFacturar: TToolButton
        Left = 1071
        Top = 0
        Hint = 'Facturar los Albaranes seleccionados'
        Caption = 'Facturar'
        ImageIndex = 61
        OnClick = TButtFacturarClick
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 28
      Width = 1098
      Height = 529
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object DBGFAlbaranes: TDBGridFind2000
        Left = 0
        Top = 30
        Width = 1098
        Height = 499
        Align = alClient
        DataSource = DMFacturaAlbaranesProv.DSQMAlbaranes
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFAlbaranesDrawColumnCell
        OnDblClick = DBGFAlbaranesDblClick
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
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'NUM_ALBARAN'
          'RIG'
          'FECHA'
          'LIQUIDO'
          'MONEDA'
          'SERIE')
        ColumnasCheckBoxes.Strings = (
          'ENTRADA_FACTURACION')
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
            FieldName = 'EJERCICIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 57
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SERIE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 73
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RIG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 71
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NUM_ALBARAN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 250
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALMACEN'
            ReadOnly = True
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
            Width = 62
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LIQUIDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'MONEDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENTRADA_FACTURACION'
            Width = 56
            Visible = True
          end>
      end
      object TBSep: TLFToolBar
        Left = 0
        Top = 22
        Width = 1098
        Height = 8
        EdgeBorders = []
        TabOrder = 1
        Separators = True
      end
      object TBFiltro: TLFToolBar
        Left = 0
        Top = 0
        Width = 1098
        Height = 22
        AutoSize = True
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 2
        Separators = True
        object PNLFiltros: TLFPanel
          Left = 0
          Top = 0
          Width = 546
          Height = 22
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object LBLSerie: TLFLabel
            Left = 2
            Top = 4
            Width = 30
            Height = 13
            Alignment = taCenter
            Caption = '&Serie'
            FocusControl = CBSeries
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LBLProveedor: TLFLabel
            Left = 166
            Top = 4
            Width = 59
            Height = 13
            Alignment = taCenter
            Caption = '&Proveedor'
            FocusControl = EFProveedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object CBSeries: TLFComboBox
            Left = 35
            Top = 1
            Width = 121
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBSeriesChange
          end
          object EFProveedor: TLFEditFind2000
            Left = 227
            Top = 1
            Width = 63
            Height = 21
            TabOrder = 1
            OnChange = EFProveedorChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'NOMBRE_R_SOCIAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloProveedor: TLFEdit
            Left = 294
            Top = 1
            Width = 248
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 2
          end
        end
        object PnlFechaFactura: TLFPanel
          Left = 546
          Top = 0
          Width = 243
          Height = 22
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LFechaFactura: TLFLabel
            Left = 12
            Top = 4
            Width = 61
            Height = 13
            Caption = 'Fecha Fac'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DTPHoraFactura: TDateTimePicker
            Left = 165
            Top = 0
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 37426.2324089468
            Time = 37426.2324089468
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 0
          end
          object DTPFechaFactura: TLFDateEdit
            Left = 77
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 559
    Width = 1102
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
    Left = 284
    Top = 154
  end
end
