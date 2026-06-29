object FMRelacionaAnticipo: TFMRelacionaAnticipo
  Left = 362
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relaciona Anticipos'
  ClientHeight = 361
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEAnticipoPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 361
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 24
      Width = 564
      Height = 24
      EdgeBorders = [ebBottom]
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object PArticulo: TLFPanel
        Left = 0
        Top = 0
        Width = 458
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object DBEArticulo: TLFDbedit
          Left = 0
          Top = 0
          Width = 145
          Height = 21
          Color = clInfoBk
          DataField = 'ARTICULO'
          DataSource = DMRelacionaAnticipo.DSxArticulo
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBETituloArticulo: TLFDbedit
          Left = 146
          Top = 0
          Width = 312
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRelacionaAnticipo.DSxArticulo
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object TButtSep1: TToolButton
        Left = 458
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object NavMain: THYMNavigator
        Left = 466
        Top = 0
        Width = 69
        Height = 22
        VisibleButtons = [nbEdit, nbPost, nbCancel]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEAnticipoPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBEUsar
        Exclusivo = True
        ControlEdit = CEAnticipo
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object PAnticipo: TLFPanel
      Left = 0
      Top = 48
      Width = 564
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object LBLSaldoCtaAnt: TLFLabel
        Left = 206
        Top = 13
        Width = 130
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo Cta. Anticipos Cliente'
      end
      object LBLUsar: TLFLabel
        Left = 33
        Top = 13
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usar'
      end
      object EDSaldoCtaAnt: TLFEdit
        Left = 341
        Top = 9
        Width = 114
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEUsar: TLFDbedit
        Left = 61
        Top = 9
        Width = 114
        Height = 21
        TabOrder = 1
      end
    end
    object PRelacionada: TLFPanel
      Left = 0
      Top = 89
      Width = 564
      Height = 19
      Align = alTop
      BevelOuter = bvNone
      Color = clAppWorkSpace
      TabOrder = 2
      object LBLFacturaRel: TLFLabel
        Left = 5
        Top = 3
        Width = 52
        Height = 13
        Alignment = taCenter
        Caption = 'Factura'
      end
      object LBLineaRel: TLFLabel
        Left = 61
        Top = 3
        Width = 43
        Height = 13
        Alignment = taCenter
        Caption = 'L'#237'nea'
      end
      object LBLImporteRel: TLFLabel
        Left = 108
        Top = 3
        Width = 100
        Height = 13
        Alignment = taCenter
        Caption = 'Importe'
      end
      object LBLAnticiposRel: TLFLabel
        Left = 428
        Top = 3
        Width = 111
        Height = 13
        Alignment = taRightJustify
        Caption = 'Anticipos Relacionados'
      end
    end
    object DBCGAnticiposDisp: TLFDBCtrlGrid
      Left = 0
      Top = 227
      Width = 564
      Height = 125
      Align = alTop
      ColCount = 1
      DataSource = DMRelacionaAnticipo.DSxAnticiposDisp
      PanelHeight = 25
      PanelWidth = 548
      TabOrder = 3
      RowCount = 5
      SelectedColor = clHighlight
      OnDblClick = DBCGAnticiposDispDblClick
      object DBERigDisp: TLFDbedit
        Left = 5
        Top = 2
        Width = 52
        Height = 21
        Color = clInfoBk
        DataField = 'RIG'
        DataSource = DMRelacionaAnticipo.DSxAnticiposDisp
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBELineaDisp: TLFDbedit
        Left = 61
        Top = 2
        Width = 43
        Height = 21
        Color = clInfoBk
        DataField = 'LINEA'
        DataSource = DMRelacionaAnticipo.DSxAnticiposDisp
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEImporteDisp: TLFDbedit
        Left = 108
        Top = 2
        Width = 100
        Height = 21
        Color = clInfoBk
        DataField = 'PRECIO'
        DataSource = DMRelacionaAnticipo.DSxAnticiposDisp
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEImporteREstoDisp: TLFDbedit
        Left = 211
        Top = 2
        Width = 100
        Height = 21
        Color = clInfoBk
        DataField = 'RESTO_ANTICIPO'
        DataSource = DMRelacionaAnticipo.DSxAnticiposDisp
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object PDisponibles: TLFPanel
      Left = 0
      Top = 208
      Width = 564
      Height = 19
      Align = alTop
      BevelOuter = bvNone
      Color = clAppWorkSpace
      TabOrder = 4
      object LBLRigDisp: TLFLabel
        Left = 5
        Top = 3
        Width = 52
        Height = 13
        Alignment = taCenter
        Caption = 'Factura'
      end
      object LBLLineaDisp: TLFLabel
        Left = 61
        Top = 3
        Width = 43
        Height = 13
        Alignment = taCenter
        Caption = 'L'#237'nea'
      end
      object LBLImporteDisp: TLFLabel
        Left = 211
        Top = 5
        Width = 100
        Height = 13
        Alignment = taCenter
        Caption = 'Imp. Disponible'
      end
      object LBLAnticiposDisp: TLFLabel
        Left = 439
        Top = 3
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Anticipos Disponibles'
      end
      object LFLabel1: TLFLabel
        Left = 108
        Top = 5
        Width = 100
        Height = 13
        Alignment = taCenter
        Caption = 'Importe Anticipado'
      end
    end
    object DBCGAnticiposRel: TLFDBCtrlGrid
      Left = 0
      Top = 108
      Width = 564
      Height = 100
      Align = alTop
      AllowDelete = False
      AllowInsert = False
      ColCount = 1
      DataSource = DMRelacionaAnticipo.DSxAnticiposRel
      PanelHeight = 25
      PanelWidth = 548
      TabOrder = 5
      RowCount = 4
      SelectedColor = clHighlight
      OnDblClick = DBCGAnticiposRelDblClick
      object DBERigRel: TLFDbedit
        Left = 5
        Top = 2
        Width = 52
        Height = 21
        Color = clInfoBk
        DataField = 'RIG'
        DataSource = DMRelacionaAnticipo.DSxAnticiposRel
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBELineaRel: TLFDbedit
        Left = 61
        Top = 2
        Width = 43
        Height = 21
        Color = clInfoBk
        DataField = 'LINEA'
        DataSource = DMRelacionaAnticipo.DSxAnticiposRel
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEImporteRel: TLFDbedit
        Left = 108
        Top = 2
        Width = 100
        Height = 21
        Color = clInfoBk
        DataField = 'IMPORTE_ANT'
        DataSource = DMRelacionaAnticipo.DSxAnticiposRel
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object TBValida: TLFToolBar
      Left = 0
      Top = 0
      Width = 564
      Height = 24
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 6
      Separators = True
      object TButtValida: TToolButton
        Left = 0
        Top = 0
        Hint = 'Salir y Validar Cambios'
        Caption = 'Valida'
        ImageIndex = 19
        OnClick = TButtValidaClick
      end
      object TButtSalir: TToolButton
        Left = 23
        Top = 0
        Hint = 'Salir y deshacer cambios'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
  end
  object CEAnticipo: TControlEdit
    PanelEdicion = PAnticipo
    PopUpMenu = CEAnticipoPMEdit
    Teclas = DMMain.Teclas
    Left = 464
    Top = 32
  end
  object CEAnticipoPMEdit: TPopUpTeclas
    Left = 496
    Top = 32
    object CEAnticipoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEAnticipoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEAnticipoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEAnticipoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEAnticipoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAnticipoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAnticipoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAnticipoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAnticipoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAnticipoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
