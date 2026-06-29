inherited FMRegInventarioUbicaciones: TFMRegInventarioUbicaciones
  Left = 278
  Top = 146
  Caption = 'Regularizaci'#243'n de Stock en Ubicaciones'
  ClientHeight = 424
  ClientWidth = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 620
    Height = 236
    inherited TBMain: TLFToolBar
      Width = 616
      TabOrder = 1
      object TBSeparador: TToolButton [0]
        Left = 0
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 8
        Width = 22
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtAceptar: TToolButton
        Left = 30
        Top = 0
        Hint = 'Aceptar Distribuci'#243'n'
        Caption = 'Aceptar Distribuci'#243'n'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
      object PNLArticulo: TLFPanel
        Left = 53
        Top = 0
        Width = 388
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBArticulo: TLFLabel
          Left = 10
          Top = 4
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art'#237'culo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DBEArticulo: TLFDbedit
          Left = 56
          Top = 0
          Width = 89
          Height = 21
          Color = clInfoBk
          DataField = 'ARTICULO'
          DataSource = DMRegInventarioUbicaciones.DSxArticulos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEDescripcion: TLFDbedit
          Left = 146
          Top = 0
          Width = 239
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRegInventarioUbicaciones.DSxArticulos
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
    end
    object DBGFRegInventario: TDBGridFind2000
      Left = 2
      Top = 50
      Width = 616
      Height = 184
      Align = alClient
      DataSource = DMRegInventarioUbicaciones.DSQMRegInventario
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 1
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
      BuscarNums = False
      Campos.Strings = (
        'UBICACION')
      CamposAMostrar.Strings = (
        'UBICACION'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CamposNoAccesibles.Strings = (
        'ID_A'
        'ID_DETALLES'
        'LINEA'
        'ARTICULO'
        'TIPO'
        'LINEA_UBICACION')
      MensajeNoExiste = False
      Numericos.Strings = (
        'COMPOSICION')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_ARTICULOS_UBICACIONES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO_DESCRIPCION')
      Posicion = tpCentrado
      OnBusqueda = DBGFRegInventarioBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_UBICACION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UBICACION'
          Width = 143
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescUbicacion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VOLUMEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PESO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIAMETRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 60
          Visible = True
        end>
    end
    object TBNav: TLFToolBar
      Left = 2
      Top = 28
      Width = 616
      Height = 22
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 2
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = DMRegInventarioUbicaciones.DSQMRegInventario
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
    end
  end
  object PNLStockUbicacion: TLFPanel [1]
    Left = 0
    Top = 236
    Width = 620
    Height = 164
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object DBGFStockUbicacion: TDBGridFind2000
      Left = 0
      Top = 22
      Width = 620
      Height = 142
      Align = alClient
      Color = clInfoBk
      DataSource = DMRegInventarioUbicaciones.DSQMStockUbi
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
          FieldName = 'COMPOSICION'
          Width = 143
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADAS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALIDAS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EXISTENCIAS'
          Width = 90
          Visible = True
        end>
    end
    object TBStockUbi: TLFToolBar
      Left = 0
      Top = 0
      Width = 620
      Height = 22
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object NavStockUbi: THYMNavigator
        Left = 0
        Top = 0
        Width = 110
        Height = 22
        DataSource = DMRegInventarioUbicaciones.DSQMStockUbi
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 400
    Width = 620
    EdgeBorders = []
    List = False
    TabOrder = 2
  end
  inherited CEMain: TControlEdit
    Left = 328
    Top = 72
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 80
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
    Left = 284
    Top = 74
  end
end
