inherited FMTarifaPArticulo: TFMTarifaPArticulo
  Left = 280
  Top = 196
  Width = 1233
  Height = 495
  HelpContext = 92
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Tarifas por Art'#237'culo'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1223
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 1219
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMTarifaPArticulo.DSQMTarifasArticulo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 69
        DataSource = DMTarifaPArticulo.DSQMTarifasArticulo
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 187
      end
      inherited TbuttComp: TToolButton
        Left = 195
      end
      object PNLTBMain: TLFPanel
        Left = 218
        Top = 0
        Width = 362
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBLTarifa: TLFLabel
          Left = 13
          Top = 3
          Width = 42
          Height = 16
          Alignment = taRightJustify
          Caption = 'Tarifa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EFTarifa: TLFEditFind2000
          Left = 58
          Top = 0
          Width = 63
          Height = 21
          TabOrder = 0
          OnChange = EFTarifaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TARIFA'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'activa=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_TARIFAS_C'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TARIFA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETarifa: TLFEdit
          Left = 122
          Top = 0
          Width = 237
          Height = 21
          Color = clInfoBk
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
      object TSep2: TToolButton
        Left = 580
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtBloqueaTodos: TToolButton
        Left = 588
        Top = 0
        Hint = 'Bloquea los precios de los articulos filtrados'
        Caption = 'Bloquea Todos'
        ImageIndex = 68
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtBloqueaTodosClick
      end
      object TButtDesbloqueaTodos: TToolButton
        Left = 611
        Top = 0
        Hint = 'Desbloquea los precios de los articulos filtrados'
        Caption = 'Desbloquea Todos'
        ImageIndex = 67
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesbloqueaTodosClick
      end
      object TSep3: TToolButton
        Left = 634
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBCambiaMargen: TToolButton
        Left = 642
        Top = 0
        Hint = 
          'Cambia Margen a los Art'#237'culos filtrados, incluidos los bloqueado' +
          's'
        Caption = 'Cambia Margen'
        ImageIndex = 110
        ParentShowHint = False
        ShowHint = True
        OnClick = TBCambiaMargenClick
      end
      object TSep4: TToolButton
        Left = 665
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImportarDesdeTarProvKri: TToolButton
        Left = 673
        Top = 0
        Hint = 'Importa precios de la una tarifa de proveedor.'
        Caption = 'Importar Desde Tar. Prov.'
        ImageIndex = 49
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtImportarDesdeTarProvKriClick
      end
      object TSep6: TToolButton
        Left = 696
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBDuplicarTarifa: TToolButton
        Left = 704
        Top = 0
        Hint = 'Duplicar tarifa'
        Caption = 'Duplicar Tarifa'
        ImageIndex = 37
        ParentShowHint = False
        ShowHint = True
        OnClick = TBDuplicarTarifaClick
      end
      object TSep7: TToolButton
        Left = 727
        Top = 0
        Width = 8
        ImageIndex = 38
        Style = tbsSeparator
      end
      object TBInfoStock: TToolButton
        Left = 735
        Top = 0
        Action = AInfoStock
      end
      object TEsp8: TToolButton
        Left = 758
        Top = 0
        Width = 8
        ImageIndex = 2
        Style = tbsSeparator
      end
      object TBCopiarTarifa: TToolButton
        Left = 766
        Top = 0
        Hint = 'Copiar Precios de otra Tarifa'
        Action = ACopiaTarifa
        ImageIndex = 42
      end
    end
    object DBGFTarifa: TDBGridFind2000
      Left = 2
      Top = 51
      Width = 1219
      Height = 389
      Align = alClient
      DataSource = DMTarifaPArticulo.DSQMTarifasArticulo
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGFTarifaCellClick
      OnDrawColumnCell = DBGFTarifaDrawColumnCell
      OnDblClick = DBGFTarifaDblClick
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
        'ARTICULO'
        'TITULO_ARTICULO'
        'CALCULO'
        'UNID_MINIMAS'
        'UNID_MAXIMAS'
        'PRECIO_BASE'
        'COMISION'
        'PRECIO_VENTA'
        'BLOQUEADO'
        'BARRAS'
        'SUBFAMILIA'
        'FAMILIA')
      CamposNoAccesibles.Strings = (
        'BARRAS'
        'FAMILIA'
        'SUBFAMILIA'
        'TITULO_ARTICULO'
        'CALCULO'
        'UNID_MINIMAS'
        'UNID_MAXIMAS'
        'PRECIO_BASE_CANAL'
        'COMISION_CANAL'
        'MARGEN_PC'
        'MARGEN_PV'
        '')
      ColumnasCheckBoxes.Strings = (
        'BLOQUEADO'
        'IVA_INCLUIDO'
        'BAJA'
        'ACTIVA')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0'
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 91
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BARRAS'
          ReadOnly = True
          Width = 91
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FAMILIA'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SUBFAMILIA'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_ARTICULO'
          ReadOnly = True
          Width = 185
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CALCULO'
          ReadOnly = True
          Width = 41
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNID_MINIMAS'
          ReadOnly = True
          Width = 63
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNID_MAXIMAS'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA'
          ReadOnly = True
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_COMPRA'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_COMPRA'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_COMPRA_2'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_COMPRA_3'
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRECIO_COSTE'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRECIO_BASE_CANAL'
          ReadOnly = True
          Width = 73
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COMISION_CANAL'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARGEN'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_VENTA'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BLOQUEADO'
          Width = 24
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MARGEN_PC'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MARGEN_PV'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_ARTICULO_TARIFA'
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRECIO_SIN_IVA'
          ReadOnly = True
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRECIO_CON_IVA'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IVA_INCLUIDO'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_IVA'
          ReadOnly = True
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_IVA'
          ReadOnly = True
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_1'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_2'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_3'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_4'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_5'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_6'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_7'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_8'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BLISTER'
          ReadOnly = True
          Width = 91
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_BLISTER'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE_BLISTER'
          ReadOnly = True
          Width = 70
          Visible = True
        end>
    end
    object PNLFiltros: TPanel
      Left = 2
      Top = 28
      Width = 1219
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        1219
        23)
      object LFamilia: TLFLabel
        Left = 8
        Top = 3
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Familia'
      end
      object LSubfamilia: TLFLabel
        Left = 357
        Top = 3
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Subfamilia'
      end
      object LArticulo: TLFLabel
        Left = 733
        Top = 3
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo contenga'
      end
      object EFFamilia: TLFEditFind2000
        Left = 44
        Top = 0
        Width = 63
        Height = 21
        TabOrder = 0
        OnChange = EFFamiliaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS                   '
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFamilia: TLFEdit
        Left = 108
        Top = 0
        Width = 241
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EFSubfamilia: TLFEditFind2000
        Left = 409
        Top = 0
        Width = 63
        Height = 21
        TabOrder = 2
        OnChange = EFSubfamiliaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SUBFAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_SUBFAMILIAS               '
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFSubfamiliaBusqueda
        OrdenadoPor.Strings = (
          'ORDEN')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object ESubfamilia: TLFEdit
        Left = 473
        Top = 0
        Width = 241
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object EArticulo: TEdit
        Left = 821
        Top = 0
        Width = 300
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Constraints.MaxWidth = 300
        TabOrder = 4
        OnChange = EArticuloChange
      end
      object CBArticulosBaja: TLFCheckBox
        Left = 1126
        Top = 3
        Width = 50
        Height = 17
        Caption = 'Baja'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBArticulosBajaChange
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 1223
  end
  inherited CEMain: TControlEdit
    DataSource = DMTarifaPArticulo.DSQMTarifasArticulo
    Left = 272
    Top = 116
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 332
    Top = 116
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 272
    Top = 152
    object AInfoStock: TAction
      Hint = 'Informaci'#243'n de Stocks'
      ImageIndex = 1
      OnExecute = AInfoStockExecute
    end
    object ACopiaTarifa: TAction
      Caption = 'Copiar Tarifa'
      OnExecute = ACopiaTarifaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 336
    Top = 152
  end
end
