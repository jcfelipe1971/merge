inherited FMTipoIncidenciaKri: TFMTipoIncidenciaKri
  Left = 743
  Top = 276
  Caption = 'Tipo Incidencia'
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
        DataSource = DMTipoIncidenciaKri.DSQMTipoIncidencia
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
            DataSource = DMTipoIncidenciaKri.DSQMTipoIncidencia
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_INCIDENCIA_KRI'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 29
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
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBETipo: TLFDbedit
            Left = 56
            Top = 42
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = DMTipoIncidenciaKri.DSQMTipoIncidencia
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 56
            Top = 64
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTipoIncidenciaKri.DSQMTipoIncidencia
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 354
          Height = 178
          DataSource = DMTipoIncidenciaKri.DSQMTipoIncidencia
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 268
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
