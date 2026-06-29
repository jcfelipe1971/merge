inherited FMFamiliasEscandallos: TFMFamiliasEscandallos
  Left = 421
  Top = 341
  Caption = 'Escandallos por Familia'
  ClientHeight = 190
  ClientWidth = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 370
    Height = 166
    inherited TBMain: TLFToolBar
      Width = 366
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = LFDBEFFamilia
        InsertaControl = LFDBEFFamilia
      end
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
    end
    inherited PCMain: TLFPageControl
      Width = 366
      Height = 136
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 358
          Height = 108
          inherited G2KTableLoc: TG2KTBLoc
            Left = 65
            Top = 4
            DataSource = DMFamiliasEscandallos.ZDSQMFamiliasEscandallos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_FAM_ESCANDALLOS'
            CampoNum = 'FAMILIA'
          end
          object LFamilia: TLFLabel
            Left = 35
            Top = 34
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LEscandallo: TLFLabel
            Left = 15
            Top = 55
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LFDBEFFamilia: TLFDBEditFind2000
            Left = 72
            Top = 30
            Width = 57
            Height = 21
            DataField = 'FAMILIA'
            DataSource = DMFamiliasEscandallos.ZDSQMFamiliasEscandallos
            TabOrder = 0
            OnChange = LFDBEFFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'FAMILIA <> '#39'SYS'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBEFEscandallo: TLFDBEditFind2000
            Left = 72
            Top = 52
            Width = 57
            Height = 21
            DataField = 'ESCANDALLO'
            DataSource = DMFamiliasEscandallos.ZDSQMFamiliasEscandallos
            TabOrder = 1
            OnChange = LFDBEFEscandalloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ESCANDALLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ESCANDALLO'
            CampoStr = 'COMPUESTO'
            CondicionBusqueda = 'TIPO='#39'EPR'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ESCANDALLO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescCompuesto: TLFDbedit
            Left = 130
            Top = 52
            Width = 216
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'COMPUESTO'
            DataSource = DMFamiliasEscandallos.DSxCompuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DescFamili: TLFDbedit
            Left = 130
            Top = 30
            Width = 216
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFamiliasEscandallos.DSxFamilia
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
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
          Width = 358
          Height = 108
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ESCANDALLO'
            'FAMILIA')
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Title.Caption = 'Familia'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESCANDALLO'
              Title.Caption = 'Escandallo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Title.Caption = 'Empresa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescFamili'
              Title.Caption = 'T'#237'tulo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescCompuesto'
              Title.Caption = 'Compuesto'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 166
    Width = 370
  end
  inherited CEMain: TControlEdit
    Left = 168
    Top = 32
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 204
    Top = 34
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 136
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 240
    Top = 32
  end
end
