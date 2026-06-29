inherited FMMedidasProtec: TFMMedidasProtec
  Left = 476
  Top = 399
  Caption = 'Mantenimiento de Medidas de Protecci'#243'n'
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
        DataSource = DMMedidasProtec.DSQMMedidasProtec
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
            DataSource = DMMedidasProtec.DSQMMedidasProtec
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_QUI_MEDIDAS_PROTECCION'
            CampoNum = 'COD_MEDIDAS_PROTECCION'
            CampoStr = 'DESCRIPCION_CORTA'
            OrdenadoPor.Strings = (
              'COD_MEDIDAS_PROTECCION')
          end
          object LblMedidasProtec: TLFLabel
            Left = 6
            Top = 10
            Width = 109
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medidas de Protecci'#243'n'
          end
          object LblTexto: TLFLabel
            Left = 41
            Top = 54
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Texto Completo'
          end
          object LblDescCorta: TLFLabel
            Left = 59
            Top = 34
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. Corta'
          end
          object DBEMedidasProtec: TLFDbedit
            Left = 119
            Top = 7
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'COD_MEDIDAS_PROTECCION'
            DataSource = DMMedidasProtec.DSQMMedidasProtec
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
            Left = 119
            Top = 51
            Width = 307
            Height = 138
            DataField = 'TEXTO'
            DataSource = DMMedidasProtec.DSQMMedidasProtec
            TabOrder = 1
          end
          object DBEDescCorta: TLFDbedit
            Left = 119
            Top = 29
            Width = 307
            Height = 21
            DataField = 'DESCRIPCION_CORTA'
            DataSource = DMMedidasProtec.DSQMMedidasProtec
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 432
          Height = 190
          DataSource = DMMedidasProtec.DSQMMedidasProtec
          CamposAOrdenar.Strings = (
            'COD_MEDIDAS_PROTECCION'
            'DESCRIPCION_CORTA')
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_MEDIDAS_PROTECCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_CORTA'
              Width = 269
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
    Left = 252
    Top = 44
  end
  inherited FSMain: TLFFibFormStorage
    Left = 350
    Top = 36
  end
end
