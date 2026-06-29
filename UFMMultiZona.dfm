object FMMultiZona: TFMMultiZona
  Left = 551
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Multi Zonas'
  ClientHeight = 220
  ClientWidth = 341
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
    Width = 341
    Height = 22
    AutoSize = True
    DisabledImages = DMMain.ILMain_In
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 88
      Height = 22
      DataSource = DMMultiZona.DSxMultiZona
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
      Left = 88
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtMarcarTodos: TToolButton
      Left = 96
      Top = 0
      Action = AMarcarTodos
      ParentShowHint = False
      ShowHint = True
    end
    object TButtDesmarcarTodos: TToolButton
      Left = 119
      Top = 0
      Action = ADesmarcarTodos
      ParentShowHint = False
      ShowHint = True
    end
    object TButtSalir: TToolButton
      Left = 142
      Top = 0
      Action = ASalir
      ParentShowHint = False
      ShowHint = True
    end
  end
  object PMain: TLFPanel
    Left = 0
    Top = 22
    Width = 341
    Height = 198
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGSeleccion: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 341
      Height = 198
      Align = alClient
      DataSource = DMMultiZona.DSxMultiZona
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
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMMultiZona.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'AGRUPACION')
      CamposNoAccesibles.Strings = (
        'AGRUPACION'
        'ENTRADA'
        'TITULO')
      ColumnasCheckBoxes.Strings = (
        'MARCADO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ZONA'
          ReadOnly = True
          Width = 68
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 178
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          Width = 49
          Visible = True
        end>
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 340
    Top = 121
    object AMarcarTodos: TAction
      Caption = 'AMarcarTodos'
      Hint = 'Marcar Todos'
      ImageIndex = 146
      OnExecute = AMarcarTodosExecute
    end
    object ADesmarcarTodos: TAction
      Caption = 'ADesmarcarTodos'
      Hint = 'Desmarcar Todos'
      ImageIndex = 147
      OnExecute = ADesmarcarTodosExecute
    end
    object ASalir: TAction
      Caption = 'ASalir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
  end
  object CEMain: TControlEdit
    DataSource = DMMultiZona.DSxMultiZona
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 376
    Top = 66
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 416
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
      Visible = False
    end
  end
end
