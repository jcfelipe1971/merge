inherited FMLstDetalleIngresos: TFMLstDetalleIngresos
  Caption = 'Listado de ingresos'
  ClientHeight = 242
  ClientWidth = 376
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 376
    Height = 242
    object LFSerie: TLFLabel [0]
      Left = 59
      Top = 119
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    object LFechaHasta: TLFLabel [1]
      Left = 191
      Top = 90
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LFechaDesde: TLFLabel [2]
      Left = 52
      Top = 90
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LFechaListado: TLFLabel [3]
      Left = 18
      Top = 179
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Listado'
    end
    object LComentario: TLFLabel [4]
      Left = 31
      Top = 200
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comentario'
    end
    object LUsuario: TLFLabel [5]
      Left = 45
      Top = 149
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inherited TBMain: TLFToolBar
      Width = 376
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object ESerie: TLFEdit
      Left = 161
      Top = 116
      Width = 208
      Height = 21
      Color = clInfoBk
      TabOrder = 1
    end
    object EFSerie: TLFEditFind2000
      Left = 88
      Top = 116
      Width = 73
      Height = 21
      TabOrder = 2
      Text = 'A'
      OnChange = EFSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'SERIE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object DTHasta: TLFDateEdit
      Left = 224
      Top = 86
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
    end
    object DTDesde: TLFDateEdit
      Left = 88
      Top = 86
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
    object EComentario: TLFEdit
      Left = 88
      Top = 197
      Width = 281
      Height = 21
      TabOrder = 5
    end
    object DEFechaListado: TLFDateEdit
      Left = 88
      Top = 175
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 6
    end
    object EFUsuario: TLFEditFind2000
      Left = 88
      Top = 145
      Width = 73
      Height = 21
      TabOrder = 7
      Text = '0'
      OnChange = EFUsuarioChange
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
      Entorno = DMMain.EntornoBusqueda
    end
    object ENombreUsuario: TLFEdit
      Left = 161
      Top = 145
      Width = 208
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 8
    end
  end
  inherited ALMain: TLFActionList
    Left = 300
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
  inherited FSMain: TLFFibFormStorage
    Left = 252
  end
end
