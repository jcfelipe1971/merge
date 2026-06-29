inherited ProFMLstOrdenDet: TProFMLstOrdenDet
  Left = 358
  Top = 249
  Caption = 'Listado Orden Detallado'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    object PanelCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 241
      Align = alClient
      TabOrder = 2
      object LDesdeCompuesto: TLFLabel
        Left = 45
        Top = 15
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Compuesto'
      end
      object LHastaCompuesto: TLFLabel
        Left = 48
        Top = 40
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Compuesto'
      end
      object LDesdeCliente: TLFLabel
        Left = 65
        Top = 67
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Cliente'
      end
      object LHastaCliente: TLFLabel
        Left = 68
        Top = 89
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Cliente'
      end
      object LDesdeFecha: TLFLabel
        Left = 65
        Top = 121
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LHastaFecha: TLFLabel
        Left = 68
        Top = 142
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object EFCompD: TLFEditFind2000
        Left = 134
        Top = 12
        Width = 79
        Height = 21
        TabOrder = 0
        OnChange = EFCompDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCompH: TLFEditFind2000
        Left = 134
        Top = 34
        Width = 79
        Height = 21
        TabOrder = 1
        OnChange = EFCompHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETituloDesdeCompuesto: TLFDbedit
        Left = 214
        Top = 12
        Width = 290
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMLstOrdenDet.DSxTituloCompuestoD
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBETituloHastaCompuesto: TLFDbedit
        Left = 214
        Top = 34
        Width = 290
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMLstOrdenDet.DSxTituloCompuestoH
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object EFCliD: TLFEditFind2000
        Left = 134
        Top = 64
        Width = 79
        Height = 21
        TabOrder = 4
        OnChange = EFCliDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCliH: TLFEditFind2000
        Left = 134
        Top = 86
        Width = 79
        Height = 21
        TabOrder = 5
        OnChange = EFCliHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETituloHastaCliente: TLFDbedit
        Left = 214
        Top = 86
        Width = 290
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMLstOrdenDet.DSxTituloClienteH
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBETituloDesdeCliente: TLFDbedit
        Left = 214
        Top = 64
        Width = 290
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMLstOrdenDet.DSxTituloClienteD
        Enabled = False
        ReadOnly = True
        TabOrder = 7
      end
      object DTPDesde: TLFDateEdit
        Left = 135
        Top = 118
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 8
      end
      object DTPHasta: TLFDateEdit
        Left = 135
        Top = 140
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 9
      end
    end
  end
  inherited PNLOrden: TLFPanel
    inherited LComentario: TLFLabel
      Top = 21
    end
    inherited LOrden: TLFLabel
      Left = 41
      Top = 43
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Top = 19
    end
    inherited EComentario: TLFEdit
      Top = 17
      Width = 221
    end
    inherited CBOrden: TLFComboBox
      Top = 39
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Top = 15
    end
  end
  inherited ALMain: TLFActionList
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
end
