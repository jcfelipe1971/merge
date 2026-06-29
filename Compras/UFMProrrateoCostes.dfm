inherited FMProrrateoCostes: TFMProrrateoCostes
  Left = 456
  Top = 188
  Width = 904
  Height = 472
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importes Prorrateados'
  Constraints.MinWidth = 640
  PopupMenu = CEDocumentosOrigenPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 894
    Height = 121
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 890
      inherited NavMain: THYMNavigator
        DataSource = DMProrrateoCostes.DSxProrrateo
        Hints.Strings = ()
        EditaControl = DBERazon
        InsertaControl = DBERazon
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMProrrateoCostes.DSxProrrateo
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 890
      Height = 91
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 882
          Height = 63
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMProrrateoCostes.DSxProrrateo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'GES_CABECERAS_E_PROR'
            CampoNum = 'PRORRATEO'
            CampoStr = 'RAZON'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'PRORRATEO')
          end
          object LProrrateo: TLFLabel
            Left = 24
            Top = 13
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prorrateo'
          end
          object LImporte: TLFLabel
            Left = 451
            Top = 13
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LRazon: TLFLabel
            Left = 36
            Top = 35
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Razon'
          end
          object LFecha: TLFLabel
            Left = 251
            Top = 13
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object LImportePrevisto: TLFLabel
            Left = 425
            Top = 35
            Width = 61
            Height = 13
            Caption = 'Imp. Previsto'
          end
          object DBEProrrateo: TLFDbedit
            Left = 72
            Top = 8
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'PRORRATEO'
            DataSource = DMProrrateoCostes.DSxProrrateo
            TabOrder = 0
          end
          object DBEImporte: TLFDbedit
            Left = 490
            Top = 8
            Width = 121
            Height = 21
            DataField = 'IMPORTE_PRORRATEO'
            DataSource = DMProrrateoCostes.DSxProrrateo
            TabOrder = 3
          end
          object DBERazon: TLFDbedit
            Left = 72
            Top = 30
            Width = 337
            Height = 21
            DataField = 'RAZON'
            DataSource = DMProrrateoCostes.DSxProrrateo
            TabOrder = 2
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 288
            Top = 8
            Width = 121
            Height = 21
            DataField = 'FECHA'
            DataSource = DMProrrateoCostes.DSxProrrateo
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEImportePrevisto: TLFDbedit
            Left = 490
            Top = 30
            Width = 121
            Height = 21
            DataField = 'IMPORTE_PREVISTO'
            DataSource = DMProrrateoCostes.DSxProrrateo
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 954
          Height = 63
          DataSource = DMProrrateoCostes.DSxProrrateo
          Columns = <
            item
              Expanded = False
              FieldName = 'PRORRATEO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_PRORRATEO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 419
    Width = 894
  end
  object PCDetalle: TLFPageControl [2]
    Left = 0
    Top = 121
    Width = 894
    Height = 298
    ActivePage = TSAlbaranes
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSAlbaranes: TTabSheet
      Caption = 'Albaranes'
      object PDetalle: TLFPanel
        Left = 0
        Top = 0
        Width = 886
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        OnResize = PDetalleResize
        object splProrrateo: TSplitter
          Left = 345
          Top = 22
          Width = 8
          Height = 248
          Cursor = crHSplit
          Color = clAppWorkSpace
          ParentColor = False
          OnMoved = splProrrateoMoved
        end
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 886
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMProrrateoCostes.DSxProrrateoAlbaranes
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
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object CBLineasTodosAlbaranes: TLFCheckBox
            Left = 248
            Top = 0
            Width = 189
            Height = 22
            Caption = 'Ver lineas de todos los albaranes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBLineasTodosAlbaranesChange
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 345
          Height = 248
          Align = alLeft
          DataSource = DMProrrateoCostes.DSxProrrateoAlbaranes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalleCellClick
          OnDrawColumnCell = DBGFDetalleDrawColumnCell
          OnDblClick = DBGFDetalleDblClick
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
          BuscarNums = False
          BuscarChars = False
          Campos.Strings = (
            'SERIE_ORI'
            'RIG_ORI'
            'EJERCICIO_ORI')
          CamposAMostrar.Strings = (
            'SERIE_ORI'
            '0'
            'RIG_ORI'
            '0'
            'EJERCICIO_ORI'
            '1'
            'CIERRE')
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
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          Numericos.Strings = (
            'SERIE'
            'RIG'
            'EJERCICIO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_SERIES'
            'VER_CABECERAS_ALBARAN_PROV'
            'EMP_EJERCICIOS')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'APERTURA')
          Posicion = tpCentrado
          OnBusqueda = DBGFDetalleBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'SERIE'
            'RIG'
            'EJERCICIO')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO_ORI'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE_ORI'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_ORI'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Visible = True
            end>
        end
        object DBGFProrrateoAlb: TDBGridFind2000
          Left = 353
          Top = 22
          Width = 533
          Height = 248
          Align = alClient
          DataSource = DMProrrateoCostes.DSxProrrateoLineas
          PopupMenu = CEDetallePMEdit
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFProrrateoAlbCellClick
          OnDrawColumnCell = DBGFProrrateoAlbDrawColumnCell
          OnDblClick = DBGFProrrateoAlbDblClick
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
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
              Expanded = False
              FieldName = 'SERIE_ORI'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG_ORI'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_ORI'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_ORI'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COSTE'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COSTE_PRORRATEO'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COSTE_UNIT'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COSTE_UNIT_PRORRATEO'
              Visible = True
            end>
        end
      end
    end
    object TSDocumentosOrigen: TTabSheet
      Caption = 'Doc. Origen'
      ImageIndex = 2
      object PNLOrigen: TLFPanel
        Left = 0
        Top = 0
        Width = 886
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object TBOrigen: TLFToolBar
          Left = 0
          Top = 0
          Width = 886
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavOrigen: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMProrrateoCostes.DSxProrrateoDocOrigen
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDocumentosOrigenPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGOrigen
            InsertaControl = DBGOrigen
            Exclusivo = False
            ControlEdit = CEDocumentosOrigen
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep2: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBAsignaImporte: TToolButton
            Left = 248
            Top = 0
            Hint = 'Asigna Importe'
            Caption = 'Asigna Importe'
            ImageIndex = 43
            OnClick = TBAsignaImporteClick
          end
        end
        object DBGOrigen: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 886
          Height = 248
          Align = alClient
          DataSource = DMProrrateoCostes.DSxProrrateoDocOrigen
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGOrigenCellClick
          OnDrawColumnCell = DBGOrigenDrawColumnCell
          OnDblClick = DBGOrigenDblClick
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
          BuscarNums = False
          BuscarChars = False
          Campos.Strings = (
            'SERIE_ORI'
            'RIG_ORI'
            'TIPO_ORI'
            'EJERCICIO_ORI')
          CamposAMostrar.Strings = (
            'SERIE_ORI'
            '0'
            'RIG_ORI'
            '0'
            'TIPO_ORI'
            '0'
            'EJERCICIO_ORI'
            '1'
            'CIERRE')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          Numericos.Strings = (
            'SERIE'
            'RIG'
            'TIPO'
            'EJERCICIO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_SERIES'
            'GES_CABECERAS_E'
            'SYS_TIPO_MOVIMIENTO'
            'EMP_EJERCICIOS')
          Acciones.Strings = (
            ''
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'LIQUIDO'
            'TITULO'
            'APERTURA')
          Posicion = tpCentrado
          OnBusqueda = DBGOrigenBusqueda
          Planes.Strings = (
            ''
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            ''
            ''
            'EJERCICIO')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_ORI'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO_ORI'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE_ORI'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_ORI'
              Width = 56
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 260
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO_CANAL'
              ReadOnly = True
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_PRORRATEO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NUM_FACTURA'
              ReadOnly = True
              Width = 170
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMProrrateoCostes.DSxProrrateo
    EnlazadoA = CEDetalle
    Left = 560
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 600
    Top = 8
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 480
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBLineasTodosAlbaranes.Checked')
    Left = 520
    Top = 8
  end
  object CEDetalle: TControlEdit
    DataSource = DMProrrateoCostes.DSxProrrateoAlbaranes
    EnlazadoA = CEDocumentosOrigen
    Complementario = PMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 560
    Top = 40
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 600
    Top = 40
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
  object CEDocumentosOrigen: TControlEdit
    DataSource = DMProrrateoCostes.DSxProrrateoDocOrigen
    EnlazadoA = CEMain
    PopUpMenu = CEDocumentosOrigenPMEdit
    Teclas = DMMain.Teclas
    Left = 560
    Top = 72
  end
  object CEDocumentosOrigenPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 600
    Top = 72
    object CEDocumentosOrigenMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDocumentosOrigenMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDocumentosOrigenMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDocumentosOrigenMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDocumentosOrigenMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDocumentosOrigenMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDocumentosOrigenMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDocumentosOrigenMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDocumentosOrigenMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDocumentosOrigenMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
