inherited FMMateriales: TFMMateriales
  Left = 378
  Top = 258
  HelpContext = 293
  Caption = 'Tipos de Materiales'
  ClientHeight = 207
  ClientWidth = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 387
    Height = 183
    inherited TBMain: TLFToolBar
      Width = 383
      inherited NavMain: THYMNavigator
        DataSource = DMMateriales.DSQMMateriales
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 383
      Height = 153
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 375
          Height = 125
          inherited G2KTableLoc: TG2KTBLoc
            Top = 48
            DataSource = DMMateriales.DSQMMateriales
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'sys_materiales'
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 25
            Top = 37
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 31
            Top = 59
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBETipo: TLFDbedit
            Left = 64
            Top = 33
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = DMMateriales.DSQMMateriales
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 64
            Top = 55
            Width = 289
            Height = 21
            DataField = 'TITULO'
            DataSource = DMMateriales.DSQMMateriales
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 375
          Height = 125
          DataSource = DMMateriales.DSQMMateriales
          CamposAOrdenar.Strings = (
            'CODIGO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 261
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 183
    Width = 387
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
    Left = 328
    Top = 32
  end
end
