inherited OpeFMHorario: TOpeFMHorario
  Left = 304
  Top = 193
  Width = 496
  Height = 335
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Horarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 486
    Height = 145
    inherited TBMain: TLFToolBar
      Width = 482
      inherited NavMain: THYMNavigator
        DataSource = OpeDMHorario.DSQMHorario
        Hints.Strings = ()
        EditaControl = DBEHorario
        InsertaControl = DBEHorario
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 482
      Height = 115
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 474
          Height = 87
          inherited G2KTableLoc: TG2KTBLoc
            Top = 48
            DataSource = OpeDMHorario.DSQMHorario
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'OPE_HORARIOS'
            CampoNum = 'HORARIO'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'HORARIO')
          end
          object LHorario: TLFLabel
            Left = 46
            Top = 14
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
          end
          object LDescripcion: TLFLabel
            Left = 24
            Top = 37
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LHorasProd: TLFLabel
            Left = 26
            Top = 58
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas Prod.'
          end
          object LHorasNoProd: TLFLabel
            Left = 161
            Top = 58
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas No Prod.'
          end
          object LHorasLab: TLFLabel
            Left = 321
            Top = 59
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas Totales'
          end
          object DBEHorario: TLFDbedit
            Left = 85
            Top = 10
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'HORARIO'
            DataSource = OpeDMHorario.DSQMHorario
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 85
            Top = 32
            Width = 356
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMHorario.DSQMHorario
            MaxLength = 100
            TabOrder = 1
          end
          object DBEHorasProd: TLFDbedit
            Left = 85
            Top = 54
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'HORAS_PROD'
            DataSource = OpeDMHorario.DSxTotalHoras
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEHorasNoProd: TLFDbedit
            Left = 235
            Top = 54
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'HORAS_NO_PROD'
            DataSource = OpeDMHorario.DSxTotalHoras
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEHorasLab: TLFDbedit
            Left = 391
            Top = 54
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'HORAS_LAB'
            DataSource = OpeDMHorario.DSxTotalHoras
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 474
          Height = 87
          DataSource = OpeDMHorario.DSQMHorario
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'HORARIO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 373
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 282
    Width = 486
  end
  inherited PDetalle: TLFPanel [2]
    Top = 145
    Width = 486
    Height = 137
    inherited TBDetalle: TLFToolBar
      Width = 486
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 200
        DataSource = OpeDMHorario.DSQMDetalle
        Hints.Strings = ()
        Exclusivo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 486
      Height = 115
      DataSource = OpeDMHorario.DSQMDetalle
      PopupMenu = nil
      IndiceBitmapAscendente = 0
      IndiceBitmapDescendente = 0
      ColumnasCheckBoxes.Strings = (
        'HORA_PRODUCTIVA')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_INI'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_FIN'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_PRODUCTIVA'
          Width = 83
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    Left = 252
    Top = 32
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 328
    Top = 48
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 11
  end
  inherited FSMain: TLFFibFormStorage
    Left = 434
    Top = 10
  end
  inherited CEDetalle: TControlEdit
    Left = 296
    Top = 196
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 160
    Top = 200
  end
end
