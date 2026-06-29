inherited FMMoldes: TFMMoldes
  Left = 288
  Top = 227
  Caption = 'Mantenimiento de Moldes'
  ClientHeight = 501
  ClientWidth = 777
  PopupMenu = CEImagenPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 777
    Height = 241
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 773
      inherited NavMain: THYMNavigator
        DataSource = DMMoldes.DSQMCabecera
        Hints.Strings = ()
        EditaControl = DBEDescripMolde
        InsertaControl = DBEnum_molde
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      object TArticuloPostizo: TToolButton
        Left = 339
        Top = 0
        Hint = 'Buscar por art'#237'culo postizo'
        Caption = 'Buscar por art'#237'culo postizo'
        ImageIndex = 83
        OnClick = TArticuloPostizoClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 773
      Height = 211
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 765
          Height = 183
          inherited G2KTableLoc: TG2KTBLoc
            Left = 10
            Top = 6
            DataSource = DMMoldes.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_MOLDES'
            CampoNum = 'NUM_MOLDE'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LBLMolde: TLFLabel
            Left = 50
            Top = 4
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Molde'
          end
          object LBLPropietario: TLFLabel
            Left = 29
            Top = 26
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Propietario'
          end
          object LFLabel1: TLFLabel
            Left = 30
            Top = 48
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ubicaci'#243'n'
          end
          object LBLTipo_boquilla: TLFLabel
            Left = 17
            Top = 70
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Boquilla'
          end
          object LFLabel2: TLFLabel
            Left = 359
            Top = 70
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Inyeccion'
          end
          object LBLAlto: TLFLabel
            Left = 60
            Top = 92
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alto'
          end
          object LBLAncho: TLFLabel
            Left = 218
            Top = 92
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho'
          end
          object LBLLargo: TLFLabel
            Left = 402
            Top = 92
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Largo'
          end
          object LBLDiametro_Expulsor: TLFLabel
            Left = 345
            Top = 114
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Diametro Expulsor'
          end
          object LFLabel3: TLFLabel
            Left = 14
            Top = 114
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aro Centrador'
          end
          object LFLabel4: TLFLabel
            Left = 14
            Top = 136
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Cavidades'
          end
          object LBLFechaLlegada: TLFLabel
            Left = 560
            Top = 4
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Llegada'
          end
          object LBLFechaSalida: TLFLabel
            Left = 569
            Top = 26
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Salida'
          end
          object DBEnum_molde: TLFDbedit
            Left = 84
            Top = 1
            Width = 85
            Height = 21
            DataField = 'NUM_MOLDE'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 0
          end
          object DBEDescripMolde: TLFDbedit
            Left = 170
            Top = 1
            Width = 349
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 1
          end
          object DescPropietario: TLFHYDBDescription
            Left = 170
            Top = 23
            Width = 349
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = DMMoldes.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'PROPIETARIO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'CLIENTE')
          end
          object DBEFPropietario: TLFDBEditFind2000
            Left = 84
            Top = 23
            Width = 85
            Height = 21
            DataField = 'PROPIETARIO'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 2
            OnChange = DBEFPropietarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
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
          object DescUbicacion: TLFHYDBDescription
            Left = 170
            Top = 45
            Width = 349
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = DMMoldes.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 21
            Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'ID_UBICACION')
            CamposWhereTabla.Strings = (
              'ID_UBICACION')
          end
          object CBVTipo_boquilla: TDBComboBoxValue
            Left = 84
            Top = 67
            Width = 85
            Height = 21
            Style = csDropDownList
            Ctl3D = True
            DataField = 'TIPO_BOQUILLA'
            DataSource = DMMoldes.DSQMCabecera
            ItemHeight = 13
            Items.Strings = (
              'Radio'
              'Conica')
            Values.Strings = (
              '0'
              '1')
            ParentCtl3D = False
            TabOrder = 4
          end
          object DBComboBoxValue1: TDBComboBoxValue
            Left = 434
            Top = 67
            Width = 85
            Height = 21
            Style = csDropDownList
            Ctl3D = True
            DataField = 'TIPO_INYECCION'
            DataSource = DMMoldes.DSQMCabecera
            ItemHeight = 13
            Items.Strings = (
              'Directa'
              'Submarina'
              'Canal Caliente')
            Values.Strings = (
              '0'
              '1'
              '2')
            ParentCtl3D = False
            TabOrder = 5
          end
          object DBEAlto: TLFDbedit
            Left = 84
            Top = 89
            Width = 85
            Height = 21
            DataField = 'ALTO'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 6
          end
          object DBEAncho: TLFDbedit
            Left = 255
            Top = 89
            Width = 85
            Height = 21
            DataField = 'ANCHO'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 7
          end
          object DBELargo: TLFDbedit
            Left = 434
            Top = 89
            Width = 85
            Height = 21
            DataField = 'LARGO'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 8
          end
          object DBEDiametroExpulsor: TLFDbedit
            Left = 434
            Top = 111
            Width = 85
            Height = 21
            DataField = 'DIAMETRO_EXPULSOR'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 10
          end
          object DBEAroCentrador: TLFDbedit
            Left = 84
            Top = 111
            Width = 85
            Height = 21
            DataField = 'ARO_CENTRADOR'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 9
          end
          object DBENCavidades: TLFDbedit
            Left = 84
            Top = 133
            Width = 85
            Height = 21
            DataField = 'NUM_CAVIDADES'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 11
          end
          object DBFFechaLlegada: TLFDBDateEdit
            Left = 637
            Top = 1
            Width = 100
            Height = 21
            DataField = 'FECHA_LLEGADA'
            DataSource = DMMoldes.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
          end
          object DBFFechaSalida: TLFDBDateEdit
            Left = 637
            Top = 23
            Width = 100
            Height = 21
            DataField = 'FECHA_SALIDA'
            DataSource = DMMoldes.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 15
          end
          object ChkBActivo: TLFDBCheckBox
            Left = 552
            Top = 71
            Width = 79
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 16
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMMoldes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ChkBCorrederas: TLFDBCheckBox
            Left = 552
            Top = 92
            Width = 79
            Height = 17
            Caption = 'Correderas'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CORREDERAS'
            DataSource = DMMoldes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ChkBNoyos: TLFDBCheckBox
            Left = 552
            Top = 113
            Width = 79
            Height = 18
            Caption = 'Noyos'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 18
            TabStop = True
            Alignment = taLeftJustify
            OnChange = ChkBNoyosChange
            DataField = 'NOYOS'
            DataSource = DMMoldes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBVTipoNoyo: TDBComboBoxValue
            Left = 637
            Top = 111
            Width = 100
            Height = 21
            Style = csDropDownList
            Ctl3D = True
            DataField = 'TIPO_NOYO'
            DataSource = DMMoldes.DSQMCabecera
            Enabled = False
            ItemHeight = 13
            Items.Strings = (
              'Neum'#225'ticos'
              'El'#233'ctricos'
              'Hidr'#225'ulicos')
            Values.Strings = (
              '0'
              '1'
              '2')
            ParentCtl3D = False
            TabOrder = 19
          end
          object DBEFUbicacion: TLFDBEditFind2000
            Left = 84
            Top = 45
            Width = 85
            Height = 21
            DataField = 'ID_UBICACION'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 3
            OnChange = DBEFUbicacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_UBICACION'
            CampoStr = 'TITULO'
            CampoADevolver = 'ID_UBICACION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID_UBICACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBChkBFabricado: TLFDBCheckBox
            Left = -1
            Top = 157
            Width = 81
            Height = 17
            Caption = 'Fabricado'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBChkBFabricadoChange
            DataField = 'FABRICADO'
            DataSource = DMMoldes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFFabricante: TLFDBEditFind2000
            Left = 84
            Top = 155
            Width = 85
            Height = 21
            DataField = 'FABRICANTE'
            DataSource = DMMoldes.DSQMCabecera
            TabOrder = 13
            Visible = False
            OnChange = DBEFFabricanteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescFabricante: TLFHYDBDescription
            Left = 170
            Top = 155
            Width = 349
            Height = 21
            Color = clInfoBk
            DataSource = DMMoldes.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 22
            Visible = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'FABRICANTE')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'PROVEEDOR')
          end
        end
      end
      object TSImagen: TTabSheet [1]
        Caption = '&Imagen'
        ImageIndex = 2
        OnShow = TSImagenShow
        object LBLImagen: TLFLabel
          Left = 87
          Top = 33
          Width = 35
          Height = 13
          Caption = 'Imagen'
        end
        object TBImagenMolde: TLFToolBar
          Left = 0
          Top = 0
          Width = 765
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object LFDbedit1: TLFDbedit
            Left = 0
            Top = 0
            Width = 79
            Height = 21
            Color = clInfoBk
            DataField = 'NUM_MOLDE'
            DataSource = DMMoldes.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object LFDbedit2: TLFDbedit
            Left = 79
            Top = 0
            Width = 215
            Height = 21
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = DMMoldes.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object ToolButton1: TToolButton
            Left = 294
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavImagen: THYMNavigator
            Left = 302
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMMoldes.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEImagenPMEdit
            ShowHint = True
            TabOrder = 2
            OnClick = NavImagenClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEImagen
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object ScrBImagen: TScrollBox
          Left = 127
          Top = 53
          Width = 144
          Height = 130
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          AutoScroll = False
          BorderStyle = bsNone
          TabOrder = 1
          object Imagen: TImage
            Left = 0
            Top = 0
            Width = 144
            Height = 130
            Align = alClient
            AutoSize = True
            IncrementalDisplay = True
            Stretch = True
          end
        end
        object DBEFImagen: TLFDBEditFind2000
          Left = 127
          Top = 30
          Width = 50
          Height = 21
          DataField = 'IMAGEN'
          DataSource = DMMoldes.DSQMCabecera
          TabOrder = 2
          OnChange = DBEFImagenChange
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'SYS_IMAGENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'CODIGO'
          CampoStr = 'NOMBRE'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          OrdenadoPor.Strings = (
            'CODIGO')
          Filtros = []
        end
        object ETituloImagen: TLFEdit
          Left = 178
          Top = 30
          Width = 363
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
        end
        object BCargarImagen: TButton
          Left = 493
          Top = 32
          Width = 23
          Height = 18
          Caption = '...'
          TabOrder = 4
          Visible = False
          OnClick = BCargarImagenClick
        end
        object BClipboard: TButton
          Left = 516
          Top = 32
          Width = 23
          Height = 18
          Hint = 'Cargar imagen desde porta papeles'
          Caption = 'P'
          TabOrder = 5
          Visible = False
          OnClick = BClipboardClick
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 765
          Height = 183
          DataSource = DMMoldes.DSQMCabecera
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'ALTO'
            'ANCHO'
            'ARO_CENTRADOR'
            'CORREDERAS'
            'DESCRIPCION'
            'DIAMETRO_EXPULSOR'
            'FECHA_LLEGADA'
            'FECHA_SALIDA'
            'ID_UBICACION'
            'IMAGEN'
            'LARGO'
            'NOYOS'
            'NUM_CAVIDADES'
            'NUM_MOLDE'
            'PROPIETARIO'
            'TIPO_BOQUILLA'
            'TIPO_INYECCION'
            'TIPO_NOYO')
          Columns = <
            item
              Expanded = False
              FieldName = 'NUM_MOLDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROPIETARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LARGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_BOQUILLA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAMETRO_EXPULSOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_INYECCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_CAVIDADES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_LLEGADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_SALIDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_UBICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARO_CENTRADOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMAGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CORREDERAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOYOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_NOYO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 477
    Width = 777
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 241
    Width = 777
    Height = 236
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TLFPage: TLFPageControl
      Left = 0
      Top = 0
      Width = 777
      Height = 236
      ActivePage = TSReparaciones
      Align = alClient
      OwnerDraw = True
      TabIndex = 3
      TabOrder = 0
      TabPosition = tpBottom
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSArtPostiz: TTabSheet
        Caption = 'Articulo-Postizo'
        object DBGFArticuloPostizo: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 769
          Height = 188
          Align = alClient
          DataSource = DMMoldes.DSQMArticuloPostizo
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMMoldes.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO'
            'NUM_POSTIZO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0'
            'NUM_POSTIZO'
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
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'NUM_POSTIZO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO'
            'NUM_POSTIZO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_CUENTAS'
            'EMP_POSTIZOS')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'DESCRIPCION')
          Posicion = tpCentrado
          OnBusqueda = DBGFArticuloPostizoBusqueda
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            '')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
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
              ReadOnly = True
              Width = 199
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_POSTIZO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescPostizo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 134
              Visible = True
            end>
        end
        object LFToolBar1: TLFToolBar
          Left = 0
          Top = 0
          Width = 769
          Height = 22
          AutoSize = True
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object NavArticuloPostizo: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMMoldes.DSQMArticuloPostizo
            Flat = True
            ParentShowHint = False
            PopupMenu = CEArticuloPostizoPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFArticuloPostizo
            InsertaControl = DBGFArticuloPostizo
            Exclusivo = True
            ControlEdit = CEArticuloPostizo
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSMaquinas: TTabSheet
        Caption = 'Maquinas'
        ImageIndex = 1
        object LFToolBar4: TLFToolBar
          Left = 0
          Top = 0
          Width = 769
          Height = 22
          AutoSize = True
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object HYMNavigator4: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMMoldes.DSQMMaquinas
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMaquinasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGridFind20004
            InsertaControl = DBGridFind20004
            Exclusivo = True
            ControlEdit = CEMaquinas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGridFind20004: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 769
          Height = 188
          Align = alClient
          DataSource = DMMoldes.DSQMMaquinas
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
          Transaction = DMMoldes.TLocal
          BuscarNums = False
          Campos.Strings = (
            'MAQUINA')
          CamposAMostrar.Strings = (
            'MAQUINA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CamposAOrdernar.Strings = (
            'MAQUINA')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODMAQ')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'PRO_MAQUINAS_C')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'DESCRIPCION')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescMaquina'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Visible = True
            end>
        end
      end
      object TSRevisiones: TTabSheet
        Caption = 'Revisiones'
        ImageIndex = 2
        object LFToolBar2: TLFToolBar
          Left = 0
          Top = 0
          Width = 769
          Height = 22
          AutoSize = True
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object HYMNavigator2: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMMoldes.QMDSRevisiones
            Flat = True
            ParentShowHint = False
            PopupMenu = CERevisionesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGridFind20002
            InsertaControl = DBGridFind20002
            Exclusivo = True
            ControlEdit = CERevisiones
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGridFind20002: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 769
          Height = 188
          Align = alClient
          DataSource = DMMoldes.QMDSRevisiones
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMMoldes.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'REVISADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
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
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REVISION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PROXIMA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESULTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABORATORIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REVISADO'
              Width = 52
              Visible = True
            end>
        end
      end
      object TSReparaciones: TTabSheet
        Caption = 'Reparaciones'
        ImageIndex = 3
        object LFToolBar3: TLFToolBar
          Left = 0
          Top = 0
          Width = 769
          Height = 22
          AutoSize = True
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object HYMNavigator3: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMMoldes.QMDSReparaciones
            Flat = True
            ParentShowHint = False
            PopupMenu = CEReparacionesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGridFind20003
            InsertaControl = DBGridFind20003
            Exclusivo = True
            ControlEdit = CEReparaciones
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton3: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object Tbutton: TToolButton
            Left = 248
            Top = 0
            Action = ANotasDetalle
          end
        end
        object DBGridFind20003: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 769
          Height = 188
          Align = alClient
          DataSource = DMMoldes.QMDSReparaciones
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
          Transaction = DMMoldes.TLocal
          BuscarNums = False
          Campos.Strings = (
            'TALLER')
          CamposAMostrar.Strings = (
            'TALLER'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          Numericos.Strings = (
            'ACREEDOR')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ACREEDORES_EMPRESA')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
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
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_DETECCION'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REPARACION'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABORATORIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_REP'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TALLER'
              Width = 36
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescTaller'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 171
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 536
    Top = 303
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 571
    Top = 303
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
    Left = 607
    Top = 303
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AInforme: TAction
      Category = 'Listados'
      Caption = 'Informe de Moldes'
      ImageIndex = 14
      OnExecute = AInformeExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 642
    Top = 303
  end
  object CEArticuloPostizo: TControlEdit
    FichaEdicion = TSArtPostiz
    FichaExclusiva = TSArtPostiz
    PopUpMenu = CEArticuloPostizoPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 344
  end
  object CEArticuloPostizoPMEdit: TPopUpTeclas
    Left = 310
    Top = 344
    object CEArticuloPostizoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEArticuloPostizoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEArticuloPostizoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEArticuloPostizoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEArticuloPostizoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEArticuloPostizoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEArticuloPostizoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEArticuloPostizoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEArticuloPostizoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEArticuloPostizoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEMaquinas: TControlEdit
    FichaEdicion = TSMaquinas
    FichaExclusiva = TSMaquinas
    PopUpMenu = CEMaquinasPMEdit
    Teclas = DMMain.Teclas
    Left = 448
    Top = 344
  end
  object CEMaquinasPMEdit: TPopUpTeclas
    Left = 494
    Top = 344
    object CEMaquinasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMaquinasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMaquinasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMaquinasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMaquinasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMaquinasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMaquinasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMaquinasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMaquinasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMaquinasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CERevisiones: TControlEdit
    FichaEdicion = TSRevisiones
    FichaExclusiva = TSRevisiones
    PopUpMenu = CERevisionesPMEdit
    Teclas = DMMain.Teclas
    Left = 540
    Top = 344
  end
  object CERevisionesPMEdit: TPopUpTeclas
    Left = 586
    Top = 344
    object CERevisionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CERevisionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CERevisionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CERevisionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CERevisionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CERevisionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CERevisionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CERevisionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CERevisionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CERevisionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEReparaciones: TControlEdit
    FichaEdicion = TSReparaciones
    FichaExclusiva = TSReparaciones
    PopUpMenu = CEReparacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 632
    Top = 344
  end
  object CEReparacionesPMEdit: TPopUpTeclas
    Left = 678
    Top = 344
    object CEReparacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEReparacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEReparacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEReparacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEReparacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEReparacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEReparacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEReparacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEReparacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEReparacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEImagen: TControlEdit
    FichaExclusiva = TSImagen
    PopUpMenu = CEImagenPMEdit
    Teclas = DMMain.Teclas
    Left = 356
    Top = 344
  end
  object CEImagenPMEdit: TPopUpTeclas
    Left = 402
    Top = 344
    object CEImagenMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEImagenMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEImagenMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEImagenMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEImagenMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEImagenMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEImagenMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object LFActionList1: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 678
    Top = 303
    object ANotasDetalle: TAction
      Caption = 'Notas Detalle'
      Hint = 'Edita las notas de la linea seleccionada (CTRL+N)'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
    end
  end
end
