inherited ProFMLstEscandallo: TProFMLstEscandallo
  Left = 390
  Top = 263
  Caption = 'Listado Escandallos'
  ClientHeight = 300
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 522
    Height = 234
    inherited TBMain: TLFToolBar
      Width = 522
    end
    inherited PBListado: TProgressBar
      Top = 218
      Width = 522
      TabOrder = 4
    end
    inherited PCMain: TLFPageControl
      Top = 77
      Width = 522
      Height = 141
    end
    object PanelCentral: TLFPanel
      Left = 0
      Top = 77
      Width = 522
      Height = 141
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LEscandallo: TLFLabel
        Left = 20
        Top = 43
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Escandallo'
      end
      object LCompuesto: TLFLabel
        Left = 19
        Top = 19
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Compuesto'
      end
      object LDesdeFase: TLFLabel
        Left = 15
        Top = 105
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fase'
      end
      object LHastaFase: TLFLabel
        Left = 18
        Top = 128
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fase'
      end
      object LUnidades: TLFLabel
        Left = 27
        Top = 64
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades'
      end
      object EFEsc: TLFEditFind2000
        Left = 76
        Top = 38
        Width = 79
        Height = 21
        TabOrder = 1
        OnChange = EFEscChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ESCANDALLO'
        CampoStr = 'COMPUESTO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_ESCANDALLO'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFEscBusqueda
        OrdenadoPor.Strings = (
          'ESCANDALLO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEEscD: TLFDbedit
        Left = 156
        Top = 38
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMLSTEscandallo.DSEscandallo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object EFCompuesto: TLFEditFind2000
        Left = 76
        Top = 16
        Width = 79
        Height = 21
        TabOrder = 0
        OnChange = EFCompuestoChange
        OnExit = EFCompuestoExit
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'ARTICULO'
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFaseD: TLFEditFind2000
        Left = 76
        Top = 102
        Width = 79
        Height = 21
        TabOrder = 4
        OnChange = EFFaseDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'LINEA_FASE'
        CampoStr = 'FASE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_FASES_ESC'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFaseDBusqueda
        OrdenadoPor.Strings = (
          'LINEA_FASE')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFaseH: TLFEditFind2000
        Left = 76
        Top = 124
        Width = 79
        Height = 21
        TabOrder = 5
        OnChange = EFFaseHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'LINEA_FASE'
        CampoStr = 'FASE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_FASES_ESC'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFaseHBusqueda
        OrdenadoPor.Strings = (
          'LINEA_FASE')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ECompuesto: TLFEdit
        Left = 156
        Top = 16
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEFaseD: TLFDbedit
        Left = 156
        Top = 102
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'FASE'
        DataSource = ProDMLSTEscandallo.DSFaseD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object DBEFaseH: TLFDbedit
        Left = 156
        Top = 124
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'FASE'
        DataSource = ProDMLSTEscandallo.DSFaseH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object EUnidades: TLFEdit
        Left = 76
        Top = 60
        Width = 79
        Height = 21
        TabOrder = 3
      end
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 522
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object PNLTipoEscandallo: TLFPanel
        Left = 257
        Top = 0
        Width = 265
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object LTipoEscandallo: TLFLabel
          Left = 11
          Top = 14
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Escandallo'
        end
        object RBOfertasE: TRadioButton
          Left = 189
          Top = 13
          Width = 59
          Height = 17
          Caption = 'Ofertas'
          TabOrder = 0
          OnClick = RBOfertasEClick
        end
        object RBEscandallo: TRadioButton
          Left = 103
          Top = 13
          Width = 75
          Height = 17
          Caption = 'Escandallo'
          TabOrder = 1
          OnClick = RBEscandalloClick
        end
      end
      object PNLListarCabecera: TLFPanel
        Left = 0
        Top = 0
        Width = 257
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object LListarCabbecera: TLFLabel
          Left = 20
          Top = 14
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Listar Cabecera'
        end
        object RBCabNo: TRadioButton
          Left = 183
          Top = 13
          Width = 42
          Height = 17
          Caption = 'No'
          TabOrder = 0
          OnClick = RBCabNoClick
        end
        object RBCabSi: TRadioButton
          Left = 127
          Top = 13
          Width = 48
          Height = 17
          Caption = 'S'#237
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RBCabSiClick
        end
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 234
    Width = 522
    inherited LComentario: TLFLabel
      Left = 33
    end
    inherited LOrden: TLFLabel
      Left = 284
      Width = 133
      Caption = 'Ordenado por (NO VISIBLE)'
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 6
    end
    inherited EComentario: TLFEdit
      Left = 90
    end
    inherited CBOrden: TLFComboBox
      Left = 421
      Width = 72
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 90
    end
  end
  inherited ALMain: TLFActionList
    Left = 480
    Top = 90
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
