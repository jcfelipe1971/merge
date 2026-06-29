inherited FMPropagaEstructura: TFMPropagaEstructura
  Left = 450
  Top = 273
  Caption = 'Propagaci'#243'n de Estructuras Anal'#237'ticas'
  ClientHeight = 367
  ClientWidth = 526
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 526
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 522
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMPropagaEstructura.DSQMPropagacion
        Hints.Strings = ()
        OnClick = NavMainClick
        InsertaControl = EFPlan
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 52
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 260
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 268
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 522
      Height = 313
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 514
          Height = 285
          object CBOrigen: TGroupBox
            Left = 24
            Top = 8
            Width = 465
            Height = 129
            Caption = 'Origen'
            TabOrder = 0
            object LBLEmpresaO: TLFLabel
              Left = 35
              Top = 27
              Width = 41
              Height = 13
              Caption = 'Empresa'
            end
            object LBLEjercicioO: TLFLabel
              Left = 36
              Top = 49
              Width = 40
              Height = 13
              Caption = 'Ejercicio'
            end
            object LBLCanalO: TLFLabel
              Left = 49
              Top = 71
              Width = 27
              Height = 13
              Caption = 'Canal'
            end
            object LBLPlan: TLFLabel
              Left = 55
              Top = 92
              Width = 21
              Height = 13
              Caption = 'Plan'
            end
            object DBEEmpresaO: TLFDbedit
              Left = 83
              Top = 24
              Width = 84
              Height = 21
              Color = clInfoBk
              DataField = 'EMPRESA_O'
              DataSource = DMPropagaEstructura.DSQMPropagacion
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEEjercicioO: TLFDbedit
              Left = 83
              Top = 46
              Width = 84
              Height = 21
              Color = clInfoBk
              DataField = 'EJERCICIO_O'
              DataSource = DMPropagaEstructura.DSQMPropagacion
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBECanalO: TLFDbedit
              Left = 83
              Top = 68
              Width = 84
              Height = 21
              Color = clInfoBk
              DataField = 'CANAL_O'
              DataSource = DMPropagaEstructura.DSQMPropagacion
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBETitEmpresa0: TLFDbedit
              Left = 168
              Top = 24
              Width = 275
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropagaEstructura.DSxEmpresaO
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object DBETitCanalO: TLFDbedit
              Left = 168
              Top = 68
              Width = 275
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropagaEstructura.DSxCanalO
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBETitPlan: TLFDbedit
              Left = 168
              Top = 90
              Width = 275
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropagaEstructura.DSxPlan
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object EFPlan: TLFDBEditFind2000
              Left = 83
              Top = 90
              Width = 84
              Height = 21
              DataField = 'PLAN_CONTABLE'
              DataSource = DMPropagaEstructura.DSQMPropagacion
              TabOrder = 6
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ANA_PLAN_CONTABLE'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'PLAN_CONTABLE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object GBDestino: TGroupBox
            Left = 24
            Top = 144
            Width = 465
            Height = 106
            Caption = 'Destino'
            TabOrder = 1
            object LFLabel1: TLFLabel
              Left = 35
              Top = 27
              Width = 41
              Height = 13
              Caption = 'Empresa'
            end
            object LFLabel2: TLFLabel
              Left = 36
              Top = 49
              Width = 40
              Height = 13
              Caption = 'Ejercicio'
            end
            object LFLabel3: TLFLabel
              Left = 49
              Top = 71
              Width = 27
              Height = 13
              Caption = 'Canal'
            end
            object DBEEmpresaD: TLFDbedit
              Left = 83
              Top = 24
              Width = 84
              Height = 21
              Color = clInfoBk
              DataField = 'EMPRESA_D'
              DataSource = DMPropagaEstructura.DSQMPropagacion
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBETitEmpresaD: TLFDbedit
              Left = 168
              Top = 24
              Width = 275
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropagaEstructura.DSxEmpresaD
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBETitCanalD: TLFDbedit
              Left = 168
              Top = 68
              Width = 275
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPropagaEstructura.DSxCanalD
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object EFEjercicioD: TLFDBEditFind2000
              Left = 83
              Top = 46
              Width = 84
              Height = 21
              DataField = 'EJERCICIO_D'
              DataSource = DMPropagaEstructura.DSQMPropagacion
              TabOrder = 3
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
            object EFCanalD: TLFDBEditFind2000
              Left = 83
              Top = 68
              Width = 84
              Height = 21
              DataField = 'CANAL_D'
              DataSource = DMPropagaEstructura.DSQMPropagacion
              TabOrder = 4
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
              OnBusqueda = EFCanalDBusqueda
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object CHKPlantillas: TLFDBCheckBox
            Left = 28
            Top = 258
            Width = 121
            Height = 17
            Caption = 'Propagar Plantillas'
            ClicksDisabled = False
            TabOrder = 2
            TabStop = True
            OnClick = CHKPlantillasClick
            Alignment = taLeftJustify
            DataField = 'PLANTILLAS'
            DataSource = DMPropagaEstructura.DSQMPropagacion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CHKPlantillasCuentas: TLFDBCheckBox
            Left = 156
            Top = 258
            Width = 157
            Height = 17
            Caption = 'Propagar Plantillas/Cuentas'
            ClicksDisabled = False
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CUENTAS'
            DataSource = DMPropagaEstructura.DSQMPropagacion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 514
          Height = 285
          DataSource = DMPropagaEstructura.DSQMPropagacion
          CamposAMarcar.Strings = (
            'CUENTAS'
            'PLANTILLAS')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA_D'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO_D'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL_D'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLAN_CONTABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLANTILLAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTAS'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 343
    Width = 526
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 232
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 268
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
    Left = 232
    Top = 72
    object APropActualConserva: TAction
      Category = 'Procesos'
      Caption = 'Propaga la selecci'#243'n actual conservando los datos actuales'
      ImageIndex = 86
      OnExecute = APropActualConservaExecute
    end
    object APropActualNoConserva: TAction
      Category = 'Procesos'
      Caption = 'Propaga la selecci'#243'n actual sin conservar los datos actuales'
      ImageIndex = 56
      OnExecute = APropActualNoConservaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 268
    Top = 72
  end
end
