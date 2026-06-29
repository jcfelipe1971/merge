inherited FMCierreParcialOrdenDetalle: TFMCierreParcialOrdenDetalle
  Left = 690
  Top = 200
  Width = 707
  Height = 529
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Detalle Cierre Parcial'
  Constraints.MinHeight = 386
  Constraints.MinWidth = 693
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 697
    Height = 476
    inherited TBMain: TLFToolBar
      Width = 693
      inherited NavMain: THYMNavigator
        Width = 80
        DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
        VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel]
        Hints.Strings = ()
        InsertaControl = DBECantidad
        OnChangeState = NavMainChangeState
      end
      inherited TSepNav: TToolButton
        Left = 80
      end
      inherited EPMain: THYMEditPanel
        Left = 88
        Width = 20
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 108
      end
      inherited TbuttComp: TToolButton
        Left = 116
      end
    end
    inherited PCMain: TLFPageControl
      Width = 693
      Height = 446
      inherited TSFicha: TTabSheet
        object SBAEtiquetas: TSpeedButton [0]
          Left = 580
          Top = 176
          Width = 23
          Height = 22
          GroupIndex = -1
          OnClick = SBAEtiquetasClick
        end
        inherited PEdit: TLFPanel
          Width = 685
          Height = 273
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 93
          end
          object LOperario: TLFLabel
            Left = 34
            Top = 97
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LNotas: TLFLabel
            Left = 46
            Top = 119
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LCalidad: TLFLabel
            Left = 39
            Top = 227
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calidad'
          end
          object LPesoCantidad: TLFLabel
            Left = 3
            Top = 30
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso/Cantidad'
          end
          object LLote: TLFLabel
            Left = 53
            Top = 52
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
          end
          object LFecha: TLFLabel
            Left = 44
            Top = 249
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LNumEtiquetas: TLFLabel
            Left = 424
            Top = 204
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Num. Etiquetas'
          end
          object LUbicacion: TLFLabel
            Left = 26
            Top = 74
            Width = 48
            Height = 13
            Caption = 'Ubicaci'#243'n'
          end
          object LArticulo: TLFLabel
            Left = 37
            Top = 204
            Width = 37
            Height = 13
            Caption = 'Art'#237'culo'
          end
          object LCantidadRechazada: TLFLabel
            Left = 267
            Top = 30
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rechazadas'
          end
          object LReserva: TLFLabel
            Left = 34
            Top = 8
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Reserva'
          end
          object DBEOperario: TLFDBEditFind2000
            Left = 78
            Top = 93
            Width = 74
            Height = 21
            DataField = 'OPERARIO'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 7
            OnChange = DBEOperarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = []
          end
          object DBMNotas: TLFDBMemo
            Left = 78
            Top = 115
            Width = 327
            Height = 85
            DataField = 'NOTAS'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 9
          end
          object DBCBCalidad: TDBComboBox
            Left = 78
            Top = 223
            Width = 99
            Height = 21
            DataField = 'CALIDAD'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            ItemHeight = 13
            Items.Strings = (
              'A'
              'AA'
              'AAA')
            TabOrder = 12
          end
          object DBECantidad: TLFDbedit
            Left = 78
            Top = 27
            Width = 74
            Height = 21
            DataField = 'UNIDADES'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 1
            OnChange = DBECantidadChange
          end
          object DBEFIdLote: TLFDBEditFind2000
            Left = 78
            Top = 49
            Width = 74
            Height = 21
            DataField = 'ID_LOTE'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 3
            OnChange = DBEFIdLoteChange
            OnExit = DBEFIdLoteExit
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS_LOTES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'F_ENVASADO'
              'F_CADUCIDAD'
              'F_FABRICACION')
            CampoNum = 'ID_LOTE'
            CampoStr = 'LOTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFIdLoteBusqueda
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDEFechaHora: TLFDBDateEdit
            Left = 78
            Top = 245
            Width = 99
            Height = 21
            DataField = 'FECHA'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            CheckOnExit = True
            DialogTitle = 'Seleccione una fecha'
            NumGlyphs = 2
            TabOrder = 13
          end
          object DBELote: TLFDbedit
            Left = 153
            Top = 49
            Width = 252
            Height = 21
            DataField = 'LOTE'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 4
            OnChange = DBELoteChange
          end
          object PNLCodBarras: TLFPanel
            Left = 420
            Top = 56
            Width = 238
            Height = 135
            TabOrder = 16
            object ICodBarras: TImage
              Left = 1
              Top = 1
              Width = 236
              Height = 133
              Align = alClient
              AutoSize = True
              Center = True
              DragMode = dmAutomatic
              Proportional = True
              Stretch = True
            end
          end
          object DBENumEtiquetas: TLFDbedit
            Left = 500
            Top = 201
            Width = 52
            Height = 21
            DataField = 'NUM_ETIQUETAS'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 15
          end
          object DBDTPFechaHora: TDBDateTimePicker
            Left = 178
            Top = 245
            Width = 68
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 14
            DataField = 'FECHA'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
          end
          object ETituloEmpleado: TLFEdit
            Left = 153
            Top = 93
            Width = 252
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 8
          end
          object DBEFUbicacion: TLFDBEditFind2000
            Left = 78
            Top = 71
            Width = 74
            Height = 21
            DataField = 'ID_UBICACION'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 5
            OnChange = DBEFUbicacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_UBICACION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID_UBICACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloUbicacion: TLFEdit
            Left = 153
            Top = 71
            Width = 252
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 6
          end
          object DBEFArticulo: TLFDBEditFind2000
            Left = 78
            Top = 201
            Width = 74
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 10
            OnChange = DBEFArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFArticuloBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloArticulo: TLFEdit
            Left = 153
            Top = 201
            Width = 252
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 11
          end
          object DBECantidadRechazada: TLFDbedit
            Left = 331
            Top = 27
            Width = 74
            Height = 21
            DataField = 'UNIDADES_RECHAZO'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 2
          end
          object EFReserva: TLFDbedit
            Left = 78
            Top = 5
            Width = 74
            Height = 21
            DataField = 'ID_RESERVA'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            TabOrder = 0
            OnChange = EFReservaChange
            OnExit = EFReservaExit
            OnKeyUp = EFReservaKeyUp
          end
          object DBEClasificacion: TLFDbedit
            Left = 272
            Top = 49
            Width = 133
            Height = 21
            DataField = 'CLASIFICACION'
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
            ReadOnly = True
            TabOrder = 17
          end
        end
      end
      inherited TSTabla: TTabSheet
        TabVisible = False
        OnShow = nil
        inherited DBGMain: THYTDBGrid
          Width = 671
          Height = 259
        end
      end
      object TSComponentes: TTabSheet
        Caption = 'Componentes'
        ImageIndex = 2
        object PNLComponente: TLFPanel
          Left = 0
          Top = 0
          Width = 685
          Height = 216
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LComponente: TLFLabel
            Left = 0
            Top = 0
            Width = 96
            Height = 16
            Align = alTop
            Caption = 'Componentes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TBLotes: TLFToolBar
            Left = 0
            Top = 16
            Width = 685
            Height = 22
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 0
            Separators = True
            object NavComponentes: THYMNavigator
              Left = 0
              Top = 0
              Width = 160
              Height = 22
              DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleComponente
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGLot_Ubi: TDBGridFind2000
            Left = 0
            Top = 38
            Width = 685
            Height = 178
            Align = alClient
            DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleComponente
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGLot_UbiDrawColumnCell
            OnKeyUp = DBGLot_UbiKeyUp
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 9
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
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'ID_UBICACION'
              'TIPO_UNIDAD_LOGISTICA'
              'ALMACEN_DEVOLVER')
            CamposAMostrar.Strings = (
              'ID_UBICACION'
              '0'
              'TIPO_UNIDAD_LOGISTICA'
              '0'
              'ALMACEN_DEVOLVER'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              'ALMACEN')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'ID_UBICACION'
              'TIPO'
              'ALMACEN')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'ART_ALMACENES_UBICACIONES'
              'VER_ARTICULOS_UNID_LOG'
              'ART_ALMACENES')
            Acciones.Strings = (
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGLot_UbiBusqueda
            Planes.Strings = (
              ''
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              'TIPO'
              'ALMACEN')
            Filtros = []
            Columns = <
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
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 200
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
                Expanded = False
                FieldName = 'UNIDADES_REALES'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALM_DEST'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_LOTE'
                Width = 51
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
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES_DEVOLVER'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN_DEVOLVER'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_LOTE_DEV'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LOTE_DEV'
                ReadOnly = True
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 72
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescLote'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_UBICACION'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UBICACION'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_UNIDAD_LOGISTICA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_LOGISITCAS'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES_POR_UL'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OPERARIO'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLASIFICACION'
                Width = 65
                Visible = True
              end>
          end
        end
        object PNLCompuesto: TLFPanel
          Left = 0
          Top = 216
          Width = 685
          Height = 202
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LCompuestos: TLFLabel
            Left = 0
            Top = 0
            Width = 87
            Height = 16
            Align = alTop
            Caption = 'Compuestos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBGFCompuesto: TDBGridFind2000
            Left = 0
            Top = 38
            Width = 685
            Height = 164
            Align = alClient
            DataSource = DMCierreParcialOrden.DSQMCierrePCompuesto
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
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'ARTICULO'
              'ALM_DEST'
              'TIPO_UNIDAD_LOGISTICA'
              'ID_UBICACION')
            CamposAMostrar.Strings = (
              'ARTICULO'
              '0'
              'ALM_DEST'
              '0'
              'TIPO_UNIDAD_LOGISTICA'
              '0'
              'ID_UBICACION'
              '1'
              'COMPOSICION')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO'
              'ALMACEN'
              'TIPO'
              'ID_UBICACION')
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tablas.Strings = (
              'VER_ARTICULOS_EF'
              'ART_ALMACENES'
              'VER_ARTICULOS_UNID_LOG'
              'ART_ALMACENES_UBICACIONES')
            Acciones.Strings = (
              ''
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFCompuestoBusqueda
            Planes.Strings = (
              ''
              ''
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ARTICULO'
              'ALMACEN'
              'TIPO'
              'COMPOSICION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALM_DEST'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_UNIDAD_LOGISTICA'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_LOGISITCAS'
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID_LOTE'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE'
                Width = 150
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UBICACION'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_RECHAZO'
                Width = 65
                Visible = True
              end>
          end
          object TBCompuesto: TLFToolBar
            Left = 0
            Top = 16
            Width = 685
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavCompuesto: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 22
              DataSource = DMCierreParcialOrden.DSQMCierrePCompuesto
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFCompuesto
              InsertaControl = DBGFCompuesto
              Exclusivo = False
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 476
    Width = 697
  end
  inherited CEMain: TControlEdit
    FichaExclusiva = nil
    Left = 520
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 552
    Top = 8
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
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
    Left = 584
    Top = 8
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Listado Etiquetas'
      ImageIndex = 95
      OnExecute = AEtiquetasExecute
    end
    object AConfigEti: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243' Etiquetas'
      ImageIndex = 77
      OnExecute = AConfigEtiExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 616
    Top = 8
  end
  object CodBarras: TCodeBar
    Alto = 80
    OrigenY = 15
    OrigenX = 5
    Modulo = 1
    Ratio = 2
    Tipo = cb128
    ChequearDigito = True
    TipoChequeo = csmModulo10
    Porcentaje = 0
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 648
    Top = 8
  end
end
