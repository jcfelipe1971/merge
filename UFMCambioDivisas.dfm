object FMCambioDivisas: TFMCambioDivisas
  Left = 481
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cambio de Divisas'
  ClientHeight = 424
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
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GBDivisas: TGroupBox
      Left = 0
      Top = 29
      Width = 592
      Height = 108
      Align = alClient
      Caption = ' Datos de las divisas Origen y Destino '
      TabOrder = 0
      object LBLOrigen: TLFLabel
        Left = 16
        Top = 27
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Origen'
      end
      object LBLAlta: TLFLabel
        Left = 29
        Top = 49
        Width = 18
        Height = 13
        Alignment = taRightJustify
        Caption = 'Alta'
      end
      object LBLDestino: TLFLabel
        Left = 298
        Top = 28
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Destino'
      end
      object LBLBaja: TLFLabel
        Left = 26
        Top = 71
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = 'Baja'
      end
      object LBLCambio: TLFLabel
        Left = 299
        Top = 49
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cambio'
      end
      object LBLFactor: TLFLabel
        Left = 304
        Top = 71
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Factor'
      end
      object DBETOrigen: TLFDbedit
        Left = 92
        Top = 24
        Width = 190
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'T_ORIGEN'
        DataSource = DMCambioDivisas.DSxCambios
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBETDestino: TLFDbedit
        Left = 379
        Top = 24
        Width = 190
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'T_DESTINO'
        DataSource = DMCambioDivisas.DSxCambios
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEAlta: TLFDbedit
        Left = 51
        Top = 46
        Width = 121
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'F_ALTA'
        DataSource = DMCambioDivisas.DSxCambios
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEBaja: TLFDbedit
        Left = 51
        Top = 68
        Width = 121
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'F_BAJA'
        DataSource = DMCambioDivisas.DSxCambios
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBECambio: TLFDbedit
        Left = 338
        Top = 46
        Width = 121
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'CAMBIO'
        DataSource = DMCambioDivisas.DSxCambios
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEFactor: TLFDbedit
        Left = 338
        Top = 68
        Width = 121
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'FACTOR'
        DataSource = DMCambioDivisas.DSxCambios
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object EFDestino: TLFEditFind2000
        Left = 338
        Top = 24
        Width = 40
        Height = 21
        TabOrder = 1
        OnChange = EFDestinoChange
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
          'DEFECTO DESC, MONEDA')
        Filtros = []
      end
      object EFOrigen: TLFEditFind2000
        Left = 51
        Top = 24
        Width = 40
        Height = 21
        TabOrder = 0
        OnChange = EFOrigenChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'MONEDA'
          'TITULO')
        CampoNum = 'MONEDA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, MONEDA')
        Filtros = []
      end
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 592
      Height = 29
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      ActionList = ALMain
      Separators = True
      object TBSalir: TToolButton
        Left = 0
        Top = 0
        Action = ASalir
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtIntercambiarMonedas: TToolButton
        Left = 31
        Top = 0
        Action = AIntercambiarMonedas
      end
      object LCambios: TLFLabel
        Left = 54
        Top = 0
        Width = 498
        Height = 22
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object PHistDivisas: TLFPanel
    Left = 0
    Top = 137
    Width = 592
    Height = 287
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGMain: TDBGridFind2000
      Left = 0
      Top = 26
      Width = 592
      Height = 261
      Align = alClient
      DataSource = DMCambioDivisas.DSQMCambios
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'F_ALTA'
        'F_BAJA'
        'CAMBIO'
        'FACTOR')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'F_ALTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'F_BAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMBIO'
          Width = 110
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FACTOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARGO_LINEAL'
          Width = 110
          Visible = True
        end>
    end
    object TBCambios: TLFToolBar
      Left = 0
      Top = 0
      Width = 592
      Height = 26
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      ActionList = ALMain
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = DMCambioDivisas.DSQMCambios
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        OnClick = NavMainClick
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGMain
        InsertaControl = DBGMain
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton3: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
    end
  end
  object CEMain: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 248
    Top = 200
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 328
    Top = 200
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
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
    object CEMainMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
    end
    object CEMainMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
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
      Enabled = False
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango: TMenuItem
      Caption = 'Filtra rango'
      ShortCut = 16454
      Visible = False
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object CEMainMicopy: TMenuItem
      Caption = 'Copiar'
      Enabled = False
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
      Visible = False
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'EFOrigen.Text'
      'EFDestino.Text')
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 468
    Top = 20
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 480
    Top = 80
    object ASalir: TAction
      Caption = 'ASalir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AIntercambiarMonedas: TAction
      Caption = 'Intercambiar Monedas'
      Hint = 'Intercambiar Monedas'
      ImageIndex = 56
      OnExecute = AIntercambiarMonedasExecute
    end
  end
end
