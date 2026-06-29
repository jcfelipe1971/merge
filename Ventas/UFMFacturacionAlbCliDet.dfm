inherited FMFacturacionAlbCliDet: TFMFacturacionAlbCliDet
  Left = 357
  Top = 261
  Width = 1321
  Height = 400
  HelpContext = 179
  ActiveControl = EFCliente
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturaci'#243'n de Albaranes por l'#237'neas'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1311
    Height = 347
    inherited TBMain: TLFToolBar
      Width = 1307
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      object PNLSerie: TLFPanel
        Left = 25
        Top = 0
        Width = 221
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object LSerie: TLFLabel
          Left = 0
          Top = 4
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = '&Serie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFSerie: TLFEditFind2000
          Left = 35
          Top = 0
          Width = 57
          Height = 21
          TabOrder = 0
          OnChange = EFSerieChange
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
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESerie: TLFEdit
          Left = 93
          Top = 0
          Width = 128
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
      object TButtSep3: TToolButton
        Left = 246
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object PNLCliente: TLFPanel
        Left = 253
        Top = 0
        Width = 292
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object LCliente: TLFLabel
          Left = 0
          Top = 4
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = '&Cliente'
          FocusControl = EFCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFCliente: TLFEditFind2000
          Left = 43
          Top = 0
          Width = 63
          Height = 21
          TabOrder = 0
          OnChange = EFClienteExiste
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
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ECliente: TLFEdit
          Left = 107
          Top = 0
          Width = 185
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
      object TButtSep4: TToolButton
        Left = 545
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object TButtRegenera: TToolButton
        Left = 552
        Top = 0
        Hint = 'Genera o Regenera la tabla de Facturaci'#243'n de Albaranes'
        Caption = 'Regenera'
        ImageIndex = 26
        OnClick = TButtRegeneraClick
      end
      object TButtSep2: TToolButton
        Left = 575
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object TButtLineasServidas: TToolButton
        Left = 582
        Top = 0
        Hint = 'Muestra todas las l'#237'neas de Albaranes'
        Caption = 'Lineas Servidas'
        ImageIndex = 23
        OnClick = TButtLineasServidasClick
      end
      object TButtLineasNoServidas: TToolButton
        Left = 605
        Top = 0
        Hint = 'Muestra las l'#237'neas no facturadas de albaranes'
        Caption = 'Lineas No Servidas'
        ImageIndex = 22
        OnClick = TButtLineasNoServidasClick
      end
      object TButtSepTodos: TToolButton
        Left = 628
        Top = 0
        Width = 8
        Caption = 'TButtSepTodos'
        ImageIndex = 20
        Style = tbsSeparator
      end
      object TBAsignaUnidadesAFacturar: TToolButton
        Left = 636
        Top = 0
        Hint = 'Asigna unidades a facturar'
        Caption = 'Asigna unidades a facturar'
        ImageIndex = 146
        OnClick = TBAsignaUnidadesAFacturarClick
      end
      object TBTBQuitaUnidadesAFacturar: TToolButton
        Left = 659
        Top = 0
        Hint = 'Quita unidades a facturar'
        Caption = 'Quita unidades a facturar'
        ImageIndex = 147
        OnClick = TBTBQuitaUnidadesAFacturarClick
      end
      object TButtSep1: TToolButton
        Left = 682
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object TButtGenerarFactura: TToolButton
        Left = 689
        Top = 0
        Hint = 'Generar Factura'
        Caption = 'Generar Factura'
        ImageIndex = 19
        OnClick = TButtGenerarFacturaClick
      end
    end
    object TBOpciones: TLFToolBar
      Left = 2
      Top = 28
      Width = 1307
      Height = 22
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object PNLSerieDestino: TLFPanel
        Left = 0
        Top = 0
        Width = 264
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object LBLSerieDestino: TLFLabel
          Left = 0
          Top = 4
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'S&erie Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFSerieDestino: TLFEditFind2000
          Left = 78
          Top = 0
          Width = 57
          Height = 21
          TabOrder = 0
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
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESerieDestino: TLFEdit
          Left = 136
          Top = 0
          Width = 128
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
      object ToolButton1: TToolButton
        Left = 264
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object PNLFechaDoc: TLFPanel
        Left = 271
        Top = 0
        Width = 243
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 3
        object LFechaDoc: TLFLabel
          Left = 0
          Top = 4
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DEFechaDoc: TLFDateEdit
          Left = 72
          Top = 0
          Width = 98
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPFechaDocHora: TDateTimePicker
          Left = 171
          Top = 0
          Width = 72
          Height = 22
          CalAlignment = dtaLeft
          Date = 37426.4556101389
          Time = 37426.4556101389
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkTime
          ParseInput = False
          TabOrder = 1
        end
      end
      object PNLFechaCont: TLFPanel
        Left = 514
        Top = 0
        Width = 246
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object LFechaCont: TLFLabel
          Left = 0
          Top = 4
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Cont.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DEFechaCont: TLFDateEdit
          Left = 75
          Top = 0
          Width = 98
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPFechaContHora: TDateTimePicker
          Left = 174
          Top = 0
          Width = 72
          Height = 22
          CalAlignment = dtaLeft
          Date = 37426.4556101389
          Time = 37426.4556101389
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkTime
          ParseInput = False
          TabOrder = 1
        end
      end
      object PNTotal: TLFPanel
        Left = 760
        Top = 0
        Width = 146
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object LTotalFactura: TLFLabel
          Left = 0
          Top = 4
          Width = 67
          Height = 13
          Hint = 
            'Esta suma no tiene en cuenta importes de cabecera (portes, descu' +
            'entos, IRPF, etc.)'
          Alignment = taRightJustify
          Caption = 'Total a fac.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object RETotalFactura: THYGRightEdit
          Left = 68
          Top = 0
          Width = 78
          Height = 21
          Hint = 
            'Esta suma no tiene en cuenta importes de cabecera (portes, descu' +
            'entos, IRPF, etc.)'
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Text = '0'
        end
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 50
      Width = 1307
      Height = 295
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Splitter: TSplitter
        Left = 784
        Top = 0
        Width = 8
        Height = 295
        Cursor = crHSplit
        Color = clBtnShadow
        ParentColor = False
      end
      object DBGFAlbaranes: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 784
        Height = 295
        Align = alLeft
        DataSource = DMFacturacionAlbCliDet.DSQMDetalle
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFAlbaranesDrawColumnCell
        OnDblClick = DBGFAlbaranesDblClick
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
          'ARTICULO'
          'RIG')
        ColumnasCheckBoxes.Strings = (
          'LINEA_SERVIDA'
          'ENTRADA_FACTURACION')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
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
            Width = 45
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
            Width = 45
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
            Width = 103
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
            Width = 212
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 58
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_FACTURADAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_A_FACTURAR'
            Title.Alignment = taRightJustify
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENTRADA_FACTURACION'
            Width = 30
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
            Visible = True
          end>
      end
      object PNLDetalles: TLFPanel
        Left = 792
        Top = 0
        Width = 515
        Height = 295
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGFSerializacion: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 515
          Height = 150
          Align = alClient
          DataSource = DMFacturacionAlbCliDet.DSxSerializacion
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGFSerializacionDrawColumnCell
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
            'ARTICULO'
            'NSERIE')
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
              Expanded = False
              FieldName = 'ENTRADA_FACTURACION'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NSERIE'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_CADUCIDAD'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_GARANTIA_CLIENTE'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_GARANTIA_PROVEEDOR'
              ReadOnly = True
              Visible = True
            end>
        end
        object PNLAvisos: TLFPanel
          Left = 0
          Top = 150
          Width = 515
          Height = 145
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LAvisos: TLFLabel
            Left = 0
            Top = 0
            Width = 515
            Height = 13
            Align = alTop
            Caption = 'Avisos'
          end
          object DBMAvisos: TLFDBMemo
            Left = 0
            Top = 13
            Width = 515
            Height = 132
            Align = alClient
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'AVISOS'
            DataSource = DMFacturacionAlbCliDet.DSxClientes
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 347
    Width = 1311
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
      'DBGFSerializacion.Width')
    Left = 400
  end
end
