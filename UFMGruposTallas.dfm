inherited FMGruposTallas: TFMGruposTallas
  Left = 272
  Top = 170
  Width = 423
  Height = 346
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Grupos de tallaje'
  PopupMenu = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 413
    Height = 153
    inherited TBMain: TLFToolBar
      Width = 409
      inherited NavMain: THYMNavigator
        DataSource = DSart_grupos_tallas
        Hints.Strings = ()
        EditaControl = DBEGrupo
        InsertaControl = DBEGrupo
      end
      inherited EPMain: THYMEditPanel
        DataSource = DSart_grupos_tallas
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 409
      Height = 123
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 401
          Height = 95
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'GRUPO'
              'TITULO')
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_GRUPOS_TALLAS'
            CampoNum = 'GRUPO'
            CampoStr = 'TITULO'
          end
          object LGrupo: TLFLabel
            Left = 15
            Top = 4
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object LTitulo: TLFLabel
            Left = 18
            Top = 26
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LPrefijo: TLFLabel
            Left = 15
            Top = 48
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prefijo'
          end
          object LSufijo: TLFLabel
            Left = 18
            Top = 70
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sufijo'
          end
          object LEjemplo: TLFLabel
            Left = 171
            Top = 45
            Width = 226
            Height = 39
            Caption = 
              'El t'#237'tulo del art'#237'culo ser'#225' formado por:'#13#10'Titulo + Color + Prefi' +
              'jo + Talla + Sufijo'#13#10'Ej. [Pantalon Hombre] + [Negro] + [T-] + [4' +
              '6] + []'
          end
          object DBEGrupo: TLFDbedit
            Left = 48
            Top = 0
            Width = 121
            Height = 21
            DataField = 'GRUPO'
            DataSource = DSart_grupos_tallas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 48
            Top = 22
            Width = 345
            Height = 21
            DataField = 'TITULO'
            DataSource = DSart_grupos_tallas
            TabOrder = 1
          end
          object DBEPrefijo: TLFDbedit
            Left = 48
            Top = 44
            Width = 121
            Height = 21
            DataField = 'PREFIJO'
            DataSource = DSart_grupos_tallas
            TabOrder = 2
          end
          object DBESufijo: TLFDbedit
            Left = 48
            Top = 66
            Width = 121
            Height = 21
            DataField = 'SUFIJO'
            DataSource = DSart_grupos_tallas
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 401
          Height = 89
          DataSource = DSart_grupos_tallas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'GRUPO'
            'PREFIJO'
            'SUFIJO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'GRUPO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 229
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 153
    Width = 413
    Height = 140
    inherited TBDetalle: TLFToolBar
      Width = 413
      inherited NavDetalle: THYMNavigator
        DataSource = DSart_tallas
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 413
      Height = 118
      DataSource = DSart_tallas
      IniStorage = FSMain
      CamposAOrdernar.Strings = (
        'COD_TALLA'
        'TALLA'
        'TITULO')
      Columns = <
        item
          Expanded = False
          FieldName = 'TALLA'
          Width = 144
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 221
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 293
    Width = 413
  end
  inherited CEMain: TControlEdit
    DataSource = DSart_grupos_tallas
    Complementario = PDetalle
    Top = 124
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 296
    Top = 64
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
  end
  inherited FSMain: TLFFibFormStorage
    Left = 254
    Top = 42
  end
  object DSart_grupos_tallas: TDataSource
    DataSet = DMMaestrosTallas.QMart_grupos_tallas
    Left = 192
    Top = 88
  end
  object DSart_tallas: TDataSource
    DataSet = DMMaestrosTallas.QMart_tallas
    Left = 192
    Top = 208
  end
end
