object ProFPGrafico: TProFPGrafico
  Left = 216
  Top = 110
  Width = 696
  Height = 480
  Caption = 'Gr'#225'fico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLGrafico: TLFPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBMainChart: TDBChart
      Left = 0
      Top = 0
      Width = 688
      Height = 429
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        '')
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
    object TBActions: TLFToolBar
      Left = 0
      Top = 429
      Width = 688
      Height = 24
      Align = alBottom
      ButtonHeight = 21
      ButtonWidth = 51
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      Flat = True
      List = True
      ShowCaptions = True
      TabOrder = 1
      ActionList = ALMain
      Separators = True
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 560
    Top = 112
    object LFCatActionZoom: TLFCategoryAction
      Category = 'Zoom'
      Caption = 'Zoom'
      ImageIndex = 23
    end
    object AZoomMas: TAction
      Category = 'Zoom'
      Caption = '+ Zoom '
      Hint = '+ Zoom'
      ImageIndex = 23
      OnExecute = AZoomMasExecute
    end
    object AZoomMenos: TAction
      Category = 'Zoom'
      Caption = '- Zoom'
      Hint = '- Zoom'
      ImageIndex = 22
      OnExecute = AZoomMenosExecute
    end
    object LFCatActionOpciones: TLFCategoryAction
      Category = 'Opciones'
      Caption = 'Opciones'
      Hint = 'Opciones'
      ImageIndex = 2
    end
    object ACopiar: TAction
      Category = 'Opciones'
      Caption = 'Copiar al Portapapeles'
      Hint = 'Copiar al Portapapeles'
      ImageIndex = 37
      OnExecute = ACopiarExecute
    end
    object AZoomReestablecer: TAction
      Category = 'Zoom'
      Caption = 'Reestablecer'
      Hint = 'Restablecer Tama'#241'o'
      ImageIndex = 57
      OnExecute = AZoomReestablecerExecute
    end
  end
  object FSMain: TLFFibFormStorage
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 560
    Top = 160
  end
end
