inherited FMFacturacionAlbDet: TFMFacturacionAlbDet
  Left = 248
  Top = 174
  Width = 1093
  Height = 474
  HelpContext = 179
  ActiveControl = EFProveedor
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturaci'#243'n de Albaranes por l'#237'neas'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1083
    Height = 421
    inherited TBMain: TLFToolBar
      Width = 1079
      TabOrder = 2
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      object PNLProv: TLFPanel
        Left = 25
        Top = 0
        Width = 529
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LSerie: TLFLabel
          Left = 9
          Top = 4
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = '&Serie'
          FocusControl = DBLCBSerie
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object LProveedor: TLFLabel
          Left = 148
          Top = 4
          Width = 59
          Height = 13
          Alignment = taRightJustify
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
        object DBLCBSerie: TDBLookupComboBox
          Left = 43
          Top = 0
          Width = 102
          Height = 21
          DropDownWidth = 250
          KeyField = 'SERIE'
          ListField = 'SERIE;TITULO'
          ListFieldIndex = 1
          ListSource = DMFacturacionAlbDet.DSxSeries
          TabOrder = 0
          OnClick = DBLCBSerieClick
        end
        object EFProveedor: TLFEditFind2000
          Left = 211
          Top = 0
          Width = 63
          Height = 21
          TabOrder = 1
          OnChange = EFProveedorExiste
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETitProveedor: TLFEdit
          Left = 275
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
          TabOrder = 2
        end
      end
      object TButtSep3: TToolButton
        Left = 554
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRegenera: TToolButton
        Left = 562
        Top = 0
        Hint = 'Genera o Regenera la tabla de Facturaci'#243'n de Albaranes'
        Caption = 'Regenera'
        ImageIndex = 26
        OnClick = TButtRegeneraClick
      end
      object TButtSep2: TToolButton
        Left = 585
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtLineasServidas: TToolButton
        Left = 593
        Top = 0
        Hint = 'Muestra todas las l'#237'neas de Albaranes'
        Caption = 'Lineas Servidas'
        ImageIndex = 23
        OnClick = TButtLineasServidasClick
      end
      object TButtLineasNoServidas: TToolButton
        Left = 616
        Top = 0
        Hint = 'Muestra las l'#237'neas no facturadas de albaranes'
        Caption = 'Lineas No Servidas'
        ImageIndex = 22
        OnClick = TButtLineasNoServidasClick
      end
      object TButtSep1: TToolButton
        Left = 639
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBAsignaUnidadesAFacturar: TToolButton
        Left = 647
        Top = 0
        Hint = 'Asigna unidades a facturar'
        Caption = 'Asigna unidades a facturar'
        ImageIndex = 146
        OnClick = TBAsignaUnidadesAFacturarClick
      end
      object TBQuitaUnidadesAFacturar: TToolButton
        Left = 670
        Top = 0
        Hint = 'Quita unidades a facturar'
        Caption = 'Quita unidades a facturar'
        ImageIndex = 147
        OnClick = TBQuitaUnidadesAFacturarClick
      end
      object TButtSep6: TToolButton
        Left = 693
        Top = 0
        Width = 8
        ImageIndex = 0
        Style = tbsSeparator
      end
      object TButtGenerarFactura: TToolButton
        Left = 701
        Top = 0
        Hint = 'Generar Factura'
        Caption = 'Generar Factura'
        ImageIndex = 19
        OnClick = TButtGenerarFacturaClick
      end
      object TButtSep5: TToolButton
        Left = 724
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNTotal: TLFPanel
        Left = 732
        Top = 0
        Width = 147
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object LTotalFactura: TLFLabel
          Left = 4
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
          Left = 72
          Top = 0
          Width = 74
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
    end
    object DBGFAlbaranes: TDBGridFind2000
      Left = 2
      Top = 52
      Width = 1079
      Height = 367
      Align = alClient
      DataSource = DMFacturacionAlbDet.DSQMDetalle
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
        'ARTICULO'
        'RIG'
        'NUM_ALBARAN'
        'TITULO'
        'EJERCICIO'
        'PROVEEDOR')
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
          Width = 44
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
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_ALBARAN'
          Width = 155
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
          Width = 216
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_ORIGINALES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 60
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
          FieldName = 'P_COSTE'
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
          FieldName = 'FAMILIA'
          ReadOnly = True
          Width = 41
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SUBFAMILIA'
          ReadOnly = True
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 2
      Top = 28
      Width = 1079
      Height = 24
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object PNLFechas: TLFPanel
        Left = 0
        Top = 0
        Width = 436
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
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
        object LBLSerieDestino: TLFLabel
          Left = 233
          Top = 4
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie &Destino'
          FocusControl = DBLCBSerieD
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DTPFechaCon: TLFDateEdit
          Left = 67
          Top = 0
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHora: TDateTimePicker
          Left = 155
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
        object DBLCBSerieD: TDBLookupComboBox
          Left = 314
          Top = 0
          Width = 122
          Height = 21
          DropDownWidth = 250
          KeyField = 'SERIE'
          ListField = 'SERIE;TITULO'
          ListFieldIndex = 1
          ListSource = DMFacturacionAlbDet.DSxSeriesDest
          TabOrder = 2
        end
      end
      object PNCanal: TLFPanel
        Left = 436
        Top = 0
        Width = 308
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object LCanalDestino: TLFLabel
          Left = 7
          Top = 4
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = '&Canal Destino'
          FocusControl = DBLCBSerieD
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFCanales: TLFEditFind2000
          Left = 91
          Top = 0
          Width = 38
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
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
        object ETitCanales: TLFEdit
          Left = 130
          Top = 0
          Width = 176
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
  end
  inherited TBActions: TLFToolBar
    Top = 421
    Width = 1083
  end
  inherited CEMain: TControlEdit
    Left = 808
    Top = 68
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 841
    Top = 67
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
    Left = 808
    Top = 36
  end
  inherited FSMain: TLFFibFormStorage
    Left = 841
    Top = 36
  end
end
