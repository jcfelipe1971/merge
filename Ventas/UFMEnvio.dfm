inherited FMEnvio: TFMEnvio
  Left = 272
  Top = 174
  Width = 921
  Height = 668
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Envio de Albaranes y/o Facturas'
  Constraints.MinWidth = 865
  OldCreateOrder = False
  PopupMenu = CENotasPMEdit
  Position = poDefault
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 911
    Height = 201
    inherited TBMain: TLFToolBar
      Width = 907
      EdgeBorders = [ebLeft, ebTop, ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        DataSource = DMEnvio.DSQMCabeceraEnvio
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMEnvio.DSQMCabeceraEnvio
        VisibleButtons = [neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      object TBSep2: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBAbreCierra: TToolButton
        Left = 327
        Top = 0
        Hint = 'Cierra o Abre el envio'
        Caption = 'ACierraEnvio'
        ImageIndex = 68
        OnClick = ACierraEnvioExecute
      end
    end
    inherited PCMain: TLFPageControl
      Width = 907
      Height = 171
      TabOrder = 0
      inherited TSFicha: TTabSheet
        Caption = 'Ficha'
        inherited PEdit: TLFPanel
          Width = 899
          Height = 143
          inherited G2KTableLoc: TG2KTBLoc
            Top = 36
          end
          object LMatricula: TLFLabel
            Left = 413
            Top = 26
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Matr'#237'cula'
          end
          object LZona: TLFLabel
            Left = 25
            Top = 48
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Zona'
          end
          object LFecha: TLFLabel
            Left = 428
            Top = 4
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LTitulo: TLFLabel
            Left = 22
            Top = 26
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LEnvio: TLFLabel
            Left = 6
            Top = 4
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Env'#237'o'
          end
          object LBLEstado: TLFLabel
            Left = 146
            Top = 4
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LBultos: TLFLabel
            Left = 735
            Top = 4
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bultos'
          end
          object LPortes: TLFLabel
            Left = 734
            Top = 26
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object LMedidas: TLFLabel
            Left = 11
            Top = 68
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medidas'
          end
          object DBETitulo: TLFDbedit
            Left = 54
            Top = 22
            Width = 330
            Height = 21
            AutoSize = False
            DataField = 'TITULO'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object EFMatricula: TLFEditFind2000
            Left = 462
            Top = 22
            Width = 67
            Height = 21
            AutoSize = False
            TabOrder = 4
            OnChange = EFMatriculaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'MATRICULA'
              'TITULO')
            CampoNum = 'MATRICULA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'EMP_MATRICULAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFMatriculaBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEMatricula: TLFDbedit
            Left = 530
            Top = 22
            Width = 118
            Height = 21
            AutoSize = False
            DataField = 'MATRICULA'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBDTPEnvio: TLFDBDateEdit
            Left = 462
            Top = 0
            Width = 88
            Height = 21
            DataField = 'FECHA_ENV'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEFZona: TLFDBEditFind2000
            Left = 54
            Top = 44
            Width = 64
            Height = 21
            DataField = 'ZONA'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_ZONAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ZONA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DEFECTO DESC, ZONA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEZona: TLFDbedit
            Left = 119
            Top = 44
            Width = 265
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMEnvio.DSxZona
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
          object DBEEnvio: TLFDbedit
            Left = 54
            Top = 0
            Width = 83
            Height = 21
            DataField = 'ENVIO'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBEEnvioChange
          end
          object DBETituloEstado: TLFDbedit
            Left = 183
            Top = 0
            Width = 201
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnChange = DBETituloEstadoChange
          end
          object DBBultos: TLFDbedit
            Left = 768
            Top = 0
            Width = 67
            Height = 21
            DataField = 'BULTOS'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            TabOrder = 8
          end
          object DBPortes: TLFDbedit
            Left = 768
            Top = 22
            Width = 67
            Height = 21
            DataField = 'PORTES'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            TabOrder = 9
          end
          object DBMedidas: TLFDBMemo
            Left = 54
            Top = 66
            Width = 838
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MEDIDAS'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            TabOrder = 10
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 1
        object PNLNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 899
          Height = 121
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 899
            Height = 121
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMEnvio.DSQMCabeceraEnvio
            TabOrder = 0
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 899
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
          object PNLInfoNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 569
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object LFechaNotas: TLFLabel
              Left = 439
              Top = 4
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object LRutaNotas: TLFLabel
              Left = 93
              Top = 4
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ruta'
            end
            object DBENotasFechaCab: TLFDbedit
              Left = 473
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA_ENV'
              DataSource = DMEnvio.DSQMCabeceraEnvio
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBENotasRuta: TLFDbedit
              Left = 120
              Top = 0
              Width = 305
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMEnvio.DSxZona
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBENotasNEnvio: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ENVIO'
              DataSource = DMEnvio.DSQMCabeceraEnvio
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
            Left = 569
            Top = 0
            Width = 66
            Height = 22
            DataSource = DMEnvio.DSQMCabeceraEnvio
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            InsertaControl = DBMNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        Caption = 'Tabla'
        ImageIndex = 2
        inherited DBGMain: THYTDBGrid
          Width = 899
          Height = 143
          DataSource = DMEnvio.DSQMCabeceraEnvio
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'ENVIO'
            'FECHA_ENV'
            'MATRICULA'
            'PORTES'
            'RUTA'
            'SERVIDO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ENVIO'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 271
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENV'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTA'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATRICULA'
              Width = 168
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERVIDO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 201
    Width = 911
    Height = 414
    TabOrder = 1
    inherited TBDetalle: TLFToolBar
      Width = 911
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        Width = 176
        DataSource = DMEnvio.DSQMEnvio
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        Exclusivo = True
      end
      object TBSep3: TToolButton
        Left = 176
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBMarcarTodo: TToolButton
        Left = 184
        Top = 0
        Hint = 'Marcar todo'
        Caption = 'Marcar Todo'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TBMarcarTodoClick
      end
      object TBDesmarcarTodo: TToolButton
        Left = 207
        Top = 0
        Hint = 'Desmarcar todo'
        Caption = 'Desmarcar todo'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TBDesmarcarTodoClick
      end
      object TBSep1: TToolButton
        Left = 230
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBMostrar: TToolButton
        Left = 238
        Top = 0
        Action = AMostrarFiltros
        ParentShowHint = False
        ShowHint = True
      end
      object TBNoMostrar: TToolButton
        Left = 261
        Top = 0
        Action = ANoMostrarFiltros
        ParentShowHint = False
        ShowHint = True
      end
      object TBSep4: TToolButton
        Left = 284
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBAplicar: TToolButton
        Left = 292
        Top = 0
        Action = AAplicarFiltros
        ParentShowHint = False
        ShowHint = True
      end
      object TBNoAplicar: TToolButton
        Left = 315
        Top = 0
        Action = AInicializarFiltros
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Top = 246
      Width = 911
      Height = 168
      DataSource = DMEnvio.DSQMEnvio
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      IniStorage = FSMain
      ColumnaInicial = 1
      AutoPostEnCheckBox = True
      BuscarChars = False
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposAOrdernar.Strings = (
        'RIG'
        'CLIENTE'
        'FECHA_RIG'
        'TOTAL'
        'TITULO_CLI'
        'NOMBRE_TRANSPORTISTA'
        'TIPO_SERVICIO'
        'TIPO_VEHICULO'
        'TITULO_DIR'
        'TRANSP_INSTAL'
        'TRANSPORTISTA'
        'VEHICULO_ESPECIAL'
        'EMAIL'
        'CONTACTO')
      ColumnasCheckBoxes.Strings = (
        'ENVIO'
        'VEHICULO_ESPECIAL')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '-1'
        '0')
      Columns = <
        item
          Expanded = False
          FieldName = 'ENVIO'
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          ReadOnly = True
          Width = 85
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_RIG'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLIENTE'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_CLI'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TRANSPORTISTA'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = True
          Width = 134
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOMBRE_TRANSPORTISTA'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_SERVICIO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACTO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRANSP_INSTAL'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEHICULO_ESPECIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_VEHICULO'
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BULTOS'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CODIGO_EXPEDICION'
          ReadOnly = True
          Width = 150
          Visible = True
        end>
    end
    object PFiltros: TLFPanel
      Left = 0
      Top = 22
      Width = 911
      Height = 224
      Align = alTop
      BevelOuter = bvNone
      Color = clInfoBk
      TabOrder = 2
      object PArriba: TLFPanel
        Left = 0
        Top = 0
        Width = 911
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object GBAlbaranes: TGroupBox
          Left = 225
          Top = 0
          Width = 224
          Height = 60
          Align = alLeft
          Caption = 'Albaranes'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          object LHastaAlbaran: TLFLabel
            Left = 109
            Top = 36
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object LDesdeAlbaran: TLFLabel
            Left = 106
            Top = 15
            Width = 31
            Height = 13
            Caption = 'Desde'
          end
          object EFHastaAlbaran: TLFEditFind2000
            Left = 142
            Top = 33
            Width = 67
            Height = 21
            AutoSize = False
            TabOrder = 0
            OnChange = CBFiltrarAlbaranesClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'RIG'
            CampoStr = 'SU_REFERENCIA'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDesdeAlbaran: TLFEditFind2000
            Left = 142
            Top = 11
            Width = 67
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarAlbaranesClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'RIG'
            CampoStr = 'SU_REFERENCIA'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFiltrarAlbaranes: TLFCheckBox
            Left = 15
            Top = 21
            Width = 49
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            OnClick = CBFiltrarAlbaranesClick
            Alignment = taLeftJustify
          end
        end
        object GBFechas: TGroupBox
          Left = 704
          Top = 0
          Width = 207
          Height = 60
          Align = alRight
          Caption = 'Fechas'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
          object LDesdeFecha: TLFLabel
            Left = 80
            Top = 14
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaFecha: TLFLabel
            Left = 82
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object DTPDesde: TLFDateEdit
            Left = 115
            Top = 11
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
            OnChange = CBFiltrarFechasClick
          end
          object DTPHasta: TLFDateEdit
            Left = 114
            Top = 33
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
            OnChange = CBFiltrarFechasClick
          end
          object CBFiltrarFechas: TLFCheckBox
            Left = 7
            Top = 21
            Width = 45
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = CBFiltrarFechasClick
            Alignment = taLeftJustify
          end
          object BFiltroFechaHoy: TButton
            Left = 19
            Top = 38
            Width = 33
            Height = 19
            Caption = 'Hoy'
            TabOrder = 3
            OnClick = BFiltroFechaClick
          end
          object BDiaAnterior: TButton
            Tag = -1
            Left = 3
            Top = 38
            Width = 15
            Height = 19
            Caption = '<'
            TabOrder = 4
            OnClick = BFiltroFechaClick
          end
          object BDiaSiguiente: TButton
            Tag = 1
            Left = 53
            Top = 38
            Width = 15
            Height = 19
            Caption = '>'
            TabOrder = 5
            OnClick = BFiltroFechaClick
          end
        end
        object GBCanales: TGroupBox
          Left = 0
          Top = 0
          Width = 225
          Height = 60
          Align = alLeft
          Caption = 'Canales'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          object LDesdeCanal: TLFLabel
            Left = 93
            Top = 15
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaCanal: TLFLabel
            Left = 94
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object EFDesdeCanal: TLFEditFind2000
            Left = 128
            Top = 11
            Width = 67
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarCanalClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFDesdeCanalBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaCanal: TLFEditFind2000
            Left = 128
            Top = 33
            Width = 67
            Height = 21
            AutoSize = False
            TabOrder = 2
            OnChange = CBFiltrarCanalClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFHastaCanalBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFiltrarCanal: TLFCheckBox
            Left = 14
            Top = 21
            Width = 46
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            ParentColor = False
            TabOrder = 0
            TabStop = True
            OnClick = CBFiltrarCanalClick
            Alignment = taLeftJustify
          end
        end
        object GBFactura: TGroupBox
          Left = 449
          Top = 0
          Width = 255
          Height = 60
          Align = alClient
          Caption = 'Facturas'
          TabOrder = 3
          object LDesdeFacturaAlbaran: TLFLabel
            Left = 134
            Top = 15
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaFacturaAlbaran: TLFLabel
            Left = 137
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object EFHastaFac: TLFEditFind2000
            Left = 169
            Top = 33
            Width = 67
            Height = 21
            AutoSize = False
            TabOrder = 0
            OnChange = CBFiltrarFacaturasClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'RIG'
            CampoStr = 'SU_REFERENCIA'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFHastaFacBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDesdeFac: TLFEditFind2000
            Left = 169
            Top = 11
            Width = 67
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarFacaturasClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'RIG'
            CampoStr = 'SU_REFERENCIA'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFDesdeFacBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFacturasCerradas: TLFCheckBox
            Left = 61
            Top = 35
            Width = 70
            Height = 17
            Caption = 'F.Cerradas'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            OnClick = CBFiltrarFacaturasClick
            Alignment = taLeftJustify
          end
          object CBFactuasAbiertas: TLFCheckBox
            Left = 61
            Top = 15
            Width = 65
            Height = 17
            Caption = 'F.Abiertas'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            OnClick = CBFiltrarFacaturasClick
            Alignment = taLeftJustify
          end
          object CBFiltrarFacaturas: TLFCheckBox
            Left = 8
            Top = 21
            Width = 46
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            OnClick = CBFiltrarFacaturasClick
            Alignment = taLeftJustify
          end
        end
      end
      object PAbajo: TLFPanel
        Left = 0
        Top = 60
        Width = 911
        Height = 80
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GBSeries: TGroupBox
          Left = 0
          Top = 0
          Width = 241
          Height = 80
          Align = alLeft
          Caption = 'Series'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          DesignSize = (
            241
            80)
          object LDesdeSerie: TLFLabel
            Left = 10
            Top = 36
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaSerie: TLFLabel
            Left = 13
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object EFDesdeSerie: TLFEditFind2000
            Left = 45
            Top = 33
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarSerieClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = ' VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFDesdeSerieBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaSerie: TLFEditFind2000
            Left = 45
            Top = 55
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 2
            OnChange = CBFiltrarSerieClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = ' VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFHastaSerieBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFiltrarSerie: TLFCheckBox
            Left = 46
            Top = 13
            Width = 46
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = CBFiltrarSerieClick
            Alignment = taLeftJustify
          end
          object ESerieD: TLFEdit
            Left = 100
            Top = 33
            Width = 135
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object ESerieH: TLFEdit
            Left = 100
            Top = 55
            Width = 135
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
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
        end
        object GBClientes: TGroupBox
          Left = 641
          Top = 0
          Width = 270
          Height = 80
          Align = alRight
          Caption = 'Clientes'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            270
            80)
          object LDesdeCliente: TLFLabel
            Left = 6
            Top = 36
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaCliente: TLFLabel
            Left = 9
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object EFDesdeCli: TLFEditFind2000
            Left = 41
            Top = 33
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarClientesClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFDesdeCliBusqueda
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaCli: TLFEditFind2000
            Left = 41
            Top = 55
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 2
            OnChange = CBFiltrarClientesClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFHastaCliBusqueda
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFiltrarClientes: TLFCheckBox
            Left = 41
            Top = 14
            Width = 46
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = CBFiltrarClientesClick
            Alignment = taLeftJustify
          end
          object ECliHasta: TLFEdit
            Left = 96
            Top = 55
            Width = 165
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object ECliDesde: TLFEdit
            Left = 96
            Top = 33
            Width = 165
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
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
        end
        object GBAgrup: TGroupBox
          Left = 241
          Top = 0
          Width = 400
          Height = 80
          Align = alClient
          Caption = 'Agrupaciones'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            400
            80)
          object LDesdeAgrupacion: TLFLabel
            Left = 6
            Top = 36
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaAgrupacion: TLFLabel
            Left = 9
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object EFDesdeAgrup: TLFEditFind2000
            Left = 41
            Top = 33
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarAgrupClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGRUPACIONES_CLI_DISTINTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFDesdeAgrupBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaAgrup: TLFEditFind2000
            Left = 41
            Top = 55
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 2
            OnChange = CBFiltrarAgrupClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGRUPACIONES_CLI_DISTINTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFHastaAgrupBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFiltrarAgrup: TLFCheckBox
            Left = 41
            Top = 14
            Width = 46
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = CBFiltrarAgrupClick
            Alignment = taLeftJustify
          end
          object EAgrupH: TLFEdit
            Left = 96
            Top = 55
            Width = 292
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object EAgrupD: TLFEdit
            Left = 96
            Top = 33
            Width = 292
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
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
        end
      end
      object PClientes: TLFPanel
        Left = 0
        Top = 140
        Width = 911
        Height = 84
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object GBUnCliente: TGroupBox
          Left = 0
          Top = 0
          Width = 385
          Height = 84
          Align = alLeft
          Caption = 'Un Cliente'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          DesignSize = (
            385
            84)
          object LCliente: TLFLabel
            Left = 9
            Top = 36
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LDireccion: TLFLabel
            Left = 7
            Top = 58
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcc.'
          end
          object EFCliente: TLFEditFind2000
            Left = 45
            Top = 33
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarUnClienteClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFiltrarUnCliente: TLFCheckBox
            Left = 45
            Top = 14
            Width = 46
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = CBFiltrarUnClienteClick
            Alignment = taLeftJustify
          end
          object EFDireccion: TLFEditFind2000
            Left = 45
            Top = 55
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 2
            OnChange = CBFiltrarUnClienteClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
          end
          object ETituloCliente: TLFEdit
            Left = 100
            Top = 33
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object EDireccionCliente: TLFEdit
            Left = 100
            Top = 55
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
        object GBTransportistas: TGroupBox
          Left = 385
          Top = 0
          Width = 526
          Height = 84
          Align = alClient
          Caption = 'Transportistas'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            526
            84)
          object LDesdeTransportista: TLFLabel
            Left = 6
            Top = 36
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaTransportista: TLFLabel
            Left = 9
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object EFDesdeTra: TLFEditFind2000
            Left = 41
            Top = 33
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 1
            OnChange = CBFiltrarTransportistaClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object CBFiltrarTransportista: TLFCheckBox
            Left = 41
            Top = 14
            Width = 46
            Height = 17
            Caption = 'Filtrar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = CBFiltrarTransportistaClick
            Alignment = taLeftJustify
          end
          object ETraHasta: TLFEdit
            Left = 96
            Top = 55
            Width = 421
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
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
          object ETraDesde: TLFEdit
            Left = 96
            Top = 33
            Width = 421
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object EFHastaTra: TLFEditFind2000
            Left = 41
            Top = 55
            Width = 54
            Height = 21
            AutoSize = False
            TabOrder = 4
            OnChange = CBFiltrarTransportistaClick
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 615
    Width = 911
    ParentColor = False
    TabOrder = 2
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 512
    Top = 376
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 576
    Top = 376
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    Left = 626
    Top = 4
    object AListadoEnvio: TAction
      Category = 'Listados'
      Caption = 'Listado Envio'
      ImageIndex = 14
      OnExecute = AListadoEnvioExecute
    end
    object AListadoEnvioSfg: TAction
      Category = 'Listados'
      Caption = 'Listado Envio Cliente'
      ImageIndex = 14
      OnExecute = AListadoEnvioSfgExecute
    end
    object ALstPeticionEnvio: TAction
      Category = 'Listados'
      Caption = 'Listado de Petici'#243'n de Envio'
      Hint = 'Listado de Petici'#243'n de Envio'
      ImageIndex = 14
      OnExecute = ALstPeticionEnvioExecute
    end
    object ALstContenidoEnvio: TAction
      Category = 'Listados'
      Caption = 'Listado de Contenido de Envio'
      Hint = 'Listado de Contenido de Envio'
      ImageIndex = 14
      OnExecute = ALstContenidoEnvioExecute
    end
    object AConfEnvio: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Envio'
      ImageIndex = 77
      OnExecute = AConfEnvioExecute
    end
    object AConfEnvioSfg: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Envio Cliente'
      ImageIndex = 77
      OnExecute = AConfEnvioSfgExecute
    end
    object AConfPeticionEnvio: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Petici'#243'n de Envio'
      Hint = 'Listado de Petici'#243'n de Envio'
      ImageIndex = 77
      OnExecute = AConfPeticionEnvioExecute
    end
    object AConfContenidoEnvio: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Contenido de Envio'
      Hint = 'Listado de Contenido de Envio'
      ImageIndex = 77
      OnExecute = AConfContenidoEnvioExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AMostrarFiltros: TAction
      Category = 'Otros'
      Caption = 'Mostrar Filtros'
      Hint = 'Muestra los filtros'
      ImageIndex = 23
      OnExecute = AMostrarFiltrosExecute
    end
    object ANoMostrarFiltros: TAction
      Category = 'Otros'
      Caption = 'No Mostar Filtros'
      Hint = 'Ocultar los filtros'
      ImageIndex = 22
      OnExecute = ANoMostarFiltrosExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AAplicarFiltros: TAction
      Category = 'Procesos'
      Caption = 'Aplicar Filtros'
      Hint = 'Aplicar los filtros elegidos'
      ImageIndex = 5
      OnExecute = AAplicarFiltrosExecute
    end
    object AInicializarFiltros: TAction
      Category = 'Procesos'
      Caption = 'Inicializar Filtros'
      Hint = 'Inicializa los filtros'
      ImageIndex = 21
      OnExecute = AInicializarFiltrosExecute
    end
    object ACierraEnvio: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Envio'
      Hint = 'Cierra o Abre el envio'
      ImageIndex = 68
      OnExecute = ACierraEnvioExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AExportarTXT: TAction
      Category = 'Procesos'
      Caption = 'Exportar a TXT'
      ImageIndex = 36
      OnExecute = AExportarTXTExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 564
    Top = 2
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    Left = 512
    Top = 424
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 584
    Top = 424
    inherited CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      Visible = False
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLNotas
    Complementario = TBDetalle
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 512
    Top = 488
  end
  object CENotasPMEdit: TPopUpTeclas
    Left = 584
    Top = 488
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
end
