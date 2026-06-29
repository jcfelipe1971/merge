inherited FMCierreParcialOrden: TFMCierreParcialOrden
  Left = 258
  Top = 172
  Width = 800
  Height = 600
  ActiveControl = EFSerie
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cierre Parcial'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 700
  PopupMenu = PUSubDetalle
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 105
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = DMCierreParcialOrden.DSQMCierreParcial
        Hints.Strings = ()
        EditaControl = DBEComentario
        InsertaControl = DBEComentario
        InsertaUltimo = True
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Enabled = False
        ImageIndex = 51
      end
      object TButtAtras: TToolButton
        Left = 339
        Top = 0
        Action = AAtras
        Caption = 'Abrir Cierre Parcial'
        ImageIndex = 67
      end
      object TButtAdelante: TToolButton
        Left = 362
        Top = 0
        Action = AAdelante
        Caption = 'Cerrar Cierre Parcial'
        ImageIndex = 68
      end
      object PNLSerie: TLFPanel
        Left = 385
        Top = 0
        Width = 237
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBLSerie: TLFLabel
          Left = 23
          Top = 3
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object EFSerie: TLFEditFind2000
          Left = 51
          Top = 0
          Width = 47
          Height = 21
          TabStop = False
          TabOrder = 0
          OnChange = EFSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESerie: TLFEdit
          Left = 99
          Top = 0
          Width = 136
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 75
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 778
          Height = 47
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMCierreParcialOrden.DSQMCierreParcial
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_ORD_CIERRE_PARCIAL'
            CampoNum = 'CIERRE'
            CampoStr = 'COMENTARIO'
            CondicionBusqueda = 'ESTADO=0'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CIERRE')
          end
          object LCierre: TLFLabel
            Left = 37
            Top = 5
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cierre'
          end
          object LEstado: TLFLabel
            Left = 292
            Top = 4
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LFecha: TLFLabel
            Left = 143
            Top = 5
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LComentario: TLFLabel
            Left = 11
            Top = 27
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object DBECierre: TLFDbedit
            Left = 67
            Top = 1
            Width = 70
            Height = 21
            Color = clInfoBk
            DataField = 'CIERRE'
            DataSource = DMCierreParcialOrden.DSQMCierreParcial
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEComentario: TLFDbedit
            Left = 67
            Top = 23
            Width = 534
            Height = 21
            DataField = 'COMENTARIO'
            DataSource = DMCierreParcialOrden.DSQMCierreParcial
            TabOrder = 1
          end
          object DBEFecha: TLFDBDateEdit
            Left = 176
            Top = 1
            Width = 89
            Height = 21
            DataField = 'FECHA_CREACION'
            DataSource = DMCierreParcialOrden.DSQMCierreParcial
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object ETextoEstado: TLFEdit
            Left = 332
            Top = 1
            Width = 108
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        OnExit = TSTablaExit
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 47
          DataSource = DMCierreParcialOrden.DSQMCierreParcial
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'CIERRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CREACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              ReadOnly = True
              Width = 345
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 790
  end
  object PNLDetalle: TLFPanel [2]
    Left = 0
    Top = 105
    Width = 790
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGDetalle: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 790
      Height = 213
      Align = alClient
      DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalle
      DefaultDrawing = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGDetalleCellClick
      OnDrawColumnCell = DBGDetalleDrawColumnCell
      OnDblClick = DBGDetalleDblClick
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
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'ID_ORDEN')
      CamposAMostrar.Strings = (
        'ID_ORDEN'
        '2'
        'REFERENCIA'
        'COMPUESTO')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      MensajeNoExiste = False
      Numericos.Strings = (
        'ID_ORDEN')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'PRO_ORD')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'RIG_OF')
      Posicion = tpCentrado
      OnBusqueda = DBGDetalleBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'ID_ORDEN'
        '')
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ORDEN'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescSituacion'
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG_OF'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 79
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 245
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ORIGEN'
          ReadOnly = True
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_LOTE'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescLote'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG_MOV'
          ReadOnly = True
          Width = 65
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 790
      Height = 24
      AutoSize = True
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 2
        Width = 240
        Height = 22
        DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalle
        Flat = True
        ParentShowHint = False
        PopupMenu = PUDetalle
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGDetalle
        InsertaControl = DBGDetalle
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = True
      end
    end
    object PNLSubDetalle: TLFPanel
      Left = 0
      Top = 237
      Width = 790
      Height = 205
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object DBGSubDetalle: TDBGridFind2000
        Left = 0
        Top = 25
        Width = 790
        Height = 152
        Align = alClient
        DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 3
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = True
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        Campos.Strings = (
          'UBICACION'
          'ID_UBICACION'
          'TIPO_UNIDAD_LOGISTICA'
          'ALM_DEST')
        CamposAMostrar.Strings = (
          'UBICACION'
          '0'
          'ID_UBICACION'
          '0'
          'TIPO_UNIDAD_LOGISTICA'
          '0'
          'ALM_DEST'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          'COMPOSICION'
          'ID_UBICACION'
          'TIPO'
          'ALMACEN')
        CamposDesplegar.Strings = (
          '1'
          '1'
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'ESTADO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'COMPOSICION'
          'ID_UBICACION'
          'TIPO'
          'ALMACEN')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'VER_ARTICULOS_UBICACIONES'
          'ART_ALMACENES_UBICACIONES'
          'VER_ARTICULOS_UNID_LOG'
          'ART_ALMACENES')
        Acciones.Strings = (
          ''
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO_DESCRIPCION'
          'TITULO'
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGSubDetalleBusqueda
        Planes.Strings = (
          ''
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'COMPOSICION'
          'TITULO'
          'TIPO'
          'ALMACEN'
          'TIPO')
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SUB_LINEA'
            Width = 30
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID_LOTE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'UNIDADES'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescArticulo'
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LOTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALM_DEST'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_LOGISITCAS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TIPO_UNIDAD_LOGISTICA'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_UBICACION'
            Width = 47
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UBICACION'
            Width = 115
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID'
            Visible = False
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID_DETALLES_ST'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'OPERARIO'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTAS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CALIDAD'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Visible = True
          end>
      end
      object TBSubDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 790
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        TabOrder = 1
        Separators = True
        object NavSubDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 240
          Height = 22
          DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
          Flat = True
          ParentShowHint = False
          PopupMenu = PUSubDetalle
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGSubDetalle
          InsertaControl = DBGSubDetalle
          Exclusivo = True
          ControlEdit = CESubDetalle
          OrdenAscendente = True
          InsertaUltimo = True
        end
      end
      object PNLInfo: TLFPanel
        Left = 0
        Top = 177
        Width = 790
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object LBLSumaUnidades: TLFLabel
          Left = 34
          Top = 8
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Unidades'
        end
        object DBESumUnidades: TLFDbedit
          Left = 83
          Top = 5
          Width = 70
          Height = 21
          Color = clInfoBk
          DataField = 'SUM_UNIDADES'
          DataSource = DMCierreParcialOrden.DSQMCierreParcialDetalleLote
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    FichaExclusiva = nil
    Left = 472
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 508
    Top = 24
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMibuscar: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiaprox: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiexacta: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiimprime: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirango: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMireport: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicopy: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicut: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipaste: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMisalir: TMenuItem
      ShortCut = 0
    end
  end
  inherited ALMain: TLFActionList
    Left = 496
    Top = 80
    object AListado: TAction
      Category = 'Listados'
      Caption = 'Listado de Cierre Parcial de Orden'
      Hint = 'Listado de Cierre Parcial de Orden'
      ImageIndex = 14
      OnExecute = AListadoExecute
    end
    object AConfListado: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Cierre Parcial de Orden'
      Hint = 'Listado de Cierre Parcial de Orden'
      ImageIndex = 77
      OnExecute = AConfListadoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AListarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Listar etiquetas'
      Hint = 'Listar etiquetas'
      ImageIndex = 95
      OnExecute = AListarEtiquetasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      Hint = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 544
    Top = 32
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CESubDetalle
    SubComplementario = ALMain
    PopUpMenu = PUDetalle
    Teclas = DMMain.Teclas
    Left = 472
    Top = 52
  end
  object CESubDetalle: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = PUSubDetalle
    Teclas = DMMain.Teclas
    Left = 384
    Top = 108
  end
  object PUDetalle: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 508
    Top = 48
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
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
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
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem13: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem14: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem15: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem16: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object MenuItem17: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object MenuItem18: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object MenuItem19: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem20: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object MenuItem21: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object PUSubDetalle: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 420
    Top = 104
    object PMDetalle: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem23: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem24: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem25: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem26: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem27: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem28: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem29: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem30: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem31: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem32: TMenuItem
      Caption = '-'
    end
    object MenuItem33: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem34: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem35: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem36: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem37: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object MenuItem38: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object MenuItem39: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object MenuItem40: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem41: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object MenuItem42: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
    object CESubDetalleMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CESubDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CESubDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CESubDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CESubDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CESubDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CESubDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CESubDetalleMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CESubDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CESubDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object LFActionList1: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 496
    Top = 112
    object AAtras: TAction
      Hint = 'Abrir Cierre Parcial'
      ImageIndex = 51
      OnExecute = AAtrasExecute
    end
    object AAdelante: TAction
      Hint = 'Cerrar Cierre Parcial'
      ImageIndex = 25
      OnExecute = AAdelanteExecute
    end
    object AMovimiento: TAction
      Caption = 'Muestra el movimiento manual de stock generado'
      Hint = 'Muestra el movimiento manual de stock generado'
      ImageIndex = 128
      OnExecute = AMovimientoExecute
    end
  end
end
