inherited CrmFMLstAccContactos: TCrmFMLstAccContactos
  Left = 310
  Top = 221
  Caption = 'Listado Acciones Contacto'
  ClientHeight = 380
  ClientWidth = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 583
    Height = 314
    inherited TBMain: TLFToolBar
      Width = 583
    end
    inherited PBListado: TProgressBar
      Top = 298
      Width = 583
      TabOrder = 3
    end
    inherited PCMain: TLFPageControl
      Width = 583
      Height = 262
    end
    object LFPanelCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 583
      Height = 262
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LDesdeContacto: TLFLabel
        Left = 8
        Top = 39
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Contacto'
      end
      object LHastaContacto: TLFLabel
        Left = 11
        Top = 62
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Contacto'
      end
      object LZona: TLFLabel
        Left = 60
        Top = 110
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Zona'
        Visible = False
      end
      object LAmbito: TLFLabel
        Left = 53
        Top = 157
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ambito'
        Visible = False
      end
      object LPais: TLFLabel
        Left = 65
        Top = 205
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pais'
        Visible = False
      end
      object EFDesdeContacto: TLFEditFind2000
        Left = 89
        Top = 36
        Width = 67
        Height = 21
        TabOrder = 0
        OnChange = EFDesdeContactoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_CONTACTO'
        CampoStr = 'NOMBRE_COMERCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CRM_CONTACTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ID_CONTACTO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloDesdeContacto: TLFEdit
        Left = 157
        Top = 36
        Width = 297
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
        TabOrder = 9
      end
      object ETituloHastaContacto: TLFEdit
        Left = 157
        Top = 58
        Width = 297
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
        TabOrder = 10
      end
      object EFHastaContacto: TLFEditFind2000
        Left = 89
        Top = 58
        Width = 67
        Height = 21
        TabOrder = 1
        OnChange = EFHastaContactoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_CONTACTO'
        CampoStr = 'NOMBRE_COMERCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CRM_CONTACTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ID_CONTACTO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloZona: TLFEdit
        Left = 157
        Top = 106
        Width = 297
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
        TabOrder = 11
        Visible = False
      end
      object EFZona: TLFEditFind2000
        Left = 89
        Top = 106
        Width = 67
        Height = 21
        TabOrder = 3
        Visible = False
        OnChange = EFZonaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ZONA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_ZONAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, ZONA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object CBZona: TLFCheckBox
        Left = 89
        Top = 88
        Width = 128
        Height = 17
        Caption = 'Filtrar por Zona'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        OnClick = CBZonaChange
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
      end
      object EFAmbito: TLFEditFind2000
        Left = 89
        Top = 153
        Width = 67
        Height = 21
        TabOrder = 6
        Visible = False
        OnChange = EFAmbitoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AMBITO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CRM_SYS_AMBITOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AMBITO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEAmbito: TLFDbedit
        Left = 157
        Top = 153
        Width = 297
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = CrmDMLstAccContactos.DSxAmbito
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Visible = False
      end
      object CBAmbito: TLFCheckBox
        Left = 89
        Top = 136
        Width = 128
        Height = 17
        Caption = 'Filtrar por Ambito'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        OnClick = CBAmbitoChange
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
      end
      object CBOrdenPoblacion: TLFCheckBox
        Left = 221
        Top = 88
        Width = 180
        Height = 17
        Caption = 'Ordenar por Poblacion'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
      end
      object CBPais: TLFCheckBox
        Left = 89
        Top = 184
        Width = 128
        Height = 17
        Caption = 'Filtrar por Pais'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 7
        TabStop = True
        OnClick = CBPaisClick
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
      end
      object EFPais: TLFEditFind2000
        Left = 89
        Top = 201
        Width = 67
        Height = 21
        MaxLength = 3
        TabOrder = 8
        Visible = False
        OnChange = EFPaisChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PAIS'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PAISES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PAIS')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloPais: TLFEdit
        Left = 157
        Top = 201
        Width = 297
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
        TabOrder = 13
        Visible = False
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 314
    Width = 583
    inherited LComentario: TLFLabel
      Left = 32
    end
    inherited LOrden: TLFLabel
      Left = 245
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 5
    end
    inherited EComentario: TLFEdit
      Left = 89
      TabOrder = 2
    end
    inherited CBOrden: TLFComboBox
      Left = 316
      Width = 29
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 89
      TabOrder = 0
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 54
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
