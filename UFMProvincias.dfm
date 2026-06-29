inherited FMProvincias: TFMProvincias
  Left = 379
  Top = 367
  HelpContext = 2215
  Caption = 'Provincias'
  ClientHeight = 218
  ClientWidth = 506
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 506
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 502
      inherited NavMain: THYMNavigator
        DataSource = DMPoblaciones.DSQMProvincias
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEFPais
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBETitulo
        Busca02 = DBEProvincia
        Busca03 = DBECod_Tel
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
      Width = 502
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 494
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 104
            Top = 24
            CamposADesplegar.Strings = (
              'PAIS')
            DataSource = DMPoblaciones.DSQMProvincias
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_PROVINCIAS'
            CampoNum = 'PROVINCIA'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'PROVINCIA')
          end
          object LProvincia: TLFLabel
            Left = 52
            Top = 41
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
            FocusControl = DBEProvincia
          end
          object LTitulo: TLFLabel
            Left = 68
            Top = 63
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LCodTelefonico: TLFLabel
            Left = 56
            Top = 85
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Telef.'
            FocusControl = DBETitulo
          end
          object LPais: TLFLabel
            Left = 74
            Top = 20
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LINE: TLFLabel
            Left = 189
            Top = 85
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'INE'
            FocusControl = DBEIne
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 100
            Top = 16
            Width = 37
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PAIS'
            DataSource = DMPoblaciones.DSQMProvincias
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
          object DBEProvincia: TLFDbedit
            Left = 100
            Top = 38
            Width = 37
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PROVINCIA'
            DataSource = DMPoblaciones.DSQMProvincias
            TabOrder = 1
          end
          object DBETitulo: TLFDbedit
            Left = 100
            Top = 60
            Width = 306
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPoblaciones.DSQMProvincias
            TabOrder = 2
          end
          object DBECod_Tel: TLFDbedit
            Left = 100
            Top = 82
            Width = 61
            Height = 21
            DataField = 'CODIGO_TEL'
            DataSource = DMPoblaciones.DSQMProvincias
            TabOrder = 3
          end
          object DBEIne: TLFDbedit
            Left = 212
            Top = 82
            Width = 37
            Height = 21
            CharCase = ecUpperCase
            DataField = 'INE'
            DataSource = DMPoblaciones.DSQMProvincias
            TabOrder = 4
          end
          object ETituloPais: TLFEdit
            Left = 138
            Top = 16
            Width = 268
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 494
          Height = 136
          DataSource = DMPoblaciones.DSQMProvincias
          CamposAOrdenar.Strings = (
            'CODIGO_TEL'
            'INE'
            'PAIS'
            'PROVINCIA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 31
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROVINCIA'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 217
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_TEL'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 506
  end
  inherited CEMain: TControlEdit
    Left = 244
    Top = 96
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 282
    Top = 96
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
  end
end
