inherited FMImprimeRecibos: TFMImprimeRecibos
  Left = 413
  Top = 399
  Width = 802
  Height = 495
  HelpContext = 208
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Impresi'#243'n autom'#225'tica de Recibos'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 788
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 2
      DesignSize = (
        784
        22)
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMImprimeRecibos.DSQMRecibos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 110
        Width = 46
        DataSource = DMImprimeRecibos.DSQMRecibos
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepNav: TToolButton [2]
        Left = 156
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
      object TButtSeparador2: TToolButton
        Left = 195
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TbuttMarcar: TToolButton
        Left = 203
        Top = 0
        Hint = 'Marcar todos los Pedidos'
        Caption = 'Marcar'
        ImageIndex = 146
        OnClick = TbuttMarcarClick
      end
      object TButtCancelar: TToolButton
        Left = 226
        Top = 0
        Hint = 'Desmarcar todos los Pedidos'
        Caption = 'Cancelar'
        ImageIndex = 147
        OnClick = TButtCancelarClick
      end
      object TButtSeparador1: TToolButton
        Left = 249
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimir: TToolButton
        Left = 257
        Top = 0
        Hint = 'Listados'
        Caption = 'Imprimir'
        DropdownMenu = PMImprime
        ImageIndex = 14
        Style = tbsDropDown
        OnClick = MIImprimirRecibosClick
      end
      object ToolButton1: TToolButton
        Left = 293
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 301
        Top = 0
        Width = 8
        Enabled = False
        Style = tbsSeparator
      end
      object TButtRefrescarKri: TToolButton
        Left = 309
        Top = 0
        Hint = 'Refrescar'
        Caption = 'Refrescar'
        ImageIndex = 39
        OnClick = TButtRefrescarKriClick
      end
      object ToolButton2: TToolButton
        Left = 332
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LTipo: TLFLabel
        Left = 340
        Top = 0
        Width = 40
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object CBSigno: TLFComboBox
        Left = 380
        Top = 0
        Width = 97
        Height = 21
        Hint = 'Signo de la operaci'#243'n'
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = 'Cobros'
        OnChange = CBSignoChange
        Items.Strings = (
          'Cobros'
          'Pagos')
      end
      object CBDocsPendientes: TLFCheckBox
        Left = 477
        Top = 0
        Width = 171
        Height = 22
        Caption = 'Solo documentos pendientes'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
        OnChange = CBDocsPendientesChange
      end
    end
    object HYTDBGRecibos: THYTDBGrid
      Left = 2
      Top = 129
      Width = 788
      Height = 311
      Align = alClient
      BorderStyle = bsNone
      Color = clInfoBk
      DataSource = DMImprimeRecibos.DSQMRecibos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = HYTDBGRecibosCellClick
      OnDrawColumnCell = HYTDBGRecibosDrawColumnCell
      OnDblClick = HYTDBGRecibosDblClick
      OnKeyDown = HYTDBGRecibosKeyDown
      OnKeyUp = HYTDBGRecibosKeyUp
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAMarcar.Strings = (
        'ACEPTADO'
        'IMPAGADO'
        'LISTADO'
        'PAGADO'
        'RECIBIDO'
        'REMESAR')
      CamposChecked.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1'
        '1')
      CamposNoChecked.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposAOrdenar.Strings = (
        'ACEPTADO'
        'BANCO'
        'CANAL'
        'COD_CLI_PRO'
        'CTA_PAGO'
        'DOC_FECHA'
        'DOC_NUMERO'
        'DOC_SERIE'
        'DOC_TIPO'
        'EJERCICIO'
        'ESTADO'
        'ESTADO_RECIBO'
        'FECHA_CIERRE'
        'FECHA_REGISTRO'
        'FECHA_VALOR'
        'FOLIO'
        'FORMA_PAGO'
        'FP_TITULO'
        'IMPAGADO'
        'LIQUIDO'
        'LISTADO'
        'MONEDA'
        'NOMBRE_R_SOCIAL'
        'NUM_FACTURA'
        'PAGADO'
        'RECIBIDO'
        'REGISTRO'
        'REMESA'
        'TIPO_DOC_TRIBUTARIO'
        'TIPO_EFECTO'
        'VENCIMIENTO')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'REGISTRO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REGISTRO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CLI_PRO'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_R_SOCIAL'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_EFECTO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SERIE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_FACTURA'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LISTADO'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMESA'
          Width = 50
          Visible = True
        end>
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 28
      Width = 788
      Height = 101
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LDesde: TLFLabel
        Left = 201
        Top = 6
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHasta: TLFLabel
        Left = 299
        Top = 6
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LAgente: TLFLabel
        Left = 462
        Top = 27
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LDesdeCliente: TLFLabel
        Left = 473
        Top = 5
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaCliente: TLFLabel
        Left = 572
        Top = 5
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDocumento: TLabel
        Left = 145
        Top = 6
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LCodCliPro: TLabel
        Left = 426
        Top = 5
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFactura: TLabel
        Left = 149
        Top = 71
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Factura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LDesdeFactura: TLFLabel
        Left = 201
        Top = 71
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFactura: TLFLabel
        Left = 299
        Top = 71
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LSerie: TLFLabel
        Left = 41
        Top = 71
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFormaPago: TLFLabel
        Left = 124
        Top = 27
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Forma Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LDesdeFormaPago: TLFLabel
        Left = 201
        Top = 28
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFormaPago: TLFLabel
        Left = 299
        Top = 28
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LTipoEfecto: TLFLabel
        Left = 125
        Top = 49
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Efecto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTipoEfectoDesde: TLFLabel
        Left = 201
        Top = 50
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LTipoEfectoHasta: TLFLabel
        Left = 299
        Top = 50
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EDesdeDocumento: TLFEdit
        Left = 237
        Top = 2
        Width = 50
        Height = 21
        TabOrder = 0
      end
      object EHastaDocumento: TLFEdit
        Left = 332
        Top = 2
        Width = 50
        Height = 21
        TabOrder = 1
      end
      object BtnFiltrar: TButton
        Left = 480
        Top = 59
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 12
        OnClick = BtnFiltrarClick
      end
      object BtnLimpiar: TButton
        Left = 560
        Top = 59
        Width = 75
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 13
        OnClick = BtnLimpiarClick
      end
      object EFAgente: TLFEditFind2000
        Left = 509
        Top = 24
        Width = 50
        Height = 21
        TabOrder = 11
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
        Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDesdeCliente: TLFEditFind2000
        Left = 509
        Top = 2
        Width = 50
        Height = 21
        TabOrder = 9
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
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCliente: TLFEditFind2000
        Left = 604
        Top = 2
        Width = 50
        Height = 21
        TabOrder = 10
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
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeFactura: TLFEdit
        Left = 237
        Top = 68
        Width = 50
        Height = 21
        TabOrder = 7
        Text = '7'
      end
      object EHastaFactura: TLFEdit
        Left = 332
        Top = 68
        Width = 50
        Height = 21
        TabOrder = 8
        Text = '8'
      end
      object EFSerie: TLFEditFind2000
        Left = 77
        Top = 68
        Width = 50
        Height = 21
        TabOrder = 6
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDesdeFormaPago: TLFEditFind2000
        Left = 237
        Top = 24
        Width = 50
        Height = 21
        TabOrder = 2
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FORMA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FORMA')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaFormaPago: TLFEditFind2000
        Left = 332
        Top = 24
        Width = 50
        Height = 21
        TabOrder = 3
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FORMA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FORMA')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTipoEfectoDesde: TLFEditFind2000
        Left = 237
        Top = 46
        Width = 50
        Height = 21
        TabOrder = 4
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
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTipoEfectoHasta: TLFEditFind2000
        Left = 332
        Top = 46
        Width = 50
        Height = 21
        TabOrder = 5
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
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 792
  end
  inherited CEMain: TControlEdit
    DataSource = DMImprimeRecibos.DSQMRecibos
    Left = 640
    Top = 93
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 672
    Top = 96
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 688
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 728
    Top = 0
  end
  object PMImprime: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 640
    Top = 58
    object MIImprimirRecibos: TMenuItem
      Caption = 'Imprimir Recibos'
      Hint = 'Imprimir Recibos'
      ImageIndex = 14
      OnClick = MIImprimirRecibosClick
    end
    object MIImprimirRecibosFiltrados: TMenuItem
      Caption = 'Imprimir Recibos Filtrados'
      Hint = 'Imprimir Recibos Filtrados'
      ImageIndex = 14
      OnClick = MIImprimirRecibosFiltradosClick
    end
    object MIEnvioPDF: TMenuItem
      Caption = 'Env'#237'o por e-mail en pdf'
      Enabled = False
      ImageIndex = 34
      Visible = False
      OnClick = MIEnvioPDFClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MIConfiguracionRapida: TMenuItem
      Caption = 'Configuraci'#243'n R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida'
      ImageIndex = 77
      OnClick = MIConfiguracionRapidaClick
    end
  end
end
