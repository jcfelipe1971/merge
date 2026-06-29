inherited FMGrupoIncoterm: TFMGrupoIncoterm
  Left = 455
  Top = 324
  Caption = 'Grupos Incoterm'
  ClientHeight = 195
  ClientWidth = 440
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 440
    Height = 171
    inherited TBMain: TLFToolBar
      Width = 436
      inherited NavMain: THYMNavigator
        DataSource = DMGrupoIncoterm.DSQMGrupo
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEProtocolo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 436
      Height = 141
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 428
          Height = 113
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            DataSource = DMGrupoIncoterm.DSQMGrupo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_GRUPO_INCOTERM'
            CampoNum = 'GRUPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'GRUPO')
          end
          object LGrupo: TLFLabel
            Left = 27
            Top = 38
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object LTitulo: TLFLabel
            Left = 28
            Top = 59
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEProtocolo: TLFDbedit
            Left = 61
            Top = 34
            Width = 76
            Height = 21
            DataField = 'GRUPO'
            DataSource = DMGrupoIncoterm.DSQMGrupo
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 61
            Top = 56
            Width = 357
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TITULO'
            DataSource = DMGrupoIncoterm.DSQMGrupo
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 428
          Height = 113
          DataSource = DMGrupoIncoterm.DSQMGrupo
          CamposAOrdenar.Strings = (
            'GRUPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'GRUPO'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 343
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 171
    Width = 440
  end
  inherited ALMain: TLFActionList
    Left = 248
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 216
    Top = 32
  end
end
