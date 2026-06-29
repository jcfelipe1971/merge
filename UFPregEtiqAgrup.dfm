object FPregEtiqAgrup: TFPregEtiqAgrup
  Left = 491
  Top = 386
  Width = 400
  Height = 247
  Caption = 'Agrupar etiquetas'
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 220
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLFLabel
      Left = 10
      Top = 84
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EF1: TLFEditFind2000
      Left = 87
      Top = 79
      Width = 57
      Height = 21
      TabOrder = 0
      OnChange = EF1Change
      OnExit = EF1Exit
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object BitBtnOk: TBitBtn
      Left = 91
      Top = 138
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 2
    end
    object BitBtnCancel: TBitBtn
      Left = 218
      Top = 138
      Width = 80
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object DBETit1: TLFDbedit
      Left = 145
      Top = 79
      Width = 233
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end
