object FMDuplicarTarifa: TFMDuplicarTarifa
  Left = 350
  Top = 470
  Width = 402
  Height = 222
  ActiveControl = EFTarifaDestino
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Duplicar Tarifa'
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
  object PNLDuplicar: TLFPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 195
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LblOrigen: TLFLabel
      Left = 14
      Top = 76
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Origen'
    end
    object LblDestino: TLFLabel
      Left = 9
      Top = 98
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Destino'
    end
    object TBMain: TLFToolBar
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
      Left = 142
      Top = 72
      Width = 229
      Height = 21
      TabStop = False
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
    object EFTarifaDestino: TLFEditFind2000
      Left = 49
      Top = 94
      Width = 92
      Height = 21
      TabOrder = 2
      OnChange = EFTarifaDestinoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TARIFA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_TARIFAS_C'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TARIFA')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EDescDestino: TLFEdit
      Left = 142
      Top = 94
      Width = 229
      Height = 21
      TabStop = False
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
    object EFTarifaOrigen: TLFEdit
      Left = 49
      Top = 72
      Width = 92
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = EFTarifaOrigenChange
    end
    object BDuplicar: TBitBtn
      Left = 157
      Top = 139
      Width = 80
      Height = 30
      Caption = '&Duplicar'
      ModalResult = 4
      TabOrder = 5
      OnClick = BDuplicarClick
    end
  end
end
