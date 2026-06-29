inherited FVerTercerosPorArticulo: TFVerTercerosPorArticulo
  Left = 553
  Top = 260
  Width = 836
  Height = 453
  HelpContext = 182
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ver Terceros por Art'#237'culo'
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 826
    Height = 400
    inherited TBMain: TLFToolBar
      Width = 822
      Height = 27
      ButtonHeight = 23
      inherited EPMain: THYMEditPanel
        Width = 23
        Height = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLArticulo: TLFPanel
        Left = 31
        Top = 0
        Width = 511
        Height = 23
        BevelOuter = bvNone
        TabOrder = 0
        object LArticulo: TLFLabel
          Left = 11
          Top = 4
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art'#237'culo'
          Layout = tlCenter
        end
        object EFArticulo: TLFEditFind2000
          Left = 52
          Top = 0
          Width = 109
          Height = 21
          AutoSelect = False
          TabOrder = 0
          OnChange = EFArticuloChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS_BUSQUEDA'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticuloBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EArticulo: TLFEdit
          Left = 162
          Top = 0
          Width = 349
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object DBGMain: THYTDBGrid
      Left = 2
      Top = 29
      Width = 822
      Height = 339
      Align = alClient
      BorderStyle = bsNone
      Color = clInfoBk
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
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
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Numero'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Nombre'
          Width = 215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Precio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Proveedor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Title.Caption = 'Fecha'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Titulo'
          Width = 234
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Caption = 'Unidades'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_COMPRA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Precio Compra'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Precio Coste'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Coste'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Title.Caption = 'Serie'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Title.Caption = 'Documento'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_MODELO'
          Title.Caption = 'Modelo'
          Visible = True
        end>
    end
    object PNLTotales: TLFPanel
      Left = 2
      Top = 368
      Width = 822
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LTotalUnidades: TLFLabel
        Left = 408
        Top = 7
        Width = 68
        Height = 16
        Alignment = taRightJustify
        Caption = 'Unidades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTotalImporte: TLFLabel
        Left = 623
        Top = 7
        Width = 53
        Height = 16
        Alignment = taRightJustify
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RMETotalUnidades: THYGRightEdit
        Left = 481
        Top = 3
        Width = 121
        Height = 24
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object RMETotalVentas: THYGRightEdit
        Left = 681
        Top = 3
        Width = 121
        Height = 24
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 400
    Width = 826
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
