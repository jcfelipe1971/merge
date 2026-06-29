object FPregSerializacion: TFPregSerializacion
  Left = 580
  Top = 374
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Listado de CB Serializados'
  ClientHeight = 358
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LBLEtiquetasVacias: TLFLabel
      Left = 11
      Top = 52
      Width = 81
      Height = 13
      Caption = 'Etiquetas Vac'#237'as'
    end
    object LBLNumColumnas: TLFLabel
      Left = 176
      Top = 52
      Width = 61
      Height = 13
      Caption = 'N'#186' Columnas'
    end
    object LBLNumCopias: TLFLabel
      Left = 315
      Top = 52
      Width = 47
      Height = 13
      Caption = 'N'#186' Copias'
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 504
      Height = 41
      ButtonHeight = 36
      ButtonWidth = 72
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_In
      Images = DMMain.ILMain_Ac
      ShowCaptions = True
      TabOrder = 0
      Separators = True
      object TButtPrevisualizar: TToolButton
        Left = 0
        Top = 0
        Action = APrevisualizar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtImprimir: TToolButton
        Left = 72
        Top = 0
        Action = AImprimir
        ParentShowHint = False
        ShowHint = True
      end
      object TButtSalir: TToolButton
        Left = 144
        Top = 0
        Action = ASalir
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfiguracion: TToolButton
        Left = 216
        Top = 0
        Action = AConfiguracion
        DropdownMenu = PMConfiguracion
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
    end
    object EDTEtiVacias: TLFEdit
      Left = 98
      Top = 48
      Width = 51
      Height = 21
      TabOrder = 1
    end
    object EDTNColumnas: TLFEdit
      Left = 243
      Top = 48
      Width = 51
      Height = 21
      TabOrder = 2
      OnChange = EDTNColumnasChange
    end
    object EDTNCopias: TLFEdit
      Left = 367
      Top = 48
      Width = 51
      Height = 21
      TabOrder = 3
    end
  end
  object PDetalle: TLFPanel
    Left = 0
    Top = 81
    Width = 504
    Height = 277
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 504
      Height = 26
      EdgeBorders = []
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 2
        Width = 198
        Height = 22
        DataSource = DMLstSerializacion.DSQMImpresion
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 26
      Width = 504
      Height = 251
      Align = alClient
      DataSource = DMLstSerializacion.DSQMImpresion
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
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
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'NUM_SERIE')
      CamposAMostrar.Strings = (
        'NUM_SERIE'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      Numericos.Strings = (
        'NSERIE')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'ART_ARTICULOS_SERIALIZACION')
      Titulos.Strings = (
        'ARTICULO')
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = [obEmpresa, obCanal]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'NUM_SERIE'
          Width = 152
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
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
          FieldName = 'DESCRIPCION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 223
          Visible = True
        end>
    end
  end
  object ALSerializacion: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 366
    Top = 163
    object APrevisualizar: TAction
      Caption = '&Previsualizar'
      Hint = 'Previsualizaci'#243'n del Listado'
      ImageIndex = 19
      OnExecute = APrevisualizarExecute
    end
    object AImprimir: TAction
      Caption = '&Imprimir'
      Hint = 'Impresi'#243'n del Listado'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Salir de la ventana'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AConfiguracion: TAction
      Caption = 'Configuraci'#243'n'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = Listadode2columnas1Click
    end
  end
  object PMConfiguracion: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 306
    Top = 159
    object Listadode2columnas2: TMenuItem
      Caption = 'Listado de 2 columnas'
      ImageIndex = 77
      OnClick = Listadode2columnas1Click
    end
    object Listadode3columnas2: TMenuItem
      Caption = 'Listado de 3 columnas'
      ImageIndex = 77
      OnClick = Listadode3columnas1Click
    end
    object Listadode4columnas2: TMenuItem
      Caption = 'Listado de 4 columnas'
      ImageIndex = 77
      OnClick = Listadode4columnas1Click
    end
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 320
    Top = 240
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 364
    Top = 240
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
