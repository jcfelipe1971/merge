object ProFMMovStockOP: TProFMMovStockOP
  Left = 235
  Top = 209
  Width = 943
  Height = 359
  Caption = 'Movimientos Stocks OP'
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 935
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PCMain: TLFPageControl
      Left = 0
      Top = 24
      Width = 935
      Height = 308
      ActivePage = TSMovStock
      Align = alClient
      OwnerDraw = True
      Style = tsFlatButtons
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSArtMovStock: TTabSheet
        Caption = 'TSArtMovStock'
        TabVisible = False
        object DBGListado: TFIBHYGGridFind
          Left = 0
          Top = 0
          Width = 925
          Height = 296
          Align = alClient
          Color = clInfoBk
          DataSource = ProDMMovStockOP.DSxQMovStocks
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
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_OPER'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Desc_Articulo'
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_MOV_STOCK'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORIGEN'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_EXT'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_SIN_DTO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOV_VIRTUAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_A'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_MOV_STOCKS'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id_orden_llistat'
              Visible = True
            end>
        end
      end
      object TSMovStock: TTabSheet
        Caption = 'TSMovStock'
        ImageIndex = 1
        TabVisible = False
        object DBGMovStock: TFIBHYGGridFind
          Left = 0
          Top = 0
          Width = 927
          Height = 298
          Align = alClient
          Color = clInfoBk
          DataSource = ProDMMovStockOP.DSGesDetallesSt
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGMovStockDrawColumnCell
          OnDblClick = DBGFMovStockDblClick
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
          Columns = <
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORIGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_OPERACION'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_ORI'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_DST'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Width = 60
              Visible = True
            end>
        end
      end
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 935
      Height = 24
      AutoSize = True
      ButtonHeight = 24
      EdgeBorders = []
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object EPMain: THYMEditPanel
        Left = 0
        Top = 0
        Width = 20
        Height = 24
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 0
        Flat = True
        Exclusivo = True
      end
      object ToolButton1: TToolButton
        Left = 20
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescar: TToolButton
        Left = 28
        Top = 0
        Hint = 'Refrescar Datos'
        Caption = 'Refrescar Datos'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object PNLCabecera: TLFPanel
        Left = 51
        Top = 0
        Width = 529
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LFDescCompuesto: TLFEdit
          Left = 214
          Top = 3
          Width = 312
          Height = 21
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEIdOrden: TLFDbedit
          Left = 3
          Top = 3
          Width = 57
          Height = 21
          Color = clInfoBk
          DataField = 'ID_ORDEN'
          DataSource = ProDMMovStockOP.DSxOrden
          Enabled = False
          TabOrder = 1
        end
        object DBECompuesto: TLFDbedit
          Left = 61
          Top = 3
          Width = 152
          Height = 21
          Color = clInfoBk
          DataField = 'COMPUESTO'
          DataSource = ProDMMovStockOP.DSxOrden
          Enabled = False
          TabOrder = 2
          OnChange = DBECompuestoChange
        end
      end
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 478
    Top = 42
  end
end
