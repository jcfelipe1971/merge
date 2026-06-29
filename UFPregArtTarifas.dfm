inherited FPregArtTarifas: TFPregArtTarifas
  Left = 341
  Top = 194
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Precios por Tarifa'
  ClientHeight = 380
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 380
    inherited TBMain: TLFToolBar
      Width = 592
      EdgeBorders = [ebTop, ebBottom]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object GBArticulos: TGroupBox
      Left = 0
      Top = 111
      Width = 592
      Height = 75
      Align = alTop
      Caption = 'Art'#237'culos'
      TabOrder = 1
      object LBLArtDesde: TLFLabel
        Left = 52
        Top = 22
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLArtHasta: TLFLabel
        Left = 55
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArt_Desde: TLFEditFind2000
        Left = 91
        Top = 19
        Width = 102
        Height = 21
        TabOrder = 0
        OnChange = EFArt_DesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = True
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArt_DesdeBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArticuloDesde: TLFDbedit
        Left = 194
        Top = 19
        Width = 363
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTarifas.DSxArt_Desde
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
      object EFArt_Hasta: TLFEditFind2000
        Left = 91
        Top = 41
        Width = 102
        Height = 21
        TabOrder = 2
        OnChange = EFArt_HastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArt_HastaBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArticuloHasta: TLFDbedit
        Left = 194
        Top = 41
        Width = 363
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTarifas.DSxArt_Hasta
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
    object GBTarifas: TGroupBox
      Left = 0
      Top = 186
      Width = 592
      Height = 75
      Align = alTop
      Caption = 'Tarifas'
      TabOrder = 2
      object LBLTarDesde: TLFLabel
        Left = 52
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLTarHasta: TLFLabel
        Left = 55
        Top = 45
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFTarifa_Desde: TLFEditFind2000
        Left = 91
        Top = 20
        Width = 45
        Height = 21
        TabOrder = 0
        OnChange = EFTarifa_DesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = True
        CampoNum = 'TARIFA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_TARIFAS_C'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETarifaDesde: TLFDbedit
        Left = 137
        Top = 20
        Width = 270
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTarifas.DSxTarifa_Desde
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
      object DBETarifaHasta: TLFDbedit
        Left = 137
        Top = 42
        Width = 270
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTarifas.DSxTarifa_Hasta
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
      object EFTarifa_Hasta: TLFEditFind2000
        Left = 91
        Top = 42
        Width = 45
        Height = 21
        TabOrder = 3
        OnChange = EFTarifa_HastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TARIFA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_TARIFAS_C'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBCantidad: TGroupBox
      Left = 0
      Top = 261
      Width = 592
      Height = 119
      Align = alClient
      Caption = 'Opciones'
      TabOrder = 3
      object LBLCantidad: TLFLabel
        Left = 116
        Top = 21
        Width = 195
        Height = 13
        Caption = 'Tarifas para cantidades que contengan a'
      end
      object ECantidad: TLFEdit
        Left = 316
        Top = 17
        Width = 73
        Height = 21
        TabOrder = 0
        OnKeyPress = ECantidadKeyPress
      end
      object ChckBOrdenado: TLFCheckBox
        Left = 118
        Top = 40
        Width = 300
        Height = 18
        Caption = 'Art'#237'culos por Familias'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        OnClick = ChckBOrdenadoClick
        Alignment = taLeftJustify
      end
      object CBPagina: TLFCheckBox
        Left = 118
        Top = 58
        Width = 300
        Height = 18
        Caption = 'Paginar por Familias'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBArticulosBaja: TLFCheckBox
        Left = 118
        Top = 76
        Width = 300
        Height = 18
        Caption = 'Incluir Articulos de Baja'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBOrderPorTitulo: TLFCheckBox
        Left = 118
        Top = 94
        Width = 300
        Height = 18
        Hint = 'Ordenar articulos por titulo'
        Caption = 'Ordenar articulos por titulo'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object GBFamilia: TGroupBox
      Left = 0
      Top = 36
      Width = 592
      Height = 75
      Align = alTop
      Caption = 'Familias'
      TabOrder = 0
      object LBLFamDesde: TLFLabel
        Left = 54
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLFamHasta: TLFLabel
        Left = 57
        Top = 45
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFFamilia_H: TLFEditFind2000
        Left = 91
        Top = 43
        Width = 45
        Height = 21
        TabOrder = 1
        OnChange = EFFamilia_HChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFamilia_HBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFamilia_D: TLFEditFind2000
        Left = 91
        Top = 21
        Width = 45
        Height = 21
        TabOrder = 0
        OnChange = EFFamilia_DChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFamilia_DBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEFamiliaDesde: TLFDbedit
        Left = 137
        Top = 21
        Width = 270
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTarifas.DSxFamilia_Desde
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
      object DBEFamiliaHasta: TLFDbedit
        Left = 137
        Top = 43
        Width = 270
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTarifas.DSxFamilia_Hasta
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
  end
  inherited ALMain: TLFActionList
    Left = 478
    Top = 34
    inherited APrev: TAction
      Hint = 'Visualizar'
      ImageIndex = 19
    end
    inherited ASalir: TAction
      Hint = 'Salir'
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBArticulosBaja.Checked'
      'CBOrderPorTitulo.Checked'
      'CBPagina.Checked'
      'ChckBOrdenado.Checked')
  end
end
