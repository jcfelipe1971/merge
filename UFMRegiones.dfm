inherited FMRegiones: TFMRegiones
  Caption = 'Regiones'
  ClientHeight = 218
  ClientWidth = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 518
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 514
      inherited NavMain: THYMNavigator
        DataSource = DMPoblaciones.DSQMRegiones
        Hints.Strings = ()
        EditaControl = DBETtitulo
        InsertaControl = DBEFPais
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBETtitulo
        Busca02 = DBERegion
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
      object PNLFiltroPais: TLFPanel
        Left = 337
        Top = 0
        Width = 185
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFiltroPais: TLFLabel
          Left = 10
          Top = 4
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pais'
        end
        object CBFiltroPais: TLFComboBox
          Left = 32
          Top = 0
          Width = 141
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnSelect = CBFiltroPaisSelect
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 514
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 506
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 88
            Top = 23
            DataSource = DMPoblaciones.DSQMRegiones
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_REGIONES'
            CampoNum = 'REGION'
            CampoStr = 'TITULO'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'REGION')
          end
          object LPais: TLFLabel
            Left = 79
            Top = 37
            Width = 20
            Height = 13
            Caption = 'Pais'
          end
          object LRegion: TLFLabel
            Left = 65
            Top = 59
            Width = 34
            Height = 13
            Caption = 'Region'
          end
          object LTitulo: TLFLabel
            Left = 72
            Top = 81
            Width = 26
            Height = 13
            Caption = 'Titulo'
          end
          object DBERegion: TLFDbedit
            Left = 104
            Top = 55
            Width = 57
            Height = 21
            CharCase = ecUpperCase
            DataField = 'REGION'
            DataSource = DMPoblaciones.DSQMRegiones
            TabOrder = 1
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 104
            Top = 33
            Width = 57
            Height = 21
            DataField = 'PAIS'
            DataSource = DMPoblaciones.DSQMRegiones
            TabOrder = 0
            OnChange = DBEFPaisChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            CampoADevolver = 'PAIS'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PAIS')
            Filtros = []
          end
          object DBETtitulo: TLFDbedit
            Left = 104
            Top = 77
            Width = 241
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPoblaciones.DSQMRegiones
            TabOrder = 2
          end
          object ETituloPais: TLFEdit
            Left = 162
            Top = 33
            Width = 181
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 506
          Height = 136
          DataSource = DMPoblaciones.DSQMRegiones
          CamposAOrdenar.Strings = (
            'PAIS'
            'REGION'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGION'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 233
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 518
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
