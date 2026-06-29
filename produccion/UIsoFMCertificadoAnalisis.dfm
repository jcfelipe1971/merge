inherited IsoFMCertificadoAnalisis: TIsoFMCertificadoAnalisis
  Left = 435
  Top = 252
  Width = 782
  Height = 629
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento Certificado An'#225'lisis'
  PopupMenu = CEArticulosPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 772
    Height = 297
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 768
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBDTPFechaAdq
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 286
      end
      inherited TbuttComp: TToolButton
        Left = 294
      end
    end
    inherited PCMain: TLFPageControl
      Width = 768
      Height = 267
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 760
          Height = 233
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 73
            Tabla_a_buscar = 'ISO_ENSAYO_ORD_CAB'
            CampoNum = 'ID_ENSAYO'
            CampoStr = 'ARTICULO'
            OrdenadoPor.Strings = (
              'ID_ENSAYO')
          end
          object LRIG: TLFLabel
            Left = 31
            Top = 29
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ensayo'
            FocusControl = DBEID
          end
          object LFechaAdq: TLFLabel
            Left = 582
            Top = 29
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLArticulo: TLFLabel
            Left = 29
            Top = 72
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LRevision: TLFLabel
            Left = 26
            Top = 52
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Revisi'#243'n'
          end
          object LResponsable: TLFLabel
            Left = 5
            Top = 139
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LNotas: TLFLabel
            Left = 5
            Top = 184
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apl.Tipo Ref.'
          end
          object LUnidadesEnviadas: TLFLabel
            Left = 8
            Top = 213
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidad Env.'
          end
          object LUnidadesTrans: TLFLabel
            Left = 203
            Top = 213
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidad Trans.'
          end
          object LLoteHomogeneo: TLFLabel
            Left = 409
            Top = 213
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote Homogeneo'
          end
          object LBLLote: TLFLabel
            Left = 431
            Top = 29
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
          end
          object LBLCliente: TLFLabel
            Left = 34
            Top = 94
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LBLOrden: TLFLabel
            Left = 309
            Top = 29
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LProducto: TLFLabel
            Left = 24
            Top = 117
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Producto'
          end
          object LReferencia: TLFLabel
            Left = 573
            Top = 117
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ref.'
          end
          object LDescripcion: TLFLabel
            Left = 418
            Top = 139
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc.'
          end
          object LColores: TLFLabel
            Left = 575
            Top = 139
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Col.'
          end
          object LNombre: TLFLabel
            Left = 418
            Top = 117
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ficha'
          end
          object LAplicPref: TLFLabel
            Left = 19
            Top = 162
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aplic.Pref.'
          end
          object LBLCarNormaUne: TLFLabel
            Left = 415
            Top = 160
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Car. UNE'
          end
          object DBEID: TLFDbedit
            Left = 69
            Top = 25
            Width = 76
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_ENSAYO'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            Enabled = False
            TabOrder = 0
          end
          object DBEDescripArticulo: TLFDbedit
            Left = 191
            Top = 69
            Width = 525
            Height = 21
            Color = clInfoBk
            DataField = 'DescArt'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            Enabled = False
            TabOrder = 3
          end
          object DBDTPFechaAdq: TLFDBDateEdit
            Left = 616
            Top = 25
            Width = 100
            Height = 21
            DataField = 'FECHA_ENSAYO'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 23
          end
          object LFDBArticulo: TLFDBEditFind2000
            Left = 69
            Top = 69
            Width = 121
            Height = 21
            DataField = 'ARTICULO'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CampoADevolver = 'ARTICULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBResponsable: TLFDBEditFind2000
            Left = 69
            Top = 135
            Width = 121
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CampoADevolver = 'EMPLEADO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EResponsable: TLFDbedit
            Left = 191
            Top = 135
            Width = 218
            Height = 21
            Color = clInfoBk
            DataField = 'DescResp'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            Enabled = False
            TabOrder = 10
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 616
            Top = 8
            Width = 97
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMNotas: TLFDBMemo
            Left = 69
            Top = 179
            Width = 647
            Height = 29
            DataField = 'NOTAS'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 15
          end
          object DBERevision: TLFDbedit
            Left = 69
            Top = 47
            Width = 121
            Height = 21
            DataField = 'REVISION'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 1
          end
          object LFDUnidEnv: TLFDbedit
            Left = 69
            Top = 209
            Width = 132
            Height = 21
            DataField = 'UNIDAD_ENVASE'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 16
          end
          object LFDUnidTrans: TLFDbedit
            Left = 273
            Top = 209
            Width = 132
            Height = 21
            DataField = 'UNIDAD_TRANSPORTE'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 17
          end
          object LFDLoteHom: TLFDbedit
            Left = 494
            Top = 209
            Width = 150
            Height = 21
            DataField = 'LOTE_HOMOGENEO'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 18
          end
          object LFDLote: TLFDbedit
            Left = 456
            Top = 25
            Width = 110
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescLote'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            Enabled = False
            ReadOnly = True
            TabOrder = 21
          end
          object DBEDescripCliente: TLFDbedit
            Left = 191
            Top = 91
            Width = 525
            Height = 21
            Color = clInfoBk
            DataField = 'DescCli'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            Enabled = False
            TabOrder = 5
          end
          object LFDBCliente: TLFDBEditFind2000
            Left = 69
            Top = 91
            Width = 121
            Height = 21
            DataField = 'CLIENTE'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            CampoADevolver = 'CLIENTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDOrden: TLFDbedit
            Left = 342
            Top = 25
            Width = 67
            Height = 21
            Color = clInfoBk
            DataField = 'ID_ORDEN'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            Enabled = False
            ReadOnly = True
            TabOrder = 20
          end
          object LFDBECodigo: TLFDbedit
            Left = 69
            Top = 113
            Width = 340
            Height = 21
            DataField = 'NOMBRE_PRODUCTO'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 6
          end
          object LFDBRef: TLFDbedit
            Left = 595
            Top = 113
            Width = 121
            Height = 21
            DataField = 'REFERENCIA'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 8
          end
          object DBEDescripcion: TLFDbedit
            Left = 448
            Top = 135
            Width = 121
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 11
          end
          object LFDColores: TLFDbedit
            Left = 595
            Top = 135
            Width = 121
            Height = 21
            DataField = 'COLORES'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 12
          end
          object LFDNombreProd: TLFDbedit
            Left = 448
            Top = 113
            Width = 121
            Height = 21
            DataField = 'FICHA'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 7
          end
          object LFDAplicPref: TLFDbedit
            Left = 69
            Top = 157
            Width = 340
            Height = 21
            DataField = 'APLICACION_PREFERENTE'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 13
          end
          object LFDBCarNormaUne: TLFDbedit
            Left = 463
            Top = 157
            Width = 253
            Height = 21
            DataField = 'CAR_NORMAS_UNE'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            TabOrder = 14
          end
          object LFDBCHKValor2: TLFDBCheckBox
            Left = 648
            Top = 212
            Width = 97
            Height = 17
            Caption = 'Imprime Valor 2'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 19
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'IMPRIME_VALOR_2'
            DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 760
          Height = 239
          DataSource = IsoDMCertificadoAnalisis.DSQMFichaC
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ENSAYO'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescArt'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescResp'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENSAYO'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REVISION'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDAD_ENVASE'
              ReadOnly = True
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDAD_TRANSPORTE'
              ReadOnly = True
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescCli'
              Width = 65
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 576
    Width = 772
    ButtonHeight = 38
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 297
    Width = 772
    Height = 279
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object SplitDescripcion: TSplitter
      Left = 0
      Top = 237
      Width = 772
      Height = 4
      Cursor = crVSplit
      Align = alBottom
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 772
      Height = 213
      Align = alClient
      DataSource = IsoDMCertificadoAnalisis.DSQMFichaD
      TabOrder = 0
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
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'ISO_ENSAYO'
        'TIPO_UNIDADES')
      CamposAMostrar.Strings = (
        'ISO_ENSAYO'
        '0'
        'TIPO_UNIDADES'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'ME_IMPRIMIR')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'CODIGO'
        'TIPO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'ISO_ENSAYO'
        'SYS_UNIDADES_ARTICULOS')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'DESCRIPCION'
        'TITULO')
      Posicion = tpCentrado
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'CODIGO'
        '')
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISO_ENSAYO'
          Width = 44
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescEnsayo'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IsoTipoEnsayo'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IsoNormativa'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescNormativa'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_1'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_2'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ME_METODO_ENSAYO'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ME_UNIDADES_MINIMO'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ME_UNIDADES_MEDIO'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ME_UNIDADES_MAXIMO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ME_UNIDADES_RESULTADO'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ME_IMPRIMIR'
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 772
      Height = 24
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 2
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = IsoDMCertificadoAnalisis.DSQMFichaD
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
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = True
      end
      object ToolButton1: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBMarcar: TToolButton
        Left = 248
        Top = 0
        Action = AMarcar
      end
      object TBDesmarcar: TToolButton
        Left = 271
        Top = 0
        Action = ADesmarcar
      end
    end
    object DBMDescripcion: TLFDBMemo
      Left = 0
      Top = 241
      Width = 772
      Height = 38
      Align = alBottom
      BevelInner = bvNone
      DataField = 'DESCRIPCION'
      DataSource = IsoDMCertificadoAnalisis.DSQMFichaD
      TabOrder = 1
    end
  end
  inherited CEMain: TControlEdit
    Left = 500
    Top = 24
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 528
    Top = 24
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Top = 24
    object ALstConfigCertificado: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Certificado de An'#225'lisis'
      ImageIndex = 14
      OnExecute = ALstConfigCertificadoExecute
    end
    object ACertificadoAnalisis: TAction
      Category = 'Listados'
      Caption = 'Certificado de An'#225'lisis'
      ImageIndex = 14
      OnExecute = ACertificadoAnalisisExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 77
    end
  end
  inherited FSMain: TLFFibFormStorage
    Top = 24
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 644
    Top = 27
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 672
    Top = 32
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
  object CEArticulos: TControlEdit
    DataSource = IsoDMCertificadoAnalisis.DSQMFichaArt
    PopUpMenu = CEArticulosPMEdit
    Teclas = DMMain.Teclas
    Left = 484
    Top = 128
  end
  object CEArticulosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 512
    Top = 128
    object CEArticulosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEArticulosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEArticulosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEArticulosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEArticulosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEArticulosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEArticulosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEArticulosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEArticulosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEArticulosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ADetalle: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 424
    Top = 128
    object AMarcar: TAction
      Caption = 'AMarcar'
      Hint = 'Marcar todas las l'#237'neas'
      ImageIndex = 19
      OnExecute = AMarcarExecute
    end
    object ADesmarcar: TAction
      Caption = 'ADesmarcar'
      Hint = 'Desmarcar todas las l'#237'neas'
      ImageIndex = 27
      OnExecute = ADesmarcarExecute
    end
  end
end
