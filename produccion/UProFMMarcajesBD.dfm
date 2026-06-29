object ProFMMarcajesBD: TProFMMarcajesBD
  Left = 280
  Top = 109
  Width = 800
  Height = 500
  Caption = 'Mantenimiento de Marcajes Directos a BD'
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
    Width = 792
    Height = 23
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 80
      Height = 22
      DataSource = ProDMMarcajesBD.DSQMMarcajes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
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
      Left = 80
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 88
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtSalirClick
    end
    object TSep2: TToolButton
      Left = 111
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtBorraProcesados: TToolButton
      Left = 119
      Top = 0
      Hint = 'Borrar Marcajes Procesados'
      Caption = 'Borrar Marcajes Procesados'
      ImageIndex = 27
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtBorraProcesadosClick
    end
    object ToolButton1: TToolButton
      Left = 142
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TMarcajeManual: TToolButton
      Left = 150
      Top = 0
      Hint = 'Marcaje Manual'
      Caption = 'TMarcajeManual'
      ImageIndex = 23
      OnClick = TMarcajeManualClick
    end
    object TBorrarMarcaje: TToolButton
      Left = 173
      Top = 0
      Hint = 'Borrar Marcaje'
      Caption = 'Borrar Marcaje'
      ImageIndex = 22
      OnClick = TBorrarMarcajeClick
    end
  end
  object PnlMain: TLFPanel
    Left = 0
    Top = 23
    Width = 792
    Height = 253
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGFMarcajes: TDBGridFind2000
      Left = 0
      Top = 25
      Width = 792
      Height = 228
      Align = alClient
      Color = clInfoBk
      DataSource = ProDMMarcajesBD.DSQMMarcajes
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
      Campos.Strings = (
        'CADENA'
        'PROCESADO'
        'FECHA_LECTURA'
        'FECHA_PROCESADO')
      CamposAMostrar.Strings = (
        'CADENA'
        '0'
        'PROCESADO'
        '0'
        'FECHA_LECTURA'
        '0'
        'FECHA_PROCESADO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'FECHA_LECTURA'
        'FECHA_PROCESADO'
        'PROCESADO')
      MensajeNoExiste = False
      Numericos.Strings = (
        '(por asignar)'
        '(por asignar)'
        '(por asignar)'
        '(por asignar)')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        '(por asignar)'
        '(por asignar)'
        '(por asignar)'
        '(por asignar)')
      Acciones.Strings = (
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        '(por asignar)'
        '(por asignar)'
        '(por asignar)'
        '(por asignar)')
      Posicion = tpCentrado
      Planes.Strings = (
        ''
        ''
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        '')
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CADENA'
          Width = 251
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_LECTURA'
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_PROCESADO'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROCESADO'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TAREA'
          Visible = True
        end>
    end
    object PnlNavFiltros: TLFPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LblEstado: TLFLabel
        Left = 6
        Top = 6
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object LblDesdeFecha: TLFLabel
        Left = 172
        Top = 7
        Width = 64
        Height = 13
        Caption = 'Desde Fecha'
      end
      object LblHastaFecha: TLFLabel
        Left = 335
        Top = 7
        Width = 61
        Height = 13
        Caption = 'Hasta Fecha'
      end
      object CBEstado: TLFComboBox
        Left = 41
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
        OnChange = DEDesdeChange
      end
      object DEHasta: TLFDateEdit
        Left = 398
        Top = 2
        Width = 90
        Height = 20
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
        OnChange = DEHastaChange
      end
      object ButtFiltrar: TButton
        Left = 496
        Top = 2
        Width = 37
        Height = 21
        Caption = 'Filtrar'
        TabOrder = 3
        OnClick = ButtFiltrarClick
      end
    end
  end
  object PnlDetalle: TLFPanel
    Left = 0
    Top = 276
    Width = 792
    Height = 197
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 792
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
        Width = 198
        Height = 22
        DataSource = ProDMMarcajesBD.DSQMIncidencias
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
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
        Left = 198
        Top = 0
        Width = 281
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LblIncidencias: TLFLabel
          Left = 21
          Top = 5
          Width = 105
          Height = 13
          Caption = 'SIN INCIDENCIAS'
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 23
      Width = 792
      Height = 174
      Align = alClient
      DataSource = ProDMMarcajesBD.DSQMIncidencias
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
        'HORA_LECTURA'
        'INCIDENCIA')
      CamposAMostrar.Strings = (
        'HORA_LECTURA'
        '0'
        'INCIDENCIA'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CamposAOrdernar.Strings = (
        'ID')
      MensajeNoExiste = False
      Numericos.Strings = (
        '(por asignar)'
        '(por asignar)')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        '(por asignar)'
        '(por asignar)')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        '(por asignar)'
        '(por asignar)')
      Posicion = tpCentrado
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        '')
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CADENA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_LECTURA'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INCIDENCIA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_INCIDENCIA'
          Width = 132
          Visible = True
        end>
    end
  end
end
