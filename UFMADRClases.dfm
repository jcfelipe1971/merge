inherited FMADRClases: TFMADRClases
  Left = 452
  Top = 275
  HelpContext = 290
  Caption = 'ADR - Clases'
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
        DataSource = DMADRClases.DSQMADRClases
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEClase
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
            DataSource = DMADRClases.DSQMADRClases
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ADR_CLASES'
            CampoNum = 'CLASS'
            CampoStr = 'NAME'
            OrdenadoPor.Strings = (
              'CLASS')
          end
          object LClase: TLFLabel
            Left = 40
            Top = 46
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clase'
          end
          object LTitulo: TLFLabel
            Left = 38
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEClase: TLFDbedit
            Left = 70
            Top = 42
            Width = 65
            Height = 21
            DataField = 'CLASS'
            DataSource = DMADRClases.DSQMADRClases
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 70
            Top = 64
            Width = 291
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'NAME'
            DataSource = DMADRClases.DSQMADRClases
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMADRClases.DSQMADRClases
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CLASS'
            'NAME')
          Columns = <
            item
              Expanded = False
              FieldName = 'CLASS'
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
