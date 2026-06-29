inherited FMPeriodoFacturacion: TFMPeriodoFacturacion
  Left = 443
  Top = 296
  HelpContext = 293
  Caption = 'Tipos de efectos'
  ClientHeight = 261
  ClientWidth = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 349
    Height = 237
    inherited TBMain: TLFToolBar
      Width = 345
      inherited NavMain: THYMNavigator
        DataSource = DMPeriodoFacturacion.DSQMPeriodoFacturacion
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        DataSource = DMPeriodoFacturacion.DSQMPeriodoFacturacion
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 314
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 345
      Height = 207
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 337
          Height = 179
          inherited G2KTableLoc: TG2KTBLoc
            Top = 72
          end
          object LPeriodo: TLFLabel
            Left = 23
            Top = 61
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodo'
          end
          object LTitulo: TLFLabel
            Left = 31
            Top = 83
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBETipo: TLFDbedit
            Left = 64
            Top = 57
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PERIODO'
            DataSource = DMPeriodoFacturacion.DSQMPeriodoFacturacion
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 64
            Top = 79
            Width = 200
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPeriodoFacturacion.DSQMPeriodoFacturacion
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 337
          Height = 179
          DataSource = DMPeriodoFacturacion.DSQMPeriodoFacturacion
          CamposAOrdenar.Strings = (
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 249
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 237
    Width = 349
  end
  inherited CEMain: TControlEdit
    DataSource = DMPeriodoFacturacion.DSQMPeriodoFacturacion
    Left = 192
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 230
    Top = 38
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
end
