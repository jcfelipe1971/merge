inherited FMModelosTallas: TFMModelosTallas
  Left = 216
  Top = 138
  Width = 1316
  Height = 596
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Modelos de Articulos'
  FormStyle = fsNormal
  PopupMenu = CEPreciosPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1306
    Height = 347
    inherited TBMain: TLFToolBar
      Width = 1302
      inherited NavMain: THYMNavigator
        DataSource = DSart_articulos_modelos
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEAgno
        InsertaControl = DBERef_proveedor
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DSart_articulos_modelos
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Action = AStockModelosTallas
      end
      object TButtStockModelosTallas: TToolButton
        Left = 319
        Top = 0
        Action = AStockModelosTallas
      end
      object TBParamArticulo: TToolButton
        Left = 342
        Top = 0
        Action = AParametriza
      end
      object TButtCreaArticulos: TToolButton
        Left = 365
        Top = 0
        Action = ACreaArticulos
      end
      object TButtFiltraArticulos: TToolButton
        Left = 388
        Top = 0
        Action = AFiltraArticulos
      end
      object TButtFiltraEscandallosProd: TToolButton
        Left = 411
        Top = 0
        Action = AFiltraEscandallosProd
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1302
      Height = 317
      inherited TSFicha: TTabSheet
        object SBAGaleria: TSpeedButton [0]
          Left = 493
          Top = 135
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBAGaleriaDblClick
        end
        object SBAFiltraArticulos: TSpeedButton [1]
          Left = 493
          Top = 135
          Width = 153
          Height = 20
          Hint = 'Muestra las fichas de los art'#237'culos pertenecientes a este modelo'
          GroupIndex = -1
          Caption = 'Filtra Articulos'
          OnDblClick = SBAFiltraArticulosDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1294
          Height = 289
          inherited G2KTableLoc: TG2KTBLoc
            Top = 25
            DataSource = DMMaestrosTallas.DSart_articulos_modelos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
            CampoNum = 'REF_PROVEEDOR'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ref_proveedor')
          end
          object LAnyoTempSeccion: TLFLabel
            Left = 11
            Top = 28
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'A'#241'o/Temp/Secc'
          end
          object LFamilia: TLFLabel
            Left = 60
            Top = 72
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LProveedor: TLFLabel
            Left = 43
            Top = 116
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LPCompra: TLFLabel
            Left = 43
            Top = 204
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Compra'
          end
          object LTitulo: TLFLabel
            Left = 64
            Top = 50
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LTipoIVA: TLFLabel
            Left = 36
            Top = 182
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de IVA'
          end
          object LPVenta: TLFLabel
            Left = 51
            Top = 226
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta'
          end
          object LGrupoTallas: TLFLabel
            Left = 32
            Top = 138
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo Tallas'
          end
          object LRefProveedor: TLFLabel
            Left = 20
            Top = 6
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ref. Proveedor'
          end
          object LCodEstructura: TLFLabel
            Left = 19
            Top = 248
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. Estructura'
          end
          object LBaseEstructura: TLFLabel
            Left = 17
            Top = 270
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Estructura'
          end
          object LNotas: TLFLabel
            Left = 422
            Top = 205
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LImagen: TLFLabel
            Left = 811
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LCliente: TLFLabel
            Left = 418
            Top = 182
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LRefCliente: TLFLabel
            Left = 395
            Top = 160
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ref. Cliente'
          end
          object LTarifaDefecto: TLFLabel
            Left = 24
            Top = 161
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa Defecto'
          end
          object LMarca: TLFLabel
            Left = 420
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Marca'
          end
          object LGaleria: TLFLabel
            Left = 811
            Top = 28
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Galer'#237'a'
          end
          object LSubfamilia: TLFLabel
            Left = 44
            Top = 93
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subfamilia'
          end
          object LPCoste: TLFLabel
            Left = 284
            Top = 204
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste'
          end
          object LDCompra: TLFLabel
            Left = 158
            Top = 204
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Compra'
          end
          object LALFA_1: TLFLabel
            Left = 804
            Top = 50
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 1'
          end
          object LALFA_2: TLFLabel
            Left = 804
            Top = 72
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 2'
          end
          object LALFA_3: TLFLabel
            Left = 804
            Top = 94
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 3'
          end
          object LALFA_4: TLFLabel
            Left = 804
            Top = 116
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 4'
          end
          object LALFA_5: TLFLabel
            Left = 804
            Top = 138
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 5'
          end
          object LALFA_6: TLFLabel
            Left = 804
            Top = 160
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 6'
          end
          object LALFA_7: TLFLabel
            Left = 804
            Top = 182
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 7'
          end
          object LALFA_8: TLFLabel
            Left = 804
            Top = 204
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 8'
          end
          object LGenero: TLFLabel
            Left = 415
            Top = 28
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Genero'
          end
          object LTemporada: TLFLabel
            Left = 396
            Top = 50
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Temporada'
          end
          object LPMercado: TLFLabel
            Left = 163
            Top = 226
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Mercado'
          end
          object LPTarifa: TLFLabel
            Left = 286
            Top = 226
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Tarifa'
          end
          object LPack: TLFLabel
            Left = 821
            Top = 226
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pack'
          end
          object LCombinaciones: TLFLabel
            Left = 267
            Top = 6
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Combinaciones'
          end
          object LFamiliaTejido: TLFLabel
            Left = 397
            Top = 72
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fam. Tejido'
          end
          object LArticuloEstructura: TLFLabel
            Left = 397
            Top = 94
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Estruct.'
          end
          object LArticuloConfeccion: TLFLabel
            Left = 390
            Top = 116
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Confecc.'
          end
          object DBEFFamilia: TLFDBEditFind2000
            Left = 96
            Top = 68
            Width = 49
            Height = 21
            DataField = 'FAMILIA'
            DataSource = DSart_articulos_modelos
            TabOrder = 5
            OnChange = DBEFFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            CampoADevolver = 'FAMILIA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFFamiliaBusqueda
            OnExiste = DBEFFamiliaChange
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloFamilia: TLFEdit
            Left = 146
            Top = 68
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 52
          end
          object DBEProveedor: TLFDBEditFind2000
            Left = 96
            Top = 112
            Width = 49
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = DSart_articulos_modelos
            TabOrder = 7
            OnChange = DBEProveedorChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            CampoADevolver = 'PROVEEDOR'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = DBEProveedorChange
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDProveedor: TLFHYDBDescription
            Left = 146
            Top = 112
            Width = 240
            Height = 21
            Color = clInfoBk
            DataSource = DSart_articulos_modelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 53
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'PROVEEDOR')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'PROVEEDOR')
          end
          object DBESeccion: TLFDbedit
            Left = 184
            Top = 24
            Width = 43
            Height = 21
            DataField = 'SECCION'
            DataSource = DSart_articulos_modelos
            TabOrder = 3
          end
          object DBEPCompra: TLFDbedit
            Left = 96
            Top = 200
            Width = 57
            Height = 21
            DataField = 'P_COMPRA'
            DataSource = DSart_articulos_modelos
            TabOrder = 11
          end
          object DBETemporada: TLFDbedit
            Left = 140
            Top = 24
            Width = 43
            Height = 21
            DataField = 'TEMPORADA'
            DataSource = DSart_articulos_modelos
            TabOrder = 2
          end
          object DBETipo_iva: TLFDBEditFind2000
            Left = 96
            Top = 178
            Width = 49
            Height = 21
            DataField = 'TIPO_IVA'
            DataSource = DSart_articulos_modelos
            TabOrder = 10
            OnChange = DBETipo_ivaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_IVA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = DBETipo_ivaChange
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDTipoIVA: TLFHYDBDescription
            Left = 146
            Top = 178
            Width = 240
            Height = 21
            Color = clInfoBk
            DataSource = DSart_articulos_modelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 55
            Tabla_a_buscar = 'SYS_TIPO_IVA'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_IVA')
            CamposWhereTabla.Strings = (
              'TIPO'
              'ACTIVO'
              'P_IVA'
              'P_RECARGO'
              'DEFECTO'
              'TITULO'
              'PAIS'
              'PAIS'
              'TIPO')
          end
          object DBCBControlStock: TLFDBCheckBox
            Left = 851
            Top = 241
            Width = 140
            Height = 17
            Caption = 'Control Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 45
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTROL_STOCK'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBIvaIncluido: TLFDBCheckBox
            Left = 851
            Top = 257
            Width = 140
            Height = 17
            Caption = 'Iva incluido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 47
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'IVA_INC'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETitulo: TLFDbedit
            Left = 96
            Top = 46
            Width = 290
            Height = 21
            DataField = 'TITULO'
            DataSource = DSart_articulos_modelos
            TabOrder = 4
            OnEnter = DBETituloEnter
          end
          object DBCBPvpTalla: TLFDBCheckBox
            Left = 851
            Top = 273
            Width = 140
            Height = 17
            Caption = 'PVP por talla'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 49
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBPvpTallaChange
            DataField = 'PVPORTALLA'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPVenta: TLFDbedit
            Left = 96
            Top = 222
            Width = 57
            Height = 21
            DataField = 'P_VENTA'
            DataSource = DSart_articulos_modelos
            TabOrder = 14
          end
          object DBERef_proveedor: TLFDbedit
            Left = 96
            Top = 2
            Width = 131
            Height = 21
            DataField = 'REF_PROVEEDOR'
            DataSource = DSart_articulos_modelos
            TabOrder = 0
            OnChange = DBEFTarifaDefectoChange
            OnExit = DBERef_proveedorExit
          end
          object DBEAgno: TLFDbedit
            Left = 96
            Top = 24
            Width = 43
            Height = 21
            DataField = 'AGNO'
            DataSource = DSart_articulos_modelos
            TabOrder = 1
          end
          object DBEFid_g_t: TLFDBEditFind2000
            Left = 96
            Top = 134
            Width = 49
            Height = 21
            DataField = 'ID_G_T'
            DataSource = DSart_articulos_modelos
            TabOrder = 8
            OnChange = DBEFid_g_tChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_GRUPOS_TALLAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'GRUPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'ID_G_T'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = DBEFid_g_tChange
            OrdenadoPor.Strings = (
              'GRUPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDGrupoTallas: TLFHYDBDescription
            Left = 189
            Top = 134
            Width = 197
            Height = 21
            Color = clInfoBk
            DataSource = DSart_articulos_modelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 54
            Tabla_a_buscar = 'ART_GRUPOS_TALLAS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'ID_G_T')
            CamposWhereTabla.Strings = (
              'ID_G_T')
          end
          object DBEFCod_estructura: TLFDBEditFind2000
            Left = 96
            Top = 244
            Width = 131
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COD_ESTRUCTURA'
            DataSource = DSart_articulos_modelos
            TabOrder = 18
            OnChange = DBEFCod_estructuraChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_MOD_ESTRUCTURA_CAB'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'COD_MODELO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'COD_MODELO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDBTitulo_estructura: TLFHYDBDescription
            Left = 228
            Top = 244
            Width = 158
            Height = 21
            Color = clInfoBk
            DataSource = DSart_articulos_modelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 56
            Tabla_a_buscar = 'ART_MOD_ESTRUCTURA_CAB'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COD_ESTRUCTURA'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'COD_MODELO'
              'EMPRESA')
          end
          object DBEBase: TLFDbedit
            Left = 96
            Top = 266
            Width = 131
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BASE_CREACION'
            DataSource = DSart_articulos_modelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object DBCBBorraDinamic: TLFDBCheckBox
            Left = 991
            Top = 241
            Width = 180
            Height = 17
            Caption = 'Eliminar Art. Din'#225'micamente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 46
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'BORRAR'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMNotas: TLFDBMemo
            Left = 456
            Top = 200
            Width = 335
            Height = 87
            DataField = 'NOTAS'
            DataSource = DMMaestrosTallas.DSart_articulos_modelos
            TabOrder = 30
          end
          object ScrBImagen: TScrollBox
            Left = 1172
            Top = 2
            Width = 120
            Height = 284
            HorzScrollBar.Visible = False
            VertScrollBar.Visible = False
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoScroll = False
            BevelEdges = []
            BorderStyle = bsNone
            TabOrder = 57
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 120
              Height = 284
              Align = alClient
              AutoSize = True
              IncrementalDisplay = True
              Proportional = True
              Stretch = True
            end
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 851
            Top = 2
            Width = 55
            Height = 21
            DataField = 'IMAGEN'
            DataSource = DMMaestrosTallas.DSart_articulos_modelos
            TabOrder = 31
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
            Left = 907
            Top = 2
            Width = 263
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 58
          end
          object EGrupoTalla: TLFEdit
            Left = 146
            Top = 134
            Width = 42
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 59
          end
          object DBCBWeb: TLFDBCheckBox
            Left = 991
            Top = 257
            Width = 180
            Height = 17
            Caption = 'Web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 48
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 456
            Top = 178
            Width = 57
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DSart_articulos_modelos
            TabOrder = 29
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            CampoADevolver = 'CLIENTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECliente: TLFEdit
            Left = 514
            Top = 178
            Width = 277
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 60
          end
          object DBERefCliente: TLFDbedit
            Left = 456
            Top = 156
            Width = 146
            Height = 21
            CharCase = ecUpperCase
            DataField = 'REF_CLIENTE'
            DataSource = DSart_articulos_modelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
          end
          object DBEFTarifaDefecto: TLFDBEditFind2000
            Left = 96
            Top = 156
            Width = 49
            Height = 21
            DataField = 'TARIFA_DEFECTO'
            DataSource = DSart_articulos_modelos
            TabOrder = 9
            OnChange = DBEFTarifaDefectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CampoADevolver = 'TARIFA'
            CondicionBusqueda = 'ACTIVA=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETarifaDefecto: TLFEdit
            Left = 146
            Top = 156
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 61
          end
          object EMonedaTarifaDefecto: TLFEdit
            Left = 386
            Top = 222
            Width = 51
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 17
          end
          object PrecioTarifaDefecto: TLFEdit
            Left = 328
            Top = 222
            Width = 57
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 16
          end
          object DBEFMarca: TLFDBEditFind2000
            Left = 456
            Top = 2
            Width = 49
            Height = 21
            DataField = 'ID_MARCA'
            DataSource = DMMaestrosTallas.DSart_articulos_modelos
            TabOrder = 20
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_MARCAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_MARCA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFMarcaBusqueda
            OrdenadoPor.Strings = (
              'ID_MARCA')
            Filtros = []
          end
          object DBETituloMarca: TLFDbedit
            Left = 506
            Top = 2
            Width = 284
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMMaestrosTallas.DSxMarcas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 62
          end
          object BCargarImagen: TButton
            Left = 1122
            Top = 4
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 32
            Visible = False
            OnClick = BCargarImagenClick
          end
          object DBEFGaleria: TLFDBEditFind2000
            Left = 851
            Top = 24
            Width = 55
            Height = 21
            DataField = 'ID_GALERIA'
            DataSource = DMMaestrosTallas.DSart_articulos_modelos
            TabOrder = 34
            OnChange = DBEFGaleriaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_GALERIA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID')
            Filtros = []
          end
          object ETituloGaleria: TLFEdit
            Left = 907
            Top = 24
            Width = 263
            Height = 21
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 35
            OnDblClick = ETituloGaleriaDblClick
          end
          object DBEFSubfamilia: TLFDBEditFind2000
            Left = 96
            Top = 90
            Width = 49
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SUBFAMILIA'
            DataSource = DSart_articulos_modelos
            TabOrder = 6
            OnChange = DBEFSubfamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_SUBFAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SUBFAMILIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFSubfamiliaBusqueda
            OrdenadoPor.Strings = (
              'ORDEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitSubfamilia: TLFEdit
            Left = 146
            Top = 90
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 63
          end
          object DBEPCoste: TLFDbedit
            Left = 329
            Top = 200
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = DSart_articulos_modelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBEDtoCompra: TLFDbedit
            Left = 221
            Top = 200
            Width = 57
            Height = 21
            DataField = 'DESCUENTO_COMPRA'
            DataSource = DSart_articulos_modelos
            TabOrder = 12
          end
          object DBEALFA_1: TLFDbedit
            Left = 851
            Top = 46
            Width = 319
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALFA_1'
            DataSource = DSart_articulos_modelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 36
          end
          object DBEALFA_2: TLFDbedit
            Left = 851
            Top = 68
            Width = 319
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALFA_2'
            DataSource = DSart_articulos_modelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 37
          end
          object DBEALFA_3: TLFDbedit
            Left = 851
            Top = 90
            Width = 319
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALFA_3'
            DataSource = DSart_articulos_modelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 38
          end
          object DBEALFA_4: TLFDbedit
            Left = 851
            Top = 112
            Width = 319
            Height = 21
            DataField = 'ALFA_4'
            DataSource = DSart_articulos_modelos
            TabOrder = 39
          end
          object DBEALFA_5: TLFDbedit
            Left = 851
            Top = 134
            Width = 319
            Height = 21
            DataField = 'ALFA_5'
            DataSource = DSart_articulos_modelos
            TabOrder = 40
          end
          object DBEALFA_6: TLFDbedit
            Left = 851
            Top = 156
            Width = 319
            Height = 21
            DataField = 'ALFA_6'
            DataSource = DSart_articulos_modelos
            TabOrder = 41
          end
          object DBEALFA_7: TLFDbedit
            Left = 851
            Top = 178
            Width = 319
            Height = 21
            DataField = 'ALFA_7'
            DataSource = DSart_articulos_modelos
            TabOrder = 42
          end
          object DBEALFA_8: TLFDbedit
            Left = 851
            Top = 200
            Width = 319
            Height = 21
            DataField = 'ALFA_8'
            DataSource = DSart_articulos_modelos
            TabOrder = 43
          end
          object DBCHKBaja: TLFDBCheckBox
            Left = 991
            Top = 272
            Width = 82
            Height = 17
            Caption = 'Baja'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 50
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKBajaChange
            DataField = 'BAJA'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 1083
            Top = 268
            Width = 87
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = DSart_articulos_modelos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 51
          end
          object BClipboard: TButton
            Left = 1145
            Top = 4
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 33
            Visible = False
            OnClick = BClipboardClick
          end
          object DBEFGenero: TLFDBEditFind2000
            Left = 456
            Top = 24
            Width = 49
            Height = 21
            DataField = 'CODIGO_GENERO'
            DataSource = DMMaestrosTallas.DSart_articulos_modelos
            TabOrder = 21
            OnChange = DBEFGeneroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_GENERO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            CampoADevolver = 'CODIGO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBEFTemporada: TLFDBEditFind2000
            Left = 456
            Top = 46
            Width = 49
            Height = 21
            DataField = 'CODIGO_TEMPORADA'
            DataSource = DMMaestrosTallas.DSart_articulos_modelos
            TabOrder = 22
            OnChange = DBEFTemporadaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_TEMPORADA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            CampoADevolver = 'CODIGO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloGenero: TLFEdit
            Left = 506
            Top = 24
            Width = 284
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 64
            Text = 'ETituloGenero'
          end
          object ETituloTemporada: TLFEdit
            Left = 506
            Top = 46
            Width = 284
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 65
            Text = 'ETituloTemporada'
          end
          object DBEPMercado: TLFDbedit
            Left = 221
            Top = 222
            Width = 57
            Height = 21
            DataField = 'P_MERCADO'
            DataSource = DSart_articulos_modelos
            TabOrder = 15
          end
          object DBEPack: TLFDbedit
            Left = 851
            Top = 222
            Width = 319
            Height = 21
            Hint = 'Pack de tallas a crear.'#13#10'Deben ser tallas separadas por coma.'
            DataField = 'PACK'
            DataSource = DSart_articulos_modelos
            ParentShowHint = False
            ShowHint = True
            TabOrder = 44
          end
          object DBENumeroCombinaciones: TLFDbedit
            Left = 343
            Top = 2
            Width = 43
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CANTIDAD_COMBINACIONES'
            DataSource = DSart_articulos_modelos
            ReadOnly = True
            TabOrder = 66
            OnDblClick = DBENumeroCombinacionesDblClick
          end
          object DBEFFamiliaTejido: TLFDBEditFind2000
            Left = 456
            Top = 68
            Width = 49
            Height = 21
            DataField = 'FAMILIA_TEJIDO'
            DataSource = DSart_articulos_modelos
            TabOrder = 23
            OnChange = DBEFFamiliaTejidoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            CampoADevolver = 'FAMILIA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFFamiliaBusqueda
            OnExiste = DBEFFamiliaTejidoExiste
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFamiliaTejido: TLFEdit
            Left = 506
            Top = 68
            Width = 284
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 67
          end
          object EArticuloEstructura: TLFEdit
            Left = 547
            Top = 90
            Width = 243
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 68
          end
          object DBEFArticuloEstructura: TLFDBEditFind2000
            Left = 456
            Top = 90
            Width = 90
            Height = 21
            DataField = 'ARTICULO_ESTRUCTURA'
            DataSource = DSart_articulos_modelos
            TabOrder = 24
            OnChange = DBEFArticuloEstructuraChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            BuscarChar = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CampoADevolver = 'ARTICULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFArticuloEstructuraBusqueda
            OnExiste = DBEFArticuloEstructuraExiste
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFArticuloConfeccion: TLFDBEditFind2000
            Left = 456
            Top = 112
            Width = 90
            Height = 21
            DataField = 'ARTICULO_CONFECCION'
            DataSource = DSart_articulos_modelos
            TabOrder = 25
            OnChange = DBEFArticuloConfeccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            BuscarChar = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CampoADevolver = 'ARTICULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFArticuloConfeccionBusqueda
            OnExiste = DBEFArticuloConfeccionExiste
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EArticuloConfeccion: TLFEdit
            Left = 547
            Top = 112
            Width = 243
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 69
          end
          object DBCBCreaFaldon: TLFDBCheckBox
            Left = 456
            Top = 135
            Width = 161
            Height = 17
            Caption = 'Crea Faldon'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 26
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CREA_FALDON'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCreaConfeccion: TLFDBCheckBox
            Left = 628
            Top = 135
            Width = 161
            Height = 17
            Caption = 'Crea Confeccion'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 27
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CREA_CONFECCION'
            DataSource = DSart_articulos_modelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSPrecios: TTabSheet [1]
        Caption = '&Precios'
        ImageIndex = 2
        OnExit = TSPreciosExit
        object DBGFPrecios: TDBGridFind2000
          Left = 0
          Top = 23
          Width = 1294
          Height = 266
          Align = alClient
          DataSource = DSQMxver_precio_am
          PopupMenu = CEPreciosPMEdit
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
          BuscarNums = False
          Campos.Strings = (
            'N_COLOR')
          CamposAMostrar.Strings = (
            'N_COLOR'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            'COD_COLOR')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          Numericos.Strings = (
            'COD_COLOR')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_COLORES')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_COLOR'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P01'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P02'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P03'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P04'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P05'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P06'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P07'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P08'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P09'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P10'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P11'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P12'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P13'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P14'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P15'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P16'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P17'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P18'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P19'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P20'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P21'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P22'
              Width = 40
              Visible = True
            end>
        end
        object PNLCabPrecios: TLFPanel
          Left = 0
          Top = 0
          Width = 1294
          Height = 23
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object LTarifa: TLFLabel
            Left = 141
            Top = 3
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifas'
          end
          object SBCamiarPrecio: TSpeedButton
            Left = 568
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Modificar precio para todos los articulos de la tarifa'
            ParentShowHint = False
            ShowHint = True
            OnClick = SBCamiarPrecioClick
          end
          object TCTipoPrecios: TTabControl
            Left = 399
            Top = 0
            Width = 170
            Height = 23
            Style = tsFlatButtons
            TabOrder = 0
            Tabs.Strings = (
              'Coste'
              'Venta'
              'Mercado')
            TabIndex = 0
            OnChange = TCTipoPreciosChange
          end
          object NavPrecios: THYMNavigator
            Left = 4
            Top = 0
            Width = 126
            Height = 22
            DataSource = DSQMxver_precio_am
            VisibleButtons = [nbPrior, nbNext, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPreciosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFPrecios
            InsertaControl = DBGFPrecios
            Exclusivo = True
            ControlEdit = CEPrecios
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object EFTarifas: TLFEditFind2000
            Left = 177
            Top = 0
            Width = 49
            Height = 21
            TabOrder = 2
            OnChange = EFTarifasExiste
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            OnExiste = EFTarifasExiste
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloTarifa: TLFEdit
            Left = 227
            Top = 0
            Width = 171
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1294
          Height = 289
          DataSource = DSart_articulos_modelos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'BAJA'
            'BORRAR'
            'CONTROL_STOCK'
            'IVA_INC'
            'PVPORTALLA'
            'WEB')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'AGNO'
            'ALFA_1'
            'ALFA_2'
            'ALFA_3'
            'ALFA_4'
            'ALFA_5'
            'ALFA_6'
            'ALFA_7'
            'ALFA_8'
            'BASE_CREACION'
            'BORRAR'
            'CLIENTE'
            'COD_ESTRUCTURA'
            'COD_MOD'
            'CODIGO_GENERO'
            'CODIGO_TEMPORADA'
            'CONTROL_STOCK'
            'DBLNULO'
            'EMPRESA'
            'FAMILIA'
            'IVA_INC'
            'MAXIMO_DES'
            'P_COMPRA'
            'P_VENTA'
            'PACK'
            'PROVEEDOR'
            'PVPORTALLA'
            'REF_CLIENTE'
            'REF_PROVEEDOR'
            'SECCION'
            'SUBFAMILIA'
            'TEMPORADA'
            'TIPO_IVA'
            'TITULO'
            'WEB')
          Columns = <
            item
              Expanded = False
              FieldName = 'REF_PROVEEDOR'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGNO'
              Width = 27
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEMPORADA'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECCION'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COMPRA'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IVA'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_ESTRUCTURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE_CREACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_GENERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_TEMPORADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBFAMILIA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 347
    Width = 1306
    Height = 196
    inherited TBDetalle: TLFToolBar
      Width = 1306
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 200
        DataSource = DSart_articulos_mod_color
        Hints.Strings = ()
        Exclusivo = True
      end
      object ToolButton2: TToolButton
        Left = 200
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtStockModeloColorTallas: TToolButton
        Left = 208
        Top = 0
        Action = AStockModelosColoresTallas
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1306
      Height = 174
      DataSource = DSart_articulos_mod_color
      PopupMenu = nil
      IniStorage = FSMain
      Campos.Strings = (
        'N_COLOR'
        'IMAGEN')
      CamposAMostrar.Strings = (
        'N_COLOR'
        '0'
        'IMAGEN'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        'COD_COLOR'
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      Numericos.Strings = (
        'COD_COLOR'
        'CODIGO')
      Tablas.Strings = (
        'ART_COLORES'
        'SYS_IMAGENES')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'NOMBRE')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenadosPor.Strings = (
        'COD_COLOR'
        'CODIGO')
      Columns = <
        item
          Expanded = False
          FieldName = 'N_COLOR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_COLOR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORMA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 286
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COD_COLOR'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_PROVEEDOR'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMAGEN'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_4'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_5'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_6'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_7'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_8'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 543
    Width = 1306
  end
  inherited CEMain: TControlEdit
    DataSource = DSart_articulos_modelos
    Complementario = PDetalle
    Left = 936
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 972
    Top = 20
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
  end
  inherited ALMain: TLFActionList
    Left = 900
    Top = 20
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AStockModelosTallas: TAction
      Category = 'Procesos'
      Caption = 'Stock de Modelos por Talla'
      Hint = 'Stock de Modelos por Talla'
      ImageIndex = 128
      OnExecute = AStockModelosTallasExecute
    end
    object AStockModelosColoresTallas: TAction
      Category = 'Procesos'
      Caption = 'Stock de Modelos/Color por Talla'
      Hint = 'Stock de Modelos/Color por Talla'
      ImageIndex = 128
      OnExecute = AStockModelosColoresTallasExecute
    end
    object AFiltraArticulos: TAction
      Category = 'Procesos'
      Caption = 'Filtra Articulos'
      Hint = 'Muestra las fichas de los art'#237'culos pertenecientes a este modelo'
      ImageIndex = 109
      OnExecute = AFiltraArticulosExecute
    end
    object AFiltraEscandallosProd: TAction
      Category = 'Procesos'
      Caption = 'Filtra Escandallos de Produccion'
      Hint = 
        'Muestra las fichas de los escandallos  de produccion pertenecien' +
        'tes a este modelo'
      ImageIndex = 10
      OnExecute = AFiltraEscandallosProdExecute
    end
    object AActuColores: TAction
      Category = 'Procesos'
      Caption = 'Actualizar Campos ALFA de los colores a partir del Modelo'
      Hint = 
        'Actualiza los campos alfa del color a partir de los campos alfa ' +
        'del modelo.'#13#10'No tiene en cuenta los campos vacios.'
      ImageIndex = 132
      OnExecute = AActuColoresExecute
    end
    object ACreaArticulos: TAction
      Category = 'Procesos'
      Caption = 'Crea los Articulos del modelo'
      Hint = 'Crea Todos los Articulos del modelo'
      ImageIndex = 94
      OnExecute = ACreaArticulosExecute
    end
    object ACreaArticulosTodos: TAction
      Category = 'Procesos'
      Caption = 'Crea los Articulos de TODOS los modelos filtrados'
      Hint = 'Crea los Articulos de TODOS los modelos filtrados'
      ImageIndex = 94
      OnExecute = ACreaArticulosTodosExecute
    end
    object AActuArticulos: TAction
      Category = 'Procesos'
      Caption = 'Actualizar Campos ALFA del Art'#237'culo a partir del Color'
      Hint = 'Actualiza los campos ALFA del art'#237'culo.'
      ImageIndex = 26
      OnExecute = AActuArticulosExecute
    end
    object ABorraArticulos: TAction
      Category = 'Procesos'
      Caption = 'Borrar art'#237'culos del modelo'
      Hint = 'Borra todos los art'#237'culos de este modelo'
      ImageIndex = 39
      OnExecute = ABorraArticulosExecute
    end
    object AParametriza: TAction
      Category = 'Procesos'
      Caption = 'Parametrizar los c'#243'digos de Art'#237'culo'
      Hint = 'Parametrizar los c'#243'digos de Art'#237'culo'
      ImageIndex = 118
      OnExecute = AParametrizaExecute
    end
    object AGaleria: TAction
      Category = 'Procesos'
      Caption = 'Galeria de Imagenes'
      Hint = 'Muestra la galeria de imagenes de este modelo'
      ImageIndex = 28
      OnExecute = AGaleriaExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosModelos: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Modelo'
      ImageIndex = 59
      OnExecute = AAdjuntosModelosExecute
    end
    object ADuplicaModelo: TAction
      Category = 'Procesos'
      Caption = 'Duplica modelo'
      Hint = 'Duplica modelo'
      ImageIndex = 37
      OnExecute = ADuplicaModeloExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 898
    Top = 54
  end
  inherited CEDetalle: TControlEdit
    DataSource = DSart_articulos_mod_color
    EnlazadoA = CEPrecios
    Left = 937
    Top = 51
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 972
    Top = 51
  end
  object DSart_articulos_modelos: TDataSource
    DataSet = DMMaestrosTallas.QMart_articulos_modelos
    Left = 860
    Top = 24
  end
  object DSart_articulos_mod_color: TDataSource
    DataSet = DMMaestrosTallas.QMver_art_mod_color_edit
    Left = 764
    Top = 16
  end
  object DSQMxver_precio_am: TDataSource
    DataSet = DMMaestrosTallas.QMxver_precio_am
    Left = 828
    Top = 24
  end
  object CEPrecios: TControlEdit
    DataSource = DSQMxver_precio_am
    EnlazadoA = CEMain
    FichaEdicion = TSPrecios
    FichaExclusiva = TSPrecios
    Complementario = TBMain
    PopUpMenu = CEPreciosPMEdit
    Teclas = DMMain.Teclas
    Left = 936
    Top = 86
  end
  object CEPreciosPMEdit: TPopUpTeclas
    Left = 973
    Top = 86
    object CEPreciosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEPreciosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPreciosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPreciosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEPreciosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEPreciosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEPreciosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPreciosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPreciosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPreciosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object DSModelo_estructura: TDataSource
    DataSet = DMMaestrosTallas.QMArt_mod_estructura
    Left = 864
    Top = 56
  end
end
