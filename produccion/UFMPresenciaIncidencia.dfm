inherited FMPresenciaIncidencia: TFMPresenciaIncidencia
  Left = 470
  Top = 263
  Caption = 'Incid'#233'ncias de Presencia'
  ClientHeight = 261
  ClientWidth = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 498
    Height = 237
    inherited TBMain: TLFToolBar
      Width = 494
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBETipo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
      end
    end
    inherited PCMain: TLFPageControl
      Width = 494
      Height = 207
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 486
          Height = 179
          inherited G2KTableLoc: TG2KTBLoc
            Left = 73
            Top = -6
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_TIPO_INCIDENCIA'
            CampoNum = 'ID_INCIDENCIA'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'ID_INCIDENCIA')
          end
          object LTipo: TLFLabel
            Left = 80
            Top = 42
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LDescripcion: TLFLabel
            Left = 45
            Top = 63
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LId: TLFLabel
            Left = 90
            Top = 20
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LIdentificadorInicidencia: TLFLabel
            Left = 10
            Top = 85
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Identificador Inicid.'
          end
          object LComportamiento: TLFLabel
            Left = 23
            Top = 107
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comportamiento'
          end
          object LBolsaHoras: TLFLabel
            Left = 27
            Top = 129
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bolsa de Horas'
          end
          object DBETipo: TLFDbedit
            Left = 105
            Top = 37
            Width = 50
            Height = 21
            DataField = 'TIPO'
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            TabOrder = 1
          end
          object DBEDescripcion: TLFDbedit
            Left = 105
            Top = 59
            Width = 368
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            TabOrder = 2
          end
          object DBEId: TLFDbedit
            Left = 105
            Top = 15
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_INCIDENCIA'
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            Enabled = False
            TabOrder = 0
          end
          object DBEIdentificadorInicidencia: TLFDbedit
            Left = 105
            Top = 81
            Width = 272
            Height = 21
            DataField = 'IDENTIFICADOR_INCIDENCIA'
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            TabOrder = 3
          end
          object DBCBComportamiento: TRxDBComboBox
            Left = 105
            Top = 103
            Width = 272
            Height = 21
            DataField = 'REMUNERACION'
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            ItemHeight = 13
            Items.Strings = (
              'Remunerada'
              'A recuperar'
              'No remunerada')
            TabOrder = 4
            Values.Strings = (
              '1'
              '-1'
              '0')
          end
          object DBCBBolsaHora: TRxDBComboBox
            Left = 105
            Top = 125
            Width = 272
            Height = 21
            DataField = 'BOLSA_HORAS'
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            ItemHeight = 13
            Items.Strings = (
              'Suma a bolsa de horas'
              'No actua'
              'Resto de bolsa de horas')
            TabOrder = 5
            Values.Strings = (
              '1'
              '0'
              '-1')
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 105
            Top = 149
            Width = 121
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMPresenciaIncidencia.DSQMIncPre
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 486
          Height = 179
          DataSource = DMPresenciaIncidencia.DSQMIncPre
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'DEFECTO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'BOLSA_HORAS'
            'DEFECTO'
            'DESCRIPCION'
            'ID_INCIDENCIA'
            'IDENTIFICADOR_INCIDENCIA'
            'REMUNERACION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_INCIDENCIA'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 269
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 50
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 237
    Width = 498
  end
  inherited CEMain: TControlEdit
    Left = 336
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 364
    Top = 12
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 392
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 424
    Top = 8
  end
end
