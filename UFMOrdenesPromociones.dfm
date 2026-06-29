object FMOrdenesPromociones: TFMOrdenesPromociones
  Left = 316
  Top = 187
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Orden de evaluaci'#243'n de promociones'
  ClientHeight = 289
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 289
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 504
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
        Width = 184
        Height = 22
        DataSource = DMOrdenesPromociones.DSQMPromociones
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFMain
        InsertaControl = DBGFMain
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton2: TToolButton
        Left = 184
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSalir: TToolButton
        Left = 192
        Top = 0
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object PNPromociones: TLFPanel
      Left = 0
      Top = 26
      Width = 504
      Height = 263
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGFMain: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 504
        Height = 263
        Align = alClient
        DataSource = DMOrdenesPromociones.DSQMPromociones
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFMainColEnter
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 0
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposNoAccesibles.Strings = (
          'TIPO'
          'TITULO')
        ColumnasCheckBoxes.Strings = (
          'CONTINUA')
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
            FieldName = 'TIPO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 239
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTINUA'
            Visible = True
          end>
      end
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 240
    Top = 48
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 320
    Top = 56
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
    end
  end
end
