inherited FMPresenciaProcesaMarcajes: TFMPresenciaProcesaMarcajes
  Left = 201
  Top = 153
  Width = 1284
  Height = 395
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes temporales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1274
    Height = 342
    object Splitter: TSplitter [0]
      Left = 2
      Top = 272
      Width = 1270
      Height = 8
      Cursor = crVSplit
      Align = alBottom
      Color = clMedGray
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 1270
      inherited NavMain: THYMNavigator
        DataSource = DMPresenciaProcesaMarcajes.DSQMDetalle
        Hints.Strings = ()
        EditaControl = DBDetalle
        InsertaControl = DBDetalle
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
      end
      object TBSep01: TToolButton
        Left = 303
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBDesmarcar: TToolButton
        Left = 311
        Top = 0
        Hint = 'Desmarcar'
        Caption = 'Desmarcar'
        ImageIndex = 147
        OnClick = TBDesmarcarClick
      end
      object TBMarcar: TToolButton
        Left = 334
        Top = 0
        Hint = 'Marcar'
        Caption = 'Marcar'
        ImageIndex = 146
        OnClick = TBMarcarClick
      end
      object TSep02: TToolButton
        Left = 357
        Top = 0
        Width = 8
        ImageIndex = 147
        Style = tbsSeparator
      end
      object TBProcesar: TToolButton
        Left = 365
        Top = 0
        Hint = 'Procesar'
        Caption = 'Procesar'
        ImageIndex = 94
        OnClick = TBProcesarClick
      end
    end
    object PNLCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 1270
      Height = 244
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLFiltros: TLFPanel
        Left = 0
        Top = 0
        Width = 1270
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LFechaDesde: TLFLabel
          Left = 10
          Top = 7
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LFechaHasta: TLFLabel
          Left = 13
          Top = 29
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LDesdeOperario: TLFLabel
          Left = 293
          Top = 7
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Operario'
        end
        object LHastaOperario: TLFLabel
          Left = 296
          Top = 29
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Operario'
        end
        object DEFechaDesde: TLFDateEdit
          Left = 78
          Top = 3
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = ChangeFiltro
        end
        object DEFechaHasta: TLFDateEdit
          Left = 78
          Top = 25
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = ChangeFiltro
        end
        object EFDesdeOperario: TLFEditFind2000
          Left = 370
          Top = 3
          Width = 54
          Height = 21
          TabOrder = 2
          OnChange = EFDesdeOperarioChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'ID_EMPLEADO'
          CampoNum = 'ID_EMPLEADO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_EMPLEADOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EDesdeOperario: TLFEdit
          Left = 425
          Top = 3
          Width = 208
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
          TabOrder = 3
        end
        object EFHastaOperario: TLFEditFind2000
          Left = 370
          Top = 25
          Width = 54
          Height = 21
          TabOrder = 4
          OnChange = EFHastaOperarioChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'ID_EMPLEADO'
          CampoNum = 'ID_EMPLEADO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_EMPLEADOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EHastaOperario: TLFEdit
          Left = 425
          Top = 25
          Width = 208
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
          TabOrder = 5
        end
        object CBSoloPendientes: TCheckBox
          Left = 640
          Top = 5
          Width = 161
          Height = 17
          Caption = 'Solo Marcajes Pendientes'
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = ChangeFiltro
        end
        object BMesAnterio: TButton
          Left = 166
          Top = 25
          Width = 31
          Height = 22
          Caption = '<<'
          TabOrder = 7
          OnClick = BMesAnterioClick
        end
        object BEjercicio: TButton
          Left = 166
          Top = 2
          Width = 31
          Height = 22
          Caption = 'A'#241'o'
          TabOrder = 8
          OnClick = BEjercicioClick
        end
        object BMes: TButton
          Left = 198
          Top = 2
          Width = 31
          Height = 22
          Caption = 'Mes'
          TabOrder = 9
          OnClick = BMesClick
        end
        object BHoy: TButton
          Left = 230
          Top = 2
          Width = 31
          Height = 22
          Caption = 'Hoy'
          TabOrder = 10
          OnClick = BHoyClick
        end
        object BMesSiguiente: TButton
          Left = 230
          Top = 25
          Width = 31
          Height = 22
          Caption = '>>'
          TabOrder = 11
          OnClick = BMesSiguienteClick
        end
      end
      object PNLDetalle: TLFPanel
        Left = 0
        Top = 49
        Width = 1270
        Height = 195
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBDetalle: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1270
          Height = 195
          Align = alClient
          Color = clInfoBk
          DataSource = DMPresenciaProcesaMarcajes.DSQMDetalle
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBDetalleDrawColumnCell
          IniStorage = FSMain
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
          Transaction = DMPresenciaProcesaMarcajes.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ID_INCIDENCIA')
          CamposAMostrar.Strings = (
            'ID_INCIDENCIA'
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
            'ENTRADA_AGRUPACION')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ID_INCIDENCIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'PRO_SYS_TIPO_INCIDENCIA')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'DESCRIPCION')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ID_INCIDENCIA')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ENTRADA_AGRUPACION'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ESTADO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_MARCAJE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_MARCAJE'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_EMPLEADO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_EMPLEADO'
              Width = 150
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'ID_INCIDENCIA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_INCIDENCIA'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ERROR_AL_PROCESAR'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LATITUD'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LONGITUD'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO_CREACION'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CREACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO_MODIFICACION'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_MODIFICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO_MODIFICACION'
              Width = 200
              Visible = True
            end
            item
              Color = clLime
              Expanded = False
              FieldName = 'IDENTIFICADOR_EMPLEADO'
              Width = 100
              Visible = True
            end
            item
              Color = clLime
              Expanded = False
              FieldName = 'IDENTIFICADOR_DISPOSITIVO'
              Width = 100
              Visible = True
            end
            item
              Color = clLime
              Expanded = False
              FieldName = 'IDENTIFICADOR_INCIDENCIA'
              Width = 100
              Visible = True
            end
            item
              Color = clLime
              Expanded = False
              FieldName = 'IDENTIFICADOR_TIPO_MARCAJE'
              Width = 100
              Visible = True
            end>
        end
      end
    end
    object PNLImportacionMarcajes: TLFPanel
      Left = 2
      Top = 280
      Width = 1270
      Height = 60
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LImportacionMarcajes: TLFLabel
        Left = 0
        Top = 47
        Width = 1270
        Height = 13
        Align = alBottom
        Visible = False
      end
      object MImportacionMarcajes: TLFMemo
        Left = 23
        Top = 0
        Width = 1247
        Height = 47
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object TBImportacionMarcajes: TLFToolBar
        Left = 0
        Top = 0
        Width = 23
        Height = 47
        Align = alLeft
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Wrapable = False
        Separators = True
        object TButtImportacionMarcajes: TToolButton
          Left = 0
          Top = 2
          Hint = 'Importacion Marcajes'
          Caption = 'TButtImportacionMarcajes'
          ImageIndex = 49
          OnClick = TButtImportacionMarcajesClick
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 342
    Width = 1274
  end
  inherited CEMain: TControlEdit
    Left = 408
    Top = 148
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Images = DMMain.ILMain_Ac
    Left = 444
    Top = 148
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 536
    Top = 144
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'PNLCabecera.Height')
    Left = 576
    Top = 144
  end
end
