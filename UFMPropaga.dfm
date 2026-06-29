inherited FMPropaga: TFMPropaga
  Left = 374
  Top = 230
  HelpContext = 153
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Propagaci'#243'n Empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMPropaga.DSQMPropaga
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBCBEjercicios
        InsertaControl = DBEFEjercicioDestino
      end
      inherited EPMain: THYMEditPanel
        Width = 48
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 276
      end
      inherited TbuttComp: TToolButton
        Left = 284
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          object GBOrigen: TGroupBox
            Left = 52
            Top = 5
            Width = 385
            Height = 88
            Caption = 'Origen'
            TabOrder = 0
            object LBLEmpresa: TLFLabel
              Left = 12
              Top = 17
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Empresa'
            end
            object LBLEjercicio: TLFLabel
              Left = 13
              Top = 38
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
            end
            object LBLCanal: TLFLabel
              Left = 26
              Top = 60
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Canal'
            end
            object DBEFEmpresa: TLFFibDBEditFind
              Left = 58
              Top = 13
              Width = 55
              Height = 21
              Color = clInfoBk
              DataField = 'O_EMPRESA'
              DataSource = DMPropaga.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
            end
            object DBEFEjercicio: TLFFibDBEditFind
              Left = 58
              Top = 35
              Width = 55
              Height = 21
              Color = clInfoBk
              DataField = 'O_EJERCICIO'
              DataSource = DMPropaga.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
            end
            object DBEFCanal: TLFFibDBEditFind
              Left = 58
              Top = 57
              Width = 55
              Height = 21
              Color = clInfoBk
              DataField = 'O_CANAL'
              DataSource = DMPropaga.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
            end
            object DBETitEmpresa: TLFDbedit
              Left = 114
              Top = 13
              Width = 254
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropaga.DSxEmpresas
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
            object DBETitCanal: TLFDbedit
              Left = 114
              Top = 57
              Width = 254
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropaga.DSxSys_Canales
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
          object GBDestino: TGroupBox
            Left = 52
            Top = 95
            Width = 385
            Height = 88
            Caption = 'Destino'
            TabOrder = 1
            object LBLEmpresaDestino: TLFLabel
              Left = 12
              Top = 17
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Empresa'
            end
            object LBLEjercicioDestino: TLFLabel
              Left = 13
              Top = 39
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
            end
            object LBLCanalDestino: TLFLabel
              Left = 26
              Top = 61
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Canal'
            end
            object DBECanalDestino: TLFDbedit
              Left = 114
              Top = 57
              Width = 254
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropaga.DSxSys_CanalesDestino
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
            object DBEEmpresaDestino: TLFDbedit
              Left = 114
              Top = 13
              Width = 254
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropaga.DSxEmpresaDestino
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
            object DBEFEmpresaDestino: TLFDBEditFind2000
              Left = 58
              Top = 13
              Width = 55
              Height = 21
              Color = clInfoBk
              DataField = 'D_EMPRESA'
              DataSource = DMPropaga.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_EMPRESAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'EMPRESA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFEjercicioDestino: TLFDBEditFind2000
              Left = 58
              Top = 35
              Width = 55
              Height = 21
              DataField = 'D_EJERCICIO'
              DataSource = DMPropaga.DSQMPropaga
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_EJERCICIOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'EJERCICIO'
              CampoStr = 'EJERCICIO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFCanalDestino: TLFDBEditFind2000
              Left = 58
              Top = 57
              Width = 55
              Height = 21
              DataField = 'D_CANAL'
              DataSource = DMPropaga.DSQMPropaga
              TabOrder = 2
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CANAL'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object GBOpciones: TGroupBox
            Left = 52
            Top = 186
            Width = 193
            Height = 84
            Caption = 'Opciones'
            TabOrder = 2
            object DBCBEjercicios: TLFDBCheckBox
              Left = 16
              Top = 16
              Width = 137
              Height = 17
              Caption = 'Ejercicios Autom'#225'ticos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'AUTO_EJERCICIOS'
              DataSource = DMPropaga.DSQMPropaga
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBBorrado: TLFDBCheckBox
              Left = 16
              Top = 37
              Width = 169
              Height = 17
              Caption = 'Borrado Propagado (MODO)'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'MODO'
              DataSource = DMPropaga.DSQMPropaga
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBModifica: TLFDBCheckBox
              Left = 16
              Top = 58
              Width = 97
              Height = 17
              Hint = 'Modifica en el canal destino.'
              Caption = 'Modificaci'#243'n'
              ClicksDisabled = False
              ColorCheck = 57088
              ShowHint = True
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'MODIFICA'
              DataSource = DMPropaga.DSQMPropaga
              ParentShowHint = False
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object ANITempo: TAnimate
            Left = 314
            Top = 205
            Width = 48
            Height = 45
            Active = False
            CommonAVI = aviFindComputer
            StopFrame = 8
            Visible = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMPropaga.DSQMPropaga
          CamposAMarcar.Strings = (
            'AUTO_EJERCICIOS'
            'MODIFICA'
            'MODO')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'AUTO_EJERCICIOS'
            'D_CANAL'
            'D_EJERCICIO'
            'D_EMPRESA'
            'MODIFICA'
            'MODO')
          Columns = <
            item
              Expanded = False
              FieldName = 'D_EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_EJERCICIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_CANAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTO_EJERCICIOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODO'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODIFICA'
              Width = 49
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 216
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 268
    Top = 20
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 268
    Top = 66
    object APropaga: TAction
      Category = 'Procesos'
      Caption = 'Propaga la actual selecci'#243'n'
      Hint = 'Propaga la actual selecci'#243'n'
      ImageIndex = 86
      OnExecute = APropagaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 310
    Top = 70
  end
end
