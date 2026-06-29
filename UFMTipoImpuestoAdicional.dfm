inherited FMTipoImpuestoAdicional: TFMTipoImpuestoAdicional
  Left = 481
  Top = 278
  HelpContext = 302
  Caption = 'Tipo de IVA ( Aplicado a Art'#237'culos )'
  ClientHeight = 218
  ClientWidth = 404
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 404
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 400
      inherited NavMain: THYMNavigator
        DataSource = DMTipoImpuestoAdicional.DSQMTipoImpuestoAdicional
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBETipo
        Busca02 = DBETitulo
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
      Width = 400
      Height = 164
      ActivePage = TSTabla
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 392
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMTipoImpuestoAdicional.DSQMTipoImpuestoAdicional
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_IMPUESTO_ADICIONAL'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 48
            Top = 16
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 43
            Top = 38
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LPorcentaje: TLFLabel
            Left = 21
            Top = 59
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Porcentaje'
          end
          object DBETipo: TLFDbedit
            Left = 76
            Top = 12
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = DMTipoImpuestoAdicional.DSQMTipoImpuestoAdicional
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 76
            Top = 34
            Width = 282
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTipoImpuestoAdicional.DSQMTipoImpuestoAdicional
            TabOrder = 1
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 77
            Top = 79
            Width = 97
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMTipoImpuestoAdicional.DSQMTipoImpuestoAdicional
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPorcentaje: TLFDbedit
            Left = 76
            Top = 56
            Width = 47
            Height = 21
            DataField = 'PORCENTAJE'
            DataSource = DMTipoImpuestoAdicional.DSQMTipoImpuestoAdicional
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 392
          Height = 136
          DataSource = DMTipoImpuestoAdicional.DSQMTipoImpuestoAdicional
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'P_IVA'
            'P_RECARGO'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 216
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PORCENTAJE'
              Title.Alignment = taRightJustify
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Title.Alignment = taRightJustify
              Width = 39
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 404
  end
  inherited CEMain: TControlEdit
    Left = 292
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 336
    Top = 16
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 290
    Top = 88
  end
end
