inherited FMNomConstantes: TFMNomConstantes
  Left = 288
  Top = 132
  Width = 1309
  Height = 774
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'N'#243'minas del Periodo'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1299
    Height = 721
    inherited TBMain: TLFToolBar
      Width = 1295
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = DMNomConstantes.DSPeriodos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEPeriodo
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Width = 66
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 284
      end
      inherited TbuttComp: TToolButton
        Left = 292
        Hint = 'Crear las nominas para todos los empleados del periodo'
      end
      object TBGenerarNominas: TToolButton
        Left = 315
        Top = 0
        Action = AGenerarNominas
      end
      object TBContabilizarTodas: TToolButton
        Left = 338
        Top = 0
        Action = AContabilizar
      end
      object TBDescontabilizarTodas: TToolButton
        Left = 361
        Top = 0
        Action = ADescontabilizar
      end
      object TSepConst: TToolButton
        Left = 384
        Top = 0
        Width = 8
        ImageIndex = 69
        Style = tbsSeparator
      end
      object TBCreaConsTramosIndicadores: TToolButton
        Left = 392
        Top = 0
        Action = AConsTramosIndicadores
      end
      object TSep1: TToolButton
        Left = 415
        Top = 0
        Width = 8
        ImageIndex = 18
        Style = tbsSeparator
      end
      object TBPrevired: TToolButton
        Left = 423
        Top = 0
        Action = AExportarPrevired
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1295
      Height = 691
      inherited TSFicha: TTabSheet
        object SBANominasPendientes: TSpeedButton [0]
          Left = 720
          Top = 75
          Width = 52
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver las Constantes del Periodo'
          GroupIndex = -1
          OnDblClick = SBANominasPendientesDblClick
        end
        object SBAEmpleados: TSpeedButton [1]
          Left = 728
          Top = 83
          Width = 52
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los Empleados '
          GroupIndex = -1
          OnDblClick = SBAEmpleadosDblClick
        end
        object SBANominasCerradas: TSpeedButton [2]
          Left = 736
          Top = 90
          Width = 52
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver las Constantes del Periodo'
          GroupIndex = -1
          OnDblClick = SBANominasCerradasDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1287
          Height = 100
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 16
            Tabla_a_buscar = 'VER_PERIODOS'
            CampoNum = 'PERIODO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'PERIODO BETWEEN '#39'01'#39' AND '#39'12'#39
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'PERIODO')
          end
          object LPeriodo: TLFLabel
            Left = 37
            Top = 34
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodo'
          end
          object LDescripcion: TLFLabel
            Left = 17
            Top = 56
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripcion'
          end
          object LEmpleados: TLFLabel
            Left = 649
            Top = 56
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empleados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LAsiento: TLFLabel
            Left = 668
            Top = 34
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LNomPendientes: TLFLabel
            Left = 818
            Top = 56
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Abiertas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LFCerradas: TLFLabel
            Left = 966
            Top = 56
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cerradas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LNomCerradasTotalLiq: TLFLabel
            Left = 1117
            Top = 56
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'quido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBEPeriodo: TLFDbedit
            Left = 79
            Top = 31
            Width = 154
            Height = 21
            Color = clInfoBk
            DataField = 'PERIODO'
            DataSource = DMNomConstantes.DSPeriodos
            ReadOnly = True
            TabOrder = 0
            OnChange = DBEPeriodoChange
          end
          object DBEDescripcion: TLFDbedit
            Left = 79
            Top = 53
            Width = 554
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMNomConstantes.DSPeriodos
            ReadOnly = True
            TabOrder = 1
          end
          object DBEEmpleados: TLFDbedit
            Left = 718
            Top = 53
            Width = 82
            Height = 21
            Color = clInfoBk
            DataField = 'CANTIDAD_EMPLEADOS'
            DataSource = DMNomConstantes.DSxInfoActualizada
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBENominasPendientes: TLFDbedit
            Left = 870
            Top = 53
            Width = 82
            Height = 21
            Color = clInfoBk
            DataField = 'NOMINAS_PENDIENTES'
            DataSource = DMNomConstantes.DSxInfoActualizada
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEAsiento: TLFDbedit
            Left = 718
            Top = 31
            Width = 82
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBECerradas: TLFDbedit
            Left = 1021
            Top = 53
            Width = 82
            Height = 21
            Color = clInfoBk
            DataField = 'NOMINAS_CERRADAS'
            DataSource = DMNomConstantes.DSxInfoActualizada
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBENomCerradasTotalLiq: TLFDbedit
            Left = 1166
            Top = 53
            Width = 82
            Height = 21
            Color = clInfoBk
            DataField = 'TOTAL_LIQUIDO'
            DataSource = DMNomConstantes.DSxInfoActualizada
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
        end
        object PCCuerpo: TPageControl
          Left = 0
          Top = 100
          Width = 1287
          Height = 563
          ActivePage = TSPrincipal
          Align = alClient
          TabIndex = 0
          TabOrder = 1
          object TSPrincipal: TTabSheet
            Caption = 'Principal'
            object SplitterIndicadores: TSplitter
              Left = 785
              Top = 22
              Width = 8
              Height = 513
              Cursor = crHSplit
              Align = alRight
            end
            object SplitterTramos: TSplitter
              Left = 377
              Top = 22
              Width = 8
              Height = 513
              Cursor = crHSplit
            end
            object PDetalle: TLFPanel
              Left = 0
              Top = 22
              Width = 377
              Height = 513
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object LConstantes: TLFLabel
                Left = 0
                Top = 0
                Width = 377
                Height = 13
                Align = alTop
                Caption = 'Constantes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
              object TBDetalle: TLFToolBar
                Left = 0
                Top = 13
                Width = 377
                Height = 22
                AutoSize = True
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavDetalle: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 216
                  Height = 22
                  DataSource = DMNomConstantes.DSQMNomConstantes
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  Exclusivo = True
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object TBSep1: TToolButton
                  Left = 216
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TBCrearConstatesPeriodo: TToolButton
                  Left = 224
                  Top = 0
                  Hint = 
                    'Crear constantes para el periodo.'#13#10'Copia los valores del periodo' +
                    ' anterior (si existe).'
                  Caption = 'Crear Constates Periodo'
                  ImageIndex = 21
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = TBCrearConstatesPeriodoClick
                end
                object TBSep2: TToolButton
                  Left = 247
                  Top = 0
                  Width = 8
                  ImageIndex = 22
                  Style = tbsSeparator
                end
                object Button1: TButton
                  Left = 255
                  Top = 0
                  Width = 19
                  Height = 22
                  TabOrder = 1
                end
              end
              object DBGFDetalle: TDBGridFind2000
                Left = 0
                Top = 35
                Width = 377
                Height = 478
                Align = alClient
                DataSource = DMNomConstantes.DSQMNomConstantes
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGFDetalleCellClick
                OnDrawColumnCell = DBGFDetalleDrawColumnCell
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
                AutoCambiarColumna = False
                AutoPostEnCheckBox = False
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 0
                IndiceBitmapChecked = -1
                IndiceBitmapDescendente = 0
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CODIGO'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'GLOSA'
                    ReadOnly = True
                    Width = 153
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IMPORTE'
                    Width = 88
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATO_TEXTO'
                    Width = 100
                    Visible = True
                  end>
              end
            end
            object PTramos: TLFPanel
              Left = 385
              Top = 22
              Width = 400
              Height = 513
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object LTramosRenta: TLFLabel
                Left = 0
                Top = 0
                Width = 400
                Height = 13
                Align = alTop
                Caption = 'Tramos Renta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
              object TBTramos: TLFToolBar
                Left = 0
                Top = 13
                Width = 400
                Height = 22
                AutoSize = True
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavTramos: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMNomConstantes.DSQMAFPIndicadores
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  Exclusivo = True
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object TBSep3: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  ImageIndex = 19
                  Style = tbsSeparator
                end
                object TBCrearTramosRenta: TToolButton
                  Left = 248
                  Top = 0
                  Hint = 
                    'Crear tramos para el periodo.'#13#10'Copia los valores del periodo ant' +
                    'erior (si existe).'
                  Caption = 'Crear Tramos Renta'
                  ImageIndex = 19
                  OnClick = TBCrearTramosRentaClick
                end
              end
              object DBGTramos: TDBGridFind2000
                Left = 0
                Top = 35
                Width = 400
                Height = 478
                Align = alClient
                DataSource = DMNomConstantes.DSQMTramosRenta
                TabOrder = 1
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
                AutoCambiarColumna = False
                AutoPostEnCheckBox = False
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 0
                IndiceBitmapChecked = -1
                IndiceBitmapDescendente = 0
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DESDE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'HASTA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACTOR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REBAJAR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MAXIMO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIDOCIDAD'
                    PickList.Strings = (
                      'MENSUAL'
                      'ANUAL')
                    Visible = True
                  end>
              end
            end
            object PIndicadores: TLFPanel
              Left = 793
              Top = 22
              Width = 486
              Height = 513
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
              object LInidicadoresAFP: TLFLabel
                Left = 0
                Top = 0
                Width = 486
                Height = 13
                Align = alTop
                Caption = 'Inidicadores AFP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
              object DBGIndicadores: TDBGridFind2000
                Left = 0
                Top = 35
                Width = 486
                Height = 478
                Align = alClient
                DataSource = DMNomConstantes.DSQMAFPIndicadores
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
                AutoCambiarColumna = False
                AutoPostEnCheckBox = False
                AutoStartDrag = False
                AutoStartDragInterval = 0
                IndiceBitmapOrdenable = 0
                IndiceBitmapAscendente = 0
                IndiceBitmapChecked = -1
                IndiceBitmapDescendente = 0
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CODIGO'
                    ReadOnly = True
                    Width = 80
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'GLOSA'
                    ReadOnly = True
                    Width = 179
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TASA_AFP_DEPENDIENTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TASA_SIS_DEPENDIENTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TASA_AFP_INDEPENDIENTE'
                    Visible = True
                  end>
              end
              object TBIndicadores: TLFToolBar
                Left = 0
                Top = 13
                Width = 486
                Height = 22
                AutoSize = True
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 1
                Separators = True
                object NavIndicadores: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMNomConstantes.DSQMAFPIndicadores
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  Exclusivo = True
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object TBSep4: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  ImageIndex = 19
                  Style = tbsSeparator
                end
                object TBInsertIndicadoresAFP: TToolButton
                  Left = 248
                  Top = 0
                  Hint = 
                    'Crea indicadores AFP.'#13#10'Copia los valores del periodo anterior (s' +
                    'i existe).'
                  Caption = 'Crea indicadores AFP'
                  ImageIndex = 18
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = TBInsertIndicadoresAFPClick
                end
                object TBSep5: TToolButton
                  Left = 271
                  Top = 0
                  Width = 8
                  ImageIndex = 19
                  Style = tbsSeparator
                end
              end
            end
            object PEditConstantes: TLFPanel
              Left = 0
              Top = 0
              Width = 1279
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
              object LUf: TLFLabel
                Left = 191
                Top = 4
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'U.F'
              end
              object LUtm: TLFLabel
                Left = 303
                Top = 4
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'U.T.M'
              end
              object LTsr: TLFLabel
                Left = 427
                Top = 4
                Width = 22
                Height = 13
                Alignment = taRightJustify
                Caption = 'TSR'
              end
              object EUF: TLFEdit
                Left = 214
                Top = 0
                Width = 81
                Height = 21
                TabOrder = 0
                OnChange = EUFChange
                OnKeyUp = EUFKeyUp
              end
              object EUTM: TLFEdit
                Left = 337
                Top = 0
                Width = 81
                Height = 21
                TabOrder = 1
                OnChange = EUTMChange
                OnKeyUp = EUTMKeyUp
              end
              object ETSR: TLFEdit
                Left = 453
                Top = 0
                Width = 81
                Height = 21
                TabOrder = 2
                OnChange = ETSRChange
                OnKeyUp = ETSRKeyUp
              end
            end
          end
          object TSRemuneracion: TTabSheet
            Caption = 'Remuneracion'
            ImageIndex = 1
            OnShow = TSRemuneracionShow
            object SGRemuneraciones: TStringGrid
              Left = 0
              Top = 22
              Width = 1279
              Height = 513
              Align = alClient
              Color = clInfoBk
              DefaultColWidth = 80
              DefaultRowHeight = 20
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
              TabOrder = 0
              OnDrawCell = SGRemuneracionesDrawCell
              OnSelectCell = SGRemuneracionesSelectCell
            end
            object TBRemuneracion: TLFToolBar
              Left = 0
              Top = 0
              Width = 1279
              Height = 22
              AutoSize = True
              ButtonWidth = 177
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object BCalculaRemuneracion: TButton
                Left = 0
                Top = 0
                Width = 153
                Height = 22
                Caption = 'Calcula Remuneracion'
                TabOrder = 0
                OnClick = BCalculaRemuneracionClick
              end
              object PNLDescripcionColumna: TLFPanel
                Left = 153
                Top = 0
                Width = 400
                Height = 22
                BevelOuter = bvNone
                TabOrder = 2
              end
              object PNLProgreso: TProgressBar
                Left = 553
                Top = 0
                Width = 150
                Height = 22
                Min = 0
                Max = 100
                TabOrder = 1
              end
            end
          end
          object TSPagos: TTabSheet
            Caption = 'Pagos'
            ImageIndex = 2
            object LFTBPagos: TLFToolBar
              Left = 0
              Top = 0
              Width = 1279
              Height = 22
              AutoSize = True
              ButtonWidth = 25
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavPagos: THYMNavigator
                Left = 0
                Top = 0
                Width = 216
                Height = 22
                DataSource = DMNomConstantes.DSQPagos
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                Exclusivo = True
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object Separador1: TToolButton
                Left = 216
                Top = 0
                Width = 8
                Caption = 'Separador1'
                ImageIndex = 2
                Style = tbsSeparator
              end
              object LFPBanco: TLFPanel
                Left = 224
                Top = 0
                Width = 337
                Height = 22
                BevelOuter = bvNone
                TabOrder = 0
                object LEntidadEmpleado: TLFLabel
                  Left = 14
                  Top = 3
                  Width = 31
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Banco'
                end
                object EFBanco: TLFEditFind2000
                  Left = 48
                  Top = 0
                  Width = 49
                  Height = 21
                  TabOrder = 0
                  OnChange = EFBancoChange
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'BANCO'
                  CampoStr = 'TITULO'
                  CondicionBusqueda = 'ACTIVO = 1'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'BANCO')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object ETituloBanco: TLFEdit
                  Left = 98
                  Top = 0
                  Width = 231
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 1
                end
              end
              object TBMarcarTodos: TToolButton
                Left = 561
                Top = 0
                Caption = 'TBMarcarTodos'
                ImageIndex = 146
                OnClick = TBMarcarTodosClick
              end
              object TBDesmarcarTodos: TToolButton
                Left = 586
                Top = 0
                Caption = 'TBDesmarcarTodos'
                ImageIndex = 147
                OnClick = TBDesmarcarTodosClick
              end
              object Separador2: TToolButton
                Left = 611
                Top = 0
                Width = 8
                Caption = 'Separador2'
                ImageIndex = 2
                Style = tbsSeparator
              end
              object TBContabilizarPagos: TToolButton
                Left = 619
                Top = 0
                Caption = 'TBContabilizarPagos'
                ImageIndex = 68
                OnClick = TBContabilizarPagosClick
              end
              object TBDespagarPagos: TToolButton
                Left = 644
                Top = 0
                Caption = 'Revertir Pago'
                ImageIndex = 67
                OnClick = TBDespagarPagosClick
              end
              object LTotalBanco: TLFLabel
                Left = 669
                Top = 0
                Width = 70
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Banco'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
              object DBETotalBanco: TLFDbedit
                Left = 739
                Top = 0
                Width = 143
                Height = 22
                Color = clInfoBk
                DataField = 'TOTAL_LIQUIDO_BANCO'
                DataSource = DMNomConstantes.DSQPagos
                Enabled = False
                ReadOnly = True
                TabOrder = 2
              end
            end
            object DBGPagos: TDBGridFind2000
              Left = 0
              Top = 22
              Width = 1279
              Height = 513
              Align = alClient
              DataSource = DMNomConstantes.DSQPagos
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGPagosCellClick
              OnDrawColumnCell = DBGFDetalleDrawColumnCell
              OnDblClick = DBGPagosDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
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
              CamposAMostrar.Strings = (
                'PAGADO')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              ColumnasCheckBoxes.Strings = (
                'MARCA'
                'PAGADO')
              ColumnasChecked.Strings = (
                '1'
                '1')
              ColumnasNoChecked.Strings = (
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
                  FieldName = 'MARCA'
                  Width = 55
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PAGADO'
                  ReadOnly = True
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'RUT'
                  ReadOnly = True
                  Width = 100
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'NOMBRE'
                  ReadOnly = True
                  Width = 300
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  ReadOnly = True
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PERIODO'
                  ReadOnly = True
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'MONTO'
                  ReadOnly = True
                  Width = 80
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'CORREO'
                  ReadOnly = True
                  Width = 100
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'CTA_EMPLEADO'
                  ReadOnly = True
                  Width = 150
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'MOD_PAGO'
                  ReadOnly = True
                  Width = 80
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'FECHA_PAGO'
                  ReadOnly = True
                  Width = 80
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'CUENTA_PAGO'
                  ReadOnly = True
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RIC_PAGO'
                  Visible = True
                end>
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1287
          Height = 663
          DataSource = DMNomConstantes.DSPeriodos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'PERIODO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 474
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 721
    Width = 1299
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AGenerarNominas: TAction
      Category = 'Procesos'
      Caption = 'Generar Nominas'
      Hint = 'Genera las nominas para todos los trabajadores en el periodo'
      ImageIndex = 86
      OnExecute = AGenerarNominasExecute
    end
    object AConsTramosIndicadores: TAction
      Category = 'Procesos'
      Caption = 'Generar Constantes Tramos y AFP'
      Hint = 'Crea Constantes Tramos y AFP para el periodo'
      ImageIndex = 16
      OnExecute = AConsTramosIndicadoresExecute
    end
    object AExportarNominasBanco: TAction
      Category = 'Procesos'
      Caption = 'Exportar N'#243'minas al Banco'
      Hint = 'Exportar N'#243'minas al Banco'
      ImageIndex = 105
      OnExecute = AExportarNominasBancoExecute
    end
    object AContabilizar: TAction
      Category = 'Procesos'
      Caption = 'Contabiliza y cierra  todas las N'#243'minas del periodo'
      Hint = 'Contabiliza todas las N'#243'minas para el periodo seleccionado'
      ImageIndex = 68
      OnExecute = AContabilizarExecute
    end
    object AInicializaNominas: TAction
      Category = 'Procesos'
      Caption = 'AInicializa Nominas de todo el Ejercicio'
      Enabled = False
      OnExecute = AInicializaNominasExecute
    end
    object ADescontabilizar: TAction
      Category = 'Procesos'
      Caption = 'Descontabiliza y abre todas las N'#243'minas del periodo'
      Hint = 'Descontabiliza todas las N'#243'minas para el periodo seleccionado'
      ImageIndex = 67
      OnExecute = ADescontabilizarExecute
    end
    object ACalculaRemuneracion: TAction
      Category = 'Procesos'
      Caption = 'Calcula Remuneracion'
      Hint = 'Calcula Remuneracion'
      ImageIndex = 86
      OnExecute = ACalculaRemuneracionExecute
    end
    object AExportaCSV: TAction
      Category = 'Procesos'
      Caption = 'Exporta a CSV'
      ImageIndex = 86
      OnExecute = AExportaCSVExecute
    end
    object ADespagarPagosTodos: TAction
      Category = 'Procesos'
      Caption = 'Despagar todos los Pagos al banco'
      ImageIndex = 67
      OnExecute = ADespagarPagosTodosExecute
    end
    object AExportarPrevired: TAction
      Category = 'Procesos'
      Caption = 'Exporta Fichero PREVIRED'
      Hint = 'Exporta TXT de n'#243'minas a PREVIRED'
      ImageIndex = 86
      OnExecute = AExportarPreviredExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'SplitterIndicadores.Left'
      'PDetalle.Width'
      'PIndicadores.Width')
  end
  object CEDetallePMEdit: TPopUpTeclas
    object CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Visible = False
    end
  end
end
