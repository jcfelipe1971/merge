object FMRecalculoStocksTotales: TFMRecalculoStocksTotales
  Left = 475
  Top = 265
  Width = 326
  Height = 277
  Caption = 'Recalculo de Stocks por Art'#237'culos Filtrados'
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 24
    Width = 318
    Height = 226
    Align = alClient
    TabOrder = 0
    object CBTotal: TLFCheckBox
      Left = 15
      Top = 60
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
      Top = 84
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
      Top = 108
      Width = 292
      Height = 17
      Caption = 'Recalcula el Precio Ponderado en sus Documentos'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object PNLDatos: TLFPanel
      Left = 1
      Top = 1
      Width = 316
      Height = 40
      Align = alTop
      Enabled = False
      TabOrder = 6
      DesignSize = (
        316
        40)
      object LBLProcesando: TLFLabel
        Left = 2
        Top = 21
        Width = 99
        Height = 16
        AutoSize = False
        Caption = 'Procesando'
        Color = clInfoBk
        ParentColor = False
      end
      object LArticulo: TLFLabel
        Left = 102
        Top = 21
        Width = 212
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
      end
      object LBLFaltan: TLFLabel
        Left = 2
        Top = 4
        Width = 99
        Height = 16
        AutoSize = False
        Caption = 'Faltan'
        Color = clInfoBk
        ParentColor = False
      end
      object LFaltan: TLFLabel
        Left = 102
        Top = 4
        Width = 212
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
      end
    end
    object BInterrumpir: TButton
      Left = 123
      Top = 188
      Width = 75
      Height = 25
      Hint = 'Interrumpe la ponderaci'#243'n'
      BiDiMode = bdLeftToRight
      Caption = '&Interrumpir'
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 5
      OnClick = BInterrumpirClick
    end
    object CBLotes: TLFCheckBox
      Left = 15
      Top = 132
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
      Top = 156
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
    Width = 318
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
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 272
    Top = 90
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 272
    Top = 48
    object ASalir: TAction
      Caption = 'Cerrar'
      Hint = 'Cerrar esta ventana'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AProcesarTotales: TAction
      Tag = 1
      Caption = 'Procesar'
      Hint = 'Procesar'
      ImageIndex = 16
      OnExecute = AProcesarTotalesExecute
    end
  end
end
