inherited FMRecepcionAlbaranes: TFMRecepcionAlbaranes
  Left = 390
  Top = 236
  Width = 814
  Height = 607
  HelpContext = 177
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recepciones Web'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 804
    Height = 171
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 800
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 232
        DataSource = DMRecepcionAlbaranes.DSQMCabecera
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBGFAlbaranes
        InsertaControl = DBGFAlbaranes
      end
      inherited TSepNav: TToolButton
        Left = 232
      end
      inherited EPMain: THYMEditPanel
        Left = 240
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 273
      end
      inherited TbuttComp: TToolButton
        Left = 281
      end
      object TSep1: TToolButton
        Left = 304
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMarcarTodas: TToolButton
        Left = 312
        Top = 0
        Hint = 'Marca todas las recepciones'
        Caption = 'Marca todas las recepciones'
        ImageIndex = 146
        OnClick = TButtMarcarTodasClick
      end
      object TbuttDesmarcar: TToolButton
        Left = 335
        Top = 0
        Hint = 'Desmarcar todas las recepciones'
        Caption = 'Desmarcar todas las recepciones'
        ImageIndex = 147
        OnClick = TbuttDesmarcarClick
      end
      object TButtRegenera: TToolButton
        Left = 358
        Top = 0
        Hint = 'Genera o Regenera las recepciones'
        Caption = 'Regenera'
        ImageIndex = 26
        OnClick = TButtRegeneraClick
      end
      object TSep2: TToolButton
        Left = 381
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtTraspasa: TToolButton
        Left = 389
        Top = 0
        Hint = 'Traspaso a Albar'#225'n'
        Caption = 'Traspaso a Albar'#225'n'
        ImageIndex = 60
        OnClick = TButtTraspasaClick
      end
      object TbuttBorrarecepcion: TToolButton
        Left = 412
        Top = 0
        Hint = 'Borrar recepci'#243'n'
        Caption = 'Borrar recepci'#243'n'
        ImageIndex = 27
        OnClick = TbuttBorrarecepcionClick
      end
    end
    object DBGFAlbaranes: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 800
      Height = 141
      Align = alClient
      DataSource = DMRecepcionAlbaranes.DSQMCabecera
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
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
        'CANAL'
        'EJERCICIO'
        'EMPRESA'
        'ENTRADA'
        'FECHA'
        'ALBARAN'
        'CODIGO_PROVEEDOR'
        'TITULO_PROVEEDOR'
        'RECEPCIONAR'
        'SERIE')
      ColumnasCheckBoxes.Strings = (
        'RECEPCIONAR')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALBARAN'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 79
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CODIGO_PROVEEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_PROVEEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECEPCIONAR'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 554
    Width = 804
    TabOrder = 2
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 171
    Width = 804
    Height = 383
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 804
      Height = 383
      Align = alClient
      DataSource = DMRecepcionAlbaranes.DSQMDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
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
        'EMPRESA_E'
        'EJERCICIO_E'
        'CANAL_E'
        'SERIE_E'
        'RIG_E'
        'LINEA_E'
        'CANTIDAD_E'
        'ARTICULO'
        'TITULO_ART'
        'CANTIDAD'
        'ID_DETALLES_E'
        'ID_E')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_ART'
          ReadOnly = True
          Width = 307
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD_DISTRIBUIDA'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO_E'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 49
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANAL_E'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE_E'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 32
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG_E'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 42
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_E'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 36
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANTIDAD_E'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    Left = 732
    Top = 80
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 496
    Top = 96
  end
end
