object ProFMGestOrden: TProFMGestOrden
  Left = 208
  Top = 156
  Width = 766
  Height = 389
  Caption = 'Gesti'#243'n Ordenes Producci'#243'n - Lanzamientos & Cierres'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PopupMenu = CECierresPMEdit
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 758
    Height = 25
    DisabledImages = DMMain.ILMain_In
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavOrden: THYMNavigator
      Left = 0
      Top = 0
      Width = 140
      Height = 22
      DataSource = ProDMGestOrden.DSQMProOrd
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbRefresh]
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
    object Orden: TLFComboBox
      Left = 140
      Top = 0
      Width = 160
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = OrdenChange
      Items.Strings = (
        'Deslanzada'
        'Lanzada'
        'Lanzada + Reservada'
        'Cerrada Parcialmente'
        'Cerrada Totalmente'
        'Todas')
    end
    object TSep1: TToolButton
      Left = 300
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object CBAlmacen: TLFComboBox
      Left = 308
      Top = 0
      Width = 213
      Height = 21
      Hint = 'Almacen'
      Style = csDropDownList
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = CBAlmacenChange
    end
    object TSep2: TToolButton
      Left = 521
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtLanzarOF: TToolButton
      Left = 529
      Top = 0
      Hint = 'Lanzar Orden de Producci'#243'n'
      Caption = 'Lanzar Orden de Producci'#243'n'
      ImageIndex = 92
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtLanzarOFClick
    end
    object TSep3: TToolButton
      Left = 552
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object BLanzarReservar: TToolButton
      Left = 560
      Top = 0
      Hint = 'Lanzar+Reservar'
      Caption = 'Lanzar+Reservar'
      ImageIndex = 8
      OnClick = BLanzarReservarClick
    end
    object BtSeleccionaTodos: TToolButton
      Left = 583
      Top = 0
      Hint = 'Seleccionar/Deseleccionar por Situacion'
      Caption = 'Selecciona Todas'
      ImageIndex = 146
      OnClick = BtSeleccionaTodosClick
    end
    object BtCalculaNecesidades: TToolButton
      Left = 606
      Top = 0
      Hint = 'Calcula Necesidades por Almacen'
      Caption = 'Calcula Necesidades'
      ImageIndex = 3
      OnClick = BtCalculaNecesidadesClick
    end
    object HYMEditPanel1: THYMEditPanel
      Left = 629
      Top = 0
      Width = 60
      Height = 22
      VisibleButtons = [neImprime, neRango, neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
      OnClickRango = HYMEditPanel1ClickRango
    end
  end
  object TBActions: TLFToolBar
    Left = 0
    Top = 338
    Width = 758
    Height = 24
    Align = alBottom
    ButtonHeight = 21
    ButtonWidth = 51
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    List = True
    ShowCaptions = True
    TabOrder = 1
    Separators = True
  end
  object PCMain: TLFPageControl
    Left = 0
    Top = 25
    Width = 758
    Height = 313
    ActivePage = TSOrdenes
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSOrdenes: TTabSheet
      Caption = 'Ordenes'
      object DBGFOrden: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 750
        Height = 285
        Align = alClient
        DataSource = ProDMGestOrden.DSQMProOrd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFOrdenDrawColumnCell
        IniStorage = FSMain
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
          'RIG_OF'
          'SUBORDEN'
          'CLIENTE'
          'COMPUESTO'
          'ESCANDALLO')
        ColumnasCheckBoxes.Strings = (
          'SELECCIONADA')
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
            Expanded = False
            FieldName = 'SELECCIONADA'
            Width = 26
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'Situ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 145
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID_ORDEN'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RIG_OF'
            ReadOnly = True
            Width = 54
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SUBORDEN'
            ReadOnly = True
            Width = 58
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_ORD'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CLIENTE'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TituloCliente'
            ReadOnly = True
            Width = 220
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COMPUESTO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TituloCompuesto'
            ReadOnly = True
            Width = 220
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ESCANDALLO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PEDIDO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA_PED'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_PED'
            ReadOnly = True
            Width = 93
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNI_PEDID'
            ReadOnly = True
            Width = 84
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNI_MANUAL'
            ReadOnly = True
            Width = 90
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNI_TOTAL'
            ReadOnly = True
            Width = 69
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_ENTREGA'
            ReadOnly = True
            Width = 79
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COSTE_TOT_PRE'
            ReadOnly = True
            Width = 106
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COSTE_TOT_REAL'
            ReadOnly = True
            Width = 91
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALMACEN_SAL'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALMACEN_LAN'
            ReadOnly = True
            Width = 75
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALMACEN_ENT'
            ReadOnly = True
            Width = 88
            Visible = True
          end>
      end
    end
    object TSNecesidades: TTabSheet
      Caption = 'Necesidades'
      ImageIndex = 1
      object DBNecesidades: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 750
        Height = 285
        Align = alClient
        DataSource = ProDMGestOrden.DSQMNecesidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFOrdenDrawColumnCell
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
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
          'RIG_OF'
          'SUBORDEN'
          'CLIENTE'
          'COMPUESTO'
          'ESCANDALLO')
        ColumnasCheckBoxes.Strings = (
          'SELECCIONADA')
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
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Visible = True
          end>
      end
    end
  end
  object CEMain: TControlEdit
    EnlazadoA = CECierres
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 288
    Top = 64
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 328
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
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECierres: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CECierresPMEdit
    Teclas = DMMain.Teclas
    Left = 312
    Top = 168
  end
  object CECierresPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 368
    Top = 168
    object CECierresMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECierresMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECierresMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECierresMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECierresMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECierresMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECierresMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECierresMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECierresMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECierresMirefresh: TMenuItem
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
    Top = 208
  end
end
