inherited CrmFMConsultaAcciones: TCrmFMConsultaAcciones
  Left = 201
  Top = 188
  Width = 1356
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Seguimiento de Acciones Comerciales'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 1070
  OldCreateOrder = True
  PopupMenu = CENotasPMEdit
  Position = poScreenCenter
  OnActivate = FormActivate
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1346
    Height = 547
    object Splitter1: TSplitter [0]
      Left = 529
      Top = 28
      Width = 8
      Height = 517
      Cursor = crHSplit
      Align = alRight
      Beveled = True
      Color = clAppWorkSpace
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 1342
      EdgeBorders = [ebBottom]
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object ToolButton1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PnlFiltros: TLFPanel
        Left = 33
        Top = 0
        Width = 1104
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LblAgente: TLFLabel
          Left = 7
          Top = 5
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agente'
        end
        object LblContacto: TLFLabel
          Left = 111
          Top = 5
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Contacto'
        end
        object LblTipo: TLFLabel
          Left = 222
          Top = 5
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Acci'#243'n'
        end
        object LblFecha: TLFLabel
          Left = 739
          Top = 5
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Seg. Hasta'
          Enabled = False
        end
        object LFecha: TLFLabel
          Left = 583
          Top = 4
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha'
        end
        object LEstado: TLFLabel
          Left = 941
          Top = 4
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Estado'
        end
        object LFAccion: TLFLabel
          Left = 478
          Top = 5
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Acci'#243'n'
        end
        object LFiltroAccionComercial: TLFLabel
          Left = 347
          Top = 5
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Acci'#243'n Com.'
        end
        object EFAgente: TLFEditFind2000
          Left = 46
          Top = 1
          Width = 60
          Height = 21
          TabOrder = 0
          OnChange = EFAgenteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFContacto: TLFEditFind2000
          Left = 158
          Top = 1
          Width = 60
          Height = 21
          TabOrder = 1
          OnChange = EFContactoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ID_CONTACTO'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CRM_CONTACTOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ID_CONTACTO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EFTipo: TLFEditFind2000
          Left = 283
          Top = 1
          Width = 60
          Height = 21
          TabOrder = 2
          OnChange = EFTipoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ACCION'
          CampoStr = 'DESCRIPCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CRM_SYS_ACCIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ACCION')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DEFechaAccion: TLFDateEdit
          Left = 830
          Top = 0
          Width = 101
          Height = 21
          CheckOnExit = True
          Enabled = False
          NumGlyphs = 2
          TabOrder = 6
          OnChange = DEFechaAccionChange
        end
        object LFFechaTipo: TLFComboBox
          Left = 620
          Top = 0
          Width = 110
          Height = 21
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 5
          Text = 'Semana Actual'
          OnChange = LFFechaTipoChange
          Items.Strings = (
            'Hoy'
            'Semana Actual'
            'Mes Actual'
            'A'#241'o Actual'
            'Hasta Fecha...')
        end
        object LFFinalizadoSeg: TLFComboBox
          Left = 979
          Top = 0
          Width = 119
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 7
          Text = 'Pendientes'
          OnChange = LFFinalizadoSegChange
          Items.Strings = (
            'Pendientes'
            'Finalizados'
            'Todos')
        end
        object EFAccion: TLFEditFind2000
          Left = 516
          Top = 1
          Width = 60
          Height = 21
          TabOrder = 4
          OnChange = EFAccionChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ID_ACCION'
          CampoStr = 'DESCRIPCION_ACCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CRM_CONTACTOS_ACCIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFAccionBusqueda
          OrdenadoPor.Strings = (
            'ID_ACCION')
          Filtros = []
        end
        object EFAccionComercial: TLFEditFind2000
          Left = 412
          Top = 1
          Width = 60
          Height = 21
          TabOrder = 3
          OnChange = EFAccionComercialChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ID'
          CampoStr = 'DESCRIPCION_ACCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CRM_ACCIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ID')
          Filtros = []
        end
        object BLimpiaFiltroAgente: TButton
          Left = 83
          Top = 3
          Width = 21
          Height = 17
          Caption = 'X'
          TabOrder = 8
          OnClick = BLimpiaFiltroAgenteClick
        end
      end
    end
    object PNLSeguimientos: TLFPanel
      Left = 2
      Top = 28
      Width = 527
      Height = 517
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinWidth = 525
      TabOrder = 1
      object PNLFiltroSeguimientos: TLFPanel
        Left = 0
        Top = 0
        Width = 527
        Height = 20
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LSeguimientos: TLFLabel
          Left = 6
          Top = 3
          Width = 70
          Height = 13
          Caption = 'Seguimiento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LFiltroTipoSeguimiento: TLFLabel
          Left = 228
          Top = 4
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'T.Seguimiento'
        end
        object CBTipoSeguimiento: TLFComboBox
          Left = 304
          Top = 0
          Width = 209
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBTipoSeguimientoChange
        end
      end
      object LFPanelAccionesDet: TLFPanel
        Left = 0
        Top = 20
        Width = 527
        Height = 497
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGFSeguimientos: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 527
          Height = 475
          Align = alClient
          Color = clInfoBk
          DataSource = CrmDMConsultaAcciones.DSxSeguimiento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGFSeguimientosDblClick
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = CrmDMConsultaAcciones.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ID_CONTACTO'
            'FECHA'
            'TIPO_SEG'
            'HORA_ACCION')
          ColumnasCheckBoxes.Strings = (
            'FACTURAR'
            'FIN_SEG')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
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
              Expanded = False
              FieldName = 'ORDEN'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_SEGUIMIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_CORTO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORA_ACCION'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_SEG'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_POSTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 65
              Visible = True
            end>
        end
        object TBSeguimientos: TLFToolBar
          Left = 0
          Top = 0
          Width = 527
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
          object NavSeg: THYMNavigator
            Left = 0
            Top = 0
            Width = 100
            Height = 22
            DataSource = CrmDMConsultaAcciones.DSxSeguimiento
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFSeguimientos
            InsertaControl = DBGFSeguimientos
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavSegClickAfterAdjust
          end
          object ToolButton2: TToolButton
            Left = 100
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescar: TToolButton
            Left = 108
            Top = 0
            Hint = 'RefrescarDatos'
            Caption = 'Refrescar'
            ImageIndex = 26
            OnClick = TBRefrescarClick
          end
        end
      end
    end
    object PNLNotas: TLFPanel
      Left = 537
      Top = 28
      Width = 807
      Height = 517
      Align = alRight
      BevelOuter = bvNone
      Constraints.MinWidth = 490
      TabOrder = 2
      object splSegtop: TSplitter
        Left = 0
        Top = 140
        Width = 807
        Height = 8
        Cursor = crVSplit
        Align = alTop
        Color = clAppWorkSpace
        ParentColor = False
      end
      object splSegBottom: TSplitter
        Left = 0
        Top = 329
        Width = 807
        Height = 8
        Cursor = crVSplit
        Align = alBottom
        Color = clAppWorkSpace
        ParentColor = False
      end
      object PNLDatosSeguimiento: TLFPanel
        Left = 0
        Top = 148
        Width = 807
        Height = 181
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        OnExit = PNLDatosSeguimientoExit
        object TBNotasAccion: TLFToolBar
          Left = 0
          Top = 0
          Width = 807
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Wrapable = False
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 22
            DataSource = CrmDMConsultaAcciones.DSQMAccionesSeg
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBreNotas
            OnClickBefore = NavNotasClickBefore
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton5: TToolButton
            Left = 80
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtListados: TToolButton
            Left = 88
            Top = 0
            Action = AAImprimir
            DropdownMenu = PMListado
            ParentShowHint = False
            ShowHint = True
            Style = tbsDropDown
            Visible = False
          end
          object ToolButton9: TToolButton
            Left = 124
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBNuevoSeg: TToolButton
            Left = 132
            Top = 0
            Hint = 'A'#241'adir Seguimiento'
            Caption = 'Nuevo Segimiento'
            ImageIndex = 18
            ParentShowHint = False
            ShowHint = True
            OnClick = TBNuevoSegClick
          end
          object TBCierra: TToolButton
            Left = 155
            Top = 0
            Hint = 'Cierra Seguimiento Actual'
            Caption = 'Cierra'
            DropdownMenu = PMCerrar
            ImageIndex = 68
            ParentShowHint = False
            ShowHint = True
            Style = tbsDropDown
            OnClick = TBCierraClick
          end
          object TBMail: TToolButton
            Left = 191
            Top = 0
            Hint = 'Enviar un mail al contacto'
            Caption = 'Enviar Correo'
            ImageIndex = 34
            ParentShowHint = False
            ShowHint = True
            OnClick = TBMailClick
          end
          object TBFax: TToolButton
            Left = 214
            Top = 0
            Hint = 'Enviar un fax al contacto'
            Caption = 'Enviar un fax al contacto'
            ImageIndex = 14
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton8: TToolButton
            Left = 237
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBSep1: TToolButton
            Left = 245
            Top = 0
            Width = 8
            ImageIndex = 0
            Style = tbsSeparator
          end
          object PNLIdSeguimiento: TLFPanel
            Left = 253
            Top = 0
            Width = 170
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LIdSeguimiento: TLFLabel
              Left = 16
              Top = 4
              Width = 70
              Height = 13
              Caption = 'Id Seguimiento'
            end
            object DBEIdSeguimiento: TLFDbedit
              Left = 88
              Top = 1
              Width = 72
              Height = 21
              Color = clAqua
              DataField = 'ID_ACCION_DET'
              DataSource = CrmDMConsultaAcciones.DSxSeguimiento
              ReadOnly = True
              TabOrder = 0
              OnChange = DBEIdSeguimientoChange
              OnDblClick = DBEIdSeguimientoDblClick
            end
          end
        end
        object PNLNotasSeguimiento: TLFPanel
          Left = 0
          Top = 70
          Width = 807
          Height = 111
          Align = alClient
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 1
          object TBEdit: TLFToolBar
            Left = 1
            Top = 1
            Width = 805
            Height = 22
            AutoSize = True
            Customizable = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ToolbarImages
            TabOrder = 0
            Separators = True
            object FontName: TLFComboBox
              Left = 0
              Top = 0
              Width = 162
              Height = 21
              Hint = 'Fuente'
              Ctl3D = False
              DropDownCount = 10
              ItemHeight = 13
              ParentCtl3D = False
              TabOrder = 0
              OnChange = FontNameChange
            end
            object ToolButton6: TToolButton
              Left = 162
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object ToolButton4: TToolButton
              Left = 170
              Top = 0
              Width = 4
              Style = tbsSeparator
            end
            object FontSize: TLFEdit
              Left = 174
              Top = 0
              Width = 22
              Height = 22
              Hint = 'Tama'#241'o de fuente'
              TabOrder = 1
              Text = '0'
              OnChange = FontSizeChange
            end
            object UpDown: TUpDown
              Left = 196
              Top = 0
              Width = 15
              Height = 22
              Associate = FontSize
              Min = 0
              Position = 0
              TabOrder = 2
              Wrap = False
            end
            object TButtUndo: TToolButton
              Left = 211
              Top = 0
              Action = EditUndoCmd
              ImageIndex = 4
            end
            object TButtCut: TToolButton
              Left = 234
              Top = 0
              Action = EditCutCmd
              ImageIndex = 5
            end
            object TButtCopy: TToolButton
              Left = 257
              Top = 0
              Action = EditCopyCmd
              ImageIndex = 6
            end
            object TButtPaste: TToolButton
              Left = 280
              Top = 0
              Action = EditPasteCmd
              ImageIndex = 7
            end
            object TSepEdit1: TToolButton
              Left = 303
              Top = 0
              Width = 7
              Style = tbsSeparator
            end
            object TButtNegrita: TToolButton
              Left = 310
              Top = 0
              Hint = 'Negrita'
              Caption = 'Negrita'
              ImageIndex = 8
              Style = tbsCheck
              OnClick = TButtNegritaClick
            end
            object TButtCursiva: TToolButton
              Left = 333
              Top = 0
              Hint = 'Cursiva'
              Caption = 'Cursiva'
              ImageIndex = 9
              Style = tbsCheck
              OnClick = TButtCursivaClick
            end
            object TButtSubrayado: TToolButton
              Left = 356
              Top = 0
              Hint = 'Subrayado'
              Caption = 'Subrayado'
              ImageIndex = 10
              Style = tbsCheck
              OnClick = TButtSubrayadoClick
            end
            object TSepEdit3: TToolButton
              Left = 379
              Top = 0
              Width = 7
              Style = tbsSeparator
            end
            object TButtLeftAlign: TToolButton
              Left = 386
              Top = 0
              Hint = 'Alinear a la Izquierda'
              Caption = 'Alinear a la Izquierda'
              Grouped = True
              ImageIndex = 11
              Style = tbsCheck
              OnClick = TButtAlignClick
            end
            object TButtCenterAlign: TToolButton
              Tag = 2
              Left = 409
              Top = 0
              Hint = 'Centrar'
              Caption = 'Centrar'
              Grouped = True
              ImageIndex = 12
              Style = tbsCheck
              OnClick = TButtAlignClick
            end
            object TButtRightAlign: TToolButton
              Tag = 1
              Left = 432
              Top = 0
              Hint = 'Alinear a la Derecha'
              Caption = 'Alinear a la Derecha'
              Grouped = True
              ImageIndex = 13
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = TButtAlignClick
            end
            object TButtColor: TToolButton
              Left = 455
              Top = 0
              Caption = 'Color'
              ImageIndex = 15
              OnClick = TButtColorClick
            end
            object ToolButton7: TToolButton
              Left = 478
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
          end
          object DBreNotas: TDBRichEdit
            Left = 1
            Top = 23
            Width = 805
            Height = 87
            Align = alClient
            DataField = 'NOTAS'
            DataSource = CrmDMConsultaAcciones.DSQMAccionesSeg
            ScrollBars = ssVertical
            TabOrder = 1
            OnMouseDown = DBreNotasMouseDown
            OnSelectionChange = SelectionChange
          end
        end
        object PNLSeguimiento: TLFPanel
          Left = 0
          Top = 22
          Width = 807
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LTipoSeguimiento: TLFLabel
            Left = 16
            Top = 6
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Seg.'
          end
          object LDescripcinSeguimiento: TLFLabel
            Left = 6
            Top = 28
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripcion'
          end
          object LProgresoSeg: TLFLabel
            Left = 448
            Top = 6
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Progreso'
          end
          object LFechaSeguimiento: TLFLabel
            Left = 189
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
            FocusControl = DBDEFechaAccionProx
          end
          object DBETipoSeguimiento: TLFDbedit
            Left = 64
            Top = 3
            Width = 72
            Height = 21
            Color = clInfoBk
            DataField = 'ID_ACCION_DET'
            DataSource = CrmDMConsultaAcciones.DSxSeguimiento
            ReadOnly = True
            TabOrder = 0
            OnChange = DBETipoSeguimientoChange
          end
          object DBEDescripcionseguimiento: TLFDbedit
            Left = 64
            Top = 25
            Width = 353
            Height = 21
            Color = clInfoBk
            DataField = 'DESCRIPCION_SEGUIMIENTO'
            DataSource = CrmDMConsultaAcciones.DSxSeguimiento
            ReadOnly = True
            TabOrder = 1
            OnChange = DBETipoSeguimientoChange
          end
          object TrBProgresoSeg: TTrackBar
            Left = 496
            Top = 5
            Width = 131
            Height = 18
            Enabled = False
            Max = 7
            Orientation = trHorizontal
            Frequency = 10
            Position = 7
            SelEnd = 0
            SelStart = 0
            TabOrder = 2
            ThumbLength = 15
            TickMarks = tmBottomRight
            TickStyle = tsNone
          end
          object DBDEFechaAccionProx: TLFDBDateEdit
            Left = 223
            Top = 3
            Width = 121
            Height = 21
            DataField = 'FECHA'
            DataSource = CrmDMConsultaAcciones.DSxSeguimiento
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBDTPFechaPrevista: TDBDateTimePicker
            Left = 346
            Top = 3
            Width = 71
            Height = 21
            CalAlignment = dtaLeft
            Date = 45729.3871174653
            Format = 'HH:mm'
            Time = 45729.3871174653
            Color = clInfoBk
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 4
            DataField = 'FECHA'
            DataSource = CrmDMConsultaAcciones.DSxSeguimiento
            ReadOnly = True
          end
        end
      end
      object PNLContacto: TLFPanel
        Left = 0
        Top = 337
        Width = 807
        Height = 180
        Align = alBottom
        BevelOuter = bvNone
        Constraints.MinHeight = 180
        TabOrder = 1
        object LFPanelContacto: TLFPanel
          Left = 0
          Top = 0
          Width = 807
          Height = 180
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            807
            180)
          object LTelefono: TLFLabel
            Left = 51
            Top = 75
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefono'
          end
          object LNombreComercial: TLFLabel
            Left = 29
            Top = 31
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre Com.'
          end
          object LDireccion: TLFLabel
            Left = 48
            Top = 52
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LNIF: TLFLabel
            Left = 76
            Top = 10
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LContacto: TLFLabel
            Left = 0
            Top = 0
            Width = 52
            Height = 13
            Caption = 'Contacto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LEmail: TLFLabel
            Left = 64
            Top = 98
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-Mail'
          end
          object LPersonasContacto: TLFLabel
            Left = 3
            Top = 121
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Personas Contacto'
          end
          object LIdContacto: TLFLabel
            Left = 226
            Top = 10
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Contacto'
          end
          object LFDBDireccion: TLFDbedit
            Left = 97
            Top = 50
            Width = 709
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'DIR_NOMBRE'
            DataSource = CrmDMConsultaAcciones.DSxContactos
            ReadOnly = True
            TabOrder = 2
          end
          object LFDBNif: TLFDbedit
            Left = 97
            Top = 6
            Width = 112
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = CrmDMConsultaAcciones.DSxContactos
            ReadOnly = True
            TabOrder = 0
          end
          object LFDBNomCom: TLFDbedit
            Left = 97
            Top = 28
            Width = 709
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = CrmDMConsultaAcciones.DSxContactos
            ReadOnly = True
            TabOrder = 1
          end
          object LFDBTelefono: TLFDbedit
            Left = 97
            Top = 72
            Width = 709
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'TELEFONO01'
            DataSource = CrmDMConsultaAcciones.DSxContactos
            ReadOnly = True
            TabOrder = 3
          end
          object LFDBMail: TLFDbedit
            Left = 97
            Top = 94
            Width = 709
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'EMAIL'
            DataSource = CrmDMConsultaAcciones.DSxContactos
            TabOrder = 4
          end
          object DBGPersonasContacto: TDBGridFind2000
            Left = 96
            Top = 116
            Width = 711
            Height = 61
            Anchors = [akLeft, akTop, akBottom]
            Color = clInfoBk
            DataSource = CrmDMConsultaAcciones.DSxPContactes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 5
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
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_PERSONA'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APELLIDOS'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEFONO'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOVIL'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FAX'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EXTENSION'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Width = 150
                Visible = True
              end>
          end
          object DBEIdContacto: TLFDbedit
            Left = 285
            Top = 6
            Width = 112
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'ID_CONTACTO'
            DataSource = CrmDMConsultaAcciones.DSxContactos
            ReadOnly = True
            TabOrder = 6
            OnDblClick = DBEIdContactoDblClick
          end
        end
      end
      object PNLDatosAccion: TLFPanel
        Left = 0
        Top = 0
        Width = 807
        Height = 140
        Align = alTop
        BevelOuter = bvNone
        Constraints.MinHeight = 140
        TabOrder = 2
        object LFPanelAccCom: TLFPanel
          Left = 0
          Top = 0
          Width = 807
          Height = 140
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            807
            140)
          object LAccionComercial: TLFLabel
            Left = 16
            Top = 29
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acci'#243'n Com.'
          end
          object LFechaAccionComercial: TLFLabel
            Left = 46
            Top = 50
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LAgente: TLFLabel
            Left = 42
            Top = 94
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LTipoAccion: TLFLabel
            Left = 30
            Top = 71
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Acci'#243'n'
          end
          object LFLabelDoc: TLFLabel
            Left = 6
            Top = 117
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Doc. Asociado'
          end
          object SBDocumentoAsociado: TSpeedButton
            Left = 135
            Top = 116
            Width = 61
            Height = 22
            GroupIndex = -1
            OnDblClick = SBDocumentoAsociadoDblClick
          end
          object LFDBAccCom: TLFDbedit
            Left = 79
            Top = 25
            Width = 247
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION_ACCION'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            ReadOnly = True
            TabOrder = 0
          end
          object LFDBFechaAccCom: TLFDbedit
            Left = 79
            Top = 47
            Width = 92
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_ACCION'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            ReadOnly = True
            TabOrder = 1
          end
          object TBAccionComercial: TLFToolBar
            Left = 0
            Top = 0
            Width = 807
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 2
            Wrapable = False
            Separators = True
            object LTituloAccionComercia: TLFLabel
              Left = 0
              Top = 0
              Width = 99
              Height = 22
              Caption = 'Acci'#243'n Comercial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object PNLProgresoAcc: TLFPanel
              Left = 99
              Top = 0
              Width = 198
              Height = 22
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LProgresoAcc: TLFLabel
                Left = 21
                Top = 4
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Progreso'
              end
              object TrBProgresoAcc: TTrackBar
                Left = 68
                Top = 2
                Width = 131
                Height = 18
                Enabled = False
                Orientation = trHorizontal
                Frequency = 10
                Position = 10
                SelEnd = 0
                SelStart = 0
                TabOrder = 0
                ThumbLength = 15
                TickMarks = tmBottomRight
                TickStyle = tsNone
              end
            end
            object PNLIdAccion: TLFPanel
              Left = 297
              Top = 0
              Width = 152
              Height = 22
              BevelOuter = bvNone
              TabOrder = 1
              object LIdAccion: TLFLabel
                Left = 24
                Top = 4
                Width = 45
                Height = 13
                Caption = 'Id Accion'
              end
              object DBEIdAccion: TLFDbedit
                Left = 72
                Top = 1
                Width = 72
                Height = 21
                Color = clAqua
                DataField = 'ID_ACCION'
                DataSource = CrmDMConsultaAcciones.DSxSeguimiento
                ReadOnly = True
                TabOrder = 0
                OnChange = DBEIdAccionChange
                OnDblClick = DBEIdAccionDblClick
              end
            end
          end
          object DBEAgente: TLFDbedit
            Left = 79
            Top = 91
            Width = 54
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'AGENTE'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            TabOrder = 3
          end
          object DBETipoAccion: TLFDbedit
            Left = 79
            Top = 69
            Width = 54
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIPO_ACCION'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            TabOrder = 4
          end
          object LFDBTAccion: TLFDbedit
            Left = 134
            Top = 69
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION_ACCION'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            TabOrder = 5
          end
          object LFDBAgente: TLFDbedit
            Left = 134
            Top = 91
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = CrmDMConsultaAcciones.DSxAgente
            TabOrder = 6
          end
          object DBRichEdit1: TDBRichEdit
            Left = 327
            Top = 25
            Width = 476
            Height = 108
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clInfoBk
            DataField = 'NOTAS'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            ScrollBars = ssVertical
            TabOrder = 7
          end
          object DBEFDocumentoAsociado: TLFDBEditFind2000
            Left = 134
            Top = 113
            Width = 61
            Height = 21
            Color = clAqua
            DataField = 'DOC_ACCION'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            Enabled = False
            ReadOnly = True
            TabOrder = 8
            OnDblClick = SBDocumentoAsociadoDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RIG'
            CampoStr = 'FECHA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPRESA'
              'FECHA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFEjercicioDocumentoAsociado: TLFDBEditFind2000
            Left = 79
            Top = 113
            Width = 54
            Height = 21
            DataField = 'DOC_EJERCICIO'
            DataSource = CrmDMConsultaAcciones.DSxAccComercial
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EJERCICIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EJERCICIO'
            CampoStr = 'APERTURA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EJERCICIO DESC')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 1346
  end
  inherited CEMain: TControlEdit
    Left = 1272
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 1304
    Top = 0
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
  inherited ALMain: TLFActionList
    Left = 1176
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'PNLNotas.Width'
      'PNLDatosAccion.Height'
      'PNLContacto.Height')
    Left = 1144
    Top = 0
  end
  object ALEdit: TActionList
    OnUpdate = ALEditUpdate
    Left = 1240
    object EditUndoCmd: TAction
      Category = 'Edit'
      Caption = '&Deshacer'
      Hint = 'Deshace la '#250'ltima acci'#243'n'
      ImageIndex = 1
      ShortCut = 16474
      OnExecute = EditUndo
    end
    object EditCutCmd: TAction
      Category = 'Edit'
      Caption = 'Cor&tar'
      Hint = 'Borra la selecci'#243'n'
      ImageIndex = 2
      ShortCut = 16472
      OnExecute = EditCut
    end
    object EditCopyCmd: TAction
      Category = 'Edit'
      Caption = '&Copiar'
      Hint = 'Copia el texto seleccionado al portapapeles'
      ImageIndex = 3
      ShortCut = 16451
      OnExecute = EditCopy
    end
    object EditPasteCmd: TAction
      Category = 'Edit'
      Caption = '&Pegar'
      Hint = 'Pega el contenido del portapapeles'
      ImageIndex = 4
      ShortCut = 16470
      OnExecute = EditPaste
    end
    object EditFontCmd: TAction
      Category = 'Edit'
      Caption = '&Fuente...'
      OnExecute = SelectFont
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 1240
    Top = 32
  end
  object PMListado: TPopupMenu
    AutoHotkeys = maManual
    Left = 1208
    Top = 32
    object ListadodelInforme1: TMenuItem
      Caption = 'Listado del Informe'
    end
    object Configuracin1: TMenuItem
      Caption = 'Configuraci'#243'n'
      object ListadodelInforme2: TMenuItem
        Caption = 'Listado del Informe'
      end
    end
  end
  object ALAcciones: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 1208
    object AAImprimir: TAction
      Caption = 'Imprimir'
      Hint = 'Ctrl+I para impresi'#243'n de listado'
      ImageIndex = 14
      ShortCut = 16457
    end
    object AContacto: TAction
      Caption = 'Abrir Contacto'
      Hint = 'Abrir Contacto'
      ImageIndex = 54
      OnExecute = AContactoExecute
    end
    object AAccion: TAction
      Caption = 'Accion'
      Hint = 'Ver accion'
      ImageIndex = 87
      OnExecute = AAccionExecute
    end
    object ASeguimiento: TAction
      Caption = 'Seguimiento'
      Hint = 'Ver seguimiento'
      ImageIndex = 87
      OnExecute = ASeguimientoExecute
    end
    object ADocumentoAsociado: TAction
      Caption = 'Documento Asociado'
      Hint = 'Abre el documento asociado a esta accion'
      ImageIndex = 25
      OnExecute = ADocumentoAsociadoExecute
    end
  end
  object CENotas: TControlEdit
    PanelEdicion = PNLNotasSeguimiento
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 1272
    Top = 32
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 1304
    Top = 32
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object PMCerrar: TPopupMenu
    AutoHotkeys = maManual
    Left = 1176
    Top = 32
    object CerrarSeguimientoActual1: TMenuItem
      Caption = 'Cerrar Seguimiento Actual'
      ImageIndex = 68
      OnClick = CerrarSeguimientoActual1Click
    end
    object CerrarAccinActual1: TMenuItem
      Caption = 'Cerrar Acci'#243'n Actual'
      ImageIndex = 68
      OnClick = CerrarAccinActual1Click
    end
  end
end
