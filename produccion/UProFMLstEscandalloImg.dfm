inherited ProFMLstEscandalloImg: TProFMLstEscandalloImg
  Left = 438
  Top = 260
  Caption = 'Listado de Escandallo'
  ClientHeight = 296
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 193
    inherited PCMain: TLFPageControl
      Height = 157
    end
    object PanelCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 157
      Align = alClient
      TabOrder = 2
      object LDesdeEscandallo: TLFLabel
        Left = 4
        Top = 44
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Escandallo'
      end
      object LHastaEscandallo: TLFLabel
        Left = 7
        Top = 66
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Escandallo'
      end
      object EFEscD: TLFEditFind2000
        Left = 92
        Top = 40
        Width = 79
        Height = 21
        TabOrder = 0
        OnChange = EFEscDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ESCANDALLO'
        CampoStr = 'COMPUESTO'
        CondicionBusqueda = 'tipo='#39'EPR'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_ESCANDALLO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ESCANDALLO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFEscH: TLFEditFind2000
        Left = 92
        Top = 62
        Width = 79
        Height = 21
        TabOrder = 1
        OnChange = EFEscHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ESCANDALLO'
        CampoStr = 'COMPUESTO'
        CondicionBusqueda = 'tipo='#39'EPR'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_ESCANDALLO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ESCANDALLO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitulosDesdeEscandallo: TLFDbedit
        Left = 172
        Top = 40
        Width = 317
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMLstEscandalloImg.DSEscandalloD
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBETitulosHastaEscandallo: TLFDbedit
        Left = 172
        Top = 62
        Width = 317
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMLstEscandalloImg.DSEscandalloH
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 230
    inherited LComentario: TLFLabel
      Left = 30
    end
    inherited LOrden: TLFLabel
      Left = 348
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 3
    end
    inherited EComentario: TLFEdit
      Left = 89
    end
    inherited CBOrden: TLFComboBox
      Left = 419
      Width = 73
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 89
    end
  end
  inherited ALMain: TLFActionList
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
