inherited FMEscandalloOrden: TFMEscandalloOrden
  Left = 533
  Top = 250
  Width = 640
  Height = 483
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Escandallo de Producci'#243'n'
  PopupMenu = CELotesPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 630
    Height = 221
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 626
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = DMEscandalloOrden.DSQMEscandallo
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEUnidades
        InsertaControl = DBEFArticulo
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 119
      end
      inherited TbuttComp: TToolButton
        Left = 127
      end
    end
    inherited PCMain: TLFPageControl
      Width = 626
      Height = 191
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 618
          Height = 163
          inherited G2KTableLoc: TG2KTBLoc
            Left = 88
          end
          object LBLNumero: TLFLabel
            Left = 27
            Top = 19
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero'
          end
          object LBLArticulo: TLFLabel
            Left = 27
            Top = 41
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LBLUnidades: TLFLabel
            Left = 19
            Top = 63
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LIncSobreProd: TLFLabel
            Left = 8
            Top = 85
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Inc. s/Prod.'
          end
          object LSerie: TLFLabel
            Left = 225
            Top = 19
            Width = 24
            Height = 13
            Caption = 'Serie'
          end
          object DBENumero: TLFDbedit
            Left = 68
            Top = 15
            Width = 125
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NUMERO'
            DataSource = DMEscandalloOrden.DSQMEscandallo
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
          object DBEFArticulo: TLFDBEditFind2000
            Left = 68
            Top = 37
            Width = 125
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMEscandalloOrden.DSQMEscandallo
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFArticuloBusqueda
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEUnidades: TLFDbedit
            Left = 68
            Top = 59
            Width = 125
            Height = 21
            DataField = 'UNIDADES'
            DataSource = DMEscandalloOrden.DSQMEscandallo
            TabOrder = 3
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 198
            Top = 17
            Width = 69
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMEscandalloOrden.DSQMEscandallo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GBVigencia: TGroupBox
            Left = 68
            Top = 106
            Width = 377
            Height = 55
            Caption = 'Fechas Vigencia'
            TabOrder = 5
            object LBLFechaDesde: TLFLabel
              Left = 16
              Top = 24
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Desde'
            end
            object LBLFechaHasta: TLFLabel
              Left = 200
              Top = 24
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Hasta'
            end
            object DBDTPDesde: TLFDBDateEdit
              Left = 84
              Top = 20
              Width = 87
              Height = 21
              DataField = 'FECHA_DESDE'
              DataSource = DMEscandalloOrden.DSQMEscandallo
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DBDTPHasta: TLFDBDateEdit
              Left = 265
              Top = 20
              Width = 87
              Height = 21
              DataField = 'FECHA_HASTA'
              DataSource = DMEscandalloOrden.DSQMEscandallo
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
          end
          object DBETitArticulo: TLFDbedit
            Left = 194
            Top = 37
            Width = 378
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMEscandalloOrden.DSxArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBECoste: TLFDbedit
            Left = 68
            Top = 81
            Width = 125
            Height = 21
            DataField = 'COSTE'
            DataSource = DMEscandalloOrden.DSQMEscandallo
            TabOrder = 4
          end
          object DBSerie: TLFDbedit
            Left = 256
            Top = 15
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'SERIE'
            DataSource = DMEscandalloOrden.DSQMEscandallo
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 618
          Height = 163
          DataSource = DMEscandalloOrden.DSQMEscandallo
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 208
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_DESDE'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_HASTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Visible = True
            end>
        end
      end
    end
  end
  object PDetalle: TLFPanel [1]
    Left = 0
    Top = 221
    Width = 630
    Height = 209
    Align = alClient
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 1
      Top = 1
      Width = 628
      Height = 25
      EdgeBorders = []
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 2
        Width = 220
        Height = 22
        DataSource = DMEscandalloOrden.DSQMEscandalloDet
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object PNArticulo: TLFPanel
        Left = 220
        Top = 2
        Width = 365
        Height = 22
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LBCantTotal: TLFLabel
          Left = 157
          Top = 3
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cant. Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEArticulo: TLFDbedit
          Left = 6
          Top = 0
          Width = 130
          Height = 21
          Color = clInfoBk
          DataField = 'DETALLE'
          DataSource = DMEscandalloOrden.DSQMEscandalloDet
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
        object EUdsTotal: TLFEdit
          Left = 224
          Top = 0
          Width = 91
          Height = 21
          Color = clInfoBk
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
      end
    end
    object PCDetalle: TLFPageControl
      Left = 1
      Top = 26
      Width = 628
      Height = 182
      ActivePage = TSArticulos
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSArticulos: TTabSheet
        Caption = '&Art'#237'culos'
        OnShow = TSArticulosShow
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 620
          Height = 154
          Align = alClient
          DataSource = DMEscandalloOrden.DSQMEscandalloDet
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalleCellClick
          OnColEnter = DBGFDetalleColEnter
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
            'DETALLE')
          CamposAMostrar.Strings = (
            'DETALLE'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'DETALLE'
            'TITULO')
          ColumnasCheckBoxes.Strings = (
            'LINEAL_PORCENTUAL')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFDetalleBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'DETALLE'
              Width = 130
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
              Width = 197
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CANTIDAD_INICIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COSTE_INICIAL'
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
              FieldName = 'CANTFIN'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEAL_PORCENTUAL'
              Visible = True
            end>
        end
      end
      object TSLotes: TTabSheet
        Caption = '&Lotes'
        ImageIndex = 1
        OnHide = TSLotesHide
        OnShow = TSLotesShow
        object DBGFLotes: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 620
          Height = 133
          Align = alClient
          DataSource = DMEscandalloOrden.DSQMLotes
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFLotesColEnter
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
          Transaction = DMEscandalloOrden.TLocal
          BuscarNums = False
          Campos.Strings = (
            'LOTE')
          CamposAMostrar.Strings = (
            'LOTE'
            '2'
            'STOCK'
            'F_CADUCIDAD')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CamposNoAccesibles.Strings = (
            'N_SERIE'
            'F_CADUCIDAD'
            'LOTE'
            'POR_CANTIDAD')
          CamposNoAccMenosAlIns.Strings = (
            'LOTE')
          MensajeNoExiste = False
          Numericos.Strings = (
            'LOTE')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_ARTICULOS_LOTES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'ALMACEN')
          Posicion = tpCentrado
          OnBusqueda = DBGFLotesBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LOTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'POR_CANTIDAD'
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
              FieldName = 'PRIORIDAD'
              Width = 52
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'N_SERIE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 145
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'F_CADUCIDAD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 80
              Visible = True
            end>
        end
        object TBLotes: TLFToolBar
          Left = 0
          Top = 133
          Width = 620
          Height = 21
          Align = alBottom
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object NavLotes: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 21
            Flat = True
            ParentShowHint = False
            PopupMenu = CELotesPMEdit
            ShowHint = True
            TabOrder = 0
            OnClick = NavLotesClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFLotes
            InsertaControl = DBGFLotes
            Exclusivo = True
            ControlEdit = CELotes
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 430
    Width = 630
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 356
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 392
    Top = 4
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
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
    Left = 354
    Top = 70
  end
  inherited FSMain: TLFFibFormStorage
    Left = 394
    Top = 70
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CELotes
    FichaEdicion = TSArticulos
    FichaExclusiva = TSArticulos
    Complementario = PMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 293
    Top = 132
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 336
    Top = 148
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
  object CELotes: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSLotes
    FichaExclusiva = TSLotes
    PopUpMenu = CELotesPMEdit
    Teclas = DMMain.Teclas
    Left = 424
    Top = 368
  end
  object CELotesPMEdit: TPopUpTeclas
    Left = 456
    Top = 368
    object CELotesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CELotesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CELotesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELotesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELotesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELotesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
