object ProFMVerFicheroInc: TProFMVerFicheroInc
  Left = 388
  Top = 204
  Width = 512
  Height = 316
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Visualizaci'#243'n del fichero de incidencias'
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
  object PanelMain: TLFPanel
    Left = 0
    Top = 26
    Width = 504
    Height = 263
    Align = alClient
    TabOrder = 0
    object MemoInc: TLFMemo
      Left = 1
      Top = 1
      Width = 502
      Height = 261
      Align = alClient
      TabOrder = 0
    end
  end
  object ToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 504
    Height = 26
    Caption = ''
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object TBGravar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Grabar'
      Caption = 'TBGravar'
      ImageIndex = 146
      ParentShowHint = False
      ShowHint = True
      OnClick = TBGravarClick
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBSalir: TToolButton
      Left = 31
      Top = 0
      Hint = 'Salir'
      Caption = 'Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = TBSalirClick
    end
  end
  object FormStorage: TFormStorage
    StoredValues = <>
    Left = 428
    Top = 120
  end
end
