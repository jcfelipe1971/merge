object FMDupArtEscandallo: TFMDupArtEscandallo
  Left = 323
  Top = 328
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Escandallo de Articulos'
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
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 26
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_In
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 88
      Height = 22
      DataSource = DMDupArtEscandallo.DSQMArticulos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 1
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TButtSep2: TToolButton
      Left = 88
      Top = 0
      Width = 8
      Style = tbsDivider
    end
    object EPMain: THYMEditPanel
      Left = 96
      Top = 0
      Width = 69
      Height = 22
      VisibleButtons = [neRango, neReport, neSalir]
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
      ControlEdit = CEMain
      OnClickRango = EPMainClickRango
      OnClickReport = EPMainClickReport
    end
    object TButtSep1: TToolButton
      Left = 165
      Top = 0
      Width = 8
      ImageIndex = 3
      Style = tbsDivider
    end
    object TButt_Escandallar: TToolButton
      Left = 173
      Top = 0
      Hint = 'Permitir Escandallar [Ctrl+Alt+E]'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = TButt_EscandallarClick
    end
    object TSep3: TToolButton
      Left = 196
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
  end
  object PNL_Busca_Articulo: TLFPanel
    Left = 0
    Top = 26
    Width = 592
    Height = 31
    Align = alTop
    Enabled = False
    PopupMenu = CEMainPMEdit
    TabOrder = 1
    object LArticuloOrigen: TLFLabel
      Left = 11
      Top = 9
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo Origen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEArt_Descrip_Or: TLFDbedit
      Left = 198
      Top = 5
      Width = 388
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMDupArtEscandallo.DSQMArticulos
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
    object DBEArticulos: TLFDbedit
      Left = 102
      Top = 5
      Width = 95
      Height = 21
      Color = clInfoBk
      DataField = 'ARTICULO'
      DataSource = DMDupArtEscandallo.DSQMArticulos
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
  end
  object DBGMain: TDBGridFind2000
    Left = 0
    Top = 88
    Width = 592
    Height = 255
    Align = alClient
    DataSource = DMDupArtEscandallo.DSQMEscandallo
    Enabled = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    AutoCambiarColumna = False
    AutoPostEnCheckBox = True
    AutoStartDrag = False
    AutoStartDragInterval = 0
    IndiceBitmapOrdenable = 0
    IndiceBitmapAscendente = 1
    IndiceBitmapChecked = 3
    IndiceBitmapDescendente = 2
    BaseDeDatos = DMMain.DataBase
    BuscarNums = True
    Campos.Strings = (
      'DETALLE')
    CamposAMostrar.Strings = (
      'DETALLE'
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
      'ARTICULO'
      'DETALLE'
      'EMPRESA'
      'P_COSTE'
      'TITULO')
    CamposNoAccMenosAlIns.Strings = (
      'DETALLE')
    ColumnasCheckBoxes.Strings = (
      'MARCADO')
    ColumnasChecked.Strings = (
      '1')
    ColumnasNoChecked.Strings = (
      '0')
    MensajeNoExiste = False
    Numericos.Strings = (
      'ARTICULO')
    SalirSiVacio = False
    SalirSiNoExiste = False
    Tablas.Strings = (
      'VER_ARTICULOS_CUENTAS          ')
    Titulos.Strings = (
      'TITULO')
    Posicion = tpCentrado
    OnBusqueda = DBGMainBusqueda
    OrdenMultiple = True
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'DETALLE'
        ReadOnly = True
        Width = 100
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
        ReadOnly = True
        Width = 260
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'P_COSTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 76
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'CANTIDAD'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARTICULO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Alignment = taRightJustify
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MARCADO'
        Title.Alignment = taCenter
        Width = 41
        Visible = True
      end>
  end
  object PNLDestino: TLFPanel
    Left = 0
    Top = 57
    Width = 592
    Height = 31
    Align = alTop
    TabOrder = 3
    object LArticuloDestino: TLFLabel
      Left = 5
      Top = 8
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EFArticulo: TLFEditFind2000
      Left = 102
      Top = 4
      Width = 95
      Height = 21
      TabOrder = 0
      OnChange = EFArticuloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEArt_Descrip_Dest: TLFDbedit
      Left = 198
      Top = 4
      Width = 388
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMDupArtEscandallo.DSXArticuloDest
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
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 288
    Top = 174
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 332
    Top = 174
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
      Visible = False
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
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
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
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
    object TSep2: TMenuItem
      Caption = '-'
    end
    object MIEscandallar2: TMenuItem
      Caption = 'Escandallar'
      Enabled = False
      Hint = 'Permitir Escandallar'
      ImageIndex = 19
      ShortCut = 49221
      Visible = False
    end
    object MISubescandallo2: TMenuItem
      Caption = 'Subescandallo'
      Hint = 'Mostrar Subescandallo'
      ImageIndex = 10
      ShortCut = 49235
      Visible = False
    end
  end
end
