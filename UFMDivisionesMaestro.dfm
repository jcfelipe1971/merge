inherited FMDivisionesMaestro: TFMDivisionesMaestro
  Caption = 'Divisiones Maestro'
  ClientHeight = 210
  ClientWidth = 389
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 389
    Height = 186
    inherited TBMain: TLFToolBar
      Width = 385
      inherited NavMain: THYMNavigator
        DataSource = DMDivisionesMaestro.DSQMDivisiones
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBEDivision
      end
      inherited EPMain: THYMEditPanel
        Width = 75
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 303
      end
      inherited TbuttComp: TToolButton
        Left = 311
      end
    end
    inherited PCMain: TLFPageControl
      Width = 385
      Height = 156
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 377
          Height = 128
          inherited G2KTableLoc: TG2KTBLoc
            Left = 80
            Top = 48
            Tabla_a_buscar = 'CON_DIVISIONES'
            CampoNum = 'DIVISION'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'DIVISION')
          end
          object LDivision: TLFLabel
            Left = 28
            Top = 36
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Division'
          end
          object LTitulo: TLFLabel
            Left = 37
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEDivision: TLFDbedit
            Left = 69
            Top = 32
            Width = 65
            Height = 21
            DataField = 'DIVISION'
            DataSource = DMDivisionesMaestro.DSQMDivisiones
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 69
            Top = 54
            Width = 292
            Height = 21
            DataField = 'TITULO'
            DataSource = DMDivisionesMaestro.DSQMDivisiones
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 377
          Height = 128
          DataSource = DMDivisionesMaestro.DSQMDivisiones
          Columns = <
            item
              Expanded = False
              FieldName = 'DIVISION'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 277
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 186
    Width = 389
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 352
    Top = 32
  end
end
