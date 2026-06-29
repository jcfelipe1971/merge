inherited FMConceptos: TFMConceptos
  Left = 413
  Top = 315
  HelpContext = 283
  Caption = 'Conceptos'
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
        DataSource = DMConceptos.DSQMConceptos
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEConcepto
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEConcepto
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
            DataSource = DMConceptos.DSQMConceptos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_CONCEPTOS'
            CampoNum = 'CONCEPTO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CONCEPTO')
          end
          object LBLConcepto: TLFLabel
            Left = 22
            Top = 46
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Concepto'
            FocusControl = DBEConcepto
          end
          object LBLTitulo: TLFLabel
            Left = 40
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBEConcepto: TLFDbedit
            Left = 72
            Top = 42
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CONCEPTO'
            DataSource = DMConceptos.DSQMConceptos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 72
            Top = 64
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = DMConceptos.DSQMConceptos
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMConceptos.DSQMConceptos
          CamposAOrdenar.Strings = (
            'CONCEPTO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CONCEPTO'
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
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 184
    Top = 36
  end
  inherited FSMain: TLFFibFormStorage
    Left = 224
    Top = 36
  end
end
