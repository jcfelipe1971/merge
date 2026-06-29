inherited IsoFMPlanning: TIsoFMPlanning
  Left = 436
  Top = 203
  Width = 764
  Height = 576
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Planning de Formaci'#243'n'
  FormStyle = fsNormal
  PopupMenu = CEDetall
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 754
    Height = 193
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 750
      inherited NavMain: THYMNavigator
        DataSource = IsoDMPlanning.DSCabPlanning
        Hints.Strings = ()
        EditaControl = LFDBDescrip
        InsertaControl = LFDBDescrip
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
    end
    inherited PCMain: TLFPageControl
      Width = 750
      Height = 163
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 742
          Height = 135
          inherited G2KTableLoc: TG2KTBLoc
            Left = 36
            Top = 2
            DataSource = IsoDMPlanning.DSCabPlanning
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_CAB_PLANNING'
            CampoNum = 'RIG'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LPlanning: TLFLabel
            Left = 26
            Top = 25
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Planning'
          end
          object LFecha: TLFLabel
            Left = 37
            Top = 69
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LTotalCoste: TLFLabel
            Left = 13
            Top = 91
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Coste'
          end
          object LDescripcion: TLFLabel
            Left = 11
            Top = 48
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LEjercicio: TLFLabel
            Left = 137
            Top = 25
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LFDBRig: TLFDbedit
            Left = 71
            Top = 22
            Width = 51
            Height = 21
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = IsoDMPlanning.DSCabPlanning
            TabOrder = 0
          end
          object LFDBFecha: TLFDBDateEdit
            Left = 71
            Top = 66
            Width = 96
            Height = 21
            DataField = 'FECHA'
            DataSource = IsoDMPlanning.DSCabPlanning
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object LFDBTotal: TLFDbedit
            Left = 71
            Top = 88
            Width = 96
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TOTAL_COSTE'
            DataSource = IsoDMPlanning.DSCabPlanning
            ReadOnly = True
            TabOrder = 4
          end
          object LFDBDescrip: TLFDbedit
            Left = 71
            Top = 44
            Width = 505
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMPlanning.DSCabPlanning
            TabOrder = 2
          end
          object GBFirmas: TGroupBox
            Left = 181
            Top = 65
            Width = 254
            Height = 45
            Caption = 'Firmas ISO'
            TabOrder = 5
            object ChkBAprobado: TLFDBCheckBox
              Left = 17
              Top = 19
              Width = 67
              Height = 17
              Caption = 'Aprobado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ISO_APROBADO'
              DataSource = IsoDMPlanning.DSCabPlanning
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object ChkBVerificado: TLFDBCheckBox
              Left = 97
              Top = 19
              Width = 66
              Height = 17
              Caption = 'Verificado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ISO_VERIFICADO'
              DataSource = IsoDMPlanning.DSCabPlanning
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object ChkBValidado: TLFDBCheckBox
              Left = 182
              Top = 19
              Width = 59
              Height = 17
              Caption = 'Validado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ISO_VALIDADO'
              DataSource = IsoDMPlanning.DSCabPlanning
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object LFEjercicio: TLFDbedit
            Left = 181
            Top = 22
            Width = 62
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = IsoDMPlanning.DSCabPlanning
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 742
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLInfoNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 430
            Height = 21
            BevelOuter = bvNone
            TabOrder = 1
            object LFDBRigNotas: TLFDbedit
              Left = 0
              Top = 0
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = IsoDMPlanning.DSCabPlanning
              ReadOnly = True
              TabOrder = 0
            end
            object LFDBDescNotas: TLFDbedit
              Left = 50
              Top = 0
              Width = 377
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DESCRIPCION'
              DataSource = IsoDMPlanning.DSCabPlanning
              ReadOnly = True
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 430
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 438
            Top = 0
            Width = 80
            Height = 21
            DataSource = IsoDMPlanning.DSCabPlanning
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = LFDBNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object LFPanelNotas: TLFPanel
          Left = 0
          Top = 21
          Width = 742
          Height = 114
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LFDBNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 742
            Height = 114
            Align = alClient
            BevelOuter = bvNone
            DataField = 'NOTAS'
            DataSource = IsoDMPlanning.DSCabPlanning
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 742
          Height = 135
          DataSource = IsoDMPlanning.DSCabPlanning
          CamposChecked.Strings = (
            'ISO_APROBADO'
            'ISO_VERIFICADO'
            'ISO_VALIDADO')
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'FECHA'
            'ISO_APROBADO'
            'ISO_VALIDADO'
            'ISO_VERIFICADO'
            'RIG'
            'TOTAL_COSTE')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_APROBADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_VERIFICADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_VALIDADO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 754
  end
  object PNLDetalle: TLFPanel [2]
    Left = 0
    Top = 193
    Width = 754
    Height = 178
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object DBGDetallPlanning: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 754
      Height = 154
      Align = alClient
      DataSource = IsoDMPlanning.DSDetPlanning
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
      BuscarNums = False
      Campos.Strings = (
        'ASISTENTE'
        'ID_CURSO')
      CamposAMostrar.Strings = (
        'ASISTENTE'
        '0'
        'ID_CURSO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      MensajeNoExiste = False
      Numericos.Strings = (
        'EMPLEADO'
        'ID_CURSO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_EMPLEADOS_EF'
        'ISO_CURSOS')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'DESCRIPCION')
      Posicion = tpCentrado
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        '')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
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
          Expanded = False
          FieldName = 'ID_CURSO'
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescCurso'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACCION'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPARTIDOR'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_INICIO'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_FIN'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EVALUACION'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTE'
          Width = 80
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 754
      Height = 24
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 1
      Separators = True
      object NavDetall: THYMNavigator
        Left = 0
        Top = 0
        Width = 200
        Height = 22
        DataSource = IsoDMPlanning.DSDetPlanning
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetall
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGDetallPlanning
        InsertaControl = DBGDetallPlanning
        Exclusivo = True
        OrdenAscendente = True
        InsertaUltimo = True
      end
    end
  end
  object PNLEmp: TLFPanel [3]
    Left = 0
    Top = 371
    Width = 754
    Height = 152
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object TBSubdetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 754
      Height = 24
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 0
      Separators = True
      object NavEmpleado: THYMNavigator
        Left = 0
        Top = 0
        Width = 200
        Height = 22
        DataSource = IsoDMPlanning.DSQMRelEmplCursos
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGRelEmplCurso
        InsertaControl = DBGRelEmplCurso
        Exclusivo = True
        OrdenAscendente = True
        InsertaUltimo = True
      end
    end
    object DBGRelEmplCurso: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 754
      Height = 128
      Align = alClient
      DataSource = IsoDMPlanning.DSQMRelEmplCursos
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGRelEmplCursoDrawColumnCell
      OnDblClick = DBGRelEmplCursoDblClick
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
        'ID_EMPLEADO'
        'APTO')
      CamposAMostrar.Strings = (
        'ID_EMPLEADO'
        '0'
        'APTO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      MensajeNoExiste = False
      Numericos.Strings = (
        'EMPLEADO'
        'ID_RESULTADO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_EMPLEADOS_EF'
        'ISO_EMPL_RESULTADOS')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'NOMBRE')
      Posicion = tpCentrado
      OnBusqueda = DBGRelEmplCursoBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        '')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_EMPLEADO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescEmpleado'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APTO'
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescApto'
          ReadOnly = True
          Width = 200
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    Left = 648
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 684
    Top = 60
  end
  inherited ALMain: TLFActionList
    Left = 688
    Top = 24
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object AlstPlanning: TAction
      Category = 'Listado'
      Caption = 'Listado Planning Formacion'
      ImageIndex = 14
      OnExecute = ALstPlanningExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listado Configuracion'
      Caption = 'Configuraci'#243'n Listados'
      ImageIndex = 77
    end
    object ALstConfigPlanning: TAction
      Category = 'Listado Configuracion'
      Caption = 'Configuraci'#243'n Listado Planning'
      ImageIndex = 77
      OnExecute = ALstConfigPlanningExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntos: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del planning'
      ImageIndex = 59
      OnExecute = AAdjuntosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 648
    Top = 24
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = LFPanelNotas
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 648
    Top = 96
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 688
    Top = 96
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
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PNLDetalle
    Complementario = PMain
    PopUpMenu = CEDetall
    Teclas = DMMain.Teclas
    Left = 648
    Top = 136
  end
  object CEDetall: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 688
    Top = 136
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
