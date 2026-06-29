object ProFMMostrarStock: TProFMMostrarStock
  Left = 300
  Top = 204
  BorderStyle = bsDialog
  Caption = 'Disponibilidad de Stock'
  ClientHeight = 393
  ClientWidth = 511
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 393
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGStock: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 511
      Height = 336
      Align = alClient
      Color = clInfoBk
      DataSource = ProDMOrden.DSTmpStock
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
          FieldName = 'ID_ORDEN'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBORDEN'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_MAT'
          Width = 53
          Visible = True
        end>
    end
    object PNLBotones: TLFPanel
      Left = 0
      Top = 336
      Width = 511
      Height = 57
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object LCancelarOSeguir: TLFLabel
        Left = 4
        Top = 29
        Width = 245
        Height = 13
        Caption = #191'Quiere cancelar el lanzamiento o seguir sin stock? '
      end
      object LFMuestraTodos: TLFCheckBox
        Left = 5
        Top = 4
        Width = 496
        Height = 17
        Caption = 
          'Mostrar todos (por defecto se muestran los que no permiten stock' +
          ' negativo)'
        ClicksDisabled = False
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        OnChange = LFMuestraTodosChange
      end
      object BSeguir: TBitBtn
        Left = 329
        Top = 24
        Width = 80
        Height = 30
        Caption = '&Seguir'
        Default = True
        ModalResult = 6
        TabOrder = 1
        OnClick = BSeguirClick
      end
      object BCancelar: TBitBtn
        Left = 419
        Top = 24
        Width = 80
        Height = 30
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 2
        OnClick = BCancelarClick
      end
    end
  end
end
