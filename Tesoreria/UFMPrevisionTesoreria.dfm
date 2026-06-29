inherited FMPrevisionTesoreria: TFMPrevisionTesoreria
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Previsi'#243'n Tesoreria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    BorderWidth = 0
    inherited TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 502
      inherited NavMain: THYMNavigator
        DataSource = DMPrevisionTesoreria.DSQMPrevision
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      Left = 0
      Top = 26
      Width = 502
      Height = 306
      inherited TSFicha: TTabSheet
        Caption = 'Filtro'
        object LMesInicial: TLFLabel [0]
          Left = 50
          Top = 156
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mes Inicial'
        end
        object LCantidadMeses: TLFLabel [1]
          Left = 9
          Top = 178
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cantidad de Meses'
        end
        object LFechaPivote: TLFLabel [2]
          Left = 37
          Top = 200
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Pivote'
        end
        inherited PEdit: TLFPanel
          Top = 129
          Width = 494
          Height = 149
          TabOrder = 5
          inherited G2KTableLoc: TG2KTBLoc
            Top = 39
            Tabla_a_buscar = 'EMP_PREV_TESORERIA'
            CampoNum = 'PREVISION'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'PREVISION')
          end
          object LPeriodo: TLFLabel
            Left = 40
            Top = 27
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perido Inicial'
          end
          object LMeses: TLFLabel
            Left = 69
            Top = 48
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Meses'
          end
        end
        object ECantidadMeses: TLFEdit
          Left = 105
          Top = 174
          Width = 49
          Height = 21
          TabOrder = 2
          Text = '12'
        end
        object EFPeriodo: TLFEditFind2000
          Left = 105
          Top = 152
          Width = 49
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PERIODO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EFEjercicio: TLFEditFind2000
          Left = 155
          Top = 152
          Width = 71
          Height = 21
          TabOrder = 1
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EJERCICIO'
          CampoStr = 'APERTURA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_EJERCICIOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EJERCICIO desc')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object BCalcular: TButton
          Left = 233
          Top = 152
          Width = 75
          Height = 44
          Caption = 'Calcular'
          TabOrder = 3
          OnClick = BCalcularClick
        end
        object PNLFichaPrevision: TLFPanel
          Left = 0
          Top = 0
          Width = 494
          Height = 129
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 4
          DesignSize = (
            494
            129)
          object LPrevision: TLFLabel
            Left = 56
            Top = 44
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Previsi'#243'n'
          end
          object LTituloPrevision: TLFLabel
            Left = 71
            Top = 64
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LPlantilla: TLFLabel
            Left = 63
            Top = 86
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plantilla'
          end
          object DBEPrevision: TLFDbedit
            Left = 104
            Top = 40
            Width = 121
            Height = 21
            DataField = 'PREVISION'
            DataSource = DMPrevisionTesoreria.DSQMPrevision
            TabOrder = 0
          end
          object DBETituloPrevision: TLFDbedit
            Left = 104
            Top = 62
            Width = 337
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPrevisionTesoreria.DSQMPrevision
            TabOrder = 1
          end
          object DBEPlantilla: TLFDbedit
            Left = 104
            Top = 84
            Width = 337
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PLANTILLA'
            DataSource = DMPrevisionTesoreria.DSQMPrevision
            TabOrder = 2
          end
          object BBuscarArchivo: TButton
            Left = 443
            Top = 84
            Width = 24
            Height = 21
            Anchors = [akTop, akRight]
            Caption = '...'
            TabOrder = 3
            OnClick = BBuscarArchivoClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 494
          Height = 278
          DataSource = DMPrevisionTesoreria.DSQMPrevision
          Columns = <
            item
              Expanded = False
              FieldName = 'PREVISION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end>
        end
      end
      object TSPrevision: TTabSheet
        Caption = 'Previsi'#243'n'
        ImageIndex = 1
        object TBPrevision: TLFToolBar
          Left = 0
          Top = 0
          Width = 494
          Height = 29
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavPrevision: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMPrevisionTesoreria.DSQMPrevisionPrev
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEPrevision
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object PNLEjercicioPrevision: TLFPanel
            Left = 248
            Top = 2
            Width = 132
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LEjercicioPrevision: TLFLabel
              Left = 12
              Top = 4
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
            end
            object EFEjercicioPrevision: TLFEditFind2000
              Left = 57
              Top = 0
              Width = 72
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 0
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'EJERCICIO'
              CampoStr = 'APERTURA'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'EMP_EJERCICIOS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'EJERCICIO desc')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object BGenerarPrevisionEjercicio: TButton
            Left = 380
            Top = 2
            Width = 101
            Height = 22
            Caption = 'Generar Prevision'
            TabOrder = 2
            OnClick = BGenerarPrevisionEjercicioClick
          end
        end
        object PNLPrevision: TLFPanel
          Left = 0
          Top = 29
          Width = 494
          Height = 249
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGPrevision: THYTDBGrid
            Left = 0
            Top = 0
            Width = 494
            Height = 249
            Align = alClient
            BorderStyle = bsNone
            DataSource = DMPrevisionTesoreria.DSQMPrevisionPrev
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
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 179
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_01'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_02'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_03'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_04'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_05'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_06'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_07'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_08'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_09'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_10'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_11'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_12'
                Visible = True
              end>
          end
        end
      end
      object TSResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 2
        object TBResultado: TLFToolBar
          Left = 0
          Top = 0
          Width = 494
          Height = 29
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavResultado: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMPrevisionTesoreria.DSQMResultado
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEResultado
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton2: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtExportarExcel: TToolButton
            Left = 248
            Top = 2
            Hint = 'Exportar Excel'
            Caption = 'Exportar Excel'
            ImageIndex = 36
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtExportarExcelClick
          end
        end
        object PNLResultado: TLFPanel
          Left = 0
          Top = 29
          Width = 494
          Height = 249
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGResultado: THYTDBGrid
            Left = 0
            Top = 0
            Width = 494
            Height = 249
            Align = alClient
            BorderStyle = bsNone
            DataSource = DMPrevisionTesoreria.DSQMResultado
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 179
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_01'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_02'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_03'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_04'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_05'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_06'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_07'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_08'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_09'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_10'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_11'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MES_12'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_01'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_02'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_03'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_04'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_05'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_06'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_07'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_08'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_09'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_10'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_11'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREV_12'
                ReadOnly = True
                Visible = True
              end>
          end
        end
      end
      object TSConfiguracion: TTabSheet
        Caption = 'Configuraci'#243'n'
        ImageIndex = 3
        object PCConfiguracion: TLFPageControl
          Left = 0
          Top = 29
          Width = 494
          Height = 249
          ActivePage = TSFichaConfiguracion
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSFichaConfiguracion: TTabSheet
            Caption = 'Ficha'
            object PNLConfiguracion: TLFPanel
              Left = 0
              Top = 0
              Width = 486
              Height = 221
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                486
                221)
              object LTitulo: TLFLabel
                Left = 50
                Top = 33
                Width = 26
                Height = 13
                Alignment = taRightJustify
                Caption = 'Titulo'
              end
              object LOrden: TLFLabel
                Left = 47
                Top = 12
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Orden'
              end
              object LSQL: TLFLabel
                Left = 55
                Top = 79
                Width = 21
                Height = 13
                Alignment = taRightJustify
                Caption = 'SQL'
              end
              object LCeldaExcel: TLFLabel
                Left = 20
                Top = 55
                Width = 56
                Height = 13
                Alignment = taRightJustify
                Caption = 'Celda Excel'
              end
              object LCeldaExcelPrev: TLFLabel
                Left = 182
                Top = 55
                Width = 102
                Height = 13
                Alignment = taRightJustify
                Caption = 'Celda Excel Prevision'
              end
              object DBEOrden: TLFDbedit
                Left = 81
                Top = 8
                Width = 56
                Height = 21
                DataField = 'ORDEN'
                DataSource = DMPrevisionTesoreria.DSQMConfiguracion
                TabOrder = 0
              end
              object DBETitulo: TLFDbedit
                Left = 81
                Top = 30
                Width = 400
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'TITULO'
                DataSource = DMPrevisionTesoreria.DSQMConfiguracion
                TabOrder = 1
              end
              object DBMSQL: TLFDBMemo
                Left = 81
                Top = 74
                Width = 400
                Height = 145
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'SQL'
                DataSource = DMPrevisionTesoreria.DSQMConfiguracion
                TabOrder = 4
              end
              object DBECeldaExcel: TLFDbedit
                Left = 81
                Top = 52
                Width = 56
                Height = 21
                DataField = 'CELDA_EXCEL'
                DataSource = DMPrevisionTesoreria.DSQMConfiguracion
                TabOrder = 2
              end
              object DBECeldaExcelPrev: TLFDbedit
                Left = 289
                Top = 52
                Width = 56
                Height = 21
                DataField = 'CELDA_EXCEL_PREV'
                DataSource = DMPrevisionTesoreria.DSQMConfiguracion
                TabOrder = 3
              end
            end
          end
          object TSTablaConfiguracion: TTabSheet
            Caption = 'Tabla'
            ImageIndex = 1
            object DBGConfiguracion: THYTDBGrid
              Left = 0
              Top = 0
              Width = 486
              Height = 221
              Align = alClient
              BorderStyle = bsNone
              Color = clInfoBk
              DataSource = DMPrevisionTesoreria.DSQMConfiguracion
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
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
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ORDEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Visible = True
                end>
            end
          end
        end
        object TBConfiguracion: TLFToolBar
          Left = 0
          Top = 0
          Width = 494
          Height = 29
          EdgeBorders = []
          TabOrder = 1
          Separators = True
          object NavConfiguracion: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMPrevisionTesoreria.DSQMConfiguracion
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBETitulo
            InsertaControl = DBEOrden
            Exclusivo = True
            ControlEdit = CEConfiguracion
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton3: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PNLFichaPrevision
    Left = 352
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 388
    Top = 4
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 424
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 464
    Top = 8
  end
  object CEPrevision: TControlEdit
    DataSource = DMPrevisionTesoreria.DSQMPrevisionPrev
    Left = 400
    Top = 88
  end
  object CEResultado: TControlEdit
    DataSource = DMPrevisionTesoreria.DSQMResultado
    PanelEdicion = PNLResultado
    Left = 432
    Top = 88
  end
  object CEConfiguracion: TControlEdit
    DataSource = DMPrevisionTesoreria.DSQMConfiguracion
    PanelEdicion = PNLConfiguracion
    Left = 464
    Top = 88
  end
end
