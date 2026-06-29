inherited ProFMPauta: TProFMPauta
  Left = 455
  Top = 150
  Width = 800
  Height = 605
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Pautas'
  PopupMenu = CENotasPautaPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 302
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = ProDMPauta.DSCabPauta
        Hints.Strings = ()
        EditaControl = DBECompuesto
        InsertaControl = DBECompuesto
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 272
      inherited TSFicha: TTabSheet
        object SBACompuesto: TSpeedButton [0]
          Left = 289
          Top = 28
          Width = 144
          Height = 26
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
          GroupIndex = -1
          OnDblClick = SBACompuestoDblClick
        end
        object SBAEscandallo: TSpeedButton [1]
          Left = 293
          Top = 32
          Width = 144
          Height = 26
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
          GroupIndex = -1
          OnDblClick = SBAEscandalloDblClick
        end
        object SBACliente: TSpeedButton [2]
          Left = 297
          Top = 36
          Width = 144
          Height = 26
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        inherited PEdit: TLFPanel
          Width = 778
          Height = 244
          inherited G2KTableLoc: TG2KTBLoc
            Left = 16
            Top = 14
            CamposADesplegar.Strings = (
              'TITULO')
            DataSource = ProDMPauta.DSCabPauta
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_PAUTA'
            CampoNum = 'PAUTA'
            CampoStr = 'COMPUESTO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LPauta: TLFLabel
            Left = 41
            Top = 12
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pauta'
          end
          object LFechaCreacion: TLFLabel
            Left = 187
            Top = 13
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Creaci'#243'n'
          end
          object LLineaFase: TLFLabel
            Left = 17
            Top = 79
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea Fase'
          end
          object LCompuesto: TLFLabel
            Left = 16
            Top = 35
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Compuesto'
          end
          object LMaterial: TLFLabel
            Left = 32
            Top = 145
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Material'
          end
          object LCliente: TLFLabel
            Left = 37
            Top = 166
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LComentario: TLFLabel
            Left = 16
            Top = 208
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LResponsable: TLFLabel
            Left = 7
            Top = 187
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LEscandallo: TLFLabel
            Left = 16
            Top = 56
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LPlano: TLFLabel
            Left = 40
            Top = 102
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plano'
          end
          object LProyecto: TLFLabel
            Left = 489
            Top = 122
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object LMaquina: TLFLabel
            Left = 27
            Top = 124
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
          end
          object LOperacion: TLFLabel
            Left = 213
            Top = 57
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operaci'#243'n'
          end
          object LNroUtil: TLFLabel
            Left = 504
            Top = 145
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Util'
          end
          object LUbicacino: TLFLabel
            Left = 486
            Top = 167
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ubicaci'#243'n'
          end
          object LIndice: TLFLabel
            Left = 233
            Top = 101
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = #205'ndice'
          end
          object LDenominacion: TLFLabel
            Left = 466
            Top = 189
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Denominaci'#243'n'
          end
          object DBPauta: TLFDbedit
            Left = 72
            Top = 9
            Width = 88
            Height = 21
            Color = clInfoBk
            DataField = 'PAUTA'
            DataSource = ProDMPauta.DSCabPauta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBDEFechaCreacion: TLFDBDateEdit
            Left = 265
            Top = 9
            Width = 102
            Height = 21
            DataField = 'FECHA_CREACION'
            DataSource = ProDMPauta.DSCabPauta
            CheckOnExit = True
            DefaultToday = True
            DialogTitle = 'Selecciona una fecha'
            NumGlyphs = 2
            TabOrder = 1
          end
          object EDescCompuesto: TLFEdit
            Left = 161
            Top = 31
            Width = 426
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnDblClick = EDescCompuestoDblClick
          end
          object DBECompuesto: TLFDBEditFind2000
            Left = 72
            Top = 31
            Width = 88
            Height = 21
            DataField = 'COMPUESTO'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 2
            OnChange = DBECompuestoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ESCANDALLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'ESCANDALLO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBECompuestoBusqueda
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFLineaFases: TLFDBEditFind2000
            Left = 72
            Top = 75
            Width = 88
            Height = 21
            DataField = 'LINEA_FASE'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_FASES_ESC'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'LINEA_FASE'
            CampoStr = 'FASE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFLineaFasesBusqueda
            OrdenadoPor.Strings = (
              'LINEA_FASE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEMaterial: TLFDbedit
            Left = 72
            Top = 141
            Width = 389
            Height = 21
            DataField = 'MATERIAL'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 10
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 72
            Top = 163
            Width = 88
            Height = 21
            DataField = 'CLIENTE'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 11
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescCliente: TLFEdit
            Left = 161
            Top = 163
            Width = 300
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            OnDblClick = EDescClienteDblClick
          end
          object EDescResponsable: TLFEdit
            Left = 161
            Top = 185
            Width = 300
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBEFResponsable: TLFDBEditFind2000
            Left = 72
            Top = 185
            Width = 88
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 13
            OnChange = DBEFResponsableChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEComentario: TLFDbedit
            Left = 72
            Top = 207
            Width = 665
            Height = 21
            DataField = 'COMENTARIO'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 15
          end
          object DBEEscandallo: TLFDBEditFind2000
            Left = 72
            Top = 53
            Width = 88
            Height = 21
            DataField = 'ESCANDALLO'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 4
            OnDblClick = DBEEscandalloDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ESCANDALLO'
            CampoStr = 'COMPUESTO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEEscandalloBusqueda
            OrdenadoPor.Strings = (
              'ESCANDALLO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEPlano: TLFDbedit
            Left = 72
            Top = 97
            Width = 147
            Height = 21
            DataField = 'PLANO'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 6
          end
          object DBEProyecto: TLFDbedit
            Left = 537
            Top = 119
            Width = 200
            Height = 21
            DataField = 'PROYECTO'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 7
          end
          object DBEFMaquina: TLFDBEditFind2000
            Left = 72
            Top = 119
            Width = 88
            Height = 21
            DataField = 'MAQUINA'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 8
            OnChange = DBEFMaquinaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODMAQ')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescMaquina: TLFEdit
            Left = 161
            Top = 119
            Width = 300
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object DBEOperacion: TLFDbedit
            Left = 265
            Top = 53
            Width = 196
            Height = 21
            DataField = 'OPERACION'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 16
          end
          object EDescFase: TLFDbedit
            Left = 250
            Top = 75
            Width = 337
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FASE'
            DataSource = ProDMPauta.DSxTituloFase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object DBEUtil: TLFDbedit
            Left = 537
            Top = 141
            Width = 85
            Height = 21
            DataField = 'NUM_UTIL'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 17
          end
          object DBEUbicacion: TLFDbedit
            Left = 537
            Top = 163
            Width = 85
            Height = 21
            DataField = 'UBICACION'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 18
          end
          object DBEIndice: TLFDbedit
            Left = 265
            Top = 97
            Width = 196
            Height = 21
            DataField = 'INDICE'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 19
          end
          object DBEDenominacion: TLFDbedit
            Left = 537
            Top = 185
            Width = 200
            Height = 21
            DataField = 'DENOMINACION'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 20
          end
          object DBEFase: TLFDbedit
            Left = 161
            Top = 75
            Width = 88
            Height = 21
            Color = clInfoBk
            DataField = 'FASE'
            DataSource = ProDMPauta.DSCabPauta
            Enabled = False
            TabOrder = 22
            OnChange = DBEFaseChange
          end
        end
      end
      object TSCroquis: TTabSheet [1]
        Caption = 'Imagenes'
        ImageIndex = 19
        OnShow = TSCroquisShow
        object TBImagenes: TLFToolBar
          Left = 0
          Top = 0
          Width = 778
          Height = 24
          EdgeBorders = [ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavDibPauta: THYMNavigator
            Left = 0
            Top = 0
            Width = 200
            Height = 22
            DataSource = ProDMPauta.DSDibPauta
            Flat = True
            ParentShowHint = False
            PopupMenu = CEImagenesPautaPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGDibPauta
            InsertaControl = DBGDibPauta
            Exclusivo = True
            ControlEdit = CEImagenesPauta
            OrdenAscendente = True
            InsertaUltimo = True
          end
        end
        object DBGDibPauta: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 521
          Height = 220
          Align = alClient
          DataSource = ProDMPauta.DSDibPauta
          TabOrder = 1
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'ID_IMAGEN'
            'TCONTROL')
          CamposAMostrar.Strings = (
            'ID_IMAGEN'
            '0'
            'TCONTROL'
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
            'PRINCIPAL')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO'
            'TIPOCONTROL')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_IMAGENES'
            'PRO_SYS_TIPOCONTROL_PAUTA')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'NOMBRE'
            'DESCRIPCION')
          Posicion = tpCentrado
          OnRowChange = DBGDibPautaRowChange
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            '')
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_IMAGEN'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Descripcion'
              ReadOnly = True
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCONTROL'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescTControl'
              ReadOnly = True
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRINCIPAL'
              Width = 50
              Visible = True
            end>
        end
        object PNLImagen: TLFPanel
          Left = 521
          Top = 24
          Width = 257
          Height = 220
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object Imagen: TImage
            Left = 0
            Top = 0
            Width = 257
            Height = 220
            Align = alClient
            Stretch = True
          end
        end
      end
      object TSNotas: TTabSheet [2]
        Caption = 'Notas'
        ImageIndex = 3
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 778
          Height = 26
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object HYMNavigator2: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 22
            DataSource = ProDMPauta.DSCabPauta
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPautaPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = LFDBNotas
            Exclusivo = True
            ControlEdit = CENotasPauta
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNNotas: TLFPanel
          Left = 0
          Top = 26
          Width = 778
          Height = 218
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LFDBNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 778
            Height = 218
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'NOTAS'
            DataSource = ProDMPauta.DSCabPauta
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 244
          DataSource = ProDMPauta.DSCabPauta
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'COMENTARIO'
            'COMPUESTO'
            'CROQUIS'
            'DENOMINACION'
            'ESCANDALLO'
            'FASE'
            'FECHA_CREACION'
            'INDICE'
            'LINEA_FASE'
            'MAQUINA'
            'MATERIAL'
            'NOMBRE_R_SOCIAL'
            'NUM_UTIL'
            'OPERACION'
            'PAUTA'
            'PLANO'
            'PROYECTO'
            'RESPONSABLE'
            'TITULO'
            'UBICACION')
          Columns = <
            item
              Expanded = False
              FieldName = 'PAUTA'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CREACION'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSABLE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPUESTO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FASE'
              Width = 30
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 302
    Width = 790
    Height = 250
    inherited TBDetalle: TLFToolBar
      Width = 790
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
        InsertaUltimo = True
      end
      object ToolButton1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBTipoControl: TLFComboBox
        Left = 228
        Top = 0
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBTipoControlChange
        Items.Strings = (
          'Todas')
      end
      object ToolButton2: TToolButton
        Left = 373
        Top = 0
        Action = ANotasDetalle
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 790
      Height = 228
      DataSource = ProDMPauta.DSDetPauta
      Campos.Strings = (
        'TIPOCONTROL')
      CamposAMostrar.Strings = (
        'TIPOCONTROL'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      Numericos.Strings = (
        'TIPOCONTROL')
      Tablas.Strings = (
        'PRO_SYS_TIPOCONTROL_PAUTA')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'DESCRIPCION')
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        '')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOCONTROL'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescTipoControl'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_CONTROL'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INSTRUCCION_CONTROL'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FRECUENCIA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FRECUENCIA2'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FRECUENCIA3'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COTA'
          Width = 80
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 552
    Width = 790
  end
  inherited CEMain: TControlEdit
    Left = 488
    Top = 44
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 532
    Top = 44
  end
  inherited ALMain: TLFActionList
    Left = 496
    Top = 8
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object AProPautas: TAction
      Category = 'Listado'
      Caption = 'Listado de Pautas'
      ImageIndex = 14
      OnExecute = AProPautasExecute
    end
    object AProConfig: TAction
      Category = 'Listado;Configuraci'#243'n'
      Caption = 'Configurar Pautas'
      ImageIndex = 77
      OnExecute = AProConfigExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Firmas'
      Caption = 'Firmas'
      ImageIndex = 19
    end
    object APautaAprobado: TAction
      Category = 'Firmas'
      Caption = 'Firma Aprobado'
    end
    object APautaVerificado: TAction
      Category = 'Firmas'
      Caption = 'Firma Verificado'
    end
    object APautaValidado: TAction
      Category = 'Firmas'
      Caption = 'Firma Validado'
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listado;Configuraci'#243'n'
      Caption = 'Configuraci'#243'n Listados'
      ImageIndex = 77
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 544
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    Left = 646
    Top = 16
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 682
    Top = 18
  end
  object CEImagenesPauta: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSCroquis
    FichaExclusiva = TSCroquis
    Complementario = TBMain
    PopUpMenu = CEImagenesPautaPMEdit
    Teclas = DMMain.Teclas
    Left = 416
    Top = 8
  end
  object CEImagenesPautaPMEdit: TPopUpTeclas
    Left = 456
    Top = 8
    object CEImagenesPautaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEImagenesPautaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEImagenesPautaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEImagenesPautaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEImagenesPautaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEImagenesPautaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEImagenesPautaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenesPautaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenesPautaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenesPautaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENotasPauta: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNNotas
    Complementario = TBMain
    PopUpMenu = CENotasPautaPMEdit
    Teclas = DMMain.Teclas
    Left = 616
    Top = 48
  end
  object CENotasPautaPMEdit: TPopUpTeclas
    Left = 672
    Top = 40
    object CENotasPautaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasPautaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasPautaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasPautaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasPautaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasPautaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasPautaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasPautaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasPautaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasPautaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALEscandallo: TActionList
    Images = DMMain.ILMain_Ac
    Left = 585
    Top = 9
    object AEscandallo: TAction
      Caption = 'Escandallo'
      Hint = 'Escandallo'
      ImageIndex = 10
      OnExecute = AEscandalloExecute
    end
    object ACompuesto: TAction
      Caption = 'Compuesto'
      Hint = 'Compuesto'
      ImageIndex = 109
      OnExecute = ACompuestoExecute
    end
    object ACliente: TAction
      Caption = 'Cliente'
      Hint = 'Cliente'
      ImageIndex = 104
      OnExecute = AClienteExecute
    end
    object ANotasDetalle: TAction
      Caption = 'Notas'
      ImageIndex = 18
      OnExecute = ANotasDetalleExecute
    end
  end
end
