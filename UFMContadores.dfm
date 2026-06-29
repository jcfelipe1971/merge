inherited FMContadores: TFMContadores
  Left = 422
  Top = 230
  Height = 316
  HelpContext = 317
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Contadores'
  Constraints.MinHeight = 316
  Constraints.MinWidth = 512
  OldCreateOrder = True
  PopupMenu = CECanalSimplePMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      EdgeBorders = [ebBottom]
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtAlta: TToolButton
        Left = 25
        Top = 0
        Hint = 'Repasar el alta de todos los contadores'
        Caption = 'Alta'
        ImageIndex = 57
        OnClick = TButtAltaClick
      end
      object TButtBasicos: TToolButton
        Left = 48
        Top = 0
        Hint = 'Ajusta Contadores b'#225'sicos de la aplicaci'#243'n'
        Caption = 'Ajusta Contadores Basicos'
        ImageIndex = 26
        OnClick = TButtBasicosClick
      end
      object TButtEspecificos: TToolButton
        Left = 71
        Top = 0
        Hint = 
          'Ajusta Contadores espec'#237'ficos de la aplicaci'#243'n a todos los nivel' +
          'es'
        Caption = 'Ajusta Contadores Especificos'
        ImageIndex = 44
        OnClick = TButtEspecificosClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 498
      Height = 233
      ActivePage = TSEmpresa
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSEmpresa: TTabSheet
        Caption = '&Empresa'
        OnShow = TSEmpresaShow
        object PE: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 205
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_E: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 490
            Height = 183
            Align = alClient
            DataSource = DMContadores.DSxConta_E
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
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
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
                FieldName = 'TIPO'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 360
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTADOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taRightJustify
                Width = 60
                Visible = True
              end>
          end
          object TBEmpresa: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
            Height = 22
            AutoSize = True
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
              Width = 176
              Height = 22
              DataSource = DMContadores.DSxConta_E
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
              OnClickBefore = NavMainClickBefore
              Exclusivo = True
              ControlEdit = CEEmpresa
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object PNLInfo_E: TLFPanel
              Left = 176
              Top = 0
              Width = 320
              Height = 22
              AutoSize = True
              BevelOuter = bvNone
              Caption = 'Contadores espec'#237'ficos por Empresa'
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
          Width = 490
          Height = 205
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EE: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 490
            Height = 183
            Align = alClient
            DataSource = DMContadores.DSxConta_EE
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
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
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
                FieldName = 'TIPO'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 360
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTADOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taRightJustify
                Width = 60
                Visible = True
              end>
          end
          object TBEjercicio: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
            Height = 22
            AutoSize = True
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
              Width = 176
              Height = 22
              DataSource = DMContadores.DSxConta_EE
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
              OnClickBefore = NavMainClickBefore
              Exclusivo = True
              ControlEdit = CEEjercicio
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object PNLInfo_EE: TLFPanel
              Left = 176
              Top = 0
              Width = 320
              Height = 22
              Align = alRight
              AutoSize = True
              BevelOuter = bvNone
              Caption = 'Contadores espec'#237'ficos por Empresa-Ejercicio'
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
          Width = 490
          Height = 205
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EEC: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 490
            Height = 183
            Align = alClient
            DataSource = DMContadores.DSxConta_EEC
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
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
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
                FieldName = 'TIPO'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 320
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTADOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taRightJustify
                Width = 54
                Visible = True
              end>
          end
          object TBCanal: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
            Height = 22
            AutoSize = True
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
              Width = 176
              Height = 22
              DataSource = DMContadores.DSxConta_EEC
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
              OnClickBefore = NavMainClickBefore
              Exclusivo = True
              ControlEdit = CECanal
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object PNLInfo_EEC: TLFPanel
              Left = 176
              Top = 0
              Width = 320
              Height = 22
              AutoSize = True
              BevelOuter = bvNone
              Caption = 'Contadores espec'#237'ficos por Empresa-Ejercicio-Canal'
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
        Hint = 'Series Completas'
        Caption = '&Serie'
        ImageIndex = 3
        OnShow = TSSerieShow
        object PEECS: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 205
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EECS: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 490
            Height = 183
            Align = alClient
            DataSource = DMContadores.DSxConta_EECS
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
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
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
                FieldName = 'TIPO'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 320
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTADOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taRightJustify
                Width = 54
                Visible = True
              end>
          end
          object TBSerie: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
            Height = 22
            AutoSize = True
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
              Width = 176
              Height = 22
              DataSource = DMContadores.DSxConta_EECS
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
              OnClickBefore = NavMainClickBefore
              Exclusivo = True
              ControlEdit = CESerie
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object PNLInfo_EECS: TLFPanel
              Left = 176
              Top = 0
              Width = 320
              Height = 22
              AutoSize = True
              BevelOuter = bvNone
              Caption = 'Contadores espec'#237'ficos por Empresa-Ejercicio-Canal-Serie'
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
          Width = 490
          Height = 205
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object HYTDBG_EES: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 490
            Height = 183
            Align = alClient
            DataSource = DMContadores.DSxConta_EES
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
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
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
                FieldName = 'TIPO'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 320
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTADOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taRightJustify
                Width = 54
                Visible = True
              end>
          end
          object TBSerieSimple: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
            Height = 22
            AutoSize = True
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
              Width = 176
              Height = 22
              DataSource = DMContadores.DSxConta_EES
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
              OnClickBefore = NavMainClickBefore
              Exclusivo = True
              ControlEdit = CESerieSimple
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object PNLInfo_EES: TLFPanel
              Left = 176
              Top = 0
              Width = 320
              Height = 22
              BevelOuter = bvNone
              Caption = 'Contadores espec'#237'ficos por Empresa-Ejercicio-Serie'
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
      object TSCanalSimple: TTabSheet
        Caption = 'Canal-Simple'
        OnShow = TSCanalSimpleShow
        object HYTDBG_EC: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 490
          Height = 183
          Align = alClient
          DataSource = DMContadores.DSQMContaEC
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
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
              FieldName = 'TIPO'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 360
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTADOR'
              Title.Alignment = taRightJustify
              Width = 60
              Visible = True
            end>
        end
        object TBCanalSimple: TLFToolBar
          Left = 0
          Top = 0
          Width = 490
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object NavCanalSimple: THYMNavigator
            Left = 0
            Top = 0
            Width = 176
            Height = 22
            DataSource = DMContadores.DSQMContaEC
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CECanalSimplePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = HYTDBG_EC
            InsertaControl = HYTDBG_EEC
            OnClickBefore = NavMainClickBefore
            Exclusivo = True
            ControlEdit = CECanalSimple
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLInfo_CSimple: TLFPanel
            Left = 176
            Top = 0
            Width = 320
            Height = 22
            BevelOuter = bvNone
            Caption = 'Contadores espec'#237'ficos por Empresa-Canal'
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
  inherited TBActions: TLFToolBar
    Top = 263
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  object CEEmpresa: TControlEdit
    EnlazadoA = CEEjercicio
    FichaEdicion = TSEmpresa
    FichaExclusiva = TSEmpresa
    PopUpMenu = CEEmpresaPMEdit
    Teclas = DMMain.Teclas
    Left = 220
    Top = 144
  end
  object CEEmpresaPMEdit: TPopUpTeclas
    Left = 256
    Top = 144
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
      Visible = False
    end
    object CEEmpresaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEEmpresaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEEmpresaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
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
    Left = 220
    Top = 188
  end
  object CECanal: TControlEdit
    EnlazadoA = CESerie
    FichaEdicion = TSCanal
    FichaExclusiva = TSCanal
    PopUpMenu = CECanalPMEdit
    Teclas = DMMain.Teclas
    Left = 220
    Top = 232
  end
  object CEEjercicioPMEdit: TPopUpTeclas
    Left = 258
    Top = 190
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
      Visible = False
    end
    object CEEjercicioMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEEjercicioMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEEjercicioMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEEjercicioMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECanalPMEdit: TPopUpTeclas
    Left = 256
    Top = 236
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
      Visible = False
    end
    object CECanalMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECanalMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECanalMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
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
    Left = 354
    Top = 142
  end
  object CESerieSimple: TControlEdit
    EnlazadoA = CECanalSimple
    FichaEdicion = TSSeriesSimples
    FichaExclusiva = TSSeriesSimples
    PopUpMenu = CESerieSimplePMEdit
    Teclas = DMMain.Teclas
    Left = 354
    Top = 182
  end
  object CESeriePMEdit: TPopUpTeclas
    Left = 390
    Top = 146
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
      Visible = False
    end
    object CESerieMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CESerieMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CESerieMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CESerieMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CESerieSimplePMEdit: TPopUpTeclas
    Left = 390
    Top = 186
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
      Visible = False
    end
    object CESerieSimpleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CESerieSimpleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CESerieSimpleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CESerieSimpleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECanalSimple: TControlEdit
    EnlazadoA = CEEmpresa
    FichaEdicion = TSCanalSimple
    FichaExclusiva = TSCanalSimple
    PopUpMenu = CECanalSimplePMEdit
    Teclas = DMMain.Teclas
    Left = 354
    Top = 232
  end
  object CECanalSimplePMEdit: TPopUpTeclas
    Left = 396
    Top = 228
    object MenuItem1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem11: TMenuItem
      Caption = 'Primero'
    end
    object MenuItem12: TMenuItem
      Caption = 'Anterior'
      Enabled = False
    end
    object MenuItem13: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
    end
    object MenuItem14: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
    end
    object MenuItem15: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
    end
    object MenuItem16: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      Visible = False
    end
    object MenuItem17: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      Visible = False
    end
    object MenuItem18: TMenuItem
      Caption = 'Grabar'
      Enabled = False
    end
    object MenuItem19: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
    end
    object MenuItem20: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
    end
    object CECanalSimpleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
    end
    object CECanalSimpleMiprior: TMenuItem
      Caption = 'Anterior'
    end
    object CECanalSimpleMinext: TMenuItem
      Caption = 'Siguiente'
    end
    object CECanalSimpleMilast: TMenuItem
      Caption = #218'ltimo'
    end
    object CECanalSimpleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
    end
    object CECanalSimpleMidelete: TMenuItem
      Caption = 'Borrar'
    end
    object CECanalSimpleMiedit: TMenuItem
      Caption = 'Modificar'
    end
    object CECanalSimpleMipost: TMenuItem
      Caption = 'Grabar'
    end
    object CECanalSimpleMicancel: TMenuItem
      Caption = 'Cancelar'
    end
    object CECanalSimpleMirefresh: TMenuItem
      Caption = 'Refrescar'
    end
  end
end
