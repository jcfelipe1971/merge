inherited FMLocalidades: TFMLocalidades
  Left = 510
  Top = 238
  HelpContext = 2216
  Caption = 'Localidades'
  ClientHeight = 309
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 285
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMPoblaciones.DSQMLocalidades
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBELocalidad
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
      object PNLFiltroPais: TLFPanel
        Left = 319
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
      Height = 255
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 227
          inherited G2KTableLoc: TG2KTBLoc
            Left = 75
            CamposADesplegar.Strings = (
              'CODIGO_POSTAL'
              'PAIS')
            DataSource = DMPoblaciones.DSQMLocalidades
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_LOCALIDADES'
            CampoNum = 'LOCALIDAD'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'LOCALIDAD')
          end
          object LBLLocalidad: TLFLabel
            Left = 52
            Top = 9
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Localidad'
          end
          object LBLTitulo: TLFLabel
            Left = 70
            Top = 31
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLCp: TLFLabel
            Left = 56
            Top = 53
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Postal'
          end
          object LBLProvincia: TLFLabel
            Left = 54
            Top = 97
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
          end
          object LBLPais: TLFLabel
            Left = 76
            Top = 75
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LFLColonia: TLFLabel
            Left = 63
            Top = 119
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Colonia'
          end
          object LFLTipoColonia: TLFLabel
            Left = 39
            Top = 141
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Colonia'
          end
          object LFLCiudad: TLFLabel
            Left = 65
            Top = 162
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ciudad'
          end
          object LFLLongitud: TLFLabel
            Left = 253
            Top = 185
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Longitud'
          end
          object LFLLatitud: TLFLabel
            Left = 66
            Top = 185
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Latitud'
          end
          object LFLZONA_HORARIA: TLFLabel
            Left = 5
            Top = 207
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Zona Horaria (UTC)'
          end
          object DBELocalidad: TLFDbedit
            Left = 103
            Top = 5
            Width = 85
            Height = 21
            CharCase = ecUpperCase
            DataField = 'LOCALIDAD'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 103
            Top = 27
            Width = 322
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 1
          end
          object DBECodPostal: TLFDbedit
            Left = 103
            Top = 49
            Width = 99
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_POSTAL'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 2
          end
          object DBEFProvincia: TLFDBEditFind2000
            Left = 103
            Top = 93
            Width = 55
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PROVINCIA'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 4
            OnChange = DBEFProvinciaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVINCIAS                 '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'PROVINCIA'
              'PR_TITULO'
              'PAIS'
              'PA_TITULO')
            CampoNum = 'PROVINCIA'
            CampoStr = 'PR_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROVINCIA')
            Filtros = [obPais]
            Entorno = DMPoblaciones.EntornoLoc
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 103
            Top = 71
            Width = 55
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PAIS'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 3
            OnChange = DBEFPaisChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PAISES                     '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PAIS')
            Filtros = []
          end
          object DBEColonia: TLFDbedit
            Left = 103
            Top = 115
            Width = 322
            Height = 21
            DataField = 'COLONIA'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 5
          end
          object ETituloPais: TLFEdit
            Left = 159
            Top = 71
            Width = 266
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 6
          end
          object ETituloProvincia: TLFEdit
            Left = 159
            Top = 93
            Width = 266
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 7
          end
          object DBETIPO_COLONIA: TLFDbedit
            Left = 103
            Top = 137
            Width = 322
            Height = 21
            DataField = 'TIPO_COLONIA'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 8
          end
          object DBECIUDAD: TLFDbedit
            Left = 103
            Top = 159
            Width = 322
            Height = 21
            DataField = 'CIUDAD'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 9
          end
          object DBELONGITUD: TLFDbedit
            Left = 299
            Top = 181
            Width = 126
            Height = 21
            Hint = #193'ngulo a lo largo del ecuador desde cualquier punto'
            CharCase = ecUpperCase
            DataField = 'LONGITUD'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 11
          end
          object DBELATITUD: TLFDbedit
            Left = 103
            Top = 181
            Width = 126
            Height = 21
            Hint = #193'ngulo entre el punto y el ecuador.'
            CharCase = ecUpperCase
            DataField = 'LATITUD'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 10
          end
          object DBEZONA_HORARIA: TLFDbedit
            Left = 103
            Top = 203
            Width = 62
            Height = 21
            Hint = 'Tiempo Universal Coordinado'
            CharCase = ecUpperCase
            DataField = 'ZONA_HORARIA'
            DataSource = DMPoblaciones.DSQMLocalidades
            TabOrder = 12
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 227
          DataSource = DMPoblaciones.DSQMLocalidades
          CamposAOrdenar.Strings = (
            'CODIGO_POSTAL'
            'LOCALIDAD'
            'PAIS'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'LOCALIDAD'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_POSTAL'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 37
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 285
  end
  inherited CEMain: TControlEdit
    Left = 368
    Top = 92
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 412
    Top = 92
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
