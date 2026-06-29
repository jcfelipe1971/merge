object FMArticulosTarifa: TFMArticulosTarifa
  Left = 424
  Top = 255
  HelpContext = 1421
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Art'#237'culos por Tarifa'
  ClientHeight = 424
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    object PNLTarifa: TLFPanel
      Left = 0
      Top = 0
      Width = 388
      Height = 22
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object LBLTarifa: TLFLabel
        Left = 0
        Top = 0
        Width = 48
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tarifa'
        FocusControl = EFTarifa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFTarifa: TLFEditFind2000
        Left = 48
        Top = 0
        Width = 57
        Height = 21
        TabOrder = 0
        OnChange = EFTarifaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'TARIFA'
        CampoNum = 'TARIFA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'Art_tarifas_proveedor'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFTarifaBusqueda
        OrdenadoPor.Strings = (
          'TARIFA')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMPedidosAProveedor.FDoc
      end
      object DBETarifa: TLFDbedit
        Left = 106
        Top = 0
        Width = 282
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPedidosAProveedor.DSxtarifasProveedor
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
    object ToolButton1: TToolButton
      Left = 388
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object HYMEditPanel1: THYMEditPanel
      Left = 396
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
    end
  end
  object PMain: TLFPanel
    Left = 0
    Top = 22
    Width = 592
    Height = 402
    Align = alClient
    TabOrder = 1
    object DBGArtTarifas: THYTDBGrid
      Left = 1
      Top = 1
      Width = 590
      Height = 400
      Align = alClient
      Color = clInfoBk
      DataSource = DMPedidosAProveedor.DSxArticulosTarifa
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGArtTarifasDblClick
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
          FieldName = 'ARTICULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_MIN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_MAX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 61
          Visible = True
        end>
    end
  end
end
