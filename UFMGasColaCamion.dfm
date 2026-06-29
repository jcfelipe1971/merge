inherited FMGasColaCamion: TFMGasColaCamion
  Left = 290
  Top = 245
  Caption = 'Mantenimiento Gas Cola Cami'#243'n'
  ClientHeight = 316
  ClientWidth = 509
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 509
    Height = 292
    inherited TBMain: TLFToolBar
      Width = 505
      inherited NavMain: THYMNavigator
        DataSource = DMGasColaCamion.DSQMGasColaCamion
        Hints.Strings = ()
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBETitulo
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
            DataSource = DMGasColaCamion.DSQMGasColaCamion
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_GAS_COLA_CAMION'
            CampoNum = 'COD_CAMION'
            CampoStr = 'TITULO'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'COD_CAMION')
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
            Left = 49
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LNotas: TLFLabel
            Left = 49
            Top = 79
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LFLCapacidad: TLFLabel
            Left = 26
            Top = 59
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Capacidad'
          end
          object DBETitulo: TLFDbedit
            Left = 81
            Top = 33
            Width = 393
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGasColaCamion.DSQMGasColaCamion
            TabOrder = 1
          end
          object DBECodigo: TLFDbedit
            Left = 81
            Top = 11
            Width = 67
            Height = 21
            DataField = 'COD_CAMION'
            DataSource = DMGasColaCamion.DSQMGasColaCamion
            TabOrder = 0
          end
          object DBMNotas: TLFDBMemo
            Left = 81
            Top = 77
            Width = 393
            Height = 141
            DataField = 'NOTAS'
            DataSource = DMGasColaCamion.DSQMGasColaCamion
            TabOrder = 3
          end
          object LFDCapacidad: TLFDbedit
            Left = 81
            Top = 55
            Width = 128
            Height = 21
            DataField = 'CAPACIDAD'
            DataSource = DMGasColaCamion.DSQMGasColaCamion
            TabOrder = 2
          end
          object DBCBEstado: TLFDBCheckBox
            Left = 397
            Top = 14
            Width = 77
            Height = 17
            Caption = 'Estado'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = DMGasColaCamion.DSQMGasColaCamion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 497
          Height = 234
          DataSource = DMGasColaCamion.DSQMGasColaCamion
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_CAMION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 262
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPACIDAD'
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
    Top = 72
  end
end
