inherited ProFMTurnos: TProFMTurnos
  Left = 470
  Top = 263
  Caption = 'Mantenimiento de Turnos'
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
        DataSource = ProDMTurnos.DSQMTurno
        Hints.Strings = ()
        EditaControl = LFDBTurno
        InsertaControl = LFDBTurno
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
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
            Left = 73
            Top = -6
            DataSource = ProDMTurnos.DSQMTurno
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_TURNOS'
            CampoNum = 'TURNO'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TURNO')
          end
          object LTurno: TLFLabel
            Left = 41
            Top = 26
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Turno'
          end
          object LDescripcion: TLFLabel
            Left = 13
            Top = 47
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFLOrden: TLFLabel
            Left = 40
            Top = 69
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LFDBTurno: TLFDbedit
            Left = 73
            Top = 21
            Width = 50
            Height = 21
            DataField = 'TURNO'
            DataSource = ProDMTurnos.DSQMTurno
            TabOrder = 0
          end
          object LFDBDescTurno: TLFDbedit
            Left = 73
            Top = 43
            Width = 272
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMTurnos.DSQMTurno
            TabOrder = 1
          end
          object LFDOrden: TLFDbedit
            Left = 73
            Top = 65
            Width = 50
            Height = 21
            DataField = 'ORDEN'
            DataSource = ProDMTurnos.DSQMTurno
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMTurnos.DSQMTurno
          Columns = <
            item
              Expanded = False
              FieldName = 'TURNO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 249
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 40
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
    Left = 256
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 292
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 328
    Top = 32
  end
end
