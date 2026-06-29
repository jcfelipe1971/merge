inherited FPEdit: TFPEdit
  Caption = 'FPEdit'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      ActivePage = TSFicha
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = '&Ficha'
        OnShow = TSFichaShow
        object PEdit: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object G2KTableLoc: TG2KTBLoc
            Left = 64
            Top = 40
            Hint = 'Localizar'
            ImageIndex = 81
            Filtros = []
          end
        end
      end
      object TSTabla: TTabSheet
        Caption = '&Tabla'
        ImageIndex = 1
        OnShow = TSTablaShow
        object DBGMain: THYTDBGrid
          Left = 0
          Top = 0
          Width = 490
          Height = 274
          Align = alClient
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGMainDrawColumnCell
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PanelEdicion = PEdit
  end
end
