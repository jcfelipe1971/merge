inherited OpeFMCentTrab: TOpeFMCentTrab
  Left = 305
  Top = 287
  Caption = 'Mantenimiento de Centro de Trabajo'
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
        DataSource = OpeDMCentTrab.DSQMCentroTrabajo
        Hints.Strings = ()
        EditaControl = DBEDescrip
        InsertaControl = DBECentro
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
            Left = 16
            Top = 5
            DataSource = OpeDMCentTrab.DSQMCentroTrabajo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'OPE_CENT_TRABAJO'
            CampoNum = 'CENTRO'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CENTRO')
          end
          object LCentro: TLFLabel
            Left = 36
            Top = 32
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Centro'
            FocusControl = DBECentro
          end
          object LDescripcion: TLFLabel
            Left = 11
            Top = 55
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescrip
          end
          object LSeccion: TLFLabel
            Left = 28
            Top = 76
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seccion'
          end
          object DBECentro: TLFDbedit
            Left = 71
            Top = 29
            Width = 57
            Height = 21
            DataField = 'CENTRO'
            DataSource = OpeDMCentTrab.DSQMCentroTrabajo
            TabOrder = 0
          end
          object DBEDescrip: TLFDbedit
            Left = 71
            Top = 51
            Width = 297
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMCentTrab.DSQMCentroTrabajo
            TabOrder = 1
          end
          object EFSeccion: TLFDBEditFind2000
            Left = 71
            Top = 73
            Width = 57
            Height = 21
            DataField = 'SECCION'
            DataSource = OpeDMCentTrab.DSQMCentroTrabajo
            TabOrder = 2
            OnChange = EFSeccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SECCION'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ESeccionTitulo: TLFEdit
            Left = 129
            Top = 73
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = OpeDMCentTrab.DSQMCentroTrabajo
          CamposAOrdenar.Strings = (
            'CENTRO'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'CENTRO'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 312
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
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
