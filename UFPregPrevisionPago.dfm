inherited FPregPrevisionPago: TFPregPrevisionPago
  Left = 259
  Top = 93
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Previsiones de Pago'
  ClientHeight = 636
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 636
    inherited TBMain: TLFToolBar
      Width = 592
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TBExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
      object PBExportacion: TProgressBar
        Left = 432
        Top = 0
        Width = 150
        Height = 36
        Min = 0
        Max = 100
        TabOrder = 0
        Visible = False
      end
    end
    inherited PBListado: TProgressBar
      Top = 620
      Width = 592
      TabOrder = 16
    end
    object Vencimiento: TGroupBox
      Left = 0
      Top = 455
      Width = 592
      Height = 77
      Align = alClient
      Caption = 'Vencimiento'
      TabOrder = 7
      object Desde: TLFLabel
        Left = 207
        Top = 34
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Hasta: TLFLabel
        Left = 354
        Top = 34
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPHasta: TLFDateEdit
        Left = 386
        Top = 30
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
        OnButtonClick = DTPHastaClick
        OnClick = DTPHastaClick
      end
      object DTPDesde: TLFDateEdit
        Left = 242
        Top = 30
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnButtonClick = DTPDesdeClick
        OnClick = DTPDesdeClick
      end
      object RGVencimiento: TRadioGroup
        Left = 37
        Top = 11
        Width = 149
        Height = 60
        ItemIndex = 1
        Items.Strings = (
          'Ejercicio actual'
          'Todos los Vencimientos')
        TabOrder = 0
        OnClick = RGVencimientoClick
      end
    end
    object PNLDatos: TLFPanel
      Left = 0
      Top = 532
      Width = 592
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 8
      object Fecha_del_listado: TLFLabel
        Left = 16
        Top = 11
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object Moneda: TLFLabel
        Left = 338
        Top = 11
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 100
        Top = 7
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object CBCanales: TLFComboBox
        Left = 194
        Top = 7
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Todos los canales')
      end
      object EFMoneda: TLFEditFind2000
        Left = 381
        Top = 7
        Width = 52
        Height = 21
        TabOrder = 2
        OnChange = EFMonedaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'MONEDA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'MONEDA')
        Filtros = []
      end
      object EMoneda: TLFEdit
        Left = 434
        Top = 7
        Width = 151
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
    end
    object PNLComentario: TLFPanel
      Left = 0
      Top = 566
      Width = 592
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 9
      object Comentario: TLFLabel
        Left = 402
        Top = 22
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comen.'
      end
      object EComentario: TLFEdit
        Left = 440
        Top = 18
        Width = 146
        Height = 21
        MaxLength = 28
        TabOrder = 1
      end
      object GBSerieKri: TGroupBox
        Left = 3
        Top = 1
        Width = 398
        Height = 51
        Caption = 'Serie'
        TabOrder = 0
        object CBBC: TLFCheckBox
          Left = 10
          Top = 16
          Width = 35
          Height = 17
          Caption = 'BC'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBIR: TLFCheckBox
          Left = 90
          Top = 16
          Width = 35
          Height = 17
          Caption = 'IR'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBSE: TLFCheckBox
          Left = 90
          Top = 32
          Width = 35
          Height = 17
          Caption = 'SE'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBGJ: TLFCheckBox
          Left = 171
          Top = 16
          Width = 35
          Height = 17
          Caption = 'GJ'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBMAR: TLFCheckBox
          Left = 252
          Top = 16
          Width = 45
          Height = 17
          Caption = 'MAR'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 6
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBGAS: TLFCheckBox
          Left = 333
          Top = 16
          Width = 41
          Height = 17
          Caption = 'GAS'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBAgrup: TLFCheckBox
          Left = 333
          Top = 32
          Width = 45
          Height = 17
          Caption = 'Agrup'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 9
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBLC: TLFCheckBox
          Left = 171
          Top = 32
          Width = 35
          Height = 17
          Caption = 'LC'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 5
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBBL: TLFCheckBox
          Left = 10
          Top = 32
          Width = 35
          Height = 17
          Caption = 'BL'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBMAN: TLFCheckBox
          Left = 252
          Top = 32
          Width = 47
          Height = 17
          Caption = 'MAN'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 7
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    object RGAgrupadoPor: TRadioGroup
      Left = 0
      Top = 179
      Width = 592
      Height = 139
      Align = alTop
      Caption = 'Agrupado Por'
      ItemIndex = 0
      Items.Strings = (
        'Vencimiento'
        'Proveedores / Acreedores'
        'Un Proveedor'
        'Un Acreedor'
        'Cuenta'
        'Una Cuenta')
      TabOrder = 4
      OnClick = RGAgrupadoPorClick
    end
    object GBTipoEfecto: TGroupBox
      Left = 0
      Top = 76
      Width = 592
      Height = 63
      Align = alTop
      Caption = 'Tipo de Efecto'
      TabOrder = 2
      object CBFiltraTipoEfecto: TLFCheckBox
        Left = 21
        Top = 26
        Width = 74
        Height = 17
        Caption = 'Filtrar'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CBFiltraTipoEfectoClick
        Alignment = taLeftJustify
      end
      object EFTipoEfectoDesde: TLFEditFind2000
        Left = 113
        Top = 13
        Width = 64
        Height = 21
        TabOrder = 1
        OnChange = EFTipoEfectoDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'TIPO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TIPO_EFECTO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTipoEfectoHasta: TLFEditFind2000
        Left = 113
        Top = 35
        Width = 64
        Height = 21
        TabOrder = 2
        OnChange = EFTipoEfectoHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'TIPO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TIPO_EFECTO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
      end
      object ETipoEfectoDesde: TLFEdit
        Left = 178
        Top = 13
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object ETipoEfectoHasta: TLFEdit
        Left = 178
        Top = 35
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object GBOtrosFiltros: TGroupBox
      Left = 0
      Top = 370
      Width = 592
      Height = 85
      Align = alTop
      Caption = 'Otros Filtros'
      TabOrder = 6
      object EFPais: TLFEditFind2000
        Left = 113
        Top = 14
        Width = 64
        Height = 21
        TabOrder = 1
        Visible = False
        OnChange = EFPaisChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PAIS'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PAISES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PAIS')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object CBFiltraPais: TLFCheckBox
        Left = 21
        Top = 16
        Width = 74
        Height = 17
        Caption = 'Filtrar Pais'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CBFiltraPaisClick
        Alignment = taLeftJustify
      end
      object EPais: TLFEdit
        Left = 178
        Top = 14
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object CBFiltraNIF: TLFCheckBox
        Left = 21
        Top = 38
        Width = 74
        Height = 17
        Caption = 'Filtrar NIF'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        OnClick = CBFiltraNIFClick
        Alignment = taLeftJustify
      end
      object ENIF: TLFEdit
        Left = 113
        Top = 36
        Width = 144
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object CBCalcularPrevisionPedidos: TLFCheckBox
        Left = 21
        Top = 62
        Width = 236
        Height = 17
        Caption = 'Calcular prevision a partir de pedidos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        OnClick = CBFiltraNIFClick
        Alignment = taLeftJustify
      end
      object CBCalcularPrevisionAlbaranes: TLFCheckBox
        Left = 277
        Top = 62
        Width = 252
        Height = 17
        Caption = 'Calcular prevision a partir de albaranes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        OnClick = CBFiltraNIFClick
        Alignment = taLeftJustify
      end
    end
    object GBFormaPago: TGroupBox
      Left = 0
      Top = 139
      Width = 592
      Height = 40
      Align = alTop
      Caption = 'Forma de Pago'
      TabOrder = 3
      object EFFormaPago: TLFEditFind2000
        Left = 113
        Top = 14
        Width = 64
        Height = 21
        TabOrder = 1
        OnChange = EFFormaPagoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FORMA_PAGO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FORMA_PAGO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEFormaPago: TLFDbedit
        Left = 178
        Top = 14
        Width = 350
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRPrevisionPago.DSxFormaPago
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
      object ChkBFiltrar: TLFCheckBox
        Left = 21
        Top = 16
        Width = 74
        Height = 17
        Caption = 'Filtrar'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = ChkBFiltrarClick
        Alignment = taLeftJustify
      end
    end
    object GBFiltroBanco: TGroupBox
      Left = 0
      Top = 36
      Width = 592
      Height = 40
      Align = alTop
      Caption = 'Filtro por Cuenta de Banco'
      TabOrder = 1
      object EFBanco: TLFEditFind2000
        Left = 113
        Top = 14
        Width = 84
        Height = 21
        TabOrder = 1
        Visible = False
        OnChange = EFBancoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'BANCO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_BANCOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'BANCO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object CBFiltraBanco: TLFCheckBox
        Left = 21
        Top = 16
        Width = 74
        Height = 17
        Caption = 'Filtrar'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CBFiltraBancoClick
        Alignment = taLeftJustify
      end
      object EBanco: TLFEdit
        Left = 198
        Top = 14
        Width = 330
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
    end
    object EFProveedor: TLFEditFind2000
      Left = 113
      Top = 233
      Width = 64
      Height = 21
      TabOrder = 10
      Visible = False
      OnChange = EFProveedorChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PROVEEDOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEAcreedor: TLFDbedit
      Left = 178
      Top = 255
      Width = 350
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMRPrevisionPago.DSxAcreedor
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
      Visible = False
    end
    object DBEProveedor: TLFDbedit
      Left = 178
      Top = 233
      Width = 350
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMRPrevisionPago.DSxProveedor
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      Visible = False
    end
    object ECuenta: TLFEdit
      Left = 198
      Top = 293
      Width = 330
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 15
    end
    object EFAcreedor: TLFEditFind2000
      Left = 113
      Top = 255
      Width = 64
      Height = 21
      TabOrder = 12
      Visible = False
      OnChange = EFAcreedorChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ACREEDOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ACREEDORES_EMPRESA'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ACREEDOR')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFCuenta: TLFEditFind2000
      Left = 113
      Top = 293
      Width = 84
      Height = 21
      TabOrder = 14
      Visible = False
      OnChange = EFCuentaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CUENTA_CONTABLE'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'activo=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CUENTA_CONTABLE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object GBSerie: TGroupBox
      Left = 0
      Top = 318
      Width = 592
      Height = 52
      Align = alTop
      Caption = 'Serie'
      TabOrder = 5
      object CBFiltraSerie: TLFCheckBox
        Left = 21
        Top = 21
        Width = 42
        Height = 17
        Caption = 'Filtrar'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBSerie: TComboBox
        Left = 113
        Top = 16
        Width = 312
        Height = 21
        ItemHeight = 13
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 308
    Top = 178
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
