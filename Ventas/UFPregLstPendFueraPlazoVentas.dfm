inherited FPregLstPendFueraPlazoVentas: TFPregLstPendFueraPlazoVentas
  Left = 383
  Top = 187
  Caption = 'Listado de Pedidos fuera de plazo (Ventas)'
  ClientHeight = 362
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 362
    inherited TBMain: TLFToolBar
      Width = 592
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object TBMultiSerie: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSerie
      end
    end
    inherited PBListado: TProgressBar
      Top = 264
      Width = 592
      TabOrder = 4
    end
    object PNLOrden: TLFPanel
      Left = 0
      Top = 280
      Width = 592
      Height = 82
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object LComentario: TLFLabel
        Left = 52
        Top = 35
        Width = 53
        Height = 13
        Caption = 'Comentario'
      end
      object LOrden: TLFLabel
        Left = 40
        Top = 12
        Width = 65
        Height = 13
        Caption = 'Ordenado por'
      end
      object LFechaListado: TLFLabel
        Left = 326
        Top = 14
        Width = 80
        Height = 13
        Caption = 'Fecha del listado'
      end
      object EComentario: TLFEdit
        Left = 110
        Top = 32
        Width = 389
        Height = 21
        MaxLength = 60
        TabOrder = 1
      end
      object CBOrden: TLFComboBox
        Left = 110
        Top = 10
        Width = 203
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBOrdenChange
      end
      object DTPFechaListado: TLFDateEdit
        Left = 412
        Top = 10
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
    end
    object LFPPendFueraPlazo: TLFPanel
      Left = 0
      Top = 133
      Width = 592
      Height = 131
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LBLCliH: TLFLabel
        Left = 52
        Top = 35
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta cliente'
      end
      object LBLCliD: TLFLabel
        Left = 49
        Top = 14
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde cliente'
        Color = clBtnFace
        ParentColor = False
      end
      object LDesdeFecha: TLFLabel
        Left = 123
        Top = 102
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
        Layout = tlCenter
      end
      object LHastaFecha: TLFLabel
        Left = 339
        Top = 102
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
        Layout = tlCenter
      end
      object LDesdeFamilia: TLabel
        Left = 49
        Top = 57
        Width = 66
        Height = 13
        Caption = 'Desde Familia'
      end
      object LHastaFamilia: TLabel
        Left = 52
        Top = 79
        Width = 63
        Height = 13
        Caption = 'Hasta Familia'
      end
      object EFCliD: TLFEditFind2000
        Left = 118
        Top = 10
        Width = 72
        Height = 21
        TabOrder = 0
        OnChange = EFCliDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'CLIENTE'
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EClienteD: TLFEdit
        Left = 191
        Top = 10
        Width = 301
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
      object EFCliH: TLFEditFind2000
        Left = 118
        Top = 32
        Width = 72
        Height = 21
        TabOrder = 2
        OnChange = EFCliHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'CLIENTE'
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EClienteH: TLFEdit
        Left = 191
        Top = 32
        Width = 301
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
      object DTPFechaD: TLFDateEdit
        Left = 191
        Top = 98
        Width = 88
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 8
      end
      object DTPFechaH: TLFDateEdit
        Left = 404
        Top = 98
        Width = 88
        Height = 21
        CheckOnExit = True
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 9
      end
      object EFDesdeFamilia: TLFEditFind2000
        Left = 118
        Top = 54
        Width = 72
        Height = 21
        TabOrder = 4
        OnChange = EFDesdeFamiliaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'FAMILIA'
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaFamilia: TLFEditFind2000
        Left = 118
        Top = 76
        Width = 72
        Height = 21
        TabOrder = 6
        OnChange = EFHastaFamiliaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'FAMILIA'
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeFamiliaTitulo: TLFEdit
        Left = 191
        Top = 54
        Width = 301
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EHastaFamiliaTitulo: TLFEdit
        Left = 191
        Top = 76
        Width = 301
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
    end
    object LFPFueraPlazo: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 97
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object RGPlazos: TRadioGroup
        Left = 0
        Top = 0
        Width = 592
        Height = 48
        Align = alTop
        Columns = 4
        Items.Strings = (
          'Fuera de plazo'
          'Plazo'
          'Por Recibir'
          'Todos')
        TabOrder = 0
      end
      object RGServidos: TRadioGroup
        Left = 0
        Top = 48
        Width = 592
        Height = 49
        Align = alClient
        Columns = 4
        Items.Strings = (
          'Pendientes'
          'Servido Parcial'
          'Servido Total'
          'Todos')
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 424
    Top = 16
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMultiSerie: TAction
      Caption = 'Multi-Serie'
      Hint = 'Multi-Serie'
      ImageIndex = 115
      OnExecute = AMultiSerieExecute
    end
  end
end
