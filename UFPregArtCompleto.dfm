inherited FPregArtCompleto: TFPregArtCompleto
  Left = 351
  Top = 262
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Art'#237'culos'
  ClientHeight = 447
  ClientWidth = 760
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 760
    Height = 447
    inherited TBMain: TLFToolBar
      Width = 760
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 431
      Width = 760
      TabOrder = 8
    end
    object GBTipoIVA: TGroupBox
      Left = 0
      Top = 172
      Width = 760
      Height = 45
      Align = alTop
      Caption = 'Tipo de IVA'
      TabOrder = 3
      object LDesdeTipoIVA: TLFLabel
        Left = 100
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaTipoIVA: TLFLabel
        Left = 325
        Top = 20
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DBETipoIVADesde: TLFDbedit
        Left = 192
        Top = 16
        Width = 120
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstArticulos.DSxTipoIvaD
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EFTipoIVADesde: TLFEditFind2000
        Left = 136
        Top = 16
        Width = 55
        Height = 21
        TabOrder = 1
        OnChange = EFTipoIVADesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_TIPO_IVA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = [obPais]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTipoIVAHasta: TLFEditFind2000
        Left = 359
        Top = 16
        Width = 55
        Height = 21
        TabOrder = 2
        OnChange = EFTipoIVAHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_TIPO_IVA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = [obPais]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETipoIVAHasta: TLFDbedit
        Left = 415
        Top = 16
        Width = 120
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstArticulos.DSxTipoIvaH
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
      object ChkTipoIVA: TLFCheckBox
        Left = 67
        Top = 18
        Width = 18
        Height = 17
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        OnClick = ChkTipoIVAClick
        Alignment = taLeftJustify
      end
    end
    object GBPrecioCoste: TGroupBox
      Left = 0
      Top = 353
      Width = 760
      Height = 45
      Align = alTop
      Caption = 'Precio Coste'
      TabOrder = 6
      object LDesdePCoste: TLFLabel
        Left = 100
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaPCoste: TLFLabel
        Left = 325
        Top = 20
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EdPCosteDesde: TLFEdit
        Left = 136
        Top = 16
        Width = 120
        Height = 21
        TabOrder = 0
      end
      object EdPCosteHasta: TLFEdit
        Left = 359
        Top = 16
        Width = 120
        Height = 21
        TabOrder = 1
      end
      object ChkPCoste: TLFCheckBox
        Left = 67
        Top = 18
        Width = 18
        Height = 17
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        OnClick = ChkPCosteClick
        Alignment = taLeftJustify
      end
    end
    object GBFamilias: TGroupBox
      Left = 0
      Top = 104
      Width = 760
      Height = 68
      Align = alTop
      Caption = 'Familias'
      TabOrder = 2
      object LDesdeFamilia: TLFLabel
        Left = 100
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFamilia: TLFLabel
        Left = 103
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFFamiliaDesde: TLFEditFind2000
        Left = 136
        Top = 16
        Width = 55
        Height = 21
        TabOrder = 0
        OnChange = EFFamiliaDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFamiliaDesdeBusqueda
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFamiliaDesde: TLFEdit
        Left = 192
        Top = 16
        Width = 412
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
      object EFFamiliaHasta: TLFEditFind2000
        Left = 136
        Top = 38
        Width = 55
        Height = 21
        TabOrder = 2
        OnChange = EFFamiliaHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFamiliaHastaBusqueda
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFamiliaHasta: TLFEdit
        Left = 192
        Top = 38
        Width = 412
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
      object ChkFamilias: TLFCheckBox
        Left = 67
        Top = 30
        Width = 18
        Height = 17
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        OnClick = ChkFamiliasClick
        Alignment = taLeftJustify
      end
    end
    object GBCuentaVentas: TGroupBox
      Left = 0
      Top = 285
      Width = 760
      Height = 68
      Align = alTop
      Caption = 'Cuenta Ventas'
      TabOrder = 5
      object LHastaCtaVentas: TLFLabel
        Left = 103
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeCtaVentas: TLFLabel
        Left = 100
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFCtaVentasD: TLFEditFind2000
        Left = 136
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = EFCtaVentasDChange
        OnExit = EFCtaVentasDExit
        OnKeyDown = EFCtaVentasDKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO=5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCtaVentasH: TLFEditFind2000
        Left = 136
        Top = 38
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = EFCtaVentasHChange
        OnExit = EFCtaVentasHExit
        OnKeyDown = EFCtaVentasHKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO=5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object ECtaVentasD: TLFEdit
        Left = 258
        Top = 16
        Width = 402
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
      object ECtaVentasH: TLFEdit
        Left = 258
        Top = 38
        Width = 402
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
      object ChkCtaVentas: TLFCheckBox
        Left = 67
        Top = 30
        Width = 18
        Height = 17
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        OnClick = ChkCtaVentasClick
        Alignment = taLeftJustify
      end
    end
    object GBCuentaCompras: TGroupBox
      Left = 0
      Top = 217
      Width = 760
      Height = 68
      Align = alTop
      Caption = 'Cuenta Compras'
      TabOrder = 4
      object LDesdeCtaCompras: TLFLabel
        Left = 100
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaCtaCompras: TLFLabel
        Left = 103
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFCtaComprasD: TLFEditFind2000
        Left = 136
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = EFCtaComprasDChange
        OnExit = EFCtaComprasDExit
        OnKeyDown = EFCtaComprasDKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO=5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCtaComprasH: TLFEditFind2000
        Left = 136
        Top = 38
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = EFCtaComprasHChange
        OnExit = EFCtaComprasHExit
        OnKeyDown = EFCtaComprasHKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO=5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object ECtaComprasH: TLFEdit
        Left = 258
        Top = 38
        Width = 402
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
      object ECtaComprasD: TLFEdit
        Left = 258
        Top = 16
        Width = 402
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
      object ChkCtaCompras: TLFCheckBox
        Left = 67
        Top = 30
        Width = 18
        Height = 17
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        OnClick = ChkCtaComprasClick
        Alignment = taLeftJustify
      end
    end
    object GBArticulos: TGroupBox
      Left = 0
      Top = 36
      Width = 760
      Height = 68
      Align = alTop
      Caption = 'Art'#237'culos'
      TabOrder = 1
      object LDesdeArticulo: TLFLabel
        Left = 100
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 103
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArtDesde: TLFEditFind2000
        Left = 136
        Top = 16
        Width = 108
        Height = 21
        TabOrder = 0
        OnChange = EFArtDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = True
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArtDesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloDesde: TLFEdit
        Left = 245
        Top = 16
        Width = 415
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
      object EFArtHasta: TLFEditFind2000
        Left = 136
        Top = 38
        Width = 108
        Height = 21
        TabOrder = 2
        OnChange = EFArtHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArtHastaBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloHasta: TLFEdit
        Left = 245
        Top = 38
        Width = 415
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
      object ChkArticulos: TLFCheckBox
        Left = 67
        Top = 30
        Width = 18
        Height = 17
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        OnClick = ChkArticulosClick
        Alignment = taLeftJustify
      end
    end
    object RBOrdenado: TRadioGroup
      Left = 0
      Top = 398
      Width = 760
      Height = 45
      Align = alTop
      Caption = 'Ordenado por'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'No Filtrar '
        'Por C'#243'digo de Art'#237'culo'
        'Por T'#237'tulo de Art'#237'culo')
      TabOrder = 7
    end
  end
  inherited ALMain: TLFActionList
    Left = 409
    Top = 17
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 428
    Top = 16
  end
end
