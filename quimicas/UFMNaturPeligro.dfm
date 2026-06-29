inherited FMNaturPeligro: TFMNaturPeligro
  Left = 408
  Top = 316
  Caption = 'Mantenimiento de Naturaleza de Peligros'
  ClientHeight = 272
  ClientWidth = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 444
    Height = 248
    inherited TBMain: TLFToolBar
      Width = 440
      inherited NavMain: THYMNavigator
        DataSource = DMNaturPeligro.DSQMNaturPeligro
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      Width = 440
      Height = 218
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 432
          Height = 190
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMNaturPeligro.DSQMNaturPeligro
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_QUI_NATURALEZA_PELIGRO'
            CampoNum = 'COD_NATURALEZA_PELIGRO'
            CampoStr = 'DESCRIPCION_CORTA'
            OrdenadoPor.Strings = (
              'COD_NATURALEZA_PELIGRO')
          end
          object LblNaturPeligro: TLFLabel
            Left = 7
            Top = 11
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = 'Naturaleza del Peligro'
          end
          object LblDescCorta: TLFLabel
            Left = 54
            Top = 34
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. Corta'
          end
          object LblTexto: TLFLabel
            Left = 36
            Top = 54
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Texto Completo'
          end
          object DBENaturPeligro: TLFDbedit
            Left = 116
            Top = 7
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'COD_NATURALEZA_PELIGRO'
            DataSource = DMNaturPeligro.DSQMNaturPeligro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBMTexto: TLFDBMemo
            Left = 115
            Top = 51
            Width = 312
            Height = 138
            DataField = 'TEXTO'
            DataSource = DMNaturPeligro.DSQMNaturPeligro
            TabOrder = 1
          end
          object DBEDescCorta: TLFDbedit
            Left = 115
            Top = 29
            Width = 312
            Height = 21
            DataField = 'DESCRIPCION_CORTA'
            DataSource = DMNaturPeligro.DSQMNaturPeligro
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 432
          Height = 190
          DataSource = DMNaturPeligro.DSQMNaturPeligro
          CamposAOrdenar.Strings = (
            'COD_NATURALEZA_PELIGRO'
            'DESCRIPCION_CORTA')
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_NATURALEZA_PELIGRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_CORTA'
              Width = 278
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 248
    Width = 444
  end
  inherited ALMain: TLFActionList
    Left = 264
    Top = 52
  end
  inherited FSMain: TLFFibFormStorage
    Left = 316
    Top = 64
  end
end
