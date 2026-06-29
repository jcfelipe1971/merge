inherited FMUnidadesLogisitcas: TFMUnidadesLogisitcas
  Left = 448
  Top = 176
  Caption = 'Unidades Logisitcas'
  ClientHeight = 220
  ClientWidth = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 386
    Height = 196
    inherited TBMain: TLFToolBar
      Width = 382
      inherited NavMain: THYMNavigator
        DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 382
      Height = 166
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 374
          Height = 138
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_UNIDAD_LOGISTICA'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LUnidad: TLFLabel
            Left = 37
            Top = 29
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 41
            Top = 51
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LUnidades: TLFLabel
            Left = 25
            Top = 73
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object DBETipo: TLFDbedit
            Left = 74
            Top = 26
            Width = 121
            Height = 21
            DataField = 'TIPO'
            DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 74
            Top = 48
            Width = 289
            Height = 21
            DataField = 'TITULO'
            DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
            TabOrder = 1
          end
          object DBEUnidades: TLFDbedit
            Left = 74
            Top = 70
            Width = 121
            Height = 21
            DataField = 'UNIDADES'
            DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
            TabOrder = 2
          end
          object DBCHKCambio: TLFDBCheckBox
            Left = 73
            Top = 97
            Width = 272
            Height = 17
            Caption = 'Relacionar unidades log'#237'sticas con unidades.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RELACIONAR_CON_UNIDADES'
            DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 374
          Height = 138
          DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RELACIONAR_CON_UNIDADES'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 196
    Width = 386
  end
  inherited CEMain: TControlEdit
    DataSource = DMUnidadesLogisitcas.DSQMUnidadesLogisticas
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 64
  end
end
