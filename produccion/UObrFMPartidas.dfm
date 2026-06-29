inherited ObrFMPartidas: TObrFMPartidas
  Caption = 'Mantenimiento de partidas de obras'
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
        DataSource = ObrDMPartidas.DSObrPartidas
        Hints.Strings = ()
        EditaControl = DBEPartida
        InsertaControl = DBEPartida
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      ActivePage = TSTabla
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LPartida: TLFLabel
            Left = 40
            Top = 44
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Partida'
          end
          object LDescripcion: TLFLabel
            Left = 17
            Top = 66
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object DBEPartida: TLFDbedit
            Left = 80
            Top = 40
            Width = 57
            Height = 21
            DataField = 'PARTIDA'
            DataSource = ObrDMPartidas.DSObrPartidas
            TabOrder = 0
          end
          object DBEDescPartida: TLFDbedit
            Left = 80
            Top = 62
            Width = 241
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ObrDMPartidas.DSObrPartidas
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ObrDMPartidas.DSObrPartidas
          Columns = <
            item
              Expanded = False
              FieldName = 'PARTIDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 315
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
end
