inherited FMTipoIncidenciaMaq: TFMTipoIncidenciaMaq
  Left = 635
  Top = 237
  Caption = 'Tipo Incidencia M'#225'quina'
  ClientHeight = 260
  ClientWidth = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 366
    Height = 236
    inherited TBMain: TLFToolBar
      Width = 362
      inherited NavMain: THYMNavigator
        DataSource = DMTipoIncidenciaMaq.DSQMTipoIncidencia
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 362
      Height = 206
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 354
          Height = 178
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMTipoIncidenciaMaq.DSQMTipoIncidencia
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_INCIDENCIAS_MAQ'
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 58
            Top = 46
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBETipo
          end
          object LTitulo: TLFLabel
            Left = 23
            Top = 68
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBETitulo
          end
          object DBETipo: TLFDbedit
            Left = 84
            Top = 42
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = DMTipoIncidenciaMaq.DSQMTipoIncidencia
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 84
            Top = 64
            Width = 241
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMTipoIncidenciaMaq.DSQMTipoIncidencia
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 354
          Height = 178
          DataSource = DMTipoIncidenciaMaq.DSQMTipoIncidencia
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 279
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 236
    Width = 366
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
