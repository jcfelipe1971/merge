inherited IsoFMNormativas: TIsoFMNormativas
  Left = 290
  Top = 245
  Caption = 'Mantenimiento Normativas'
  ClientHeight = 316
  ClientWidth = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 509
    Height = 292
    inherited TBMain: TLFToolBar
      Width = 505
      inherited NavMain: THYMNavigator
        DataSource = IsoDMNormativas.DSQMIsoNormativas
        Hints.Strings = ()
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBELey
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 505
      Height = 262
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 497
          Height = 234
          inherited G2KTableLoc: TG2KTBLoc
            Left = 62
            Top = 39
            DataSource = IsoDMNormativas.DSQMIsoNormativas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_NORMATIVAS'
            CampoNum = 'CODIGO'
            CampoStr = 'LEY'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 44
            Top = 15
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LLey: TLFLabel
            Left = 60
            Top = 36
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ley'
            FocusControl = DBELey
          end
          object LDescripcion: TLFLabel
            Left = 21
            Top = 79
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFechaVigor: TLFLabel
            Left = 20
            Top = 58
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Vigor'
          end
          object DBELey: TLFDbedit
            Left = 81
            Top = 33
            Width = 393
            Height = 21
            DataField = 'LEY'
            DataSource = IsoDMNormativas.DSQMIsoNormativas
            TabOrder = 1
          end
          object DBECodigo: TLFDbedit
            Left = 81
            Top = 11
            Width = 67
            Height = 21
            DataField = 'CODIGO'
            DataSource = IsoDMNormativas.DSQMIsoNormativas
            TabOrder = 0
          end
          object DBMDescripcion: TLFDBMemo
            Left = 81
            Top = 77
            Width = 393
            Height = 141
            DataField = 'DESCRIPCION'
            DataSource = IsoDMNormativas.DSQMIsoNormativas
            TabOrder = 3
          end
          object DBDEFechaVigor: TLFDBDateEdit
            Left = 81
            Top = 55
            Width = 121
            Height = 21
            DataField = 'FECHA_VIGOR'
            DataSource = IsoDMNormativas.DSQMIsoNormativas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 497
          Height = 234
          DataSource = IsoDMNormativas.DSQMIsoNormativas
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LEY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_VIGOR'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 244
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 292
    Width = 509
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEMain
    Top = 29
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 29
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 60
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
  end
end
