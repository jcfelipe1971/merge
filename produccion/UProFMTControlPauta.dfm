inherited ProFMTControlPauta: TProFMTControlPauta
  Left = 562
  Top = 277
  Caption = 'Mantenimiento Tipo Control Pautas'
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
        DataSource = ProDMTControlPauta.DSTControlpauta
        Hints.Strings = ()
        EditaControl = LFDBTitulo
        InsertaControl = LFDBTitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LTipo: TLFLabel
            Left = 24
            Top = 48
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 19
            Top = 72
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LFDTipo: TLFDbedit
            Left = 49
            Top = 45
            Width = 43
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIPOCONTROL'
            DataSource = ProDMTControlPauta.DSTControlpauta
            ReadOnly = True
            TabOrder = 0
          end
          object LFDBTitulo: TLFDbedit
            Left = 49
            Top = 67
            Width = 320
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMTControlPauta.DSTControlpauta
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMTControlPauta.DSTControlpauta
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPOCONTROL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 297
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
    Top = 24
  end
end
