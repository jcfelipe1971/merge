inherited ZFMColores: TZFMColores
  Left = 334
  Top = 233
  Caption = 'Mantenimiento de Colores'
  ClientHeight = 218
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = ZDMColores.DSQMColores
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBEDescripcion
        InsertaControl = DBECodigo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 75
            Top = 32
            DataSource = ZDMColores.DSQMColores
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_SYS_COLORES'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 60
            Top = 15
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object LDescripcion: TLFLabel
            Left = 36
            Top = 37
            Width = 56
            Height = 13
            Caption = 'Descripci'#243'n'
          end
          object LCodComponente: TLFLabel
            Left = 7
            Top = 59
            Width = 85
            Height = 13
            Caption = 'C'#243'd. Componente'
          end
          object LDiasRetraso: TLFLabel
            Left = 29
            Top = 81
            Width = 63
            Height = 13
            Caption = 'D'#237'as Retraso'
          end
          object LPorcentajeIncrementeo: TLFLabel
            Left = 36
            Top = 103
            Width = 56
            Height = 13
            Caption = '% Incr. PVP'
          end
          object LCodColor: TLFLabel
            Left = 228
            Top = 59
            Width = 49
            Height = 13
            Caption = 'C'#243'd. Color'
          end
          object DBECodigo: TLFDbedit
            Left = 98
            Top = 11
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = ZDMColores.DSQMColores
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 98
            Top = 33
            Width = 250
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMColores.DSQMColores
            TabOrder = 1
          end
          object DBECodComponente: TLFDbedit
            Left = 98
            Top = 55
            Width = 50
            Height = 21
            DataField = 'CODIGO_COMPONENTE'
            DataSource = ZDMColores.DSQMColores
            TabOrder = 2
          end
          object DBEDiasRetraso: TLFDbedit
            Left = 98
            Top = 77
            Width = 50
            Height = 21
            DataField = 'DIAS_RETRASO'
            DataSource = ZDMColores.DSQMColores
            TabOrder = 3
          end
          object DBEPorcentajeIncrementeo: TLFDbedit
            Left = 98
            Top = 99
            Width = 50
            Height = 21
            DataField = 'INCREMENTO_PVP'
            DataSource = ZDMColores.DSQMColores
            TabOrder = 4
          end
          object CBColor: TLFDBCheckBox
            Left = 210
            Top = 13
            Width = 47
            Height = 17
            Caption = 'Color'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'COLOR'
            DataSource = ZDMColores.DSQMColores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EColor: TLFEdit
            Left = 284
            Top = 55
            Width = 64
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 7
            Text = '        ...'
            OnClick = EColorClick
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 298
            Top = 13
            Width = 47
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = ZDMColores.DSQMColores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ZDMColores.DSQMColores
          OnDblClick = DBGMainDblClick
          OnKeyUp = DBGMainKeyUp
          OnMouseUp = DBGMainMouseUp
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_COMPONENTE'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAS_RETRASO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO_PVP'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 146
    Top = 32
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 180
    Top = 32
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 248
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 214
    Top = 32
  end
end
