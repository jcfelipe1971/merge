inherited FMCierraDocCompras: TFMCierraDocCompras
  Left = 393
  Top = 368
  Width = 633
  Height = 453
  HelpContext = 180
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cierre Masivo de Documentos de Compras'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 623
    Height = 400
    inherited TBMain: TLFToolBar
      Width = 619
      TabOrder = 2
      inherited NavMain: THYMNavigator
        DataSource = DMCierraDocCompras.DSQMCabecerasAcre
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 3
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
      object LBLSerie: TLFLabel
        Left = 282
        Top = 0
        Width = 50
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '&Serie'
        FocusControl = DBLCBSerie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DBLCBSerie: TDBLookupComboBox
        Left = 332
        Top = 0
        Width = 133
        Height = 21
        DropDownWidth = 250
        KeyField = 'SERIE'
        ListField = 'SERIE;TITULO'
        ListFieldIndex = 1
        ListSource = DMCierraDocCompras.DSxSeries
        TabOrder = 1
        OnClick = TButtRefrescarClick
      end
      object TButtSep4: TToolButton
        Left = 465
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtTodos: TToolButton
        Left = 473
        Top = 0
        Hint = 'Marcar todos los Documentos'
        Caption = 'Todos'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodosClick
      end
      object TButtDesmarcar: TToolButton
        Left = 496
        Top = 0
        Hint = 'Quita la marca de todos los Documentos'
        Caption = 'Desmarcar'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesmarcarClick
      end
      object TButtRefrescar: TToolButton
        Left = 519
        Top = 0
        Hint = 'Refresca la informaci'#243'n en pantalla'
        Caption = 'Refrescar'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object TButtSep2: TToolButton
        Left = 542
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCerrar: TToolButton
        Left = 550
        Top = 0
        Hint = 'Cerrar Documentos Marcados'
        Caption = 'Cerrar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtCerrarClick
      end
      object TButtSep3: TToolButton
        Left = 573
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNTipoFactura: TLFPanel
        Left = 581
        Top = 0
        Width = 295
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object RBFacturaProveedor: TRadioButton
          Left = 12
          Top = 2
          Width = 140
          Height = 16
          Caption = 'Facturas de Proveedor'
          TabOrder = 0
          OnClick = RBFacturaProveedorClick
        end
        object RBFacturaAcreedor: TRadioButton
          Left = 149
          Top = 2
          Width = 140
          Height = 16
          Caption = 'Facturas de Acreedor'
          TabOrder = 1
          OnClick = RBFacturaAcreedorClick
        end
      end
    end
    object DBGProveedor: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 619
      Height = 370
      Align = alClient
      DataSource = DMCierraDocCompras.DSQMCabecerasPro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGProveedorDblClick
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
        'FECHA'
        'RIG'
        'CLIENTE'
        'TITULO')
      ColumnasCheckBoxes.Strings = (
        'ENTRADA')
      ColumnasChecked.Strings = (
        '2')
      ColumnasNoChecked.Strings = (
        '1')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clAqua
          Expanded = False
          FieldName = 'RIG'
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROVEEDOR'
          Width = 67
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Width = 298
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA'
          Width = 24
          Visible = True
        end>
    end
    object DBGAcreedor: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 619
      Height = 370
      Align = alClient
      DataSource = DMCierraDocCompras.DSQMCabecerasAcre
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGAcreedorDblClick
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
        'ACREEDOR'
        'RIG'
        'TITULO'
        'FECHA')
      ColumnasCheckBoxes.Strings = (
        'ENTRADA')
      ColumnasChecked.Strings = (
        '2')
      ColumnasNoChecked.Strings = (
        '1')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clAqua
          Expanded = False
          FieldName = 'RIG'
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ACREEDOR'
          Width = 67
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Width = 298
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA'
          Width = 35
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 400
    Width = 623
  end
  inherited CEMain: TControlEdit
    DataSource = DMCierraDocCompras.DSQMCabecerasAcre
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
  inherited FSMain: TLFFibFormStorage
    Left = 240
    Top = 120
  end
end
