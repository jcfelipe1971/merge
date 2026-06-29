inherited FMIntroduccionOperario: TFMIntroduccionOperario
  Left = 336
  Top = 253
  ActiveControl = EFHoja
  Caption = 'Responsable'
  ClientHeight = 172
  ClientWidth = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 401
    Height = 148
    object LComentario: TLFLabel [0]
      Left = 30
      Top = 105
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comentario'
    end
    object LFechaFinal: TLFLabel [1]
      Left = 30
      Top = 83
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Final'
    end
    object LHoja: TLFLabel [2]
      Left = 58
      Top = 40
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hoja '
    end
    object LOperario: TLFLabel [3]
      Left = 44
      Top = 61
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Operario'
    end
    inherited TBMain: TLFToolBar
      Width = 397
      TabOrder = 8
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object BAceptar: TButton
      Left = 88
      Top = 130
      Width = 161
      Height = 25
      Hint = 'Pasar a estado 2 (Preparaci'#243'n) de la hoja de preparaci'#243'n'
      Caption = 'Pasar a estado de Preparaci'#243'n'
      TabOrder = 4
      OnClick = BAceptarClick
    end
    object BCerrar: TButton
      Left = 312
      Top = 130
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 5
      OnClick = BCerrarClick
    end
    object EComentario: TLFEdit
      Left = 88
      Top = 100
      Width = 305
      Height = 21
      TabOrder = 3
    end
    object DEFechaInicio: TLFDateEdit
      Left = 88
      Top = 78
      Width = 97
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
    end
    object ETituloResponsable: TLFEdit
      Left = 132
      Top = 56
      Width = 262
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object ETituloHoja: TLFEdit
      Left = 132
      Top = 34
      Width = 262
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
    object EFOperario: TLFEditFind2000
      Left = 88
      Top = 56
      Width = 43
      Height = 21
      TabOrder = 1
      OnChange = EFOperarioChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'EMPLEADO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'ACTIVO=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_EMPLEADOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFHoja: TLFEditFind2000
      Left = 88
      Top = 34
      Width = 43
      Height = 21
      TabOrder = 0
      OnChange = EFHojaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'HOJA'
      CampoStr = 'NOMBRE_R_SOCIAL'
      CondicionBusqueda = 'ESTADO = 1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CABECERAS_S_PRE'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  inherited TBActions: TLFToolBar
    Top = 148
    Width = 401
  end
end
