object FMInfoDetalle: TFMInfoDetalle
  Left = 428
  Top = 219
  HelpContext = 1417
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Datos Subescandallo'
  ClientHeight = 289
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GBSubnivel: TGroupBox
    Left = 0
    Top = 29
    Width = 504
    Height = 260
    Align = alClient
    Caption = 'Escandallo de Primer Nivel'
    TabOrder = 0
    object DBGFInfo: TDBGridFind2000
      Left = 2
      Top = 15
      Width = 500
      Height = 243
      Align = alClient
      Color = clInfoBk
      DataSource = DMArtEscandallo.DSxDetalle
      Enabled = False
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
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = [obEmpresa]
      Columns = <
        item
          Expanded = False
          FieldName = 'DETALLE'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPRESA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Visible = False
        end>
    end
  end
  object TBSubescandallo: TLFToolBar
    Left = 0
    Top = 0
    Width = 504
    Height = 29
    EdgeBorders = []
    TabOrder = 1
    Separators = True
    object HYMEPSubescandallo: THYMEditPanel
      Left = 0
      Top = 2
      Width = 25
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
  end
end
