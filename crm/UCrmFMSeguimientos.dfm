inherited CRMFMSeguimientos: TCRMFMSeguimientos
  Left = 685
  Top = 355
  Caption = 'Seguimientos'
  ClientHeight = 223
  ClientWidth = 406
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 406
    Height = 199
    inherited TBMain: TLFToolBar
      Width = 402
      inherited NavMain: THYMNavigator
        DataSource = CRMDMSeguimientos.DSQMSeguimientos
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBESeguimiento
      end
      inherited EPMain: THYMEditPanel
        Width = 68
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 296
      end
      inherited TbuttComp: TToolButton
        Left = 304
      end
    end
    inherited PCMain: TLFPageControl
      Width = 402
      Height = 169
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 394
          Height = 141
          inherited G2KTableLoc: TG2KTBLoc
            Left = 43
            Top = 48
            DataSource = CRMDMSeguimientos.DSQMSeguimientos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_SYS_TIPO_SEG'
            CampoNum = 'TSEGUIMIENTO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'TSEGUIMIENTO')
          end
          object LFSeguimiento: TLFLabel
            Left = 50
            Top = 37
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LFDescripcion: TLFLabel
            Left = 16
            Top = 58
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object DBESeguimiento: TLFDbedit
            Left = 78
            Top = 33
            Width = 57
            Height = 21
            DataField = 'TSEGUIMIENTO'
            DataSource = CRMDMSeguimientos.DSQMSeguimientos
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 78
            Top = 55
            Width = 299
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = CRMDMSeguimientos.DSQMSeguimientos
            TabOrder = 1
          end
          object DBCBActualizaFechaVisita: TLFDBCheckBox
            Left = 80
            Top = 80
            Width = 297
            Height = 17
            Hint = 'Actualiza Fecha de Ultima Visita en el contacto'
            Caption = 'Actualiza Fecha Ultima Visita'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTUALIZA_FECHA_ULT_VISITA'
            DataSource = CRMDMSeguimientos.DSQMSeguimientos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 394
          Height = 141
          DataSource = CRMDMSeguimientos.DSQMSeguimientos
          CamposAMarcar.Strings = (
            'ACTUALIZA_FECHA_ULT_VISITA')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TSEGUIMIENTO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TSEGUIMIENTO'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 241
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTUALIZA_FECHA_ULT_VISITA'
              Width = 69
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 199
    Width = 406
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 216
    Top = 40
  end
end
