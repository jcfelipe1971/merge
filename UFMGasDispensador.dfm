inherited FMGasDispensador: TFMGasDispensador
  Left = 509
  Top = 185
  Caption = 'Mantenimiento Gas Dispensador'
  ClientHeight = 316
  ClientWidth = 509
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Z_LblEstado: TLFLabel [0]
    Left = 175
    Top = 111
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  inherited PMain: TLFPanel
    Width = 509
    Height = 292
    inherited TBMain: TLFToolBar
      Width = 505
      inherited NavMain: THYMNavigator
        DataSource = DMGasDispensador.DSQMGasDispensador
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
            DataSource = DMGasDispensador.DSQMGasDispensador
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_GAS_DISPENSADOR'
            CampoNum = 'COD_DISPENSADOR'
            CampoStr = 'TITULO'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'COD_DISPENSADOR')
          end
          object LCodigo: TLFLabel
            Left = 44
            Top = 15
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 49
            Top = 37
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LNotas: TLFLabel
            Left = 49
            Top = 80
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LSerie: TLFLabel
            Left = 182
            Top = 15
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LLecturaFinal: TLFLabel
            Left = 16
            Top = 59
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lectura Final'
            FocusControl = DBELecturaFinal
          end
          object DBETitulo: TLFDbedit
            Left = 81
            Top = 33
            Width = 393
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGasDispensador.DSQMGasDispensador
            TabOrder = 3
          end
          object DBECodigo: TLFDbedit
            Left = 81
            Top = 11
            Width = 67
            Height = 21
            DataField = 'COD_DISPENSADOR'
            DataSource = DMGasDispensador.DSQMGasDispensador
            TabOrder = 0
          end
          object DBMNotas: TLFDBMemo
            Left = 81
            Top = 77
            Width = 393
            Height = 112
            DataField = 'NOTAS'
            DataSource = DMGasDispensador.DSQMGasDispensador
            TabOrder = 5
          end
          object DBCBEstado: TLFDBCheckBox
            Left = 418
            Top = 13
            Width = 56
            Height = 17
            Caption = 'Estado'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = DMGasDispensador.DSQMGasDispensador
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETituloSerie: TLFDbedit
            Left = 274
            Top = 11
            Width = 143
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescSerie'
            DataSource = DMGasTanque.DSQMGasTanque
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 210
            Top = 11
            Width = 63
            Height = 21
            DataField = 'SERIE'
            DataSource = DMGasDispensador.DSQMGasDispensador
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBDistribucion: TLFDBCheckBox
            Left = 0
            Top = 195
            Width = 94
            Height = 17
            Caption = 'Distribuci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DISTRIBUCION'
            DataSource = DMGasDispensador.DSQMGasDispensador
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBELecturaFinal: TLFDbedit
            Left = 81
            Top = 55
            Width = 124
            Height = 21
            DataField = 'LECTURA_FINAL'
            DataSource = DMGasDispensador.DSQMGasDispensador
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 497
          Height = 234
          DataSource = DMGasDispensador.DSQMGasDispensador
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_DISPENSADOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 308
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
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
    Left = 368
    Top = 1
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 404
    Top = 1
  end
  inherited ALMain: TLFActionList
    Top = 28
  end
  inherited FSMain: TLFFibFormStorage
    Left = 405
    Top = 29
  end
end
