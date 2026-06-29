inherited ZFMEstCompara: TZFMEstCompara
  Left = 524
  Top = 181
  Caption = 'Comparaci'#243'n de Estad'#237'sticas del mismo grupo'
  ClientHeight = 549
  ClientWidth = 758
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 549
    inherited TBMain: TLFToolBar
      Width = 758
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PCMain: TLFPageControl
      Top = 141
      Width = 758
      Height = 408
      ActivePage = TSComparacion
      TabIndex = 0
      object TSComparacion: TTabSheet
        Caption = '&Comparaci'#243'n'
      end
    end
    object PnlVariables: TLFPanel
      Left = 0
      Top = 36
      Width = 758
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LGrupo: TLFLabel
        Left = 107
        Top = 11
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo'
      end
      object LEstadistica1: TLFLabel
        Left = 74
        Top = 34
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estad'#237'stica 1'
      end
      object LEstadistica2: TLFLabel
        Left = 74
        Top = 56
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estad'#237'stica 2'
      end
      object LPeriodo: TLFLabel
        Left = 100
        Top = 77
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object EFGrupo: TLFEditFind2000
        Left = 140
        Top = 8
        Width = 49
        Height = 21
        TabOrder = 0
        OnChange = EFGrupoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'GRUPO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EST_GRUPOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'GRUPO')
        Filtros = []
      end
      object DBETitGrupo: TLFDbedit
        Left = 190
        Top = 8
        Width = 300
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMEstCompara.DSxDescGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object EFPeriodo: TLFEditFind2000
        Left = 140
        Top = 74
        Width = 49
        Height = 21
        TabOrder = 3
        OnChange = EFPeriodoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PERIODO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'tipo<>5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PERIODOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PERIODO')
        Filtros = []
      end
      object DBETitPeriodo: TLFDbedit
        Left = 190
        Top = 74
        Width = 300
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMEstCompara.DSxDescPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object EFEstadistica2: TLFEditFind2000
        Left = 140
        Top = 52
        Width = 49
        Height = 21
        TabOrder = 2
        OnChange = EFEstadistica2Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ESTADISTICA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EST_ESTADISTICAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFEstadistica2Busqueda
        OrdenadoPor.Strings = (
          'ESTADISTICA')
        Filtros = []
      end
      object EFEstadistica1: TLFEditFind2000
        Left = 140
        Top = 30
        Width = 49
        Height = 21
        TabOrder = 1
        OnChange = EFEstadistica1Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ESTADISTICA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EST_ESTADISTICAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFEstadistica1Busqueda
        OrdenadoPor.Strings = (
          'ESTADISTICA')
        Filtros = []
      end
      object DBETitEst2: TLFDbedit
        Left = 190
        Top = 52
        Width = 300
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMEstCompara.DSxDescEst2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBETitEst1: TLFDbedit
        Left = 190
        Top = 30
        Width = 300
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMEstCompara.DSxDescEst1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
    end
    object PnlDatos: TLFPanel
      Left = 0
      Top = 141
      Width = 758
      Height = 408
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object DBGFEstCompara: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 758
        Height = 408
        Align = alClient
        DataSource = ZDMEstCompara.DSQMEstadistica
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
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CLAVE_1'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CLAVE_1'
            Width = 132
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLAVE_2'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CLAVE_2'
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLAVE_3'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CLAVE_3'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALPERIODO1'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALPERIODO2'
            Width = 76
            Visible = True
          end>
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 20
    Top = 46
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
