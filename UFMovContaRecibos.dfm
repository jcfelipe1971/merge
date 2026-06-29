object FMovContaRecibos: TFMovContaRecibos
  Left = 542
  Top = 193
  HelpContext = 275
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Recibos del Asiento'
  ClientHeight = 343
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poDefault
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PNPrincipal: TLFPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 343
    Align = alClient
    TabOrder = 0
    object DBLabelMaestro: TDBText
      Left = 8
      Top = 50
      Width = 73
      Height = 17
      Alignment = taRightJustify
      DataField = 'TIPO_MAESTRO'
      DataSource = DMMovConta.DSxRecibos
    end
    object LBLCuenta: TLFLabel
      Left = 47
      Top = 72
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object DBGFRecibos: TDBGridFind2000
      Left = 1
      Top = 102
      Width = 590
      Height = 240
      Align = alBottom
      DataSource = DMMovConta.DSxRecibos
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGFRecibosDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 2
      IndiceBitmapAscendente = 3
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 3
      Transaction = DMRecibosFactura.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposNoAccesibles.Strings = (
        'REGISTRO'
        'LINEA'
        'VENCIMIENTO'
        'PAGADO'
        'IMPAGADO'
        'LIQUIDO')
      ColumnasCheckBoxes.Strings = (
        'PAGADO'
        'IMPAGADO'
        'RECIBIDO')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clAqua
          Expanded = False
          FieldName = 'REGISTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 62
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 66
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 84
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO_CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 93
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA_CAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 51
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PAGADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 29
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPAGADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 37
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RECIBIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 32
          Visible = True
        end>
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 590
      Height = 26
      AutoSize = True
      Caption = ''
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object TButtSalir: TToolButton
        Left = 0
        Top = 0
        Hint = 'Cerrar la ventana'
        Caption = 'Salir'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtSalirClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object NavMain: THYMNavigator
        Left = 31
        Top = 0
        Width = 88
        Height = 22
        DataSource = DMMovConta.DSxRecibos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton1: TToolButton
        Left = 119
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRecibosAgrupados: TToolButton
        Left = 127
        Top = 0
        Hint = 'Muestra los Recibos Agrupados'
        Caption = 'Recibos Agrupados'
        ImageIndex = 83
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRecibosAgrupadosClick
      end
    end
    object DBEMaestro: TLFDbedit
      Left = 86
      Top = 46
      Width = 44
      Height = 21
      Color = clInfoBk
      DataField = 'MAESTRO'
      DataSource = DMMovConta.DSxRecibos
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
    object DBETitCliente: TLFDbedit
      Left = 131
      Top = 46
      Width = 456
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE_R_SOCIAL'
      DataSource = DMMovConta.DSxRecibos
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
    object DBECuenta: TLFDbedit
      Left = 86
      Top = 68
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'CUENTA_CP'
      DataSource = DMMovConta.DSxRecibos
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
    object DBETitCuenta: TLFDbedit
      Left = 208
      Top = 68
      Width = 379
      Height = 21
      Color = clInfoBk
      DataField = 'TIT_CUENTA'
      DataSource = DMMovConta.DSxRecibos
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
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 394
    Top = 10
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 440
    Top = 10
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
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
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
