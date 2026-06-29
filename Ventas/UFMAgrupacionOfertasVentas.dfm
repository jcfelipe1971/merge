inherited FMAgrupacionOfertasVentas: TFMAgrupacionOfertasVentas
  Left = 164
  Top = 200
  Width = 1463
  Height = 526
  HelpContext = 204
  ActiveControl = EFCliente
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Agrupaci'#243'n de Ofertas de Clientes'
  OldCreateOrder = True
  Position = poDefault
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1453
    Height = 473
    inherited TBMain: TLFToolBar
      Width = 1449
      TabOrder = 4
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 3
      end
      object PNLSerie: TLFPanel
        Left = 25
        Top = 0
        Width = 175
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 12
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
        object CBSeries: TLFComboBox
          Left = 45
          Top = 0
          Width = 128
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSeriesChange
        end
      end
      object ToolButton6: TToolButton
        Left = 200
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLCliente: TLFPanel
        Left = 208
        Top = 0
        Width = 325
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LCliente: TLFLabel
          Left = 5
          Top = 4
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = '&Clientes'
          FocusControl = EFCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object SBAClientes: TSpeedButton
          Left = 100
          Top = 0
          Width = 223
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAClientesDblClick
        end
        object EFCliente: TLFEditFind2000
          Left = 53
          Top = 0
          Width = 46
          Height = 21
          TabOrder = 0
          OnChange = EFClienteExiste
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'EJERCICIO')
          CampoNum = 'CLIENTE'
          CampoStr = 'NOMBRE'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_CLIENTES_VENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFClienteBusqueda
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = []
          Entorno = DMAgrupacionOfertasVentas.EBusca
        end
        object DBETitClientes: TLFDbedit
          Left = 100
          Top = 0
          Width = 223
          Height = 21
          Color = clAqua
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMAgrupacionOfertasVentas.DSxClientes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnDblClick = SBAClientesDblClick
        end
      end
      object ToolButton4: TToolButton
        Left = 533
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRegenera: TToolButton
        Left = 541
        Top = 0
        Hint = 'Genera o Regenera la tabla de agrupaci'#243'n de Ofertas'
        Caption = 'Regenera'
        ImageIndex = 26
        OnClick = TButtRegeneraClick
      end
      object TButtLineasServidas: TToolButton
        Left = 564
        Top = 0
        Hint = 'Muestra todas las l'#237'neas de Ofertas'
        Caption = 'Lineas Servidas'
        ImageIndex = 23
        OnClick = TButtLineasServidasClick
      end
      object TButtLineasNoServidas: TToolButton
        Left = 587
        Top = 0
        Hint = 'Muestra las l'#237'neas no servidas de Ofertas'
        Caption = 'Lineas No Servidas'
        ImageIndex = 22
        OnClick = TButtLineasNoServidasClick
      end
      object ToolButton1: TToolButton
        Left = 610
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtServirMarcados: TToolButton
        Left = 618
        Top = 0
        Hint = 'Servir las Ofertas marcadas'
        Caption = 'Servir Marcados'
        ImageIndex = 42
        OnClick = TButtServirMarcadosClick
      end
      object TButtMarcarTodas: TToolButton
        Left = 641
        Top = 0
        Hint = 'Marcar como servidas todas las l'#237'neas'
        ImageIndex = 118
        OnClick = TButtMarcarTodasClick
      end
      object TButtServirTodaLinea: TToolButton
        Left = 664
        Top = 0
        Hint = 'Recepcionar todas las unidades pedidas de la l'#237'nea actual'
        Caption = 'Servir Toda Linea'
        ImageIndex = 43
        OnClick = TButtServirTodaLineaClick
      end
      object ToolButton2: TToolButton
        Left = 687
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMarcarTodasProc: TToolButton
        Left = 695
        Top = 0
        Hint = 'Marcar como procesadas todas las l'#237'neas'
        Caption = 'Marcar Todas Proc'
        ImageIndex = 94
        OnClick = TButtMarcarTodasProcClick
      end
      object TButtDesmarcarTodasProc: TToolButton
        Left = 718
        Top = 0
        Hint = 'Desmarcar todas las l'#237'neas marcadas como procesadas'
        Caption = 'Desmarcar Todas Proc'
        ImageIndex = 147
        OnClick = TButtDesmarcarTodasProcClick
      end
      object ToolButton5: TToolButton
        Left = 741
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCerrarYMarcarOferta: TToolButton
        Left = 749
        Top = 0
        Hint = 'Generar Albar'#225'n'
        Caption = 'Cerrar Y Marcar Pedido'
        ImageIndex = 60
        OnClick = TButtCerrarYMarcarOfertaClick
      end
      object TButtGenerarFactura: TToolButton
        Left = 772
        Top = 0
        Hint = 'Generar Factura'
        Caption = 'Generar Factura'
        ImageIndex = 61
        OnClick = TButtGenerarFacturaClick
      end
      object PNLDivisionDocumento: TLFPanel
        Left = 795
        Top = 0
        Width = 229
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object CBDividirPorDirecciones: TLFCheckBox
          Left = 9
          Top = 3
          Width = 216
          Height = 17
          Caption = 'Generar un documento por direcci'#243'n'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    object PCOfertas: TLFPageControl
      Left = 2
      Top = 82
      Width = 1449
      Height = 288
      ActivePage = TSAgrupacion
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSAgrupacion: TTabSheet
        Caption = 'Agrupacion de Ofertas'
        object DBGFind2000Ofertas: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1441
          Height = 260
          Align = alClient
          DataSource = DMAgrupacionOfertasVentas.DSQMDetalle
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFind2000OfertasCellClick
          OnDrawColumnCell = DBGFind2000OfertasDrawColumnCell
          OnDblClick = DBGFind2000OfertasDblClick
          OnKeyUp = DBGFind2000OfertasKeyUp
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
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
          Transaction = DMAgrupacionOfertasVentas.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ID_LOTE')
          CamposAMostrar.Strings = (
            'ID_LOTE'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            'ID_LOTE')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'RIG'
            'MONEDA'
            'TIPO_LINEA'
            'DIRECCION_ENTREGA'
            'FECHA_ENTREGA_PREV'
            'SU_REFERENCIA'
            'DOCUMENTO_MUESTRAS'
            'ALFA_1'
            'ALFA_2'
            'ALFA_3'
            'ALFA_4'
            'ALFA_5'
            'ALFA_6'
            'ALFA_7'
            'ALFA_8'
            'ALMACEN'
            'ASEGURADO'
            'AUTORIZACION'
            'BARRAS'
            'CLIENTE'
            'PAIS'
            'PACIENTE'
            'POLIZA'
            'REF_PROVEEDOR'
            'TITULO'
            'FEC_REC_IH'
            'PEDIDO_CLIENTE')
          ColumnasCheckBoxes.Strings = (
            'SERVIDO'
            'ENTRADA_AGRUPACION'
            'DOCUMENTO_MUESTRAS'
            'LISTO_PARA_PREPARAR')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            '(por asignar)')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_ARTICULOS_LOTES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'LOTE')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ID_LOTE')
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
              Width = 40
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
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PEDIDO_CLIENTE'
              ReadOnly = True
              Width = 90
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
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_ENTREGA_PREV'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DOCUMENTO_MUESTRAS'
              ReadOnly = True
              Width = 48
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
              Width = 101
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'BARRAS'
              ReadOnly = True
              Width = 101
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REF_PROVEEDOR'
              ReadOnly = True
              Width = 101
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
              Width = 228
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PAIS'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DIRECCION_ENTREGA'
              ReadOnly = True
              Width = 40
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
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_PREPARADAS'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_PENDIENTES'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_SERVIDAS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_RESERVADAS'
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'U_LOGISTICAS_RESERVADAS'
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COSTE'
              Title.Alignment = taRightJustify
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SERVIDO'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA_AGRUPACION'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REC_DET'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'STOCK'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'STOCK_MINIMO'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_LOGISTICAS'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_UNIDAD_LOGISTICA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_UNIDAD_LOGISTICA'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LOTE'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE_SIMPLE'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ASEGURADO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PACIENTE'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'POLIZA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'AUTORIZACION'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_REC_DET'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_1'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LISTO_PARA_PREPARAR'
              Visible = True
            end>
        end
      end
      object TSHojaPreparacion: TTabSheet
        Caption = 'Hoja de preparaci'#243'n'
        ImageIndex = 1
        object PNLHojaPreparacion: TLFPanel
          Left = 0
          Top = 0
          Width = 1265
          Height = 214
          Align = alClient
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 1
            Top = 113
            Width = 1263
            Height = 8
            Cursor = crVSplit
            Align = alTop
          end
          object DBGFCabeceraHojaPreparacion: TDBGridFind2000
            Left = 1
            Top = 1
            Width = 1263
            Height = 112
            Align = alTop
            DataSource = DMAgrupacionOfertasVentas.DSQMCabeceraPre
            TabOrder = 0
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
            ColumnasCheckBoxes.Strings = (
              'GENERAR_ALBARAN')
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
                FieldName = 'GENERAR_ALBARAN'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HOJA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_INICIO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_FIN'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COMENTARIO'
                ReadOnly = True
                Width = 270
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_UNIDADES'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_UNIDADES_LOGISTICAS'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DIRECCION'
                ReadOnly = True
                Visible = True
              end>
          end
          object DBGFDetalleHojaPreparacion: TDBGridFind2000
            Left = 1
            Top = 121
            Width = 1263
            Height = 92
            Align = alClient
            DataSource = DMAgrupacionOfertasVentas.DSQMDetallePre
            TabOrder = 1
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
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
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
                FieldName = 'LINEA'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN'
                ReadOnly = True
                Width = 35
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
                FieldName = 'UNIDADES_PED'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO_UNIDAD_LOGISTICA'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES_LOGISTICAS'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PICO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PUNTOS'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PESO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREPARACION'
                ReadOnly = True
                Visible = True
              end>
          end
        end
      end
    end
    object PNTotales: TLFPanel
      Left = 2
      Top = 370
      Width = 1449
      Height = 101
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object GBPortes: TGroupBox
        Left = 0
        Top = 0
        Width = 785
        Height = 101
        Align = alLeft
        Caption = 'Informaci'#243'n de Portes'
        TabOrder = 0
        object LBTransportista: TLFLabel
          Left = 28
          Top = 21
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Transportista'
        end
        object LBPortes: TLFLabel
          Left = 59
          Top = 59
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Portes'
        end
        object LBIPortes: TLFLabel
          Left = 165
          Top = 81
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'I. Portes'
        end
        object LBPorPortes: TLFLabel
          Left = 48
          Top = 81
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = '% Portes'
        end
        object LBRango: TLFLabel
          Left = 423
          Top = 59
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rango'
        end
        object LBIndice: TLFLabel
          Left = 426
          Top = 81
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Indice'
        end
        object EFTransportista: TLFEditFind2000
          Left = 93
          Top = 17
          Width = 60
          Height = 21
          TabOrder = 0
          OnChange = EFTransportistaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TRANSPORTISTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_TRANSPORTISTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TRANSPORTISTA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFPortes: TLFEditFind2000
          Left = 93
          Top = 55
          Width = 60
          Height = 21
          TabOrder = 2
          OnChange = EFPortesChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CUENTAS_GES_PORTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TIPO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETituloPortes: TLFDbedit
          Left = 154
          Top = 55
          Width = 258
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAgrupacionOfertasVentas.DSxPortes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object EFRango: TLFEditFind2000
          Left = 459
          Top = 55
          Width = 60
          Height = 21
          TabOrder = 5
          OnChange = EFRangoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'RANGO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_RANGOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFRangoBusqueda
          OrdenadoPor.Strings = (
            'RANGO')
          Filtros = [obEmpresa]
        end
        object DBETituloRango: TLFDbedit
          Left = 520
          Top = 55
          Width = 258
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAgrupacionOfertasVentas.DSxRangos
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBETituloIndice: TLFDbedit
          Left = 520
          Top = 77
          Width = 258
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAgrupacionOfertasVentas.DSxIndices
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object EFIndice: TLFEditFind2000
          Left = 459
          Top = 77
          Width = 60
          Height = 21
          TabOrder = 6
          OnChange = EFIndiceChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'INDICE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_RANGOS_INDICES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFIndiceBusqueda
          OrdenadoPor.Strings = (
            'INDICE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EPorPortes: TLFEdit
          Left = 93
          Top = 77
          Width = 60
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object EIPortes: TLFEdit
          Left = 208
          Top = 77
          Width = 60
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object CBForzarPortes: TLFCheckBox
          Left = 17
          Top = 38
          Width = 89
          Height = 17
          Caption = 'Forzar Portes'
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object ETituloTransportista: TLFEdit
          Left = 154
          Top = 17
          Width = 258
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
      object PNLTotalUnidades: TLFPanel
        Left = 1327
        Top = 0
        Width = 122
        Height = 101
        Align = alRight
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object LTotalUnidades: TLFLabel
          Left = 6
          Top = 52
          Width = 94
          Height = 13
          Caption = 'Unidades marcadas'
        end
        object LTotalUnidadesPedidas: TLFLabel
          Left = 6
          Top = 10
          Width = 85
          Height = 13
          Caption = 'Unidades pedidas'
        end
        object DBETotalUnidades: TLFDbedit
          Left = 6
          Top = 68
          Width = 108
          Height = 21
          Color = clInfoBk
          DataField = 'UNIDADES_RESERVADAS'
          DataSource = DMAgrupacionOfertasVentas.DSxUnidadesMarcadas
          TabOrder = 0
        end
        object DBETotalUnidadesPedidas: TLFDbedit
          Left = 6
          Top = 26
          Width = 108
          Height = 21
          Color = clInfoBk
          DataField = 'UNIDADES'
          DataSource = DMAgrupacionOfertasVentas.DSxUnidadesMarcadas
          TabOrder = 1
        end
      end
      object GBAvisos: TGroupBox
        Left = 785
        Top = 0
        Width = 542
        Height = 101
        Align = alClient
        Caption = 'Avisos'
        TabOrder = 2
        object DBMAvisos: TLFDBMemo
          Left = 2
          Top = 15
          Width = 538
          Height = 84
          Align = alClient
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'AVISOS'
          DataSource = DMAgrupacionOfertasVentas.DSxClientes
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object TBCabeceraAgrupacion: TLFToolBar
      Left = 2
      Top = 28
      Width = 1449
      Height = 25
      AutoSize = True
      ButtonHeight = 25
      DragMode = dmAutomatic
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 2
      Wrapable = False
      Separators = True
      object PNLFechasRecepcion: TLFPanel
        Left = 0
        Top = 0
        Width = 238
        Height = 25
        BevelOuter = bvNone
        TabOrder = 0
        object LFechaRecepcion: TLFLabel
          Left = 7
          Top = 4
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha &Recep.'
          FocusControl = DEFechaRecepcion
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DEFechaRecepcion: TLFDateEdit
          Left = 92
          Top = 1
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHoraRecepcion: TDateTimePicker
          Left = 180
          Top = 1
          Width = 56
          Height = 21
          CalAlignment = dtaLeft
          Date = 43917.5182741204
          Format = 'HH:mm'
          Time = 43917.5182741204
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkTime
          ParseInput = False
          TabOrder = 1
        end
      end
      object PNLFechasDestino: TLFPanel
        Left = 238
        Top = 0
        Width = 224
        Height = 25
        BevelOuter = bvNone
        TabOrder = 1
        object LFechaDestino: TLFLabel
          Left = 13
          Top = 4
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Doc.'
          FocusControl = DEFechaDestino
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DEFechaDestino: TLFDateEdit
          Left = 84
          Top = 1
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHoraDestino: TDateTimePicker
          Left = 169
          Top = 1
          Width = 56
          Height = 21
          CalAlignment = dtaLeft
          Date = 43917.5182741204
          Format = 'HH:mm'
          Time = 43917.5182741204
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkTime
          ParseInput = False
          TabOrder = 1
        end
      end
      object PNLCanalDestino: TLFPanel
        Left = 462
        Top = 0
        Width = 271
        Height = 25
        BevelOuter = bvNone
        TabOrder = 2
        object LBDestino: TLFLabel
          Left = 9
          Top = 4
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'C&anal Destino'
          FocusControl = EFCanales
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFCanales: TLFEditFind2000
          Left = 93
          Top = 1
          Width = 46
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
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          Plan.Strings = (
            
              'PLAN JOIN (P INDEX (PK_GES_CABECERAS_S),T INDEX (PK_SYS_TERCEROS' +
              '))')
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMAgrupacionOfertasVentas.EBusca
        end
        object DBETitCanal: TLFDbedit
          Left = 140
          Top = 1
          Width = 129
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAgrupacionOfertasVentas.DSxCanales
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
      object TBSep3: TToolButton
        Left = 733
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLDocDestino: TLFPanel
        Left = 741
        Top = 0
        Width = 271
        Height = 25
        BevelOuter = bvNone
        TabOrder = 5
        object LDocDestino: TLFLabel
          Left = 14
          Top = 4
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Doc. Destino'
          FocusControl = EFDocumento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFDocumento: TLFEditFind2000
          Left = 93
          Top = 1
          Width = 46
          Height = 21
          TabOrder = 0
          OnChange = EFDocumentoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'SERIE'
            'EJERCICIO'
            'SU_REFERENCIA'
            'CANAL')
          CampoNum = 'ID_S'
          CampoStr = 'RIG'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_CABECERAS_S'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFDocumentoBusqueda
          Plan.Strings = (
            
              'PLAN JOIN (P INDEX (PK_GES_CABECERAS_S),T INDEX (PK_SYS_TERCEROS' +
              '))')
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obSerie]
          Entorno = DMAgrupacionOfertasVentas.EBusca
        end
        object EDescripcionDocumento: TLFEdit
          Left = 140
          Top = 1
          Width = 129
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
      object ToolButton8: TToolButton
        Left = 1012
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLOferta: TLFPanel
        Left = 1020
        Top = 0
        Width = 137
        Height = 25
        BevelOuter = bvNone
        DragMode = dmAutomatic
        TabOrder = 3
        object LOferta: TLFLabel
          Left = 16
          Top = 4
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Oferta'
          FocusControl = EOferta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EOferta: TLFEdit
          Left = 56
          Top = 1
          Width = 81
          Height = 21
          TabOrder = 0
        end
      end
      object PNLLector: TLFPanel
        Left = 1157
        Top = 0
        Width = 129
        Height = 25
        BevelOuter = bvNone
        TabOrder = 4
        object LLector: TLFLabel
          Left = 13
          Top = 4
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lec&tor'
          FocusControl = EArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EArticulo: TLFEdit
          Left = 54
          Top = 1
          Width = 75
          Height = 21
          TabOrder = 0
          OnExit = EArticuloExit
          OnKeyPress = EArticuloKeyPress
        end
      end
      object TButtLector: TToolButton
        Left = 1286
        Top = 0
        Hint = 'Importa datos del Lector de C'#243'digos de Barras'
        AutoSize = True
        Caption = 'Importa datos del Lector de C'#243'digos de Barras'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtLectorClick
      end
    end
    object PNLSeleccion: TLFPanel
      Left = 2
      Top = 53
      Width = 1449
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object LOfertaSeleccion: TLFLabel
        Left = 16
        Top = 8
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = '&Oferta'
        FocusControl = EOfertaSeleccionDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LDireccionSeleccion: TLFLabel
        Left = 390
        Top = 8
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = '&Dir.'
        FocusControl = EDireccionSeleccion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LArticuloSeleccion: TLFLabel
        Left = 513
        Top = 8
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = '&Articulo'
        FocusControl = EArticuloSeleccion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LPais: TLFLabel
        Left = 241
        Top = 8
        Width = 25
        Height = 13
        Caption = 'Pa&is'
        FocusControl = EFPaisSeleccion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EOfertaSeleccionDesde: TLFEdit
        Left = 56
        Top = 4
        Width = 81
        Height = 21
        TabOrder = 0
        OnExit = EOfertaSeleccionDesdeExit
        OnKeyUp = EFSeleccionKeyUp
      end
      object EDireccionSeleccion: TLFEdit
        Left = 416
        Top = 4
        Width = 81
        Height = 21
        TabOrder = 3
        OnKeyUp = EFSeleccionKeyUp
      end
      object EArticuloSeleccion: TLFEdit
        Left = 561
        Top = 4
        Width = 81
        Height = 21
        TabOrder = 4
        OnKeyUp = EFSeleccionKeyUp
      end
      object BFiltrarSeleccion: TButton
        Left = 657
        Top = 2
        Width = 57
        Height = 25
        Caption = '&Filtrar'
        TabOrder = 5
        OnClick = BFiltrarSeleccionClick
      end
      object BEnviarSeleccion: TButton
        Left = 721
        Top = 2
        Width = 57
        Height = 25
        Caption = '&Enviar'
        TabOrder = 6
        OnClick = BEnviarSeleccionClick
      end
      object EFPaisSeleccion: TLFEditFind2000
        Left = 273
        Top = 4
        Width = 81
        Height = 21
        TabOrder = 2
        OnKeyUp = EFSeleccionKeyUp
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'PAIS'
        CampoNum = 'PAIS'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PAISES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PAIS')
        Filtros = []
      end
      object BLimpiarSeleccion: TButton
        Left = 785
        Top = 2
        Width = 57
        Height = 25
        Caption = '&Limpiar'
        TabOrder = 7
        OnClick = BLimpiarSeleccionClick
      end
      object EOfertaSeleccionHAsta: TLFEdit
        Left = 138
        Top = 4
        Width = 81
        Height = 21
        TabOrder = 1
        OnKeyUp = EFSeleccionKeyUp
      end
      object CBCalcularStock: TLFCheckBox
        Left = 880
        Top = 5
        Width = 121
        Height = 17
        Caption = 'Calcular Stock'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 8
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBCalcularStockChange
      end
      object CBSoloListoPreparar: TLFCheckBox
        Left = 1016
        Top = 5
        Width = 145
        Height = 17
        Caption = 'Solo Listo Preparacion'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 9
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBSoloListoPrepararChange
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 473
    Width = 1453
  end
  inherited CEMain: TControlEdit
    Left = 288
    Top = 84
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 324
    Top = 84
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
    Top = 88
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBCalcularStock.Checked'
      'CBSoloListoPreparar.Checked')
    Left = 416
    Top = 83
  end
  object ALAgrupa: TActionList
    Images = DMMain.ILMain_Ac
    Left = 456
    Top = 83
    object ACliente: TAction
      Caption = 'Cliente'
      OnExecute = AClienteExecute
    end
  end
end
