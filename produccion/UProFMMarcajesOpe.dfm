inherited ProFMMarcajesOpe: TProFMMarcajesOpe
  Left = 417
  Top = 172
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes Operario'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 177
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = ProDMMarcajesOpe.DSQMProCabMarca
        Hints.Strings = ()
        EditaControl = DBEFOperario
        InsertaControl = DBEFOperario
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 147
      inherited TSFicha: TTabSheet
        object SBAOperario: TSpeedButton [0]
          Left = 145
          Top = 28
          Width = 65
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+E para ver los datos del Empleado'
          GroupIndex = -1
          OnDblClick = SBAOperarioDblClick
        end
        inherited PEdit: TLFPanel
          Width = 578
          Height = 119
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              ' ')
            CamposADesplegar.Strings = (
              'FECHA')
            DataSource = ProDMMarcajesOpe.DSQMProCabMarca
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_ORD_CAB_MARCA'
            CampoNum = 'RIG'
            CampoStr = 'OPERARIO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LOperario: TLFLabel
            Left = 26
            Top = 33
            Width = 40
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Operario'
          end
          object LFecha: TLFLabel
            Left = 26
            Top = 55
            Width = 40
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Fecha'
          end
          object LTotalHoras: TLFLabel
            Left = 176
            Top = 55
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total h. Lab.'
            FocusControl = DBETotalHoras
          end
          object LMarcaje: TLFLabel
            Left = 28
            Top = 11
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Marcaje'
            FocusControl = DBEMarcaje
          end
          object DBEFOperario: TLFDBEditFind2000
            Left = 71
            Top = 29
            Width = 98
            Height = 21
            Color = clWhite
            DataField = 'OPERARIO'
            DataSource = ProDMMarcajesOpe.DSQMProCabMarca
            TabOrder = 0
            OnChange = DBEFOperarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
            Tabla_asociada.CampoCodigo = 'EMPLEADO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescOperario: TLFEdit
            Left = 170
            Top = 29
            Width = 353
            Height = 21
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
            OnDblClick = SBAOperarioDblClick
          end
          object DBDateTimePicker4: TLFDBDateEdit
            Left = 71
            Top = 51
            Width = 98
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMMarcajesOpe.DSQMProCabMarca
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBETotalHoras: TLFDbedit
            Left = 240
            Top = 51
            Width = 89
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIEMPO_TOT'
            DataSource = ProDMMarcajesOpe.DSQMProCabMarca
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
          object DBEMarcaje: TLFDbedit
            Left = 71
            Top = 7
            Width = 98
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = ProDMMarcajesOpe.DSQMProCabMarca
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 119
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescripOpe'
              Width = 266
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_TOT'
              Width = 73
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 177
    Width = 590
    Height = 221
    inherited TBDetalle: TLFToolBar
      Width = 590
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 200
        DataSource = ProDMMarcajesOpe.DSQMProDetMarca
        Hints.Strings = ()
        Exclusivo = True
        InsertaUltimo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 163
      DataSource = ProDMMarcajesOpe.DSQMProDetMarca
      OnColEnter = DBGFDetalleColEnter
      OnColExit = DBGFDetalleColExit
      OnDblClick = DBGFDetalleDblClick
      IniStorage = FSMain
      ColumnaInicial = 1
      AutoCambiarColumna = True
      Transaction = ProDMMarcajesOpe.TLocal
      Campos.Strings = (
        'LINEA_FASE'
        'LINEA_TAREA'
        'RECURSO'
        'RIG_OF'
        'IDTAREA'
        'IMPUTACION')
      CamposAMostrar.Strings = (
        'LINEA_FASE'
        '0'
        'LINEA_TAREA'
        '0'
        'RECURSO'
        '0'
        'RIG_OF'
        '0'
        'IDTAREA'
        '3'
        'COMPUESTO'
        'EJERCICIO'
        'RIG_OF'
        'IMPUTACION'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1'
        '1')
      ColumnasCheckBoxes.Strings = (
        'ESTADO'
        'NO_PRODUCTIVA')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      Numericos.Strings = (
        'LINEA_FASE'
        'LINEA_TAREA'
        'RECURSO'
        'RIG_OF'
        'IDENTIFICADOR'
        'IMPUTACION')
      Tablas.Strings = (
        'PRO_ORD_FASES'
        'PRO_ORD_TAREA'
        'PRO_RECURSOS'
        'PRO_ORD'
        'PRO_VER_TAREAS_ABIERTAS'
        'OPE_EMPLEADO_PRE')
      Acciones.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'FASE'
        'TAREA'
        'TITULO'
        'ESCANDALLO'
        'TAREA'
        'ID_ORDEN'
        'COMPUESTO'
        'RECURSO'
        'DESCRIPCION')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        'LINEA_FASE'
        'LINEA_TAREA'
        'RECURSO'
        'RIG_OF'
        'IDENTIFICADOR'
        'IMPUTACION')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDTAREA'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_ORDEN'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG_OF'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_FASE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCRIPCION_FASE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 197
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_TAREA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCRIPCION_TAREA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 193
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_INICIO'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_FIN'
          Width = 54
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIEMPO'
          ReadOnly = True
          Width = 58
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIEMPO_DEC'
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
          FieldName = 'RECURSO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_REC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_RECURSO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_RECURSO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_FAB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPUTACION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_IMP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NO_PRODUCTIVA'
          Visible = True
        end>
    end
    object DBMNotas: TLFDBMemo
      Left = 0
      Top = 185
      Width = 590
      Height = 36
      Align = alBottom
      DataField = 'NOTAS'
      DataSource = ProDMMarcajesOpe.DSQMProDetMarca
      TabOrder = 2
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    Left = 348
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 400
    Top = 80
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 472
    Top = 120
  end
  inherited CEDetalle: TControlEdit
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    Left = 352
    Top = 104
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 400
    Top = 128
  end
  object ALOperario: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 520
    Top = 120
    object AAOperario: TAction
      Caption = 'AAOperario'
      OnExecute = AAOperarioExecute
    end
  end
end
