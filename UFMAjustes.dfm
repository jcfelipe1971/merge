object FMAjustes: TFMAjustes
  Left = 454
  Top = 290
  HelpContext = 329
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ajustes'
  ClientHeight = 289
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 504
    Height = 24
    EdgeBorders = [ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 110
      Height = 22
      DataSource = DMAjustes.DSQMAjustes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
    object TButtSep1: TToolButton
      Left = 110
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPAjustes: THYMEditPanel
      Left = 118
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
    end
  end
  object HYDBAjustes: THYTDBGrid
    Left = 0
    Top = 24
    Width = 504
    Height = 265
    Align = alClient
    DataSource = DMAjustes.DSQMAjustes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    AutoDeseleccionar = True
    PermutaPaneles = False
    CamposAOrdenar.Strings = (
      'FECHA'
      'REVISION'
      'SYS_USUARIO'
      'TIPOS_REVISION'
      'TITULO')
    CamposAOrdenarImgs = DMMain.ILOrdGrid
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'TIPOS_REVISION'
        ReadOnly = True
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'REVISION'
        ReadOnly = True
        Width = 47
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'SYS_USUARIO'
        ReadOnly = True
        Width = 125
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'FECHA'
        ReadOnly = True
        Width = 65
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'TITULO'
        ReadOnly = True
        Width = 175
        Visible = True
      end>
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 320
    Top = 64
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 352
    Top = 64
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
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 520
    Top = 86
  end
end
