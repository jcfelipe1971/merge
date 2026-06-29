object FMDatosLeasing: TFMDatosLeasing
  Left = 381
  Top = 331
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Introducci'#243'n Datos Leasing'
  ClientHeight = 343
  ClientWidth = 592
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 24
    Width = 592
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object LCuentaIVADiferido: TLFLabel
      Left = 10
      Top = 103
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuenta IVA Diferido'
    end
    object LCuentaGastosInt: TLFLabel
      Left = 15
      Top = 125
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuenta Gastos Int.'
    end
    object LCuentaAbonoGastos: TLFLabel
      Left = 17
      Top = 148
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cta Abono Gastos'
    end
    object LGastos: TLFLabel
      Left = 70
      Top = 169
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Gastos'
    end
    object LIntroduzcaDatos: TLFLabel
      Left = 9
      Top = 59
      Width = 102
      Height = 13
      Alignment = taRightJustify
      Caption = 'Introduzca Datos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEFIvaDif: TLFDBEditFind2000
      Left = 107
      Top = 99
      Width = 121
      Height = 21
      DataField = 'CTA_IVA_DIFERIDO'
      DataSource = DMDatosLeasing.DSQMDatosLeasing
      TabOrder = 1
      OnChange = DBEFIvaDifChange
      OnExit = DBEFIvaDifExit
      OnKeyDown = DBEFIvaDifKeyDown
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'tipo=5'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'CUENTA')
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMFacturasAAcr.EntornoDoc
    end
    object DBEFGastos: TLFDBEditFind2000
      Left = 107
      Top = 121
      Width = 121
      Height = 21
      DataField = 'CTA_GASTOS_INTERESES'
      DataSource = DMDatosLeasing.DSQMDatosLeasing
      TabOrder = 2
      OnChange = DBEFGastosChange
      OnExit = DBEFGastosExit
      OnKeyDown = DBEFGastosKeyDown
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'tipo=5'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'CUENTA')
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMFacturasAAcr.EntornoDoc
    end
    object DBEFAbonoGastos: TLFDBEditFind2000
      Left = 107
      Top = 143
      Width = 121
      Height = 21
      DataField = 'CTA_ABONO_GASTOS'
      DataSource = DMDatosLeasing.DSQMDatosLeasing
      TabOrder = 3
      OnChange = DBEFAbonoGastosChange
      OnExit = DBEFAbonoGastosExit
      OnKeyDown = DBEFAbonoGastosKeyDown
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'tipo=5'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'CUENTA')
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMFacturasAAcr.EntornoDoc
    end
    object DBEGastos: TLFDbedit
      Left = 107
      Top = 165
      Width = 121
      Height = 21
      DataField = 'GASTOS_LEASING'
      DataSource = DMDatosLeasing.DSQMDatosLeasing
      TabOrder = 4
    end
    object ETitIvaDif: TLFEdit
      Left = 229
      Top = 99
      Width = 354
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
      TabOrder = 5
    end
    object ETitGastos: TLFEdit
      Left = 229
      Top = 121
      Width = 354
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
      TabOrder = 6
    end
    object ETitAbonoGastos: TLFEdit
      Left = 229
      Top = 143
      Width = 354
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
      TabOrder = 7
    end
    object DBCBIvaDiferido: TLFDBCheckBox
      Left = 107
      Top = 77
      Width = 462
      Height = 17
      Caption = 'No usar cuenta de IVA diferido'
      ClicksDisabled = False
      TabOrder = 0
      TabStop = True
      OnClick = DBCBIvaDiferidoClick
      Alignment = taLeftJustify
      DataField = 'IVA_DIFERIDO'
      DataSource = DMDatosLeasing.DSQMDatosLeasing
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 24
    AutoSize = True
    EdgeBorders = [ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 88
      Height = 22
      DataSource = DMDatosLeasing.DSQMDatosLeasing
      VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = DBCBIvaDiferido
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TButtSep: TToolButton
      Left = 88
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 96
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
  end
  object CEMain: TControlEdit
    PanelEdicion = PNLMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 184
    Top = 8
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 216
    Top = 8
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
  end
end
