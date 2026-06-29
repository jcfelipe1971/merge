object FMImputacionCostes: TFMImputacionCostes
  Left = 356
  Top = 229
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 1
  Caption = 'Imputaci'#243'n de Costes'
  ClientHeight = 442
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEImputacionesPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 201
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object TBPlanes: TLFToolBar
      Left = 2
      Top = 2
      Width = 638
      Height = 23
      ButtonHeight = 21
      EdgeBorders = []
      Flat = True
      TabOrder = 0
      Separators = True
      object CBPlanes: TLFComboBox
        Left = 0
        Top = 0
        Width = 636
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnSelect = CBPlanesSelect
      end
    end
    object TBMain: TLFToolBar
      Left = 2
      Top = 25
      Width = 638
      Height = 24
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object NavApuntes: THYMNavigator
        Left = 0
        Top = 0
        Width = 120
        Height = 22
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEApuntesPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEApuntes
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TSep2: TToolButton
        Left = 120
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PDocumento: TLFPanel
        Left = 128
        Top = 0
        Width = 441
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBLFecha: TLFLabel
          Left = 13
          Top = 3
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha'
        end
        object LBLTipo: TLFLabel
          Left = 128
          Top = 3
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo'
        end
        object LBLNumero: TLFLabel
          Left = 313
          Top = 3
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero'
        end
        object DBEDocFecha: TLFDbedit
          Left = 49
          Top = 0
          Width = 69
          Height = 21
          Color = clInfoBk
          DataField = 'DOC_FECHA'
          DataSource = DMImputacionCostes.DSQMApuntes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEDocTipo: TLFDbedit
          Left = 154
          Top = 0
          Width = 148
          Height = 21
          Color = clInfoBk
          DataSource = DMImputacionCostes.DSQMApuntes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEDocNumero: TLFDbedit
          Left = 355
          Top = 0
          Width = 84
          Height = 21
          Color = clInfoBk
          DataField = 'DOC_NUMERO'
          DataSource = DMImputacionCostes.DSQMApuntes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object LFPSeparador: TLFPanel
        Left = 569
        Top = 0
        Width = 16
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
      end
      object TButtRefrescar: TToolButton
        Left = 585
        Top = 0
        Hint = 'Refrescar datos'
        Caption = 'Refrescar'
        ImageIndex = 39
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object TSep3: TToolButton
        Left = 608
        Top = 0
        Width = 5
        Style = tbsSeparator
      end
      object TButtSalir: TToolButton
        Left = 613
        Top = 0
        Hint = 'Cerrar la ventana'
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object DBGFApuntes: TDBGridFind2000
      Left = 2
      Top = 49
      Width = 638
      Height = 150
      Align = alClient
      Color = clInfoBk
      DataSource = DMImputacionCostes.DSQMApuntes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGFApuntesDrawColumnCell
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DEBE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HABER'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEXTO'
          Width = 307
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_PROYECTO'
          Visible = True
        end>
    end
  end
  object PDetalle: TLFPanel
    Left = 0
    Top = 201
    Width = 642
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 642
      Height = 24
      EdgeBorders = []
      Flat = True
      TabOrder = 0
      Separators = True
      object NavImputaciones: THYMNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = DMImputacionCostes.DSQMImputaciones
        Flat = True
        ParentShowHint = False
        PopupMenu = CEImputacionesPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFImputaciones
        InsertaControl = DBGFImputaciones
        Exclusivo = True
        ControlEdit = CEImputaciones
        OrdenAscendente = True
        InsertaUltimo = False
        OnClickAfterAdjust = NavImputacionesClickAfterAdjust
      end
      object TSep1: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PPlantilla: TLFPanel
        Left = 248
        Top = 0
        Width = 385
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBLPlantilla: TLFLabel
          Left = 18
          Top = 3
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Plantilla'
        end
        object EFPlantilla: TLFEditFind2000
          Left = 59
          Top = 0
          Width = 37
          Height = 21
          TabOrder = 0
          OnChange = EFPlantillaChange
          OnEnter = EFPlantillaEnter
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PLANTILLA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ANA_PLANTILLAS_CC'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFPlantillaBusqueda
          OrdenadoPor.Strings = (
            'PLANTILLA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEPlantillaTitulo: TLFDbedit
          Left = 97
          Top = 0
          Width = 227
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMImputacionCostes.DSxPlantilla
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
    object DBGFImputaciones: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 642
      Height = 193
      Align = alClient
      DataSource = DMImputacionCostes.DSQMImputaciones
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGFImputacionesColEnter
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = True
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMImputacionCostes.TLocal
      BuscarNums = False
      Campos.Strings = (
        'CENTRO_COSTE')
      CamposAMostrar.Strings = (
        'CENTRO_COSTE'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposNoAccesibles.Strings = (
        'TITULO'
        'DIST_POSTERIOR')
      ColumnasCheckBoxes.Strings = (
        'DIST_POSTERIOR')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'CENTRO_COSTE')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'ANA_CENTROS_COSTE')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      OnBusqueda = DBGFImputacionesBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        '')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'CENTRO_COSTE'
          Width = 72
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 377
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORC'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIST_POSTERIOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 27
          Visible = True
        end>
    end
  end
  object TBActions: TLFToolBar
    Left = 0
    Top = 418
    Width = 642
    Height = 24
    Align = alBottom
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = DMMain.ILMain_Ac
    List = True
    ShowCaptions = True
    TabOrder = 2
    ActionList = ALMain
    Separators = True
  end
  object CEApuntes: TControlEdit
    EnlazadoA = CEImputaciones
    PopUpMenu = CEApuntesPMEdit
    Teclas = DMMain.Teclas
    Left = 392
    Top = 88
  end
  object CEImputaciones: TControlEdit
    EnlazadoA = CEApuntes
    PopUpMenu = CEImputacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 392
    Top = 128
  end
  object CEApuntesPMEdit: TPopUpTeclas
    Left = 432
    Top = 88
    object CEApuntesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEApuntesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEApuntesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEApuntesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEApuntesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEApuntesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEApuntesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEApuntesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEApuntesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEApuntesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEImputacionesPMEdit: TPopUpTeclas
    Left = 432
    Top = 128
    object CEImputacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEImputacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEImputacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEImputacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEImputacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEImputacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEImputacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImputacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImputacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImputacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 482
    Top = 128
    object AConfirmarImputacion: TAction
      Category = 'Procesos'
      Caption = 'Confirmar imputaci'#243'n'
      Hint = 'Confirmar imputaci'#243'n'
      ImageIndex = 19
      OnExecute = AConfirmarImputacionExecute
    end
    object AAsientosPorImputar: TAction
      Category = 'Procesos'
      Caption = 'Asientos por imputar'
      Hint = 'Asientos por imputar'
      ImageIndex = 70
      OnExecute = AAsientosPorImputarExecute
    end
    object AIrAlDocumento: TAction
      Category = 'Procesos'
      Caption = 'Ir al documento'
      Hint = 'Ir al documento'
      ImageIndex = 125
      OnExecute = AIrAlDocumentoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
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
    Left = 518
    Top = 128
  end
end
