inherited FMCalles: TFMCalles
  Left = 485
  Top = 338
  HelpContext = 308
  Caption = 'Calles'
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
        DataSource = DMCalles.DSQMCalles
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECalle
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBECalle
        Busca02 = DBETitulo
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
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
            Top = 24
          end
          object LBLCanal: TLFLabel
            Left = 39
            Top = 35
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calle'
            FocusControl = DBECalle
          end
          object LBLTitulo: TLFLabel
            Left = 34
            Top = 57
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBECalle: TLFDbedit
            Left = 66
            Top = 32
            Width = 40
            Height = 21
            DataField = 'CALLE'
            DataSource = DMCalles.DSQMCalles
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 66
            Top = 54
            Width = 283
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMCalles.DSQMCalles
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMCalles.DSQMCalles
          CamposAOrdenar.Strings = (
            'CANAL'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CALLE'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 290
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
    Left = 236
    Top = 32
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 324
    Top = 36
  end
  inherited FSMain: TLFFibFormStorage
    Left = 358
    Top = 38
  end
end
