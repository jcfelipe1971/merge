object FMCierreStocks: TFMCierreStocks
  Left = 520
  Top = 308
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cierre y Apertura de Stocks por Ejercicio (Inventario)'
  ClientHeight = 171
  ClientWidth = 312
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
    Top = 22
    Width = 312
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object CBCierre: TLFCheckBox
      Left = 25
      Top = 40
      Width = 249
      Height = 17
      Caption = 'Realizar Periodo de Cierre del Ejercicio actual'
      ClicksDisabled = False
      TabOrder = 0
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBApertura: TLFCheckBox
      Left = 25
      Top = 62
      Width = 268
      Height = 17
      Caption = 'Realizar Periodo de Apertura del siguiente Ejercicio'
      ClicksDisabled = False
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
    end
    object ButtProcesar: TButton
      Left = 121
      Top = 95
      Width = 75
      Height = 25
      Caption = 'Procesar'
      TabOrder = 2
      OnClick = ButtProcesarClick
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 312
    Height = 22
    AutoSize = True
    DisabledImages = DMMain.ILMain_In
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object TBExit: TToolButton
      Left = 0
      Top = 0
      ImageIndex = 0
      OnClick = TBExitClick
    end
  end
end
