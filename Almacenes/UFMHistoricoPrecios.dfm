inherited FMHistoricoPrecios: TFMHistoricoPrecios
  Left = 711
  Top = 120
  Width = 802
  Height = 495
  HelpContext = 135
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Hist'#243'rico de Precios'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 88
    object LAlmacen: TLFLabel [0]
      Left = 100
      Top = 48
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almac'#233'n'
    end
    object LArticulo: TLFLabel [1]
      Left = 104
      Top = 70
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo'
    end
    inherited TBMain: TLFToolBar
      Width = 788
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 4
      inherited NavMain: THYMNavigator
        Width = 176
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
        EditaControl = DBGFHistPrecios
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 0
      end
      inherited TSepTerc: TToolButton
        Left = 207
      end
      inherited TbuttComp: TToolButton
        Left = 215
      end
      object TSep1: TToolButton
        Left = 238
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBRefrescar: TToolButton
        Left = 246
        Top = 0
        Hint = 'Refrescar'
        Caption = 'TBRefrescar'
        ImageIndex = 39
        ParentShowHint = False
        ShowHint = True
        OnClick = TBRefrescarClick
      end
      object TSep2: TToolButton
        Left = 269
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBPonderarDocs: TToolButton
        Left = 277
        Top = 0
        Hint = 'Ponderar Documentos'
        Caption = 'TBPonderarDocs'
        ImageIndex = 40
        ParentShowHint = False
        ShowHint = True
        OnClick = TBPonderarDocsClick
      end
    end
    object EFArticulo: TLFEditFind2000
      Left = 145
      Top = 66
      Width = 100
      Height = 21
      TabOrder = 1
      OnChange = EFArticuloChange
      OnKeyDown = EFArticuloKeyDown
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EArticulo: TLFEdit
      Left = 246
      Top = 66
      Width = 380
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
      TabOrder = 2
    end
    object EFAlmacen: TLFEditFind2000
      Left = 145
      Top = 44
      Width = 100
      Height = 21
      TabOrder = 0
      OnChange = EFAlmacenChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      OnExiste = EFAlmacenExiste
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EAlmacen: TLFEdit
      Left = 246
      Top = 44
      Width = 380
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
      TabOrder = 3
    end
  end
  inherited TBActions: TLFToolBar
    Top = 88
    Width = 792
    TabOrder = 2
  end
  object PnDetalle: TLFPanel [2]
    Left = 0
    Top = 112
    Width = 792
    Height = 354
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object DBGFHistPrecios: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 792
      Height = 354
      Align = alClient
      Color = clInfoBk
      DataSource = DMHistoricoPrecios.DSQMHistPrecios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGFHistPreciosDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      Transaction = DMHistoricoPrecios.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposNoAccesibles.Strings = (
        'FECHA'
        'N_MOV_STOCK'
        'TIPO'
        'UNIDADES')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA_P'
          ReadOnly = True
          Width = 110
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO_OPER'
          ReadOnly = True
          Width = 25
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'N_MOV_STOCK'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_TIPO'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SERIE'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPRESA_O'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL_O'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN_O'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PMP'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 78
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    Left = 372
    Top = 16
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Images = DMMain.ILMain_Ac
    Left = 410
    Top = 16
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 670
    Top = 14
  end
end
