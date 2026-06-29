inherited CrmFMLstSegAccContactos: TCrmFMLstSegAccContactos
  Left = 503
  Top = 140
  Caption = 'Listado Seguimiento Acciones'
  ClientHeight = 289
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 223
    inherited TBMain: TLFToolBar
      Width = 504
    end
    inherited PBListado: TProgressBar
      Top = 207
      Width = 504
      TabOrder = 3
    end
    inherited PCMain: TLFPageControl
      Width = 504
      Height = 171
    end
    object PNLCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 504
      Height = 171
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LDesdeFecha: TLFLabel
        Left = 34
        Top = 71
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LHastaFecha: TLFLabel
        Left = 294
        Top = 71
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LContacto: TLFLabel
        Left = 21
        Top = 27
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Contacto'
      end
      object LDesdeAccion: TLFLabel
        Left = 32
        Top = 93
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Acci'#243'n'
      end
      object LHastaAccion: TLFLabel
        Left = 35
        Top = 115
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Acci'#243'n'
      end
      object HContacto: TLFLabel
        Left = 24
        Top = 49
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Contacto'
      end
      object LDesdeTipoAccion: TLFLabel
        Left = 8
        Top = 137
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Tipo Acci'#243'n'
      end
      object LHastaTipoAccion: TLFLabel
        Left = 11
        Top = 159
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Tipo Acci'#243'n'
      end
      object LFDesdeContacto: TLFEditFind2000
        Left = 103
        Top = 23
        Width = 67
        Height = 21
        TabOrder = 0
        OnChange = LFDesdeContactoChange
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
      object LFechaIni: TLFDateEdit
        Left = 103
        Top = 67
        Width = 108
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object LFechaFin: TLFDateEdit
        Left = 360
        Top = 67
        Width = 108
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object LFDesdeAccion: TLFEditFind2000
        Left = 103
        Top = 89
        Width = 67
        Height = 21
        TabOrder = 4
        OnChange = LFDesdeAccionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID'
        CampoStr = 'DESCRIPCION_ACCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CRM_ACCIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ID')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object LFHastaAccion: TLFEditFind2000
        Left = 103
        Top = 111
        Width = 67
        Height = 21
        TabOrder = 5
        OnChange = LFHastaAccionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID'
        CampoStr = 'DESCRIPCION_ACCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CRM_ACCIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ID')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object LFHastaContacto: TLFEditFind2000
        Left = 103
        Top = 45
        Width = 67
        Height = 21
        TabOrder = 1
        OnChange = LFHastaContactoChange
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
      object ETituloHastaContacto: TLFEdit
        Left = 171
        Top = 45
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
        TabOrder = 8
      end
      object ETituloDesdeContacto: TLFEdit
        Left = 171
        Top = 23
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
      object ETituloDesdeAccion: TLFEdit
        Left = 171
        Top = 89
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
      object ETituloHastaAccion: TLFEdit
        Left = 171
        Top = 111
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
      end
      object LFDesdeTipoAccion: TLFEditFind2000
        Left = 103
        Top = 133
        Width = 67
        Height = 21
        TabOrder = 6
        OnChange = LFDesdeTipoAccionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ACCION'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CRM_SYS_ACCIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ACCION')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloDesdeTipoAccion: TLFEdit
        Left = 171
        Top = 133
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
        TabOrder = 12
      end
      object ETituloHastaTipoAccion: TLFEdit
        Left = 171
        Top = 155
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
      end
      object LFHastaTipoAccion: TLFEditFind2000
        Left = 103
        Top = 155
        Width = 67
        Height = 21
        TabOrder = 7
        OnChange = LFHastaTipoAccionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ACCION'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CRM_SYS_ACCIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ACCION')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 223
    Width = 504
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
    end
    inherited CBOrden: TLFComboBox
      Left = 316
      Width = 29
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 89
    end
  end
  inherited ALMain: TLFActionList
    Left = 432
    Top = 6
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 396
    Top = 8
  end
end
