object FMControlAgrupPedidos: TFMControlAgrupPedidos
  Left = 570
  Top = 227
  Width = 617
  Height = 319
  Caption = 'Resumen Agrupaci'#243'n de Pedidos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 26
    Width = 609
    Height = 266
    Align = alClient
    TabOrder = 0
    object DBGMain: TDBGridFind2000
      Left = 1
      Top = 1
      Width = 607
      Height = 264
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGMainDrawColumnCell
      OnDblClick = DBGMainDblClick
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
      IndiceBitmapAscendente = 2
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 1
      BaseDeDatos = DMMain.DataBase
      Transaction = DMControlErroresFactura.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'CANAL'
        'EJERCICIO'
        'EMPRESA'
        'RIG'
        'SERIE'
        'TEXTO_ERROR'
        'TIPO')
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
          FieldName = 'EJERCICIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 52
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 39
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 74
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 102
          Visible = True
        end>
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 609
    Height = 26
    AutoSize = True
    ButtonWidth = 25
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 110
      Height = 22
      DataSource = DMAgrupacionPedidosVentas.DSxDocumentos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TButtSalir: TToolButton
      Left = 110
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
    object TButtCanalDest: TToolButton
      Left = 135
      Top = 0
      Hint = 'Ir al canal destino'
      Caption = 'Ir al canal destino'
      ImageIndex = 25
      OnClick = TButtCanalDestClick
    end
  end
  object FSMain: TFormStorage
    UseRegistry = False
    StoredValues = <>
    Left = 296
    Top = 152
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 184
    Top = 104
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 120
    Top = 120
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
    end
  end
end
