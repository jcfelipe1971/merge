inherited FMTiposDir: TFMTiposDir
  Left = 422
  Top = 318
  HelpContext = 2217
  Caption = 'Tipos de Direcci'#243'n'
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
        DataSource = DMTiposDir.DSQMTiposDir
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBTitulo
        InsertaControl = DBTipo
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
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
            Top = 32
            DataSource = DMTiposDir.DSQMTiposDir
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_DIRECCION'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LBTipo: TLFLabel
            Left = 31
            Top = 38
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBTitulo: TLFLabel
            Left = 24
            Top = 60
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBTipo: THYDBEdit
            Left = 56
            Top = 34
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = DMTiposDir.DSQMTiposDir
            Enabled = False
            TabOrder = 0
          end
          object DBTitulo: THYDBEdit
            Left = 56
            Top = 56
            Width = 310
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTiposDir.DSQMTiposDir
            Enabled = False
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMTiposDir.DSQMTiposDir
          CamposAOrdenar.Strings = (
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 284
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
    Left = 128
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 164
    Top = 12
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
