inherited ProFMCarpetas: TProFMCarpetas
  Caption = 'Exploraci'#243'n Carpetas'
  ClientHeight = 235
  ClientWidth = 458
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 458
    Height = 211
    inherited TBMain: TLFToolBar
      Width = 454
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = ProDMCarpetas.DSCarpetas
        Hints.Strings = ()
        EditaControl = LFDDesc
        InsertaControl = LFDDesc
        InsertaUltimo = True
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 20
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 228
      end
      inherited TbuttComp: TToolButton
        Left = 236
        Visible = False
      end
      object TBAbrir: TToolButton
        Left = 259
        Top = 0
        Hint = 'Abrir carpeta'
        Caption = 'TBAbrir'
        ImageIndex = 65
        OnClick = TBAbrirClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 454
      Height = 181
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 446
          Height = 153
          object PanelMain: TLFPanel
            Left = 0
            Top = 0
            Width = 446
            Height = 153
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LLinea: TLFLabel
              Left = 38
              Top = 33
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Linea'
            end
            object LDescripcion: TLFLabel
              Left = 8
              Top = 56
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Descripci'#243'n'
            end
            object LRuta: TLFLabel
              Left = 41
              Top = 77
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ruta'
            end
            object Ruta: TDirectoryEdit
              Left = 69
              Top = 74
              Width = 345
              Height = 21
              OnAfterDialog = RutaAfterDialog
              DialogKind = dkWin32
              DialogText = 'Selecci'#243'n de carpeta'
              NumGlyphs = 1
              TabOrder = 0
            end
            object LFDBLinea: TLFDbedit
              Left = 69
              Top = 30
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'LINEA'
              DataSource = ProDMCarpetas.DSCarpetas
              ReadOnly = True
              TabOrder = 1
            end
            object LFDDesc: TLFDbedit
              Left = 69
              Top = 52
              Width = 345
              Height = 21
              DataField = 'DESCRIPCION'
              DataSource = ProDMCarpetas.DSCarpetas
              TabOrder = 2
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 446
          Height = 153
          DataSource = ProDMCarpetas.DSCarpetas
          Columns = <
            item
              Expanded = False
              FieldName = 'LINEA'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTA'
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 211
    Width = 458
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
