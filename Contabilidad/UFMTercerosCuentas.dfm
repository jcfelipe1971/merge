object FMTercerosCuentas: TFMTercerosCuentas
  Left = 342
  Top = 289
  HelpContext = 73
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Cuentas asociadas a Terceros'
  ClientHeight = 447
  ClientWidth = 760
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 760
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    object TbuttTerCuentasEmpUna: TToolButton
      Left = 0
      Top = 0
      Hint = 
        'Asigna autom'#225'ticamente las Cuentas a Terceros para Empresa-Ejerc' +
        'icio-Canal actuales'
      Caption = 'Cuenta a Empresa'
      ImageIndex = 17
      OnClick = TbuttTerCuentasEmpUnaClick
    end
    object TbuttTerCuentasEmpTot: TToolButton
      Left = 23
      Top = 0
      Hint = 
        'Asigna autom'#225'ticamente las Cuentas a Terceros para todas las Emp' +
        'resa y Canales existentes en el sistema'
      Caption = 'Cuentas a Emp. Todas'
      ImageIndex = 132
      OnClick = TbuttTerCuentasEmpTotClick
    end
    object ToolButton4: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtBorraUna: TToolButton
      Left = 54
      Top = 0
      Hint = 
        'Elimina la asociaci'#243'n de Cuentas con Terceros para la Empresa-Ej' +
        'ercicio-Canal actual'
      Caption = 'Borra Cuenta'
      ImageIndex = 27
      OnClick = TButtBorraUnaClick
    end
    object TButtBorraTot: TToolButton
      Left = 77
      Top = 0
      Hint = 
        'Elimina la asociaci'#243'n de Cuentas con Terceros para todas las Emp' +
        'resas existentes en el sistema'
      Caption = 'Borra Cuentas'
      ImageIndex = 39
      OnClick = TButtBorraTotClick
    end
    object ToolButton1: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EFCuentas: TLFEditFind2000
      Left = 108
      Top = 0
      Width = 150
      Height = 22
      AutoSize = False
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      Visible = False
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = True
      CampoADevolver = 'CUENTA'
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_SUBCUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMTercerosCuentas.EFTerCuentas
    end
    object ToolButton2: TToolButton
      Left = 258
      Top = 0
      Width = 8
      Style = tbsSeparator
      Visible = False
    end
    object TButtVerSaldos: TToolButton
      Left = 266
      Top = 0
      Hint = 'Ver Saldos de tercero'
      Caption = 'Ver Saldos'
      ImageIndex = 125
      OnClick = TButtVerSaldosClick
    end
    object ToolButton3: TToolButton
      Left = 289
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TbuttSalir: TToolButton
      Left = 297
      Top = 0
      Hint = 'Abandonar esta ventana'
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TbuttSalirClick
    end
  end
  object TBTerceros: TLFToolBar
    Left = 0
    Top = 22
    Width = 760
    Height = 25
    ButtonHeight = 21
    EdgeBorders = []
    TabOrder = 1
    Separators = True
    object PNLTercero: TLFPanel
      Left = 0
      Top = 2
      Width = 623
      Height = 21
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLFLabel
        Left = 4
        Top = 0
        Width = 104
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = '&Digite el Tercero'
        FocusControl = EFTercero
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFTercero: TLFEditFind2000
        Left = 109
        Top = 0
        Width = 64
        Height = 21
        AutoSize = False
        PopupMenu = CEMainPMEdit
        TabOrder = 0
        OnChange = EFTerceroChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = True
        CampoADevolver = 'TERCERO'
        CampoNum = 'TERCERO'
        CampoStr = 'NOMBRE_COMERCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_TERCEROS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
      end
      object DBETitulo: TLFDbedit
        Left = 174
        Top = 0
        Width = 390
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DataField = 'NOMBRE_R_SOCIAL'
        DataSource = DMTercerosCuentas.DSxTerceros
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object DBGCuentas: THYTDBGrid
    Left = 0
    Top = 47
    Width = 760
    Height = 400
    Align = alClient
    Color = clInfoBk
    DataSource = DMTercerosCuentas.DSQMTercerosCuentas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    AutoDeseleccionar = True
    PermutaPaneles = False
    CamposAOrdenar.Strings = (
      'CANAL'
      'CUENTA'
      'EMPRESA'
      'GESTION'
      'TERCERO'
      'TITULO')
    CamposAOrdenarImgs = DMMain.ILOrdGrid
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Alignment = taRightJustify
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Alignment = taRightJustify
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Width = 464
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GESTION'
        Width = 33
        Visible = True
      end>
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 592
    Top = 16
    object SMInsertar: TMenuItem
      Caption = '&Insertar'
      Hint = 'Insertar un registro'
      OnClick = SMInsertarClick
    end
    object SMBorrar: TMenuItem
      Caption = '&Borrar'
      Hint = 'Eliminar un registro'
      OnClick = SMBorrarClick
    end
    object SMSaldos: TMenuItem
      Caption = '&Saldos'
      OnClick = TButtVerSaldosClick
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 644
    Top = 16
  end
end
