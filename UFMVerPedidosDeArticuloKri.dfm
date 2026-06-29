object FMVerPedidosDeArticuloKri: TFMVerPedidosDeArticuloKri
  Left = 414
  Top = 269
  Width = 578
  Height = 363
  Caption = 'Ver Pedidos de Articulo'
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
  object PNLCabecera: TLFPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 49
    Align = alTop
    TabOrder = 0
    object LArticulo: TLFLabel
      Left = 23
      Top = 7
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object LAlmacen: TLFLabel
      Left = 17
      Top = 29
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen'
    end
    object EArticulo: TLFEdit
      Left = 62
      Top = 3
      Width = 97
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object ETituloArticulo: TLFEdit
      Left = 160
      Top = 3
      Width = 234
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object EAlmacen: TLFEdit
      Left = 62
      Top = 25
      Width = 97
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
    object ETituloAlmacen: TLFEdit
      Left = 160
      Top = 25
      Width = 234
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object CBTodosAlmacenes: TLFCheckBox
      Left = 400
      Top = 27
      Width = 145
      Height = 17
      Caption = 'Todos los Almacenes'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      OnClick = CBTodosAlmacenesClick
      Alignment = taLeftJustify
    end
  end
  object PNLDetalle: TLFPanel
    Left = 0
    Top = 49
    Width = 570
    Height = 287
    Align = alClient
    TabOrder = 1
    object DBGMain: THYTDBGrid
      Left = 1
      Top = 1
      Width = 568
      Height = 285
      Align = alClient
      DataSource = DMVerPedidosDeArticuloKri.DSxVerPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO'
          ReadOnly = True
          Width = 39
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANAL'
          ReadOnly = True
          Width = 36
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 28
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN'
          ReadOnly = True
          Width = 64
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES'
          ReadOnly = True
          Width = 56
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_SERVIDAS'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_POR_SERVIR'
          ReadOnly = True
          Width = 69
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE'
          ReadOnly = True
          Width = 61
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO'
          ReadOnly = True
          Width = 36
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO_2'
          ReadOnly = True
          Width = 39
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO_3'
          ReadOnly = True
          Width = 37
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_SERVIDA'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN_TITULO'
          ReadOnly = True
          Width = 64
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 64
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTADO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_ORIGINALES'
          ReadOnly = True
          Visible = True
        end>
    end
  end
end
