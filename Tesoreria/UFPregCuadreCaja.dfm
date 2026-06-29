inherited FPregCuadreCaja: TFPregCuadreCaja
  Caption = 'Listado cuadre de caja'
  ClientWidth = 395
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 395
    object LFechaDesde: TLFLabel [0]
      Left = 66
      Top = 98
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LFechaHasta: TLFLabel [1]
      Left = 69
      Top = 120
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LSerie: TLFLabel [2]
      Left = 73
      Top = 78
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    inherited TBMain: TLFToolBar
      Width = 395
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object DTFechaDesde: TLFDateEdit
      Left = 102
      Top = 94
      Width = 90
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object DTFechaHasta: TLFDateEdit
      Left = 102
      Top = 116
      Width = 90
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
    end
    object ETituloSerie: TLFEdit
      Left = 138
      Top = 72
      Width = 191
      Height = 21
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'ETituloSerie'
    end
    object EFSerie: TLFEditFind2000
      Left = 102
      Top = 72
      Width = 35
      Height = 21
      TabOrder = 3
      Text = 'A'
      OnChange = EFSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'SERIE'
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
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
