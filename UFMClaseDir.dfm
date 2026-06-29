inherited FMClaseDir: TFMClaseDir
  Left = 337
  Top = 217
  Caption = 'Clases de Direcci'#243'n'
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
        DataSource = DMClaseDir.DSQMClaseDir
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEClase
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEClase
        Busca02 = DBETitulo
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
            DataSource = DMClaseDir.DSQMClaseDir
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_CLASE_DIRECCION'
            CampoNum = 'CLASE'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CLASE')
          end
          object LBLClase: TLFLabel
            Left = 36
            Top = 42
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
            FocusControl = DBEClase
          end
          object LBLTitulo: TLFLabel
            Left = 41
            Top = 65
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBEClase: TLFDbedit
            Left = 73
            Top = 39
            Width = 64
            Height = 21
            DataField = 'CLASE'
            DataSource = DMClaseDir.DSQMClaseDir
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 73
            Top = 61
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMClaseDir.DSQMClaseDir
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMClaseDir.DSQMClaseDir
          CamposAOrdenar.Strings = (
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CLASE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 278
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
    Left = 236
    Top = 32
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
