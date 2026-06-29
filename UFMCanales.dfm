inherited FMCanales: TFMCanales
  Left = 474
  Top = 300
  HelpContext = 308
  Caption = 'Canales'
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
        DataSource = DMCanales.DSQMCanales
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECanal
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBECanal
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
            Top = 32
          end
          object LBLCanal: TLFLabel
            Left = 35
            Top = 43
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
            FocusControl = DBECanal
          end
          object LBLTitulo: TLFLabel
            Left = 34
            Top = 65
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBECanal: TLFDbedit
            Left = 66
            Top = 40
            Width = 64
            Height = 21
            DataField = 'CANAL'
            DataSource = DMCanales.DSQMCanales
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 66
            Top = 62
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMCanales.DSQMCanales
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMCanales.DSQMCanales
          CamposAOrdenar.Strings = (
            'CANAL'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CANAL'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 271
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
    Left = 232
    Top = 100
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
    Left = 300
    Top = 36
  end
  inherited FSMain: TLFFibFormStorage
    Left = 302
    Top = 102
  end
end
