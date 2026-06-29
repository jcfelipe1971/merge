inherited FMContRec: TFMContRec
  Left = 510
  Top = 170
  Width = 514
  Height = 318
  HelpContext = 318
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Contadores de Recuperaci'#243'n'
  PopupMenu = CESerieSimplePMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 500
      EdgeBorders = [ebBottom]
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtBorrarTodos: TToolButton
        Left = 25
        Top = 0
        Hint = 'Borra TODOS los Contadores seg'#250'n el Tipo seleccionado'
        Caption = 'Borrar Todos'
        ImageIndex = 39
        OnClick = TButtBorrarTodosClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 500
      Height = 235
      ActivePage = TSSeriesSimples
      Align = alClient
      OwnerDraw = True
      TabIndex = 4
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSEmpresa: TTabSheet
        Caption = '&Empresa'
        OnShow = TSEmpresaShow
        object PE: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 207
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_E: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 492
            Height = 183
            Align = alClient
            Color = clWhite
            DataSource = DMContRec.DSxContRec_E
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
              'CONTADOR'
              'FECHA')
            CamposNoAccesibles.Strings = (
              'TIPO'
              'TITULO')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OnRowChange = HYTDBGRowChange
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CONTADOR'
                ReadOnly = True
                Width = 220
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 242
                Visible = True
              end>
          end
          object TBEmpresa: TLFToolBar
            Left = 0
            Top = 0
            Width = 492
            Height = 24
            EdgeBorders = [ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavEmpresa: THYMNavigator
              Left = 0
              Top = 0
              Width = 132
              Height = 22
              DataSource = DMContRec.DSxContRec_E
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEEmpresaPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = HYTDBG_E
              InsertaControl = HYTDBG_E
              Exclusivo = True
              ControlEdit = CEEmpresa
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton2: TToolButton
              Left = 132
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object DBCBTipoE: TDBLookupComboBox
              Left = 140
              Top = 0
              Width = 207
              Height = 21
              KeyField = 'TIPO'
              ListField = 'TIPO;TITULO'
              ListFieldIndex = 1
              ListSource = DMContRec.DSxTipoE
              TabOrder = 2
            end
            object PNLInfo_E: TLFPanel
              Left = 347
              Top = 0
              Width = 149
              Height = 22
              BevelOuter = bvNone
              Caption = 'Por Empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object TSEjercicio: TTabSheet
        Caption = '&Ejercicio'
        ImageIndex = 1
        OnShow = TSEjercicioShow
        object PEE: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 207
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EE: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 492
            Height = 183
            Align = alClient
            Color = clWhite
            DataSource = DMContRec.DSxContRec_EE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
              'CONTADOR'
              'FECHA')
            CamposNoAccesibles.Strings = (
              'TIPO'
              'TITULO')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OnRowChange = HYTDBGRowChange
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CONTADOR'
                ReadOnly = True
                Width = 220
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 242
                Visible = True
              end>
          end
          object TBEjercicio: TLFToolBar
            Left = 0
            Top = 0
            Width = 492
            Height = 24
            EdgeBorders = [ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavEjercicio: THYMNavigator
              Left = 0
              Top = 0
              Width = 132
              Height = 22
              DataSource = DMContRec.DSxContRec_EE
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEEjercicioPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = HYTDBG_EE
              InsertaControl = HYTDBG_EE
              Exclusivo = True
              ControlEdit = CEEjercicio
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton3: TToolButton
              Left = 132
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object DBCBTipoEE: TDBLookupComboBox
              Left = 140
              Top = 0
              Width = 207
              Height = 21
              KeyField = 'TIPO'
              ListField = 'TIPO;TITULO'
              ListFieldIndex = 1
              ListSource = DMContRec.DSxTipoEE
              TabOrder = 2
            end
            object PNLInfo_EE: TLFPanel
              Left = 347
              Top = 0
              Width = 149
              Height = 22
              Align = alRight
              BevelOuter = bvNone
              Caption = 'Por Emp-Ejercicio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object TSCanal: TTabSheet
        Caption = '&Canal'
        ImageIndex = 2
        OnShow = TSCanalShow
        object PEEC: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 207
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EEC: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 492
            Height = 183
            Align = alClient
            Color = clWhite
            DataSource = DMContRec.DSxContRec_EEC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
              'CONTADOR'
              'FECHA'
              'CANAL')
            CamposNoAccesibles.Strings = (
              'TITULO'
              'TIPO'
              'CANAL')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OnRowChange = HYTDBGRowChange
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CONTADOR'
                ReadOnly = True
                Width = 220
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 192
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL'
                ReadOnly = True
                Width = 49
                Visible = True
              end>
          end
          object TBCanal: TLFToolBar
            Left = 0
            Top = 0
            Width = 492
            Height = 24
            EdgeBorders = [ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavCanal: THYMNavigator
              Left = 0
              Top = 0
              Width = 132
              Height = 22
              DataSource = DMContRec.DSxContRec_EEC
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CECanalPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = HYTDBG_EEC
              InsertaControl = HYTDBG_EEC
              Exclusivo = True
              ControlEdit = CECanal
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton4: TToolButton
              Left = 132
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object DBCBTipoEEC: TDBLookupComboBox
              Left = 140
              Top = 0
              Width = 207
              Height = 21
              KeyField = 'TIPO'
              ListField = 'TIPO;TITULO'
              ListFieldIndex = 1
              ListSource = DMContRec.DSxTipoEEC
              TabOrder = 2
            end
            object PNLInfo_EEC: TLFPanel
              Left = 347
              Top = 0
              Width = 149
              Height = 22
              BevelOuter = bvNone
              Caption = 'Por Emp-Ejer-Canal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object TSSerie: TTabSheet
        Caption = '&Serie'
        ImageIndex = 3
        OnShow = TSSerieShow
        object PEECS: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 207
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EECS: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 492
            Height = 183
            Align = alClient
            Color = clWhite
            DataSource = DMContRec.DSxContRec_EECS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
              'CONTADOR'
              'FECHA'
              'SERIE')
            CamposNoAccesibles.Strings = (
              'TITULO'
              'TIPO'
              'SERIE')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OnRowChange = HYTDBGRowChange
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CONTADOR'
                ReadOnly = True
                Width = 220
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 192
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 49
                Visible = True
              end>
          end
          object TBSerie: TLFToolBar
            Left = 0
            Top = 0
            Width = 492
            Height = 24
            EdgeBorders = [ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavSerie: THYMNavigator
              Left = 0
              Top = 0
              Width = 132
              Height = 22
              DataSource = DMContRec.DSxContRec_EECS
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CESeriePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = HYTDBG_EECS
              InsertaControl = HYTDBG_EECS
              Exclusivo = True
              ControlEdit = CESerie
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton5: TToolButton
              Left = 132
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object DBCBTipoEECS: TDBLookupComboBox
              Left = 140
              Top = 0
              Width = 207
              Height = 21
              KeyField = 'TIPO'
              ListField = 'TIPO;TITULO'
              ListFieldIndex = 1
              ListSource = DMContRec.DSxTipoEECS
              TabOrder = 2
            end
            object PNLInfo_EECS: TLFPanel
              Left = 347
              Top = 0
              Width = 149
              Height = 22
              BevelOuter = bvNone
              Caption = 'Por Emp-Ejer-Can-Ser'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object TSSeriesSimples: TTabSheet
        Caption = 'Se&rie-Simple'
        OnShow = TSSeriesSimplesShow
        object PEES: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 207
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EES: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 492
            Height = 183
            Align = alClient
            Color = clWhite
            DataSource = DMContRec.DSxContRec_EES
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
              'CONTADOR'
              'FECHA'
              'SERIE')
            CamposNoAccesibles.Strings = (
              'TITULO'
              'TIPO'
              'SERIE')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OnRowChange = HYTDBGRowChange
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CONTADOR'
                ReadOnly = True
                Width = 220
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Width = 192
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 49
                Visible = True
              end>
          end
          object TBSerieSimple: TLFToolBar
            Left = 0
            Top = 0
            Width = 492
            Height = 24
            EdgeBorders = [ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavSerieSimple: THYMNavigator
              Left = 0
              Top = 0
              Width = 132
              Height = 22
              DataSource = DMContRec.DSxContRec_EES
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CESerieSimplePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = HYTDBG_EES
              InsertaControl = HYTDBG_EES
              Exclusivo = True
              ControlEdit = CESerieSimple
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton6: TToolButton
              Left = 132
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object DBCBTipoEES: TDBLookupComboBox
              Left = 140
              Top = 0
              Width = 207
              Height = 21
              KeyField = 'TIPO'
              ListField = 'TIPO;TITULO'
              ListFieldIndex = 1
              ListSource = DMContRec.DSxTipoEES
              TabOrder = 2
            end
            object PNLInfo_EES: TLFPanel
              Left = 347
              Top = 0
              Width = 149
              Height = 22
              BevelOuter = bvNone
              Caption = 'Por Emp-Ejer-Serie'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 504
  end
  object CEEmpresa: TControlEdit
    EnlazadoA = CEEjercicio
    FichaEdicion = TSEmpresa
    FichaExclusiva = TSEmpresa
    PopUpMenu = CEEmpresaPMEdit
    Teclas = DMMain.Teclas
    Left = 52
    Top = 171
  end
  object CEEmpresaPMEdit: TPopUpTeclas
    Left = 96
    Top = 171
    object CEEmpresaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEEmpresaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEEmpresaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEEmpresaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEEmpresaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEEmpresaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEEmpresaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEEmpresaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEEmpresaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEEmpresaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEEjercicio: TControlEdit
    EnlazadoA = CECanal
    FichaEdicion = TSEjercicio
    FichaExclusiva = TSEjercicio
    PopUpMenu = CEEjercicioPMEdit
    Teclas = DMMain.Teclas
    Left = 50
    Top = 215
  end
  object CECanal: TControlEdit
    EnlazadoA = CESerie
    FichaEdicion = TSCanal
    FichaExclusiva = TSCanal
    PopUpMenu = CECanalPMEdit
    Teclas = DMMain.Teclas
    Left = 168
    Top = 173
  end
  object CEEjercicioPMEdit: TPopUpTeclas
    Left = 94
    Top = 215
    object CEEjercicioMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEEjercicioMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEEjercicioMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEEjercicioMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEEjercicioMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEEjercicioMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEEjercicioMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEEjercicioMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEEjercicioMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEEjercicioMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECanalPMEdit: TPopUpTeclas
    Left = 216
    Top = 173
    object CECanalMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECanalMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECanalMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECanalMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECanalMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CECanalMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECanalMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CECanalMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CECanalMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CECanalMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CESerie: TControlEdit
    EnlazadoA = CESerieSimple
    FichaEdicion = TSSerie
    FichaExclusiva = TSSerie
    PopUpMenu = CESeriePMEdit
    Teclas = DMMain.Teclas
    Left = 170
    Top = 221
  end
  object CESerieSimple: TControlEdit
    EnlazadoA = CEEmpresa
    FichaEdicion = TSSeriesSimples
    FichaExclusiva = TSSeriesSimples
    PopUpMenu = CESerieSimplePMEdit
    Teclas = DMMain.Teclas
    Left = 294
    Top = 221
  end
  object CESeriePMEdit: TPopUpTeclas
    Left = 214
    Top = 221
    object CESerieMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CESerieMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CESerieMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CESerieMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CESerieMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CESerieMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CESerieMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CESerieMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CESerieMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CESerieMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CESerieSimplePMEdit: TPopUpTeclas
    Left = 362
    Top = 221
    object CESerieSimpleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CESerieSimpleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CESerieSimpleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CESerieSimpleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CESerieSimpleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CESerieSimpleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CESerieSimpleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CESerieSimpleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CESerieSimpleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CESerieSimpleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
