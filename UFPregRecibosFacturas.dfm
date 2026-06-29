object FPregRecibosFacturas: TFPregRecibosFacturas
  Left = 470
  Top = 168
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Recibos de Facturas'
  ClientHeight = 220
  ClientWidth = 392
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 392
    Height = 36
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 72
    EdgeBorders = []
    Flat = True
    Images = DMMain.ILMain_Ac
    ShowCaptions = True
    TabOrder = 0
    Separators = True
    object TButtRecargar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Recargar rango de listado'
      Caption = '&Recargar'
      ImageIndex = 26
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtRecargarClick
    end
    object TButtImprimir: TToolButton
      Left = 72
      Top = 0
      Hint = 'Imprimir el informe'
      Caption = '&Imprimir'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtImprimirClick
    end
    object TButtPrevisualizar: TToolButton
      Left = 144
      Top = 0
      Hint = 'Previsualizar el informe'
      Caption = '&Previsualizar'
      ImageIndex = 125
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtPrevisualizarClick
    end
    object TButtSalir: TToolButton
      Left = 216
      Top = 0
      Hint = 'Cerrar esta ventana'
      Caption = '&Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtSalirClick
    end
    object TButtConfRapida: TToolButton
      Left = 288
      Top = 0
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      Caption = 'Conf. R'#225'pida'
      ImageIndex = 77
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtConfRapidaClick
    end
  end
  object GBFechas: TGroupBox
    Left = 0
    Top = 36
    Width = 392
    Height = 90
    Align = alTop
    Caption = 'N'#250'meros de Factura'
    TabOrder = 1
    object Label1: TLFLabel
      Left = 49
      Top = 42
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label2: TLFLabel
      Left = 188
      Top = 42
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object EdRIGMin: TLFEdit
      Left = 86
      Top = 38
      Width = 80
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object EdRIGMax: TLFEdit
      Left = 222
      Top = 38
      Width = 80
      Height = 21
      TabOrder = 1
      Text = '0'
    end
  end
  object GBSeries: TGroupBox
    Left = 0
    Top = 126
    Width = 392
    Height = 94
    Align = alClient
    Caption = 'Serie'
    TabOrder = 2
    object EFSerie: TLFEditFind2000
      Left = 43
      Top = 34
      Width = 54
      Height = 21
      TabOrder = 0
      OnChange = EFSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        '')
      CampoNum = 'SERIE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBESerieD: TLFDbedit
      Left = 98
      Top = 34
      Width = 269
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstCarteraRecibos.DSxSerie
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
