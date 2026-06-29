inherited FMPromoIndirectas: TFMPromoIndirectas
  Left = 232
  Top = 331
  Width = 801
  Height = 475
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Promociones Indirectas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 791
    Height = 422
    inherited TBMain: TLFToolBar
      Width = 787
      object TBttGenera: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Genera o Regenera la tabla'
        Caption = 'TBttGenera'
        ImageIndex = 39
        OnClick = TBttGeneraClick
      end
      object TButtTodas: TToolButton [1]
        Left = 23
        Top = 0
        Hint = 'Marcar todas las l'#237'neas'
        Caption = 'Todas'
        ImageIndex = 19
        OnClick = TButtTodasClick
      end
      object TButtDesmarcar: TToolButton [2]
        Left = 46
        Top = 0
        Hint = 'Quita la marca a todas las l'#237'neas'
        Caption = 'Desmarcar'
        ImageIndex = 27
        OnClick = TButtDesmarcarClick
      end
      object TSep1: TToolButton [3]
        Left = 69
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtListar: TToolButton [4]
        Left = 77
        Top = 0
        Hint = 'Listar Promociones'
        Caption = 'Listar'
        DropdownMenu = PMListar
        ImageIndex = 14
        Style = tbsDropDown
        OnClick = TButtListarClick
      end
      object TButtFacturar: TToolButton [5]
        Left = 113
        Top = 0
        Hint = 'Facturar Promociones'
        Caption = 'Facturar'
        ImageIndex = 61
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtFacturarClick
      end
      object TSep2: TToolButton [6]
        Left = 136
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 144
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object TBFiltroFecha: TLFToolBar
      Left = 2
      Top = 50
      Width = 787
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
      Wrapable = False
      Separators = True
      object PNLFechas: TLFPanel
        Left = 0
        Top = 0
        Width = 338
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LBLFechas: TLFLabel
          Left = 21
          Top = 6
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fechas'
        end
        object LBLFDesde: TLFLabel
          Left = 79
          Top = 5
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LBLFHasta: TLFLabel
          Left = 207
          Top = 4
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object DTPDesdeFecha: TLFDateEdit
          Left = 116
          Top = 0
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHastaFecha: TLFDateEdit
          Left = 243
          Top = 0
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object ToolButton3: TToolButton
        Left = 338
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLDocumentos: TLFPanel
        Left = 346
        Top = 0
        Width = 239
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBLDocumentos: TLFLabel
          Left = 12
          Top = 4
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Documentos'
        end
        object CBDocumentos: TLFComboBox
          Left = 78
          Top = 1
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Albaranes y Facturas'
            'Albaranes'
            'Facturas')
        end
      end
    end
    object TBFiltroClientes: TLFToolBar
      Left = 2
      Top = 28
      Width = 787
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
      Wrapable = False
      Separators = True
      object PNLClientes: TLFPanel
        Left = 0
        Top = 0
        Width = 769
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LBLClientes: TLFLabel
          Left = 19
          Top = 4
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Clientes'
        end
        object LBLCDesde: TLFLabel
          Left = 80
          Top = 4
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LBLCHasta: TLFLabel
          Left = 420
          Top = 4
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFClienteDesde: TLFEditFind2000
          Left = 116
          Top = 0
          Width = 59
          Height = 21
          TabOrder = 0
          OnChange = EFClienteDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloClienteDesde: TLFEdit
          Left = 176
          Top = 0
          Width = 231
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
          TabOrder = 1
        end
        object EFClienteHasta: TLFEditFind2000
          Left = 457
          Top = 0
          Width = 59
          Height = 21
          TabOrder = 2
          OnChange = EFClienteHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloClienteHasta: TLFEdit
          Left = 517
          Top = 0
          Width = 243
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
    end
    object DBGFPromoIndire: TDBGridFind2000
      Left = 2
      Top = 72
      Width = 787
      Height = 348
      Align = alClient
      DataSource = DMPromoIndirectas.DSQMPromociones
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 3
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
        'EJERCICIO'
        'TIPO'
        'RIG'
        'ARTICULO'
        'TITULO'
        'UNIDADES'
        'PRECIO')
      ColumnasCheckBoxes.Strings = (
        'MARCADO')
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
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          Width = 26
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Width = 341
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRECIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          Width = 30
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 422
    Width = 791
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  object PMListar: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 448
    Top = 32
    object MIConfigurarListado: TMenuItem
      Caption = 'Configurar listado'
      ImageIndex = 77
      OnClick = MIConfigurarListadoClick
    end
  end
end
