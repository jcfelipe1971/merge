inherited OpeFMTiposImputacion: TOpeFMTiposImputacion
  Left = 377
  Top = 353
  Caption = 'Mantenimiento Tipos de Imputaci'#243'n'
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
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBETipoImputa
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
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
            Top = 32
          end
          object LTipoImputa: TLFLabel
            Left = 19
            Top = 44
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Imputaci'#243'n'
            FocusControl = DBETipoImputa
          end
          object LDescripcion: TLFLabel
            Left = 39
            Top = 69
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object DBETipoImputa: TLFDbedit
            Left = 101
            Top = 38
            Width = 57
            Height = 21
            DataField = 'TIPO_IMPUTACION'
            DataSource = OpeDMTiposImputacion.DSQMTipoImputa
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 101
            Top = 61
            Width = 257
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMTiposImputacion.DSQMTipoImputa
            TabOrder = 1
          end
          object DBCBHoras: TLFDBCheckBox
            Left = 192
            Top = 41
            Width = 166
            Height = 17
            Caption = 'En marcajes, imputar por horas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'HORAS'
            DataSource = OpeDMTiposImputacion.DSQMTipoImputa
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          CamposAMarcar.Strings = (
            'HORAS')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'HORAS'
            'TIPO_IMPUTACION')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_IMPUTACION'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 243
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAS'
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
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 186
    Top = 58
  end
end
