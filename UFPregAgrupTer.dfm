object FPregAgrupTer: TFPregAgrupTer
  Left = 509
  Top = 466
  Width = 400
  Height = 247
  Caption = 'Agrupar terceros'
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
      Left = 77
      Top = 71
      Width = 5
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LTipo: TLFLabel
      Left = 56
      Top = 93
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EF1: TLFEditFind2000
      Left = 86
      Top = 66
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
      OnBusqueda = EF1Busqueda
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EF2: TLFEditFind2000
      Left = 86
      Top = 88
      Width = 57
      Height = 21
      TabOrder = 1
      OnChange = EF2Change
      OnExit = EF2Exit
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
    end
    object BitBtnOk: TBitBtn
      Left = 96
      Top = 145
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 4
    end
    object BitBtnCancel: TBitBtn
      Left = 207
      Top = 145
      Width = 80
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object DBETit1: TLFDbedit
      Left = 144
      Top = 66
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
      TabOrder = 2
    end
    object DBETit2: TLFDbedit
      Left = 144
      Top = 88
      Width = 233
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMPregAgrupTer.DSxTiposDestino
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
end
