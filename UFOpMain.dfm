object FOpMain: TFOpMain
  Left = 554
  Top = 281
  HelpContext = 707
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Opciones de Men'#250
  ClientHeight = 237
  ClientWidth = 315
  Color = clBtnFace
  Constraints.MaxWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 315
    Height = 23
    AutoSize = True
    ButtonHeight = 21
    EdgeBorders = [ebBottom]
    Flat = True
    TabOrder = 0
    Separators = True
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object LProcesos: TLFLabel
      Left = 8
      Top = 0
      Width = 73
      Height = 21
      Align = alRight
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Procesos'
      FocusControl = CBMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object ToolButton2: TToolButton
      Left = 81
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object CBMain: TLFComboBox
      Left = 89
      Top = 0
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = CBMainChange
      OnKeyDown = CBMainKeyDown
      Items.Strings = (
        'Contabilidad'
        'Ventas'
        'Compras'
        'Almacenes'
        'Auxiliares'
        'Utilidades'
        'Empresas'
        'Impuestos'
        'Terceros'
        'Tesoreria'
        'Inmovilizado')
    end
    object ToolButton3: TToolButton
      Left = 258
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 266
      Top = 0
      ImageIndex = 2
    end
  end
  object SBMain: TStatusBar
    Left = 0
    Top = 218
    Width = 315
    Height = 19
    Panels = <
      item
        Width = 170
      end
      item
        Alignment = taCenter
        Text = 'Ejercicio'
        Width = 48
      end
      item
        Width = 40
      end
      item
        Text = 'Canal'
        Width = 37
      end
      item
        Alignment = taCenter
        Width = 15
      end>
    SimplePanel = False
  end
  object TVMain: TTreeView
    Left = 0
    Top = 23
    Width = 315
    Height = 195
    Align = alClient
    Images = DMMain.ILMain_Ac
    Indent = 19
    ReadOnly = True
    SortType = stText
    TabOrder = 2
    OnDblClick = TVMainDblClick
    OnKeyDown = TVMainKeyDown
  end
end
