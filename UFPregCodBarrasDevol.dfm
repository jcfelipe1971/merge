inherited FPregCodBarrasDevol: TFPregCodBarrasDevol
  Left = 254
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado c'#243'digo de barras por devoluciones'
  ClientHeight = 325
  ClientWidth = 365
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBMain: TLFToolBar
    Width = 365
    inherited TButtImprimir: TToolButton
      Tag = 1
    end
    object ToolButton1: TToolButton
      Left = 288
      Top = 0
      Action = AConfRapida
    end
  end
  inherited PCMain: TLFPageControl
    Top = 325
    Width = 365
    Height = 0
  end
  object PNFechas: TLFPanel [2]
    Left = 0
    Top = 40
    Width = 365
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object GBFechas: TGroupBox
      Left = 0
      Top = 0
      Width = 365
      Height = 57
      Align = alTop
      Caption = ' Fechas '
      TabOrder = 0
      object Label7: TLFLabel
        Left = 31
        Top = 22
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label8: TLFLabel
        Left = 178
        Top = 22
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object DTPFechaD: TLFDateEdit
        Left = 71
        Top = 19
        Width = 87
        Height = 22
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFechaH: TLFDateEdit
        Left = 215
        Top = 19
        Width = 87
        Height = 22
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object PNSeries: TLFPanel [3]
    Left = 0
    Top = 100
    Width = 365
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object GBSeries: TGroupBox
      Left = 0
      Top = 0
      Width = 365
      Height = 57
      Align = alTop
      Caption = ' Series '
      TabOrder = 0
      object LBLSerieD: TLFLabel
        Left = 31
        Top = 22
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object LBLSerieH: TLFLabel
        Left = 178
        Top = 22
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object EFSerieD: TLFEditFind2000
        Left = 71
        Top = 19
        Width = 79
        Height = 21
        TabOrder = 0
        Base_de_datos = DMMain.DataBase
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'Activo = 1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GEN_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSerieH: TLFEditFind2000
        Left = 215
        Top = 19
        Width = 79
        Height = 21
        TabOrder = 1
        Base_de_datos = DMMain.DataBase
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'Activo = 1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GEN_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  object PNAlmacenes: TLFPanel [4]
    Left = 0
    Top = 160
    Width = 365
    Height = 84
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object GBAlmacenes: TGroupBox
      Left = 0
      Top = 0
      Width = 365
      Height = 81
      Align = alTop
      Caption = 'Almacenes'
      TabOrder = 0
      object Label5: TLFLabel
        Left = 31
        Top = 22
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label6: TLFLabel
        Left = 31
        Top = 53
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object EFAlmacen_D: TLFEditFind2000
        Left = 71
        Top = 19
        Width = 42
        Height = 21
        TabOrder = 0
        OnChange = EFAlmacen_DChange
        Base_de_datos = DMMain.DataBase
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ALMACEN'
        CampoStr = 'AL_TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ALMACENES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEAlmacenDesde: TLFDbedit
        Left = 117
        Top = 19
        Width = 180
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPregCodBarrasDevol.DSxAlmacen_Desde
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object EFAlmacen_H: TLFEditFind2000
        Left = 71
        Top = 48
        Width = 42
        Height = 21
        TabOrder = 2
        OnChange = EFAlmacen_HChange
        Base_de_datos = DMMain.DataBase
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ALMACEN'
        CampoStr = 'AL_TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ALMACENES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEAlmacenHasta: TLFDbedit
        Left = 117
        Top = 48
        Width = 180
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPregCodBarrasDevol.DSxAlmacen_Hasta
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object LFPanel1: TLFPanel [5]
    Left = 0
    Top = 244
    Width = 365
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Caption = ''
    TabOrder = 5
    object GBOpciones: TGroupBox
      Left = 0
      Top = 0
      Width = 365
      Height = 81
      Align = alTop
      Caption = ' Opciones '
      TabOrder = 0
      object LFLnBlanco: TLFLabel
        Left = 73
        Top = 21
        Width = 94
        Height = 13
        Caption = 'Espacios en Blanco'
      end
      object LFEnBlanco: TLFEdit
        Left = 170
        Top = 18
        Width = 47
        Height = 21
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 0
        Text = '0'
      end
      object LFDesglosar: TLFCheckBox
        Left = 76
        Top = 50
        Width = 81
        Height = 17
        Caption = 'Valorado'
        ClicksDisabled = False
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
        OnChange = LFDesglosarChange
      end
      object LFEFTarifa: TLFEditFind2000
        Left = 170
        Top = 46
        Width = 47
        Height = 21
        TabOrder = 2
        Text = 'NOR'
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TARIFA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_TARIFAS_C'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 292
    Top = 6
    inherited AImprimir: TAction
      OnExecute = APrevExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. Rapida'
      Hint = 'Conf. Rapida'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
