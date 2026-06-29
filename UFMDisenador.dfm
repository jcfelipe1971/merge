inherited FMDisenador: TFMDisenador
  Left = 579
  Top = 242
  Width = 700
  Height = 490
  HelpContext = 330
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Dise'#241'ador de Informes'
  Constraints.MinHeight = 490
  Constraints.MinWidth = 700
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 690
    Height = 209
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 686
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMDisenador.DSQMGrupo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBECopias
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 176
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepNav: TToolButton [2]
        Left = 236
      end
      inherited TSepTerc: TToolButton
        Left = 244
      end
      inherited TbuttComp: TToolButton
        Left = 252
        Hint = 'Exporta los listados de la base de datos'
        ImageIndex = 36
        ParentShowHint = False
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 686
      Height = 179
      MultiLine = True
      ScrollOpposite = True
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 678
          Height = 151
          Enabled = True
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMDisenador.DSQMGrupo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'DIC_LISTADOS_GRUPOS'
            CampoNum = 'GRUPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'GRUPO')
          end
          object PNGrupos: TLFPanel
            Left = 0
            Top = 0
            Width = 678
            Height = 151
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LBLGrupo: TLFLabel
              Left = 41
              Top = 23
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Grupo'
            end
            object LBLTitulo: TLFLabel
              Left = 42
              Top = 45
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'T'#237'tulo'
            end
            object LBLCopias: TLFLabel
              Left = 482
              Top = 46
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#250'm. Copias'
            end
            object LBLDefecto: TLFLabel
              Left = 99
              Top = 81
              Width = 91
              Height = 13
              Alignment = taRightJustify
              Caption = 'Listado por defecto'
            end
            object LBLListDefEEC: TLFLabel
              Left = 8
              Top = 103
              Width = 182
              Height = 13
              Alignment = taRightJustify
              Caption = 'Listado por defecto para esta Empresa'
            end
            object LBLDefectoEmail: TLFLabel
              Left = 397
              Top = 80
              Width = 145
              Height = 13
              Alignment = taRightJustify
              Caption = 'Listado por defecto para e-mail'
            end
            object LBLListDefEECEmail: TLFLabel
              Left = 306
              Top = 103
              Width = 236
              Height = 13
              Alignment = taRightJustify
              Caption = 'Listado por defecto para e-mail para esta Empresa'
            end
            object DBEGrupo: TLFDbedit
              Left = 75
              Top = 20
              Width = 82
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'GRUPO'
              DataSource = DMDisenador.DSQMGrupo
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBETitulo: TLFDbedit
              Left = 75
              Top = 42
              Width = 262
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMDisenador.DSQMGrupo
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBECopias: TLFDbedit
              Left = 547
              Top = 42
              Width = 82
              Height = 21
              DataField = 'COPIAS'
              DataSource = DMDisenador.DSQMGrupo
              TabOrder = 3
            end
            object DBEDefecto: TLFDbedit
              Left = 196
              Top = 77
              Width = 82
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'LISTADODEF'
              DataSource = DMDisenador.DSQMGrupo
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
            object DBEPijama: TLFDBCheckBox
              Left = 547
              Top = 22
              Width = 82
              Height = 17
              Caption = 'Pijama'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'PIJAMA'
              DataSource = DMDisenador.DSQMGrupo
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEListDefEEC: TLFDbedit
              Left = 196
              Top = 99
              Width = 82
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'LISTADODEF'
              DataSource = DMDisenador.DSxGrupos_EEC
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
              OnChange = DBEListDefEECChange
            end
            object DBELDefectoMail: TLFDbedit
              Left = 547
              Top = 77
              Width = 82
              Height = 21
              Color = clInfoBk
              DataField = 'LISTADODEFMAIL'
              DataSource = DMDisenador.DSQMGrupo
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              OnChange = DBELDefectoMailChange
            end
            object DBELDefectoMailEEC: TLFDbedit
              Left = 547
              Top = 99
              Width = 82
              Height = 21
              Color = clInfoBk
              DataField = 'LISTADODEFMAIL'
              DataSource = DMDisenador.DSxGrupos_EEC
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              OnChange = DBELDefectoMailEECChange
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 678
          Height = 151
          DataSource = DMDisenador.DSQMGrupo
          ControlEdit = CEMain
          CamposChecked.Strings = (
            'PIJAMA')
          CamposAOrdenar.Strings = (
            'GRUPO'
            'LISTADODEF'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'GRUPO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 261
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PIJAMA'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COPIAS'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LISTADODEF'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LISTADODEFMAIL'
              Width = 68
              Visible = True
            end>
        end
      end
    end
  end
  object PDetalle: TLFPanel [1]
    Left = 0
    Top = 209
    Width = 690
    Height = 228
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCListados: TLFPageControl
      Left = 0
      Top = 0
      Width = 690
      Height = 228
      ActivePage = TSFichaLis
      Align = alClient
      MultiLine = True
      OwnerDraw = True
      ScrollOpposite = True
      TabIndex = 0
      TabOrder = 0
      TabPosition = tpBottom
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFichaLis: TTabSheet
        Caption = 'F&icha'
        OnShow = TSFichaLisShow
        object PNListados: TLFPanel
          Left = 0
          Top = 22
          Width = 682
          Height = 180
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLListado: TLFLabel
            Left = 43
            Top = 20
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Listado'
          end
          object LBLTituloLis: TLFLabel
            Left = 49
            Top = 42
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLCabecera: TLFLabel
            Left = 31
            Top = 64
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cabecera'
          end
          object LBLTipo: TLFLabel
            Left = 175
            Top = 20
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object DBEListado: TLFDbedit
            Left = 82
            Top = 17
            Width = 82
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'LISTADO'
            DataSource = DMDisenador.DSQMListado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETituloLis: TLFDbedit
            Left = 82
            Top = 39
            Width = 352
            Height = 21
            DataField = 'TITULO'
            DataSource = DMDisenador.DSQMListado
            TabOrder = 4
          end
          object DBEEFCabecera: TLFDBEditFind2000
            Left = 82
            Top = 61
            Width = 82
            Height = 21
            AutoSize = False
            DataField = 'CABECERA'
            DataSource = DMDisenador.DSQMListado
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'DIC_LISTADOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'LISTADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'grupo=1000'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBExCabecera: TLFDbedit
            Left = 165
            Top = 61
            Width = 269
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMDisenador.DSxListados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object EFProforma: TLFEditFind2000
            Left = 406
            Top = 17
            Width = 82
            Height = 21
            TabOrder = 3
            Visible = False
            OnChange = EFProformaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'LISTADO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'DIC_LISTADOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFProformaBusqueda
            Filtros = []
          end
          object ChkBProforma: TLFCheckBox
            Left = 269
            Top = 20
            Width = 131
            Height = 17
            Caption = 'Crear igual que listado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            OnClick = ChkBProformaClick
            Alignment = taLeftJustify
          end
          object DBCBTipo: TDBComboBox
            Left = 202
            Top = 17
            Width = 48
            Height = 21
            Style = csDropDownList
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMDisenador.DSQMListado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'FRF'
              'HYR'
              'HYM'
              'FR3')
            ParentFont = False
            TabOrder = 1
            OnChange = DBCBTipoChange
          end
          object DBRGImpresora: TDBRadioGroup
            Left = 505
            Top = 17
            Width = 159
            Height = 80
            Caption = 'Impresora'
            DataField = 'IMPRESORA'
            DataSource = DMDisenador.DSQMListado
            Items.Strings = (
              'Laser'
              'Matricial'
              'Etiquetas')
            TabOrder = 7
            Values.Strings = (
              'L00'
              'M00'
              'E00')
          end
        end
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 682
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMDisenador.DSQMListado
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEEFCabecera
            InsertaControl = EFProforma
            OnClickBefore = NavDetalleClickBefore
            Exclusivo = True
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavDetalleClickAfterAdjust
          end
          object ToolButton2: TToolButton
            Left = 220
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object EPDetalle: THYMEditPanel
            Left = 228
            Top = 0
            Width = 23
            Height = 22
            VisibleButtons = [neRango]
            Hints.Strings = (
              'Buscar'
              'B'#250'squeda aproximada'
              'B'#250'squeda exacta'
              'Imprime pantalla'
              'Filtra rango'
              'Imprime report'
              'Copiar'
              'Cortar'
              'Pegar'
              'Cerrar la ventana')
            ParentShowHint = False
            SalirCaption = 'Salida'
            SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
            ShowHint = True
            TabOrder = 1
            Flat = True
            Exclusivo = True
            OnClickRango = EPDetalleClickRango
          end
          object ToolButton3: TToolButton
            Left = 251
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtDisenar: TToolButton
            Left = 259
            Top = 0
            Hint = 'Dise'#241'ar informe'
            Caption = 'Dise'#241'ar'
            ImageIndex = 77
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtDisenarClick
          end
          object SaveToFR3: TToolButton
            Left = 282
            Top = 0
            Caption = 'Save To FR3'
            ImageIndex = 41
            Visible = False
            OnClick = SaveToFR3Click
          end
        end
      end
      object TSSerieLis: TTabSheet
        Caption = '&Serie'
        ImageIndex = 119
        OnShow = TSSerieLisShow
        object PNLListadoSerie: TLFPanel
          Left = 0
          Top = 22
          Width = 682
          Height = 180
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGFListadosSerie: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 682
            Height = 180
            Align = alClient
            DataSource = DMDisenador.DSQMListadosEECS
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
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
            Transaction = DMDisenador.TLocal
            BuscarNums = False
            Campos.Strings = (
              'SERIE'
              'LISTADODEF'
              'LISTADODEFMAIL')
            CamposAMostrar.Strings = (
              'SERIE'
              '0'
              'LISTADODEF'
              '0'
              'LISTADODEFMAIL'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            Numericos.Strings = (
              'SERIE'
              'LISTADO'
              'LISTADO')
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tablas.Strings = (
              'GEN_SERIES'
              'DIC_LISTADOS'
              'DIC_LISTADOS')
            Acciones.Strings = (
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'GRUPO')
            Posicion = tpCentrado
            OnBusqueda = DBGFListadosSerieBusqueda
            OrdenMultiple = True
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'SERIE'
                Width = 38
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_SERIE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 161
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LISTADODEF'
                Width = 66
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_LISTADO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 319
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LISTADODEFMAIL'
                Width = 53
                Visible = True
              end>
          end
        end
        object TBSeries: TLFToolBar
          Left = 0
          Top = 0
          Width = 682
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavListadoSerie: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            Flat = True
            ParentShowHint = False
            PopupMenu = CEListadoSeriePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFListadosSerie
            InsertaControl = DBGFListadosSerie
            Exclusivo = True
            ControlEdit = CEListadoSerie
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 220
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtDisenarSerie: TToolButton
            Left = 228
            Top = 0
            Hint = 'Dise'#241'ar el Listado de la Serie'
            Caption = 'Dise'#241'ar Serie'
            ImageIndex = 77
            OnClick = TButtDisenarSerieClick
          end
        end
      end
      object TSTablaLis: TTabSheet
        Caption = 'T&abla'
        ImageIndex = 1
        OnShow = TSTablaLisShow
        object DBGListados: THYTDBGrid
          Left = 0
          Top = 0
          Width = 682
          Height = 202
          Align = alClient
          Color = clInfoBk
          DataSource = DMDisenador.DSQMListado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          ControlEdit = FMArticulos.CEMainPMEdit
          TabFicha = TSFichaLis
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'LISTADO'
            'TITULO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              DropDownRows = 3
              Expanded = False
              FieldName = 'LISTADO'
              Width = 66
              Visible = True
            end
            item
              DropDownRows = 3
              Expanded = False
              FieldName = 'TITULO'
              Width = 395
              Visible = True
            end
            item
              DropDownRows = 3
              Expanded = False
              FieldName = 'CABECERA'
              Width = 85
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 437
    Width = 690
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    PanelEdicion = PNGrupos
    Left = 16
    Top = 344
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 16
    Top = 378
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 142
    Top = 344
    object AListDefGrupo: TAction
      Category = 'Procesos'
      Caption = 'Determina este Listado por defecto en el Grupo'
      Hint = 'Determina este Listado por defecto en el Grupo'
      ImageIndex = 4
      OnExecute = AListDefGrupoExecute
    end
    object AListDefEEC: TAction
      Category = 'Procesos'
      Caption = 'Determina este Listado por defecto para esta Empresa'
      Hint = 'Determina este Listado por defecto para esta Empresa'
      ImageIndex = 50
      OnExecute = AListDefEECExecute
    end
    object ALimpiaListDefEEC: TAction
      Category = 'Procesos'
      Caption = 'Borra el Listado por defecto para esta Empresa'
      Hint = 'Borra el Listado por defecto para esta Empresa'
      ImageIndex = 27
      OnExecute = ALimpiaListDefEECExecute
    end
    object AListDefMail: TAction
      Category = 'Procesos'
      Caption = 'Determina este Listado por defecto en el Grupo para e-mail'
      Hint = 'Determina este Listado por defecto en el Grupo para e-mail'
      ImageIndex = 34
      OnExecute = AListDefMailExecute
    end
    object AListDefMailEEC: TAction
      Category = 'Procesos'
      Caption = 'Determina este Listado por defecto para e-mail para esta Empresa'
      Hint = 'Determina este Listado por defecto para e-mail para esta Empresa'
      ImageIndex = 35
      OnExecute = AListDefMailEECExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AImportarListados: TAction
      Category = 'Procesos'
      Caption = 'Importar Listados'
      Hint = 
        'Importa listados de disco a la base de datos'#13#10'[Grupo]-[NumeroLis' +
        'tado] [Titulo].[Formato]'
      ImageIndex = 49
      OnExecute = AImportarListadosExecute
    end
    object AExportarListados: TAction
      Category = 'Procesos'
      Caption = 'Exportar Listados'
      Hint = 
        'Exporta los listados a disco'#13#10'[Grupo]-[NumeroListado] [Titulo].[' +
        'Formato]'
      ImageIndex = 36
      OnExecute = AExportarListadosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 176
    Top = 344
  end
  object CEListadoSerie: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSSerieLis
    FichaExclusiva = TSSerieLis
    Complementario = PMain
    PopUpMenu = CEListadoSeriePMEdit
    Teclas = DMMain.Teclas
    Left = 88
    Top = 344
  end
  object CEListadoSeriePMEdit: TPopUpTeclas
    Left = 88
    Top = 378
    object CEListadoSerieMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16450
    end
    object CEListadoSerieMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16465
    end
    object CEListadoSerieMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16471
    end
    object CEListadoSerieMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16457
    end
    object CEListadoSerieMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16454
    end
    object CEListadoSerieMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16460
    end
    object CEListadoSerieMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16451
    end
    object CEListadoSerieMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16472
    end
    object CEListadoSerieMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16470
    end
    object CEListadoSerieMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16499
    end
    object CEListadoSerieMibuscar: TMenuItem
      Caption = 'Buscar'
    end
    object CEListadoSerieMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
    end
    object CEListadoSerieMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
    end
    object CEListadoSerieMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
    end
    object CEListadoSerieMirango: TMenuItem
      Caption = 'Filtra rango'
    end
    object CEListadoSerieMireport: TMenuItem
      Caption = 'Imprime report'
    end
    object CEListadoSerieMicopy: TMenuItem
      Caption = 'Copiar'
    end
    object CEListadoSerieMicut: TMenuItem
      Caption = 'Cortar'
    end
    object CEListadoSerieMipaste: TMenuItem
      Caption = 'Pegar'
    end
    object CEListadoSerieMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEListadoSerie
    FichaEdicion = TSFichaLis
    FichaExclusiva = TSFichaLis
    PanelEdicion = PNListados
    Complementario = PMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 52
    Top = 344
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 52
    Top = 378
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16450
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16465
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16471
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16457
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16454
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16460
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16451
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16470
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16499
    end
    object CEDetalleMibuscar: TMenuItem
      Caption = 'Buscar'
    end
    object CEDetalleMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Visible = False
    end
    object CEDetalleMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      Visible = False
    end
    object CEDetalleMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      Visible = False
    end
    object CEDetalleMirango: TMenuItem
      Caption = 'Filtra rango'
      Visible = False
    end
    object CEDetalleMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
    end
    object CEDetalleMicopy: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      Visible = False
    end
    object CEDetalleMicut: TMenuItem
      Caption = 'Cortar'
      Visible = False
    end
    object CEDetalleMipaste: TMenuItem
      Caption = 'Pegar'
      Visible = False
    end
    object CEDetalleMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      Visible = False
    end
  end
end
