object FMCambiaFacProv: TFMCambiaFacProv
  Left = 439
  Top = 518
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Introducci'#243'n Manual de IVA y Rec.'
  ClientHeight = 289
  ClientWidth = 504
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 504
    Height = 26
    AutoSize = True
    BorderWidth = 1
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object HYMNavTipoIva: THYMNavigator
      Left = 0
      Top = 0
      Width = 132
      Height = 22
      DataSource = DMCambiaFacProv.DSTipoIva
      VisibleButtons = [nbPrior, nbNext, nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = DBGCierraDocumento
      Exclusivo = True
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object ToolButton1: TToolButton
      Left = 132
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPSalir: THYMEditPanel
      Left = 140
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
  end
  object PNLSeparador: TLFPanel
    Left = 0
    Top = 26
    Width = 504
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGCierraDocumento: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 504
      Height = 263
      Align = alClient
      DataSource = DMCambiaFacProv.DSTipoIva
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'TIPO_IVA')
      CamposNoAccesibles.Strings = (
        'TIPO_IVA')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          DropDownRows = 4
          Expanded = False
          FieldName = 'TIPO_IVA'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 60
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'I_IVA'
          Title.Alignment = taRightJustify
          Width = 111
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'I_RE'
          Title.Alignment = taRightJustify
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_IVA_CANAL'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_RE_CANAL'
          Width = 101
          Visible = True
        end>
    end
  end
end
