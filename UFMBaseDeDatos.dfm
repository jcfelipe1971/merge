object FMBaseDeDatos: TFMBaseDeDatos
  Left = 529
  Top = 244
  BorderStyle = bsSingle
  Caption = 'Servidor de Base de Datos'
  ClientHeight = 171
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PNLBotones: TLFPanel
    Left = 0
    Top = 128
    Width = 492
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BBConectar: TBitBtn
      Left = 139
      Top = 4
      Width = 85
      Height = 30
      Caption = 'Conectar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = BBConectarClick
    end
    object BBCancelar: TBitBtn
      Left = 263
      Top = 4
      Width = 85
      Height = 30
      Cancel = True
      Caption = 'Salir'
      ModalResult = 2
      TabOrder = 1
      OnClick = BBCancelarClick
    end
  end
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 128
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      492
      128)
    object LFiltro: TLFLabel
      Left = 6
      Top = 40
      Width = 22
      Height = 13
      Caption = 'Filtro'
    end
    object LFicheroINI: TLabel
      Left = 0
      Top = 13
      Width = 492
      Height = 13
      Align = alTop
      Caption = 'LFicheroINI'
      OnDblClick = LFicheroINIDblClick
    end
    object LFicheroConfiguracion: TLabel
      Left = 0
      Top = 0
      Width = 492
      Height = 13
      Align = alTop
      Caption = 'Fichero de Configuracion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnDblClick = LFicheroINIDblClick
    end
    object CBBaseDeDatos: TLFComboBox
      Left = 6
      Top = 54
      Width = 479
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 0
      OnChange = CBBaseDeDatosChange
    end
    object EBaseDeDatos: TLFEdit
      Left = 6
      Top = 77
      Width = 479
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = EBaseDeDatosChange
    end
  end
  object TCancelarSeleccion: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = TCancelarSeleccionTimer
    Left = 16
    Top = 8
  end
end
