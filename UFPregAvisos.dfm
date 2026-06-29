inherited FPregAvisos: TFPregAvisos
  Left = 352
  Top = 168
  Caption = 'Listar Avisos'
  ClientHeight = 325
  ClientWidth = 444
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 444
    Height = 325
    inherited TBMain: TLFToolBar
      Width = 444
      TabOrder = 3
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
      end
    end
    object GBAvisosFecha: TGroupBox
      Left = 0
      Top = 36
      Width = 444
      Height = 56
      Align = alTop
      Caption = ' Fechas '
      TabOrder = 0
      object LFechaHastaAviso: TLFLabel
        Left = 243
        Top = 24
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LFechaDesdeAviso: TLFLabel
        Left = 37
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object DEFechaDesdeAviso: TLFDateEdit
        Left = 72
        Top = 21
        Width = 113
        Height = 21
        CheckOnExit = True
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DEFechaHastaAviso: TLFDateEdit
        Left = 276
        Top = 21
        Width = 112
        Height = 21
        CheckOnExit = True
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GBAvisosUsuarios: TGroupBox
      Left = 0
      Top = 92
      Width = 444
      Height = 173
      Align = alClient
      Caption = 'Usuarios '
      TabOrder = 1
      object LRecibidoUsuarioHasta: TLFLabel
        Left = 35
        Top = 68
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LRecibidoUsuarioDesde: TLFLabel
        Left = 32
        Top = 46
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LEnviadoUsuarioDesde: TLFLabel
        Left = 32
        Top = 114
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LEnviadoUsuarioHasta: TLFLabel
        Left = 35
        Top = 136
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LRecibidos: TLFLabel
        Left = 8
        Top = 24
        Width = 47
        Height = 13
        Caption = 'Recibidos'
      end
      object LEnviados: TLFLabel
        Left = 10
        Top = 91
        Width = 44
        Height = 13
        Caption = 'Enviados'
      end
      object EFEnviadosAvisosUsuarioDesde: TLFEditFind2000
        Left = 67
        Top = 110
        Width = 70
        Height = 21
        TabOrder = 0
        OnChange = EFEnviadosAvisosUsuarioDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'USUARIO'
        CampoStr = 'NOMBRE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_USUARIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'USUARIO')
        Filtros = []
      end
      object EFEnviadosAvisosUsuarioHasta: TLFEditFind2000
        Left = 67
        Top = 132
        Width = 70
        Height = 21
        TabOrder = 1
        OnChange = EFEnviadosAvisosUsuarioHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'USUARIO'
        CampoStr = 'NOMBRE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_USUARIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'USUARIO')
        Filtros = []
      end
      object EFRecibidosAvisosUsuarioDesde: TLFEditFind2000
        Left = 67
        Top = 42
        Width = 70
        Height = 21
        TabOrder = 2
        OnChange = EFRecibidosAvisosUsuarioDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'USUARIO'
        CampoStr = 'NOMBRE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_USUARIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'USUARIO')
        Filtros = []
      end
      object EFRecibidosAvisosUsuarioHasta: TLFEditFind2000
        Left = 67
        Top = 64
        Width = 70
        Height = 21
        TabOrder = 3
        OnChange = EFRecibidosAvisosUsuarioHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'USUARIO'
        CampoStr = 'NOMBRE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_USUARIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'USUARIO')
        Filtros = []
      end
      object ERecibidosAvisosUsuarioDesde: TLFEdit
        Left = 138
        Top = 42
        Width = 283
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
      end
      object ERecibidosAvisosUsuarioHasta: TLFEdit
        Left = 138
        Top = 64
        Width = 283
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 5
      end
      object EEnviadosAvisosUsuarioDesde: TLFEdit
        Left = 138
        Top = 110
        Width = 283
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 6
      end
      object EEnviadosAvisosUsuarioHasta: TLFEdit
        Left = 138
        Top = 132
        Width = 283
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 7
      end
    end
    object GBAvisosActivo: TGroupBox
      Left = 0
      Top = 265
      Width = 444
      Height = 60
      Align = alBottom
      Caption = 'Avisos Activos'
      TabOrder = 2
      object CBAvisosActivos: TLFCheckBox
        Left = 24
        Top = 24
        Width = 161
        Height = 17
        Caption = 'Avisos Activos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 304
    Top = 6
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfRapida: TAction
      Caption = 'Confi. Rapida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
