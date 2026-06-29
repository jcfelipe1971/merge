inherited FMCodigosBarra: TFMCodigosBarra
  Left = 493
  Top = 293
  HelpContext = 292
  Caption = 'Tipos de C'#243'digo de Barras'
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
        DataSource = DMCodigosBarra.DSQMCodigosBarra
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
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
      ActivePage = TSTabla
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Top = 24
            DataSource = DMCodigosBarra.DSQMCodigosBarra
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_CODIGO_BARRAS'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LBTipo: TLFLabel
            Left = 39
            Top = 27
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBTitulo: TLFLabel
            Left = 32
            Top = 49
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLongitud: TLFLabel
            Left = 19
            Top = 71
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Longitud'
          end
          object DBETipo: TLFDbedit
            Left = 64
            Top = 23
            Width = 41
            Height = 21
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMCodigosBarra.DSQMCodigosBarra
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBETitulo: TLFDbedit
            Left = 64
            Top = 45
            Width = 310
            Height = 21
            DataField = 'TITULO'
            DataSource = DMCodigosBarra.DSQMCodigosBarra
            TabOrder = 0
          end
          object DBELongitud: TLFDbedit
            Left = 64
            Top = 67
            Width = 41
            Height = 21
            DataField = 'LONGITUD'
            DataSource = DMCodigosBarra.DSQMCodigosBarra
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMCodigosBarra.DSQMCodigosBarra
          CamposAOrdenar.Strings = (
            'LONGITUD'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LONGITUD'
              Width = 48
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
    Left = 234
    Top = 80
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 274
    Top = 78
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 230
    Top = 130
  end
  inherited FSMain: TLFFibFormStorage
    Left = 278
    Top = 134
  end
end
