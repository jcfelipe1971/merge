inherited FMEnviaxmLfacturasChl: TFMEnviaxmLfacturasChl
  Left = 231
  Top = 207
  Width = 1318
  Height = 601
  HelpContext = 207
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Envios DTE'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1308
    Height = 548
    inherited TBMain: TLFToolBar
      Width = 1304
      inherited NavMain: THYMNavigator
        Width = 120
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
      end
      inherited TSepNav: TToolButton
        Left = 120
      end
      inherited EPMain: THYMEditPanel
        Left = 128
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 174
      end
      inherited TbuttComp: TToolButton
        Left = 182
      end
      object TBSep1: TToolButton
        Left = 205
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMarcar: TToolButton
        Left = 213
        Top = 0
        Hint = 'Marcar todas las facturas'
        Caption = 'Marcar'
        ImageIndex = 146
        OnClick = TButtMarcarClick
      end
      object TButtCancelar: TToolButton
        Left = 236
        Top = 0
        Hint = 'Desmarcar todas las facturas'
        Caption = 'Desmarcar'
        ImageIndex = 147
        OnClick = TButtCancelarClick
      end
      object TBSep2: TToolButton
        Left = 259
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtEnviaDTE: TToolButton
        Left = 267
        Top = 0
        Hint = 'Envia DTE'
        Caption = 'Enviar DTE'
        ImageIndex = 46
        OnClick = TButtEnviaDTEClick
      end
      object TBSep5: TToolButton
        Left = 290
        Top = 0
        Width = 8
        ImageIndex = 47
        Style = tbsSeparator
      end
      object PNLFiltroFolio: TLFPanel
        Left = 298
        Top = 0
        Width = 151
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object LFolio: TLFLabel
          Left = 0
          Top = 3
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Folio'
        end
        object EFolio: TLFEdit
          Left = 28
          Top = 0
          Width = 123
          Height = 21
          TabOrder = 0
          OnKeyPress = EFolioKeyPress
        end
      end
      object TBSep3: TToolButton
        Left = 449
        Top = 0
        Width = 8
        ImageIndex = 48
        Style = tbsSeparator
      end
      object PNLFiltroPeriodo: TLFPanel
        Left = 457
        Top = 0
        Width = 274
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 3
        object LPeriodo: TLFLabel
          Left = 0
          Top = 3
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object EFPeriodo: TLFEditFind2000
          Left = 41
          Top = 0
          Width = 39
          Height = 22
          AutoSize = False
          TabOrder = 0
          OnChange = EFPeriodoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO = 1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PERIODO')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloPeriodo: TLFEdit
          Left = 81
          Top = 0
          Width = 193
          Height = 22
          TabStop = False
          AutoSize = False
          Color = clInfoBk
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
      object ToolButton1: TToolButton
        Left = 731
        Top = 0
        Width = 8
        ImageIndex = 49
        Style = tbsSeparator
      end
      object TButtVerEmail: TToolButton
        Left = 739
        Top = 0
        Action = AAbreAdjunto
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1304
      Height = 518
      ActivePage = TSDocumentos
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSDocumentos: TTabSheet
        Caption = 'Documentos'
        OnShow = TSDocumentosShow
        object Splitter: TSplitter
          Left = 1288
          Top = 22
          Width = 8
          Height = 468
          Cursor = crHSplit
          Align = alRight
          Color = clGrayText
          ParentColor = False
          Visible = False
        end
        object DBGDocumentos: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1288
          Height = 468
          Align = alClient
          Color = clInfoBk
          DataSource = DMEnviaxmLfacturasChl.DSQMDocumentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGDocumentosCellClick
          OnDrawColumnCell = DBGDocumentosDrawColumnCell
          OnDblClick = DBGDocumentosDblClick
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
          Transaction = DMEnviaxmLfacturasChl.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'AGENTE'
            'B_DTO_LINEAS'
            'CLIENTE'
            'CODIGO_GIRO_CLIENTE'
            'CODIGO_GIRO_EMPRESA'
            'ENTRADA_FACTURACION'
            'ESTADO'
            'FECHA'
            'FECHA_CON'
            'FOLIO'
            'FORMA_PAGO'
            'LIQUIDO'
            'NIF'
            'NOMBRE_COMERCIAL'
            'RAZONREF'
            'RIG'
            'SERIE'
            'SU_REFERENCIA'
            'TERCERO'
            'TIPO_DOC_TRIBUTARIO'
            'TITULO'
            'TOTAL_A_COBRAR'
            'TIPO'
            'FECHA_DOCTO'
            'FECHA_RECLAMO'
            'MONTO_TOTAL'
            'ACEPTADO_CLIENTE'
            'CANTIDAD_ERRORES'
            'ESTADO_SII'
            'SII_TRACKID'
            'GLOSA'
            'GLOSA_ERR')
          ColumnasCheckBoxes.Strings = (
            'ENTRADA_FACTURACION'
            'INVERSION_SUJETO_PASIVO'
            'SIN_DETALLE'
            'SIN_RECIBOS'
            'CAMBIO_FIJO'
            'ACEPTADO_CLIENTE'
            'ENVIADO_SII'
            'ENVIADO_MAIL_CLIENTE'
            'XML_DTE_RECIBIDO'
            'XML_RESPUESTA_ENVIO')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
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
              Color = clWindow
              Expanded = False
              FieldName = 'ENTRADA_FACTURACION'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC_TRIBUTARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FOLIO'
              ReadOnly = True
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 238
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMA_PAGO'
              ReadOnly = True
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_A_COBRAR'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SII_TRACKID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MENSAJE_ERROR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD_ERRORES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'XML_DTE_RECIBIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'XML_RESPUESTA_ENVIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GLOSA'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENVIADO_MAIL_CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACEPTADO_CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENVIADO_SII'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_SII'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EstadoDteCliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_DOCUMENTO'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GLOSA_ESTADO_DOCUMENTO'
              Width = 299
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GLOSA_ERR'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERR_CODE'
              Visible = True
            end>
        end
        object TBFiltros: TLFToolBar
          Left = 0
          Top = 0
          Width = 1296
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Wrapable = False
          Separators = True
          object TButtFiltrar: TToolButton
            Left = 0
            Top = 0
            Hint = 'FIltrar'
            Caption = 'Filtrar'
            ImageIndex = 5
            OnClick = TButtFiltrarClick
          end
          object TBButtLimpiarFiltos: TToolButton
            Left = 23
            Top = 0
            Hint = 'Limpiar Filtros'
            Caption = 'Limpiar Filtos'
            ImageIndex = 6
            OnClick = TBButtLimpiarFiltosClick
          end
          object TBSep4: TToolButton
            Left = 46
            Top = 0
            Width = 8
            ImageIndex = 27
            Style = tbsSeparator
          end
          object PNLSeries: TLFPanel
            Left = 54
            Top = 0
            Width = 163
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object LSerie: TLFLabel
              Left = 14
              Top = 3
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
              Layout = tlCenter
            end
            object CBSeries: TLFComboBox
              Left = 42
              Top = 0
              Width = 117
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = TButtFiltrarClick
            end
          end
          object PnlPedidos: TLFPanel
            Left = 217
            Top = 0
            Width = 250
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LDesdeCliente: TLFLabel
              Left = 10
              Top = 3
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaCliente: TLFLabel
              Left = 132
              Top = 3
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object EDesdeDocumento: TLFEdit
              Left = 46
              Top = 0
              Width = 80
              Height = 21
              TabOrder = 0
              Text = '0'
              OnChange = TButtFiltrarClick
            end
            object EHastaDocumento: TLFEdit
              Left = 165
              Top = 0
              Width = 80
              Height = 21
              TabOrder = 1
              Text = '0'
              OnChange = TButtFiltrarClick
            end
          end
          object PNLFIltros: TPanel
            Left = 467
            Top = 0
            Width = 551
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object LTipo: TLFLabel
              Left = 9
              Top = 3
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo  '
              Layout = tlCenter
            end
            object LTipoDocumentoTributario: TLFLabel
              Left = 138
              Top = 3
              Width = 71
              Height = 13
              Caption = 'Tipo Doc. Trib.'
            end
            object LFLabel1: TLFLabel
              Left = 433
              Top = 3
              Width = 32
              Height = 13
              Caption = 'Cliente'
            end
            object DBEFTipoDocumentoTributario: TLFEditFind2000
              Left = 215
              Top = 0
              Width = 64
              Height = 21
              TabOrder = 1
              OnChange = DBEFTipoDocumentoTributarioChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CODIGO'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
              Tabla_asociada.DesplegarBusqueda = False
              OnBusqueda = DBEFTipoDocumentoTributarioBusqueda
              OrdenadoPor.Strings = (
                'CODIGO')
              Filtros = []
            end
            object DBECliente: TLFEditFind2000
              Left = 468
              Top = 0
              Width = 80
              Height = 21
              TabOrder = 2
              OnChange = TButtFiltrarClick
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_CLIENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'CLIENTE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object CBTipo: TLFComboBox
              Left = 37
              Top = 0
              Width = 94
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'Todas'
              OnChange = TButtFiltrarClick
              Items.Strings = (
                'Todas'
                'Albaranes'
                'Facturas')
            end
            object ETipoDocumentoTributario: TLFEdit
              Left = 280
              Top = 0
              Width = 147
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
              TabOrder = 3
            end
          end
          object PNLFiltroPendientes: TLFPanel
            Left = 1018
            Top = 0
            Width = 175
            Height = 22
            BevelOuter = bvNone
            TabOrder = 3
            object CBDocumentosPendientes: TLFCheckBox
              Left = 6
              Top = 3
              Width = 165
              Height = 17
              Caption = 'Solo Documentos Pendientes'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = TButtFiltrarClick
            end
          end
        end
      end
      object TSRCVVenta: TTabSheet
        Caption = 'RCV Venta'
        ImageIndex = 1
        OnShow = TSRCVVentaShow
        object DBGRCVVenta: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1296
          Height = 490
          Align = alClient
          Color = clInfoBk
          DataSource = DMEnviaxmLfacturasChl.DSQMRCV_VENTA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGDocumentosCellClick
          OnDrawColumnCell = DBGDocumentosDrawColumnCell
          OnDblClick = DBGDocumentosDblClick
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
          Transaction = DMEnviaxmLfacturasChl.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CODIGO_OTRO_IMP'
            'CODIGO_SUCURSAL'
            'CREDITO_EMPRESA_CONSTRUCTORA'
            'EMPRESA'
            'EXENTO_COMISION_LIQUID_FACTURA'
            'FECHA_ACUSE_RECIBO'
            'FECHA_DOCTO'
            'FECHA_RECEPCION'
            'FECHA_RECLAMO'
            'FOLIO'
            'FOLIO_DOCTO_REFERENCIA'
            'GARANTIA_DEP_ENVASES'
            'IMPTO_ZONA_FRANCA_LEY_18211'
            'INDICADOR_SERVICIO_PERIODICO'
            'INDICADOR_VENTA_SIN_COSTO'
            'IVA_COMISION_LIQUID_FACTURA'
            'IVA_FUERA_DE_PLAZO'
            'IVA_NO_RETENIDO'
            'IVA_PROPIO'
            'IVA_RETENIDO_PARCIAL'
            'IVA_RETENIDO_TOTAL'
            'IVA_TERCEROS'
            'MONTO_EXENTO'
            'MONTO_IVA'
            'MONTO_NETO'
            'MONTO_NO_FACTURABLE'
            'MONTO_TOTAL'
            'NACIONALIDAD_RECEPTOR_EXT'
            'NCE_O_NDE_SOBRE_FACT_DE_COM'
            'NETO_COMISION_LIQUID_FACTURA'
            'NUM_IDENT_RECEPTOR_EXTRANJERO'
            'NUMERO_INTERNO'
            'RAZON_SOCIAL'
            'RUT_CLIENTE'
            'RUT_EMISOR_LIQUID_FACTURA'
            'TASA_OTRO_IMP'
            'TIPO_DOC'
            'TIPO_DOCTO_REFERENCIA'
            'TIPO_VENTA'
            'TOTAL_MONTO_PERIODO'
            'VALOR_OTRO_IMP'
            'VENTA_PASAJES_TRANSPORTE_INT'
            'VENTA_PASAJES_TRANSPORTE_NAC')
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
              FieldName = 'TIPO_DOC'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_VENTA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUT_CLIENTE'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZON_SOCIAL'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FOLIO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_DOCTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ACUSE_RECIBO'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECLAMO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_EXENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_NETO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_IVA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_TOTAL'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_RETENIDO_TOTAL'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_RETENIDO_PARCIAL'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_NO_RETENIDO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_PROPIO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_TERCEROS'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUT_EMISOR_LIQUID_FACTURA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NETO_COMISION_LIQUID_FACTURA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXENTO_COMISION_LIQUID_FACTURA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_COMISION_LIQUID_FACTURA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_FUERA_DE_PLAZO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOCTO_REFERENCIA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FOLIO_DOCTO_REFERENCIA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_IDENT_RECEPTOR_EXTRANJERO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NACIONALIDAD_RECEPTOR_EXT'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CREDITO_EMPRESA_CONSTRUCTORA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPTO_ZONA_FRANCA_LEY_18211'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GARANTIA_DEP_ENVASES'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INDICADOR_VENTA_SIN_COSTO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INDICADOR_SERVICIO_PERIODICO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_NO_FACTURABLE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_MONTO_PERIODO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENTA_PASAJES_TRANSPORTE_NAC'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENTA_PASAJES_TRANSPORTE_INT'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_INTERNO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_SUCURSAL'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NCE_O_NDE_SOBRE_FACT_DE_COM'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_OTRO_IMP'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_OTRO_IMP'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TASA_OTRO_IMP'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 548
    Width = 1308
  end
  inherited CEMain: TControlEdit
    Left = 952
    Top = 1
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 984
    Top = 1
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 888
    Top = 1
    object ListadoFAC: TAction
      Category = 'Listados'
      Caption = 'Listado de Factras'
      ImageIndex = 14
    end
    object AdjuntoFAC: TAction
      Category = 'Adjuntos'
      Caption = 'Adjunto de Facturas'
      ImageIndex = 59
    end
    object Exportar_Excel: TAction
      Category = 'Procesos'
      Caption = 'Exportar Exel'
      ImageIndex = 21
      OnExecute = Exportar_ExcelExecute
    end
    object Importar_Excel: TAction
      Category = 'Procesos'
      Caption = 'Importar Excel'
      ImageIndex = 49
      OnExecute = Importar_ExcelExecute
    end
    object ResumenTotal: TAction
      Category = 'Procesos'
      Caption = 'Resumen Totales'
      OnExecute = ResumenTotalExecute
    end
    object AAsignaEstadoEnvio: TAction
      Category = 'Procesos'
      Caption = 'Asigna el estado de envio al SII '
      Hint = 'Asigna el estado de envio al SII de los documentos filtrados'
      ImageIndex = 87
      OnExecute = AAsignaEstadoEnvioExecute
    end
    object AObtencionDeCorreos: TAction
      Category = 'Procesos'
      Caption = 'Obtenci'#243'n de correos'
      Hint = 'Obtencion de correos y asignacion de estado de envio de cliente'
      OnExecute = AObtencionDeCorreosExecute
    end
    object AAbreAdjunto: TAction
      Category = 'Procesos'
      Caption = 'Abre adjunto'
      Hint = 'Abre adjunto del documento'
      ImageIndex = 87
      OnExecute = AAbreAdjuntoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AConsultaDocumentoSii: TAction
      Category = 'Procesos'
      Caption = 'Consulta Documento Sii'
      Hint = 'Consulta el estado de un documento en el Sii'
      ImageIndex = 87
      OnExecute = AConsultaDocumentoSiiExecute
    end
    object AConsultaDocumentoMasivoSii: TAction
      Category = 'Procesos'
      Caption = 'Consulta el estado documentosm masivo'
      Hint = 'Consulta el estado documentosm masivo'
      ImageIndex = 88
      OnExecute = AConsultaDocumentoMasivoSiiExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 920
    Top = 1
  end
  object ImageList1: TImageList
    Left = 1072
    Top = 16
  end
end
