inherited IsoFMIncTipo: TIsoFMIncTipo
  Left = 290
  Top = 245
  Caption = 'Mantenimiento Tipos de INC'
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
        DataSource = IsoDMIncTipo.DSQMIsoIncTipo
        Hints.Strings = ()
        EditaControl = DBETipo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBEDescripcion
        OnClickRango = EPMainClickRango
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
            Left = 62
            Top = 75
          end
          object LblTipo: TLFLabel
            Left = 53
            Top = 36
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LblDescripcion: TLFLabel
            Left = 18
            Top = 58
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object DBEDescripcion: TLFDbedit
            Left = 78
            Top = 54
            Width = 289
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMIncTipo.DSQMIsoIncTipo
            TabOrder = 1
          end
          object DBETipo: TLFDbedit
            Left = 78
            Top = 32
            Width = 33
            Height = 21
            DataField = 'TIPO'
            DataSource = IsoDMIncTipo.DSQMIsoIncTipo
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = IsoDMIncTipo.DSQMIsoIncTipo
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 299
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
    EnlazadoA = CEMain
    Top = 29
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 29
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 60
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 56
  end
end
