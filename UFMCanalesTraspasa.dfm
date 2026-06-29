object FMCanalesTraspasa: TFMCanalesTraspasa
  Left = 524
  Top = 468
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Canal a propagar Estructura Contable'
  ClientHeight = 171
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TPanel
    Left = 0
    Top = 0
    Width = 299
    Height = 171
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LCanalAPropagar: TLFLabel
      Left = 11
      Top = 64
      Width = 212
      Height = 13
      Alignment = taRightJustify
      Caption = 'Canal a propagar estructura contable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EFCanal: TLFEditFind2000
      Left = 235
      Top = 60
      Width = 50
      Height = 21
      TabOrder = 0
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CANAL'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'Activo=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'GEN_CANALES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object BtnOK: TBitBtn
      Left = 52
      Top = 112
      Width = 85
      Height = 30
      Hint = 'Aceptar'
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object BtnCancel: TBitBtn
      Left = 160
      Top = 112
      Width = 85
      Height = 30
      Hint = 'Salir de la ventana'
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
end
