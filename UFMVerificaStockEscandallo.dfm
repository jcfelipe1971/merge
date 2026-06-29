object FMVerificaStockEscandallo: TFMVerificaStockEscandallo
  Left = 253
  Top = 272
  Width = 536
  Height = 239
  Caption = 'Verifique el Stock del Escandallo'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNLCabecera: TLFPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 25
    Align = alTop
    TabOrder = 0
    DesignSize = (
      528
      25)
    object EArticulo: TLFEdit
      Left = 1
      Top = 2
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object ETitulo: TLFEdit
      Left = 121
      Top = 2
      Width = 405
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
  end
  object PNLDatos: TLFPanel
    Left = 0
    Top = 25
    Width = 528
    Height = 187
    Align = alClient
    TabOrder = 1
    object DBGStock: TDBGrid
      Left = 1
      Top = 1
      Width = 526
      Height = 185
      Align = alClient
      DataSource = DMVerificaStockEscandallo.DSQEscandallo
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DETALLE'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Width = 281
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EXISTENCIAS'
          Width = 72
          Visible = True
        end>
    end
  end
end
