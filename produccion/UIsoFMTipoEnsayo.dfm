inherited IsoFMTipoEnsayo: TIsoFMTipoEnsayo
  Left = 290
  Top = 245
  Caption = 'Mantenimiento Tipos de Ensayo'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = IsoDMTipoEnsayo.DSQMIsoTipoEnsayo
        Hints.Strings = ()
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEDescripcion
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
            Left = 62
            Top = 75
            DataSource = IsoDMTipoEnsayo.DSQMIsoTipoEnsayo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_TIPO_ENSAYO'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 43
            Top = 44
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LDescripcion: TLFLabel
            Left = 20
            Top = 66
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object DBEDescripcion: TLFDbedit
            Left = 78
            Top = 62
            Width = 289
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMTipoEnsayo.DSQMIsoTipoEnsayo
            TabOrder = 1
          end
          object DBECodigo: TLFDbedit
            Left = 78
            Top = 40
            Width = 47
            Height = 21
            DataField = 'CODIGO'
            DataSource = IsoDMTipoEnsayo.DSQMIsoTipoEnsayo
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = IsoDMTipoEnsayo.DSQMIsoTipoEnsayo
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 293
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
  inherited CEMain: TControlEdit
    EnlazadoA = CEMain
    Top = 29
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 29
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 60
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
  end
end
