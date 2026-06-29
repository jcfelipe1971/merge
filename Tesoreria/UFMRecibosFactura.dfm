inherited FMRecibosFactura: TFMRecibosFactura
  Left = 449
  Top = 348
  Width = 881
  Height = 318
  HelpContext = 275
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recibos de Documento'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 871
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 867
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBGFRecibos: TDBGridFind2000
      Left = 2
      Top = 81
      Width = 867
      Height = 182
      Align = alClient
      DataSource = DMRecibosFactura.DSxRecibos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGFRecibosDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 2
      IndiceBitmapAscendente = 3
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 3
      Transaction = DMRecibosFactura.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposNoAccesibles.Strings = (
        'REGISTRO'
        'LINEA'
        'VENCIMIENTO'
        'PAGADO'
        'IMPAGADO'
        'LIQUIDO')
      ColumnasCheckBoxes.Strings = (
        'PAGADO'
        'IMPAGADO')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
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
          Color = clAqua
          Expanded = False
          FieldName = 'REGISTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clInfoBk
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 131
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PAGADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPAGADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TEXTO'
          Visible = True
        end>
    end
    object PNLCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 867
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LBLTipoFactura: TLFLabel
        Left = 17
        Top = 8
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo de Documento'
      end
      object LBLSerie: TLFLabel
        Left = 87
        Top = 30
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object LBLFactura: TLFLabel
        Left = 464
        Top = 30
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nro. Documento'
      end
      object LTotal: TLFLabel
        Left = 659
        Top = 30
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object EFSeries: TLFEditFind2000
        Left = 117
        Top = 26
        Width = 107
        Height = 21
        TabOrder = 0
        OnChange = EFSeriesChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFactura: TLFEdit
        Left = 548
        Top = 26
        Width = 107
        Height = 21
        TabOrder = 1
        OnChange = EFacturaChange
        OnKeyPress = EFacturaKeyPress
      end
      object DBSerie: TLFDbedit
        Left = 226
        Top = 26
        Width = 231
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRecibosFactura.DSxSeries
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
      object CBTipo: TLFComboBox
        Left = 117
        Top = 4
        Width = 164
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        OnChange = CBTipoChange
        Items.Strings = (
          'De Ofertas de cliente'
          'De Pedidos de cliente'
          'De Albaranes de cliente'
          'De Facturas de cliente'
          'De Proveedores'
          'De Acreedores')
      end
      object DBETotal: TLFDbedit
        Left = 688
        Top = 26
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'TOTAL'
        DataSource = DMRecibosFactura.DSxTotales
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 871
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
    Left = 520
    Top = 86
  end
end
