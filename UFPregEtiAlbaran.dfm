inherited FPregEtiAlbaran: TFPregEtiAlbaran
  Left = 469
  Top = 476
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Etiquetas de Albaranes'
  ClientHeight = 233
  ClientWidth = 355
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 355
    Height = 233
    object LBLEtiVacias: TLFLabel [0]
      Left = 54
      Top = 45
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Etiquetas Vac'#237'as'
    end
    object LBLEtiquetas: TLFLabel [1]
      Left = 76
      Top = 66
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' de Etiquetas'
    end
    object LBLFecha: TLFLabel [2]
      Left = 73
      Top = 88
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha de Env'#237'o'
    end
    object LSerie: TLFLabel [3]
      Left = 126
      Top = 133
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    object LDocumento: TLFLabel [4]
      Left = 114
      Top = 156
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Albar'#225'n'
    end
    object LInfo: TLFLabel [5]
      Left = 40
      Top = 184
      Width = 233
      Height = 36
      AutoSize = False
      Caption = 
        'Nro de Etiq. = 0, Imprime tantas copias como bultos tenga el alb' +
        'ar'#225'n.'
      WordWrap = True
    end
    object LEjercicio: TLFLabel [6]
      Left = 110
      Top = 111
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ejercicio'
    end
    inherited TBMain: TLFToolBar
      Width = 355
      ButtonWidth = 69
      EdgeBorders = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      inherited TButtImprimir: TToolButton
        Left = 69
        Hint = 'Imprimir'
        OnClick = nil
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 138
        OnClick = nil
      end
      object TButtConfigurar: TToolButton [3]
        Left = 207
        Top = 0
        Action = AConfigurar
      end
      inherited TButtSalir: TToolButton
        Left = 276
      end
    end
    object EEtiVacias: TLFEdit
      Left = 156
      Top = 40
      Width = 87
      Height = 21
      TabOrder = 0
    end
    object EEtiquetas: TLFEdit
      Left = 156
      Top = 62
      Width = 87
      Height = 21
      TabOrder = 1
    end
    object DTPFecha: TLFDateEdit
      Left = 156
      Top = 84
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
    end
    object EAlbaran: TLFEdit
      Left = 156
      Top = 150
      Width = 87
      Height = 21
      TabOrder = 5
      Text = '0'
    end
    object EFSerie: TLFEditFind2000
      Left = 156
      Top = 128
      Width = 87
      Height = 21
      TabOrder = 4
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
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFEjercicio: TLFEditFind2000
      Left = 156
      Top = 106
      Width = 87
      Height = 21
      TabOrder = 3
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'CIERRE')
      CampoNum = 'EJERCICIO'
      CampoStr = 'APERTURA'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_EJERCICIOS'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  inherited ALMain: TLFActionList
    Left = 268
    Top = 52
    inherited AImprimir: TAction
      Caption = 'Imprimir'
      Hint = 'Salir'
    end
    inherited APrev: TAction
      Caption = '  Visualizar  '
      Hint = 'Visualizar'
      ImageIndex = 19
    end
    inherited ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
    end
    inherited AConfigurar: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
    end
  end
end
