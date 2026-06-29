inherited ProFMTareas: TProFMTareas
  Left = 358
  Top = 175
  Width = 570
  Height = 432
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Tareas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 560
    Height = 379
    inherited TBMain: TLFToolBar
      Width = 556
      inherited NavMain: THYMNavigator
        DataSource = ProDMTareas.DSQMProSysTareas
        Hints.Strings = ()
        EditaControl = DBETarea
        InsertaControl = DBETarea
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBETarea
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 556
      Height = 349
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 548
          Height = 321
          inherited G2KTableLoc: TG2KTBLoc
            Left = 14
            Top = 14
            Plan.Strings = (
              'PLAN (PRO_SYS_TAREAS NATURAL)')
            DataSource = ProDMTareas.DSQMProSysTareas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TAREA')
          end
          object LTarea: TLFLabel
            Left = 34
            Top = 17
            Width = 28
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tarea'
            FocusControl = DBETarea
          end
          object LTitulo: TLFLabel
            Left = 34
            Top = 40
            Width = 28
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LFase: TLFLabel
            Left = 39
            Top = 61
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LCentroTrabajo: TLFLabel
            Left = 13
            Top = 83
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Trabajo'
          end
          object DBETarea: TLFDbedit
            Left = 66
            Top = 14
            Width = 49
            Height = 21
            DataField = 'TAREA'
            DataSource = ProDMTareas.DSQMProSysTareas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 66
            Top = 36
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = ProDMTareas.DSQMProSysTareas
            TabOrder = 1
          end
          object LFDBCBAbsoluto: TLFDBCheckBox
            Left = 20
            Top = 103
            Width = 59
            Height = 17
            Caption = 'Absoluta'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ABSOLUTO'
            DataSource = ProDMTareas.DSQMProSysTareas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBEFase: TLFFibDBEditFind
            Left = 66
            Top = 58
            Width = 49
            Height = 21
            DataField = 'FASE'
            DataSource = ProDMTareas.DSQMProSysTareas
            TabOrder = 2
            OnChange = LFDBEFaseChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
          end
          object DescFase: TLFHYDBDescription
            Left = 116
            Top = 58
            Width = 230
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = ProDMTareas.DSQMProSysTareas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'FASE')
            CamposWhereTabla.Strings = (
              'FASE'
              'TITULO')
          end
          object EFCentroTrab: TLFDBEditFind2000
            Left = 66
            Top = 80
            Width = 49
            Height = 21
            DataField = 'CENTRO'
            DataSource = ProDMTareas.DSQMProSysTareas
            TabOrder = 4
            OnChange = EFCentroTrabChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_CENT_TRABAJO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CENTRO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECentroTrabTitulo: TLFEdit
            Left = 116
            Top = 80
            Width = 230
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 548
          Height = 321
          DataSource = ProDMTareas.DSQMProSysTareas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'TAREA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TAREA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 345
              Visible = True
            end>
        end
      end
      object TSReparacion: TTabSheet
        Caption = 'Reparacion'
        ImageIndex = 2
        object TBReparacion: TLFToolBar
          Left = 0
          Top = 0
          Width = 548
          Height = 25
          Caption = 'TBReparacion'
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLReparacionCab: TLFPanel
            Left = 0
            Top = 0
            Width = 296
            Height = 22
            BevelOuter = bvNone
            Caption = 'PNLReparacionCab'
            TabOrder = 0
            object LFLabel1: TLFLabel
              Left = 0
              Top = 4
              Width = 28
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Tarea'
              FocusControl = DBERepTarea
            end
            object DBERepTarea: TLFDbedit
              Left = 33
              Top = 0
              Width = 49
              Height = 21
              Color = clInfoBk
              DataField = 'TAREA'
              DataSource = ProDMTareas.DSQMProSysTareas
              ReadOnly = True
              TabOrder = 0
            end
            object DBERepTitulo: TLFDbedit
              Left = 84
              Top = 0
              Width = 212
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = ProDMTareas.DSQMProSysTareas
              ReadOnly = True
              TabOrder = 1
            end
          end
          object TBSep1: TToolButton
            Left = 296
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavTareas: THYMNavigator
            Left = 304
            Top = 0
            Width = 209
            Height = 22
            DataSource = ProDMTareas.DSxArtRep
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGTareas
            InsertaControl = DBGTareas
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGTareas: TDBGridFind2000
          Left = 0
          Top = 25
          Width = 548
          Height = 296
          Align = alClient
          DataSource = ProDMTareas.DSxArtRep
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
          Transaction = DMReparaciones.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          Numericos.Strings = (
            '(por asignar)')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
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
              FieldName = 'TITULO_LARGO'
              ReadOnly = True
              Width = 400
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 379
    Width = 560
  end
  inherited ALMain: TLFActionList
    Left = 312
    Top = 80
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AlstTareasCodBar: TAction
      Category = 'Listados'
      Caption = 'Listado C'#243'digo Barras'
      ImageIndex = 38
      OnExecute = AlstTareasCodBarExecute
    end
  end
end
