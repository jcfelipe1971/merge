inherited FMNominasCabecera: TFMNominasCabecera
  Left = 206
  Top = 159
  Width = 1508
  Height = 636
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Nominas'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterEmpleados: TSplitter [0]
    Left = 0
    Top = 209
    Width = 1498
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Color = clAppWorkSpace
    ParentColor = False
  end
  inherited PMain: TLFPanel
    Width = 1498
    Height = 209
    Align = alTop
    Constraints.MinHeight = 180
    inherited TBMain: TLFToolBar
      Width = 1494
      inherited NavMain: THYMNavigator
        DataSource = DMNominasCabecera.DSQMNomCab
        Hints.Strings = ()
        EditaControl = DBEFEmpleado
        InsertaControl = DBEFEmpleado
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      object TBSep1: TToolButton
        Left = 339
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TBRecalcularNomina: TToolButton
        Left = 347
        Top = 0
        Action = ARecalcularNomina
      end
      object TBCerrarNomina: TToolButton
        Left = 370
        Top = 0
        Caption = 'Cerrar N'#243'mina'
        ImageIndex = 68
        OnClick = TBCerrarNominaClick
      end
      object PNLFiltroCabecera: TLFPanel
        Left = 393
        Top = 0
        Width = 329
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LPeriodoFiltro: TLFLabel
          Left = 12
          Top = 3
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object EFPeriodoFiltro: TLFEditFind2000
          Left = 53
          Top = 0
          Width = 48
          Height = 21
          MaxLength = 2
          TabOrder = 0
          OnChange = EFPeriodoFiltroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO=1'
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
        object EPeriodoFiltro: TLFEdit
          Left = 102
          Top = 0
          Width = 225
          Height = 21
          Color = clInfoBk
          Enabled = False
          MaxLength = 2
          TabOrder = 1
        end
      end
      object PNLFiltroUsuario: TLFPanel
        Left = 722
        Top = 0
        Width = 475
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LFiltroEmpleado: TLFLabel
          Left = 5
          Top = 4
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Empleado'
        end
        object EFFiltroEmpleado: TLFEditFind2000
          Left = 56
          Top = 0
          Width = 49
          Height = 21
          TabOrder = 0
          OnChange = EFFiltroEmpleadoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EMPLEADO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'ACTIVO = 1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFiltroEmpleado: TLFEdit
          Left = 106
          Top = 0
          Width = 366
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1494
      Height = 179
      inherited TSFicha: TTabSheet
        object SBAEmpleado: TSpeedButton [0]
          Left = 131
          Top = 52
          Width = 317
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAEmpleadoDblClick
        end
        object SBAPeriodo: TSpeedButton [1]
          Left = 576
          Top = 51
          Width = 188
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver las Constantes del Periodo'
          GroupIndex = -1
          OnDblClick = SBAPeriodoDblClick
        end
        object SBVerAsientos: TSpeedButton [2]
          Left = 508
          Top = 99
          Width = 88
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          OnDblClick = SBVerAsientosDblClick
        end
        inherited PEdit: TLFPanel
          Width = 857
          Height = 151
          Align = alLeft
          inherited G2KTableLoc: TG2KTBLoc
            Top = 3
            CamposADesplegar.Strings = (
              'PERIODO')
            Tabla_a_buscar = 'VER_EMP_NOMINAS_CABECERA'
            CampoNum = 'ID'
            CampoStr = 'NOMBRE_R_SOCIAL'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'NOMBRE_R_SOCIAL, PERIODO')
          end
          object LFechaAlta: TLFLabel
            Left = 473
            Top = 51
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
          end
          object LEmpleado: TLFLabel
            Left = 12
            Top = 50
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empleado'
          end
          object LDesdeFecha: TLFLabel
            Left = 493
            Top = 30
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LFechaCobro: TLFLabel
            Left = 648
            Top = 7
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Cobro'
          end
          object LDias: TLFLabel
            Left = 784
            Top = 31
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LNIF: TLFLabel
            Left = 40
            Top = 73
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'DNI'
          end
          object LNroSeguridadSocial: TLFLabel
            Left = 248
            Top = 72
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'N. SS'
          end
          object LCategoria: TLFLabel
            Left = 12
            Top = 94
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Categor'#237'a'
          end
          object LSeccion: TLFLabel
            Left = 237
            Top = 94
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seccion'
          end
          object LFechaAntiguedad: TLFLabel
            Left = 649
            Top = 51
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Antig.'
          end
          object LHastaFecha: TLFLabel
            Left = 660
            Top = 29
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object LEstado: TLFLabel
            Left = 132
            Top = 6
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LFecha: TLFLabel
            Left = 494
            Top = 7
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LNomina: TLFLabel
            Left = 23
            Top = 7
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#243'mina'
          end
          object LNumeroAsiento: TLFLabel
            Left = 240
            Top = 117
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LPeriodo: TLFLabel
            Left = 23
            Top = 28
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodo'
          end
          object LAFP: TLFLabel
            Left = 504
            Top = 73
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'AFP'
          end
          object LISAPRE: TLFLabel
            Left = 485
            Top = 94
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'ISAPRE'
          end
          object LPlanISAPRE: TLFLabel
            Left = 461
            Top = 117
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plan ISAPRE'
          end
          object DBEFEmpleado: TLFDBEditFind2000
            Left = 63
            Top = 47
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'EMPLEADO'
            DataSource = DMNominasCabecera.DSQMNomCab
            TabOrder = 4
            OnChange = DBEFEmpleadoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'EMPLEADO'
              'TITULO'
              'NIF')
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'activo=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBENombreEmpleado: TLFDbedit
            Left = 128
            Top = 47
            Width = 337
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMNominasCabecera.DSQMNomCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBDEDesde: TLFDBDateEdit
            Left = 692
            Top = 25
            Width = 87
            Height = 21
            DataField = 'FECHA_FIN_PERIODO'
            DataSource = DMNominasCabecera.DSQMNomCab
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 16
            Weekends = [Sun, Sat]
            OnChange = DBDEDesdeChange
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 529
            Top = 3
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMNominasCabecera.DSQMNomCab
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 13
            Weekends = [Sun, Sat]
          end
          object DBDEFechaCobro: TLFDBDateEdit
            Left = 692
            Top = 3
            Width = 87
            Height = 21
            DataField = 'FECHA_COBRO'
            DataSource = DMNominasCabecera.DSQMNomCab
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
            Weekends = [Sun, Sat]
          end
          object DBDEHasta: TLFDBDateEdit
            Left = 529
            Top = 25
            Width = 87
            Height = 21
            DataField = 'FECHA_INI_PERIODO'
            DataSource = DMNominasCabecera.DSQMNomCab
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 15
            Weekends = [Sun, Sat]
          end
          object DBDEechaAntiguedad: TLFDBDateEdit
            Left = 692
            Top = 47
            Width = 87
            Height = 21
            TabStop = False
            DataField = 'FECHA'
            DataSource = DMNominasCabecera.DSQMNomCab
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 18
            Weekends = [Sun, Sat]
          end
          object DBENIF: TLFDbedit
            Left = 63
            Top = 69
            Width = 169
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMNominasCabecera.DSQMNomCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBENroSeguridadSocial: TLFDbedit
            Left = 280
            Top = 69
            Width = 185
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'N_SEGURIDAD_SOCIAL'
            DataSource = DMNominasCabecera.DSQMNomCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBECategoria: TLFDbedit
            Left = 63
            Top = 91
            Width = 169
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'CATEGORIA'
            DataSource = DMNominasCabecera.DSQMNomCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBESeccion: TLFDbedit
            Left = 280
            Top = 91
            Width = 185
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'SECCION'
            DataSource = DMNominasCabecera.DSQMNomCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object DBCHKListado: TLFDBCheckBox
            Left = 152
            Top = 117
            Width = 63
            Height = 17
            Caption = 'Listado'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            Layout = checkboxRight
            TabOrder = 11
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'LISTADO'
            DataSource = DMNominasCabecera.DSxInfoActualizada
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETituloEstado: TLFDbedit
            Left = 169
            Top = 3
            Width = 158
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMNominasCabecera.DSxInfoActualizada
            Enabled = False
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object DBEFechaAlta: TLFDbedit
            Left = 529
            Top = 47
            Width = 87
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'FECHA_INGRESO'
            DataSource = DMNominasCabecera.DSQMNomCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object DBID: TLFDbedit
            Left = 63
            Top = 3
            Width = 64
            Height = 21
            DataField = 'ID'
            DataSource = DMNominasCabecera.DSQMNomCab
            TabOrder = 0
            OnChange = DBIDChange
          end
          object DBCHKPagado: TLFDBCheckBox
            Left = 62
            Top = 117
            Width = 63
            Height = 17
            Caption = 'Pagado'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            Layout = checkboxRight
            TabOrder = 10
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'PAGADO'
            DataSource = DMNominasCabecera.DSxInfoActualizada
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBERic: TLFDbedit
            Left = 280
            Top = 113
            Width = 87
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            DataField = 'RIC_CIERRE'
            DataSource = DMNominasCabecera.DSQMNomCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBEFPeriodo: TLFDBEditFind2000
            Left = 63
            Top = 25
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'PERIODO'
            DataSource = DMNominasCabecera.DSQMNomCab
            TabOrder = 2
            OnChange = DBEFPeriodoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PERIODOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'EMPLEADO'
              'TITULO'
              'NIF')
            CampoNum = 'PERIODO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'activo=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'PERIODO')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object EPeriodo: TLFEdit
            Left = 128
            Top = 25
            Width = 337
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            MaxLength = 2
            TabOrder = 3
          end
          object DBEAFP: TLFDBEditFind2000
            Left = 529
            Top = 69
            Width = 87
            Height = 21
            DataField = 'AFP'
            DataSource = DMNominasCabecera.DSQMNomCab
            TabOrder = 19
            OnChange = DBEAFPChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_EQUIVALENCIAS_PREVIRED'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'GLOSA'
            CampoADevolver = 'CODIGO'
            CondicionBusqueda = 'ID_CLASIFICACION=10'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEISAPRE: TLFDBEditFind2000
            Left = 529
            Top = 91
            Width = 87
            Height = 21
            DataField = 'ISAPRE'
            DataSource = DMNominasCabecera.DSQMNomCab
            TabOrder = 21
            OnChange = DBEISAPREChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_EQUIVALENCIAS_PREVIRED'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'GLOSA'
            CampoADevolver = 'CODIGO'
            CondicionBusqueda = 'ID_CLASIFICACION=16'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEPlanISAPRE: TLFDbedit
            Left = 529
            Top = 113
            Width = 87
            Height = 21
            DataField = 'PLAN_ISAPRE'
            DataSource = DMNominasCabecera.DSQMNomCab
            TabOrder = 23
          end
          object EISAPRETitulo: TLFEdit
            Left = 617
            Top = 91
            Width = 236
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HideSelection = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object EAFPTitulo: TLFEdit
            Left = 617
            Top = 69
            Width = 236
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
          end
        end
        object PNLParametros: TLFPanel
          Left = 857
          Top = 0
          Width = 629
          Height = 151
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFParametros: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 629
            Height = 129
            Align = alClient
            DataSource = DMNominasCabecera.DSQMNomDetParametros
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGFParametrosDrawColumnCell
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
            Transaction = DMMain.TLocal
            BuscarNums = False
            Campos.Strings = (
              'CODIGO')
            CamposAMostrar.Strings = (
              'CODIGO'
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
              'CODIGO'
              'GLOSA'
              'IMPORTE'
              'CALCULABLE'
              'ES_TOTAL'
              'ORDEN_IMPRESION')
            ColumnasCheckBoxes.Strings = (
              'CALCULABLE'
              'ES_IMPONIBLE')
            ColumnasChecked.Strings = (
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'CODIGO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'EMP_CONCEPTO_PARAMETROS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'GLOSA')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CODIGO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'GLOSA'
                ReadOnly = True
                Width = 169
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMPORTE'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATO_TEXTO'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATO_FECHA'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN_IMPRESION'
                Visible = True
              end>
          end
          object TBPrametros: TLFToolBar
            Left = 0
            Top = 0
            Width = 629
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Wrapable = False
            Separators = True
            object NavParametros: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 22
              DataSource = DMNominasCabecera.DSQMNomDetParametros
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFParametros
              InsertaControl = DBGFParametros
              Exclusivo = False
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TBSep2: TToolButton
              Left = 220
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBParametrosTodos: TToolButton
              Tag = 1
              Left = 228
              Top = 0
              Hint = 'Ver todos'
              Caption = 'Todos'
              ImageIndex = 23
              ParentShowHint = False
              ShowHint = True
              OnClick = TBVisualizarTodosClick
            end
            object TBParametrosNoCalculados: TToolButton
              Tag = 1
              Left = 251
              Top = 0
              Hint = 'No Calculados'
              Caption = 'No Calculados'
              ImageIndex = 22
              ParentShowHint = False
              ShowHint = True
              OnClick = TBVisualizarNoCaluladosClick
            end
            object TBSep5: TToolButton
              Left = 274
              Top = 0
              Width = 8
              ImageIndex = 23
              Style = tbsSeparator
            end
            object TBVerTotalesParametros: TToolButton
              Tag = 1
              Left = 282
              Top = 0
              Hint = 'Muestra Totales'
              Caption = 'Ver Totales'
              ImageIndex = 105
              ParentShowHint = False
              ShowHint = True
              OnClick = TBVerTotalesTotalesClick
            end
            object LParametros: TLFLabel
              Left = 305
              Top = 0
              Width = 90
              Height = 22
              Alignment = taCenter
              AutoSize = False
              Caption = 'Par'#225'metros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1486
          Height = 151
          DataSource = DMNominasCabecera.DSQMNomCab
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'CERRADO'
            'LISTADO'
            'PAGADO')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'CATEGORIA'
            'CERRADO'
            'CUENTA_PAGO'
            'DEPARTAMENTO'
            'EMPLEADO'
            'ESTADO'
            'FECHA'
            'FECHA_COBRO'
            'FECHA_FIN_PERIODO'
            'FECHA_INI_PERIODO'
            'FECHA_PAGO'
            'ID'
            'IMP_ANTICIPO'
            'IMP_PAGADO'
            'INI_CONTRATO'
            'LISTADO'
            'N_SEGURIDAD_SOCIAL'
            'NIF'
            'NOMBRE_R_SOCIAL'
            'PAGADO'
            'PERCIBIR'
            'PERIODO'
            'RIC_CIERRE'
            'RIC_PAGO'
            'SECCION'
            'TDEDUCCION'
            'TDEVENGO'
            'TERCERO'
            'TITULO_PERIODO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPLEADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_PERIODO'
              Width = 176
              Visible = True
            end>
        end
      end
      object TSOtros: TTabSheet
        Caption = '&Otros'
        ImageIndex = 2
        OnShow = TSOtrosShow
        object PNLOtros: TLFPanel
          Left = 0
          Top = 22
          Width = 1486
          Height = 129
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFirma: TLFLabel
            Left = 32
            Top = 8
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Firma'
          end
          object PNLFirma: TLFPanel
            Left = 63
            Top = 4
            Width = 185
            Height = 85
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 0
            DesignSize = (
              185
              85)
            object ImgFirma: TImage
              Left = 0
              Top = 0
              Width = 185
              Height = 85
              Align = alClient
              Center = True
              Proportional = True
              Stretch = True
            end
            object DBTFirmaNombre: TDBText
              Left = 0
              Top = 59
              Width = 185
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              Color = clBtnFace
              DataField = 'NOMBRE'
              DataSource = DMNominasCabecera.DSQMFirmas
              ParentColor = False
              Transparent = True
            end
            object DBTNIFFirma: TDBText
              Left = 0
              Top = 72
              Width = 185
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              DataField = 'NIF'
              DataSource = DMNominasCabecera.DSQMFirmas
              Transparent = True
            end
          end
        end
        object TBOtros: TLFToolBar
          Left = 0
          Top = 0
          Width = 1486
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
          Separators = True
          object PNLInfoOtros: TLFPanel
            Left = 0
            Top = 0
            Width = 563
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LOtrosIdNomina: TLFLabel
              Left = 11
              Top = 3
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object LOtrosNombre: TLFLabel
              Left = 116
              Top = 3
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre'
            end
            object LOtrosFecha: TLFLabel
              Left = 435
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object DBEOtrosNombre: TLFDbedit
              Left = 158
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMNominasCabecera.DSQMNomCab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEOrosIdNomina: TLFDbedit
              Left = 24
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ID'
              DataSource = DMNominasCabecera.DSQMNomCab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBDEOtrosFechaCab: TLFDBDateEdit
              Left = 470
              Top = 0
              Width = 87
              Height = 21
              DataField = 'FECHA'
              DataSource = DMNominasCabecera.DSQMNomCab
              CheckOnExit = True
              Color = clInfoBk
              NumGlyphs = 2
              TabOrder = 2
              Weekends = [Sun, Sat]
            end
          end
          object TBBorrarFirma: TToolButton
            Left = 563
            Top = 0
            Hint = 'Borrar Firma'
            Caption = 'Borrar Firma'
            ImageIndex = 20
            OnClick = TBBorrarFirmaClick
          end
        end
      end
      object TSNotas: TTabSheet
        Caption = '&Notas'
        ImageIndex = 3
        OnShow = TSNotasShow
        object PCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 1486
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object NavNotas: THYMNavigator
            Left = 565
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMNominasCabecera.DSQMNomCab
            VisibleButtons = [nbEdit, nbPost, nbCancel]
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
          object LFPanel1: TLFPanel
            Left = 0
            Top = 0
            Width = 563
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object LNotasIdNomina: TLFLabel
              Left = 11
              Top = 3
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object LNotasNombre: TLFLabel
              Left = 116
              Top = 3
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre'
            end
            object LNotasFecha: TLFLabel
              Left = 435
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object DBENotasNombre: TLFDbedit
              Left = 158
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMNominasCabecera.DSQMNomCab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBENotasIdNomina: TLFDbedit
              Left = 24
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ID'
              DataSource = DMNominasCabecera.DSQMNomCab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBDENotasFecha: TLFDBDateEdit
              Left = 470
              Top = 0
              Width = 87
              Height = 21
              DataField = 'FECHA'
              DataSource = DMNominasCabecera.DSQMNomCab
              CheckOnExit = True
              Color = clInfoBk
              NumGlyphs = 2
              TabOrder = 2
              Weekends = [Sun, Sat]
            end
          end
        end
        object DBRENotas: TDBRichEdit
          Left = 0
          Top = 22
          Width = 1486
          Height = 50
          Align = alClient
          DataField = 'NOTAS'
          DataSource = DMFacturas.DSQMCabecera
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          PlainText = True
          TabOrder = 1
        end
        object DBRENotasInternasKri: TDBRichEdit
          Left = 0
          Top = 72
          Width = 1486
          Height = 79
          Align = alBottom
          Color = clMoneyGreen
          DataField = 'NOTAS_INTERNAS_KRI'
          DataSource = DMFacturas.DSQMCabecera
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          PlainText = True
          TabOrder = 2
        end
      end
      object TSPagos: TTabSheet
        Caption = 'Pagos'
        ImageIndex = 4
        object LFTBPagos: TLFToolBar
          Left = 0
          Top = 0
          Width = 1486
          Height = 22
          AutoSize = True
          ButtonWidth = 25
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavPagos: THYMNavigator
            Left = 0
            Top = 0
            Width = 216
            Height = 22
            DataSource = DMNominasCabecera.DSQPagos
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object Separador1: TToolButton
            Left = 216
            Top = 0
            Width = 8
            Caption = 'Separador1'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object LFPBanco: TLFPanel
            Left = 224
            Top = 0
            Width = 337
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object LEntidadEmpleado: TLFLabel
              Left = 14
              Top = 3
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Banco'
            end
            object EFBanco: TLFEditFind2000
              Left = 48
              Top = 0
              Width = 49
              Height = 21
              TabOrder = 0
              OnChange = EFBancoChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'BANCO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'ACTIVO = 1'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'BANCO')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloBanco: TLFEdit
              Left = 98
              Top = 0
              Width = 231
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
            end
          end
          object TBMarcarTodos: TToolButton
            Left = 561
            Top = 0
            Hint = 'Marcar Todos'
            Caption = 'TBMarcarTodos'
            ImageIndex = 146
            OnClick = TBMarcarTodosClick
          end
          object TBDesmarcarTodos: TToolButton
            Left = 586
            Top = 0
            Hint = 'Desmarcar Todos'
            Caption = 'TBDesmarcarTodos'
            ImageIndex = 147
            OnClick = TBDesmarcarTodosClick
          end
          object Separador2: TToolButton
            Left = 611
            Top = 0
            Width = 8
            Caption = 'Separador2'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object TBContabilizarPagos: TToolButton
            Left = 619
            Top = 0
            Hint = 'Contabiliza Pagos'
            Caption = 'TBContabilizarPagos'
            ImageIndex = 68
            OnClick = TBContabilizarPagosClick
          end
          object TBDespagarPagos: TToolButton
            Left = 644
            Top = 0
            Hint = 'Despagar Pagos'
            Caption = 'Revertir Pago'
            ImageIndex = 67
            OnClick = TBDespagarPagosClick
          end
          object LTotalBanco: TLFLabel
            Left = 669
            Top = 0
            Width = 70
            Height = 22
            Alignment = taRightJustify
            Caption = 'Total Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBETotalBanco: TLFDbedit
            Left = 739
            Top = 0
            Width = 143
            Height = 22
            Color = clInfoBk
            DataField = 'TOTAL_LIQUIDO_BANCO'
            DataSource = DMNomConstantes.DSQPagos
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object DBGPagos: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1486
          Height = 129
          Align = alClient
          DataSource = DMNominasCabecera.DSQPagos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGFDetalleDrawColumnCell
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
          Transaction = DMNominasCabecera.TLocal
          BuscarNums = False
          Campos.Strings = (
            'CUENTA_PAGO')
          CamposAMostrar.Strings = (
            'CUENTA_PAGO'
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
            'MARCA'
            'PAGADO'
            'ENTRADA_AGRUPACION'
            'LISTADO')
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
            'CUENTA_CC')
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_BANCOS_CUENTAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGPagosBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'TITULO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ENTRADA_AGRUPACION'
              Width = 38
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PAGADO'
              ReadOnly = True
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NIF'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MOD_PAGO'
              ReadOnly = True
              Width = 63
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CTA_EMPLEADO'
              ReadOnly = True
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_PAGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PAGO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CORREO'
              ReadOnly = True
              Width = 211
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PERIODO'
              ReadOnly = True
              Width = 177
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              ReadOnly = True
              Width = 44
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIC_PAGO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO_PAGO'
              ReadOnly = True
              Width = 63
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTADO'
              ReadOnly = True
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 583
    Width = 1498
    ButtonWidth = 43
  end
  object PDetalle: TLFPanel [3]
    Left = 0
    Top = 217
    Width = 1498
    Height = 366
    Align = alClient
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 1
      Top = 1
      Width = 1496
      Height = 364
      ActivePage = TSDetalle
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSDetalle: TTabSheet
        Caption = 'Detalle'
        object PNLDetalle: TLFPanel
          Left = 0
          Top = 0
          Width = 1488
          Height = 336
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 1488
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 22
              DataSource = DMNominasCabecera.DSQMNomDet
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFDetalle
              InsertaControl = DBGFDetalle
              Exclusivo = False
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TBSep8: TToolButton
              Left = 220
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object PNLDetalleResumido: TLFPanel
              Left = 228
              Top = 0
              Width = 125
              Height = 22
              BevelOuter = bvNone
              TabOrder = 1
              object CBDetalleResumido: TLFCheckBox
                Left = 5
                Top = 2
                Width = 121
                Height = 17
                Caption = 'Detalle Resumido'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
                OnChange = CBDetalleResumidoChange
              end
            end
          end
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 1488
            Height = 293
            Align = alClient
            DataSource = DMNominasCabecera.DSQMNomDet
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGFDetalleDrawColumnCell
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
              'CONCEPTO')
            CamposAMostrar.Strings = (
              'CONCEPTO'
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
              'SUJETO_SEG_SOCIAL')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'CONCEPTO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_NOMINA_CONCEPTOS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'DESCRIPCION')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CONCEPTO'
              '')
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONCEPTO'
                Width = 120
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESCRIPCION'
                ReadOnly = True
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEVENGO'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEDUCCION'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANTIDAD'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMPORTE'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUJETO_SEG_SOCIAL'
                Width = 92
                Visible = True
              end>
          end
          object PNLPie: TLFPanel
            Left = 0
            Top = 315
            Width = 1488
            Height = 21
            Align = alBottom
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            DesignSize = (
              1488
              21)
            object LTotalDevengo: TLFLabel
              Left = 1005
              Top = 4
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'T. Devengo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object LTotalDeduccion: TLFLabel
              Left = 1171
              Top = 4
              Width = 78
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'T. Deduccion'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object LTotalAPercibir: TLFLabel
              Left = 1354
              Top = 4
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'Percibir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object DBETotalPercibir: TLFDbedit
              Left = 1402
              Top = 0
              Width = 86
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'PERCIBIR'
              DataSource = DMNominasCabecera.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBETotalDevego: TLFDbedit
              Left = 1077
              Top = 0
              Width = 86
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'TDEVENGO'
              DataSource = DMNominasCabecera.DSxInfoActualizada
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
            object DBETotalDeduccion: TLFDbedit
              Left = 1253
              Top = 0
              Width = 86
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'TDEDUCCION'
              DataSource = DMNominasCabecera.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
        end
      end
      object TSDetalleChile: TTabSheet
        Caption = 'Detalle'
        ImageIndex = 3
        object PNLDetalleChile: TLFPanel
          Left = 0
          Top = 0
          Width = 1488
          Height = 336
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLDetalleChileResize
          object SplitterRight: TSplitter
            Left = 513
            Top = 0
            Width = 8
            Height = 315
            Cursor = crHSplit
            Color = clAppWorkSpace
            ParentColor = False
            OnMoved = SplitterRightMoved
          end
          object PNLHaberes: TLFPanel
            Left = 0
            Top = 0
            Width = 513
            Height = 315
            Align = alLeft
            BevelOuter = bvNone
            Constraints.MinWidth = 400
            TabOrder = 0
            object DBGFHaberes: TDBGridFind2000
              Left = 0
              Top = 22
              Width = 513
              Height = 293
              Align = alClient
              DataSource = DMNominasCabecera.DSQMNomDetHaberes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGFHaberesCellClick
              OnDrawColumnCell = DBGFHaberesDrawColumnCell
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
              Transaction = DMMain.TLocal
              BuscarNums = False
              Campos.Strings = (
                'CODIGO')
              CamposAMostrar.Strings = (
                'CODIGO'
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
                'CODIGO'
                'GLOSA'
                'IMPORTE'
                'CALCULABLE'
                'ES_TOTAL'
                'ORDEN_IMPRESION')
              ColumnasCheckBoxes.Strings = (
                'CALCULABLE'
                'ES_IMPONIBLE')
              ColumnasChecked.Strings = (
                '1'
                '1')
              ColumnasNoChecked.Strings = (
                '0'
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'CODIGO')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'EMP_CONCEPTO_HABERES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'GLOSA')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'CODIGO')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'GLOSA'
                  ReadOnly = True
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
                  Width = 100
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ES_IMPONIBLE'
                  ReadOnly = True
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDEN_IMPRESION'
                  Visible = True
                end>
            end
            object TBHaberes: TLFToolBar
              Left = 0
              Top = 0
              Width = 513
              Height = 22
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Wrapable = False
              Separators = True
              object NavHaberes: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMNominasCabecera.DSQMNomDetHaberes
                Flat = True
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFHaberes
                InsertaControl = DBGFHaberes
                Exclusivo = False
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object TBSep3: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TBHaberesTodos: TToolButton
                Tag = 2
                Left = 228
                Top = 0
                Hint = 'Todos'
                Caption = 'Todos'
                ImageIndex = 23
                ParentShowHint = False
                ShowHint = True
                OnClick = TBVisualizarTodosClick
              end
              object TBHaberesNoCalculados: TToolButton
                Tag = 2
                Left = 251
                Top = 0
                Hint = 'No Calculados'
                Caption = 'No Calculados'
                ImageIndex = 22
                ParentShowHint = False
                ShowHint = True
                OnClick = TBVisualizarNoCaluladosClick
              end
              object TBSep7: TToolButton
                Left = 274
                Top = 0
                Width = 8
                ImageIndex = 23
                Style = tbsSeparator
              end
              object TBVerTotalesHaberes: TToolButton
                Tag = 2
                Left = 282
                Top = 0
                Hint = 'Muestra Totales'
                Caption = 'Ver Totales'
                ImageIndex = 105
                ParentShowHint = False
                ShowHint = True
                OnClick = TBVerTotalesTotalesClick
              end
              object LHaberes: TLFLabel
                Left = 305
                Top = 0
                Width = 90
                Height = 22
                Alignment = taCenter
                AutoSize = False
                Caption = 'Haberes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
            end
          end
          object PNLDescuentos: TLFPanel
            Left = 521
            Top = 0
            Width = 967
            Height = 315
            Align = alClient
            BevelOuter = bvNone
            Constraints.MinWidth = 400
            TabOrder = 1
            object TBDetalleDescuentos: TLFToolBar
              Left = 0
              Top = 0
              Width = 967
              Height = 22
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Wrapable = False
              Separators = True
              object NavDescuentos: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFDescuentos
                InsertaControl = DBGFDescuentos
                Exclusivo = False
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object TBSep4: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TBDescuentosTodos: TToolButton
                Tag = 3
                Left = 228
                Top = 0
                Hint = 'Todos'
                Caption = 'Todos'
                ImageIndex = 23
                ParentShowHint = False
                ShowHint = True
                OnClick = TBVisualizarTodosClick
              end
              object TBDescuentosNoCalculados: TToolButton
                Tag = 3
                Left = 251
                Top = 0
                Hint = 'No Calculados'
                Caption = 'No Calculados'
                ImageIndex = 22
                ParentShowHint = False
                ShowHint = True
                OnClick = TBVisualizarNoCaluladosClick
              end
              object TBSep6: TToolButton
                Left = 274
                Top = 0
                Width = 8
                ImageIndex = 23
                Style = tbsSeparator
              end
              object TBVerTotalesDescuentos: TToolButton
                Tag = 3
                Left = 282
                Top = 0
                Hint = 'Muestra Totales'
                Caption = 'Ver Totales'
                ImageIndex = 105
                ParentShowHint = False
                ShowHint = True
                OnClick = TBVerTotalesTotalesClick
              end
              object LDescuentos: TLFLabel
                Left = 305
                Top = 0
                Width = 90
                Height = 22
                Alignment = taCenter
                AutoSize = False
                Caption = 'Descuentos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
            end
            object DBGFDescuentos: TDBGridFind2000
              Left = 0
              Top = 22
              Width = 967
              Height = 293
              Align = alClient
              DataSource = DMNominasCabecera.DSQMNomDetDescuentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGFDescuentosCellClick
              OnDrawColumnCell = DBGFDescuentosDrawColumnCell
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
                'CODIGO')
              CamposAMostrar.Strings = (
                'CODIGO'
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
                'CODIGO'
                'GLOSA'
                'IMPORTE'
                'CALCULABLE'
                'ES_TOTAL'
                'ORDEN_IMPRESION')
              ColumnasCheckBoxes.Strings = (
                'CALCULABLE'
                'ES_PERSONAL')
              ColumnasChecked.Strings = (
                '1'
                '1')
              ColumnasNoChecked.Strings = (
                '0'
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'CODIGO')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'EMP_CONCEPTO_DESCUENTOS')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'GLOSA')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'CODIGO')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'GLOSA'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
                  Width = 100
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ES_PERSONAL'
                  ReadOnly = True
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDEN_IMPRESION'
                  Visible = True
                end>
            end
          end
          object PPieGenerico: TLFPanel
            Left = 0
            Top = 315
            Width = 1488
            Height = 21
            Align = alBottom
            BevelOuter = bvNone
            BorderWidth = 2
            Enabled = False
            TabOrder = 2
            DesignSize = (
              1488
              21)
            object LPieTHaberes: TLFLabel
              Left = 1034
              Top = 4
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'Haberes'
              Layout = tlCenter
            end
            object LPieLiquido: TLFLabel
              Left = 1355
              Top = 3
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'L'#237'quido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object LPieTDescuentos: TLFLabel
              Left = 1191
              Top = 3
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'Descuentos'
              Layout = tlCenter
            end
            object LFormula: TLFLabel
              Left = 2
              Top = 2
              Width = 5
              Height = 17
              Align = alLeft
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object DBETHaberes: TLFDbedit
              Left = 1077
              Top = 0
              Width = 86
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'IMPORTEH012'
              DataSource = DMNominasCabecera.DSxInfoActualizadaDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBELiquido: TLFDbedit
              Left = 1402
              Top = 0
              Width = 86
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'IMPORTEH020'
              DataSource = DMNominasCabecera.DSxInfoActualizadaDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBETDescuentos: TLFDbedit
              Left = 1253
              Top = 0
              Width = 86
              Height = 21
              Anchors = [akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'IMPORTED017'
              DataSource = DMNominasCabecera.DSxInfoActualizadaDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 408
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 444
  end
  inherited ALMain: TLFActionList
    Left = 616
    Top = 24
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
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object ALstNominas: TAction
      Category = 'Listados'
      Caption = 'Listado Nominas'
      Hint = 'Listado Nominas'
      ImageIndex = 14
      OnExecute = ALstNominasExecute
    end
    object AConfLstNominas: TAction
      Category = 'Listados'
      Caption = 'Configuracion rapida de Listado de Nominas'
      Hint = 'Configuracion rapida de Listado de Nominas'
      ImageIndex = 77
      OnExecute = AConfLstNominasExecute
    end
    object AAdjuntoNomina: TAction
      Category = 'Adjuntos'
      Caption = 'Adjunto de Nomina'
      Hint = 'Adjunto de Nomina'
      ImageIndex = 59
      OnExecute = AAdjuntoNominaExecute
    end
    object AAdjuntoEmpleado: TAction
      Category = 'Adjuntos'
      Caption = 'Adjunto de Empleado'
      Hint = 'Adjunto de Empleado'
      ImageIndex = 59
      OnExecute = AAdjuntoEmpleadoExecute
    end
    object ARecalcularNomina: TAction
      Category = 'Procesos'
      Caption = 'Recalcular Nomina'
      Hint = 'Recalcular Nomina Actual'
      ImageIndex = 3
      OnExecute = ARecalcularNominaExecute
    end
    object AExportarExcel: TAction
      Category = 'Listados'
      Caption = 'Exportar a Excel'
      Hint = 'Exportar N'#243'mina a Excel'
      ImageIndex = 105
      OnExecute = AExportarExcelExecute
    end
    object AExportarExcel2: TAction
      Category = 'Listados'
      Caption = 'Exportar a Excel 2'
      Hint = 'Exportar N'#243'mina a Excel'
      ImageIndex = 105
      OnExecute = AExportarExcel2Execute
    end
    object ALibroRemuneraciones: TAction
      Category = 'Listados'
      Caption = 'Libro de Remuneraciones'
      Hint = 'Libro de Remuneraciones'
      ImageIndex = 105
      OnExecute = ALibroRemuneracionesExecute
    end
    object AEnviarNominaCorreo: TAction
      Category = 'Listados'
      Caption = 'Enviar N'#243'mina por Correo'
      Hint = 'Envia N'#243'mina por Correo'
      ImageIndex = 34
      OnExecute = AEnviarNominaCorreoExecute
    end
    object AImportarExcel: TAction
      Category = 'Procesos'
      Caption = 'Importar n'#243'minas desde Excel'
      Hint = 'Importar n'#243'minas desde Excel'
      ImageIndex = 49
      OnExecute = AImportarExcelExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'PMain.Height'
      'CBDetalleResumido.Checked')
    Left = 688
    Top = 40
  end
end
