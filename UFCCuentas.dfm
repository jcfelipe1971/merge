object FCCuentas: TFCCuentas
  Left = 356
  Top = 292
  ActiveControl = EDTBusca
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Cuentas ( Consulta/B'#250'squeda )'
  ClientHeight = 273
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TBNav: TLFToolBar
    Left = 0
    Top = 0
    Width = 524
    Height = 26
    AutoSize = True
    ButtonHeight = 26
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
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
      Width = 80
      Height = 26
      DataSource = DMCuentas.DSxCuentas
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
    object TButtSeparador1: TToolButton
      Left = 80
      Top = 0
      Width = 13
      Style = tbsSeparator
    end
    object LBLConsCuentas: TLFLabel
      Left = 93
      Top = 0
      Width = 99
      Height = 26
      AutoSize = False
      Caption = 'Consulta cuentas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object TButtSeparador2: TToolButton
      Left = 192
      Top = 0
      Width = 27
      Style = tbsSeparator
    end
    object EPMain: THYMEditPanel
      Left = 219
      Top = 0
      Width = 22
      Height = 26
      DataSource = DMCuentas.DSxCuentas
      VisibleButtons = [neSalir]
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
      ControlEdit = CEMain
    end
  end
  object TBBusca: TLFToolBar
    Left = 0
    Top = 26
    Width = 524
    Height = 21
    AutoSize = True
    ButtonHeight = 21
    EdgeBorders = [ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    TabOrder = 1
    Separators = True
    object TButtSeparador4: TToolButton
      Left = 0
      Top = 0
      Width = 10
      Style = tbsSeparator
    end
    object LBLNivel: TLFLabel
      Left = 10
      Top = 0
      Width = 41
      Height = 21
      AutoSize = False
      Caption = '&Nivel'
      FocusControl = CBFiltra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object CBFiltra: TLFComboBox
      Left = 51
      Top = 0
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = EDTBuscaChange
    end
    object TButtSeparador3: TToolButton
      Left = 162
      Top = 0
      Width = 16
      Style = tbsSeparator
    end
    object LBLBusca: TLFLabel
      Left = 178
      Top = 0
      Width = 42
      Height = 21
      AutoSize = False
      Caption = '&Busca'
      FocusControl = EDTBusca
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object EDTBusca: TLFEdit
      Left = 220
      Top = 0
      Width = 244
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 35
      TabOrder = 1
      OnChange = EDTBuscaChange
      OnKeyDown = EDTBuscaKeyDown
    end
  end
  object DBGCuentas: TDBGrid
    Left = 0
    Top = 47
    Width = 524
    Height = 226
    Align = alClient
    DataSource = DMCuentas.DSxCuentas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUENTA'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Width = 381
        Visible = True
      end>
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 318
    Top = 126
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 364
    Top = 126
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
    object CEMainMiSep: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEMainMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
end
