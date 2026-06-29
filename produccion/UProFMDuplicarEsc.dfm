object ProFMDuplicarEsc: TProFMDuplicarEsc
  Left = 350
  Top = 470
  Width = 402
  Height = 222
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Duplicar Escandallo'
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
  object PnlDuplicar: TLFPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 195
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LblOrigen: TLFLabel
      Left = 15
      Top = 60
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Origen'
    end
    object LblDestino: TLFLabel
      Left = 11
      Top = 82
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Destino'
    end
    object ToolBar1: TLFToolBar
      Left = 0
      Top = 0
      Width = 394
      Height = 26
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object TBSalir: TToolButton
        Left = 0
        Top = 0
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TBSalirClick
      end
    end
    object EDescOrigen: TLFEdit
      Left = 146
      Top = 56
      Width = 229
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EFEscDestino: TLFEditFind2000
      Left = 53
      Top = 78
      Width = 92
      Height = 21
      TabOrder = 2
      OnChange = EFEscDestinoChange
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
    object EDescDestino: TLFEdit
      Left = 146
      Top = 78
      Width = 229
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object EEscOrigen: TLFEdit
      Left = 53
      Top = 56
      Width = 92
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object BBDuplicar: TBitBtn
      Left = 148
      Top = 141
      Width = 80
      Height = 30
      Caption = '&Duplicar'
      ModalResult = 4
      TabOrder = 5
      OnClick = BBDuplicarClick
    end
    object LFCBInsertMasivo: TLFCheckBox
      Left = 50
      Top = 108
      Width = 255
      Height = 17
      Caption = 'Inserci'#243'n masiva de los art'#237'culos filtrados'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 6
      TabStop = True
      Alignment = taLeftJustify
      OnChange = LFCBInsertMasivoChange
    end
  end
end
