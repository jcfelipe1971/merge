inherited FMPoblaciones: TFMPoblaciones
  Caption = 'Poblaciones'
  ClientHeight = 271
  ClientWidth = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 518
    Height = 247
    inherited TBMain: TLFToolBar
      Width = 514
      inherited NavMain: THYMNavigator
        DataSource = DMPoblaciones.DSQMPoblaciones
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEFPais
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEPoblacion
        Busca02 = DBETitulo
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
          Top = 3
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
      Height = 217
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 506
          Height = 189
          inherited G2KTableLoc: TG2KTBLoc
            Top = 44
            DataSource = DMPoblaciones.DSQMPoblaciones
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_POBLACION'
            CampoNum = 'POBLACION'
            CampoStr = 'TITULO'
          end
          object LPais: TLFLabel
            Left = 75
            Top = 24
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object LProvincia: TLFLabel
            Left = 51
            Top = 45
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
          end
          object LPoblacion: TLFLabel
            Left = 48
            Top = 68
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Poblacion'
          end
          object LTitulo: TLFLabel
            Left = 69
            Top = 90
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 100
            Top = 20
            Width = 57
            Height = 21
            DataField = 'PAIS'
            DataSource = DMPoblaciones.DSQMPoblaciones
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
            Filtros = []
          end
          object DBEProvincia: TLFDBEditFind2000
            Left = 100
            Top = 42
            Width = 57
            Height = 21
            DataField = 'PROVINCIA'
            DataSource = DMPoblaciones.DSQMPoblaciones
            TabOrder = 1
            OnChange = DBEProvinciaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVINCIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVINCIA'
            CampoStr = 'PR_TITULO'
            CampoADevolver = 'PROVINCIA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEProvinciaBusqueda
            Filtros = []
          end
          object DBEPoblacion: TLFDbedit
            Left = 100
            Top = 64
            Width = 57
            Height = 21
            CharCase = ecUpperCase
            DataField = 'POBLACION'
            DataSource = DMPoblaciones.DSQMPoblaciones
            TabOrder = 2
          end
          object ETituloPais: TLFEdit
            Left = 158
            Top = 20
            Width = 195
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
          object ETituloProvincia: TLFEdit
            Left = 158
            Top = 42
            Width = 195
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBETitulo: TLFDbedit
            Left = 100
            Top = 86
            Width = 253
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPoblaciones.DSQMPoblaciones
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 506
          Height = 189
          DataSource = DMPoblaciones.DSQMPoblaciones
          CamposAOrdenar.Strings = (
            'PAIS'
            'POBLACION'
            'PROVINCIA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POBLACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCIA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 247
    Width = 518
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
