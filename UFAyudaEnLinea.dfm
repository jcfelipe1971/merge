object FAyudaenLinea: TFAyudaenLinea
  Left = 510
  Top = 124
  BorderStyle = bsToolWindow
  Caption = 'Ayuda en l'#237'nea'
  ClientHeight = 358
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 177
    Width = 504
    Height = 6
    Cursor = crVSplit
    Align = alTop
  end
  object DBREMain: TDBRichEdit
    Left = 0
    Top = 0
    Width = 504
    Height = 177
    Align = alTop
    Color = clInfoBk
    DataField = 'NOTAS'
    DataSource = DMAyudaenLinea.DSQMFormularios
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 183
    Width = 504
    Height = 175
    Align = alClient
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
