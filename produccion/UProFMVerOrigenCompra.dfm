object ProFMVerOrigenCompra: TProFMVerOrigenCompra
  Left = 247
  Top = 170
  Width = 882
  Height = 300
  Caption = 'Origen de la Compra'
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
  object PnlMain: TLFPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 273
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGFOrigen: TDBGridFind2000
      Left = 0
      Top = 23
      Width = 874
      Height = 250
      Align = alClient
      Color = clInfoBk
      DataSource = ProDMOrden.DSxDatosCompra
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
      OnDblClick = DBGFOrigenDblClick
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
          FieldName = 'TIPO_COMPRA'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_DOC'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UDS_UTILIZADAS'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_PROV'
          Width = 273
          Visible = True
        end>
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 874
      Height = 23
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object TBSalir: TToolButton
        Left = 0
        Top = 0
        Caption = 'Cerrar la ventana'
        ImageIndex = 0
        OnClick = TBSalirClick
      end
    end
  end
end
