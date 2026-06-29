inherited FPregProyectos: TFPregProyectos
  Left = 469
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Proyectos'
  ClientHeight = 291
  ClientWidth = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 425
    Height = 291
    inherited TBMain: TLFToolBar
      Width = 425
      ParentShowHint = False
      ShowHint = True
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 425
      Height = 255
      ActivePage = TSUnProyecto
      TabIndex = 0
      object TSUnProyecto: TTabSheet
        Caption = 'Un Proyecto'
        OnShow = TSUnProyectoShow
        object PNLUnProyecto: TLFPanel
          Left = 0
          Top = 0
          Width = 417
          Height = 226
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LProyecto: TLFLabel
            Left = 27
            Top = 89
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object EFProyecto: TLFEditFind2000
            Left = 72
            Top = 85
            Width = 49
            Height = 21
            TabOrder = 0
            OnChange = EFProyectoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloProyecto: TLFEdit
            Left = 122
            Top = 85
            Width = 270
            Height = 21
            Color = clInfoBk
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
        end
      end
      object TSProyectos: TTabSheet
        Caption = 'Proyectos'
        ImageIndex = 1
        OnShow = TSProyectosShow
        object PNLProyectos: TLFPanel
          Left = 0
          Top = 0
          Width = 417
          Height = 226
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LDesdeProyecto: TLFLabel
            Left = 9
            Top = 17
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Proyecto'
          end
          object LHastaProyecto: TLFLabel
            Left = 12
            Top = 39
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Proyecto'
          end
          object LDesdeUsuario: TLFLabel
            Left = 15
            Top = 65
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Usuario'
          end
          object LHastaUsuario: TLFLabel
            Left = 18
            Top = 87
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Usuario'
          end
          object LDesdeFecha: TLFLabel
            Left = 21
            Top = 113
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object LHastaFecha: TLFLabel
            Left = 24
            Top = 135
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object EFDesdeProyecto: TLFEditFind2000
            Left = 88
            Top = 13
            Width = 49
            Height = 21
            TabOrder = 0
            OnChange = EFDesdeProyectoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDesdeProyecto: TLFEdit
            Left = 138
            Top = 13
            Width = 270
            Height = 21
            Color = clInfoBk
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
          object EFHastaProyecto: TLFEditFind2000
            Left = 88
            Top = 35
            Width = 49
            Height = 21
            TabOrder = 2
            OnChange = EFHastaProyectoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EHastaProyecto: TLFEdit
            Left = 138
            Top = 35
            Width = 270
            Height = 21
            Color = clInfoBk
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
          object EFDesdeUsuario: TLFEditFind2000
            Left = 88
            Top = 61
            Width = 49
            Height = 21
            TabOrder = 4
            OnChange = EFDesdeUsuarioChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'SYS_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'USUARIO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDesdeUsuario: TLFEdit
            Left = 138
            Top = 61
            Width = 270
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object EFHastaUsuario: TLFEditFind2000
            Left = 88
            Top = 83
            Width = 49
            Height = 21
            TabOrder = 6
            OnChange = EFHastaUsuarioChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'SYS_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'USUARIO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EHastaUsuario: TLFEdit
            Left = 138
            Top = 83
            Width = 270
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DEDesdeFecha: TLFDateEdit
            Left = 88
            Top = 108
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DEHastaFecha: TLFDateEdit
            Left = 88
            Top = 130
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
        end
      end
      object TSOfertas: TTabSheet
        Caption = 'Ofertas'
        ImageIndex = 2
        OnShow = TSOfertasShow
        object PNLOfertas: TLFPanel
          Left = 0
          Top = 0
          Width = 417
          Height = 226
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LHastaCliente: TLFLabel
            Left = 22
            Top = 180
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Cliente'
          end
          object Label1: TLFLabel
            Left = 9
            Top = 17
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Proyecto'
          end
          object Label2: TLFLabel
            Left = 12
            Top = 39
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Proyecto'
          end
          object Label3: TLFLabel
            Left = 15
            Top = 65
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Usuario'
          end
          object Label4: TLFLabel
            Left = 18
            Top = 87
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Usuario'
          end
          object Label5: TLFLabel
            Left = 21
            Top = 113
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object Label6: TLFLabel
            Left = 24
            Top = 135
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object LDesdeCliente: TLFLabel
            Left = 19
            Top = 158
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Cliente'
          end
          object DEDesdeFechaOferta: TLFDateEdit
            Left = 88
            Top = 108
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DEHastaFechaOferta: TLFDateEdit
            Left = 88
            Top = 130
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
          object EDesdeCliente: TLFEdit
            Left = 138
            Top = 154
            Width = 270
            Height = 21
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
          object EDesdeProyectoOferta: TLFEdit
            Left = 138
            Top = 13
            Width = 270
            Height = 21
            Color = clInfoBk
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
          object EDesdeUsuarioOferta: TLFEdit
            Left = 138
            Top = 61
            Width = 270
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object EFDesdeCliente: TLFEditFind2000
            Left = 88
            Top = 154
            Width = 49
            Height = 21
            TabOrder = 10
            OnChange = EFDesdeClienteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDesdeProyectoOferta: TLFEditFind2000
            Left = 88
            Top = 13
            Width = 49
            Height = 21
            TabOrder = 0
            OnChange = EFDesdeProyectoOfertaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDesdeUsuarioOferta: TLFEditFind2000
            Left = 88
            Top = 61
            Width = 49
            Height = 21
            TabOrder = 4
            OnChange = EFDesdeUsuarioOfertaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'SYS_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'USUARIO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaCliente: TLFEditFind2000
            Left = 88
            Top = 176
            Width = 49
            Height = 21
            TabOrder = 12
            OnChange = EFHastaClienteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaProyectoOferta: TLFEditFind2000
            Left = 88
            Top = 35
            Width = 49
            Height = 21
            TabOrder = 2
            OnChange = EFHastaProyectoOfertaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaUsuarioOferta: TLFEditFind2000
            Left = 88
            Top = 83
            Width = 49
            Height = 21
            TabOrder = 6
            OnChange = EFHastaUsuarioOfertaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = True
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'SYS_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'USUARIO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EHastaCliente: TLFEdit
            Left = 138
            Top = 176
            Width = 270
            Height = 21
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
          object EHastaProyectoOferta: TLFEdit
            Left = 138
            Top = 35
            Width = 270
            Height = 21
            Color = clInfoBk
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
          object EHastaUsuarioOferta: TLFEdit
            Left = 138
            Top = 83
            Width = 270
            Height = 21
            Color = clInfoBk
            Enabled = False
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
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 372
    Top = 22
    inherited AImprimir: TAction
      Hint = 'Imprimir'
    end
    inherited APrev: TAction
      Hint = 'Previsualizar'
    end
    inherited ASalir: TAction
      Hint = 'Salir'
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    inherited AConfigurar: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
    end
  end
end
