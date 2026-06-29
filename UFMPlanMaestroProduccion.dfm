inherited FMPlanMaestroProduccion: TFMPlanMaestroProduccion
  Left = 209
  Top = 101
  Width = 1436
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Plan Maestro de Producci'#243'n'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1426
    Height = 185
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 1422
      inherited NavMain: THYMNavigator
        DataSource = DMPlanMaestroProduccion.DSQMCabecera
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TBSep2: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
        Visible = False
      end
      object TBAtras: TToolButton
        Left = 347
        Top = 0
        Action = AEstadoAnterior
        Visible = False
      end
      object TBAdelante: TToolButton
        Left = 370
        Top = 0
        Action = AEstadoSiguiente
        Visible = False
      end
      object TBSep1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBPLanificar: TToolButton
        Left = 401
        Top = 0
        Action = ACalculaPlanificacion
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1422
      Height = 155
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1414
          Height = 127
          inherited G2KTableLoc: TG2KTBLoc
            Left = 54
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_PMP_CAB'
            CampoNum = 'PLANIFICACION'
            CampoStr = 'FECHA_CREACION'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'PLANIFICACION')
          end
          object LPlanificacion: TLFLabel
            Left = 20
            Top = 13
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Planificaci'#243'n'
          end
          object LTipo: TLFLabel
            Left = 59
            Top = 35
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LFechaCreacion: TLFLabel
            Left = 559
            Top = 12
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Creaci'#243'n'
          end
          object LFechaLanzamiento: TLFLabel
            Left = 542
            Top = 34
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Lanzamiento'
          end
          object LResponsable: TLFLabel
            Left = 18
            Top = 57
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LEstado: TLFLabel
            Left = 248
            Top = 13
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LAlmacen: TLFLabel
            Left = 12
            Top = 79
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Plan.'
          end
          object LAlmacenNecesidades: TLFLabel
            Left = 13
            Top = 101
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Nec.'
          end
          object EFPlanificacion: TLFDbedit
            Left = 84
            Top = 9
            Width = 51
            Height = 21
            Color = clInfoBk
            DataField = 'PLANIFICACION'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = EFPlanificacionChange
          end
          object ETituloEstado: TLFEdit
            Left = 325
            Top = 9
            Width = 126
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object EFTipo: TLFDBEditFind2000
            Left = 84
            Top = 31
            Width = 51
            Height = 21
            DataField = 'TIPO'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            TabOrder = 1
            OnChange = EFTipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_PMP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object ETituloTipo: TLFEdit
            Left = 136
            Top = 31
            Width = 315
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
          object ETituloResponsable: TLFEdit
            Left = 136
            Top = 53
            Width = 315
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object EFResponsable: TLFDBEditFind2000
            Left = 84
            Top = 53
            Width = 51
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            TabOrder = 2
            OnChange = EFResponsableChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEEstado: TLFDbedit
            Left = 285
            Top = 9
            Width = 39
            Height = 21
            Color = clInfoBk
            DataField = 'ESTADO'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 8
            OnChange = DBEEstadoChange
          end
          object DBFechaCreacion: TLFDBDateEdit
            Left = 638
            Top = 8
            Width = 91
            Height = 21
            DataField = 'FECHA_CREACION'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBFechaLanzamiento: TLFDBDateEdit
            Left = 638
            Top = 30
            Width = 91
            Height = 21
            DataField = 'FECHA_LANZAMIENTO'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
          object DBEAlmacen: TLFDBEditFind2000
            Left = 84
            Top = 75
            Width = 51
            Height = 21
            DataField = 'ALMACEN_COMPONENTES'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            TabOrder = 3
            OnChange = DBEAlmacenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAlmacen: TLFEdit
            Left = 136
            Top = 75
            Width = 315
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 11
          end
          object DBCBAgrupaCompuestos: TLFDBCheckBox
            Left = 638
            Top = 58
            Width = 131
            Height = 17
            Caption = 'Agrupa Compuestos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Visible = False
            Alignment = taLeftJustify
            DataField = 'AGRUPA_COMPUESTOS'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCalculaStock: TLFDBCheckBox
            Left = 638
            Top = 73
            Width = 131
            Height = 17
            Caption = 'Calcula Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Visible = False
            Alignment = taLeftJustify
            DataField = 'CALCULA_STOCK_COMPONENTE'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAlmacenNec: TLFDBEditFind2000
            Left = 84
            Top = 97
            Width = 51
            Height = 21
            DataField = 'ALMACEN_NECESIDADES'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            TabOrder = 4
            OnChange = DBEAlmacenNecChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAlmacenNec: TLFEdit
            Left = 136
            Top = 97
            Width = 315
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 14
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        object PCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 1414
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LNotasTipo: TLFLabel
            Left = 131
            Top = 6
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LNotasEstado: TLFLabel
            Left = 420
            Top = 6
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LNotasAlmacen: TLFLabel
            Left = 505
            Top = 6
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LNotasPlanificacion: TLFLabel
            Left = 5
            Top = 6
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Planificacion'
          end
          object DBENotasPlanificacion: TLFDbedit
            Left = 68
            Top = 2
            Width = 54
            Height = 21
            Color = clInfoBk
            DataField = 'PLANIFICACION'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBENotasTipo: TLFDbedit
            Left = 155
            Top = 2
            Width = 38
            Height = 21
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBENotasEstado: TLFDbedit
            Left = 456
            Top = 2
            Width = 38
            Height = 21
            Color = clInfoBk
            DataField = 'ESTADO'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object NavNotas: THYMNavigator
            Left = 699
            Top = 1
            Width = 66
            Height = 23
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 3
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBREComentario
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ETipoTitulo: TLFEdit
            Left = 194
            Top = 2
            Width = 215
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBENotasAlmacen: TLFDbedit
            Left = 549
            Top = 2
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'ALMACEN_COMPONENTES'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
        end
        object PEdNotas: TLFPanel
          Left = 0
          Top = 25
          Width = 1414
          Height = 102
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBREComentario: TDBRichEdit
            Left = 0
            Top = 0
            Width = 1414
            Height = 102
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'COMENTARIO'
            DataSource = DMPlanMaestroProduccion.DSQMCabecera
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1414
          Height = 127
          DataSource = DMPlanMaestroProduccion.DSQMCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PLANIFICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLANIFICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CREACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_LANZAMIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGRUPA_COMPUESTOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALCULA_STOCK_COMPONENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_COMPONENTES'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 1426
  end
  object PCDetalle: TLFPageControl [2]
    Left = 0
    Top = 185
    Width = 1426
    Height = 362
    ActivePage = TSOPPend
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSOPPend: TTabSheet
      Caption = 'Compuestos'
      object TBOrdProdPendientes: TLFToolBar
        Left = 0
        Top = 0
        Width = 1418
        Height = 22
        AutoSize = True
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 200
          Height = 22
          DataSource = DMPlanMaestroProduccion.DSQMDetalle
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = True
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object TBSep4: TToolButton
          Left = 200
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 1418
        Height = 312
        Align = alClient
        DataSource = DMPlanMaestroProduccion.DSQMDetalle
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGFDetalleCellClick
        OnDblClick = DBGFDetalleDblClick
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
        Campos.Strings = (
          'COMPUESTO'
          'ID_ESCANDALLO_FABRICAR')
        CamposAMostrar.Strings = (
          'COMPUESTO'
          '0'
          'ID_ESCANDALLO_FABRICAR'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          'COMPUESTO'
          '')
        CamposDesplegar.Strings = (
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'FABRICAR')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'COMPUESTO'
          'ESCANDALLO')
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tablas.Strings = (
          'VER_PRO_COMPUESTOS_ESC_EF'
          'PRO_VER_ESCANDALLO')
        Acciones.Strings = (
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'DESCRIPCION')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleBusqueda
        Planes.Strings = (
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'COMPUESTO'
          ''
          '')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            ReadOnly = True
            Width = 33
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COD_MODELO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPUESTO'
            Width = 85
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescCompuesto'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID_ESCANDALLO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ESCANDALLO_FABRICAR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG_PEDIDO'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_PED'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_PEDIDO'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ESCANDALLO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'FECHA_FINALIZACION'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN_CREACION'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CANTIDAD_CALCULADA'
            ReadOnly = True
            Width = 71
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNI_PEDIDOS_PEND'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK_MINIMO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOTE_OPTIMO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_STOCK'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNI_PENDIENTES_OP'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD_FABRICAR'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FABRICAR'
            Width = 45
            Visible = True
          end>
      end
    end
    object TSNecesidades: TTabSheet
      Caption = 'Materiales'
      ImageIndex = 2
      object DBGNecesidades: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 1418
        Height = 312
        Align = alClient
        DataSource = DMPlanMaestroProduccion.DSQMNecesidades
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGNecesidadesCellClick
        OnDblClick = DBGNecesidadesDblClick
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
          'PROVEEDOR')
        CamposAMostrar.Strings = (
          'PROVEEDOR'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0')
        CamposADevolver.Strings = (
          '')
        CamposDesplegar.Strings = (
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'COMPRAR')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'PROVEEDOR')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'VER_PROVEEDORES')
        Acciones.Strings = (
          '')
        Titulos.Strings = (
          'TITULO')
        Posicion = tpCentrado
        Planes.Strings = (
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          '')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPRAR'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_E_PEDIDO'
            ReadOnly = True
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COMPONENTE'
            ReadOnly = True
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescComponente'
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CANTIDAD'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNI_PEND_RECIBIR'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'STOCK'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNI_PEND_FABRICAR'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD_DIF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVEEDOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescProveedor'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Width = 200
            Visible = True
          end>
      end
      object TBMateriales: TLFToolBar
        Left = 0
        Top = 0
        Width = 1418
        Height = 22
        AutoSize = True
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object NavMateriales: THYMNavigator
          Left = 0
          Top = 0
          Width = 160
          Height = 22
          DataSource = DMPlanMaestroProduccion.DSQMNecesidades
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
    end
    object TSOPLanzadas: TTabSheet
      Caption = 'OP Creadas'
      ImageIndex = 1
      object DBGOPLanzadas: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 1418
        Height = 312
        Align = alClient
        Color = clInfoBk
        DataSource = DMPlanMaestroProduccion.DSQMOPLanzadas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGOPLanzadasDrawColumnCell
        OnDblClick = DBGOPLanzadasDblClick
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
        Campos.Strings = (
          'COMPUESTO'
          'ID_ESCANDALLO')
        CamposAMostrar.Strings = (
          'COMPUESTO'
          '0'
          'ID_ESCANDALLO'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0')
        CamposADevolver.Strings = (
          'COMPUESTO'
          'ID_ESC')
        CamposDesplegar.Strings = (
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'FABRICAR')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'COMPUESTO'
          'ID_ESC')
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tablas.Strings = (
          'VER_PRO_COMPUESTOS_ESC_EF'
          'PRO_VER_ESCANDALLO')
        Acciones.Strings = (
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'DESCRIPCION')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleBusqueda
        Planes.Strings = (
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'COMPUESTO'
          '')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_ORDEN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG_OF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUBORDEN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ORD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPUESTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_CLIENTE'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNI_TOTAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ENTREGA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescSituacion'
            Width = 100
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'COPIAS_PMP'
            Visible = True
          end>
      end
      object TBOPLanzadas: TLFToolBar
        Left = 0
        Top = 0
        Width = 1418
        Height = 22
        AutoSize = True
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object NavOPCreadas: THYMNavigator
          Left = 0
          Top = 0
          Width = 160
          Height = 22
          DataSource = DMPlanMaestroProduccion.DSQMOPLanzadas
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGOPLanzadas
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 464
    Top = 32
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 504
    Top = 32
  end
  inherited ALMain: TLFActionList
    Left = 308
    Top = 32
    object ACalculaPlanificacion: TAction
      Category = 'Procesos'
      Caption = 'Calcula Planificacion'
      Hint = 'Calcula Planificacion'
      ImageIndex = 3
      OnExecute = ACalculaPlanificacionExecute
    end
    object ACreaOP: TAction
      Category = 'Procesos'
      Caption = 'Generar OP'
      Hint = 'Generar OP'
      ImageIndex = 19
      OnExecute = ACreaOPExecute
    end
    object ALanzarOP: TAction
      Category = 'Procesos'
      Caption = 'Lanzar OP'
      Hint = 'Lanza las ordenes marcadas'
      ImageIndex = 25
      OnExecute = ALanzarOPExecute
    end
    object AReservarOP: TAction
      Category = 'Procesos'
      Caption = 'Reservar OP'
      Hint = 'Reserva todas las ordenes del PMP'
      ImageIndex = 75
      OnExecute = AReservarOPExecute
    end
    object ACerrarOP: TAction
      Category = 'Procesos'
      Caption = 'Cerrar OP'
      ImageIndex = 71
      OnExecute = ACerrarOPExecute
    end
    object AGenerarSuborden: TAction
      Category = 'Procesos'
      Caption = 'Generar SubOrdenes'
      ImageIndex = 97
      Visible = False
      OnExecute = AGenerarSubordenExecute
    end
    object ANecesidades: TAction
      Category = 'Procesos'
      Caption = 'Generar Necesidades'
      ImageIndex = 122
      Visible = False
      OnExecute = ANecesidadesExecute
    end
    object AComprarMat: TAction
      Category = 'Procesos'
      Caption = 'Generar Pedido Compra'
      ImageIndex = 73
      OnExecute = AComprarMatExecute
    end
    object AActualizaStocks: TAction
      Category = 'Procesos'
      Caption = 'Actualiza Stocks'
      Hint = 'Actualiza los stock de los articulos'
      ImageIndex = 39
      Visible = False
      OnExecute = AActualizaStocksExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadosPMP: TAction
      Category = 'Listados'
      Caption = 'Listados PMP'
      Hint = 'Listados PMP'
      ImageIndex = 14
      OnExecute = AListadosPMPExecute
    end
    object ACerrarPMP: TAction
      Category = 'Procesos'
      Caption = 'Cerrar PMP'
      ImageIndex = 68
      OnExecute = ACerrarPMPExecute
    end
    object ADeslanzarOP: TAction
      Category = 'Procesos'
      Caption = 'Deslanzar OP'
      ImageIndex = 51
      OnExecute = ADeslanzarOPExecute
    end
    object ADesreservarOP: TAction
      Category = 'Procesos'
      Caption = 'Desreservar OP'
      ImageIndex = 51
      OnExecute = ADesreservarOPExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 544
    Top = 32
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 624
    Top = 32
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PEdNotas
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 584
    Top = 32
  end
  object ALPlanProduccion: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 344
    Top = 32
    object AEstadoSiguiente: TAction
      Caption = 'AEstadoSiguiente'
      Hint = 'Estado siguiente'
      ImageIndex = 25
      OnExecute = AEstadoSiguienteExecute
    end
    object AEstadoAnterior: TAction
      Caption = 'AEstadoAnterior'
      Hint = 'Estado anterior'
      ImageIndex = 51
      OnExecute = AEstadoAnteriorExecute
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CENotas
    FichaEdicion = TSOPPend
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 468
    Top = 84
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 504
    Top = 84
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
