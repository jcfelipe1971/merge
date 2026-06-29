inherited FMBancos: TFMBancos
  Left = 452
  Top = 275
  HelpContext = 290
  Caption = 'Entidades'
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
        DataSource = DMBancos.DSQMBancos
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEEntidad
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
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
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMBancos.DSQMBancos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_BANCOS'
            CampoNum = 'ENTIDAD'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'ENTIDAD')
          end
          object LEntidad: TLFLabel
            Left = 30
            Top = 46
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Entidad'
          end
          object LTitulo: TLFLabel
            Left = 38
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LPais: TLFLabel
            Left = 46
            Top = 90
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object DBEEntidad: TLFDbedit
            Left = 70
            Top = 42
            Width = 65
            Height = 21
            DataField = 'ENTIDAD'
            DataSource = DMBancos.DSQMBancos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 70
            Top = 64
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMBancos.DSQMBancos
            TabOrder = 1
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 71
            Top = 86
            Width = 65
            Height = 21
            DataField = 'PAIS'
            DataSource = DMBancos.DSQMBancos
            TabOrder = 2
            OnChange = DBEFPaisChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PAIS')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EPais: TLFEdit
            Left = 137
            Top = 86
            Width = 216
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMBancos.DSQMBancos
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ENTIDAD'
            'PAIS'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ENTIDAD'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 287
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
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
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 84
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 84
  end
end
