inherited ProFMTipoRevisionesMaq: TProFMTipoRevisionesMaq
  Left = 765
  Top = 171
  Caption = 'Mantenimiento Tipo Revisiones M'#225'qiunas'
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
        DataSource = ProDMTipoRevionesMaq.DSTipoRevisionesMaq
        Hints.Strings = ()
        EditaControl = LFDBTitulo
        InsertaControl = LFDBTipo
      end
      inherited EPMain: THYMEditPanel
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
            DataSource = ProDMTipoRevionesMaq.DSTipoRevisionesMaq
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_TIPO_REVISIONES_MAQ'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
          end
          object LTipo: TLFLabel
            Left = 40
            Top = 17
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 35
            Top = 41
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LNotas: TLFLabel
            Left = 33
            Top = 61
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LFDBTipo: TLFDbedit
            Left = 65
            Top = 15
            Width = 44
            Height = 21
            DataField = 'TIPO'
            DataSource = ProDMTipoRevionesMaq.DSTipoRevisionesMaq
            TabOrder = 0
          end
          object LFDBTitulo: TLFDbedit
            Left = 65
            Top = 37
            Width = 296
            Height = 21
            DataField = 'TITULO'
            DataSource = ProDMTipoRevionesMaq.DSTipoRevisionesMaq
            TabOrder = 1
          end
          object LFDBNotas: TLFDBMemo
            Left = 65
            Top = 59
            Width = 297
            Height = 69
            DataField = 'NOTAS'
            DataSource = ProDMTipoRevionesMaq.DSTipoRevisionesMaq
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMTipoRevionesMaq.DSTipoRevisionesMaq
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 240
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
  inherited ALMain: TLFActionList
    Left = 360
    Top = 40
  end
end
