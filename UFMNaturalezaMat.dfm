inherited FMNaturalezaMat: TFMNaturalezaMat
  Left = 413
  Top = 252
  HelpContext = 283
  Caption = 'Naturaleza de Materiales'
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
        DataSource = DMNaturalezaMat.DSQMNaturalezaMat
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBENaturaleza
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBENaturaleza
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
            DataSource = DMNaturalezaMat.DSQMNaturalezaMat
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_NATURALEZA_CARGA'
            CampoNum = 'NATURALEZA'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'DEFECTO DESC, NATURALEZA')
          end
          object LBLNaturaleza: TLFLabel
            Left = 36
            Top = 42
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Naturaleza'
            FocusControl = DBENaturaleza
          end
          object LBLTitulo: TLFLabel
            Left = 59
            Top = 64
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBENaturaleza: TLFDbedit
            Left = 91
            Top = 38
            Width = 49
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NATURALEZA'
            DataSource = DMNaturalezaMat.DSQMNaturalezaMat
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 91
            Top = 60
            Width = 258
            Height = 21
            DataField = 'TITULO'
            DataSource = DMNaturalezaMat.DSQMNaturalezaMat
            TabOrder = 1
          end
          object DBCHKDefecto: TLFDBCheckBox
            Left = 91
            Top = 84
            Width = 61
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMNaturalezaMat.DSQMNaturalezaMat
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMNaturalezaMat.DSQMNaturalezaMat
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'NATURALEZA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'NATURALEZA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 272
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
    Left = 208
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 244
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 152
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 112
    Top = 32
  end
end
