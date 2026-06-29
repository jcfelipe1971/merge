inherited FMEDI: TFMEDI
  Left = 440
  Top = 273
  Width = 800
  Height = 480
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mensajes EDI'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 427
    inherited TBMain: TLFToolBar
      Width = 786
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        ImageIndex = 50
        Style = tbsSeparator
      end
      object TButtImportarTodo: TToolButton
        Left = 41
        Top = 0
        Hint = 'Realiza todas las importaciones'
        Caption = 'Importar Todo'
        ImageIndex = 49
        OnClick = TButtImportarTodoClick
      end
    end
    object PNLCarpeta: TLFPanel
      Left = 2
      Top = 28
      Width = 786
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        786
        47)
      object LDirectorioEntrada: TLFLabel
        Left = 23
        Top = 5
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Entrada'
      end
      object LDirectorioSalida: TLFLabel
        Left = 31
        Top = 26
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Salida'
      end
      object EDirectorioEntrada: TLFEdit
        Left = 64
        Top = 1
        Width = 722
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clInfoBk
        Enabled = False
        TabOrder = 0
      end
      object EDirectorioSalida: TLFEdit
        Left = 64
        Top = 23
        Width = 722
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clInfoBk
        Enabled = False
        TabOrder = 1
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 75
      Width = 786
      Height = 350
      ActivePage = TSPedidos
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 2
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSDeclPO: TTabSheet
        Caption = 'Decl. P.O.'
        ImageIndex = 4
        object PNLDeclaracionPO: TLFPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 36
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object BImportaDeclaracionPuntoOperacional: TButton
            Left = 8
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Importar'
            TabOrder = 0
            OnClick = BImportaDeclaracionPuntoOperacionalClick
          end
        end
        object PNLDeclaracionPOErrores: TLFPanel
          Left = 0
          Top = 36
          Width = 778
          Height = 286
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object MErroresDeclPO: TLFMemo
            Left = 0
            Top = 0
            Width = 778
            Height = 286
            Align = alClient
            TabOrder = 0
            OnChange = MErroresImportacionPedidosChange
          end
        end
      end
      object TSPedidos: TTabSheet
        Caption = '&Pedidos'
        object PNLPedido: TLFPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 36
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LSerie: TLFLabel
            Left = 20
            Top = 13
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object BImportaPedidos: TButton
            Left = 384
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Importar'
            TabOrder = 0
            OnClick = BImportaPedidosClick
          end
          object EFSerie: TLFEditFind2000
            Left = 48
            Top = 8
            Width = 89
            Height = 21
            TabOrder = 1
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
            Left = 138
            Top = 8
            Width = 235
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 2
          end
          object BCancelarImportacion: TButton
            Left = 472
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 3
            OnClick = BCancelarImportacionClick
          end
        end
        object PPedidosErrores: TLFPanel
          Left = 0
          Top = 36
          Width = 778
          Height = 286
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object MErroresImportacionPedidos: TLFMemo
            Left = 0
            Top = 0
            Width = 778
            Height = 286
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
            OnChange = MErroresImportacionPedidosChange
          end
        end
      end
      object TSAlbaranes: TTabSheet
        Caption = '&Albaranes'
        ImageIndex = 1
        OnShow = TSAlbaranesShow
        object PNLAlbaran: TLFPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 63
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            778
            63)
          object LProcesandoAlbaran: TLFLabel
            Left = 280
            Top = 8
            Width = 492
            Height = 20
            Alignment = taCenter
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Procesando Albaran ...'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
            Visible = False
          end
          object BExportaAlbaranes: TButton
            Left = 8
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Exportar'
            TabOrder = 0
            OnClick = BExportaAlbaranesClick
          end
          object CHBMuestraTodosAlbaranes: TLFCheckBox
            Left = 96
            Top = 11
            Width = 177
            Height = 17
            Caption = 'Muestra Todos los Albaranes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            OnClick = CHBMuestraTodosAlbaranesClick
            Alignment = taLeftJustify
          end
          object PNLFiltroAlbaranes: TLFPanel
            Left = 0
            Top = 38
            Width = 778
            Height = 25
            Align = alBottom
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LHastaAlbaran: TLFLabel
              Left = 207
              Top = 6
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object LDesdeAlbaran: TLFLabel
              Left = 97
              Top = 6
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LSerieAlbaran: TLFLabel
              Left = 15
              Top = 6
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object BtnMarcar: TButton
              Left = 482
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Marca todos los documentos filtrados'
              Caption = 'Marcar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BtnMarcarClick
            end
            object BtnLimpiar: TButton
              Left = 401
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Limpia la seleccion'
              Caption = 'Limpiar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = BtnLimpiarClick
            end
            object BtnFiltrar: TButton
              Left = 320
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Filtra los documentos seleccionados'
              Caption = 'Filtrar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = BtnFiltrarClick
            end
            object EDesdeAlbaran: TLFEdit
              Left = 133
              Top = 2
              Width = 60
              Height = 21
              TabOrder = 1
              Text = '0'
            end
            object EHastaAlbaran: TLFEdit
              Left = 240
              Top = 2
              Width = 60
              Height = 21
              TabOrder = 2
              Text = '0'
            end
            object BtnDesmarcarAlbaranes: TButton
              Left = 562
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Desmarca todos los documentos filtrados'
              Caption = 'Desmarcar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = BtnDesmarcarAlbaranesClick
            end
            object BMarcarProcesadoAlbaran: TButton
              Left = 672
              Top = 0
              Width = 101
              Height = 25
              Hint = 'Marca como procesadas las lineas seleccinoadas'
              Caption = 'Marcar Procesado'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = BMarcarProcesadoAlbaranClick
            end
            object EFSerieAlbaran: TLFEditFind2000
              Left = 43
              Top = 2
              Width = 49
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
          end
        end
        object PAlbaranesErrores: TLFPanel
          Left = 0
          Top = 63
          Width = 778
          Height = 259
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFAlbaranes: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 778
            Height = 259
            Align = alClient
            DataSource = DMEDI.DSxAlbAProcesar
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
            Transaction = DMEDI.TLocal
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'EJERCICIO'
              'SERIE'
              'RIG'
              'ALMACEN'
              'FECHA'
              'CLIENTE'
              'SU_REFERENCIA'
              'FORMA_PAGO'
              'AGENTE'
              'LIQUIDO')
            ColumnasCheckBoxes.Strings = (
              'PROCESAR')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN'
                ReadOnly = True
                Width = 42
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 77
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CLIENTE'
                ReadOnly = True
                Width = 52
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SU_REFERENCIA'
                ReadOnly = True
                Width = 117
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORMA_PAGO'
                ReadOnly = True
                Width = 78
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'AGENTE'
                ReadOnly = True
                Width = 48
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCESAR'
                Width = 47
                Visible = True
              end>
          end
        end
      end
      object TSFacturas: TTabSheet
        Caption = '&Facturas'
        ImageIndex = 61
        OnShow = TSFacturasShow
        object PNLFactura: TLFPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 63
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            778
            63)
          object LProcesandoFactura: TLFLabel
            Left = 280
            Top = 8
            Width = 492
            Height = 20
            Alignment = taCenter
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Procesando Factura ...'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
            Visible = False
          end
          object BExportaFacturas: TButton
            Left = 8
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Exportar'
            TabOrder = 0
            OnClick = BExportaFacturasClick
          end
          object CHBMuestraTodasFacturas: TLFCheckBox
            Left = 96
            Top = 11
            Width = 177
            Height = 17
            Caption = 'Muestra Todos las Facturas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            OnClick = CHBMuestraTodasFacturasClick
            Alignment = taLeftJustify
          end
          object PNLFiltroFactura: TLFPanel
            Left = 0
            Top = 38
            Width = 778
            Height = 25
            Align = alBottom
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LDesdeFactura: TLFLabel
              Left = 97
              Top = 6
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaFactura: TLFLabel
              Left = 207
              Top = 6
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object LSerieFactura: TLFLabel
              Left = 15
              Top = 6
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object EDesdeFactura: TLFEdit
              Left = 133
              Top = 2
              Width = 60
              Height = 21
              TabOrder = 1
              Text = '0'
            end
            object EHastaFactura: TLFEdit
              Left = 240
              Top = 2
              Width = 60
              Height = 21
              TabOrder = 2
              Text = '0'
            end
            object BtnFiltrarFac: TButton
              Left = 320
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Filtra los documentos seleccionados'
              Caption = 'Filtrar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = BtnFiltrarFacClick
            end
            object BtnLimpiarFac: TButton
              Left = 401
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Limpia la seleccion'
              Caption = 'Limpiar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = BtnLimpiarFacClick
            end
            object BtnMarcarFac: TButton
              Left = 482
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Marca todos los documentos filtrados'
              Caption = 'Marcar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BtnMarcarFacClick
            end
            object BtnDesmarcarFacturas: TButton
              Left = 562
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Desmarca todos los documentos filtrados'
              Caption = 'Desmarcar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = BtnDesmarcarFacturasClick
            end
            object BMarcarProcesadoFactura: TButton
              Left = 672
              Top = 0
              Width = 101
              Height = 25
              Hint = 'Marca como procesadas las lineas seleccinoadas'
              Caption = 'Marcar Procesado'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = BMarcarProcesadoFacturaClick
            end
            object EFSerieFactura: TLFEditFind2000
              Left = 43
              Top = 2
              Width = 49
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
          end
        end
        object PFacturasErrores: TLFPanel
          Left = 0
          Top = 63
          Width = 778
          Height = 259
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFFacturas: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 778
            Height = 259
            Align = alClient
            DataSource = DMEDI.DSxFacAProcesar
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
            Transaction = DMEDI.TLocal
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'EJERCICIO'
              'SERIE'
              'RIG'
              'ALMACEN'
              'FECHA'
              'CLIENTE'
              'SU_REFERENCIA'
              'FORMA_PAGO'
              'AGENTE'
              'LIQUIDO')
            ColumnasCheckBoxes.Strings = (
              'PROCESAR')
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
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN'
                ReadOnly = True
                Width = 42
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 77
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CLIENTE'
                ReadOnly = True
                Width = 52
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SU_REFERENCIA'
                ReadOnly = True
                Width = 117
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORMA_PAGO'
                ReadOnly = True
                Width = 78
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'AGENTE'
                ReadOnly = True
                Width = 48
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCESAR'
                Width = 47
                Visible = True
              end>
          end
        end
      end
      object TSEtiquetasAlbaranes: TTabSheet
        Caption = '&Etiqetas de Alb.'
        ImageIndex = 3
        OnShow = TSEtiquetasAlbaranesShow
        object PNLEtiquetaAlbaranes: TLFPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 36
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object BImprimirEtiquetaAlbaranes: TButton
            Left = 8
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            TabOrder = 0
            OnClick = BImprimirEtiquetaAlbaranesClick
          end
          object CHBMuestraTodosAlbEti: TLFCheckBox
            Left = 96
            Top = 11
            Width = 177
            Height = 17
            Caption = 'Muestra Todos los Albaranes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            OnClick = CHBMuestraTodosAlbEtiClick
            Alignment = taLeftJustify
          end
          object CHBPrevisualizaEtiqueta: TLFCheckBox
            Left = 280
            Top = 11
            Width = 177
            Height = 17
            Caption = 'Previsualizar Etiquetas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
        end
        object PNLDetalleEtiquetaAlbaranes: TLFPanel
          Left = 0
          Top = 36
          Width = 778
          Height = 286
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFEtiquetasAlb: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 778
            Height = 286
            Align = alClient
            DataSource = DMEDI.DSxAlbEtiAProcesar
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
            Transaction = DMEDI.TLocal
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'EJERCICIO'
              'SERIE'
              'RIG'
              'ALMACEN'
              'FECHA'
              'CLIENTE'
              'SU_REFERENCIA'
              'FORMA_PAGO'
              'AGENTE'
              'LIQUIDO')
            ColumnasCheckBoxes.Strings = (
              'PROCESAR')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN'
                ReadOnly = True
                Width = 42
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 77
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CLIENTE'
                ReadOnly = True
                Width = 52
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SU_REFERENCIA'
                ReadOnly = True
                Width = 117
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORMA_PAGO'
                ReadOnly = True
                Width = 78
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'AGENTE'
                ReadOnly = True
                Width = 48
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCESAR'
                Width = 47
                Visible = True
              end>
          end
        end
      end
      object TSReporteDeVentas: TTabSheet
        Caption = 'Reporte De Ventas'
        object PNLReporteDeVentasErrores: TLFPanel
          Left = 0
          Top = 121
          Width = 778
          Height = 201
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object MReporteDeVentasErrores: TLFMemo
            Left = 0
            Top = 0
            Width = 778
            Height = 201
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
            OnChange = MErroresImportacionPedidosChange
          end
        end
        object PNLReporteDeVentas: TLFPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 121
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LReporteDeVentasDesde: TLFLabel
            Left = 91
            Top = 51
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LReporteDeVentasHasta: TLFLabel
            Left = 94
            Top = 72
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object LSerieReporteVentas: TLFLabel
            Left = 100
            Top = 7
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LEmisorReporteVentas: TLFLabel
            Left = 481
            Top = 7
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Emisor'
          end
          object LReceptorReporteVentas: TLFLabel
            Left = 468
            Top = 29
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Receptor'
          end
          object LProveedor: TLFLabel
            Left = 463
            Top = 52
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LComprador: TLFLabel
            Left = 461
            Top = 73
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comprador'
          end
          object LFamilia: TLFLabel
            Left = 92
            Top = 29
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LCodigoLugar: TLFLabel
            Left = 449
            Top = 95
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Lugar'
          end
          object BReporteDeVentas: TButton
            Left = 8
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Generar'
            TabOrder = 11
            OnClick = BReporteDeVentasClick
          end
          object DEReporteDeVentasDesde: TLFDateEdit
            Left = 128
            Top = 47
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DEReporteDeVentasHasta: TLFDateEdit
            Left = 128
            Top = 69
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object EFSerieReporteVentas: TLFEditFind2000
            Left = 128
            Top = 3
            Width = 89
            Height = 21
            TabOrder = 0
            OnChange = EFSerieReporteVentasChange
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
          object ESerieReporteVentas: TLFEdit
            Left = 218
            Top = 3
            Width = 235
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
          object EEmisorReporteVentas: TLFEdit
            Left = 517
            Top = 3
            Width = 116
            Height = 21
            TabOrder = 6
            Text = '0'
          end
          object EReceptorReporteVentas: TLFEdit
            Left = 517
            Top = 25
            Width = 116
            Height = 21
            TabOrder = 7
            Text = '0'
          end
          object EProveedorReporteVentas: TLFEdit
            Left = 517
            Top = 47
            Width = 116
            Height = 21
            TabOrder = 8
            Text = '0'
          end
          object ECompradorReporteVentas: TLFEdit
            Left = 517
            Top = 69
            Width = 116
            Height = 21
            TabOrder = 9
            Text = '0'
          end
          object EFFamiliaReporteVentas: TLFEditFind2000
            Left = 128
            Top = 25
            Width = 89
            Height = 21
            TabOrder = 2
            OnChange = EFFamiliaReporteVentasChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFamiliaReporteVentas: TLFEdit
            Left = 218
            Top = 25
            Width = 235
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
          end
          object ECodigoLugar: TLFEdit
            Left = 517
            Top = 91
            Width = 116
            Height = 21
            TabOrder = 10
            Text = '0'
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 427
    Width = 790
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
    Options = [fpPosition]
    StoredProps.Strings = (
      'CHBMuestraTodasFacturas.Checked'
      'CHBMuestraTodosAlbaranes.Checked'
      'CHBMuestraTodosAlbEti.Checked'
      'CHBPrevisualizaEtiqueta.Checked'
      'DBGFAlbaranes.Columns'
      'DBGFEtiquetasAlb.Columns'
      'DBGFFacturas.Columns')
    Left = 464
    Top = 8
  end
end
