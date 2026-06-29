object FPregTraspasaPlan: TFPregTraspasaPlan
  Left = 228
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Traspasar Plan Contable Anal'#237'tico'
  ClientHeight = 178
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 178
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object LBLEmpresa: TLFLabel
      Left = 32
      Top = 56
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object LBLEjercicio: TLFLabel
      Left = 33
      Top = 91
      Width = 40
      Height = 13
      Caption = 'Ejercicio'
    end
    object LBLCanal: TLFLabel
      Left = 46
      Top = 125
      Width = 27
      Height = 13
      Caption = 'Canal'
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 408
      Height = 26
      BorderWidth = 1
      Caption = ''
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object TButtConfirmar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Traspasar Plan Contable Anal'#237'tico'
        Caption = 'Confirmar'
        ImageIndex = 19
        OnClick = TButtConfirmarClick
      end
      object TButtSalir: TToolButton
        Left = 23
        Top = 0
        Hint = 'Salir'
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object EFEmpresa: TLFEditFind2000
      Left = 78
      Top = 54
      Width = 56
      Height = 21
      TabOrder = 1
      OnChange = EFEmpresaChange
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'EMPRESA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_EMPRESAS'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = []
    end
    object DBETituloEmpresa: TLFDbedit
      Left = 136
      Top = 54
      Width = 244
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMPlanesContables.DSxEmpresa
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object CBEjercicios: TLFComboBox
      Left = 78
      Top = 88
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'CBEjercicios'
    end
    object CBCanales: TLFComboBox
      Left = 78
      Top = 122
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'CBCanales'
    end
  end
end
