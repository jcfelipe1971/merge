object FReplicaBalance: TFReplicaBalance
  Left = 533
  Top = 551
  ActiveControl = DBGMain
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Replica una estructura de Balance contable'
  ClientHeight = 220
  ClientWidth = 392
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
  object PBotones: TLFPanel
    Left = 0
    Top = 179
    Width = 392
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BBCancelar: TBitBtn
      Left = 207
      Top = 6
      Width = 85
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object BBAceptar: TBitBtn
      Left = 100
      Top = 6
      Width = 85
      Height = 30
      Caption = '&Replicar'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
  object DBGMain: THYTDBGrid
    Left = 0
    Top = 20
    Width = 392
    Height = 159
    Hint = 'Elija el balance a replicar'
    Align = alClient
    DataSource = DMBalances.DSxBalancesElec
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGMainDblClick
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    Idioma = 'CAS'
    AutoDeseleccionar = True
    PermutaPaneles = False
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Expanded = False
        FieldName = 'BALANCE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Visible = True
      end>
  end
  object PTitulo: TLFPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Elija el Balance a replicar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
