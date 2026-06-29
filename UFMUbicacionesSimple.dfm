inherited FMUbicacionesSimple: TFMUbicacionesSimple
  Caption = 'Ubicaciones Simples'
  ClientHeight = 168
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 144
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMUbicacionesSimple.DSQMUbicacionesSimple
        Hints.Strings = ()
        EditaControl = DBTitulo
        InsertaControl = DBTitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 69
        DataSource = DMUbicacionesSimple.DSQMUbicacionesSimple
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 297
      end
      inherited TbuttComp: TToolButton
        Left = 305
      end
    end
    inherited PCMain: TLFPageControl
      Height = 114
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 86
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMUbicacionesSimple.DSQMUbicacionesSimple
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_UBICACION_SIMPLE'
            CampoNum = 'ID_UBICACION_SIMPLE'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID_UBICACION_SIMPLE')
          end
          object LID: TLFLabel
            Left = 29
            Top = 24
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID Ubicaci'#243'n'
          end
          object LTitulo: TLFLabel
            Left = 63
            Top = 46
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBIDUbicacionSimple: TLFDbedit
            Left = 96
            Top = 20
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'ID_UBICACION_SIMPLE'
            DataSource = DMUbicacionesSimple.DSQMUbicacionesSimple
            ReadOnly = True
            TabOrder = 0
          end
          object DBTitulo: TLFDbedit
            Left = 96
            Top = 42
            Width = 353
            Height = 21
            DataField = 'TITULO'
            DataSource = DMUbicacionesSimple.DSQMUbicacionesSimple
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 86
          DataSource = DMUbicacionesSimple.DSQMUbicacionesSimple
          CamposAOrdenar.Strings = (
            'ID_UBICACION_SIMPLE'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_UBICACION_SIMPLE'
              Width = 52
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
    Top = 144
  end
  inherited CEMain: TControlEdit
    DataSource = DMUbicacionesSimple.DSQMUbicacionesSimple
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
