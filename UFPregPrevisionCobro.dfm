inherited FPregPrevisionCobro: TFPregPrevisionCobro
  Left = 858
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Previsiones de Cobro'
  ClientHeight = 667
  ClientWidth = 592
  Constraints.MinHeight = 523
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 667
    TabOrder = 1
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
      Top = 651
      Width = 592
      TabOrder = 9
    end
    object PNLComentario: TLFPanel
      Left = 0
      Top = 555
      Width = 592
      Height = 66
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Comentario: TLFLabel
        Left = 12
        Top = 9
        Width = 200
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario / T'#237'tulo en Carta Reclamaci'#243'n'
      end
      object EComentario: TLFEdit
        Left = 218
        Top = 6
        Width = 176
        Height = 21
        MaxLength = 28
        TabOrder = 0
      end
      object ChkBCartaReclamacion: TLFCheckBox
        Left = 408
        Top = 2
        Width = 179
        Height = 17
        Hint = 'Permite utilizar el informe Carta Reclamaci'#243'n de Cobros'
        Caption = 'Usar Carta Reclamaci'#243'n Cobros'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        OnClick = ChkBCartaReclamacionClick
        Alignment = taLeftJustify
      end
      object RGCarta: TRadioGroup
        Left = 403
        Top = 27
        Width = 185
        Height = 36
        Caption = 'Carta'
        Columns = 5
        ItemIndex = 0
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
        TabOrder = 3
      end
      object GBSerieKri: TGroupBox
        Left = 4
        Top = 27
        Width = 391
        Height = 36
        Caption = 'Serie'
        TabOrder = 4
        object CBBC: TLFCheckBox
          Left = 10
          Top = 16
          Width = 31
          Height = 17
          Caption = 'BC'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBIR: TLFCheckBox
          Left = 84
          Top = 16
          Width = 31
          Height = 17
          Caption = 'IR'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBSE: TLFCheckBox
          Left = 117
          Top = 16
          Width = 31
          Height = 17
          Caption = 'SE'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBGJ: TLFCheckBox
          Left = 151
          Top = 16
          Width = 31
          Height = 17
          Caption = 'GJ'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBMAR: TLFCheckBox
          Left = 218
          Top = 16
          Width = 40
          Height = 17
          Caption = 'MAR'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 5
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBGAS: TLFCheckBox
          Left = 301
          Top = 16
          Width = 40
          Height = 17
          Caption = 'GAS'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 6
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBAgrup: TLFCheckBox
          Left = 343
          Top = 16
          Width = 45
          Height = 17
          Caption = 'Agrup'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 7
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBLC: TLFCheckBox
          Left = 185
          Top = 16
          Width = 31
          Height = 17
          Caption = 'LC'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBMAN: TLFCheckBox
          Left = 259
          Top = 16
          Width = 40
          Height = 17
          Caption = 'MAN'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBBL: TLFCheckBox
          Left = 47
          Top = 16
          Width = 31
          Height = 17
          Caption = 'BL'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 9
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object CBMarcarCartaEnviada: TLFCheckBox
        Left = 440
        Top = 15
        Width = 146
        Height = 17
        Caption = 'Marcar como Enviada'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object PNLDatos: TLFPanel
      Left = 0
      Top = 621
      Width = 592
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 8
      object Fecha_del_listado: TLFLabel
        Left = 14
        Top = 9
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object Moneda: TLFLabel
        Left = 338
        Top = 9
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 100
        Top = 5
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object CBCanales: TLFComboBox
        Left = 194
        Top = 5
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
        Top = 5
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
        Top = 5
        Width = 151
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
    end
    object RGAgrupadoPor: TRadioGroup
      Left = 0
      Top = 162
      Width = 592
      Height = 139
      Align = alTop
      Caption = 'Agrupado Por'
      ItemIndex = 0
      Items.Strings = (
        'Vencimiento'
        'Clientes'
        'Un Cliente'
        'Cuenta'
        'Un Agente')
      TabOrder = 4
      OnClick = RGAgrupadoPorClick
    end
    object GBOtrosFiltros: TGroupBox
      Left = 0
      Top = 353
      Width = 592
      Height = 124
      Align = alTop
      Caption = 'Otros Filtros'
      TabOrder = 6
      object LDocFechaDesde: TLFLabel
        Left = 27
        Top = 100
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fec. Doc.'
      end
      object LDofFechaHasta: TLFLabel
        Left = 205
        Top = 100
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fec. Doc.'
      end
      object EFIncidencia: TLFEditFind2000
        Left = 113
        Top = 12
        Width = 64
        Height = 21
        TabOrder = 1
        Visible = False
        OnChange = EFIncidenciaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TIPO_INCIDENCIA_KRI'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
      end
      object ETituloIncidencia: TLFEdit
        Left = 178
        Top = 12
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
      object CBFiltraIncidencia: TLFCheckBox
        Left = 21
        Top = 15
        Width = 92
        Height = 17
        Caption = 'Filtra Incidencia'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CBFiltraIncidenciaClick
        Alignment = taLeftJustify
      end
      object CBFiltraPais: TLFCheckBox
        Left = 21
        Top = 37
        Width = 92
        Height = 17
        Caption = 'Filtra Pais'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        OnClick = CBFiltraPaisClick
        Alignment = taLeftJustify
      end
      object EFPais: TLFEditFind2000
        Left = 113
        Top = 34
        Width = 64
        Height = 21
        TabOrder = 4
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
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PAISES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PAIS')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EPais: TLFEdit
        Left = 178
        Top = 34
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
        TabOrder = 5
        Visible = False
      end
      object CBFiltraNIF: TLFCheckBox
        Left = 21
        Top = 58
        Width = 92
        Height = 17
        Caption = 'Filtrar NIF'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        OnClick = CBFiltraNIFClick
        Alignment = taLeftJustify
      end
      object ENIF: TLFEdit
        Left = 113
        Top = 56
        Width = 144
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = False
      end
      object CBCalcularPrevisionPedidos: TLFCheckBox
        Left = 21
        Top = 78
        Width = 236
        Height = 17
        Caption = 'Calcular prevision a partir de pedidos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 10
        TabStop = True
        OnClick = CBFiltraNIFClick
        Alignment = taLeftJustify
      end
      object CBCalcularPrevisionAlbaranes: TLFCheckBox
        Left = 277
        Top = 78
        Width = 252
        Height = 17
        Caption = 'Calcular prevision a partir de albaranes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 11
        TabStop = True
        OnClick = CBFiltraNIFClick
        Alignment = taLeftJustify
      end
      object CBSoloRecibidos: TLFCheckBox
        Left = 277
        Top = 58
        Width = 132
        Height = 17
        Caption = 'Solo Recibidos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 8
        TabStop = True
        OnClick = CBSoloRecibidosClick
        Alignment = taLeftJustify
      end
      object CBSoloNoRecibidos: TLFCheckBox
        Left = 389
        Top = 58
        Width = 132
        Height = 17
        Caption = 'Solo NO Recibidos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 9
        TabStop = True
        OnClick = CBSoloNoRecibidosClick
        Alignment = taLeftJustify
      end
      object DEDesdeDocFecha: TLFDateEdit
        Left = 114
        Top = 96
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 12
      end
      object DEHastaDocFecha: TLFDateEdit
        Left = 289
        Top = 96
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 13
      end
    end
    object GBFormaPago: TGroupBox
      Left = 0
      Top = 96
      Width = 592
      Height = 66
      Align = alTop
      Caption = 'Forma de Pago'
      TabOrder = 3
      object EFFormaPago: TLFEditFind2000
        Left = 113
        Top = 17
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
      object EFormaPago: TLFEdit
        Left = 178
        Top = 17
        Width = 350
        Height = 21
        TabStop = False
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
      object ChkBFiltrar: TLFCheckBox
        Left = 21
        Top = 19
        Width = 55
        Height = 17
        Caption = 'Filtrar'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = ChkBFiltrarClick
        Alignment = taLeftJustify
      end
      object CBSoloNoRemesadosKRI: TLFCheckBox
        Left = 21
        Top = 41
        Width = 212
        Height = 17
        Caption = 'Solo los recibos NO remesados'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBExcluirRemesables: TLFCheckBox
        Left = 245
        Top = 41
        Width = 212
        Height = 17
        Caption = 'Excluir recibos Remesables'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object GBFiltraEfecto: TGroupBox
      Left = 0
      Top = 36
      Width = 592
      Height = 60
      Align = alTop
      Caption = 'Tipo de efecto'
      TabOrder = 2
      object LDesdeEfecto: TLFLabel
        Left = 79
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaEfecto: TLFLabel
        Left = 81
        Top = 37
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object CBFiltraEfecto: TLFCheckBox
        Left = 21
        Top = 24
        Width = 42
        Height = 17
        Caption = 'Filtrar'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CBFiltraEfectoClick
        Alignment = taLeftJustify
      end
      object EFTipoEfectoDesde: TLFEditFind2000
        Left = 113
        Top = 11
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
        CampoStr = 'TITULO'
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
      object EFTipoEfectoHasta: TLFEditFind2000
        Left = 113
        Top = 33
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
        CampoStr = 'TITULO'
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
        Top = 11
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
      object ETipoEfectoHasta: TLFEdit
        Left = 178
        Top = 33
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 4
      end
    end
    object Vencimiento: TGroupBox
      Left = 0
      Top = 477
      Width = 592
      Height = 78
      Align = alClient
      Caption = 'Vencimiento'
      TabOrder = 7
      object Desde: TLFLabel
        Left = 247
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Hasta: TLFLabel
        Left = 385
        Top = 24
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPDesde: TLFDateEdit
        Left = 284
        Top = 20
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnButtonClick = DTPDesdeClick
        OnClick = DTPDesdeClick
      end
      object DTPHasta: TLFDateEdit
        Left = 419
        Top = 20
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
        OnButtonClick = DTPHastaClick
        OnClick = DTPHastaClick
      end
      object RGVencimiento: TRadioGroup
        Left = 37
        Top = 11
        Width = 149
        Height = 62
        ItemIndex = 1
        Items.Strings = (
          'Ejercicio actual'
          'Todos los Vencimientos')
        TabOrder = 0
        OnClick = RGVencimientoClick
      end
      object CBImpagadosKRI: TLFCheckBox
        Left = 344
        Top = 43
        Width = 161
        Height = 17
        Caption = 'Solo Impagados'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object GBSerie: TGroupBox
      Left = 0
      Top = 301
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
  object EFCliente: TLFEditFind2000 [1]
    Left = 113
    Top = 223
    Width = 64
    Height = 21
    TabOrder = 0
    Visible = False
    OnChange = EFClienteChange
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
    SalirSiNoExiste = True
    Tabla_a_buscar = 'VER_CLIENTES_EF'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'CLIENTE')
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
  end
  object ECliente: TLFEdit [2]
    Left = 178
    Top = 223
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
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object EFAgente: TLFEditFind2000 [3]
    Left = 113
    Top = 271
    Width = 64
    Height = 21
    TabOrder = 3
    Visible = False
    OnChange = EFAgenteChange
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'AGENTE'
    CampoStr = 'TITULO'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = False
    SalirSiNoExiste = False
    Tabla_a_buscar = 'VER_AGENTES'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'AGENTE')
    Filtros = [obEmpresa]
    Entorno = DMMain.EntornoBusqueda
  end
  object EAgente: TLFEdit [4]
    Left = 178
    Top = 271
    Width = 247
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
    TabOrder = 4
    Visible = False
  end
  object RBOrdVencimiento: TRadioButton [5]
    Left = 498
    Top = 263
    Width = 67
    Height = 17
    Caption = 'x Venc.'
    Checked = True
    TabOrder = 5
    TabStop = True
    Visible = False
  end
  object RBOrdCliente: TRadioButton [6]
    Left = 498
    Top = 279
    Width = 89
    Height = 17
    Caption = 'Ord. x Cliente'
    TabOrder = 6
    Visible = False
  end
  inherited ALMain: TLFActionList
    Left = 529
    Top = 10
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBSoloNoRemesadosKRI.Checked'
      'RBOrdCliente.Checked'
      'RBOrdVencimiento.Checked'
      'CBExcluirRemesables.Checked')
  end
end
