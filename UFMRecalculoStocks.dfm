object FMRecalculoStocks: TFMRecalculoStocks
  Left = 506
  Top = 276
  Width = 322
  Height = 222
  ActiveControl = CBLotes
  Caption = 'Recalculo de Stocks Art'#237'culo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 24
    Width = 314
    Height = 171
    Align = alClient
    TabOrder = 0
    object CBTotal: TLFCheckBox
      Left = 15
      Top = 28
      Width = 292
      Height = 17
      Caption = 'Recalcula el Stock Acumulado y Total General'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 0
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBPedidos: TLFCheckBox
      Left = 15
      Top = 52
      Width = 292
      Height = 17
      Caption = 'Recalcula el Stock de Pedidos'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBPonderado: TLFCheckBox
      Left = 15
      Top = 76
      Width = 292
      Height = 17
      Caption = 'Recalcula el Precio Ponderado en sus Documentos'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBLotes: TLFCheckBox
      Left = 15
      Top = 101
      Width = 292
      Height = 17
      Caption = 'Recalcula los Lotes'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBSerie: TLFCheckBox
      Left = 15
      Top = 125
      Width = 292
      Height = 17
      Caption = 'Recalcula los N'#250'meros de Serie'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  object TBOptions: TLFToolBar
    Left = 0
    Top = 0
    Width = 314
    Height = 24
    ButtonHeight = 21
    ButtonWidth = 51
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    Flat = True
    List = True
    ParentColor = False
    ShowCaptions = True
    TabOrder = 1
    ActionList = ALMain
    Separators = True
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 152
    Top = 8
    object ASalir: TAction
      Caption = 'Cerrar'
      Hint = 'Cerrar esta ventana'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AProcesar: TAction
      Caption = 'Procesar'
      Hint = 'Procesar'
      ImageIndex = 16
      OnExecute = AProcesarExecute
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 104
    Top = 10
  end
end
