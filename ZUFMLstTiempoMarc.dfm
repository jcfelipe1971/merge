object ZFMLstTiempoMarc: TZFMLstTiempoMarc
  Left = 220
  Top = 113
  Width = 800
  Height = 493
  Caption = 'Listado Tiempo Marcaje Manual'
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
  object PCMain: TLFPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 466
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PArriba: TLFPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 166
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LFFDesde: TLFLabel
        Left = 14
        Top = 45
        Width = 64
        Height = 13
        Caption = 'Fecha Desde'
      end
      object LFFHasta: TLFLabel
        Left = 232
        Top = 44
        Width = 61
        Height = 13
        Caption = 'Fecha Hasta'
      end
      object LFCliDesde: TLFLabel
        Left = 12
        Top = 69
        Width = 66
        Height = 13
        Caption = 'Cliente Desde'
      end
      object LFCliHasta: TLFLabel
        Left = 13
        Top = 94
        Width = 63
        Height = 13
        Caption = 'Cliente Hasta'
      end
      object LFLabel5: TLFLabel
        Left = 570
        Top = 45
        Width = 24
        Height = 13
        Caption = 'Serie'
        Visible = False
      end
      object LFOrden: TLFLabel
        Left = 23
        Top = 118
        Width = 53
        Height = 13
        Caption = 'Ordena por'
      end
      object LbTransporte: TLFLabel
        Left = 25
        Top = 141
        Width = 51
        Height = 13
        Caption = 'Transporte'
      end
      object LFToolBar1: TLFToolBar
        Left = 0
        Top = 0
        Width = 792
        Height = 29
        ButtonWidth = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object BtSalir: TToolButton
          Left = 0
          Top = 2
          Hint = 'Salir'
          Caption = 'Salir'
          ImageIndex = 0
          OnClick = BtSalirClick
        end
        object BtRecargar: TToolButton
          Left = 25
          Top = 2
          Caption = 'Recargar'
          ImageIndex = 26
          OnClick = BtRecargarClick
        end
        object BtEjecuta: TToolButton
          Left = 50
          Top = 2
          Hint = 'Muestra Listado'
          Caption = 'BtEjecuta'
          ImageIndex = 14
          OnClick = EjecutaListado
        end
      end
      object LFFechaDesde: TLFDateEdit
        Left = 83
        Top = 41
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object LFFechaHasta: TLFDateEdit
        Left = 299
        Top = 40
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object LFClienteDEsde: TLFEditFind2000
        Left = 83
        Top = 65
        Width = 77
        Height = 21
        TabOrder = 3
        OnChange = LFClienteDEsdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'CLIENTE'
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object LFClienteHasta: TLFEditFind2000
        Left = 83
        Top = 89
        Width = 77
        Height = 21
        TabOrder = 4
        OnChange = LFClienteHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object LFDescDesde: TLFEdit
        Left = 162
        Top = 64
        Width = 259
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 5
      end
      object LFDescHasta: TLFEdit
        Left = 162
        Top = 89
        Width = 259
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 6
      end
      object LFSerie: TLFEditFind2000
        Left = 603
        Top = 41
        Width = 42
        Height = 21
        TabOrder = 7
        Visible = False
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object CBOrder: TLFComboBox
        Left = 83
        Top = 113
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        Text = 'Corte'
        OnChange = EjecutaListado
        Items.Strings = (
          'C. Barras'
          'Cliente'
          'Corte'
          'Union'
          'Macarron'
          'Montaje'
          'Terminado'
          'Preparado'
          'F. Pedido'
          'Entrega Prev.'
          'Albaran')
      end
      object CBTransporte: TLFComboBox
        Left = 83
        Top = 137
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 9
        Text = 'Recoge'
        OnChange = EjecutaListado
        Items.Strings = (
          'Recoge'
          'Cami'#243'n'
          'Env'#237'o')
      end
    end
    object LFPanel2: TLFPanel
      Left = 0
      Top = 166
      Width = 792
      Height = 300
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGFLstMarcaje: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 792
        Height = 300
        Align = alClient
        Color = clInfoBk
        DataSource = ZDMLstTiempoMarc.DSQMListado
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGFLstMarcajeCellClick
        OnDrawColumnCell = DBGFLstMarcajeDrawColumnCell
        OnDblClick = DBGFLstMarcajeDblClick
        IniStorage = DMMain.FSLookAndFeel
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
        Transaction = ZDMLstTiempoMarc.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILMain_Ac
        CamposAOrdernar.Strings = (
          '')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          '')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'R_SERIE'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Z_COD_BARRAS'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_CLIENTE'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_DESC_CLIENTE'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_SU_REFERENCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_OPE_CORTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_CORTE'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_OPE_UNION'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_UNION'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_OPE_MACARRON'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_MACARRON'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_OPE_MONTAJE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_MONTAJE'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_OPE_TERMINADO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_TERMINADO'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_OPE_PREPARADO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_PREPARADO'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_ENTREGA_PREV'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_FECHA_ALBARAN'
            Visible = True
          end>
      end
    end
  end
end
