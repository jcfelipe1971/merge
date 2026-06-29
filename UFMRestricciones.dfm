inherited FMRestriccion: TFMRestriccion
  Left = 479
  Top = 206
  Width = 587
  Height = 500
  HelpContext = 314
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Restricciones'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 587
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 304
    Width = 577
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Color = clBtnShadow
    ParentColor = False
  end
  inherited PMain: TLFPanel
    Width = 577
    Height = 304
    inherited TBMain: TLFToolBar
      Width = 573
      inherited NavMain: THYMNavigator
        DataSource = DMRestriccion.DSRestriccion
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 573
      Height = 274
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 565
          Height = 246
          object PCabecera: TLFPanel
            Left = 0
            Top = 0
            Width = 565
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LBLNivel: TLFLabel
              Left = 35
              Top = 4
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Perfil'
              FocusControl = DBEPerfil
            end
            object LSuperior: TLFLabel
              Left = 19
              Top = 26
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'Superior'
              FocusControl = DBEPerfil
            end
            object ToolBarInfo: TLFToolBar
              Left = 0
              Top = 55
              Width = 183
              Height = 24
              Align = alNone
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Separators = True
              object TBNoVisible: TToolButton
                Left = 0
                Top = 0
                Hint = 'Todo no visible'
                Caption = 'Todo no visible'
                ImageIndex = 6
                OnClick = TBNoVisibleClick
              end
              object TBEnabled: TToolButton
                Left = 23
                Top = 0
                Hint = 'Todo visible y deshabilitado'
                Caption = 'Todo visible y deshabilitado'
                ImageIndex = 8
                OnClick = TBEnabledClick
              end
              object TBVisible: TToolButton
                Left = 46
                Top = 0
                Hint = 'Todo visible y habilitado'
                Caption = 'Todo visible y habilitado'
                ImageIndex = 7
                OnClick = TBVisibleClick
              end
              object TBSep1: TToolButton
                Left = 69
                Top = 0
                Width = 8
                ImageIndex = 8
                Style = tbsSeparator
              end
              object TBSeleccionaTodo: TToolButton
                Left = 77
                Top = 0
                Caption = 'Habilita todos los items'
                ImageIndex = 146
                OnClick = TBSeleccionaTodoClick
              end
              object TBDesSeleccionaTodo: TToolButton
                Left = 100
                Top = 0
                Caption = 'Deshabilita todos los items'
                ImageIndex = 147
                OnClick = TBDesSeleccionaTodoClick
              end
              object TSep2: TToolButton
                Left = 123
                Top = 0
                Width = 8
                ImageIndex = 21
                Style = tbsSeparator
              end
              object TButtExpandeMapa: TToolButton
                Left = 131
                Top = 0
                Hint = 'Expande Mapa'
                Caption = 'Expande Mapa'
                ImageIndex = 23
                OnClick = TButtExpandeMapaClick
              end
              object TButtContraeMapa: TToolButton
                Left = 154
                Top = 0
                Hint = 'Contrae Mapa'
                Caption = 'Contrae Mapa'
                ImageIndex = 22
                OnClick = TButtContraeMapaClick
              end
            end
            object DBEPerfil: TLFDbedit
              Left = 62
              Top = 1
              Width = 33
              Height = 21
              Color = clInfoBk
              DataField = 'PERFIL'
              DataSource = DMRestriccion.DSRestriccion
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = DBEPerfilChange
            end
            object DBETitulo: TLFDbedit
              Left = 96
              Top = 1
              Width = 260
              Height = 21
              DataField = 'TITULO'
              DataSource = DMRestriccion.DSRestriccion
              TabOrder = 2
            end
            object DBETitSuperior: TLFDbedit
              Left = 96
              Top = 23
              Width = 260
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMRestriccion.DSxRestriccion
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
            object DBEFSuperior: TLFDBEditFind2000
              Left = 62
              Top = 23
              Width = 33
              Height = 21
              DataField = 'SUPERIOR'
              DataSource = DMRestriccion.DSRestriccion
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_USUARIOS_PERFIL'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'PERFIL'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'PERFIL')
              Filtros = []
            end
            object CHKContabilidadAnalitica: TLFDBCheckBox
              Left = 364
              Top = 3
              Width = 200
              Height = 17
              Caption = 'Contabilidad Anal'#237'tica'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CHKContabilidadAnaliticaChange
              DataField = 'CONTABILIDAD_ANALITICA'
              DataSource = DMRestriccion.DSRestriccion
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CHKTPVTactil: TLFDBCheckBox
              Left = 364
              Top = 25
              Width = 200
              Height = 17
              Caption = 'TPV T'#225'ctil'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CHKContabilidadAnaliticaChange
              DataField = 'TACTIL'
              DataSource = DMRestriccion.DSRestriccion
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CBPuedeAbrirFacturasVenta: TLFDBCheckBox
              Left = 364
              Top = 47
              Width = 200
              Height = 17
              Caption = 'Puede abrir Facturas de Venta'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 7
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CHKContabilidadAnaliticaChange
              DataField = 'PUEDE_ABRIR_FACTURA_VENTA'
              DataSource = DMRestriccion.DSRestriccion
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object PNLTree: TLFPanel
            Left = 0
            Top = 80
            Width = 565
            Height = 166
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object TVMain: TTreeView
              Left = 0
              Top = 0
              Width = 565
              Height = 166
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              Images = DMMain.ILMain_Ac
              Indent = 19
              ReadOnly = True
              StateImages = DMMain.ILMain_Ac
              TabOrder = 0
              OnDblClick = TVMainDblClick
              OnKeyPress = TVMainKeyPress
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 565
          Height = 246
          DataSource = DMRestriccion.DSRestriccion
          CamposAOrdenar.Strings = (
            'PERFIL')
          Columns = <
            item
              Expanded = False
              FieldName = 'PERFIL'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 371
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [2]
    Top = 447
    Width = 577
  end
  inherited PDetalle: TLFPanel [3]
    Top = 312
    Width = 577
    Height = 135
    Constraints.MinHeight = 135
    inherited TBDetalle: TLFToolBar
      Top = 17
      Width = 577
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        DataSource = DMRestriccion.DSQMRestriccionEEC
        Hints.Strings = ()
        Exclusivo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Top = 39
      Width = 577
      Height = 96
      DataSource = DMRestriccion.DSQMRestriccionEEC
      OnColEnter = DBGFDetalleColEnter
      Campos.Strings = (
        'EMPRESA'
        'CANAL')
      CamposAMostrar.Strings = (
        'EMPRESA'
        '2'
        'TITULO'
        'EMPRESA'
        'CANAL'
        '2'
        'TITULO'
        'CANAL')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CamposNoAccesibles.Strings = (
        'RESTRICCION')
      Numericos.Strings = (
        'EMPRESA'
        'CANAL')
      SalirSiVacio = True
      Tablas.Strings = (
        'SYS_EMPRESAS                   '
        'SYS_CANALES                    ')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      Columns = <
        item
          Expanded = False
          FieldName = 'EMPRESA'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 77
          Visible = True
        end>
    end
    object PNLTituloRestriccionesEEC: TLFPanel
      Left = 0
      Top = 0
      Width = 577
      Height = 17
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '  Restricciones de Acceso'
      TabOrder = 2
    end
  end
  inherited CEMain: TControlEdit
    Left = 398
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 430
    Top = 28
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListaRestricciones: TAction
      Category = 'Listados'
      Caption = 'Listado de Restricciones'
      Hint = 'Lista las restricciones de todos los perfiles'
      ImageIndex = 14
      OnExecute = AListaRestriccionesExecute
    end
    object AConfiguracionListaRestricciones: TAction
      Category = 'Listados'
      Caption = 'Configuracion Listado de Restricciones'
      Hint = 'Configuracion del listado de restricciones'
      ImageIndex = 77
      OnExecute = AConfiguracionListaRestriccionesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 398
    Top = 65534
  end
  inherited CEDetalle: TControlEdit
    Left = 399
    Top = 58
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 431
    Top = 60
  end
end
