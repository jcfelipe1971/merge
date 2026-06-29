inherited FMComoNosConocieron: TFMComoNosConocieron
  Left = 378
  Top = 258
  HelpContext = 293
  Caption = 'Tipos de Art'#237'culo'
  ClientHeight = 274
  ClientWidth = 372
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 372
    Height = 250
    inherited TBMain: TLFToolBar
      Width = 368
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 368
      Height = 220
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 360
          Height = 192
          inherited G2KTableLoc: TG2KTBLoc
            Top = 80
            Tabla_a_buscar = 'SYS_COMO_NOS_CONOCIERON'
            CampoNum = 'MODO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'MODO')
          end
          object LModo: TLFLabel
            Left = 32
            Top = 69
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo'
          end
          object LTitulo: TLFLabel
            Left = 31
            Top = 91
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEModo: TLFDbedit
            Left = 64
            Top = 65
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MODO'
            DataSource = DMComoNosConocieron.DSQMComoNosConocieron
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 64
            Top = 87
            Width = 281
            Height = 21
            DataField = 'TITULO'
            DataSource = DMComoNosConocieron.DSQMComoNosConocieron
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 360
          Height = 192
          CamposAOrdenar.Strings = (
            'MODO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'MODO'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 274
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 250
    Width = 372
  end
  inherited CEMain: TControlEdit
    Left = 192
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 230
    Top = 38
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 264
    Top = 32
  end
end
