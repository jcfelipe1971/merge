inherited FMControlPlazas: TFMControlPlazas
  Left = 254
  Top = 223
  Width = 640
  Height = 388
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Control de Plazas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 630
    Height = 335
    inherited TBMain: TLFToolBar
      Width = 626
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 626
      Height = 305
      ActivePage = TSEstructura
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSEstructura: TTabSheet
        Caption = 'Estructura'
        object TBEstructura: TLFToolBar
          Left = 0
          Top = 0
          Width = 618
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLDia: TLFPanel
            Left = 0
            Top = 2
            Width = 185
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              185
              22)
            object LDia: TLFLabel
              Left = 23
              Top = 4
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LDiaSemana: TLFLabel
              Left = 48
              Top = 2
              Width = 133
              Height = 17
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Lunes'
              Color = clInfoBk
              ParentColor = False
              Layout = tlCenter
            end
          end
          object ToolButton1: TToolButton
            Left = 185
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtDiaSemanaAnterior: TToolButton
            Left = 193
            Top = 2
            Action = ADiaSemanaAnterior
          end
          object TButtDiaSemanaSiguiente: TToolButton
            Left = 216
            Top = 2
            Action = ADiaSemanaSiguiente
          end
          object ToolButton2: TToolButton
            Left = 239
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object LActivoWeb: TLFLabel
            Left = 247
            Top = 2
            Width = 80
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Venta Web'
            Color = clMoneyGreen
            ParentColor = False
            Layout = tlCenter
          end
          object ToolButton3: TToolButton
            Left = 327
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object LVisibleWeb: TLFLabel
            Left = 335
            Top = 2
            Width = 80
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Horario Web'
            Color = clYellow
            ParentColor = False
            Layout = tlCenter
          end
        end
        object PCEstructura: TLFPageControl
          Left = 0
          Top = 29
          Width = 618
          Height = 248
          ActivePage = TSEstructuraGolondrina
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSEstructuraGolondrina: TTabSheet
            Caption = 'Golondrina'
            object PNLEstructuraGolo: TLFPanel
              Left = 0
              Top = 0
              Width = 610
              Height = 220
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGEstructuraGolo: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 610
                Height = 220
                Align = alClient
                DataSource = DMControlPlazas.DSQMEstructuraGolo
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                AutoCambiarColumna = False
                AutoPostEnCheckBox = True
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'HORA')
                ColumnasCheckBoxes.Strings = (
                  'ACTIVO'
                  'ACTIVO_WEB_01'
                  'ACTIVO_WEB_02'
                  'ACTIVO_WEB_03'
                  'ACTIVO_WEB_04'
                  'ACTIVO_WEB_05'
                  'ACTIVO_WEB_06'
                  'ACTIVO_WEB_07'
                  'ACTIVO_WEB_08'
                  'ACTIVO_WEB_09'
                  'ACTIVO_WEB_10'
                  'ACTIVO_WEB_11'
                  'ACTIVO_WEB_12'
                  'VISIBLE_WEB_01'
                  'VISIBLE_WEB_02'
                  'VISIBLE_WEB_03'
                  'VISIBLE_WEB_04'
                  'VISIBLE_WEB_05'
                  'VISIBLE_WEB_06'
                  'VISIBLE_WEB_07'
                  'VISIBLE_WEB_08'
                  'VISIBLE_WEB_09'
                  'VISIBLE_WEB_10'
                  'VISIBLE_WEB_11'
                  'VISIBLE_WEB_12')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'HORA'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTIVO'
                    Width = 38
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_01'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_02'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_03'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_04'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_05'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_06'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_07'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_08'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_09'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_10'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_11'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_12'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_01'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_02'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_03'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_04'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_05'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_06'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_07'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_08'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_09'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_10'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_11'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_12'
                    Width = 30
                    Visible = True
                  end>
              end
            end
          end
          object TSEstructuraCatamaran: TTabSheet
            Caption = 'Catamaran'
            ImageIndex = 1
            object PNLEstructuraCat: TLFPanel
              Left = 0
              Top = 0
              Width = 610
              Height = 220
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGEstructuraCat: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 610
                Height = 220
                Align = alClient
                DataSource = DMControlPlazas.DSQMEstructuraCat
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                AutoCambiarColumna = False
                AutoPostEnCheckBox = True
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'HORA')
                ColumnasCheckBoxes.Strings = (
                  'ACTIVO_WEB_12'
                  'ACTIVO_WEB_11'
                  'ACTIVO_WEB_10'
                  'ACTIVO_WEB_09'
                  'ACTIVO_WEB_08'
                  'ACTIVO_WEB_07'
                  'ACTIVO_WEB_06'
                  'ACTIVO_WEB_05'
                  'ACTIVO_WEB_04'
                  'ACTIVO_WEB_03'
                  'ACTIVO_WEB_02'
                  'ACTIVO_WEB_01'
                  'ACTIVO'
                  'VISIBLE_WEB_01'
                  'VISIBLE_WEB_02'
                  'VISIBLE_WEB_03'
                  'VISIBLE_WEB_04'
                  'VISIBLE_WEB_05'
                  'VISIBLE_WEB_06'
                  'VISIBLE_WEB_07'
                  'VISIBLE_WEB_08'
                  'VISIBLE_WEB_09'
                  'VISIBLE_WEB_10'
                  'VISIBLE_WEB_11'
                  'VISIBLE_WEB_12')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'HORA'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTIVO'
                    Width = 38
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_01'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_02'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_03'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_04'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_05'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_06'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_07'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_08'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_09'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_10'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_11'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_12'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_01'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_02'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_03'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_04'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_05'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_06'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_07'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_08'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_09'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_10'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_11'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_12'
                    Width = 30
                    Visible = True
                  end>
              end
            end
          end
          object TSEstructuraEscuela: TTabSheet
            Caption = 'Escuela'
            ImageIndex = 2
            object PNLEstructuraEsc: TLFPanel
              Left = 0
              Top = 0
              Width = 610
              Height = 220
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGEstructuraEsc: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 610
                Height = 220
                Align = alClient
                DataSource = DMControlPlazas.DSQMEstructuraEsc
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                AutoCambiarColumna = False
                AutoPostEnCheckBox = True
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'HORA')
                ColumnasCheckBoxes.Strings = (
                  'ACTIVO'
                  'ACTIVO_WEB_01'
                  'ACTIVO_WEB_02'
                  'ACTIVO_WEB_03'
                  'ACTIVO_WEB_04'
                  'ACTIVO_WEB_05'
                  'ACTIVO_WEB_06'
                  'ACTIVO_WEB_07'
                  'ACTIVO_WEB_08'
                  'ACTIVO_WEB_09'
                  'ACTIVO_WEB_10'
                  'ACTIVO_WEB_11'
                  'ACTIVO_WEB_12'
                  'VISIBLE_WEB_01'
                  'VISIBLE_WEB_02'
                  'VISIBLE_WEB_03'
                  'VISIBLE_WEB_04'
                  'VISIBLE_WEB_05'
                  'VISIBLE_WEB_06'
                  'VISIBLE_WEB_07'
                  'VISIBLE_WEB_08'
                  'VISIBLE_WEB_09'
                  'VISIBLE_WEB_10'
                  'VISIBLE_WEB_11'
                  'VISIBLE_WEB_12')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'HORA'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTIVO'
                    Width = 38
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_01'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_02'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_03'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_04'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_05'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_06'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_07'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_08'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_09'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_10'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_11'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB_12'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_01'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_02'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_03'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_04'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_05'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_06'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_07'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_08'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_09'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_10'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_11'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB_12'
                    Width = 30
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      object TSHorarios: TTabSheet
        Caption = 'Horarios'
        ImageIndex = 1
        object TBHorarios: TLFToolBar
          Left = 0
          Top = 0
          Width = 618
          Height = 29
          ButtonHeight = 23
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLFecha: TLFPanel
            Left = 0
            Top = 2
            Width = 185
            Height = 23
            BevelOuter = bvNone
            TabOrder = 0
            object LFecha: TLFLabel
              Left = 8
              Top = 4
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DEFecha: TLFDateEdit
              Left = 48
              Top = 0
              Width = 133
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
              OnChange = DEFechaChange
            end
          end
          object ToolButton4: TToolButton
            Left = 185
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtDiaAnterior: TToolButton
            Left = 193
            Top = 2
            Action = ADiaAnterior
          end
          object TButtADiaSiguiente: TToolButton
            Left = 216
            Top = 2
            Action = ADiaSiguiente
          end
        end
        object PNLHorarios: TLFPanel
          Left = 0
          Top = 29
          Width = 618
          Height = 248
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
        end
        object PCHorarios: TLFPageControl
          Left = 0
          Top = 29
          Width = 618
          Height = 248
          ActivePage = TSHorariosGolondrina
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 2
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSHorariosGolondrina: TTabSheet
            Caption = 'Golondrina'
            object PNLHorariosGolo: TLFPanel
              Left = 0
              Top = 0
              Width = 610
              Height = 220
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGHorariosGolo: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 610
                Height = 220
                Align = alClient
                DataSource = DMControlPlazas.DSQMPlazasGolo
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                AutoCambiarColumna = False
                AutoPostEnCheckBox = True
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'FECHA_HORA')
                ColumnasCheckBoxes.Strings = (
                  'ACTIVO'
                  'ACTIVO_WEB'
                  'VISIBLE_WEB')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'FECHA_HORA'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLAZAS'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLAZAS_MAXIMAS'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTIVO'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MENSAJE'
                    Width = 290
                    Visible = True
                  end>
              end
            end
          end
          object TSHorariosCatamaran: TTabSheet
            Caption = 'Catamaran'
            ImageIndex = 1
            object PNLHorariosCat: TLFPanel
              Left = 0
              Top = 0
              Width = 610
              Height = 220
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGHorariosCat: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 610
                Height = 220
                Align = alClient
                DataSource = DMControlPlazas.DSQMPlazasCat
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                AutoCambiarColumna = False
                AutoPostEnCheckBox = True
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = -1
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'FECHA_HORA')
                ColumnasCheckBoxes.Strings = (
                  'ACTIVO'
                  'ACTIVO_WEB'
                  'VISIBLE_WEB')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'FECHA_HORA'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLAZAS'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLAZAS_MAXIMAS'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTIVO'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MENSAJE'
                    Width = 290
                    Visible = True
                  end>
              end
            end
          end
          object TSHorarioEscuela: TTabSheet
            Caption = 'Escuela'
            ImageIndex = 2
            object PNLHorariosEsc: TLFPanel
              Left = 0
              Top = 0
              Width = 610
              Height = 220
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGHorariosEsc: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 610
                Height = 220
                Align = alClient
                DataSource = DMControlPlazas.DSQMPlazasEsc
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                AutoCambiarColumna = False
                AutoPostEnCheckBox = True
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'FECHA_HORA')
                ColumnasCheckBoxes.Strings = (
                  'ACTIVO'
                  'ACTIVO_WEB'
                  'VISIBLE_WEB')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'FECHA_HORA'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLAZAS'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLAZAS_MAXIMAS'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTIVO'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'ACTIVO_WEB'
                    Width = 70
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'VISIBLE_WEB'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MENSAJE'
                    Width = 290
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 335
    Width = 630
    EdgeOuter = esNone
  end
  inherited ALMain: TLFActionList
    object ADiaSemanaSiguiente: TAction
      Caption = 'ADiaSemanaSiguiente'
      ImageIndex = 9
      OnExecute = ADiaSemanaSiguienteExecute
    end
    object ADiaSemanaAnterior: TAction
      Caption = 'ADiaSemanaAnterior'
      ImageIndex = 51
      OnExecute = ADiaSemanaAnteriorExecute
    end
    object ADiaSiguiente: TAction
      Caption = 'ADiaSiguiente'
      ImageIndex = 9
      OnExecute = ADiaSiguienteExecute
    end
    object ADiaAnterior: TAction
      Caption = 'ADiaAnterior'
      ImageIndex = 51
      OnExecute = ADiaAnteriorExecute
    end
  end
end
