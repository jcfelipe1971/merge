object FMVerCodigoProveedorKri: TFMVerCodigoProveedorKri
  Left = 376
  Top = 258
  Width = 578
  Height = 363
  Caption = 'Ver Codigo Proveedor'
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
      Left = 24
      Top = 15
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object ETituloArticulo: TLFEdit
      Left = 185
      Top = 11
      Width = 362
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object EFArticulo: TLFEditFind2000
      Left = 63
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = EFArticuloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'CODIGO_PROVEEDOR'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'ART_ARTICULOS_CODPROV'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
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
      DataSource = DMVerCodigoProveedorKri.DSxVerCodigoProveedor
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
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 89
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CODIGO_PROVEEDOR'
          ReadOnly = True
          Width = 113
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROVEEDOR'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOMBRE_PROVEEDOR'
          ReadOnly = True
          Width = 262
          Visible = True
        end>
    end
  end
end
