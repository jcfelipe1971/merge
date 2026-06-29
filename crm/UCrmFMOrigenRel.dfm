inherited CrmFMOrigenRel: TCrmFMOrigenRel
  Left = 387
  Top = 209
  Caption = 'Mantenimiento Tipo Origen Contacto'
  ClientHeight = 210
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 415
    Height = 186
    inherited TBMain: TLFToolBar
      Width = 411
      inherited NavMain: THYMNavigator
        DataSource = CrmDMOrigenRel.DSQMOrigRel
        Hints.Strings = ()
        EditaControl = DBETipo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 411
      Height = 156
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 403
          Height = 128
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = CrmDMOrigenRel.DSQMOrigRel
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_SYS_ORIGEN_CONTACTO'
            CampoNum = 'TORIGEN'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TORIGEN')
          end
          object LTipo: TLFLabel
            Left = 40
            Top = 40
            Width = 21
            Height = 13
            Caption = 'Tipo'
          end
          object LDescripcion: TLFLabel
            Left = 5
            Top = 59
            Width = 56
            Height = 13
            Caption = 'Descripci'#243'n'
          end
          object DBETipo: TLFDbedit
            Left = 66
            Top = 35
            Width = 59
            Height = 21
            DataField = 'TORIGEN'
            DataSource = CrmDMOrigenRel.DSQMOrigRel
            TabOrder = 0
          end
          object DBEDesc: TLFDbedit
            Left = 66
            Top = 57
            Width = 279
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = CrmDMOrigenRel.DSQMOrigRel
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 403
          Height = 128
          DataSource = CrmDMOrigenRel.DSQMOrigRel
          Columns = <
            item
              Expanded = False
              FieldName = 'TORIGEN'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 430
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 186
    Width = 415
  end
  inherited CEMain: TControlEdit
    Left = 240
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 284
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 328
    Top = 40
  end
  inherited FSMain: TLFFibFormStorage
    Left = 368
    Top = 32
  end
end
