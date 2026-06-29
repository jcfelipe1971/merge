inherited FMSeries: TFMSeries
  Left = 527
  Top = 368
  HelpContext = 311
  Caption = 'Series'
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
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBESerie
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBESerie
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
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
            DataSource = DMSeries.DSSeries
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_SERIES'
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'SERIE')
          end
          object LSerie: TLFLabel
            Left = 25
            Top = 48
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
            FocusControl = DBESerie
          end
          object LTitulo: TLFLabel
            Left = 21
            Top = 70
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBESerie: TLFDbedit
            Left = 54
            Top = 44
            Width = 80
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE'
            DataSource = DMSeries.DSSeries
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 54
            Top = 66
            Width = 310
            Height = 21
            DataField = 'TITULO'
            DataSource = DMSeries.DSSeries
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          CamposAOrdenar.Strings = (
            'SERIE'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 268
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
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
