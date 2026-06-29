inherited ProFMLstCalendarioLaboral: TProFMLstCalendarioLaboral
  Left = 362
  Top = 220
  Caption = 'Listado Horario Laboral'
  ClientHeight = 248
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 182
    TabOrder = 1
    inherited TBMain: TLFToolBar
      TabOrder = 2
    end
    inherited PCMain: TLFPageControl
      Top = 77
      Height = 105
      TabOrder = 3
      TabStop = False
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 77
      Width = 592
      Height = 105
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeOperario: TLFLabel
        Left = 33
        Top = 6
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Operario'
      end
      object LHastaOperario: TLFLabel
        Left = 36
        Top = 28
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Operario'
      end
      object EFOperarioD: TLFEditFind2000
        Left = 110
        Top = 2
        Width = 64
        Height = 21
        TabOrder = 0
        OnChange = EFOperarioDChange
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
        OrdenadoPor.Strings = (
          'EMPLEADO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EOperarioD: TLFEdit
        Left = 175
        Top = 2
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object EOperarioH: TLFEdit
        Left = 175
        Top = 24
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object EFOperarioH: TLFEditFind2000
        Left = 110
        Top = 24
        Width = 64
        Height = 21
        TabOrder = 1
        OnChange = EFOperarioHChange
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
        OrdenadoPor.Strings = (
          'EMPLEADO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LabelFechaD: TLFLabel
        Left = 44
        Top = 15
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LabelFechaH: TLFLabel
        Left = 312
        Top = 16
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object DTFechaD: TLFDateEdit
        Left = 111
        Top = 11
        Width = 94
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTFEchaH: TLFDateEdit
        Left = 378
        Top = 12
        Width = 94
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 182
    TabOrder = 0
    inherited LOrden: TLFLabel
      Visible = False
    end
    inherited EComentario: TLFEdit
      TabOrder = 2
    end
    inherited CBOrden: TLFComboBox
      TabOrder = 0
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      TabOrder = 1
    end
  end
  inherited ALMain: TLFActionList
    Left = 484
    Top = 8
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
    Left = 452
    Top = 8
  end
end
