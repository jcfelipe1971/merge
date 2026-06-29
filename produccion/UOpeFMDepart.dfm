inherited OpeFMDepart: TOpeFMDepart
  Left = 307
  Top = 328
  Caption = 'Mantenimiento de Departamentos'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBEDescrip
        InsertaControl = DBEDepart
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 276
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LDepartamento: TLFLabel
            Left = -1
            Top = 40
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Departamento'
            FocusControl = DBEDepart
          end
          object LDescripcion: TLFLabel
            Left = 10
            Top = 62
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescrip
          end
          object DBEDepart: TLFDbedit
            Left = 71
            Top = 37
            Width = 49
            Height = 21
            DataField = 'DEPARTAMENTO'
            DataSource = OpeDMDepart.DSQMDepartamento
            TabOrder = 0
          end
          object DBEDescrip: TLFDbedit
            Left = 71
            Top = 59
            Width = 297
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMDepart.DSQMDepartamento
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 81
          CamposAOrdenar.Strings = (
            'DEPARTAMENTO'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'DEPARTAMENTO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 308
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
    EdgeOuter = esNone
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 352
    Top = 40
  end
end
