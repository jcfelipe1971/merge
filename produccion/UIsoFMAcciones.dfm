inherited IsoFMAcciones: TIsoFMAcciones
  Left = 433
  Top = 254
  Width = 812
  Height = 520
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Acciones'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 802
    Height = 467
    inherited TBMain: TLFToolBar
      Width = 798
      inherited NavMain: THYMNavigator
        DataSource = IsoDMAcciones.DSQMIsoAcciones
        Hints.Strings = ()
        EditaControl = DBEFTipo
        InsertaControl = DBETipoProc
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object TButtAbreCierra: TToolButton
        Left = 319
        Top = 0
        Caption = 'Abre-Cierra'
        ImageIndex = 68
        OnClick = TButtAbreCierraClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 798
      Height = 437
      inherited TSFicha: TTabSheet
        object SBAProcedencia: TSpeedButton [0]
          Left = 336
          Top = 32
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+D para abrir documento de procedencia'
          GroupIndex = -1
          OnDblClick = SBAProcedenciaDblClick
        end
        inherited PEdit: TLFPanel
          Width = 790
          Height = 409
          inherited G2KTableLoc: TG2KTBLoc
            Top = 24
            Tabla_a_buscar = 'ISO_ACCIONES_PRE'
            CampoNum = 'RIC'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object PNLCabecera: TLFPanel
            Left = 0
            Top = 0
            Width = 790
            Height = 73
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LFecha: TLFLabel
              Left = 290
              Top = 7
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object LNroAccion: TLFLabel
              Left = 6
              Top = 7
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nro. Acci'#243'n '
            end
            object LTipo: TLFLabel
              Left = 19
              Top = 30
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Acc.'
            end
            object LPlano: TLFLabel
              Left = 38
              Top = 51
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Plano'
              FocusControl = DBEPlano
            end
            object LFTipoProc: TLFLabel
              Left = 112
              Top = 7
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'Proc.'
            end
            object LProcedenciaIncidencia: TLFLabel
              Left = 207
              Top = 7
              Width = 15
              Height = 13
              Alignment = taRightJustify
              Caption = 'Inc'
              FocusControl = DBEProcedencia
            end
            object LEstado: TLFLabel
              Left = 418
              Top = 7
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Estado'
            end
            object LFechaCierre: TLFLabel
              Left = 635
              Top = 7
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Cierre'
            end
            object LCoste: TLFLabel
              Left = 668
              Top = 51
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste'
            end
            object DBEPlano: TLFDbedit
              Left = 69
              Top = 47
              Width = 216
              Height = 21
              DataField = 'PLANO'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              TabOrder = 8
            end
            object DBEFTipo: TLFDBEditFind2000
              Left = 69
              Top = 25
              Width = 38
              Height = 21
              DataField = 'TIPO'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              TabOrder = 6
              OnChange = DBEFTipoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ISO_INC_ACCIONES_TIPO'
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
            object DescTipo: TLFHYDBDescription
              Left = 108
              Top = 25
              Width = 177
              Height = 21
              Color = clInfoBk
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              Tabla_a_buscar = 'ISO_INC_ACCIONES_TIPO'
              Campo_Descripcion = 'DESCRIPCION'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'TIPO')
              CamposWhereTabla.Strings = (
                'TIPO')
            end
            object DBEAccion: TLFDbedit
              Left = 69
              Top = 3
              Width = 39
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIC'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              ReadOnly = True
              TabOrder = 0
            end
            object DBETipoProc: TLFDBEditFind2000
              Left = 140
              Top = 3
              Width = 53
              Height = 21
              DataField = 'PROCEDENCIA'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ISO_ACCIONES_PRE_TIPO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'TIPO'
              CampoStr = 'DESCRIPCION'
              CampoADevolver = 'TIPO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'TIPO')
              Filtros = []
            end
            object DBEProcedencia: TLFDbedit
              Left = 226
              Top = 3
              Width = 59
              Height = 21
              DataField = 'ID_INC'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              TabOrder = 2
            end
            object DBDTPFIFecha: TLFDBDateEdit
              Left = 324
              Top = 3
              Width = 87
              Height = 21
              DataField = 'FECHA'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 3
            end
            object DBETituloEstado: TLFDbedit
              Left = 455
              Top = 3
              Width = 173
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = IsoDMAcciones.DSxEstado
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBDTPFechaCierre: TLFDBDateEdit
              Left = 699
              Top = 3
              Width = 87
              Height = 21
              DataField = 'FECHACIERRE'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 5
            end
            object LFDBCoste: TLFDbedit
              Left = 699
              Top = 47
              Width = 86
              Height = 21
              DataField = 'COSTE'
              DataSource = IsoDMAcciones.DSQMIsoAcciones
              TabOrder = 9
            end
          end
          object PNLDetalle: TLFPanel
            Left = 0
            Top = 73
            Width = 790
            Height = 336
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            OnResize = PNLDetalleResize
            object PNLDetalleTop: TLFPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 161
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              OnResize = PNLDetalleTopResize
              object GBAccion: TGroupBox
                Left = 0
                Top = 0
                Width = 394
                Height = 161
                Align = alLeft
                Caption = 'Acci'#243'n'
                TabOrder = 0
                DesignSize = (
                  394
                  161)
                object LDescripcion: TLFLabel
                  Left = 19
                  Top = 40
                  Width = 56
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descripci'#243'n'
                  FocusControl = DBEDescripcion
                end
                object LResponsable: TLFLabel
                  Left = 13
                  Top = 17
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Responsable'
                end
                object LDescripcionInc: TLFLabel
                  Left = 22
                  Top = 63
                  Width = 53
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Comentario'
                end
                object DBEFRespInc: TLFDBEditFind2000
                  Left = 79
                  Top = 14
                  Width = 49
                  Height = 21
                  DataField = 'FDESCRIPCIONINC'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 0
                  OnChange = DBEFRespIncChange
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
                  OnBusqueda = DBEFEmpleadoGenericoBusqueda
                  OrdenadoPor.Strings = (
                    'EMPLEADO')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DescResponsableInc: TLFEdit
                  Left = 129
                  Top = 14
                  Width = 259
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object DBEDescripcion: TLFDbedit
                  Left = 79
                  Top = 36
                  Width = 309
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'DESCRIPCION'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 2
                end
                object DBMDescripcionInc: TLFDBMemo
                  Left = 79
                  Top = 58
                  Width = 309
                  Height = 89
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DataField = 'DESCRIPCIONINC'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 3
                end
              end
              object GBAnalisis: TGroupBox
                Left = 394
                Top = 0
                Width = 396
                Height = 161
                Align = alClient
                Caption = 'An'#225'lisis'
                TabOrder = 1
                DesignSize = (
                  396
                  161)
                object LCausas: TLFLabel
                  Left = 22
                  Top = 105
                  Width = 53
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Comentario'
                end
                object LResponsableAnalisis: TLFLabel
                  Left = 13
                  Top = 16
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Responsable'
                end
                object LAnalisis: TLFLabel
                  Left = 3
                  Top = 39
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'An'#225'lisis Causas'
                end
                object DBEFRespAna: TLFDBEditFind2000
                  Left = 79
                  Top = 14
                  Width = 49
                  Height = 21
                  DataField = 'FANALISIS'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 0
                  OnChange = DBEFRespAnaChange
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
                  OnBusqueda = DBEFEmpleadoGenericoBusqueda
                  OrdenadoPor.Strings = (
                    'EMPLEADO')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DescResponsableAna: TLFEdit
                  Left = 129
                  Top = 14
                  Width = 259
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object DBMAnalisisAcciones: TLFDBMemo
                  Left = 79
                  Top = 100
                  Width = 309
                  Height = 48
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DataField = 'ANALISIS'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 3
                end
                object DBMCausasAcciones: TLFDBMemo
                  Left = 79
                  Top = 36
                  Width = 309
                  Height = 63
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'CAUSAS'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 2
                end
              end
            end
            object PNLDetalleClient: TLFPanel
              Left = 0
              Top = 161
              Width = 790
              Height = 175
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              OnResize = PNLDetalleClientResize
              object GBAccion2: TGroupBox
                Left = 0
                Top = 0
                Width = 394
                Height = 175
                Align = alLeft
                Caption = 'Acci'#243'n'
                TabOrder = 0
                DesignSize = (
                  394
                  175)
                object LAccion: TLFLabel
                  Left = 43
                  Top = 63
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Acci'#243'n'
                end
                object LFirmaAccion: TLFLabel
                  Left = 14
                  Top = 19
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Responsable'
                end
                object LFechaPrevEjercicio: TLFLabel
                  Left = 18
                  Top = 39
                  Width = 58
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Prev. Eje.'
                end
                object DBEFRespAcc: TLFDBEditFind2000
                  Left = 79
                  Top = 14
                  Width = 49
                  Height = 21
                  DataField = 'FACCION'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 0
                  OnChange = DBEFRespAccChange
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
                  OnBusqueda = DBEFEmpleadoGenericoBusqueda
                  OrdenadoPor.Strings = (
                    'EMPLEADO')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DescResponsableAcc: TLFEdit
                  Left = 129
                  Top = 14
                  Width = 259
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object DBDateEdit1: TLFDBDateEdit
                  Left = 79
                  Top = 36
                  Width = 111
                  Height = 21
                  DataField = 'FECHAPREVISTA'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  CheckOnExit = True
                  NumGlyphs = 2
                  TabOrder = 2
                end
                object DBMAccionAcciones: TLFDBMemo
                  Left = 79
                  Top = 58
                  Width = 309
                  Height = 91
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DataField = 'ACCION'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 3
                end
              end
              object GBSeguimiento: TGroupBox
                Left = 394
                Top = 0
                Width = 396
                Height = 175
                Align = alClient
                Caption = 'Seguimiento'
                TabOrder = 1
                DesignSize = (
                  396
                  175)
                object LComprobacion: TLFLabel
                  Left = 19
                  Top = 63
                  Width = 58
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Seguimiento'
                end
                object LFirmaComp: TLFLabel
                  Left = 15
                  Top = 19
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Responsable'
                end
                object LRecurso: TLFLabel
                  Left = 35
                  Top = 39
                  Width = 40
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Recurso'
                  Visible = False
                end
                object DBEFRespComp: TLFDBEditFind2000
                  Left = 79
                  Top = 14
                  Width = 49
                  Height = 21
                  DataField = 'FCOMPROBACION'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 0
                  OnChange = DBEFRespCompChange
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
                  OnBusqueda = DBEFEmpleadoGenericoBusqueda
                  OrdenadoPor.Strings = (
                    'EMPLEADO')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DescResponsableComp: TLFEdit
                  Left = 129
                  Top = 14
                  Width = 259
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object DBMComprobacionSeguimiento: TLFDBMemo
                  Left = 79
                  Top = 58
                  Width = 309
                  Height = 91
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DataField = 'COMPROBACION'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 4
                end
                object DBEFRecurso: TLFDBEditFind2000
                  Left = 79
                  Top = 36
                  Width = 49
                  Height = 21
                  DataField = 'ID_RECURSO'
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  TabOrder = 2
                  Visible = False
                  OnChange = DBEFRecursoChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = False
                  Tabla_a_buscar = 'PRO_RECURSOS'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'RECURSO'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OrdenadoPor.Strings = (
                    'RECURSO')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DescRecurso: TLFHYDBDescription
                  Left = 129
                  Top = 36
                  Width = 259
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Color = clInfoBk
                  DataSource = IsoDMAcciones.DSQMIsoAcciones
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  Visible = False
                  Tabla_a_buscar = 'PRO_RECURSOS'
                  Campo_Descripcion = 'TITULO'
                  Base_de_datos = DMMain.DataBase
                  CamposWhereOrigen.Strings = (
                    'EMPRESA'
                    'FCOMPROBACION')
                  CamposWhereTabla.Strings = (
                    'EMPRESA'
                    'RECURSO')
                end
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 790
          Height = 409
          DataSource = IsoDMAcciones.DSQMIsoAcciones
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'COSTE'
            'DESCRIPCION'
            'ESTADO'
            'FACCION'
            'FANALISIS'
            'FCOMPROBACION'
            'FDESCRIPCIONINC'
            'FECHA'
            'FECHACIERRE'
            'FECHAPREVISTA'
            'PLANO'
            'PROCEDENCIA'
            'RIC'
            'TIEMPO'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIC'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROCEDENCIA'
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
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLANO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHACIERRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 467
    Width = 802
  end
  inherited CEMain: TControlEdit
    Left = 424
    Top = 96
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 528
    Top = 100
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 364
    Top = 0
    object AAccionCorrectora: TAction
      Category = 'Listado'
      Caption = 'Listado Acciones'
      ImageIndex = 14
      OnExecute = AAccionCorrectoraExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object ALstConfig: TAction
      Category = 'Listado'
      Caption = 'Configuraci'#243'n Listado'
      ImageIndex = 77
      OnExecute = ALstConfigExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 472
    Top = 112
  end
end
