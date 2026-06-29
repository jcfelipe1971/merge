object ZFMMarcajes: TZFMMarcajes
  Left = 236
  Top = 152
  Width = 766
  Height = 576
  Caption = 'Marcajes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 758
    Height = 23
    ButtonHeight = 23
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 176
      Height = 23
      DataSource = ZDMMarcajes.DSQMMarcajes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
    object TSep1: TToolButton
      Left = 176
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 184
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtSalirClick
    end
    object TSep2: TToolButton
      Left = 207
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtBorraProcesados: TToolButton
      Left = 215
      Top = 0
      Hint = 'Borrar Marcajes Procesados'
      Caption = 'Borrar Marcajes Procesados'
      ImageIndex = 27
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtBorraProcesadosClick
    end
    object TButtBorraTodos: TToolButton
      Left = 238
      Top = 0
      Hint = 'Borrar Todos los Marcajes'
      Caption = 'Borrar Todos los Marcajes'
      ImageIndex = 27
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtBorraTodosClick
    end
  end
  object PnlMain: TLFPanel
    Left = 0
    Top = 23
    Width = 758
    Height = 413
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGFMarcajes: TDBGridFind2000
      Left = 0
      Top = 25
      Width = 758
      Height = 388
      Align = alClient
      DataSource = ZDMMarcajes.DSQMMarcajes
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
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
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
        'ID'
        'FECHA_LECTURA'
        'FECHA_PROCESADO'
        'PROCESADO')
      ColumnasCheckBoxes.Strings = (
        'PROCESADO')
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
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CADENA'
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
          FieldName = 'FECHA_LECTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 126
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_PROCESADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROCESADO'
          Width = 56
          Visible = True
        end>
    end
    object PnlNavFiltros: TLFPanel
      Left = 0
      Top = 0
      Width = 758
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LblEstado: TLFLabel
        Left = 6
        Top = 5
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object LblDesdeFecha: TLFLabel
        Left = 171
        Top = 5
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LblHastaFecha: TLFLabel
        Left = 334
        Top = 5
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object CBEstado: TLFComboBox
        Left = 42
        Top = 2
        Width = 116
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'No procesado'
        OnChange = CBEstadoChange
        Items.Strings = (
          'No procesado'
          'Procesado'
          'Todos los marcajes')
      end
      object DEDesde: TLFDateEdit
        Left = 238
        Top = 2
        Width = 90
        Height = 20
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object DEHasta: TLFDateEdit
        Left = 398
        Top = 2
        Width = 90
        Height = 20
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object ButtFiltrar: TButton
        Left = 496
        Top = 2
        Width = 49
        Height = 21
        Caption = 'Filtrar'
        TabOrder = 3
        OnClick = ButtFiltrarClick
      end
    end
  end
  object PnlDetalle: TLFPanel
    Left = 0
    Top = 436
    Width = 758
    Height = 113
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 758
      Height = 23
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 0
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 176
        Height = 22
        DataSource = ZDMMarcajes.DSQMIncidencias
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
      object PnlNavDet: TLFPanel
        Left = 176
        Top = 0
        Width = 281
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LblIncidencias: TLFLabel
          Left = 17
          Top = 5
          Width = 105
          Height = 13
          Caption = 'SIN INCIDENCIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 23
      Width = 758
      Height = 90
      Align = alClient
      DataSource = ZDMMarcajes.DSQMIncidencias
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
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 18
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CADENA'
          Width = 155
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CADENA_ERR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 153
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'INCIDENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescIncidencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 277
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_INCIDENCIA'
          Width = 229
          Visible = True
        end>
    end
  end
end
