inherited FMPlazosGarantia: TFMPlazosGarantia
  Top = 317
  Width = 400
  Height = 247
  HelpContext = 295
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Plazos de Garant'#237'a'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMPlazosGarantia.DSQMPlazosGarantia
        Hints.Strings = ()
        EditaControl = DBDias
        InsertaControl = DBDias
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
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMPlazosGarantia.DSQMPlazosGarantia
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_PLAZOS_GARANTIA'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 31
            Top = 21
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 24
            Top = 43
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LMeses: TLFLabel
            Left = 21
            Top = 87
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Meses'
          end
          object LDias: TLFLabel
            Left = 29
            Top = 65
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as'
          end
          object LAnyos: TLFLabel
            Left = 28
            Top = 109
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'A'#241'os'
          end
          object DBDias: THYDBEdit
            Left = 57
            Top = 61
            Width = 65
            Height = 21
            DataField = 'DIAS'
            DataSource = DMPlazosGarantia.DSQMPlazosGarantia
            Enabled = False
            TabOrder = 0
          end
          object DBMeses: THYDBEdit
            Left = 57
            Top = 83
            Width = 65
            Height = 21
            DataField = 'MESES'
            DataSource = DMPlazosGarantia.DSQMPlazosGarantia
            Enabled = False
            TabOrder = 1
          end
          object DBAnyos: THYDBEdit
            Left = 57
            Top = 105
            Width = 65
            Height = 21
            DataField = 'ANYOS'
            DataSource = DMPlazosGarantia.DSQMPlazosGarantia
            Enabled = False
            TabOrder = 2
          end
          object DBTipo: TLFDbedit
            Left = 57
            Top = 17
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMPlazosGarantia.DSQMPlazosGarantia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBTitulo: TLFDbedit
            Left = 57
            Top = 39
            Width = 310
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPlazosGarantia.DSQMPlazosGarantia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMPlazosGarantia.DSQMPlazosGarantia
          CamposAOrdenar.Strings = (
            'ANYOS'
            'DIAS'
            'MESES'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 284
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAS'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MESES'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANYOS'
              Width = 80
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
    Left = 322
    Top = 38
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
