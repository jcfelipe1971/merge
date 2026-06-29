inherited FMTipoColoresTallas: TFMTipoColoresTallas
  Left = 355
  Top = 351
  Caption = 'Colores de articulos'
  ClientHeight = 209
  ClientWidth = 368
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 368
    Height = 185
    inherited TBMain: TLFToolBar
      Width = 364
      inherited NavMain: THYMNavigator
        DataSource = DSart_tipo_color
        Hints.Strings = ()
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        DataSource = DSart_tipo_color
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 364
      Height = 155
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 356
          Height = 127
          inherited G2KTableLoc: TG2KTBLoc
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_TIPO_COLOR'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 31
            Top = 36
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 27
            Top = 58
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object DBECodigo: TLFDbedit
            Left = 56
            Top = 32
            Width = 57
            Height = 21
            DataField = 'TIPO'
            DataSource = DSart_tipo_color
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 56
            Top = 54
            Width = 289
            Height = 21
            DataField = 'TITULO'
            DataSource = DSart_tipo_color
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 356
          Height = 127
          DataSource = DSart_tipo_color
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'COD_COLOR'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 250
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 185
    Width = 368
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    DataSource = DSart_tipo_color
    Left = 276
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 248
    Top = 48
  end
  object DSart_tipo_color: TDataSource
    Left = 160
    Top = 40
  end
end
