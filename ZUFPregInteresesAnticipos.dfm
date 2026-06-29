object ZFPregInteresesAnticipos: TZFPregInteresesAnticipos
  Left = 415
  Top = 284
  Width = 512
  Height = 316
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Intereses Anticipos'
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
    Width = 504
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 61
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Separators = True
    object TButtImprimir: TToolButton
      Left = 0
      Top = 0
      Action = AImprimir
    end
    object TButtVisualizar: TToolButton
      Left = 61
      Top = 0
      Action = AVisualizar
      Caption = '&Visualizar'
    end
    object TButtSalir: TToolButton
      Left = 122
      Top = 0
      Action = ASalir
    end
    object TButtConfigurar: TToolButton
      Left = 183
      Top = 0
      Caption = '&Configurar'
      ImageIndex = 77
      OnClick = TButtConfigurarClick
    end
  end
  object PNLListArt: TLFPanel
    Left = 0
    Top = 41
    Width = 504
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object LblAnticipoDesde: TLFLabel
      Left = 161
      Top = 82
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object LBLAnticipoHasta: TLFLabel
      Left = 164
      Top = 104
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object EFInteres_Desde: TLFEditFind2000
      Left = 198
      Top = 78
      Width = 108
      Height = 21
      TabOrder = 0
      Base_de_datos = DMMain.DataBase
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = True
      CampoNum = 'ID'
      CampoStr = 'ID'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_INTERES_ANTICIPO_CAB'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFInteres_Hasta: TLFEditFind2000
      Left = 198
      Top = 100
      Width = 108
      Height = 21
      TabOrder = 1
      Base_de_datos = DMMain.DataBase
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ID'
      CampoStr = 'ID'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_INTERES_ANTICIPO_CAB'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  object ActionList1: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 320
    Top = 2
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AVisualizar: TAction
      Caption = '&Visualizar'
      Hint = 'Visualizar'
      ImageIndex = 19
      OnExecute = AVisualizarExecute
    end
    object AImprimir: TAction
      Caption = '&Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
  end
end
