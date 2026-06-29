inherited FMTPVConfSincronizacion: TFMTPVConfSincronizacion
  Caption = 'TPV Configuraci'#243'n Sincronizaci'#243'n'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    object LNombreDB: TLFLabel [0]
      Left = 65
      Top = 50
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Base de datos'
    end
    object LUsuarioDB: TLFLabel [1]
      Left = 97
      Top = 74
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usuario'
    end
    object LRolDB: TLFLabel [2]
      Left = 117
      Top = 115
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rol'
    end
    object LPasswordDB: TLFLabel [3]
      Left = 87
      Top = 93
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Password'
    end
    object LRutaFicheroSincronizacion: TLFLabel [4]
      Left = 5
      Top = 137
      Width = 128
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ruta fichero sincronizacion'
    end
    inherited TBMain: TLFToolBar
      TabOrder = 6
      inherited EPMain: THYMEditPanel
        Width = 35
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 35
        Top = 0
        Width = 9
        ImageIndex = 42
        Style = tbsSeparator
      end
      object BtnLeer: TToolButton
        Left = 44
        Top = 0
        Caption = 'BtnLeer'
        ImageIndex = 26
      end
      object BtnEscribir: TToolButton
        Left = 67
        Top = 0
        Caption = 'BtnEscribir'
        ImageIndex = 41
        OnClick = BtnEscribirClick
      end
    end
    object ENombreDB: TLFEdit
      Left = 140
      Top = 46
      Width = 350
      Height = 21
      TabOrder = 0
    end
    object EUsuarioDB: TLFEdit
      Left = 140
      Top = 68
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object ERolDB: TLFEdit
      Left = 140
      Top = 112
      Width = 145
      Height = 21
      TabOrder = 3
    end
    object EPasswordDB: TLFEdit
      Left = 140
      Top = 90
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object ERutaFicheroSincronizacion: TLFEdit
      Left = 140
      Top = 134
      Width = 350
      Height = 21
      TabOrder = 4
    end
    object DBGFRutaSerividorSerie: TDBGridFind2000
      Left = 8
      Top = 160
      Width = 481
      Height = 161
      TabOrder = 5
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
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
