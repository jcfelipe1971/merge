inherited FMADRUNNumbers: TFMADRUNNumbers
  Left = 452
  Top = 275
  HelpContext = 290
  Caption = 'ADR - N'#250'meros UN'
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
        DataSource = DMADRUNNumbers.DSQMADRUNNumbers
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBENumeroUN
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
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
            DataSource = DMADRUNNumbers.DSQMADRUNNumbers
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ADR_NUMBERS'
            CampoNum = 'UN_NUMBER'
            CampoStr = 'NAME'
            OrdenadoPor.Strings = (
              'UN_NUMBER')
          end
          object LNumeroUN: TLFLabel
            Left = 10
            Top = 46
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero UN'
          end
          object LTitulo: TLFLabel
            Left = 38
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBENumeroUN: TLFDbedit
            Left = 70
            Top = 42
            Width = 65
            Height = 21
            DataField = 'UN_NUMBER'
            DataSource = DMADRUNNumbers.DSQMADRUNNumbers
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 70
            Top = 64
            Width = 291
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'NAME'
            DataSource = DMADRUNNumbers.DSQMADRUNNumbers
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMADRUNNumbers.DSQMADRUNNumbers
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'NAME'
            'UN_NUMBER')
          Columns = <
            item
              Expanded = False
              FieldName = 'UN_NUMBER'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 276
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
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 84
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 84
  end
end
