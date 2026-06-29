inherited FMDGIIConfEnvio: TFMDGIIConfEnvio
  Left = 534
  Top = 230
  Width = 655
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Configuraci'#243'n env'#237'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 645
    inherited TBMain: TLFToolBar
      Width = 641
      inherited NavMain: THYMNavigator
        DataSource = DMDGIIConfEnvio.DSQMDgiiConfiguracion
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 641
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 633
          inherited G2KTableLoc: TG2KTBLoc
            Left = 67
          end
          object LToken: TLabel
            Left = 31
            Top = 36
            Width = 31
            Height = 13
            Caption = 'Token'
          end
          object LUrlBase: TLabel
            Left = 22
            Top = 58
            Width = 40
            Height = 13
            Caption = 'Url Base'
          end
          object LIdCompany: TLabel
            Left = 3
            Top = 80
            Width = 58
            Height = 13
            Caption = 'ID Company'
          end
          object DBEToken: TLFDbedit
            Left = 66
            Top = 32
            Width = 561
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TOKEN'
            DataSource = DMDGIIConfEnvio.DSQMDgiiConfiguracion
            TabOrder = 0
          end
          object DBEUrlBase: TLFDbedit
            Left = 66
            Top = 54
            Width = 561
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'URL_BASE'
            DataSource = DMDGIIConfEnvio.DSQMDgiiConfiguracion
            TabOrder = 1
          end
          object CBEIdCompany: TLFDbedit
            Left = 66
            Top = 76
            Width = 561
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ID_COMPANY'
            DataSource = DMDGIIConfEnvio.DSQMDgiiConfiguracion
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 633
          DataSource = DMDGIIConfEnvio.DSQMDgiiConfiguracion
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_COMPANY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOKEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'URL_BASE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 645
  end
end
