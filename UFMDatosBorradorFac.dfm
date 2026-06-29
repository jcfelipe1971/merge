object FMDatosBorradorFac: TFMDatosBorradorFac
  Left = 651
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Introducci'#243'n de datos para Factura de Borrador'
  ClientHeight = 447
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 26
    Width = 569
    Height = 421
    Align = alClient
    Enabled = False
    TabOrder = 0
    object LBLMaestro: TLFLabel
      Left = 90
      Top = 52
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Maestro'
    end
    object LBLTercero: TLFLabel
      Left = 91
      Top = 74
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tercero'
    end
    object LBLCuenta: TLFLabel
      Left = 94
      Top = 174
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuenta'
    end
    object LBLCuentaContrapartida: TLFLabel
      Left = 28
      Top = 197
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuenta Contrapartida'
    end
    object LBLTipoIva: TLFLabel
      Left = 87
      Top = 220
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo IVA'
    end
    object LBLFormaPago: TLFLabel
      Left = 71
      Top = 285
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Forma Pago'
    end
    object LBLBaseImponible: TLFLabel
      Left = 56
      Top = 263
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Base Imponible'
    end
    object LBLDocNumero: TLFLabel
      Left = 65
      Top = 306
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Doc. N'#250'mero'
    end
    object LBLDocSerie: TLFLabel
      Left = 78
      Top = 328
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Doc. Serie'
    end
    object LBLTipoFactura: TLFLabel
      Left = 13
      Top = 20
      Width = 135
      Height = 13
      Caption = 'FACTURA DE CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LModoIVA: TLFLabel
      Left = 81
      Top = 242
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modo IVA'
    end
    object LDireccion: TLFLabel
      Left = 83
      Top = 118
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Direcci'#243'n'
    end
    object LCodigoPostal: TLFLabel
      Left = 74
      Top = 140
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Postal'
    end
    object LProvincia: TLFLabel
      Left = 213
      Top = 140
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object LBLNIF: TLFLabel
      Left = 102
      Top = 96
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'N.I.F.'
    end
    object DBEFMaestro: TLFDBEditFind2000
      Left = 132
      Top = 49
      Width = 64
      Height = 21
      DataField = 'MAESTRO'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 0
      OnChange = DBEFMaestroChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_asociada.DesplegarBusqueda = False
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OnBusqueda = DBEFMaestroBusqueda
      Filtros = [obEmpresa, obEjercicio]
      Entorno = DMBorradorContabilidad.EntornoFind
    end
    object DBETitMaestro: TLFDbedit
      Left = 197
      Top = 49
      Width = 319
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
      TabOrder = 15
    end
    object DBEFTercero: TLFDBEditFind2000
      Left = 132
      Top = 71
      Width = 64
      Height = 21
      DataField = 'TERCERO'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 1
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'SYS_TERCEROS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'TERCERO'
      CampoStr = 'NOMBRE_R_SOCIAL'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = []
      Entorno = DMBorradorContabilidad.EntornoFind
    end
    object DBETitTercero: TLFDbedit
      Left = 197
      Top = 71
      Width = 319
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEFCuenta: TLFDBEditFind2000
      Left = 132
      Top = 171
      Width = 106
      Height = 21
      DataField = 'CUENTA'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 7
      OnKeyDown = TeclaExpandirCta
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'tipo = 5'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OnBusqueda = DBEFCuentaBusqueda
      OnVerificacion = ExpandirCadenaCta
      Filtros = [obEmpresa, obEjercicio]
      Entorno = DMBorradorContabilidad.EntornoFind
    end
    object DBETitCuenta: TLFDbedit
      Left = 239
      Top = 171
      Width = 277
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMBorradorContabilidad.DSxCuentas
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object DBEFCuenta_Con: TLFDBEditFind2000
      Left = 132
      Top = 193
      Width = 106
      Height = 21
      DataField = 'CUENTA_CON'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 8
      OnKeyDown = TeclaExpandirCta
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'tipo = 5'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OnBusqueda = DBEFCuenta_ConBusqueda
      OnVerificacion = ExpandirCadenaCta
      Filtros = [obEmpresa, obEjercicio]
      Entorno = DMBorradorContabilidad.EntornoFind
    end
    object DBETitCuenta_Con: TLFDbedit
      Left = 239
      Top = 193
      Width = 277
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMBorradorContabilidad.DSxCuentasCon
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object DBEBaseImponible: TLFDbedit
      Left = 132
      Top = 259
      Width = 98
      Height = 21
      DataField = 'BASE_IMPONIBLE'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 11
    end
    object DBETitFormaPago: TLFDbedit
      Left = 197
      Top = 281
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMBorradorContabilidad.DSxFormasPago
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
    end
    object DBEFForma_Pago: TLFDBEditFind2000
      Left = 132
      Top = 281
      Width = 64
      Height = 21
      DataField = 'FORMA_PAGO'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 12
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'FORMA_PAGO'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OnBusqueda = DBEFForma_PagoBusqueda
      Filtros = [obEmpresa, obEjercicio]
      Entorno = DMBorradorContabilidad.EntornoFind
    end
    object DBEDoc_Numero: TLFDbedit
      Left = 132
      Top = 303
      Width = 64
      Height = 21
      DataField = 'DOC_NUMERO'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 13
    end
    object DBEFSerie: TLFDBEditFind2000
      Left = 132
      Top = 325
      Width = 64
      Height = 21
      DataField = 'DOC_SERIE'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 14
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_CANALES_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'SERIE'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OnBusqueda = DBEFSerieBusqueda
      Filtros = [obEmpresa, obEjercicio]
      Entorno = DMBorradorContabilidad.EntornoFind
    end
    object DBETitSerie: TLFDbedit
      Left = 197
      Top = 325
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMBorradorContabilidad.DSxSerie
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
    end
    object DBETitModoIva: TLFDbedit
      Left = 197
      Top = 237
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMBorradorContabilidad.DSxModoIva
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 20
    end
    object DBEFTipoIva: TLFDBEditFind2000
      Left = 132
      Top = 215
      Width = 64
      Height = 21
      DataField = 'TIPO_IVA'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 9
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'SYS_TIPO_IVA'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'TIPO'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = [obPais]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEFModoIva: TLFDBEditFind2000
      Left = 132
      Top = 237
      Width = 64
      Height = 21
      DataField = 'MODO_IVA'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 10
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'SYS_MODO_IVA'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'MODO'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEDireccion: TLFDbedit
      Left = 132
      Top = 115
      Width = 384
      Height = 21
      DataField = 'DIRECCION'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 4
    end
    object DBECodPostal: TLFDbedit
      Left = 132
      Top = 137
      Width = 63
      Height = 21
      DataField = 'C_POSTAL'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      MaxLength = 5
      TabOrder = 5
    end
    object DBEProvincia: TLFDbedit
      Left = 261
      Top = 137
      Width = 255
      Height = 21
      DataField = 'PROVINCIA'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 6
    end
    object DBENif: TLFDbedit
      Left = 132
      Top = 93
      Width = 384
      Height = 21
      DataField = 'NIF'
      DataSource = DMBorradorContabilidad.DSQMAsientos
      TabOrder = 3
    end
    object DBETitTipoIva: TLFDbedit
      Left = 197
      Top = 215
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMBorradorContabilidad.DSxTipoIva
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 21
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 569
    Height = 26
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 88
      Height = 22
      VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      InsertaControl = DBEFMaestro
      OnClickBefore = NavMainClickBefore
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TBSeparador: TToolButton
      Left = 88
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPMain: THYMEditPanel
      Left = 96
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
      ControlEdit = CEMain
    end
    object TBSeparador2: TToolButton
      Left = 119
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBConfirma: TToolButton
      Left = 127
      Top = 0
      Action = AConfirmaDatos
      ParentShowHint = False
      ShowHint = True
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 358
    Top = 32
    object AConfirmaDatos: TAction
      Caption = 'Confirmar datos generales'
      Hint = 'Confirmar datos generales'
      ImageIndex = 19
      ShortCut = 16452
      OnExecute = AConfirmaDatosExecute
    end
  end
  object CEMain: TControlEdit
    PanelEdicion = PNLMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 232
    Top = 8
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 296
    Top = 32
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEMainMiSep: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEMainMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
end
