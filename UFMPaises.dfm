inherited FMPaises: TFMPaises
  Left = 563
  Top = 182
  HelpContext = 2214
  Caption = 'Pa'#237'ses'
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
        DataSource = DMPoblaciones.DSQMPaises
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEPais
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMPoblaciones.DSQMPaises
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEPais
        Busca02 = DBETitulo
        Busca03 = DBEClave2
        Busca04 = DBEN3
        Busca05 = DBECodTel
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
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
            DataSource = DMPoblaciones.DSQMPaises
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_PAISES'
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'PAIS')
          end
          object LPais: TLFLabel
            Left = 55
            Top = 14
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
            FocusControl = DBEPais
          end
          object LNombre: TLFLabel
            Left = 40
            Top = 36
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
            FocusControl = DBETitulo
          end
          object LClave2C: TLFLabel
            Left = 29
            Top = 58
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave 2 c.'
          end
          object LClaveN: TLFLabel
            Left = 141
            Top = 58
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave N'
          end
          object LPrefijoTelefonico: TLFLabel
            Left = 25
            Top = 102
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pref. Tel'#233'f.'
          end
          object LBIdioma: TLFLabel
            Left = 46
            Top = 80
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
          end
          object DBEPais: TLFDbedit
            Left = 81
            Top = 10
            Width = 43
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PAIS'
            DataSource = DMPoblaciones.DSQMPaises
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 81
            Top = 32
            Width = 279
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPoblaciones.DSQMPaises
            TabOrder = 1
          end
          object DBEClave2: TLFDbedit
            Left = 81
            Top = 54
            Width = 43
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PAIS_C2'
            DataSource = DMPoblaciones.DSQMPaises
            TabOrder = 2
          end
          object DBEN3: TLFDbedit
            Left = 183
            Top = 54
            Width = 41
            Height = 21
            DataField = 'PAIS_N3'
            DataSource = DMPoblaciones.DSQMPaises
            TabOrder = 3
          end
          object DBECodTel: TLFDbedit
            Left = 81
            Top = 98
            Width = 43
            Height = 21
            DataField = 'CODIGO_TEL'
            DataSource = DMPoblaciones.DSQMPaises
            TabOrder = 5
          end
          object DBChkBCEE: TLFDBCheckBox
            Left = 140
            Top = 102
            Width = 110
            Height = 17
            Caption = 'Pertenece a CEE'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PERTENECE_CEE'
            DataSource = DMPoblaciones.DSQMPaises
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ETituloIdioma: TLFEdit
            Left = 125
            Top = 76
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 81
            Top = 76
            Width = 43
            Height = 21
            DataField = 'IDIOMA'
            DataSource = DMPoblaciones.DSQMPaises
            TabOrder = 4
            OnChange = DBEFIdiomaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IDIOMAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'IDIOMA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'IDIOMA')
            Filtros = []
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMPoblaciones.DSQMPaises
          CamposAOrdenar.Strings = (
            'CODIGO_TEL'
            'PAIS'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 256
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_TEL'
              Width = 43
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
    Left = 232
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 288
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 298
    Top = 90
  end
end
