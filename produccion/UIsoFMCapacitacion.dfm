inherited IsoFMCapacitacion: TIsoFMCapacitacion
  Left = 454
  Top = 293
  Caption = 'Plan de Capacitaci'#243'n y Polivalencia'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
        Hints.Strings = ()
        EditaControl = DBEFEmpleado
        InsertaControl = DBEFEmpleado
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        object SBAEmpleado: TSpeedButton [0]
          Left = 436
          Top = 16
          Width = 23
          Height = 22
          Hint = 'Doble click o CTtrl+Alt+E para ver los datos del empleado'
          GroupIndex = -1
          ParentShowHint = False
          ShowHint = True
          OnDblClick = SBAEmpleadoDblClick
        end
        object SBASeccion: TSpeedButton [1]
          Left = 436
          Top = 41
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+S para ver datos de la seccion'
          GroupIndex = -1
          ParentShowHint = False
          ShowHint = True
          OnDblClick = SBASeccionDblClick
        end
        inherited PEdit: TLFPanel
          Height = 81
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_CAPACITACION_C'
            CampoNum = 'EMPLEADO'
            CampoStr = 'SECCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'EMPLEADO')
          end
          object LEmpleado: TLFLabel
            Left = 39
            Top = 12
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empleado'
          end
          object LSeccion: TLFLabel
            Left = 47
            Top = 34
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Secci'#243'n'
          end
          object LCapacitacion: TLFLabel
            Left = 303
            Top = 56
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Capacitaci'#243'n'
            FocusControl = DBETotalCapac
          end
          object LTotReal: TLFLabel
            Left = 37
            Top = 56
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Real'
            FocusControl = DBETotalReal
          end
          object LTotPosible: TLFLabel
            Left = 163
            Top = 56
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Posible'
            FocusControl = DBETotalPosible
          end
          object DBETotalCapac: TLFDbedit
            Left = 369
            Top = 52
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'CAPACITACION'
            DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBETotalReal: TLFDbedit
            Left = 91
            Top = 52
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TOTAL_REAL'
            DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBETotalPosible: TLFDbedit
            Left = 228
            Top = 52
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TOTAL_POSIBLE'
            DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEFEmpleado: TLFDBEditFind2000
            Left = 91
            Top = 8
            Width = 29
            Height = 21
            DataField = 'EMPLEADO'
            DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
            TabOrder = 0
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
            OnBusqueda = DBEFEmpleadoBusqueda
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDesEmpleado: TLFDbedit
            Left = 121
            Top = 8
            Width = 312
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = IsoDMCapacitacion.DSxEmpleado
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            OnDblClick = SBAEmpleadoDblClick
          end
          object DBEDescSeccion: TLFDbedit
            Left = 121
            Top = 30
            Width = 312
            Height = 21
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = IsoDMCapacitacion.DSxSeccion
            Enabled = False
            ReadOnly = True
            TabOrder = 3
            OnDblClick = SBASeccionDblClick
          end
          object DBEFSeccion: TLFDBEditFind2000
            Left = 91
            Top = 30
            Width = 29
            Height = 21
            DataField = 'SECCION'
            DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SECCION'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 81
          Width = 490
          Height = 193
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
            Height = 22
            AutoSize = True
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Separators = True
            object NavDet: THYMNavigator
              Left = 0
              Top = 0
              Width = 200
              Height = 22
              DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionD
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
              InsertaUltimo = True
            end
          end
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 490
            Height = 171
            Hint = 'Capacitaci'#243'n s'#243'lo valores entre 0 y 3'
            Align = alClient
            DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionD
            ParentShowHint = False
            ShowHint = True
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
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'TAREA')
            CamposAMostrar.Strings = (
              'TAREA'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'TAREA'
              'CAPACITACION')
            MensajeNoExiste = False
            Numericos.Strings = (
              'LINEA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'OPE_SECCIONES_D')
            Titulos.Strings = (
              'DESCRIPCION')
            Posicion = tpCentrado
            OnBusqueda = DBGFDetalleBusqueda
            OrdenMultiple = True
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TAREA'
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescTarea'
                Width = 288
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CAPACITACION'
                Width = 100
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = IsoDMCapacitacion.DSQMIsoCapacitacionC
          CamposAOrdenar.Strings = (
            'CAPACITACION'
            'EMPLEADO'
            'SECCION'
            'TOTAL_POSIBLE'
            'TOTAL_REAL')
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPLEADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECCION'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPACITACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_REAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_POSIBLE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 316
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 368
    Top = 32
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 424
    Top = 16
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 252
    Top = 227
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 312
    Top = 232
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
  object ALCapacitacion: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 464
    Top = 16
    object AEmpleado: TAction
      Caption = 'AEmpleado'
      Hint = 'CTtrl+Alt+E Mantenimiento de empleados'
      ShortCut = 49221
      OnExecute = AEmpleadoExecute
    end
    object ASeccion: TAction
      Caption = 'ASeccion'
      Hint = 'Ctrl+Alt+S Mantenimiento de sesiones'
      ShortCut = 49235
      OnExecute = ASeccionExecute
    end
  end
end
