inherited FMRepisas: TFMRepisas
  Left = 485
  Top = 338
  HelpContext = 308
  Caption = 'Repisas'
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
        DataSource = DMRepisas.DSQMRepisas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBERepisa
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBERepisa
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
          object LBLCanal: TLFLabel
            Left = 29
            Top = 51
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Repisa'
            FocusControl = DBERepisa
          end
          object LBLTitulo: TLFLabel
            Left = 34
            Top = 73
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBERepisa: TLFDbedit
            Left = 66
            Top = 48
            Width = 40
            Height = 21
            DataField = 'REPISA'
            DataSource = DMRepisas.DSQMRepisas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 66
            Top = 70
            Width = 283
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMRepisas.DSQMRepisas
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMRepisas.DSQMRepisas
          CamposAOrdenar.Strings = (
            'CANAL'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'REPISA'
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
