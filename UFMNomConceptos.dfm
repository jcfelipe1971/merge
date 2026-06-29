inherited FMNomConceptos: TFMNomConceptos
  Left = 450
  Top = 209
  Width = 677
  Height = 495
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Conceptos N'#243'minas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 667
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 663
      inherited NavMain: THYMNavigator
        DataSource = DMNomConceptos.DSQMNomConcep
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEConcepto
      end
      inherited EPMain: THYMEditPanel
        Width = 66
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 294
      end
      inherited TbuttComp: TToolButton
        Left = 302
      end
    end
    inherited PCMain: TLFPageControl
      Width = 663
      Height = 412
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 655
          Height = 384
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMNomConceptos.DSQMNomConcep
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_NOMINA_CONCEPTOS'
            CampoNum = 'CONCEPTO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'CONCEPTO')
          end
          object LConcepto: TLFLabel
            Left = 27
            Top = 58
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Concepto'
          end
          object LDescripcion: TLFLabel
            Left = 17
            Top = 80
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripcion'
          end
          object LTipo: TLFLabel
            Left = 52
            Top = 102
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LCalve: TLFLabel
            Left = 46
            Top = 124
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave'
          end
          object LSubClave: TLFLabel
            Left = 28
            Top = 146
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subclave'
          end
          object LTipoContabilizacion: TLFLabel
            Left = 2
            Top = 250
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contabilizacion'
          end
          object LSigno: TLFLabel
            Left = 46
            Top = 176
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Signo'
          end
          object LTipoImporte: TLFLabel
            Left = 14
            Top = 198
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Importe'
          end
          object LTipoConcepto: TLFLabel
            Left = 3
            Top = 220
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Concepto'
          end
          object LSignoContabilizacion: TLFLabel
            Left = 6
            Top = 272
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Signo Contab.'
          end
          object DBEConcepto: TLFDbedit
            Left = 79
            Top = 55
            Width = 154
            Height = 21
            DataField = 'CONCEPTO'
            DataSource = DMNomConceptos.DSQMNomConcep
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 79
            Top = 77
            Width = 554
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMNomConceptos.DSQMNomConcep
            TabOrder = 1
          end
          object DBETipo: TLFDbedit
            Left = 79
            Top = 99
            Width = 154
            Height = 21
            DataField = 'TIPO'
            DataSource = DMNomConceptos.DSQMNomConcep
            TabOrder = 2
          end
          object DBEClave: TLFDbedit
            Left = 79
            Top = 121
            Width = 154
            Height = 21
            DataField = 'CLAVE'
            DataSource = DMNomConceptos.DSQMNomConcep
            TabOrder = 3
          end
          object DBCBSegSocial: TLFDBCheckBox
            Left = 351
            Top = 111
            Width = 154
            Height = 17
            Caption = 'Seguridad Social'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'SEG_SOCIAL'
            DataSource = DMNomConceptos.DSQMNomConcep
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBHorasFuerzaMayor: TLFDBCheckBox
            Left = 351
            Top = 133
            Width = 154
            Height = 17
            Caption = 'Horas Fuerza Mayor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'HORAS_FUERZA_MAYOR'
            DataSource = DMNomConceptos.DSQMNomConcep
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBESubClave: TLFDbedit
            Left = 79
            Top = 143
            Width = 154
            Height = 21
            DataField = 'SUB_CLAVE'
            DataSource = DMNomConceptos.DSQMNomConcep
            TabOrder = 4
          end
          object DBCHActualizaConvenio: TLFDBCheckBox
            Left = 351
            Top = 155
            Width = 154
            Height = 17
            Caption = 'Actualiza Convenio'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'ACTUALIZA_DE_CONVENIO'
            DataSource = DMNomConceptos.DSQMNomConcep
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPositivo: TLFDBCheckBox
            Left = 351
            Top = 177
            Width = 154
            Height = 17
            Caption = 'Positivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'POSITIVO'
            DataSource = DMNomConceptos.DSQMNomConcep
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBHoras: TLFDBCheckBox
            Left = 351
            Top = 199
            Width = 154
            Height = 17
            Caption = 'Horas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'HORAS'
            DataSource = DMNomConceptos.DSQMNomConcep
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBTipoContabilizacion: TRxDBComboBox
            Left = 79
            Top = 247
            Width = 154
            Height = 21
            DataField = 'TIPO_CONTABILIZACION'
            DataSource = DMNomConceptos.DSQMNomConcep
            ItemHeight = 13
            Items.Strings = (
              'No se contabiliza'
              'Devengo'
              'Retencion'
              'Remuneracion'
              'Seg. Social'
              'Anticipo'
              'Seg. Social Empresa'
              'Cobros Especie Socio'
              'Ing Servicios Sociales'
              'Cobros Especie Autonomo'
              'Ce RETA'
              'ICECES'
              'Embargo')
            TabOrder = 8
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
          end
          object DBCBSigno: TRxDBComboBox
            Left = 79
            Top = 173
            Width = 154
            Height = 21
            DataField = 'SIGNO'
            DataSource = DMNomConceptos.DSQMNomConcep
            ItemHeight = 13
            Items.Strings = (
              'No aplica'
              'Devengo'
              'Deduccion')
            TabOrder = 5
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBCBTipoImporte: TRxDBComboBox
            Left = 79
            Top = 195
            Width = 154
            Height = 21
            DataField = 'TIPO_IMPORTE'
            DataSource = DMNomConceptos.DSQMNomConcep
            ItemHeight = 13
            Items.Strings = (
              'No aplica'
              'Empleado'
              'Empresa')
            TabOrder = 6
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBCBTipoConcepto: TRxDBComboBox
            Left = 79
            Top = 217
            Width = 154
            Height = 21
            DataField = 'TIPO_CONCEPTO'
            DataSource = DMNomConceptos.DSQMNomConcep
            ItemHeight = 13
            Items.Strings = (
              'No aplica'
              'Total Deduccion'
              'Total Devengo'
              'Total Percibir')
            TabOrder = 7
            Values.Strings = (
              '0'
              '1'
              '2'
              '3')
          end
          object DBCBSignoContabilizacion: TRxDBComboBox
            Left = 79
            Top = 269
            Width = 154
            Height = 21
            DataField = 'SIGNO_CONTABILIZACION'
            DataSource = DMNomConceptos.DSQMNomConcep
            ItemHeight = 13
            Items.Strings = (
              'No aplica'
              'Debe'
              'Haber')
            TabOrder = 9
            Values.Strings = (
              '0'
              '1'
              '2')
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 655
          Height = 384
          DataSource = DMNomConceptos.DSQMNomConcep
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'ACTUALIZA_DE_CONVENIO'
            'HORAS'
            'HORAS_FUERZA_MAYOR'
            'POSITIVO'
            'SEG_SOCIAL')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0')
          Columns = <
            item
              Expanded = False
              FieldName = 'CONCEPTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 474
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 667
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
