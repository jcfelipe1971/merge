inherited FMPlanesContables: TFMPlanesContables
  Left = 418
  Top = 225
  Caption = 'Planes contables anal'#237'ticos'
  ClientHeight = 206
  ClientWidth = 399
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 399
    Height = 182
    inherited TBMain: TLFToolBar
      Width = 395
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 282
        Action = ARecontruyePlanAnalitico
      end
    end
    inherited PCMain: TLFPageControl
      Width = 395
      Height = 152
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 387
          Height = 124
          inherited G2KTableLoc: TG2KTBLoc
            Left = 280
            Top = 24
          end
          object LBLCodigo: TLFLabel
            Left = 32
            Top = 17
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object LBLTitulo: TLFLabel
            Left = 37
            Top = 43
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object LFLProyecto: TLFLabel
            Left = 23
            Top = 67
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object DBECodigo: TLFDbedit
            Left = 70
            Top = 15
            Width = 121
            Height = 21
            DataField = 'PLAN_CONTABLE'
            DataSource = DMPlanesContables.DSQMPlanesContables
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 70
            Top = 40
            Width = 299
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPlanesContables.DSQMPlanesContables
            TabOrder = 1
          end
          object DBCBPreguntar: TLFDBCheckBox
            Left = 70
            Top = 93
            Width = 246
            Height = 17
            Caption = 'Preguntar autom'#225'ticamente desde la gestion'
            ClicksDisabled = False
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PREGUNTAR_IMPUTACION'
            DataSource = DMPlanesContables.DSQMPlanesContables
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFProyecto: TLFDBEditFind2000
            Left = 70
            Top = 65
            Width = 74
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMPlanesContables.DSQMPlanesContables
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFProyectoBusqueda
            OrdenadoPor.Strings = (
              'proyecto')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitProyecto: TLFDbedit
            Left = 145
            Top = 65
            Width = 224
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPlanesContables.DSxProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 387
          Height = 124
          DataSource = DMPlanesContables.DSQMPlanesContables
          CamposChecked.Strings = (
            'PREGUNTAR_IMPUTACION')
          CamposAOrdenar.Strings = (
            'PLAN_CONTABLE'
            'PREGUNTAR_IMPUTACION'
            'PROYECTO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PLAN_CONTABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 207
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROYECTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREGUNTAR_IMPUTACION'
              Width = 28
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 182
    Width = 399
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 216
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 252
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 286
    Top = 36
    object AListadoPlanContable: TAction
      Category = 'Listados'
      Caption = 'Listado del Plan Contable'
      Hint = 'Listado del Plan Contable Anal'#237'tico'
      ImageIndex = 14
      OnExecute = AListadoPlanContableExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ATraspasarPlan: TAction
      Category = 'Procesos'
      Caption = 'Traspasar Plan Contable Anal'#237'tico'
      Hint = 'Traspasar Plan Contable Anal'#237'tico'
      ImageIndex = 36
      OnExecute = ATraspasarPlanExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARecontruyePlanAnalitico: TAction
      Category = 'Procesos'
      Caption = 'Reconstruye el Plan Anal'#237'tico'
      Hint = 'Reconstruye el Plan Anal'#237'tico'
      ImageIndex = 26
      OnExecute = ARecontruyePlanAnaliticoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 318
    Top = 36
  end
end
