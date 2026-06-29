object FMDiarioCostes: TFMDiarioCostes
  Left = 260
  Top = 146
  Width = 848
  Height = 615
  Caption = 'Diario de Costes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 840
    Height = 26
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtFiltra: TToolButton
      Left = 0
      Top = 0
      Action = AFiltrar
      ParentShowHint = False
      ShowHint = True
    end
    object TBNuevo: TToolButton
      Left = 23
      Top = 0
      Action = ANuevaBusqueda
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBAsientosSinCCoste: TToolButton
      Left = 54
      Top = 0
      Action = AAsientosSinCCoste
    end
    object ToolButton3: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPSalir: THYMEditPanel
      Left = 85
      Top = 0
      Width = 27
      Height = 22
      Hint = 'Salir'
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
  end
  object TBActions: TLFToolBar
    Left = 0
    Top = 559
    Width = 840
    Height = 29
    Align = alBottom
    EdgeInner = esNone
    EdgeOuter = esNone
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    ActionList = ALMain
    Separators = True
  end
  object PCMain: TLFPageControl
    Left = 0
    Top = 26
    Width = 840
    Height = 533
    ActivePage = TSDiario
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSDiario: TTabSheet
      Caption = 'Diario'
      object PEFiltro: TLFPanel
        Left = 0
        Top = 0
        Width = 832
        Height = 143
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LCuenta: TLFLabel
          Left = 24
          Top = 7
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cuenta'
        end
        object LDigito1: TLFLabel
          Left = 22
          Top = 29
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Digito 1'
        end
        object LDigito2: TLFLabel
          Left = 22
          Top = 51
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Digito 2'
        end
        object LDigit3: TLFLabel
          Left = 22
          Top = 73
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Digito 3'
        end
        object LDigit4: TLFLabel
          Left = 22
          Top = 95
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Digito 4'
        end
        object LDigito5: TLFLabel
          Left = 22
          Top = 117
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Digito 5'
        end
        object LDesdeFecha: TLFLabel
          Left = 437
          Top = 7
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LHastaFecha: TLFLabel
          Left = 440
          Top = 28
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object EFCuenta: TLFEditFind2000
          Left = 62
          Top = 3
          Width = 83
          Height = 21
          TabOrder = 0
          OnChange = EFCuentaChange
          OnExit = EFCuentaExit
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO=5'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'CON_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CUENTA')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
        end
        object DescCuenta: TLFEdit
          Left = 146
          Top = 3
          Width = 271
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object EFDigito1: TLFEditFind2000
          Left = 62
          Top = 25
          Width = 42
          Height = 21
          TabOrder = 1
          OnChange = EFDigito1Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'LET_DIGITO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'NUM_DIGITO=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'LET_DIGITO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DescDigito1: TLFEdit
          Left = 105
          Top = 25
          Width = 312
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object EFDigito2: TLFEditFind2000
          Left = 62
          Top = 47
          Width = 42
          Height = 21
          TabOrder = 2
          OnChange = EFDigito2Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'LET_DIGITO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'NUM_DIGITO=2'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'LET_DIGITO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DescDigito2: TLFEdit
          Left = 105
          Top = 47
          Width = 312
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object EFDigito3: TLFEditFind2000
          Left = 62
          Top = 69
          Width = 42
          Height = 21
          TabOrder = 3
          OnChange = EFDigito3Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'LET_DIGITO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'NUM_DIGITO=3'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'LET_DIGITO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DescDigito3: TLFEdit
          Left = 105
          Top = 69
          Width = 312
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object EFDigito5: TLFEditFind2000
          Left = 62
          Top = 113
          Width = 42
          Height = 21
          TabOrder = 5
          OnChange = EFDigito5Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'LET_DIGITO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'NUM_DIGITO=5'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'LET_DIGITO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DescDigito5: TLFEdit
          Left = 105
          Top = 113
          Width = 312
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object DescDigito4: TLFEdit
          Left = 105
          Top = 91
          Width = 312
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object EFDigito4: TLFEditFind2000
          Left = 62
          Top = 91
          Width = 42
          Height = 21
          TabOrder = 4
          OnChange = EFDigito4Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'LET_DIGITO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'NUM_DIGITO=4'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'LET_DIGITO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DEDesdeFecha: TLFDateEdit
          Left = 505
          Top = 3
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 6
        end
        object DEHastaFecha: TLFDateEdit
          Left = 505
          Top = 25
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 7
        end
      end
      object PEMain: TLFPanel
        Left = 0
        Top = 143
        Width = 832
        Height = 362
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 832
          Height = 305
          Align = alClient
          Color = clInfoBk
          DataSource = DMDiarioCostes.DSQMDiarioCostes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGFDetalleDrawColumnCell
          OnDblClick = DBGFDetalleDblClick
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CUENTA'
            'DIGITO_1'
            'DIGITO_2'
            'DIGITO_3'
            'DIGITO_4'
            'DIGITO_5'
            'FECHA'
            'IMPORTE'
            'LINEA'
            'PCOSTE'
            'RIC'
            'SIGNO'
            'SUBLINEA'
            'TEXTO'
            'TITULO_CUENTA'
            'ASIENTO')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ASIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBLINEA'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGNO'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_1'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_2'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_3'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_4'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_5'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PCOSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEXTO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CUENTA'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PGC'
              Width = 29
              Visible = True
            end>
        end
        object PanelTotales: TLFPanel
          Left = 0
          Top = 305
          Width = 832
          Height = 57
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LTotalImporte: TLFLabel
            Left = 25
            Top = 19
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Importe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBTTotalImporte: TDBText
            Left = 104
            Top = 18
            Width = 104
            Height = 17
            Alignment = taRightJustify
            Color = 8404992
            DataField = 'TIMPORTE'
            DataSource = DMDiarioCostes.DSQMDiarioCostesT
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
      end
    end
    object TSResumen: TTabSheet
      Caption = 'Resumen'
      ImageIndex = 1
      object PNLFiltroResumen: TLFPanel
        Left = 0
        Top = 0
        Width = 832
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LHastaFechaResumen: TLFLabel
          Left = 32
          Top = 36
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LDesdeFechaResumen: TLFLabel
          Left = 29
          Top = 15
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LNivel: TLFLabel
          Left = 69
          Top = 58
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nivel'
        end
        object DEDesdeFechaResumen: TLFDateEdit
          Left = 97
          Top = 11
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DEHastaFechaResumen: TLFDateEdit
          Left = 97
          Top = 33
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
        object BCalcular: TButton
          Left = 224
          Top = 33
          Width = 75
          Height = 25
          Caption = 'Calcular'
          TabOrder = 2
          OnClick = BCalcularClick
        end
        object CBFiltraNivel: TLFComboBox
          Left = 97
          Top = 55
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 3
        end
      end
      object DBGridFind20001: TDBGridFind2000
        Left = 0
        Top = 89
        Width = 832
        Height = 416
        Align = alClient
        Color = clInfoBk
        DataSource = DMDiarioCostes.DSQMResumen
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFDetalleDrawColumnCell
        OnDblClick = DBGFDetalleDblClick
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
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'CUENTA'
          'DIGITO_1'
          'DIGITO_2'
          'DIGITO_3'
          'DIGITO_4'
          'DIGITO_5'
          'FECHA'
          'IMPORTE'
          'LINEA'
          'PCOSTE'
          'RIC'
          'SIGNO'
          'SUBLINEA'
          'TEXTO'
          'TITULO_CUENTA'
          'ASIENTO')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NIVEL'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUENTA'
            Width = 108
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
            FieldName = 'D1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D2'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D3'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I3'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D4'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I4'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D5'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I5'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D6'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I6'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D7'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I7'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D8'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I8'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D9'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I9'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D10'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I10'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D11'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I11'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D12'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I12'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D13'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I13'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D14'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I14'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D15'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I15'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D16'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I16'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D17'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I17'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D18'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I18'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D19'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I19'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D20'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I20'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D21'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I21'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D22'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I22'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D23'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I23'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D24'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I24'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D25'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I25'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D26'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I26'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D27'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I27'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D28'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I28'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D29'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I29'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D30'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I30'
            Visible = True
          end>
      end
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 760
    Top = 8
  end
  object ALDiarioCostes: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 696
    Top = 8
    object AFiltrar: TAction
      Caption = 'Filtrar'
      Hint = 'Filtra seg'#250'n los valores seleccionados'
      ImageIndex = 23
      OnExecute = AFiltrarExecute
    end
    object ANuevaBusqueda: TAction
      Caption = 'Nueva B'#250'squeda'
      Hint = 'Nueva B'#250'squeda'
      ImageIndex = 83
      OnExecute = ANuevaBusquedaExecute
    end
    object AAsientosSinCCoste: TAction
      Caption = 'Asientos Sin C. Coste'
      Hint = 'Muestra los asientos sin Centro de Coste Asignado'
      ImageIndex = 35
      OnExecute = AAsientosSinCCosteExecute
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 728
    Top = 8
  end
end
