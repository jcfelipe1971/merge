object FMIVACartera: TFMIVACartera
  Left = 493
  Top = 389
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'IVA aplicado a Cartera'
  ClientHeight = 289
  ClientWidth = 504
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 16
    Width = 23
    Height = 273
    Align = alLeft
    AutoSize = True
    EdgeBorders = [ebBottom]
    EdgeInner = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtGrabar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Cerrar la ventana'
      Action = ACerrar
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = True
    end
  end
  object DBCGMain: TLFDBCtrlGrid
    Left = 23
    Top = 16
    Width = 481
    Height = 273
    Align = alClient
    ColCount = 1
    DataSource = DMCartera.DSQMCarteraIVA
    PanelHeight = 30
    PanelWidth = 465
    TabOrder = 1
    RowCount = 9
    object DBEBase: TLFDbedit
      Left = 150
      Top = 6
      Width = 103
      Height = 21
      Anchors = [akRight, akBottom]
      Color = clInfoBk
      DataField = 'BASE'
      DataSource = DMCartera.DSQMCarteraIVA
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_P_Iva: TLFDbedit
      Left = 40
      Top = 6
      Width = 54
      Height = 21
      Anchors = [akRight, akBottom]
      Color = clInfoBk
      DataField = 'P_IVA'
      DataSource = DMCartera.DSQMCarteraIVA
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBE_P_Rec: TLFDbedit
      Left = 95
      Top = 6
      Width = 54
      Height = 21
      Anchors = [akRight, akBottom]
      Color = clInfoBk
      DataField = 'P_RECARGO'
      DataSource = DMCartera.DSQMCarteraIVA
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBE_I_Iva: TLFDbedit
      Left = 254
      Top = 6
      Width = 103
      Height = 21
      Anchors = [akRight, akBottom]
      Color = clInfoBk
      DataField = 'I_IVA'
      DataSource = DMCartera.DSQMCarteraIVA
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBE_I_Rec: TLFDbedit
      Left = 358
      Top = 6
      Width = 103
      Height = 21
      Anchors = [akRight, akBottom]
      Color = clInfoBk
      DataField = 'I_RECARGO'
      DataSource = DMCartera.DSQMCarteraIVA
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBE_T_Iva: TLFDbedit
      Left = 11
      Top = 6
      Width = 28
      Height = 21
      Anchors = [akRight, akBottom]
      Color = clInfoBk
      DataField = 'T_IVA'
      DataSource = DMCartera.DSQMCarteraIVA
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object PNLTitulo: TLFPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 16
    Align = alTop
    AutoSize = True
    TabOrder = 2
    DesignSize = (
      504
      16)
    object LBLBaseImponible: TLFLabel
      Left = 174
      Top = 2
      Width = 103
      Height = 13
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 'Base Imponible'
    end
    object LBLIVA: TLFLabel
      Left = 64
      Top = 2
      Width = 54
      Height = 13
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = '% IVA'
    end
    object LBLRec: TLFLabel
      Left = 120
      Top = 2
      Width = 54
      Height = 13
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = '% Rec.'
    end
    object LBLImporteIVA: TLFLabel
      Left = 279
      Top = 2
      Width = 103
      Height = 13
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 'Importe IVA'
    end
    object LBLImporteRecargo: TLFLabel
      Left = 382
      Top = 2
      Width = 103
      Height = 13
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 'Importe Recargo'
    end
    object LBLTipo: TLFLabel
      Left = 35
      Top = 1
      Width = 28
      Height = 13
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 'Tipo'
    end
  end
  object ALIvaCartera: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 402
    Top = 48
    object ACerrar: TAction
      Caption = '&Cerrar'
      Hint = 'Cerrar la venta de edici'#243'n y cancelar cambios'
      ImageIndex = 27
      OnExecute = ACerrarExecute
    end
    object AGrabar: TAction
      Caption = '&Grabar'
      Hint = 'Grabar Cambios '
      ImageIndex = 19
    end
  end
end
