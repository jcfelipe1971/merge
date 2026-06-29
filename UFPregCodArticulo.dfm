object FPregCodArticulo: TFPregCodArticulo
  Left = 419
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nuevo c'#243'digo para el art'#237'culo'
  ClientHeight = 105
  ClientWidth = 457
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
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 105
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object EFArticulo: TLFEditFind2000
      Left = 32
      Top = 38
      Width = 120
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EFArticuloChange
      OnKeyDown = EFArticuloKeyDown
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
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_ARTICULOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloBusqueda
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloArticulo: TLFEdit
      Left = 153
      Top = 38
      Width = 280
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
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 457
      Height = 22
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 2
      Separators = True
      object TButtAceptar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Aceptar'
        Caption = 'Aceptar'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
      object TButtSalir: TToolButton
        Left = 23
        Top = 0
        Hint = 'Cancelar'
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object CBBorraOrigen: TLFCheckBox
      Left = 32
      Top = 75
      Width = 393
      Height = 17
      Caption = 'Borrar art'#237'culo origen'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
  end
end
