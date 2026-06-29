inherited FMMatriculas: TFMMatriculas
  Left = 508
  Top = 331
  Width = 400
  Height = 247
  HelpContext = 283
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Matriculas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMMatriculas.DSQMMatriculas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEMatriculas
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        DataSource = DMMatriculas.DSQMMatriculas
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEMatriculas
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
            DataSource = DMMatriculas.DSQMMatriculas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_MATRICULAS'
            CampoNum = 'MATRICULA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'DEFECTO DESC, MATRICULA')
          end
          object LBLNaturaleza: TLFLabel
            Left = 25
            Top = 29
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Matr'#237'cula'
            FocusControl = DBEMatriculas
          end
          object LBLTitulo: TLFLabel
            Left = 42
            Top = 51
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LTransportista: TLFLabel
            Left = 9
            Top = 73
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object DBEMatriculas: TLFDbedit
            Left = 75
            Top = 25
            Width = 140
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MATRICULA'
            DataSource = DMMatriculas.DSQMMatriculas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 75
            Top = 47
            Width = 292
            Height = 21
            DataField = 'TITULO'
            DataSource = DMMatriculas.DSQMMatriculas
            TabOrder = 1
          end
          object DBEFTransportista: TLFDBEditFind2000
            Left = 75
            Top = 69
            Width = 70
            Height = 21
            AutoSize = False
            DataField = 'TRANSPORTISTA'
            DataSource = DMMatriculas.DSQMMatriculas
            TabOrder = 2
            OnChange = DBEFTransportistaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TRASNPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETransportista: TLFEdit
            Left = 146
            Top = 69
            Width = 221
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 75
            Top = 92
            Width = 292
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMMatriculas.DSQMMatriculas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMMatriculas.DSQMMatriculas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'MATRICULA'
            'TITULO'
            'TRANSPORTISTA')
          Columns = <
            item
              Expanded = False
              FieldName = 'MATRICULA'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 208
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSPORTISTA'
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
    Left = 272
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 324
    Top = 12
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 328
    Top = 104
  end
  inherited FSMain: TLFFibFormStorage
    Left = 280
    Top = 96
  end
end
