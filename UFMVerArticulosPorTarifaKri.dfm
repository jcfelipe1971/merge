object FMVerArticulosPorTarifaKri: TFMVerArticulosPorTarifaKri
  Left = 403
  Top = 173
  Width = 700
  Height = 400
  ActiveControl = EFArticulo
  Caption = 'Ver Tarifas en que se encuentra el Art'#237'culo'
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
  object PNLCabecera: TLFPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 49
    Align = alTop
    TabOrder = 0
    DesignSize = (
      692
      49)
    object LArticulo: TLFLabel
      Left = 23
      Top = 15
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object ETituloArticulo: TLFEdit
      Left = 160
      Top = 11
      Width = 513
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object EFArticulo: TLFEditFind2000
      Left = 62
      Top = 11
      Width = 97
      Height = 21
      TabOrder = 1
      OnChange = EFArticuloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  object PNLDetalle: TLFPanel
    Left = 0
    Top = 49
    Width = 692
    Height = 324
    Align = alClient
    TabOrder = 1
    object DBGMain: THYTDBGrid
      Left = 1
      Top = 1
      Width = 690
      Height = 322
      Align = alClient
      DataSource = DMVerArticulosPorTarifaKri.DSxVerArticulosPorTarifa
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
          FieldName = 'TARIFA'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_TARIFA'
          ReadOnly = True
          Width = 197
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROVEEDOR'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_INICIO'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_FINAL'
          ReadOnly = True
          Width = 67
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO1'
          ReadOnly = True
          Width = 39
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO2'
          ReadOnly = True
          Width = 42
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO3'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA'
          ReadOnly = True
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO_PROVEEDOR'
          ReadOnly = True
          Visible = True
        end>
    end
  end
end
