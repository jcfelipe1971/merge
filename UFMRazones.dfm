inherited FMRazones: TFMRazones
  Left = 462
  Top = 354
  HelpContext = 315
  Caption = 'Razones Sociales'
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
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBERazon
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBERazon
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
            Top = 24
            DataSource = DMRazones.DSRazones
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TERCEROS_RAZONES'
            CampoNum = 'RAZON'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'RAZON')
          end
          object LRazon: TLFLabel
            Left = 30
            Top = 31
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Raz'#243'n'
            FocusControl = DBERazon
          end
          object LTitulo: TLFLabel
            Left = 33
            Top = 53
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LTipo: TLFLabel
            Left = 40
            Top = 75
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBETipo
          end
          object DBERazon: TLFDbedit
            Left = 66
            Top = 28
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'RAZON'
            DataSource = DMRazones.DSRazones
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 66
            Top = 50
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMRazones.DSRazones
            TabOrder = 1
          end
          object DBETipo: TLFDbedit
            Left = 66
            Top = 72
            Width = 31
            Height = 21
            DataField = 'Z_TIPO'
            DataSource = DMRazones.DSRazones
            TabOrder = 2
            OnChange = DBETipoChange
          end
          object ETituloTipoIdentificacion: TLFEdit
            Left = 98
            Top = 72
            Width = 251
            Height = 21
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMRazones.DSRazones
          CamposAOrdenar.Strings = (
            'RAZON'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RAZON'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 274
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
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
