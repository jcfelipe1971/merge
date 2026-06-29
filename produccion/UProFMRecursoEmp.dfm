inherited ProFMRecursoEmp: TProFMRecursoEmp
  Left = 312
  Top = 235
  Width = 527
  Height = 445
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Periodo Recursos'
  ClientHeight = 416
  ClientWidth = 517
  PopupMenu = ControlEdit1PMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 517
    Height = 392
    inherited TBMain: TLFToolBar
      Width = 513
      inherited NavMain: THYMNavigator
        DataSource = ProDMRecursoEmp.DSQMProRecursos
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBERecurso
        InsertaControl = DBERecurso
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBERecurso
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 513
      Height = 215
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 505
          Height = 187
          inherited G2KTableLoc: TG2KTBLoc
            Top = 20
            Plan.Strings = (
              'PLAN (PRO_RECURSOS NATURAL)')
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_RECURSOS'
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RECURSO')
          end
          object LblRecurso: TLFLabel
            Left = 30
            Top = 8
            Width = 43
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Recurso'
          end
          object LblTitulo: TLFLabel
            Left = 151
            Top = 7
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LblUnidad: TLFLabel
            Left = 37
            Top = 30
            Width = 36
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Unidad'
          end
          object LblTipoRec: TLFLabel
            Left = 9
            Top = 96
            Width = 64
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tipo Recurso'
            FocusControl = DBERecurso
          end
          object LblImporte: TLFLabel
            Left = 35
            Top = 52
            Width = 38
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Importe'
            FocusControl = DBEImporte
          end
          object LblCapacidad: TLFLabel
            Left = 22
            Top = 117
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Capacidad'
          end
          object LblPorcentaje: TLFLabel
            Left = 146
            Top = 117
            Width = 8
            Height = 13
            Caption = '%'
          end
          object LblHorario: TLFLabel
            Left = 254
            Top = 117
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
          end
          object LblRendimiento: TLFLabel
            Left = 231
            Top = 52
            Width = 68
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Rendimiento: '
            FocusControl = DBEOperacionesNum
          end
          object LblOperaciones: TLFLabel
            Left = 367
            Top = 51
            Width = 63
            Height = 13
            AutoSize = False
            Caption = 'operaciones'
            FocusControl = DBEImporte
          end
          object LblSegundo: TLFLabel
            Left = 367
            Top = 73
            Width = 63
            Height = 13
            AutoSize = False
            Caption = 'segundos'
            FocusControl = DBEImporte
          end
          object LblImporteOperacion: TLFLabel
            Left = 13
            Top = 74
            Width = 60
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Importe Op.'
            FocusControl = DBEImporteOperacion
          end
          object LFase: TLFLabel
            Left = 50
            Top = 138
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LMaquina: TLFLabel
            Left = 32
            Top = 161
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
          end
          object DBERecurso: TLFDbedit
            Left = 77
            Top = 4
            Width = 65
            Height = 21
            DataField = 'RECURSO'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEImporte: TLFDbedit
            Left = 77
            Top = 48
            Width = 137
            Height = 21
            DataField = 'IMPORTE'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 3
          end
          object DBEFTipoRecurso: TLFDBEditFind2000
            Left = 77
            Top = 92
            Width = 65
            Height = 21
            DataField = 'TIPORECURSO'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 6
            OnChange = DBEFTipoRecursoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            CampoADevolver = 'RECURSO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'RECURSO')
            Filtros = []
          end
          object DBEFUnidad: TLFDBEditFind2000
            Left = 77
            Top = 26
            Width = 65
            Height = 21
            DataField = 'UNIDAD'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 2
            OnChange = DBEFUnidadChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_UNIDADES_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBETitulo: TLFDbedit
            Left = 184
            Top = 4
            Width = 292
            Height = 21
            DataField = 'TITULO'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 1
          end
          object DescUnidad: TLFHYDBDescription
            Left = 143
            Top = 26
            Width = 333
            Height = 21
            Color = clInfoBk
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            Tabla_a_buscar = 'SYS_UNIDADES_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'UNIDAD')
            CamposWhereTabla.Strings = (
              'TIPO')
          end
          object DescTipoRecurso: TLFHYDBDescription
            Left = 143
            Top = 92
            Width = 333
            Height = 21
            Color = clInfoBk
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            Tabla_a_buscar = 'PRO_SYS_RECURSOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPORECURSO')
            CamposWhereTabla.Strings = (
              'RECURSO')
          end
          object DBECapacidad: TLFDbedit
            Left = 77
            Top = 114
            Width = 65
            Height = 21
            DataField = 'PORCEN_CAPACIDAD'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 7
          end
          object DBCBPlanificable: TLFDBCheckBox
            Left = 171
            Top = 116
            Width = 72
            Height = 17
            Caption = 'Planificable'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PLANIFICABLE'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFHorario: TLFDBEditFind2000
            Left = 292
            Top = 114
            Width = 37
            Height = 21
            DataField = 'ID_HORARIO'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_HORARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'HORARIO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'HORARIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescripHorario: TLFDbedit
            Left = 330
            Top = 114
            Width = 146
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ProDMRecursoEmp.DSxHorarios
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
          object DBEOperacionesNum: TLFDbedit
            Left = 299
            Top = 48
            Width = 65
            Height = 21
            DataField = 'OPERACIONES_NUM'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 4
          end
          object DBEOperacionesTiempo: TLFDbedit
            Left = 299
            Top = 70
            Width = 65
            Height = 21
            DataField = 'OPERACIONES_TIEMPO'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 5
          end
          object DBEImporteOperacion: TLFDbedit
            Left = 77
            Top = 70
            Width = 137
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ImporteOperacion'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEFase: TLFDBEditFind2000
            Left = 77
            Top = 136
            Width = 65
            Height = 21
            DataField = 'FASES'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 14
            OnChange = DBEFaseChange
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
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DescFase: TLFHYDBDescription
            Left = 143
            Top = 136
            Width = 333
            Height = 21
            Color = clInfoBk
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'FASES')
            CamposWhereTabla.Strings = (
              'FASE')
          end
          object DBECodMaq: TDBEditFind2000
            Left = 77
            Top = 158
            Width = 65
            Height = 21
            DataField = 'CODMAQ'
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            TabOrder = 16
            OnChange = DBECodMaqChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODMAQ')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescMaquinas: TLFHYDBDescription
            Left = 143
            Top = 158
            Width = 333
            Height = 21
            Color = clInfoBk
            DataSource = ProDMRecursoEmp.DSQMProRecursos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CODMAQ'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'CODMAQ'
              'EMPRESA')
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 505
          Height = 187
          DataSource = ProDMRecursoEmp.DSQMProRecursos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'RECURSO'
            'TIPORECURSO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RECURSO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDAD'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescUnidad'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPORECURSO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescRecurso'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 42
              Visible = True
            end>
        end
      end
    end
    object PDetalle: TLFPanel
      Left = 2
      Top = 243
      Width = 513
      Height = 147
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 513
        Height = 125
        Align = alClient
        DataSource = ProDMRecursoEmp.DSQMProRecPre
        PopupMenu = ControlEdit1PMEdit
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
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = -1
        IndiceBitmapDescendente = 0
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FECHA_INI'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_FIN'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_EST'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_REA'
            Visible = False
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 513
        Height = 22
        AutoSize = True
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        TabOrder = 1
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 200
          Height = 22
          DataSource = ProDMRecursoEmp.DSQMProRecPre
          Flat = True
          ParentShowHint = False
          PopupMenu = ControlEdit1PMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = True
          ControlEdit = ControlEdit1
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 392
    Width = 517
  end
  inherited CEMain: TControlEdit
    EnlazadoA = ControlEdit1
    Complementario = TBDetalle
    Left = 276
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 311
    Top = 35
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 16
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ALstRecursosCodBar: TAction
      Category = 'Listados'
      Caption = 'Listado C'#243'digo Barras'
      ImageIndex = 38
      OnExecute = ALstRecursosCodBarExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object ALstCfgRecursosCodBarras: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Cod. Barras Recursos'
      ImageIndex = 77
      OnExecute = ALstCfgRecursosCodBarrasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 424
    Top = 16
  end
  object ControlEdit1: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    Complementario = TBMain
    PopUpMenu = ControlEdit1PMEdit
    Teclas = DMMain.Teclas
    Left = 276
    Top = 68
  end
  object ControlEdit1PMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 312
    Top = 69
    object ControlEdit1Mifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object ControlEdit1Miprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object ControlEdit1Minext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object ControlEdit1Milast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object ControlEdit1Miinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object ControlEdit1Midelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object ControlEdit1Miedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object ControlEdit1Mipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object ControlEdit1Micancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object ControlEdit1Mirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
