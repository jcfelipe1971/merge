object ZFMPedidosMalCerrados: TZFMPedidosMalCerrados
  Left = 251
  Top = 139
  Width = 696
  Height = 480
  Caption = 'Pedidos Mal Cerrados'
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
  object LFPanel1: TLFPanel
    Left = 0
    Top = 29
    Width = 688
    Height = 424
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object DBGridFind20001: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 688
      Height = 424
      Align = alClient
      Color = clInfoBk
      DataSource = ZDMPedidosMalCerrados.DSQMPedidosMalCerrados
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
          FieldName = 'FECHA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Z_COD_BARRAS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 380
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ORDEN'
          Visible = True
        end>
    end
  end
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 26
    EdgeInner = esNone
    EdgeOuter = esNone
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object TSalir: TToolButton
      Left = 0
      Top = 2
      Hint = 'Salir'
      ImageIndex = 0
      OnClick = TSalirClick
    end
    object LFDateLeft: TLFDateEdit
      Left = 23
      Top = 2
      Width = 121
      Height = 22
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object LFDateRight: TLFDateEdit
      Left = 144
      Top = 2
      Width = 121
      Height = 22
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object TPedidosConAlbaran: TToolButton
      Left = 265
      Top = 2
      Hint = 'Pedidos Abiertos con Albar'#225'n'
      ImageIndex = 60
      OnClick = TPedidosConAlbaranClick
    end
    object TPedidosConOrdenAbierta: TToolButton
      Left = 288
      Top = 2
      Hint = 'Pedidos con orden abierta y estado cerrado'
      Caption = 'TPedidosConOrdenAbierta'
      ImageIndex = 116
      OnClick = TPedidosConOrdenAbiertaClick
    end
    object ToolButton2: TToolButton
      Left = 311
      Top = 2
      Hint = 'Procesar'
      ImageIndex = 16
      OnClick = ToolButton2Click
    end
  end
end
