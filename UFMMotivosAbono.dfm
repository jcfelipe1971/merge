inherited FMMotivosAbono: TFMMotivosAbono
  Left = 452
  Top = 275
  HelpContext = 290
  Caption = 'Entidades'
  ClientHeight = 284
  ClientWidth = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 462
    Height = 260
    inherited TBMain: TLFToolBar
      Width = 458
      inherited NavMain: THYMNavigator
        DataSource = DMMotivosAbono.DSQMMotivosAbono
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEEntidad
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
      Width = 458
      Height = 230
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 450
          Height = 202
          inherited G2KTableLoc: TG2KTBLoc
            Left = 48
          end
          object LCodigo: TLFLabel
            Left = 17
            Top = 46
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo'
          end
          object LTitulo: TLFLabel
            Left = 22
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEEntidad: TLFDbedit
            Left = 54
            Top = 42
            Width = 65
            Height = 21
            DataField = 'CODIGO'
            DataSource = DMMotivosAbono.DSQMMotivosAbono
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 54
            Top = 64
            Width = 360
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMMotivosAbono.DSQMMotivosAbono
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 450
          Height = 202
          DataSource = DMMotivosAbono.DSQMMotivosAbono
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = DBGMain.FPopUpMenuColumnsFMMotivosAbono
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CODIGO'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 360
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 260
    Width = 462
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 84
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 84
  end
end
