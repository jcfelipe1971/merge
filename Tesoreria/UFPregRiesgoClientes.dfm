inherited FPregRiesgoClientes: TFPregRiesgoClientes
  Left = 509
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Riesgos de Clientes'
  ClientHeight = 343
  ClientWidth = 504
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 504
      object ToolButton1: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object GBFechas: TGroupBox
      Left = 0
      Top = 191
      Width = 504
      Height = 74
      Align = alTop
      Caption = ' Fechas Valor '
      TabOrder = 1
      object LBLFechaD: TLFLabel
        Left = 75
        Top = 35
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLFechaH: TLFLabel
        Left = 258
        Top = 35
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPFechaD: TLFDateEdit
        Left = 111
        Top = 31
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFechaH: TLFDateEdit
        Left = 291
        Top = 31
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GBDatos: TGroupBox
      Left = 0
      Top = 267
      Width = 504
      Height = 76
      Align = alBottom
      TabOrder = 2
      object Comentario: TLFLabel
        Left = 53
        Top = 46
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LBLFechaListado: TLFLabel
        Left = 43
        Top = 25
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha listado'
      end
      object Moneda: TLFLabel
        Left = 214
        Top = 24
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object EComentario: TLFEdit
        Left = 111
        Top = 43
        Width = 268
        Height = 21
        MaxLength = 28
        TabOrder = 2
      end
      object DTPFechaListado: TLFDateEdit
        Left = 111
        Top = 21
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 257
        Top = 20
        Width = 122
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = DMLstRiesgoClientes.DSxMonedas
        TabOrder = 1
      end
    end
    object GBClientes: TGroupBox
      Left = 0
      Top = 114
      Width = 504
      Height = 77
      Align = alTop
      Caption = ' Clientes '
      TabOrder = 4
      object LBLClienteD: TLFLabel
        Left = 40
        Top = 25
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLClienteH: TLFLabel
        Left = 43
        Top = 46
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFClienteD: TLFEditFind2000
        Left = 76
        Top = 21
        Width = 50
        Height = 21
        TabOrder = 0
        OnChange = EFClienteDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFClienteH: TLFEditFind2000
        Left = 76
        Top = 43
        Width = 50
        Height = 21
        TabOrder = 1
        OnChange = EFClienteHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEClienteH: TLFEdit
        Left = 127
        Top = 43
        Width = 319
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
        TabOrder = 2
      end
      object DBEClienteD: TLFEdit
        Left = 127
        Top = 21
        Width = 319
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
    end
    object GBAgentes: TGroupBox
      Left = 0
      Top = 36
      Width = 504
      Height = 78
      Align = alTop
      Caption = 'Agentes'
      TabOrder = 3
      object LHastaAgente: TLFLabel
        Left = 43
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeAgente: TLFLabel
        Left = 40
        Top = 23
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFAgenteDesde: TLFEditFind2000
        Left = 76
        Top = 19
        Width = 50
        Height = 21
        TabOrder = 0
        OnChange = EFAgenteDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = []
      end
      object EFAgenteHasta: TLFEditFind2000
        Left = 76
        Top = 41
        Width = 50
        Height = 21
        TabOrder = 1
        OnChange = EFAgenteHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = []
      end
      object EAgenteDesde: TLFEdit
        Left = 127
        Top = 19
        Width = 319
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 2
      end
      object EAgenteHasta: TLFEdit
        Left = 127
        Top = 41
        Width = 319
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 324
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
    Left = 140
    Top = 32
  end
end
