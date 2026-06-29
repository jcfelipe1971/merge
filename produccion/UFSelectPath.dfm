object FSelectPath: TFSelectPath
  Left = 398
  Top = 128
  Width = 358
  Height = 352
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Selecci'#243'n de directorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cbScore: TLFComboBox
    Left = 0
    Top = 24
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object stvPath: TShellTreeView
    Left = 0
    Top = 21
    Width = 350
    Height = 274
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    Align = alClient
    AutoRefresh = False
    Indent = 20
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
    OnEnter = stvPathEnter
    OnChange = stvPathChange
  end
  object PNLPie: TLFPanel
    Left = 0
    Top = 295
    Width = 350
    Height = 30
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    OnResize = PNLPieResize
    object bbSelect: TBitBtn
      Left = 60
      Top = 0
      Width = 93
      Height = 30
      Caption = '&Seleccionar'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object bbCancel: TBitBtn
      Left = 186
      Top = 0
      Width = 93
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object PNLPath: TLFPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 21
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = PNLPathResize
    object cbPaths: TLFComboBox
      Left = 1
      Top = 0
      Width = 349
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object FormStorage: TFormStorage
    Options = [fpState, fpPosition, fpActiveControl]
    UseRegistry = False
    StoredProps.Strings = (
      'cbPaths.Items'
      'cbPaths.ItemIndex'
      'cbPaths.Text'
      'cbScore.Items'
      'cbScore.ItemIndex'
      'cbScore.Text')
    StoredValues = <>
    Left = 32
    Top = 176
  end
end
