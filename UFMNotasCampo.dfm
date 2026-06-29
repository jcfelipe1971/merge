object FMNotasCampo: TFMNotasCampo
  Left = 408
  Top = 179
  Width = 800
  Height = 600
  Caption = 'Notas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 22
    AutoSize = True
    EdgeBorders = [ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 30
      Height = 22
      VisibleButtons = [nbPost]
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
    object TBSepCancelar: TToolButton
      Left = 30
      Top = 0
      Width = 40
      ImageIndex = 1
      Style = tbsSeparator
    end
    object NavCancelar: THYMNavigator
      Left = 70
      Top = 0
      Width = 30
      Height = 22
      VisibleButtons = [nbCancel]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 1
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      OnClickBefore = NavMainClickBefore
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TSep1: TToolButton
      Left = 100
      Top = 0
      Width = 40
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 140
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
  end
  object PNLOrtografia: TLFPanel
    Left = 592
    Top = 22
    Width = 200
    Height = 551
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object TBOrtografia: TLFToolBar
      Left = 0
      Top = 0
      Width = 200
      Height = 23
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      Separators = True
      object TBComprobar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Comprobar'
        Caption = 'Comprobar'
        ImageIndex = 85
        OnClick = TBComprobarClick
      end
      object TBSep1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        ImageIndex = 1
        Style = tbsSeparator
      end
      object TBAgregarPalabra: TToolButton
        Left = 31
        Top = 0
        Hint = 'Agregar Palabra'
        Caption = 'Agregar Palabra'
        ImageIndex = 19
        OnClick = TBAgregarPalabraClick
      end
    end
    object LBPalabras: TListBox
      Left = 0
      Top = 23
      Width = 200
      Height = 528
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object PNLMain: TLFPanel
    Left = 0
    Top = 22
    Width = 592
    Height = 551
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PNLNotasRich: TLFPanel
      Left = 0
      Top = 351
      Width = 592
      Height = 200
      Align = alBottom
      BorderWidth = 1
      TabOrder = 0
      Visible = False
      object Splitter1: TSplitter
        Left = 2
        Top = 129
        Width = 588
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object DBRENotas2: TDBRichEdit
        Left = 2
        Top = 132
        Width = 588
        Height = 66
        Align = alBottom
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        OnEnter = DBRENotas2Enter
        OnSelectionChange = DBRENotasSelectionChange
      end
      object DBRENotas: TDBRichEdit
        Left = 2
        Top = 31
        Width = 588
        Height = 98
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnEnter = DBRENotasEnter
        OnSelectionChange = DBRENotasSelectionChange
      end
      object TBRichEdit: TLFToolBar
        Left = 2
        Top = 2
        Width = 588
        Height = 29
        Images = DMMain.ToolbarImages
        TabOrder = 2
        Separators = True
        object TButtRENegrita: TToolButton
          Left = 0
          Top = 2
          Action = FMain.RichEditBold1
        end
        object TButtRECursiva: TToolButton
          Left = 23
          Top = 2
          Action = FMain.RichEditItalic1
        end
        object TButtRESubrayado: TToolButton
          Left = 46
          Top = 2
          Action = FMain.RichEditUnderline1
        end
        object TButtRESep1: TToolButton
          Left = 69
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtREAlinIzq: TToolButton
          Left = 77
          Top = 2
          Action = FMain.RichEditAlignLeft1
        end
        object TButtREAlinCent: TToolButton
          Left = 100
          Top = 2
          Action = FMain.RichEditAlignCenter1
        end
        object TButtREAlinDer: TToolButton
          Left = 123
          Top = 2
          Action = FMain.RichEditAlignRight1
        end
        object TButtREAlinJus: TToolButton
          Left = 146
          Top = 2
          Action = RichEditAlignJustified
        end
        object TButtRESep2: TToolButton
          Left = 169
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtRESepBulet: TToolButton
          Left = 177
          Top = 2
          Action = FMain.RichEditBullets1
        end
        object TButtRESep3: TToolButton
          Left = 200
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object CBFontName: TLFComboBox
          Left = 208
          Top = 2
          Width = 192
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          OnChange = CBFontNameChange
        end
        object ToolButton1: TToolButton
          Left = 400
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object PNLTamano: TLFPanel
          Left = 408
          Top = 2
          Width = 40
          Height = 22
          TabOrder = 0
          object EFontSize: TLFEdit
            Left = 0
            Top = 1
            Width = 24
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = EFontSizeChange
          end
          object UpDownFontSize: TUpDown
            Left = 24
            Top = 1
            Width = 16
            Height = 21
            Associate = EFontSize
            Min = 0
            Position = 0
            TabOrder = 1
            Wrap = True
          end
        end
      end
    end
    object PNLNotas: TLFPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 351
      Align = alClient
      BorderWidth = 1
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 2
        Top = 280
        Width = 588
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object DBMNotas: TLFDBMemo
        Left = 2
        Top = 2
        Width = 588
        Height = 278
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object DBMNotas2: TLFDBMemo
        Left = 2
        Top = 283
        Width = 588
        Height = 66
        Align = alBottom
        Color = clMoneyGreen
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 220
    Top = 16
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 252
    Top = 16
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
      Visible = False
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
  object ALEditorRichText: TActionList
    Left = 286
    Top = 17
    object RichEditBold1: TRichEditBold
      Category = 'Format'
      AutoCheck = True
      Caption = '&Negrita'
      Hint = 'Negrita'
      ImageIndex = 8
      ShortCut = 16450
      Visible = False
    end
    object RichEditItalic1: TRichEditItalic
      Category = 'Format'
      AutoCheck = True
      Caption = '&Cursiva'
      Hint = 'Cursiva'
      ImageIndex = 9
      ShortCut = 16457
      Visible = False
    end
    object RichEditUnderline1: TRichEditUnderline
      Category = 'Format'
      AutoCheck = True
      Caption = '&Subrayado'
      Hint = 'Subrayado'
      ImageIndex = 10
      ShortCut = 16469
      Visible = False
    end
    object RichEditBullets1: TRichEditBullets
      Category = 'Format'
      AutoCheck = True
      Caption = '&Vi'#241'etas'
      Hint = 'Vi'#241'eta|Inserta una vi'#241'eta en la l'#237'nea actual'
      ImageIndex = 14
      Visible = False
    end
    object RichEditAlignLeft1: TRichEditAlignLeft
      Category = 'Format'
      AutoCheck = True
      Caption = 'Alinear &Izquierda'
      Hint = 'Alinear izquierda|Alinea el texto sangrado a la izquierda'
      ImageIndex = 11
      Visible = False
    end
    object RichEditAlignRight1: TRichEditAlignRight
      Category = 'Format'
      AutoCheck = True
      Caption = 'Alinear &Derecha'
      Hint = 'Alinear Derecha|Alinea el texto sangrado a la derecha'
      ImageIndex = 13
      Visible = False
    end
    object RichEditAlignCenter1: TRichEditAlignCenter
      Category = 'Format'
      AutoCheck = True
      Caption = '&Centrar'
      Hint = 'Centrar|Centra el texto entre los m'#225'rgenes'
      ImageIndex = 12
      Visible = False
    end
    object RichEditAlignJustified: TAction
      Category = 'Format'
      Caption = '&Justificado'
      Hint = 'Justificado|Justifica el texto entre los m'#225'rgenes'
      ImageIndex = 12
      OnExecute = RichEditAlignJustifiedExecute
    end
  end
end
