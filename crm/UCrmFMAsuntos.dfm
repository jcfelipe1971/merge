inherited CrmFMAsuntos: TCrmFMAsuntos
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
        DataSource = CrmDMAsuntos.DSQMAsuntos
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEDescripcion
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
            DataSource = CrmDMAsuntos.DSQMAsuntos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_ASUNTOS'
            CampoNum = 'ID_ASUNTO'
            CampoStr = 'TITULO'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TITULO')
          end
          object LId: TLFLabel
            Left = 48
            Top = 40
            Width = 12
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id.'
          end
          object LDescripcion: TLFLabel
            Left = 5
            Top = 59
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object DBETipo: TLFDbedit
            Left = 66
            Top = 35
            Width = 59
            Height = 21
            DataField = 'ID_ASUNTO'
            DataSource = CrmDMAsuntos.DSQMAsuntos
            Enabled = False
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 66
            Top = 57
            Width = 279
            Height = 21
            DataField = 'TITULO'
            DataSource = CrmDMAsuntos.DSQMAsuntos
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 403
          Height = 128
          DataSource = CrmDMAsuntos.DSQMAsuntos
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ASUNTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
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
