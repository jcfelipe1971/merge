inherited FMEtiAnilox: TFMEtiAnilox
  Left = 452
  Top = 275
  HelpContext = 290
  Caption = 'Etiquetas Anilox'
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
        DataSource = DMEtiAnilox.DSQMEtiAnilox
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEId_Anilox
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
      ActivePage = TSTabla
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Top = 34
            DataSource = DMEtiAnilox.DSQMEtiAnilox
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ETI_ANILOX'
            CampoNum = 'ID_ANILOX'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'ID_ANILOX')
          end
          object LId: TLFLabel
            Left = 57
            Top = 40
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object LTitulo: TLFLabel
            Left = 40
            Top = 62
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LValor: TLFLabel
            Left = 42
            Top = 84
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor'
          end
          object DBEId_Anilox: TLFDbedit
            Left = 70
            Top = 36
            Width = 65
            Height = 21
            Hint = 'C'#243'digo'
            DataField = 'ID_ANILOX'
            DataSource = DMEtiAnilox.DSQMEtiAnilox
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 70
            Top = 58
            Width = 291
            Height = 21
            Hint = 'Titulo'
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TITULO'
            DataSource = DMEtiAnilox.DSQMEtiAnilox
            TabOrder = 1
          end
          object DBEValor: TLFDbedit
            Left = 70
            Top = 80
            Width = 65
            Height = 21
            Hint = 'Color Decimal'
            DataField = 'VALOR'
            DataSource = DMEtiAnilox.DSQMEtiAnilox
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMEtiAnilox.DSQMEtiAnilox
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CLASS'
            'NAME')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ANILOX'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
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
