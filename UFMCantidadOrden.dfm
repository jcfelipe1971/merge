object FMCantidadOrden: TFMCantidadOrden
  Left = 553
  Top = 325
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cantidad Cierre'
  ClientHeight = 171
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 171
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLCantidad: TLFLabel
      Left = 38
      Top = 76
      Width = 92
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad producida'
    end
    object EDTCantidadProd: TLFEdit
      Left = 138
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyDown = EDTCantidadProdKeyDown
    end
  end
end
