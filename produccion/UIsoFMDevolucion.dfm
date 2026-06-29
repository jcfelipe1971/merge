inherited IsoFMDevolucion: TIsoFMDevolucion
  Left = 257
  Top = 163
  Width = 766
  Height = 473
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Devoluci'#243'n de Material'
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 420
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = IsoDMDevolucion.DSQMCabecera
        Hints.Strings = ()
        EditaControl = DBEFProveedor
        InsertaControl = DBEFProveedor
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 390
      inherited TSFicha: TTabSheet
        object SBEnlaceINC: TSpeedButton [0]
          Left = 200
          Top = -8
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+D para abrir documento de procedencia'
          GroupIndex = -1
          OnDblClick = SBEnlaceINCDblClick
        end
        inherited PEdit: TLFPanel
          Width = 744
          Height = 177
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 24
            Tabla_a_buscar = 'ISO_DEVOLUCION_C'
            CampoNum = 'RIC'
            CampoStr = 'FECHA'
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object LNDevolucion: TLFLabel
            Left = 36
            Top = 3
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Devoluci'#243'n'
            FocusControl = DBENDevolucion
          end
          object LFecha: TLFLabel
            Left = 476
            Top = 3
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LProveedor: TLFLabel
            Left = 162
            Top = 3
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LNINC: TLFLabel
            Left = 466
            Top = 26
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. INC'
          end
          object LMotivoDevolucion: TLFLabel
            Left = 352
            Top = 44
            Width = 102
            Height = 13
            Caption = 'Motivo de devoluci'#243'n'
          end
          object LPedido: TLFLabel
            Left = 620
            Top = 4
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Pedido'
            FocusControl = DBEPedido
          end
          object DBENDevolucion: TLFDbedit
            Left = 118
            Top = 0
            Width = 35
            Height = 21
            Color = clInfoBk
            DataField = 'RIC'
            DataSource = IsoDMDevolucion.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEFProveedor: TLFDBEditFind2000
            Left = 215
            Top = 0
            Width = 33
            Height = 21
            DataField = 'CODPROV'
            DataSource = IsoDMDevolucion.DSQMCabecera
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescProv: TLFDbedit
            Left = 249
            Top = 0
            Width = 216
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = IsoDMDevolucion.DSxProveedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBMMotivos: TLFDBMemo
            Left = 353
            Top = 57
            Width = 387
            Height = 89
            DataField = 'MOTIVO'
            DataSource = IsoDMDevolucion.DSQMCabecera
            TabOrder = 11
          end
          object GBInstrucciones: TGroupBox
            Left = 4
            Top = 76
            Width = 341
            Height = 94
            Caption = 'Instrucciones: '
            TabOrder = 10
            object DBCBReponer: TLFDBCheckBox
              Left = 8
              Top = 19
              Width = 109
              Height = 17
              Caption = 'Reponer sin cargo'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = DBCBReponerClick
              Alignment = taLeftJustify
              DataField = 'REPONER'
              DataSource = IsoDMDevolucion.DSQMCabecera
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBAbonar: TLFDBCheckBox
              Left = 8
              Top = 36
              Width = 106
              Height = 17
              Caption = 'Abonar el material'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              OnClick = DBCBAbonarClick
              Alignment = taLeftJustify
              DataField = 'ABONAR'
              DataSource = IsoDMDevolucion.DSQMCabecera
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBReparacion: TLFDBCheckBox
              Left = 8
              Top = 53
              Width = 321
              Height = 17
              Caption = 'Reponer sin cargo y se les pasar'#225' cargo de reparaci'#243'n'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              OnClick = DBCBReparacionClick
              Alignment = taLeftJustify
              DataField = 'CARGO_REP'
              DataSource = IsoDMDevolucion.DSQMCabecera
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBOtros: TLFDBCheckBox
              Left = 8
              Top = 69
              Width = 45
              Height = 17
              Caption = 'Otros'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              OnClick = DBCBOtrosClick
              Alignment = taLeftJustify
              DataField = 'OTROS'
              DataSource = IsoDMDevolucion.DSQMCabecera
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBEPedido: TLFDbedit
            Left = 680
            Top = 1
            Width = 59
            Height = 21
            DataField = 'N_PEDIDO'
            DataSource = IsoDMDevolucion.DSQMCabecera
            TabOrder = 4
          end
          object DBCBCerrado: TLFDBCheckBox
            Left = 680
            Top = 24
            Width = 59
            Height = 17
            Caption = 'Cerrado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = IsoDMDevolucion.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBVBCalidad: TLFDBCheckBox
            Left = 353
            Top = 148
            Width = 97
            Height = 17
            Caption = 'Firma Calidad'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VB_CALIDAD'
            DataSource = IsoDMDevolucion.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBVBCompras: TLFDBCheckBox
            Left = 476
            Top = 148
            Width = 134
            Height = 17
            Caption = 'Firma Compras/Ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VB_COMPRA_VENTA'
            DataSource = IsoDMDevolucion.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBVBProveedor: TLFDBCheckBox
            Left = 635
            Top = 148
            Width = 105
            Height = 17
            Caption = 'Firmas Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VB_PROVEEDOR'
            DataSource = IsoDMDevolucion.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GBDetRealizada: TGroupBox
            Left = 4
            Top = 32
            Width = 341
            Height = 41
            Caption = 'Detecci'#243'n Realizada'
            TabOrder = 5
            object DBCBEsetri: TLFDBCheckBox
              Left = 41
              Top = 17
              Width = 97
              Height = 17
              Caption = 'Empresa'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DETECCIONE'
              DataSource = IsoDMDevolucion.DSQMCabecera
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBCliente: TLFDBCheckBox
              Left = 164
              Top = 16
              Width = 97
              Height = 17
              Caption = 'Cliente'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DETECCIONC'
              DataSource = IsoDMDevolucion.DSQMCabecera
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBCBUrgente: TLFDBCheckBox
            Left = 354
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Urgente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'URGENTE'
            DataSource = IsoDMDevolucion.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DTPFecha: TLFDBDateEdit
            Left = 511
            Top = 0
            Width = 96
            Height = 21
            DataField = 'FECHA'
            DataSource = IsoDMDevolucion.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEFRicInc: TLFFibDBEditFind
            Left = 511
            Top = 22
            Width = 46
            Height = 21
            DataField = 'RIC_INC'
            DataSource = IsoDMDevolucion.DSQMCabecera
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ISO_NO_CONFORMIDAD'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RIC'
            CampoStr = 'CONTADOR'
            CampoADevolver = 'RIC'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
          end
          object DBEFNINC: TLFDbedit
            Left = 558
            Top = 22
            Width = 49
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CONTADOR'
            DataSource = IsoDMDevolucion.DSQMCabecera
            ReadOnly = True
            TabOrder = 8
          end
        end
        object PDet: TLFPanel
          Left = 0
          Top = 177
          Width = 744
          Height = 185
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 744
            Height = 26
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 0
            Separators = True
            object NavDet: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = IsoDMDevolucion.DSQMDetalle
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFDetalle
              InsertaControl = DBGFDetalle
              Exclusivo = False
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = True
            end
          end
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 26
            Width = 744
            Height = 159
            Align = alClient
            DataSource = IsoDMDevolucion.DSQMDetalle
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 1
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
            Campos.Strings = (
              'ARTICULO')
            CamposAMostrar.Strings = (
              'ARTICULO'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CondicionBusqueda = 'empresa=1 and contador = '#39'O3'#39
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'ISO_INC_ARTICULO')
            Titulos.Strings = (
              'CANTIDAD')
            Posicion = tpCentrado
            OnBusqueda = DBGFDetalleBusqueda
            OrdenMultiple = True
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 122
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescArticulo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Width = 314
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C_PEDIDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'C_RECHAZADA'
                Width = 65
                Visible = True
              end>
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        object PNLNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 744
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLNotasProveedor: TLFPanel
            Left = 0
            Top = 0
            Width = 527
            Height = 27
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LNotasNDev: TLFLabel
              Left = 10
              Top = 5
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Devoluci'#243'n'
            end
            object LNotasProv: TLFLabel
              Left = 186
              Top = 5
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Proveedor'
            end
            object DBENotasNDev: TLFDbedit
              Left = 83
              Top = 1
              Width = 89
              Height = 21
              Color = clInfoBk
              DataField = 'RIC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBENotasCodProv: TLFDbedit
              Left = 240
              Top = 1
              Width = 31
              Height = 21
              Color = clInfoBk
              DataField = 'CODPROV'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBENotasDescProv: TLFDbedit
              Left = 272
              Top = 1
              Width = 245
              Height = 21
              Color = clInfoBk
              DataField = 'DescProv'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
          object NavNotas: THYMNavigator
            Left = 528
            Top = 2
            Width = 63
            Height = 21
            DataSource = IsoDMDevolucion.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMObservaciones
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLDetalleNotas: TLFPanel
          Left = 0
          Top = 27
          Width = 744
          Height = 335
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBNotas: TLFToolBar
            Left = 0
            Top = 0
            Width = 744
            Height = 26
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ToolbarImages
            TabOrder = 0
            Separators = True
            object TButtUndo: TToolButton
              Left = 0
              Top = 0
              Caption = 'Deshacer'
              ImageIndex = 4
              OnClick = TButtUndoClick
            end
            object TButtCut: TToolButton
              Left = 23
              Top = 0
              Caption = 'Cortar'
              ImageIndex = 5
              OnClick = TButtCutClick
            end
            object TButtCopy: TToolButton
              Left = 46
              Top = 0
              Caption = 'Copiar'
              ImageIndex = 6
              OnClick = TButtCopyClick
            end
            object TButtPaste: TToolButton
              Left = 69
              Top = 0
              Caption = 'Pegar'
              ImageIndex = 7
              OnClick = TButtPasteClick
            end
            object ToolButton6: TToolButton
              Left = 92
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object FontName: TLFComboBox
              Left = 100
              Top = 0
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = FontNameChange
            end
            object FontSize: TLFEdit
              Left = 245
              Top = 0
              Width = 22
              Height = 22
              TabOrder = 1
              Text = '0'
              OnChange = FontSizeChange
            end
            object UpDown1: TUpDown
              Left = 267
              Top = 0
              Width = 15
              Height = 22
              Associate = FontSize
              Min = 0
              Position = 0
              TabOrder = 2
              Wrap = False
            end
            object ToolButton3: TToolButton
              Left = 282
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtNegrita: TToolButton
              Left = 290
              Top = 0
              Caption = 'Negrita'
              ImageIndex = 8
              Style = tbsCheck
              OnClick = TButtNegritaClick
            end
            object TButtCursiva: TToolButton
              Left = 313
              Top = 0
              Caption = 'Cursiva'
              ImageIndex = 9
              Style = tbsCheck
              OnClick = TButtCursivaClick
            end
            object TButtSubrayado: TToolButton
              Left = 336
              Top = 0
              Caption = 'Subrayado'
              ImageIndex = 10
              Style = tbsCheck
              OnClick = TButtSubrayadoClick
            end
            object ToolButton7: TToolButton
              Left = 359
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtLeftAlign: TToolButton
              Left = 367
              Top = 0
              Caption = 'Alinear izquierda'
              Grouped = True
              ImageIndex = 11
              Style = tbsCheck
              OnClick = TButtLeftAlignClick
            end
            object TButtCenterAlign: TToolButton
              Tag = 2
              Left = 390
              Top = 0
              Caption = 'Centrar'
              Grouped = True
              ImageIndex = 12
              Style = tbsCheck
              OnClick = TButtCenterAlignClick
            end
            object TButtRightAlign: TToolButton
              Tag = 1
              Left = 413
              Top = 0
              Caption = 'Alinear derecha'
              Grouped = True
              ImageIndex = 13
              Style = tbsCheck
              OnClick = TButtRightAlignClick
            end
            object ToolButton2: TToolButton
              Left = 436
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtColor: TToolButton
              Left = 444
              Top = 0
              Caption = 'Color'
              ImageIndex = 15
              OnClick = TButtColorClick
            end
          end
          object PNNotas: TLFPanel
            Left = 0
            Top = 26
            Width = 744
            Height = 309
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBMObservaciones: TDBRichEdit
              Left = 0
              Top = 0
              Width = 744
              Height = 309
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              DataField = 'OBSERVACIONES'
              DataSource = IsoDMDevolucion.DSQMCabecera
              TabOrder = 0
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 362
          DataSource = IsoDMDevolucion.DSQMCabecera
          CamposAMarcar.Strings = (
            'ESTADO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ABONAR'
            'CARGO_REP'
            'CODPROV'
            'DETECCION'
            'ESTADO'
            'FECHA'
            'N_INC'
            'N_PEDIDO'
            'OTROS'
            'REPONER'
            'RIC'
            'VB_CALIDAD'
            'VB_COMPRA_VENTA'
            'VB_PROVEEDOR')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODPROV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescProv'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO'
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_PEDIDO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTADOR'
              Width = 65
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 420
    Width = 756
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEMain
    Left = 540
    Top = 188
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 576
    Top = 184
  end
  inherited ALMain: TLFActionList
    object ADevolucionMat: TAction
      Category = 'Listados'
      Caption = 'Listado Devoluci'#243'n de Material'
      ImageIndex = 14
      OnExecute = ADevolucionMatExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ALstConfig: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n Listado'
      ImageIndex = 77
      OnExecute = ALstConfigExecute
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CENotas
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 492
    Top = 236
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 541
    Top = 220
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 576
    Top = 216
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
      Visible = False
    end
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 616
    Top = 244
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
