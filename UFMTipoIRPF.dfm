inherited FMTipoIRPF: TFMTipoIRPF
  Left = 537
  Top = 200
  HelpContext = 304
  Caption = 'Tipo de I.R.P.F.'
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
        DataSource = DMTipoIRPF.DSTipoIRPF
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
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
            Top = 39
            DataSource = DMTipoIRPF.DSTipoIRPF
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_IRPF'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 51
            Top = 21
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 44
            Top = 43
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LIRPF: TLFLabel
            Left = 25
            Top = 65
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.R.P.F. %'
          end
          object LAplicableA: TLFLabel
            Left = 20
            Top = 87
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aplicable a'
          end
          object DBETipo: TLFDbedit
            Left = 76
            Top = 17
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMTipoIRPF.DSTipoIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 76
            Top = 39
            Width = 294
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TITULO'
            DataSource = DMTipoIRPF.DSTipoIRPF
            TabOrder = 1
          end
          object DBEP_Iva: TLFDbedit
            Left = 76
            Top = 61
            Width = 47
            Height = 21
            DataField = 'P_IRPF'
            DataSource = DMTipoIRPF.DSTipoIRPF
            TabOrder = 2
          end
          object DBCBVMetodo: TDBComboBoxValue
            Left = 76
            Top = 83
            Width = 105
            Height = 21
            Style = csDropDownList
            DataField = 'BASE'
            DataSource = DMTipoIRPF.DSTipoIRPF
            ItemHeight = 13
            Items.Strings = (
              'Base Imponible'
              'Total con IVA')
            Values.Strings = (
              '0'
              '1')
            TabOrder = 3
          end
          object LFDBCBTipoGanadero: TLFDBCheckBox
            Left = 199
            Top = 63
            Width = 150
            Height = 17
            Caption = 'Tipo agr'#237'cola y ganadero'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TIPO_GANADERO'
            DataSource = DMTipoIRPF.DSTipoIRPF
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBIncEnModelo: TLFDBCheckBox
            Left = 199
            Top = 84
            Width = 170
            Height = 17
            Caption = 'Incluir en Modelo de Retenci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INCLUIR_ENMODELO'
            DataSource = DMTipoIRPF.DSTipoIRPF
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMTipoIRPF.DSTipoIRPF
          CamposAOrdenar.Strings = (
            'BASE'
            'P_IRPF'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 171
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_IRPF'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE'
              Width = 88
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
    Left = 324
    Top = 28
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
