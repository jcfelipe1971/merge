object FMPackingListEdCampos: TFMPackingListEdCampos
  Left = 274
  Top = 231
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Edici'#243'n de campos'
  ClientHeight = 139
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 139
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object LBLPesoUnitario: TLFLabel
      Left = 43
      Top = 61
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Peso unitario'
    end
    object LBLPeso: TLFLabel
      Left = 80
      Top = 39
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Peso'
    end
    object LBLVolumen: TLFLabel
      Left = 64
      Top = 61
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Volumen'
    end
    object LBLDiametroPaq: TLFLabel
      Left = 21
      Top = 83
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Di'#225'metro paquete'
    end
    object LBLTituloBulto: TLFLabel
      Left = 77
      Top = 105
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'T'#237'tulo'
    end
    object TBMain: TLFToolBar
      Left = 2
      Top = 2
      Width = 332
      Height = 26
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 46
        Height = 22
        VisibleButtons = [nbPost, nbCancel]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        OnClickBefore = NavMainClickBefore
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object DBEPesoUnitario: TLFDbedit
      Left = 109
      Top = 58
      Width = 89
      Height = 21
      DataField = 'PESO_UNITARIO'
      DataSource = DMPackingList.DSQMBultosDet
      TabOrder = 1
    end
    object DBEPeso: TLFDbedit
      Left = 109
      Top = 36
      Width = 89
      Height = 21
      DataField = 'PESO'
      DataSource = DMPackingList.DSQMBultoActual
      TabOrder = 2
    end
    object DBEVolumen: TLFDbedit
      Left = 109
      Top = 58
      Width = 89
      Height = 21
      DataField = 'VOLUMEN'
      DataSource = DMPackingList.DSQMBultoActual
      TabOrder = 3
    end
    object DBEDiametroPaq: TLFDbedit
      Left = 109
      Top = 80
      Width = 89
      Height = 21
      DataField = 'DIAMETRO'
      DataSource = DMPackingList.DSQMBultoActual
      TabOrder = 4
    end
    object DBETituloBulto: TLFDbedit
      Left = 109
      Top = 102
      Width = 205
      Height = 21
      DataField = 'TITULO_BULTO'
      DataSource = DMPackingList.DSQMBultoActual
      TabOrder = 5
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 144
    Top = 8
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 176
    Top = 8
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
