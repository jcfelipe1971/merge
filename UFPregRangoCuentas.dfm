object FPregRangoCuentas: TFPregRangoCuentas
  Left = 143
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rango de Cuentas'
  ClientHeight = 145
  ClientWidth = 535
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
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 145
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLDesde: TLFLabel
      Left = 31
      Top = 47
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object LBLHasta: TLFLabel
      Left = 34
      Top = 88
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 535
      Height = 24
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object TButtConfirmar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Confirmar'
        Caption = 'Confirmar'
        ImageIndex = 19
        OnClick = TButtConfirmarClick
      end
      object TButtSalir: TToolButton
        Left = 23
        Top = 0
        Hint = 'Cerrar la ventana'
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object EFDesde: TLFEditFind2000
      Left = 68
      Top = 44
      Width = 107
      Height = 21
      TabOrder = 1
      OnChange = EFDesdeChange
      OnExit = EFDesdeExit
      OnKeyDown = EFDesdeKeyDown
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = True
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFDesdeBusqueda
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFHasta: TLFEditFind2000
      Left = 68
      Top = 84
      Width = 107
      Height = 21
      TabOrder = 2
      OnChange = EFHastaChange
      OnExit = EFHastaExit
      OnKeyDown = EFHastaKeyDown
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFHastaBusqueda
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMMain.EntornoBusqueda
    end
    object EdTituloDesde: TLFEdit
      Left = 178
      Top = 44
      Width = 327
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object EdTituloHasta: TLFEdit
      Left = 178
      Top = 84
      Width = 327
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
end
