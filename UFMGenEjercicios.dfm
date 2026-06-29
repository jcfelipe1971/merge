inherited FMGenEjercicios: TFMGenEjercicios
  Left = 346
  Top = 342
  Width = 438
  Height = 240
  HelpContext = 18
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ejercicios de la Empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 428
    Height = 187
    inherited TBMain: TLFToolBar
      Width = 424
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMGenEjercicios.DSQMGenEjercicios
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBDTPApertura
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 60
        VisibleButtons = [neBuscar, neImprime, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 244
        Width = 4
      end
      inherited TbuttComp: TToolButton
        Left = 248
      end
    end
    inherited PCMain: TLFPageControl
      Width = 424
      Height = 157
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 416
          Height = 129
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMGenEjercicios.DSQMGenEjercicios
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'GEN_EJERCICIOS'
            CampoNum = 'EJERCICIO'
            CampoStr = 'APERTURA'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'EJERCICIO')
          end
          object LBLEjercicio: TLFLabel
            Left = 29
            Top = 27
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LBLApertura: TLFLabel
            Left = 29
            Top = 49
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apertura'
          end
          object LBLCierre: TLFLabel
            Left = 42
            Top = 70
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cierre'
          end
          object LColor: TLFLabel
            Left = 44
            Top = 91
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Color'
          end
          object DBEEjercicio: TLFDbedit
            Left = 74
            Top = 23
            Width = 55
            Height = 21
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = DMGenEjercicios.DSQMGenEjercicios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBEEjercicioChange
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 186
            Top = 25
            Width = 87
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMGenEjercicios.DSQMGenEjercicios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPApertura: TLFDBDateEdit
            Left = 74
            Top = 45
            Width = 87
            Height = 21
            DataField = 'APERTURA'
            DataSource = DMGenEjercicios.DSQMGenEjercicios
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBDTPCierre: TLFDBDateEdit
            Left = 74
            Top = 66
            Width = 87
            Height = 21
            DataField = 'CIERRE'
            DataSource = DMGenEjercicios.DSQMGenEjercicios
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object EColor: TLFEdit
            Left = 75
            Top = 88
            Width = 87
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 3
            Text = '             ...'
            OnClick = EColorClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 416
          Height = 129
          DataSource = DMGenEjercicios.DSQMGenEjercicios
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ejercicio'
            'Activo'
            'Apertura'
            'Cierre')
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APERTURA'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIERRE'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COLOR'
              Width = 96
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 187
    Width = 428
  end
  inherited CEMain: TControlEdit
    Left = 222
    Top = 96
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 264
    Top = 98
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
    Left = 266
    Top = 46
    object AActivarEjercicio: TAction
      Category = 'Procesos'
      Caption = 'Activar el Ejercicio actual'
      Hint = 'Activar el Ejercicio actual'
      ImageIndex = 19
      OnExecute = AActivarEjercicioExecute
    end
    object ADesactivarEjercicio: TAction
      Category = 'Procesos'
      Caption = 'Desactivar el Ejercicio actual'
      Hint = 'Desactivar el Ejercicio actual'
      ImageIndex = 27
      OnExecute = ADesactivarEjercicioExecute
    end
    object AEliminarEjercicio: TAction
      Category = 'Procesos'
      Caption = 'Elimina el Ejercicio aunque tenga datos'
      Hint = 'Elimina el Ejercicio aunque tenga datos'
      ImageIndex = 27
      OnExecute = AEliminarEjercicioExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 220
    Top = 44
  end
end
