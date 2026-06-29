inherited FMHojaDePreparacion: TFMHojaDePreparacion
  Left = 268
  Top = 228
  Width = 1131
  Height = 502
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Hoja de Preparacion'
  PopupMenu = CEDetalleUbicacionPMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1121
    Height = 161
    inherited TBMain: TLFToolBar
      Width = 1117
      inherited NavMain: THYMNavigator
        DataSource = DMHojaDePreparacion.DSQMCabecera
        Hints.Strings = ()
        EditaControl = DBEFCliente
        InsertaControl = DBEFCliente
        OnChangeState = NavMainChangeState
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
      object TButtRefrescar: TToolButton
        Left = 299
        Top = 0
        Action = ARefrescar
      end
      object tButtGeneraAlbaran: TToolButton
        Left = 322
        Top = 0
        Action = AGeneraAlbaran
        Visible = False
      end
      object ToolButton3: TToolButton
        Left = 345
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtAtras: TToolButton
        Left = 353
        Top = 0
        Action = AEstadoAtras
      end
      object TButtAdelante: TToolButton
        Left = 376
        Top = 0
        Action = AEstadoAdelante
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1117
      Height = 131
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1109
          Height = 103
          inherited G2KTableLoc: TG2KTBLoc
            Left = 56
            Top = 129
          end
          object LResponsable: TLFLabel
            Left = 410
            Top = 21
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LHoja: TLFLabel
            Left = 56
            Top = 21
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hoja'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LDireccion: TLFLabel
            Left = 33
            Top = 65
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LCliente: TLFLabel
            Left = 46
            Top = 43
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTotalUnidadesLogisticas: TLFLabel
            Left = 877
            Top = 43
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Uds. Log.'
          end
          object LTotalUnidades: TLFLabel
            Left = 878
            Top = 21
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Unidades'
          end
          object LComentario: TLFLabel
            Left = 418
            Top = 65
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LFechaFin: TLFLabel
            Left = 648
            Top = 43
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Fin'
          end
          object LFechaInicio: TLFLabel
            Left = 413
            Top = 43
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inicio'
          end
          object LEstado: TLFLabel
            Left = 153
            Top = 21
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LTotalPuntos: TLFLabel
            Left = 890
            Top = 65
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Puntos'
          end
          object DBETituloResponsable: TLFDbedit
            Left = 548
            Top = 17
            Width = 306
            Height = 21
            Color = clInfoBk
            DataField = 'TITUTLO_RESPONSABLE'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBEHoja: TLFDbedit
            Left = 82
            Top = 17
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'HOJA'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBEHojaChange
          end
          object DBEDireccion: TLFDbedit
            Left = 82
            Top = 61
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'DIRECCION'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBDEFechaFin: TLFDBDateEdit
            Left = 699
            Top = 39
            Width = 87
            Height = 21
            DataField = 'FECHA_FIN'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBETotalUnidadesLogisitcas: TLFDbedit
            Left = 954
            Top = 39
            Width = 65
            Height = 21
            DataField = 'TOTAL_UNIDADES_LOGISTICAS'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            TabOrder = 9
          end
          object DBETotalUnidades: TLFDbedit
            Left = 954
            Top = 17
            Width = 65
            Height = 21
            DataField = 'TOTAL_UNIDADES'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            TabOrder = 8
          end
          object DBEComentario: TLFDbedit
            Left = 475
            Top = 61
            Width = 380
            Height = 21
            DataField = 'COMENTARIO'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            TabOrder = 3
          end
          object DBDEFechaInicio: TLFDBDateEdit
            Left = 475
            Top = 39
            Width = 87
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 82
            Top = 39
            Width = 64
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFResponsable: TLFDBEditFind2000
            Left = 475
            Top = 17
            Width = 71
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloEstado: TLFDbedit
            Left = 224
            Top = 17
            Width = 163
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBEEstado: TLFDbedit
            Left = 189
            Top = 17
            Width = 34
            Height = 21
            Color = clInfoBk
            DataField = 'ESTADO'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 13
            OnChange = DBEEstadoChange
          end
          object DBETituloCliente: TLFDbedit
            Left = 147
            Top = 39
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBEDireccionCompleta: TLFDbedit
            Left = 147
            Top = 61
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_COMPLETA_N'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 15
          end
          object DBDTPFechaIniTime: TDBDateTimePicker
            Left = 563
            Top = 39
            Width = 68
            Height = 21
            CalAlignment = dtaLeft
            Date = 43635
            Time = 43635
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 5
            DataField = 'FECHA_INICIO'
            DataSource = DMHojaDePreparacion.DSQMCabecera
          end
          object DBDateTimePicker1: TDBDateTimePicker
            Left = 787
            Top = 39
            Width = 68
            Height = 21
            CalAlignment = dtaLeft
            Date = 43635
            Time = 43635
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 7
            DataField = 'FECHA_FIN'
            DataSource = DMHojaDePreparacion.DSQMCabecera
          end
          object DBETotalP: TLFDbedit
            Left = 954
            Top = 61
            Width = 65
            Height = 21
            DataField = 'TOTAL_PUNTOS'
            DataSource = DMHojaDePreparacion.DSQMCabecera
            TabOrder = 16
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1109
          Height = 103
          DataSource = DMHojaDePreparacion.DSQMCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'HOJA'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_UNIDADES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_UNIDADES_LOGISTICAS'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 161
    Width = 1121
    Height = 288
    OnResize = PDetalleResize
    object Splitter1: TSplitter [0]
      Left = 697
      Top = 22
      Width = 3
      Height = 266
      Cursor = crHSplit
      OnMoved = Splitter1Moved
    end
    inherited TBDetalle: TLFToolBar
      Width = 1121
      Wrapable = False
      inherited NavDetalle: THYMNavigator
        Width = 120
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 120
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfStocks: TToolButton
        Left = 128
        Top = 0
        Action = AInfoStocks
      end
      object ToolButton2: TToolButton
        Left = 151
        Top = 0
        Width = 46
        Style = tbsSeparator
      end
      object NavUbicacion: THYMNavigator
        Left = 197
        Top = 0
        Width = 240
        Height = 22
        DataSource = DMHojaDePreparacion.DSQMDetalleUbicacion
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetalleUbicacionPMEdit
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEDetalleUbicacion
        OrdenAscendente = True
        InsertaUltimo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 697
      Height = 266
      Align = alLeft
      DataSource = DMHojaDePreparacion.DSQMDetallePre
      PopupMenu = nil
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      IniStorage = FSMain
      Transaction = DMHojaDePreparacion.TLocal
      Campos.Strings = (
        'TIPO_UNIDAD_LOGISTICA')
      CamposAMostrar.Strings = (
        'TIPO_UNIDAD_LOGISTICA'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'RIG')
      ColumnasCheckBoxes.Strings = (
        'PREPARACION'
        'PREPARABLE')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      Numericos.Strings = (
        'TIPO')
      Tablas.Strings = (
        'VER_ARTICULOS_UNID_LOG')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        'DEFECTO,TIPO'
        'GENERAL,COMPOSICION'
        'CADUCIDAD,LOTE')
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
          FieldName = 'SERIE'
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
          FieldName = 'LINEA_PED'
          ReadOnly = True
          Width = 35
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
          Expanded = False
          FieldName = 'PREPARACION'
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 85
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PREPARABLE'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 250
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
          FieldName = 'UNIDADES'
          ReadOnly = True
          Visible = True
        end>
    end
    object DBGDetalleUbicacion: TDBGridFind2000
      Left = 700
      Top = 22
      Width = 421
      Height = 266
      Align = alClient
      DataSource = DMHojaDePreparacion.DSQMDetalleUbicacion
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyUp = DBGDetalleUbicacionKeyUp
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 1
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
      Transaction = DMHojaDePreparacion.TLocal
      BuscarNums = True
      Campos.Strings = (
        'ID_UBICACION')
      CamposAMostrar.Strings = (
        'ID_UBICACION'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'PREPARACION')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'ID_UBICACION')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_ARTICULOS_UBICACIONES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO_DESCRIPCION')
      Posicion = tpCentrado
      OnBusqueda = DBGDetalleUbicacionBusqueda
      OnRowChange = DBGDetalleUbicacionRowChange
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        '')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_UBICACION'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_UBICACION'
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_UBICACION_SIMPLE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CALLE'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTANTERIA'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REPISA'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POSICION'
          ReadOnly = True
          Width = 60
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 449
    Width = 1121
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 336
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 420
    Top = 40
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 472
    Top = 16
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadoHojaPreparacion: TAction
      Category = 'Listados'
      Caption = 'Listado de Hoja de Preparaci'#243'n'
      ImageIndex = 14
      OnExecute = AListadoHojaPreparacionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfListadoHojaPreparacion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Hoja de Preparaci'#243'n'
      ImageIndex = 77
      OnExecute = AConfListadoHojaPreparacionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 528
    Top = 16
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CEDetalleUbicacion
    SubComplementario = ALMain
    Left = 654
    Top = 8
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 690
    Top = 10
    inherited CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      Visible = False
    end
    inherited CEDetalleMipost: TMenuItem
      Visible = False
    end
    inherited CEDetalleMicancel: TMenuItem
      Visible = False
    end
  end
  object LFActionList1: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 440
    Top = 16
    object ARefrescar: TAction
      Caption = 'Refrescar Datos'
      Hint = 'Refrescar Datos'
      ImageIndex = 26
      OnExecute = ARefrescarExecute
    end
    object AGeneraAlbaran: TAction
      Caption = 'Genera Albaran'
      Hint = 'Genera Albaran'
      ImageIndex = 60
      OnExecute = AGeneraAlbaranExecute
    end
    object AInfoStocks: TAction
      Caption = 'AInfoStocks'
      Hint = 'Informaci'#243'n de Stocks '
      ImageIndex = 1
      ShortCut = 16467
      OnExecute = AInfoStocksExecute
    end
    object AEstadoAtras: TAction
      Caption = 'Retroceder'
      Hint = 'Retroceder Estado'
      ImageIndex = 51
      OnExecute = AEstadoAtrasExecute
    end
    object AEstadoAdelante: TAction
      Caption = 'Avanzar'
      Hint = 'Avanzar Estado'
      ImageIndex = 25
      OnExecute = AEstadoAdelanteExecute
    end
  end
  object CEDetalleUbicacion: TControlEdit
    EnlazadoA = CEMain
    Complementario = PMain
    SubComplementario = ALMain
    PopUpMenu = CEDetalleUbicacionPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 40
  end
  object CEDetalleUbicacionPMEdit: TPopUpTeclas
    Left = 688
    Top = 40
    object CEDetalleUbicacionMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleUbicacionMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleUbicacionMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleUbicacionMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleUbicacionMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleUbicacionMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleUbicacionMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleUbicacionMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleUbicacionMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleUbicacionMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
