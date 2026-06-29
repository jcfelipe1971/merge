inherited FMDespiece: TFMDespiece
  Left = 145
  Top = 135
  Width = 1630
  Height = 688
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Despiece'
  FormStyle = fsNormal
  PopupMenu = CEOtrosPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1620
    Height = 635
    inherited TBMain: TLFToolBar
      Width = 1616
      inherited NavMain: THYMNavigator
        Width = 240
        DataSource = DMDespiece.DSDespieceCab
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        OnClick = NavMainClick
        EditaControl = DBEFArticulo
        InsertaControl = DBEFArticulo
        InsertaUltimo = True
      end
      inherited TSepNav: TToolButton
        Left = 240
      end
      inherited EPMain: THYMEditPanel
        Left = 248
        Width = 78
        VisibleButtons = [neRango, neReport, neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Informe Despiece'
          'Filtra rango'
          'Informe Despiece'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 326
      end
      inherited TbuttComp: TToolButton
        Left = 334
      end
      object TSep1: TToolButton
        Left = 357
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBCrear: TToolButton
        Left = 365
        Top = 0
        Action = ACrearDespiece
      end
      object TBCalc: TToolButton
        Left = 388
        Top = 0
        Action = ACalcFormula
      end
      object TBCrearOP: TToolButton
        Left = 411
        Top = 0
        Action = ACrearOP
      end
      object ToolButton2: TToolButton
        Left = 434
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBEstado: TToolButton
        Left = 442
        Top = 0
        Action = AAbrirCerrar
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1616
      Height = 605
      inherited TSFicha: TTabSheet
        object SBAEscandallo: TSpeedButton [0]
          Left = 576
          Top = 100
          Width = 214
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAEscandalloDblClick
        end
        object SBArticulo: TSpeedButton [1]
          Left = 189
          Top = 98
          Width = 248
          Height = 22
          GroupIndex = -1
          OnDblClick = SBArticuloDblClick
        end
        object SBAOrigen: TSpeedButton [2]
          Left = 848
          Top = 101
          Width = 172
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAOrigenDblClick
        end
        object SBAModelo: TSpeedButton [3]
          Left = 144
          Top = 4
          Width = 219
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAModeloDblClick
        end
        object SBAID_Orden: TSpeedButton [4]
          Left = 952
          Top = 47
          Width = 66
          Height = 18
          GroupIndex = -1
          OnDblClick = SBAID_OrdenDblClick
        end
        object SBAImagen: TSpeedButton [5]
          Left = -129
          Top = 45
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBAImagenDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1608
          Height = 153
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 380
            Top = 61
          end
          object PNLEdit: TLFPanel
            Left = 0
            Top = 0
            Width = 729
            Height = 153
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object PNLEditDespiece: TLFPanel
              Left = 0
              Top = 0
              Width = 729
              Height = 88
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LSalida: TLFLabel
                Left = 261
                Top = 48
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Med. 2'
              end
              object LLinea: TLFLabel
                Left = 143
                Top = 48
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Med. 1'
              end
              object LFCantidad: TLFLabel
                Left = 7
                Top = 47
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cant. Doc.'
              end
              object LArticulo: TLFLabel
                Left = 23
                Top = 25
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Articulo'
              end
              object LDespiece: TLFLabel
                Left = 13
                Top = 3
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Despiece'
              end
              object LEstado: TLFLabel
                Left = 155
                Top = 3
                Width = 33
                Height = 13
                Caption = 'Estado'
              end
              object Lmedida3: TLFLabel
                Left = 143
                Top = 70
                Width = 33
                Height = 13
                Caption = 'Med. 3'
              end
              object Lmedida4: TLFLabel
                Left = 261
                Top = 70
                Width = 33
                Height = 13
                Caption = 'Med. 4'
              end
              object LOP: TLFLabel
                Left = 603
                Top = 3
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ord. Prod.'
              end
              object LMargenTareas: TLFLabel
                Left = 517
                Top = 69
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'Marg. Tar.'
              end
              object LFecha: TLFLabel
                Left = 434
                Top = 3
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object LEscandallo: TLFLabel
                Left = 410
                Top = 26
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Escandallo'
              end
              object LMargenMateriales: TLFLabel
                Left = 415
                Top = 69
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Marg. Mat'
              end
              object LMargenSobreTotal: TLFLabel
                Left = 621
                Top = 69
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Marg. Coste'
              end
              object LSuReferencia: TLFLabel
                Left = 410
                Top = 48
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Referencia'
              end
              object DBELinea: TLFDbedit
                Left = 180
                Top = 44
                Width = 74
                Height = 21
                DataField = 'MEDIDA_1'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 5
              end
              object DBESalida: TLFDbedit
                Left = 298
                Top = 44
                Width = 74
                Height = 21
                DataField = 'MEDIDA_2'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 6
              end
              object DBETituloEstado: TLFDbedit
                Left = 193
                Top = 0
                Width = 180
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO_ESTADO'
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = DBETituloEstadoChange
              end
              object DBECantidad: TLFDbedit
                Left = 62
                Top = 44
                Width = 74
                Height = 21
                DataField = 'CANTIDAD'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 4
              end
              object DBEFArticulo: TLFDBEditFind2000
                Left = 62
                Top = 22
                Width = 74
                Height = 21
                DataField = 'ARTICULO'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 2
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_EF'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = DBEFArticuloBusqueda
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETituloArticulo: TLFDbedit
                Left = 137
                Top = 22
                Width = 235
                Height = 21
                Color = clAqua
                DataField = 'TITULO'
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                TabOrder = 3
              end
              object DBEId: TLFDbedit
                Left = 62
                Top = 0
                Width = 74
                Height = 21
                Color = clInfoBk
                DataField = 'ID_DESPIECE_CAB'
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                TabOrder = 0
              end
              object DBEMedida3: TLFDbedit
                Left = 180
                Top = 66
                Width = 74
                Height = 21
                DataField = 'MEDIDA_3'
                DataSource = DMDespiece.DSDespieceCab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEMedida4: TLFDbedit
                Left = 298
                Top = 66
                Width = 74
                Height = 21
                DataField = 'MEDIDA_4'
                DataSource = DMDespiece.DSDespieceCab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBEFEscandallo: TLFDBEditFind2000
                Left = 467
                Top = 22
                Width = 61
                Height = 21
                DataField = 'ESCANDALLO'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 11
                OnChange = DBEFEscandalloChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
                Tabla_asociada.DesplegarBusqueda = False
                Campos_Desplegar.Strings = (
                  'COMPUESTO')
                CampoNum = 'ESCANDALLO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = DBEFEscandalloBusqueda
                OrdenadoPor.Strings = (
                  'ESCANDALLO')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBID_Orden: TLFDbedit
                Left = 651
                Top = 0
                Width = 74
                Height = 21
                Color = clAqua
                DataField = 'ID_ORDEN'
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                ReadOnly = True
                TabOrder = 10
                OnDblClick = SBAID_OrdenDblClick
              end
              object EDescEscandallo: TLFEdit
                Left = 529
                Top = 22
                Width = 196
                Height = 21
                Color = clAqua
                Enabled = False
                TabOrder = 12
                OnDblClick = SBAEscandalloDblClick
              end
              object DBEMargenTarea: TLFDbedit
                Left = 568
                Top = 66
                Width = 48
                Height = 21
                DataField = 'P_MARGEN_TAR'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 15
              end
              object DBDEFecha: TLFDBDateEdit
                Left = 467
                Top = 0
                Width = 90
                Height = 21
                DataField = 'FECHA'
                DataSource = DMDespiece.DSDespieceCab
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 9
              end
              object DBESuReferencia: TLFDbedit
                Left = 467
                Top = 44
                Width = 258
                Height = 21
                DataField = 'SU_REFERENCIA'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 13
              end
              object DBEMargenMaterial: TLFDbedit
                Left = 467
                Top = 66
                Width = 48
                Height = 21
                DataField = 'P_MARGEN_MAT'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 14
              end
              object DBEMargenCosteTotal: TLFDbedit
                Left = 677
                Top = 66
                Width = 48
                Height = 21
                DataField = 'P_MARGEN_P_COSTE'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 16
              end
            end
            object PNLToldos: TPanel
              Left = 0
              Top = 88
              Width = 729
              Height = 65
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              Visible = False
              object LModelo: TLFLabel
                Left = 23
                Top = 3
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Modelo'
              end
              object LColor: TLFLabel
                Left = 34
                Top = 25
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Color'
              end
              object LLonaLama: TLFLabel
                Left = 396
                Top = 25
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Lona'
              end
              object LTipoLona: TLFLabel
                Left = 375
                Top = 3
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Lona'
              end
              object LPrecioVenta: TLFLabel
                Left = 379
                Top = 47
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Precio V.'
              end
              object DescLonaLama: TLFHYDBDescription
                Left = 490
                Top = 22
                Width = 235
                Height = 21
                Color = clInfoBk
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Campo_Descripcion = 'TITULO'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'LONA_LAMA')
                CamposWhereTabla.Strings = (
                  'ARTICULO')
              end
              object DBEFLonaLama: TLFDBEditFind2000
                Left = 428
                Top = 22
                Width = 61
                Height = 21
                DataField = 'LONA_LAMA'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 9
                OnChange = DBEFLonaLamaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_EF'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = DBEFLonaLamaBusqueda
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBCBMotor: TLFDBCheckBox
                Left = 4
                Top = 47
                Width = 53
                Height = 17
                Caption = 'Motor'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 4
                TabStop = True
                Alignment = taLeftJustify
                OnChange = DBCBMotorChange
                DataField = 'MOTOR'
                DataSource = DMDespiece.DSDespieceCab
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEFModelo: TLFDBEditFind2000
                Left = 62
                Top = 0
                Width = 74
                Height = 21
                DataField = 'MODELO'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 0
                OnChange = DBEFModeloChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_MODELOS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFColor: TLFDBEditFind2000
                Left = 62
                Top = 22
                Width = 74
                Height = 21
                DataField = 'COLOR'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 2
                OnChange = DBEFColorChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_COLORES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                CondicionBusqueda = 'ACTIVO=1'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
              object DescModelos: TLFHYDBDescription
                Left = 137
                Top = 0
                Width = 235
                Height = 21
                Color = clAqua
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnDblClick = SBAModeloDblClick
                Tabla_a_buscar = 'Z_SYS_MODELOS'
                Campo_Descripcion = 'DESCRIPCION'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'MODELO')
                CamposWhereTabla.Strings = (
                  'CODIGO')
              end
              object DescColor: TLFHYDBDescription
                Left = 137
                Top = 22
                Width = 235
                Height = 21
                Color = clInfoBk
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                Tabla_a_buscar = 'Z_SYS_COLORES'
                Campo_Descripcion = 'DESCRIPCION'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'COLOR')
                CamposWhereTabla.Strings = (
                  'CODIGO')
              end
              object DBEFMotor: TLFDBEditFind2000
                Left = 62
                Top = 44
                Width = 74
                Height = 21
                DataField = 'TIPO_MOTOR'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 5
                OnChange = DBEFMotorChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_MODELOS_DET_MOTOR'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'MOTOR'
                CampoStr = 'UNIDADES'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = DBEFMotorBusqueda
                OrdenadoPor.Strings = (
                  'MOTOR')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DescMotor: TLFHYDBDescription
                Left = 137
                Top = 44
                Width = 235
                Height = 21
                Color = clInfoBk
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Campo_Descripcion = 'TITULO'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'TIPO_MOTOR')
                CamposWhereTabla.Strings = (
                  'ARTICULO')
              end
              object ETipoLona: TLFEdit
                Left = 490
                Top = 0
                Width = 235
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBEFTipoLona: TLFDBEditFind2000
                Left = 428
                Top = 0
                Width = 61
                Height = 21
                DataField = 'TIPO_LONA'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 7
                OnChange = DBEFTipoLonaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_LONAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEPrecioVenta: TLFDbedit
                Left = 428
                Top = 44
                Width = 85
                Height = 21
                AutoSize = False
                Color = clInfoBk
                DataField = 'PRECIO_VENTA'
                DataSource = DMDespiece.DSDespieceCab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
            end
          end
          object PNLEditOtros: TLFPanel
            Left = 729
            Top = 0
            Width = 879
            Height = 153
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            OnResize = PNLEditOtrosResize
            object PNLImagen: TLFPanel
              Left = 281
              Top = 0
              Width = 277
              Height = 153
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Imagen: TImage
                Left = 0
                Top = 23
                Width = 277
                Height = 130
                Align = alClient
                AutoSize = True
                Center = True
                IncrementalDisplay = True
                Proportional = True
                Stretch = True
              end
              object PNLImagenTop: TLFPanel
                Left = 0
                Top = 0
                Width = 277
                Height = 23
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  277
                  23)
                object ETituloImagen: TLFEdit
                  Left = 42
                  Top = 0
                  Width = 232
                  Height = 21
                  TabStop = False
                  Anchors = [akLeft, akTop, akRight]
                  Color = clAqua
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clInfoBk
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object DBEFImagen: TLFDBEditFind2000
                  Left = 0
                  Top = 0
                  Width = 41
                  Height = 21
                  DataField = 'ID_IMAGEN'
                  DataSource = DMDespiece.DSDespieceCab
                  TabOrder = 0
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
                  Filtros = []
                end
                object BClipboard: TButton
                  Left = 249
                  Top = 2
                  Width = 23
                  Height = 18
                  Hint = 'Cargar imagen desde porta papeles'
                  Anchors = [akTop, akRight]
                  Caption = 'P'
                  TabOrder = 3
                  Visible = False
                  OnClick = BClipboardClick
                end
                object BCargarImagen: TButton
                  Left = 226
                  Top = 2
                  Width = 23
                  Height = 18
                  Hint = 'Cargar imagen desde archivo'
                  Anchors = [akTop, akRight]
                  Caption = '...'
                  TabOrder = 2
                  Visible = False
                  OnClick = BCargarImagenClick
                end
              end
            end
            object PNLMedidas: TLFPanel
              Left = 558
              Top = 0
              Width = 321
              Height = 153
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
              object LPVP: TLFLabel
                Left = 229
                Top = 77
                Width = 21
                Height = 13
                Alignment = taRightJustify
                Caption = 'PVP'
                Visible = False
              end
              object LDescuento1: TLFLabel
                Left = 213
                Top = 11
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Desc. 1'
                Visible = False
              end
              object LDescuento2: TLFLabel
                Left = 213
                Top = 33
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Desc. 2'
                Visible = False
              end
              object LDescuento3: TLFLabel
                Left = 213
                Top = 55
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Desc. 3'
                Visible = False
              end
              object LGuia: TLFLabel
                Left = 12
                Top = 120
                Width = 22
                Height = 13
                Alignment = taRightJustify
                Caption = 'Guia'
                Visible = False
              end
              object LCajon: TLFLabel
                Left = 7
                Top = 99
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'Caj'#243'n'
                Visible = False
              end
              object DBRBTipoMedida: TDBRadioGroup
                Left = 0
                Top = 0
                Width = 206
                Height = 89
                Caption = 'Tipo Medida'
                DataField = 'TIPO_MEDIDA'
                DataSource = DMDespiece.DSDespieceCab
                Items.Strings = (
                  'Ancho total incluido guias'
                  'Ancho total inc. guias - menos caj'#243'n'
                  'Ancho ventana m'#225's guia')
                TabOrder = 0
                Values.Strings = (
                  '0'
                  '1'
                  '2')
                Visible = False
              end
              object DBEPrecio: TLFDbedit
                Left = 255
                Top = 73
                Width = 60
                Height = 21
                DataSource = DSDetalle
                TabOrder = 4
                Visible = False
              end
              object DBEDescuento1: TLFDbedit
                Left = 255
                Top = 7
                Width = 60
                Height = 21
                DataSource = DSDetalle
                TabOrder = 1
                Visible = False
              end
              object DBEDescuento2: TLFDbedit
                Left = 255
                Top = 29
                Width = 60
                Height = 21
                DataSource = DSDetalle
                TabOrder = 2
                Visible = False
              end
              object DBEDescuento3: TLFDbedit
                Left = 255
                Top = 51
                Width = 60
                Height = 21
                DataSource = DSDetalle
                TabOrder = 3
                Visible = False
              end
              object DBECajon: TLFDBEditFind2000
                Left = 39
                Top = 95
                Width = 74
                Height = 21
                DataField = 'CAJON'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 5
                Visible = False
                OnChange = DBECajonChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_EF'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEGuia: TLFDBEditFind2000
                Left = 39
                Top = 117
                Width = 74
                Height = 21
                DataField = 'GUIA'
                DataSource = DMDespiece.DSDespieceCab
                TabOrder = 7
                Visible = False
                OnChange = DBEGuiaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_EF'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DescCajon: TLFHYDBDescription
                Left = 115
                Top = 95
                Width = 200
                Height = 21
                Color = clInfoBk
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                Visible = False
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Campo_Descripcion = 'TITULO'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'CAJON')
                CamposWhereTabla.Strings = (
                  'ARTICULO')
              end
              object DescGuia: TLFHYDBDescription
                Left = 115
                Top = 117
                Width = 200
                Height = 21
                Color = clInfoBk
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
                Visible = False
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Campo_Descripcion = 'TITULO'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'GUIA')
                CamposWhereTabla.Strings = (
                  'ARTICULO')
              end
            end
            object GBDocumentoOrigen: TGroupBox
              Left = 0
              Top = 0
              Width = 281
              Height = 153
              Align = alLeft
              Caption = 'Doc. Origen'
              Constraints.MaxWidth = 500
              Constraints.MinWidth = 250
              TabOrder = 0
              DesignSize = (
                281
                153)
              object LOrigen: TLFLabel
                Left = 38
                Top = 40
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'Doc'
              end
              object LImporte: TLFLabel
                Left = 23
                Top = 84
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Importe'
              end
              object LIdOrigen: TLFLabel
                Left = 47
                Top = 18
                Width = 11
                Height = 13
                Alignment = taRightJustify
                Caption = 'ID'
              end
              object LReferencia: TLFLabel
                Left = 12
                Top = 63
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ref. Doc.'
              end
              object LCoste: TLabel
                Left = 31
                Top = 105
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste'
              end
              object LCliente: TLabel
                Left = 26
                Top = 127
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente'
              end
              object LDatoImporte: TLFDbedit
                Left = 63
                Top = 80
                Width = 74
                Height = 21
                AutoSize = False
                Color = clInfoBk
                Constraints.MinWidth = 74
                DataField = 'BRUTO'
                DataSource = DSDetalle
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBDocOrigen: TLFDbedit
                Left = 63
                Top = 36
                Width = 180
                Height = 21
                Hint = 'numero, ejercicio y tipo del documento'
                Color = clAqua
                Constraints.MaxWidth = 180
                Constraints.MinWidth = 74
                DataField = 'DOC_ORIGEN'
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                OnDblClick = SBAOrigenDblClick
              end
              object EReferencia: TLFEdit
                Left = 63
                Top = 58
                Width = 180
                Height = 21
                Hint = 'Referencia del documento origen'
                Color = clInfoBk
                Constraints.MaxWidth = 180
                Constraints.MinWidth = 74
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBEIdOrigen: TLFDbedit
                Left = 63
                Top = 14
                Width = 74
                Height = 21
                Hint = 'ID del documento origen (Ofert, pedido..)'
                Color = clInfoBk
                Constraints.MinWidth = 74
                DataField = 'ID_ORIGEN'
                DataSource = DMDespiece.DSDespieceCab
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = DBEIdOrigenChange
              end
              object ECoste: TLFEdit
                Left = 63
                Top = 102
                Width = 74
                Height = 21
                Color = clInfoBk
                Constraints.MinWidth = 74
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object ECliente: TLFEdit
                Left = 63
                Top = 124
                Width = 211
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Color = clInfoBk
                Constraints.MinWidth = 74
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
            end
          end
        end
        object PNLTotales: TLFPanel
          Left = 0
          Top = 551
          Width = 1608
          Height = 26
          Align = alBottom
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          DesignSize = (
            1608
            26)
          object LTotalCoste: TLFLabel
            Left = 837
            Top = 6
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Coste'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBeneficio: TLFLabel
            Left = 1206
            Top = 6
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Beneficio'
          end
          object LVenta: TLFLabel
            Left = 1481
            Top = 6
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Venta'
          end
          object LTotalMateriales: TLFLabel
            Left = 950
            Top = 6
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = '(Materiales'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTotalTareas: TLFLabel
            Left = 1080
            Top = 6
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Tareas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LCierreParentesis: TLFLabel
            Left = 1191
            Top = 7
            Width = 3
            Height = 13
            Anchors = [akTop, akRight]
            Caption = ')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTotalPeso: TLFLabel
            Left = 589
            Top = 6
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Total Peso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTotalHoras: TLFLabel
            Left = 708
            Top = 6
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Total Horas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LPrecioUnitario: TLFLabel
            Left = 1331
            Top = 6
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Prec. Unit'
          end
          object DBETotal: TLFDbedit
            Left = 869
            Top = 3
            Width = 70
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'TOTAL_COSTE'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 0
          end
          object DBEMargen: TLFDbedit
            Left = 1254
            Top = 3
            Width = 70
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'MARGEN'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 1
          end
          object DBEVenta: TLFDbedit
            Left = 1514
            Top = 3
            Width = 90
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'TOTAL_VENTA'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 2
          end
          object DBETotalComponentes: TLFDbedit
            Left = 1006
            Top = 3
            Width = 70
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'TOTAL_COMPONENTES'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 3
          end
          object DBETotalTareas: TLFDbedit
            Left = 1118
            Top = 3
            Width = 70
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'TOTAL_TAREAS'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 4
          end
          object DBETotalPeso: TLFDbedit
            Left = 645
            Top = 3
            Width = 60
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'TOTAL_PESO'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 5
          end
          object DBEHoras: TLFDbedit
            Left = 768
            Top = 3
            Width = 60
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'TOTAL_HORAS'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 6
          end
          object DBEPrecioUnitario: TLFDbedit
            Left = 1383
            Top = 3
            Width = 90
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clInfoBk
            DataField = 'PRECIO_UNITARIO'
            DataSource = DMDespiece.DSDespieceCab
            ReadOnly = True
            TabOrder = 7
          end
        end
        object PCDatos: TLFPageControl
          Left = 0
          Top = 153
          Width = 1608
          Height = 398
          ActivePage = TSEscandallo
          Align = alClient
          OwnerDraw = True
          TabIndex = 1
          TabOrder = 2
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSPropiedades: TTabSheet
            Caption = 'Propiedades'
            object PNLValores: TLFPanel
              Left = 0
              Top = 0
              Width = 1600
              Height = 370
              Align = alClient
              BevelOuter = bvNone
              Caption = 'PNLComponente'
              TabOrder = 0
              object DBGValores: TDBGridFind2000
                Left = 0
                Top = 24
                Width = 1600
                Height = 346
                Align = alClient
                DataSource = DMDespiece.DSQMDespieceSFGDatos
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGValoresDrawColumnCell
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
                  'TIPO_FASE'
                  'COMPONENTE'
                  'UNIDADES_ART'
                  'FORMULA')
                CamposAMostrar.Strings = (
                  'TIPO_FASE'
                  '0'
                  'COMPONENTE'
                  '0'
                  'UNIDADES_ART'
                  '0'
                  'FORMULA'
                  '0')
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
                ColumnasCheckBoxes.Strings = (
                  'CORTE')
                ColumnasChecked.Strings = (
                  '1')
                ColumnasNoChecked.Strings = (
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'FASE'
                  'ARTICULO'
                  'TIPO'
                  'ID_FORMULA')
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'PRO_SYS_FASES'
                  'VER_ARTICULOS_EF'
                  'SYS_UNIDADES_ARTICULOS'
                  'PRO_FORMULAS')
                Acciones.Strings = (
                  ''
                  ''
                  ''
                  '')
                Titulos.Strings = (
                  'TITULO'
                  'TITULO'
                  'TITULO'
                  'NOMBRE')
                Posicion = tpCentrado
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
                  '')
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CAMPO'
                    ReadOnly = True
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_STR'
                    Width = 650
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_FLOAT'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_INT'
                    Width = 74
                    Visible = True
                  end>
              end
              object TBValores: TLFToolBar
                Left = 0
                Top = 0
                Width = 1600
                Height = 24
                Caption = 'TBValores'
                EdgeBorders = []
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 1
                Separators = True
                object NavValores: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMDespiece.DSQMDespieceSFGDatos
                  Flat = True
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  Exclusivo = True
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
            end
          end
          object TSEscandallo: TTabSheet
            Caption = 'Escandallo'
            ImageIndex = 1
            object SPLEscandallo: TSplitter
              Left = 0
              Top = 168
              Width = 1600
              Height = 9
              Cursor = crVSplit
              Align = alTop
              Color = clMedGray
              ParentColor = False
            end
            object PCComponente: TLFPageControl
              Left = 0
              Top = 0
              Width = 1600
              Height = 168
              ActivePage = TSFichaComponentes
              Align = alTop
              OwnerDraw = True
              TabIndex = 0
              TabOrder = 0
              TabActiveColor = clWhite
              TabInactiveColor = 14936298
              object TSFichaComponentes: TTabSheet
                Caption = 'Ficha'
                object PNLComponente: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 1592
                  Height = 140
                  Align = alClient
                  BevelOuter = bvNone
                  Caption = 'PNLComponente'
                  TabOrder = 0
                  object DBFComponente: TDBGridFind2000
                    Left = 0
                    Top = 26
                    Width = 1592
                    Height = 114
                    Align = alClient
                    DataSource = DMDespiece.DSDespieceCom
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnCellClick = DBFComponenteCellClick
                    OnDrawColumnCell = DBFComponenteDrawColumnCell
                    OnDblClick = DBFComponenteDblClick
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
                      'TIPO_FASE'
                      'COMPONENTE'
                      'UNIDADES_ART'
                      'FORMULA')
                    CamposAMostrar.Strings = (
                      'TIPO_FASE'
                      '0'
                      'COMPONENTE'
                      '0'
                      'UNIDADES_ART'
                      '0'
                      'FORMULA'
                      '0')
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
                    ColumnasCheckBoxes.Strings = (
                      'CORTE'
                      'ASIGNAR_A_ORDEN'
                      'NO_MULTIPLICAR_CABECERA')
                    ColumnasChecked.Strings = (
                      '1'
                      '1'
                      '1')
                    ColumnasNoChecked.Strings = (
                      '0'
                      '0'
                      '0')
                    MensajeNoExiste = False
                    Numericos.Strings = (
                      'FASE'
                      'ARTICULO'
                      'TIPO'
                      'ID_FORMULA')
                    SalirSiVacio = True
                    SalirSiNoExiste = False
                    Tablas.Strings = (
                      'PRO_SYS_FASES'
                      'VER_ARTICULOS_EF'
                      'SYS_UNIDADES_ARTICULOS'
                      'PRO_FORMULAS')
                    Acciones.Strings = (
                      ''
                      ''
                      ''
                      '')
                    Titulos.Strings = (
                      'TITULO'
                      'TITULO'
                      'TITULO'
                      'NOMBRE')
                    Posicion = tpCentrado
                    OnBusqueda = DBFComponenteBusqueda
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
                      '')
                    Filtros = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'COMPONENTE'
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
                        FieldName = 'UNIDADES_ART'
                        Width = 45
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NO_MULTIPLICAR_CABECERA'
                        Width = 41
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CANTIDAD'
                        Width = 60
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'FACTOR'
                        Width = 60
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PRECIO'
                        Width = 60
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'TOTAL'
                        ReadOnly = True
                        Width = 60
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'TOTAL_FABRICACION'
                        ReadOnly = True
                        Width = 60
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'CANTIDAD_FABRICACION'
                        ReadOnly = True
                        Width = 60
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'FORMULA'
                        Width = 45
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'DescFormula'
                        ReadOnly = True
                        Width = 300
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CORTE'
                        Width = 65
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LACADO'
                        Width = 65
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CORTE_MEDIDA1'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CORTE_MEDIDA2'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CORTE_MEDIDA3'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CORTE_MEDIDA4'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_FASE'
                        Width = 50
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'FASE'
                        ReadOnly = True
                        Width = 150
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ASIGNAR_A_ORDEN'
                        Width = 69
                        Visible = True
                      end>
                  end
                  object TBComponente: TLFToolBar
                    Left = 0
                    Top = 0
                    Width = 1592
                    Height = 26
                    Caption = 'TBComponente'
                    DisabledImages = DMMain.ILMain_In
                    EdgeBorders = []
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    HotImages = DMMain.ILMain_Ac
                    Images = DMMain.ILMain_Ac
                    TabOrder = 1
                    Separators = True
                    DesignSize = (
                      1592
                      26)
                    object NavComponente: THYMNavigator
                      Left = 0
                      Top = 0
                      Width = 240
                      Height = 22
                      DataSource = DMDespiece.DSDespieceCom
                      Flat = True
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      ModoDeSeguridad = True
                      DelCaption = 'Informaci'#243'n'
                      DelMessage = ' '#191' Borra el registro ? '
                      Exclusivo = True
                      OrdenAscendente = True
                      InsertaUltimo = True
                    end
                    object TBSep1: TToolButton
                      Left = 240
                      Top = 0
                      Width = 8
                      Style = tbsSeparator
                    end
                    object LMateriales: TLFLabel
                      Left = 248
                      Top = 0
                      Width = 59
                      Height = 22
                      Alignment = taRightJustify
                      Anchors = [akTop, akRight]
                      Caption = 'Materiales'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                    end
                  end
                end
              end
              object TSNotasComponente: TTabSheet
                Caption = 'Notas'
                ImageIndex = 1
                object TBNotasComponente: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 984
                  Height = 24
                  Caption = 'TBComponente'
                  Flat = True
                  TabOrder = 0
                  Separators = True
                  object PNLComponenteNotas: TLFPanel
                    Left = 0
                    Top = 0
                    Width = 513
                    Height = 22
                    BevelOuter = bvNone
                    TabOrder = 1
                    object LComponenteNotas: TLFLabel
                      Left = 16
                      Top = 4
                      Width = 60
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Componente'
                    end
                    object DBEComponentesNotasComponete: TLFDbedit
                      Left = 80
                      Top = 1
                      Width = 121
                      Height = 21
                      Color = clInfoBk
                      DataField = 'COMPONENTE'
                      DataSource = DMDespiece.DSDespieceCom
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEComponentesNotasDescripcion: TLFDbedit
                      Left = 202
                      Top = 1
                      Width = 309
                      Height = 21
                      Color = clInfoBk
                      DataField = 'TITULO'
                      DataSource = DMDespiece.DSDespieceCom
                      Enabled = False
                      TabOrder = 1
                    end
                  end
                  object ToolButton3: TToolButton
                    Left = 513
                    Top = 0
                    Width = 8
                    Style = tbsSeparator
                  end
                  object NavNotasComponente: THYMNavigator
                    Left = 521
                    Top = 0
                    Width = 63
                    Height = 22
                    DataSource = DMDespiece.DSDespieceCom
                    VisibleButtons = [nbEdit, nbPost, nbCancel]
                    Flat = True
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ModoDeSeguridad = True
                    DelCaption = 'Informaci'#243'n'
                    DelMessage = ' '#191' Borra el registro ? '
                    Exclusivo = True
                    OrdenAscendente = True
                    InsertaUltimo = True
                  end
                end
                object DBMNotasComponente: TLFDBMemo
                  Left = 0
                  Top = 24
                  Width = 984
                  Height = 125
                  Align = alClient
                  DataField = 'NOTAS'
                  DataSource = DMDespiece.DSDespieceCom
                  TabOrder = 1
                end
              end
            end
            object PCTareas: TLFPageControl
              Left = 0
              Top = 177
              Width = 1600
              Height = 193
              ActivePage = TSFichaTareas
              Align = alClient
              OwnerDraw = True
              TabIndex = 0
              TabOrder = 1
              TabActiveColor = clWhite
              TabInactiveColor = 14936298
              object TSFichaTareas: TTabSheet
                Caption = 'Ficha'
                object PNLTareas: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 1592
                  Height = 165
                  Align = alClient
                  BevelOuter = bvNone
                  Caption = 'PNLTareas'
                  TabOrder = 0
                  object DBGTareas: TDBGridFind2000
                    Left = 0
                    Top = 26
                    Width = 1592
                    Height = 139
                    Align = alClient
                    DataSource = DMDespiece.DSDespieceTar
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnCellClick = DBGTareasCellClick
                    OnDrawColumnCell = DBGTareasDrawColumnCell
                    OnDblClick = DBGTareasDblClick
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
                      'TIPO_TAREA'
                      'RECURSO'
                      'FORMULA'
                      'TIPO_FASE'
                      'SECCION')
                    CamposAMostrar.Strings = (
                      'TIPO_TAREA'
                      '0'
                      'RECURSO'
                      '0'
                      'FORMULA'
                      '0'
                      'TIPO_FASE'
                      '0'
                      'SECCION'
                      '0')
                    CamposAMostrarAnchos.Strings = (
                      '0'
                      '0'
                      '0'
                      '0'
                      '0')
                    CamposADevolver.Strings = (
                      ''
                      ''
                      ''
                      ''
                      '')
                    CamposDesplegar.Strings = (
                      '1'
                      '1'
                      '1'
                      '1'
                      '1')
                    CampoAOrdenarColor = clInfoBk
                    MensajeNoExiste = False
                    Numericos.Strings = (
                      'TAREA'
                      'RECURSO'
                      'ID_FORMULA'
                      'FASE'
                      'SECCION')
                    SalirSiVacio = False
                    SalirSiNoExiste = True
                    Tablas.Strings = (
                      'PRO_SYS_TAREAS'
                      'PRO_RECURSOS'
                      'PRO_FORMULAS'
                      'PRO_SYS_FASES'
                      'OPE_SECCIONES')
                    Acciones.Strings = (
                      ''
                      ''
                      ''
                      ''
                      '')
                    Titulos.Strings = (
                      'TITULO'
                      'TITULO'
                      'NOMBRE'
                      'TITULO'
                      'DESCRIPCION')
                    Posicion = tpCentrado
                    OnBusqueda = DBGTareasBusqueda
                    Planes.Strings = (
                      ''
                      ''
                      ''
                      ''
                      '')
                    OrdenMultiple = True
                    OrdenadosPor.Strings = (
                      ''
                      ''
                      ''
                      ''
                      'SECCION')
                    Filtros = []
                    Entorno = DMMain.EntornoBusqueda
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'TIPO_TAREA'
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'DescTarea'
                        ReadOnly = True
                        Width = 150
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'RECURSO'
                        Width = 50
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'DescRecurso'
                        Width = 150
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIEMPO'
                        Width = 60
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PRECIO_RECURSO'
                        Width = 60
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'TOTAL'
                        ReadOnly = True
                        Width = 60
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'TOTAL_FABRICACION'
                        ReadOnly = True
                        Width = 60
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'TIEMPO_FABRICACION'
                        ReadOnly = True
                        Width = 65
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'FORMULA'
                        Width = 45
                        Visible = True
                      end
                      item
                        Color = clInfoBk
                        Expanded = False
                        FieldName = 'DescFormula'
                        Width = 200
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_FASE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'FASE'
                        Width = 200
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SECCION'
                        Visible = True
                      end>
                  end
                  object TBTarea: TLFToolBar
                    Left = 0
                    Top = 0
                    Width = 1592
                    Height = 26
                    DisabledImages = DMMain.ILMain_In
                    EdgeBorders = []
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    HotImages = DMMain.ILMain_Ac
                    Images = DMMain.ILMain_Ac
                    TabOrder = 1
                    Separators = True
                    DesignSize = (
                      1592
                      26)
                    object NavTarea: THYMNavigator
                      Left = 0
                      Top = 0
                      Width = 240
                      Height = 22
                      DataSource = DMDespiece.DSDespieceTar
                      Flat = True
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      ModoDeSeguridad = True
                      DelCaption = 'Informaci'#243'n'
                      DelMessage = ' '#191' Borra el registro ? '
                      Exclusivo = True
                      OrdenAscendente = True
                      InsertaUltimo = True
                    end
                    object TBSep2: TToolButton
                      Left = 240
                      Top = 0
                      Width = 8
                      Style = tbsSeparator
                    end
                    object LTareas: TLFLabel
                      Left = 248
                      Top = 0
                      Width = 40
                      Height = 22
                      Alignment = taRightJustify
                      Anchors = [akTop, akRight]
                      Caption = 'Tareas'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                    end
                  end
                end
              end
              object TSNotasTareas: TTabSheet
                Caption = 'Notas'
                ImageIndex = 1
                object TBNotasTarea: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 986
                  Height = 24
                  Caption = 'TBComponente'
                  Flat = True
                  TabOrder = 0
                  Separators = True
                  object PNLNotasTarea: TLFPanel
                    Left = 0
                    Top = 0
                    Width = 513
                    Height = 22
                    BevelOuter = bvNone
                    TabOrder = 1
                    object LTipoTarea: TLFLabel
                      Left = 24
                      Top = 4
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Tarea'
                    end
                    object DBENotasTarea: TLFDbedit
                      Left = 80
                      Top = 1
                      Width = 121
                      Height = 21
                      Color = clInfoBk
                      DataField = 'TIPO_TAREA'
                      DataSource = DMDespiece.DSDespieceTar
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBENotasTareaDescripcion: TLFDbedit
                      Left = 202
                      Top = 1
                      Width = 309
                      Height = 21
                      Color = clInfoBk
                      DataField = 'DescTarea'
                      DataSource = DMDespiece.DSDespieceTar
                      Enabled = False
                      TabOrder = 1
                    end
                  end
                  object ToolButton4: TToolButton
                    Left = 513
                    Top = 0
                    Width = 8
                    Style = tbsSeparator
                  end
                  object NavNotasTarea: THYMNavigator
                    Left = 521
                    Top = 0
                    Width = 63
                    Height = 22
                    DataSource = DMDespiece.DSDespieceTar
                    VisibleButtons = [nbEdit, nbPost, nbCancel]
                    Flat = True
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ModoDeSeguridad = True
                    DelCaption = 'Informaci'#243'n'
                    DelMessage = ' '#191' Borra el registro ? '
                    Exclusivo = True
                    OrdenAscendente = True
                    InsertaUltimo = True
                  end
                end
                object DBMNotasTarea: TLFDBMemo
                  Left = 0
                  Top = 24
                  Width = 986
                  Height = 141
                  Align = alClient
                  DataField = 'NOTAS'
                  DataSource = DMDespiece.DSDespieceTar
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 1
        object TBNotasModelo: TLFToolBar
          Left = 0
          Top = 0
          Width = 1608
          Height = 24
          Caption = 'TBComponente'
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLNotasModelo: TLFPanel
            Left = 0
            Top = 0
            Width = 513
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LNotasModelo: TLFLabel
              Left = 41
              Top = 4
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Modelo'
            end
            object ENotasModelo: TLFEdit
              Left = 80
              Top = 1
              Width = 121
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 0
            end
            object ENotasModeloDescripcion: TLFEdit
              Left = 202
              Top = 1
              Width = 309
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
            end
          end
          object ToolButton5: TToolButton
            Left = 513
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotasModelo: THYMNavigator
            Left = 521
            Top = 0
            Width = 63
            Height = 22
            DataSource = DMDespiece.DSDespieceCab
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = True
          end
        end
        object DBMNotasModelo: TLFDBMemo
          Left = 0
          Top = 24
          Width = 1608
          Height = 553
          Align = alClient
          DataField = 'NOTAS'
          DataSource = DMDespiece.DSDespieceCab
          TabOrder = 1
        end
      end
      object TSOtros: TTabSheet [2]
        Caption = 'Otros'
        ImageIndex = 3
        object PNLOtros: TLFPanel
          Left = 0
          Top = 24
          Width = 1608
          Height = 553
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LTituloLonaLama: TLFLabel
            Left = 46
            Top = 19
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lona Lama'
          end
          object LCantidadDespiece: TLFLabel
            Left = 6
            Top = 43
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Candidad Despiece'
          end
          object LLonaAtravezada: TLFLabel
            Left = 18
            Top = 67
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lona Atravezada'
          end
          object LTituloModelo: TLFLabel
            Left = 33
            Top = 91
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo Modelo'
          end
          object LIncCorteLona: TLFLabel
            Left = 258
            Top = 19
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'INC Corte Lona'
          end
          object LDescuento: TLFLabel
            Left = 279
            Top = 43
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuento'
          end
          object LTarifaTYC: TLFLabel
            Left = 280
            Top = 91
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa TYC'
          end
          object LPconTapa: TLFLabel
            Left = 513
            Top = 19
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Palillos con Tapa'
          end
          object LPorJuegosCodos: TLFLabel
            Left = 519
            Top = 43
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Por Jueg Codos'
          end
          object LLadoInclinacion: TLFLabel
            Left = 804
            Top = 19
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lado Inclinaci'#243'n'
          end
          object LTipoMortizacion: TLFLabel
            Left = 804
            Top = 43
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Mortizaci'#243'n'
          end
          object LTerceraGuia: TLFLabel
            Left = 529
            Top = 67
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercera Gu'#237'a'
          end
          object LSegundoTiroCuerda: TLFLabel
            Left = 492
            Top = 91
            Width = 101
            Height = 13
            Alignment = taRightJustify
            Caption = 'Segundo Tiro Cuerda'
          end
          object LTipoRulinas: TLFLabel
            Left = 822
            Top = 67
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Rulinas'
          end
          object LCortinaPartida: TLFLabel
            Left = 524
            Top = 115
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cortina Partida'
          end
          object LClienteCab: TLFLabel
            Left = 299
            Top = 67
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LBambalinaAdicional: TLFLabel
            Left = 498
            Top = 139
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bambalina Adicional'
          end
          object LVentana: TLFLabel
            Left = 553
            Top = 163
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ventana'
          end
          object LTipoGajoExtendido: TLFLabel
            Left = 770
            Top = 91
            Width = 111
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Gajo Extendido'
          end
          object LTipoCristalVentana: TLFLabel
            Left = 756
            Top = 115
            Width = 125
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Cristal de Ventana'
          end
          object LTipoConfeccionLona: TLFLabel
            Left = 776
            Top = 139
            Width = 105
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Confecci'#243'n Lona'
          end
          object LUbicacionEtiqueta: TLFLabel
            Left = 791
            Top = 163
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ubicaci'#243'n Etiqueta'
          end
          object LRegulacionCofre: TLFLabel
            Left = 799
            Top = 186
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Regulacion Cofre'
          end
          object DBETituloELonaLama: TLFDbedit
            Left = 105
            Top = 17
            Width = 122
            Height = 21
            DataField = 'TITULO_LONA_LAMA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 0
          end
          object DBECantidadDespiece: TLFDbedit
            Left = 105
            Top = 41
            Width = 122
            Height = 21
            DataField = 'CANTIDAD_DESPIECE'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 1
          end
          object DBELonaAtravezada: TLFDbedit
            Left = 105
            Top = 65
            Width = 122
            Height = 21
            DataField = 'LONA_ATRAVESADA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 2
          end
          object DBETituloModelo: TLFDbedit
            Left = 105
            Top = 89
            Width = 122
            Height = 21
            DataField = 'TITULO_MODELO'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 3
          end
          object DBEIncCorteLona: TLFDbedit
            Left = 337
            Top = 17
            Width = 122
            Height = 21
            DataField = 'INC_CORTE_LONA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 4
          end
          object DBEDescuento: TLFDbedit
            Left = 337
            Top = 41
            Width = 122
            Height = 21
            DataField = 'DESCUENTO'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 5
          end
          object DBETarifaTYC: TLFDbedit
            Left = 337
            Top = 89
            Width = 122
            Height = 21
            DataField = 'TARIFA_TYC'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 7
          end
          object DBEPconTapa: TLFDbedit
            Left = 600
            Top = 17
            Width = 122
            Height = 21
            DataField = 'LINEA_PALILLOS_CON_TAPAS'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 8
          end
          object DBEPorJuegosCodos: TLFDbedit
            Left = 600
            Top = 41
            Width = 122
            Height = 21
            DataField = 'PORTERIA_CON_JUEGO_CODOS'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 9
          end
          object DBETerceraGuia: TLFDbedit
            Left = 599
            Top = 65
            Width = 122
            Height = 21
            DataField = 'TERCERA_GUIA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 10
          end
          object DBESegundoTiroCuerda: TLFDbedit
            Left = 599
            Top = 89
            Width = 122
            Height = 21
            DataField = 'SEGUNDO_TIRO_CUERDA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 11
          end
          object DBECortinaPartida: TLFDbedit
            Left = 599
            Top = 113
            Width = 122
            Height = 21
            DataField = 'CORTINA_PARTIDA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 12
          end
          object DBECliente: TLFDbedit
            Left = 337
            Top = 65
            Width = 122
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 6
          end
          object DBEFLonaInclinacion: TLFDBEditFind2000
            Left = 888
            Top = 17
            Width = 61
            Height = 21
            DataField = 'LADO_INCLINACION'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 15
            OnChange = DBEFLonaInclinacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'LIC'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ELonaInclinacion: TLFEdit
            Left = 951
            Top = 17
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
          end
          object DBEFTipoMotorizacion: TLFDBEditFind2000
            Left = 888
            Top = 41
            Width = 61
            Height = 21
            DataField = 'TIPO_MOTORIZACION'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 17
            OnChange = DBEFTipoMotorizacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'TMO'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoMotorizacion: TLFEdit
            Left = 951
            Top = 41
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
          end
          object DBEFTipoRulinas: TLFDBEditFind2000
            Left = 887
            Top = 65
            Width = 61
            Height = 21
            DataField = 'TIPO_RULINAS'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 19
            OnChange = DBEFTipoRulinasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'TRU'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoRulinas: TLFEdit
            Left = 950
            Top = 65
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
          end
          object DBEBambalinaAdicional: TLFDbedit
            Left = 599
            Top = 137
            Width = 122
            Height = 21
            DataField = 'BAMBALINA_ADICIONAL'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 13
          end
          object DBEVentana: TLFDbedit
            Left = 599
            Top = 161
            Width = 122
            Height = 21
            DataField = 'VENTANA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 14
          end
          object DBEFTipoGajoExtendido: TLFDBEditFind2000
            Left = 887
            Top = 89
            Width = 61
            Height = 21
            DataField = 'TIPO_GAJO_EXTENDIDO'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 21
            OnChange = DBEFTipoGajoExtendidoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'GAJ'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoGajoExtendido: TLFEdit
            Left = 950
            Top = 89
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 22
          end
          object DBEFTipoCristalVentana: TLFDBEditFind2000
            Left = 887
            Top = 113
            Width = 61
            Height = 21
            DataField = 'TIPO_CRISTAL_VENTANA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 23
            OnChange = DBEFTipoCristalVentanaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'CRI'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoCristalVentana: TLFEdit
            Left = 950
            Top = 113
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
          end
          object DBEFTipoConfeccionLona: TLFDBEditFind2000
            Left = 887
            Top = 137
            Width = 61
            Height = 21
            DataField = 'TIPO_CONFECCION_LONA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 25
            OnChange = DBEFTipoConfeccionLonaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'LCS'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoConfeccionLona: TLFEdit
            Left = 950
            Top = 137
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
          end
          object DBEFUbicacionEtiqueta: TLFDBEditFind2000
            Left = 887
            Top = 161
            Width = 61
            Height = 21
            DataField = 'UBICACION_ETIQUETA'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 27
            OnChange = DBEFUbicacionEtiquetaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'UBE'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EUbicacionEtiqueta: TLFEdit
            Left = 950
            Top = 161
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
          end
          object DBEFRegulacionCofre: TLFDBEditFind2000
            Left = 887
            Top = 184
            Width = 61
            Height = 21
            DataField = 'REGULACION_COFRE'
            DataSource = DMDespiece.DSDespieceCab
            TabOrder = 29
            OnChange = DBEFRegulacionCofreChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'RGC'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ERegulacionCofre: TLFEdit
            Left = 950
            Top = 184
            Width = 235
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
          end
        end
        object TBOtros: TLFToolBar
          Left = 0
          Top = 0
          Width = 1608
          Height = 24
          Caption = 'TBComponente'
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PCabOtros: TLFPanel
            Left = 0
            Top = 0
            Width = 513
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LOtrosDespiece: TLFLabel
              Left = 13
              Top = 3
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Despiece'
            end
            object LOtrosArticulo: TLFLabel
              Left = 155
              Top = 3
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Articulo'
            end
            object DBEOtrosDespiece: TLFDbedit
              Left = 62
              Top = 0
              Width = 74
              Height = 21
              Color = clInfoBk
              DataField = 'ID_DESPIECE_CAB'
              DataSource = DMDespiece.DSDespieceCab
              Enabled = False
              TabOrder = 0
            end
            object DBEOtrosTituloArticulo: TLFDbedit
              Left = 268
              Top = 0
              Width = 235
              Height = 21
              Color = clAqua
              DataField = 'TITULO'
              DataSource = DMDespiece.DSDespieceCab
              Enabled = False
              TabOrder = 1
            end
            object DBELOtrosArticulo: TLFDbedit
              Left = 193
              Top = -1
              Width = 74
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMDespiece.DSDespieceCab
              Enabled = False
              TabOrder = 2
            end
          end
          object NavOtros: THYMNavigator
            Left = 513
            Top = 0
            Width = 66
            Height = 22
            DataSource = DMDespiece.DSDespieceCab
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEOtrosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBETituloELonaLama
            Exclusivo = True
            ControlEdit = CEOtros
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 579
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1608
          Height = 577
          DataSource = DMDespiece.DSDespieceCab
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'FECHA'
            'LIQUIDO'
            'MONEDA'
            'PROYECTO'
            'RIG'
            'SU_REFERENCIA'
            'TITULO')
          CamposCalcAOrdenar.Strings = (
            'TOTAL_CANAL')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_DESPIECE_CAB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODELO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_COMPONENTES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_TAREAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LONA_LAMA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COLOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESCANDALLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_1_MODELO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_2_MODELO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ORIGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_DETALLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ORIGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_MOTOR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 635
    Width = 1620
    ButtonWidth = 85
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 248
    Top = 244
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 244
    Top = 284
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 592
    Top = 5
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ALstDespiece: TAction
      Category = 'Listado'
      Caption = 'Listado Despiece'
      Hint = 'Listado despiece'
      ImageIndex = 14
      OnExecute = ALstDespieceExecute
    end
    object AConfigurarListado: TAction
      Category = 'Listado'
      Caption = 'Configuraci'#243'n Listado'
      Hint = 'Configuraci'#243'n listado'
      ImageIndex = 77
      OnExecute = AConfigurarListadoExecute
    end
    object ACrearDespiece: TAction
      Category = 'Procesos'
      Caption = 'Importar despiece'
      Hint = 'Importar despiece de escandallo de produccion'
      ImageIndex = 10
      OnExecute = ACrearDespieceExecute
    end
    object ACalcFormula: TAction
      Category = 'Procesos'
      Caption = 'C'#225'lculo F'#243'rmula'
      Hint = 'Calcular f'#243'rmula'
      ImageIndex = 3
      OnExecute = ACalcFormulaExecute
    end
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Abrir/Cerrar Despiece'
      Hint = 'Abrir/Cerrar Despiece'
      ImageIndex = 68
      OnExecute = AAbrirCerrarExecute
    end
    object ACrearOP: TAction
      Category = 'Procesos'
      Caption = 'Crear OP'
      Hint = 'Crear Orden de produccion'
      ImageIndex = 92
      OnExecute = ACrearOPExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object AAdjuntoDespiece: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de despiece'
      Hint = 'Adjuntos de despiece'
      ImageIndex = 59
      OnExecute = AAdjuntoDespieceExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object ADuplicar: TAction
      Category = 'Procesos'
      Caption = 'Duplicar despiece'
      Hint = 'Duplica el despiece'
      ImageIndex = 37
      OnExecute = ADuplicarExecute
    end
    object AEliminaLineasVacias: TAction
      Category = 'Procesos'
      Caption = 'Elimina Lineas Vacias'
      Hint = 'Elimina Lineas Vacias'
      ImageIndex = 29
      OnExecute = AEliminaLineasVaciasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'PCComponente.Height')
    Left = 664
    Top = 3
  end
  object ALOrden: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 627
    Top = 4
    object AModelo: TAction
      Caption = 'AModelo'
      OnExecute = AModeloExecute
    end
    object AAEscandallo: TAction
      Caption = 'AAEscandallo'
      OnExecute = AAEscandalloExecute
    end
    object AOrdenP: TAction
      Caption = 'Orden P.'
      OnExecute = AOrdenPExecute
    end
    object AOrigen: TAction
      Caption = 'Origen'
      OnExecute = AOrigenExecute
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEOtros
    FichaEdicion = TSNotas
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 297
    Top = 244
  end
  object CENotasPMEdit: TPopUpTeclas
    Left = 297
    Top = 284
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
  object DSDetalle: TDataSource
    Left = 8
    Top = 168
  end
  object CEOtros: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PNLOtros
    SubComplementario = ALMain
    PopUpMenu = CEOtrosPMEdit
    Teclas = DMMain.Teclas
    Left = 342
    Top = 242
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 342
    Top = 290
    object CEOtrosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEOtrosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEOtrosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEOtrosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEOtrosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEOtrosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEOtrosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEOtrosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEOtrosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEOtrosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
