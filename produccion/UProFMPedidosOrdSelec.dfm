inherited ProFMPedidosOrdSelec: TProFMPedidosOrdSelec
  Left = 370
  Top = 160
  BorderStyle = bsDialog
  Caption = 'Generar OF de pedido'
  ClientHeight = 289
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 265
    object LFecha: TLFLabel [0]
      Left = 24
      Top = 143
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LUnidades: TLFLabel [1]
      Left = 32
      Top = 165
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds.'
    end
    object LNotas: TLFLabel [2]
      Left = 26
      Top = 183
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas'
    end
    object LStock: TLFLabel [3]
      Left = 363
      Top = 107
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Stock'
    end
    object LArticulo: TLFLabel [4]
      Left = 25
      Top = 40
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object LAlmacen: TLFLabel [5]
      Left = 19
      Top = 85
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen'
    end
    object LEscandallo: TLFLabel [6]
      Left = 8
      Top = 64
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Escandallo'
    end
    object LUdsProducir: TLFLabel [7]
      Left = 190
      Top = 107
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds. Prod.'
    end
    object LUdsPedido: TLFLabel [8]
      Left = 13
      Top = 108
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds. Ped.'
    end
    object LUdsManuales: TLFLabel [9]
      Left = 166
      Top = 165
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds. Manual'
      Visible = False
    end
    inherited TBMain: TLFToolBar
      Width = 500
      HotImages = DMMain.ILMain_In
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBGenerar: TToolButton
        Left = 41
        Top = 0
        Hint = 'Generar OF'
        Caption = 'Generar'
        ImageIndex = 25
        ParentShowHint = False
        ShowHint = True
        OnClick = TBGenerarClick
      end
    end
    object DFechaGOrden: TLFDateEdit
      Left = 58
      Top = 139
      Width = 91
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 9
    end
    object EUnidades: TLFEdit
      Left = 58
      Top = 161
      Width = 90
      Height = 21
      TabOrder = 11
      OnExit = EUnidadesExit
    end
    object ENotas: TLFMemo
      Left = 58
      Top = 183
      Width = 427
      Height = 98
      TabOrder = 13
    end
    object CBOrdenes: TLFCheckBox
      Left = 232
      Top = 141
      Width = 235
      Height = 17
      Caption = 'Generar m'#225's ordenes a partir de este pedido'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 10
      TabStop = True
      Alignment = taLeftJustify
    end
    object EStock: TLFEdit
      Left = 394
      Top = 103
      Width = 91
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object EArticulo: TLFEdit
      Left = 63
      Top = 38
      Width = 91
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EDArticulo: TLFEdit
      Left = 155
      Top = 38
      Width = 330
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EAlmacen: TLFEdit
      Left = 63
      Top = 82
      Width = 91
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EDAlmacen: TLFEdit
      Left = 155
      Top = 81
      Width = 330
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object EEscandallo: TLFEdit
      Left = 63
      Top = 60
      Width = 91
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EProd: TLFEdit
      Left = 244
      Top = 103
      Width = 76
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object EUnidadesPed: TLFEdit
      Left = 63
      Top = 104
      Width = 91
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object EManual: TLFEdit
      Left = 231
      Top = 161
      Width = 90
      Height = 21
      TabOrder = 12
      Visible = False
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 504
  end
  inherited FSMain: TLFFibFormStorage
    Left = 356
    Top = 58
  end
end
