inherited FMCentroCoste: TFMCentroCoste
  Left = 397
  Top = 378
  Height = 279
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Centros de Coste'
  ClientHeight = 250
  PopupMenu = CEAgentesPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 226
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMCentroCoste.DSQMCentroCoste
        Hints.Strings = ()
        EditaControl = DBENumDigito
        InsertaControl = DBENumDigito
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
      Height = 196
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 168
          inherited G2KTableLoc: TG2KTBLoc
            Top = 56
            DataSource = DMCentroCoste.DSQMCentroCoste
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CON_CENTROS_COSTE'
            CampoNum = 'NUM_DIGITO'
            CampoStr = 'LET_DIGITO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LNumero: TLFLabel
            Left = 19
            Top = 41
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero'
            FocusControl = DBENumDigito
          end
          object LTitulo: TLFLabel
            Left = 28
            Top = 85
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LLetra: TLFLabel
            Left = 32
            Top = 63
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Letra'
            FocusControl = DBELetDigito
          end
          object DBENumDigito: TLFDbedit
            Left = 60
            Top = 38
            Width = 64
            Height = 21
            DataField = 'NUM_DIGITO'
            DataSource = DMCentroCoste.DSQMCentroCoste
            MaxLength = 1
            TabOrder = 0
            OnChange = DBENumDigitoChange
          end
          object DBETitulo: TLFDbedit
            Left = 60
            Top = 82
            Width = 310
            Height = 21
            DataField = 'TITULO'
            DataSource = DMCentroCoste.DSQMCentroCoste
            TabOrder = 2
          end
          object DBELetDigito: TLFDbedit
            Left = 60
            Top = 60
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'LET_DIGITO'
            DataSource = DMCentroCoste.DSQMCentroCoste
            TabOrder = 1
          end
        end
      end
      object TSAgenciaTramitadora: TTabSheet [1]
        Caption = 'Ag. Tramitadora'
        object PNLAgenciaTramitadora: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 168
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGFAgenciaTramitadora: TDBGridFind2000
            Left = 0
            Top = 23
            Width = 490
            Height = 145
            Align = alClient
            DataSource = DMCentroCoste.DSQMAgenciaTramitadora
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
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = DMCentroCoste.TLocal
            BuscarNums = False
            Campos.Strings = (
              'DIGITO_1'
              'DIGITO_2'
              'DIGITO_3'
              'DIGITO_4'
              'DIGITO_5')
            CamposAMostrar.Strings = (
              'DIGITO_1'
              '0'
              'DIGITO_2'
              '0'
              'DIGITO_3'
              '0'
              'DIGITO_4'
              '0'
              'DIGITO_5'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'AGENCIA_TRAMITADORA'
              'DIGITO_1'
              'DIGITO_2'
              'DIGITO_3'
              'DIGITO_4'
              'DIGITO_5')
            MensajeNoExiste = False
            Numericos.Strings = (
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO')
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tablas.Strings = (
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE')
            Acciones.Strings = (
              ''
              ''
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFAgenciaTramitadoraBusqueda
            Planes.Strings = (
              ''
              ''
              ''
              ''
              '')
            OrdenMultiple = True
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'AGENCIA_TRAMITADORA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_1'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_2'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_3'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_4'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_5'
                Width = 25
                Visible = True
              end>
          end
          object DBNAgenciaTramitadora: TDBNavigator
            Left = 0
            Top = 0
            Width = 490
            Height = 23
            DataSource = DMCentroCoste.DSQMAgenciaTramitadora
            Align = alTop
            TabOrder = 1
          end
        end
      end
      object TSSeries: TTabSheet [2]
        Caption = '&Series'
        ImageIndex = 2
        object PNLSerie: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 168
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBFGSerie: TDBGridFind2000
            Left = 0
            Top = 23
            Width = 490
            Height = 145
            Align = alClient
            DataSource = DMCentroCoste.DSQMCentroCosteSerie
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
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = DMCentroCoste.TLocal
            BuscarNums = False
            Campos.Strings = (
              'SERIE'
              'DIGITO_1'
              'DIGITO_2'
              'DIGITO_3'
              'DIGITO_4'
              'DIGITO_5')
            CamposAMostrar.Strings = (
              'SERIE'
              '0'
              'DIGITO_1'
              '0'
              'DIGITO_2'
              '0'
              'DIGITO_3'
              '0'
              'DIGITO_4'
              '0'
              'DIGITO_5'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'SERIE'
              'DIGITO_1'
              'DIGITO_2'
              'DIGITO_3'
              'DIGITO_4'
              'DIGITO_5')
            MensajeNoExiste = False
            Numericos.Strings = (
              'SERIE'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_SERIES'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE')
            Acciones.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBFGSerieBusqueda
            Planes.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            OrdenMultiple = True
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'SERIE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_1'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_2'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_3'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_4'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_5'
                Width = 25
                Visible = True
              end>
          end
          object DBNSerie: TDBNavigator
            Left = 0
            Top = 0
            Width = 490
            Height = 23
            DataSource = DMCentroCoste.DSQMCentroCosteSerie
            Align = alTop
            TabOrder = 1
          end
        end
      end
      object TSDivision: TTabSheet [3]
        Caption = '&Division'
        ImageIndex = 2
      end
      object TSAgentes: TTabSheet [4]
        Caption = '&Agentes'
        object PNLAgente: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 168
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGFAgentes: TDBGridFind2000
            Left = 0
            Top = 23
            Width = 490
            Height = 145
            Align = alClient
            DataSource = DMCentroCoste.DSQMCentroCosteAgente
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
            Transaction = DMCentroCoste.TLocal
            BuscarNums = False
            Campos.Strings = (
              'AGENTE'
              'DIGITO_1'
              'DIGITO_2'
              'DIGITO_3'
              'DIGITO_4'
              'DIGITO_5')
            CamposAMostrar.Strings = (
              'AGENTE'
              '0'
              'DIGITO_1'
              '0'
              'DIGITO_2'
              '0'
              'DIGITO_3'
              '0'
              'DIGITO_4'
              '0'
              'DIGITO_5'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            Numericos.Strings = (
              'AGENTE'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO'
              'LET_DIGITO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_AGENTES_CUENTAS'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE'
              'CON_CENTROS_COSTE')
            Acciones.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFAgentesBusqueda
            Planes.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            OrdenMultiple = True
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'AGENTE'
                Width = 58
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 258
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_1'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_2'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_3'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_4'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITO_5'
                Width = 25
                Visible = True
              end>
          end
          object NavAgentes: TDBNavigator
            Left = 0
            Top = 0
            Width = 490
            Height = 23
            DataSource = DMCentroCoste.DSQMCentroCosteAgente
            Align = alTop
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 168
          DataSource = DMCentroCoste.DSQMCentroCoste
          Columns = <
            item
              Expanded = False
              FieldName = 'NUM_DIGITO'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LET_DIGITO'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 225
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 226
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CESeries
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  object CESeries: TControlEdit
    DataSource = DMCentroCoste.DSQMCentroCosteSerie
    EnlazadoA = CEAgente
    FichaEdicion = TSSeries
    PanelEdicion = PNLSerie
    SubComplementario = ALMain
    PopUpMenu = CESeriesPMEdit
    Teclas = DMMain.Teclas
    Left = 280
    Top = 68
  end
  object CESeriesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 316
    Top = 68
    object MenuItem1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem11: TMenuItem
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem13: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem14: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem15: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem16: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object MenuItem17: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object MenuItem18: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object MenuItem19: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem20: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object MenuItem21: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
    object MenuItem22: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object MenuItem23: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object MenuItem24: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object MenuItem25: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object MenuItem26: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object MenuItem27: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object MenuItem28: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object MenuItem29: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object MenuItem30: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object MenuItem31: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
    object CESeriesMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CESeriesMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CESeriesMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CESeriesMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CESeriesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CESeriesMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CESeriesMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CESeriesMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CESeriesMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CESeriesMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CEAgente: TControlEdit
    DataSource = DMCentroCoste.DSQMCentroCosteAgente
    EnlazadoA = CEMain
    FichaEdicion = TSAgentes
    PanelEdicion = PNLAgente
    SubComplementario = ALMain
    PopUpMenu = CEAgentesPMEdit
    Teclas = DMMain.Teclas
    Left = 280
    Top = 100
  end
  object CEAgentesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 316
    Top = 100
    object MenuItem32: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem33: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem34: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem35: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem36: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem37: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem38: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem39: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem40: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem41: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem42: TMenuItem
      Caption = '-'
    end
    object MenuItem43: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem44: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem45: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem46: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem47: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object MenuItem48: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object MenuItem49: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object MenuItem50: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem51: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object MenuItem52: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
    object MenuItem53: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object MenuItem54: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object MenuItem55: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object MenuItem56: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object MenuItem57: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object MenuItem58: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object MenuItem59: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object MenuItem60: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object MenuItem61: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object MenuItem62: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
    object CEAgenteMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CEAgenteMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CEAgenteMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CEAgenteMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CEAgenteMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CEAgenteMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CEAgenteMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CEAgenteMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CEAgenteMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CEAgenteMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
end
