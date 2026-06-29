inherited FMFamilias: TFMFamilias
  Left = 529
  Top = 273
  Width = 914
  Height = 439
  HelpContext = 78
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Familias'
  PopupMenu = CESubfamiliasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 904
    Height = 386
    inherited TBMain: TLFToolBar
      Width = 900
      inherited NavMain: THYMNavigator
        DataSource = DMFamilias.DSQMFamilias
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBEFamilia
        OnChangeState = NavMainChangeState
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEFamilia
        Busca02 = DBETitulo
        Busca03 = DBEFCompras
        Busca04 = DBEFVentas
        Busca05 = DBEFIva
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object TBFiltraArticulos: TToolButton
        Left = 319
        Top = 0
        Action = AFiltraArticulos
      end
    end
    inherited PCMain: TLFPageControl
      Width = 900
      Height = 356
      OnChange = PCMainChange
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBAImagen: TSpeedButton [0]
          Left = 125
          Top = 45
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBAImagenDblClick
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
          Width = 892
          Height = 328
          inherited G2KTableLoc: TG2KTBLoc
            Left = 328
            Top = 0
            DataSource = DMFamilias.DSQMFamilias
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
          end
          object LBLFamilia: TLFLabel
            Left = 44
            Top = 14
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LBLTitulo: TLFLabel
            Left = 48
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLCtaCompra: TLFLabel
            Left = 13
            Top = 80
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Compras'
          end
          object LBLCtaVenta: TLFLabel
            Left = 21
            Top = 101
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Ventas'
          end
          object LBLIVA: TLFLabel
            Left = 50
            Top = 168
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.V.A.'
          end
          object LblPtoVerde: TLFLabel
            Left = 538
            Top = 102
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pto. Verde'
          end
          object LBLPrecioBase: TLFLabel
            Left = 39
            Top = 255
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'rgen'
          end
          object LTipoRedondeo: TLFLabel
            Left = 13
            Top = 212
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Redondeo'
          end
          object LDiasMin: TLFLabel
            Left = 540
            Top = 123
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as M'#237'n.'
          end
          object LDiasMax: TLFLabel
            Left = 539
            Top = 146
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as M'#225'x.'
          end
          object LBCtaDevC: TLFLabel
            Left = 24
            Top = 124
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.Dev.C.'
          end
          object LBCtaDevV: TLFLabel
            Left = 24
            Top = 146
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.Dev.V.'
          end
          object LBCtaAbonoC: TLFLabel
            Left = 25
            Top = 124
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.Abn.C.'
          end
          object CtaAbnV: TLFLabel
            Left = 25
            Top = 146
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.Abn.V.'
          end
          object LBKTituloWeb: TLFLabel
            Left = 22
            Top = 58
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo Web'
          end
          object LOrden: TLFLabel
            Left = 559
            Top = 168
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LTipoPrecioBase: TLFLabel
            Left = 6
            Top = 234
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Precio Base'
          end
          object LTipoRegistroFitosanitario: TLFLabel
            Left = 512
            Top = 190
            Width = 75
            Height = 13
            Hint = 'Tipo de Registro Fitosanitario'
            Alignment = taRightJustify
            Caption = 'Tipo Reg. Fitos.'
            ParentShowHint = False
            ShowHint = True
          end
          object LBLDisponibilidad: TLFLabel
            Left = 11
            Top = 190
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Disponibilidad'
          end
          object LSeccion: TLFLabel
            Left = 37
            Top = 278
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seccion'
          end
          object LBLImagen: TLFLabel
            Left = 39
            Top = 301
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object Imagen: TImage
            Left = 520
            Top = 208
            Width = 372
            Height = 120
            Anchors = [akLeft, akTop, akRight, akBottom]
            Center = True
            IncrementalDisplay = True
            Proportional = True
            Stretch = True
          end
          object LArticulos: TLFLabel
            Left = 405
            Top = 15
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulos'
          end
          object DBEFamilia: TLFDbedit
            Left = 80
            Top = 11
            Width = 57
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FAMILIA'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 0
            OnChange = DBEFamiliaChange
          end
          object DBETitulo: TLFDbedit
            Left = 80
            Top = 33
            Width = 420
            Height = 21
            DataField = 'TITULO'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 2
          end
          object DBETitCompras: TLFEdit
            Left = 188
            Top = 77
            Width = 312
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBETitVentas: TLFEdit
            Left = 188
            Top = 99
            Width = 312
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBETipIva: TLFDbedit
            Left = 122
            Top = 165
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'P_IVA'
            DataSource = DMFamilias.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object DBERecIva: TLFDbedit
            Left = 188
            Top = 165
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'P_RECARGO'
            DataSource = DMFamilias.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
          end
          object DBETitIva: TLFDbedit
            Left = 254
            Top = 165
            Width = 246
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFamilias.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object DBEFCompras: TLFDBEditFind2000
            Left = 80
            Top = 77
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_COMPRAS'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 4
            OnChange = DBEFComprasChange
            OnKeyDown = TeclaExpandirCta
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFVentas: TLFDBEditFind2000
            Left = 80
            Top = 99
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_VENTAS'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 6
            OnChange = DBEFVentasChange
            OnKeyDown = TeclaExpandirCta
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES           '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFIva: TLFDBEditFind2000
            Left = 80
            Top = 165
            Width = 41
            Height = 21
            DataField = 'TIPO_IVA'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 16
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_TIPO_IVA                   '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'P_IVA'
              'P_RECARGO')
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCHKVenta: TLFDBCheckBox
            Left = 559
            Top = 11
            Width = 170
            Height = 17
            Caption = 'Stock Negativo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 34
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VENTA'
            DataSource = DMFamilias.DSQMFamilias
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPtoVerde: TLFDbedit
            Left = 592
            Top = 99
            Width = 64
            Height = 21
            DataField = 'PTO_VERDE'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 38
          end
          object DBChBActTarAutom: TLFDBCheckBox
            Left = 559
            Top = 35
            Width = 170
            Height = 17
            Caption = 'Actualizar Tarifas Autom'#225't.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 35
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACT_TAR_AUTOM'
            DataSource = DMFamilias.DSQMFamilias
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEMargen: TLFDbedit
            Left = 80
            Top = 253
            Width = 50
            Height = 21
            DataField = 'MARGEN'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 27
          end
          object DBEFTipoRedondeo: TLFDBEditFind2000
            Left = 80
            Top = 209
            Width = 50
            Height = 21
            DataField = 'TIPO_REDONDEO'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 23
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_REDONDEOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_REDONDEO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO_REDONDEO')
            Filtros = []
          end
          object DBETitTipoRedondeo: TLFDbedit
            Left = 131
            Top = 209
            Width = 369
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFamilias.DSxTiposRedondeos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object EDiasMin: TLFEdit
            Left = 592
            Top = 121
            Width = 64
            Height = 21
            TabOrder = 39
            OnChange = EDiasMinChange
          end
          object EDiasMax: TLFEdit
            Left = 592
            Top = 143
            Width = 64
            Height = 21
            TabOrder = 40
            OnChange = EDiasMaxChange
          end
          object DBEFDevolucionCompras: TLFDBEditFind2000
            Left = 80
            Top = 121
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_DEVOLUCION_COMPRAS'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 8
            OnChange = DBEFDevolucionComprasChange
            OnKeyDown = TeclaExpandirCta
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFDevolucionVentas: TLFDBEditFind2000
            Left = 80
            Top = 143
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_DEVOLUCION_VENTAS'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 10
            OnChange = DBEFDevolucionVentasChange
            OnKeyDown = TeclaExpandirCta
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAbonoCompras: TLFDBEditFind2000
            Left = 80
            Top = 121
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_ABONO_COMPRAS'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 12
            OnChange = DBEFAbonoComprasChange
            OnKeyDown = TeclaExpandirCta
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAbonoVentas: TLFDBEditFind2000
            Left = 80
            Top = 143
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_ABONO_VENTAS'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 14
            OnChange = DBEFAbonoVentasChange
            OnKeyDown = TeclaExpandirCta
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitDevCompras: TLFEdit
            Left = 188
            Top = 121
            Width = 312
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
          object DBETitDevVentas: TLFEdit
            Left = 188
            Top = 143
            Width = 312
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object DBETitAbonoCompras: TLFEdit
            Left = 188
            Top = 121
            Width = 312
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBETitAbonoVentas: TLFEdit
            Left = 188
            Top = 143
            Width = 312
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object LBLTituloWeb: TLFDbedit
            Left = 80
            Top = 55
            Width = 420
            Height = 21
            DataField = 'TITULO_WEB'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 3
          end
          object DBCHKWeb: TLFDBCheckBox
            Left = 559
            Top = 57
            Width = 170
            Height = 17
            Caption = 'Web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 36
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB'
            DataSource = DMFamilias.DSQMFamilias
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEOrden: TLFDbedit
            Left = 592
            Top = 165
            Width = 64
            Height = 21
            DataField = 'ORDEN'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 41
          end
          object DBEFTipoPrecioBase: TLFDBEditFind2000
            Left = 80
            Top = 231
            Width = 50
            Height = 21
            DataField = 'TIPO_PRECIO_BASE'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 25
            OnChange = DBEFTipoPrecioBaseChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_PRECIO_BASE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_PRECIO_BASE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO_PRECIO_BASE')
            Filtros = []
          end
          object ETitTipoPrecioBase: TLFEdit
            Left = 131
            Top = 231
            Width = 369
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 26
          end
          object DBCBTipoRegistroFitosanitario: TLFDBComboBoxValue
            Left = 592
            Top = 187
            Width = 121
            Height = 21
            Hint = 'Tipo de registro fitosanitario'
            DataField = 'TIPO_REGISTRO_FITOSANITARIO'
            DataSource = DMFamilias.DSQMFamilias
            ItemHeight = 13
            Items.Strings = (
              'No aplica'
              'Aves'
              'Fitosanitario'
              'Prec. Explosivos')
            Values.Strings = (
              'Z'
              'A'
              'F'
              'E')
            TabOrder = 42
          end
          object DBEFDisponibilidad: TLFDBEditFind2000
            Left = 80
            Top = 187
            Width = 41
            Height = 21
            DataField = 'DISPONIBILIDAD'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 20
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_ART_DISPONIBILIDAD'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DISPONIBILIDAD'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'DISPONIBILIDAD')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDisponibilidad: TLFDbedit
            Left = 122
            Top = 187
            Width = 176
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFamilias.DSxDisponibilidad
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object ESeccion: TLFEdit
            Left = 131
            Top = 275
            Width = 369
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 29
          end
          object DBEFSeccion: TLFDBEditFind2000
            Left = 80
            Top = 275
            Width = 50
            Height = 21
            DataField = 'SECCION'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 28
            OnChange = DBEFSeccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SECCION'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 80
            Top = 297
            Width = 50
            Height = 21
            DataField = 'ID_IMAGEN'
            DataSource = DMFamilias.DSQMFamilias
            TabOrder = 30
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
            Left = 131
            Top = 297
            Width = 369
            Height = 21
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
          end
          object BCargarImagen: TButton
            Left = 452
            Top = 298
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde archivo'
            Caption = '...'
            TabOrder = 32
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 476
            Top = 298
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 33
            Visible = False
            OnClick = BClipboardClick
          end
          object DBECantidadArticulos: TLFDbedit
            Left = 448
            Top = 11
            Width = 52
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'CANTIDAD_ARTICULOS'
            DataSource = DMFamilias.DSQMFamilias
            ReadOnly = True
            TabOrder = 1
            OnDblClick = DBECantidadArticulosDblClick
          end
          object DBCBActualizaVenta: TLFDBCheckBox
            Left = 327
            Top = 190
            Width = 170
            Height = 17
            Caption = 'Actualiza Venta'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTUALIZA_VENTA'
            DataSource = DMFamilias.DSQMFamilias
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPCosteCeroEnVentas: TLFDBCheckBox
            Left = 559
            Top = 80
            Width = 194
            Height = 17
            Hint = 'P. Coste Cero en Ventas'
            Caption = 'P. Coste Cero en Ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 37
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PCOSTE_CERO_EN_VENTAS'
            DataSource = DMFamilias.DSQMFamilias
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSSubfamilias: TTabSheet [1]
        Caption = '&Subfamilias'
        ImageIndex = 3
        object PNSubfamilias: TLFPanel
          Left = 0
          Top = 0
          Width = 892
          Height = 328
          Align = alClient
          Anchors = []
          BevelOuter = bvNone
          TabOrder = 0
          object DBGFSubfamilias: TDBGridFind2000
            Left = 0
            Top = 21
            Width = 892
            Height = 285
            Align = alClient
            Ctl3D = True
            DataSource = DMFamilias.DSQMSubfamilias
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = True
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
              'SUBFAMILIAS')
            CamposAMostrar.Strings = (
              'SUBFAMILIAS'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'WEB')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'SUBFAMILIA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'ART_SUBFAMILIAS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ORDEN')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'SUBFAMILIA'
                Width = 61
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 329
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEB'
                Width = 60
                Visible = True
              end>
          end
          object TBSubfamilia: TLFToolBar
            Left = 0
            Top = 306
            Width = 892
            Height = 22
            Align = alBottom
            AutoSize = True
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 1
            Separators = True
            object NavSubfamilias: THYMNavigator
              Left = 0
              Top = 0
              Width = 200
              Height = 22
              DataSource = DMFamilias.DSQMSubfamilias
              Flat = True
              ParentShowHint = False
              PopupMenu = CESubfamiliasPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFSubfamilias
              InsertaControl = DBGFSubfamilias
              Exclusivo = True
              ControlEdit = CESubfamilias
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object TBSubFamiliaFamilia: TLFToolBar
            Left = 0
            Top = 0
            Width = 892
            Height = 21
            AutoSize = True
            ButtonHeight = 21
            EdgeBorders = []
            Enabled = False
            Flat = True
            TabOrder = 2
            Separators = True
            object PNLSubFamiliaFamilia: TLFPanel
              Left = 0
              Top = 0
              Width = 489
              Height = 21
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object DBESubFamiliaFamilia: TLFDbedit
                Left = 1
                Top = 0
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'FAMILIA'
                DataSource = DMFamilias.DSQMFamilias
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBESubFamiliaTituloFamilia: TLFDbedit
                Left = 123
                Top = 0
                Width = 354
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMFamilias.DSQMFamilias
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
          end
        end
      end
      object TSCuentas: TTabSheet [2]
        Caption = 'Cuentas'
        ImageIndex = 2
        object PCCuentas: TLFPageControl
          Left = 0
          Top = 0
          Width = 892
          Height = 328
          ActivePage = TSProySeries
          Align = alClient
          OwnerDraw = True
          TabIndex = 4
          TabOrder = 0
          TabPosition = tpBottom
          OnChange = PCMainChange
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSSeries: TTabSheet
            Caption = 'Series'
            object PNSeries: TLFPanel
              Left = 0
              Top = 21
              Width = 884
              Height = 259
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LSeriesCuentaCompras: TLFLabel
                Left = 4
                Top = 75
                Width = 63
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Compras'
              end
              object LSeriesCuentaVenta: TLFLabel
                Left = 12
                Top = 96
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Ventas'
              end
              object LBCtaDevlC: TLFLabel
                Left = 15
                Top = 119
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Dev.C.'
              end
              object LbCtaDvnV: TLFLabel
                Left = 15
                Top = 143
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Dev.V.'
              end
              object LBCtaAbnC: TLFLabel
                Left = 16
                Top = 119
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Abn.C.'
              end
              object LbCtaAbnV: TLFLabel
                Left = 16
                Top = 141
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Abn.V.'
              end
              object LSeriesSerie: TLFLabel
                Left = 43
                Top = 53
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie'
              end
              object DBEFCtaCompras: TLFDBEditFind2000
                Left = 71
                Top = 72
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_COMPRAS'
                DataSource = DMFamilias.DSQMSeries
                TabOrder = 1
                OnChange = DBEFCtaComprasChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitCtaCompras: TLFEdit
                Left = 177
                Top = 72
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object DBETitCtaVentas: TLFEdit
                Left = 177
                Top = 94
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEFCtaVentas: TLFDBEditFind2000
                Left = 71
                Top = 94
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_VENTAS'
                DataSource = DMFamilias.DSQMSeries
                TabOrder = 2
                OnChange = DBEFCtaVentasChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES           '
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaDevCompras: TLFDBEditFind2000
                Left = 71
                Top = 116
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_COMPRAS'
                DataSource = DMFamilias.DSQMSeries
                TabOrder = 3
                OnChange = DBEFCtaDevComprasChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitCtaDevCompras: TLFEdit
                Left = 177
                Top = 116
                Width = 298
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
              object DBETitCtaDevVentas: TLFEdit
                Left = 177
                Top = 138
                Width = 298
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
              object DBEFCtaDevVentas: TLFDBEditFind2000
                Left = 71
                Top = 138
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_VENTAS'
                DataSource = DMFamilias.DSQMSeries
                TabOrder = 4
                OnChange = DBEFCtaDevVentasChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaAbonoCompras: TLFDBEditFind2000
                Left = 71
                Top = 116
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_COMPRAS'
                DataSource = DMFamilias.DSQMSeries
                TabOrder = 10
                OnChange = DBEFCtaAbonoComprasChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitCtaAbonoCompras: TLFEdit
                Left = 177
                Top = 116
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBETitCtaAbonoVentas: TLFEdit
                Left = 177
                Top = 138
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object DBEFCtaAbonoVentas: TLFDBEditFind2000
                Left = 71
                Top = 138
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_VENTAS'
                DataSource = DMFamilias.DSQMSeries
                TabOrder = 12
                OnChange = DBEFCtaAbonoVentasChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFSerie: TLFDBEditFind2000
                Left = 71
                Top = 50
                Width = 105
                Height = 21
                DataField = 'SERIE'
                DataSource = DMFamilias.DSQMSeries
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'SERIE'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitSerie: TLFDbedit
                Left = 177
                Top = 50
                Width = 298
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMFamilias.DSxSeries
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
            end
            object TBSeries: TLFToolBar
              Left = 0
              Top = 280
              Width = 884
              Height = 22
              Align = alBottom
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object NAVSeries: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMFamilias.DSQMSeries
                Align = alLeft
                Flat = True
                ParentShowHint = False
                PopupMenu = CESeriesPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBEFCtaCompras
                InsertaControl = DBEFSerie
                OnClickBefore = NAVSeriesClickBefore
                Exclusivo = True
                ControlEdit = CESeries
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
            object TBArtSeries: TLFToolBar
              Left = 0
              Top = 0
              Width = 884
              Height = 21
              AutoSize = True
              ButtonHeight = 21
              EdgeBorders = []
              Enabled = False
              Flat = True
              TabOrder = 2
              Separators = True
              object PNLCuentasTitulos: TLFPanel
                Left = 0
                Top = 0
                Width = 489
                Height = 21
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 0
                object DBEFamSeries: TLFDbedit
                  Left = 1
                  Top = 0
                  Width = 121
                  Height = 21
                  Color = clInfoBk
                  DataField = 'FAMILIA'
                  DataSource = DMFamilias.DSQMFamilias
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBEFamDescSeries: TLFDbedit
                  Left = 123
                  Top = 0
                  Width = 354
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMFamilias.DSQMFamilias
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
          end
          object TSSeriesTabla: TTabSheet
            Caption = 'Series Tabla'
            ImageIndex = 1
            object DBGSeries: THYTDBGrid
              Left = 0
              Top = 0
              Width = 884
              Height = 302
              Align = alClient
              Color = clInfoBk
              DataSource = DMFamilias.DSQMSeries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'CANAL'
                'CTA_ABONO_COMPRAS'
                'CTA_ABONO_VENTAS'
                'CTA_COMPRAS'
                'CTA_DEVOLUCION_COMPRAS'
                'CTA_DEVOLUCION_VENTAS'
                'CTA_VENTAS'
                'EJERCICIO'
                'EMPRESA'
                'FAMILIA'
                'SERIE')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_VENTAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_VENTAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_VENTAS'
                  Width = 100
                  Visible = True
                end>
            end
          end
          object TSProyectos: TTabSheet
            Caption = 'Proyectos'
            ImageIndex = 2
            object PNProyectos: TLFPanel
              Left = 0
              Top = 21
              Width = 884
              Height = 259
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LFLCtaCompras: TLFLabel
                Left = 4
                Top = 74
                Width = 63
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Compras'
              end
              object LFLCtaDevComp: TLFLabel
                Left = 15
                Top = 119
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Dev.C.'
              end
              object LFLCtaDevVent: TLFLabel
                Left = 15
                Top = 141
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Dev.V.'
              end
              object LFLCtaVentas: TLFLabel
                Left = 12
                Top = 96
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Ventas'
              end
              object LFLProyecto: TLFLabel
                Left = 25
                Top = 52
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Proyecto'
              end
              object LFLCtaAbonoVentas: TLFLabel
                Left = 16
                Top = 141
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Abn.V.'
              end
              object LFLCtaAbonoComp: TLFLabel
                Left = 16
                Top = 119
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Abn.C.'
              end
              object DBEFCtaCompProy: TLFDBEditFind2000
                Left = 71
                Top = 72
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_COMPRAS'
                DataSource = DMFamilias.DSQMProyectos
                TabOrder = 1
                OnChange = DBEFCtaCompProyChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaDevCompProy: TLFDBEditFind2000
                Left = 71
                Top = 116
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_COMPRAS'
                DataSource = DMFamilias.DSQMProyectos
                TabOrder = 3
                OnChange = DBEFCtaDevCompProyChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaDevVentProy: TLFDBEditFind2000
                Left = 71
                Top = 138
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_VENTAS'
                DataSource = DMFamilias.DSQMProyectos
                TabOrder = 4
                OnChange = DBEFCtaDevVentProyChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaVentProy: TLFDBEditFind2000
                Left = 71
                Top = 94
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_VENTAS'
                DataSource = DMFamilias.DSQMProyectos
                TabOrder = 2
                OnChange = DBEFCtaVentProyChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFProyecto: TLFDBEditFind2000
                Left = 71
                Top = 50
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PROYECTO'
                DataSource = DMFamilias.DSQMProyectos
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'EMP_PROYECTOS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'PROYECTO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = DBEFProyectoBusqueda
                OrdenadoPor.Strings = (
                  'PROYECTO')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitCtaCompProy: TLFEdit
                Left = 177
                Top = 72
                Width = 298
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
              object DBETitCtaDevCompProy: TLFEdit
                Left = 177
                Top = 116
                Width = 297
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object DBETitCtaDevVentProy: TLFEdit
                Left = 177
                Top = 138
                Width = 297
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBETitCtaVentProy: TLFEdit
                Left = 177
                Top = 94
                Width = 298
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
              object DBETitProyecto: TLFDbedit
                Left = 177
                Top = 50
                Width = 298
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMFamilias.DSxProyectos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEFCtaAbCompProy: TLFDBEditFind2000
                Left = 71
                Top = 116
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_COMPRAS'
                DataSource = DMFamilias.DSQMProyectos
                TabOrder = 5
                OnChange = DBEFCtaAbCompProyChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaAbVentProy: TLFDBEditFind2000
                Left = 71
                Top = 138
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_VENTAS'
                DataSource = DMFamilias.DSQMProyectos
                TabOrder = 6
                OnChange = DBEFCtaAbVentProyChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitCtaAbCompProy: TLFEdit
                Left = 177
                Top = 116
                Width = 298
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
              end
              object DBETitCtaAbVentProy: TLFEdit
                Left = 177
                Top = 138
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
            end
            object TBProyectos: TLFToolBar
              Left = 0
              Top = 280
              Width = 884
              Height = 22
              Align = alBottom
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object NavProyectos: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMFamilias.DSQMProyectos
                Align = alLeft
                Flat = True
                ParentShowHint = False
                PopupMenu = CEProyectosPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBEFCtaCompProy
                InsertaControl = DBEFProyecto
                Exclusivo = True
                ControlEdit = CEProyectos
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
            object TBArtProy: TLFToolBar
              Left = 0
              Top = 0
              Width = 884
              Height = 21
              AutoSize = True
              ButtonHeight = 21
              EdgeBorders = []
              Enabled = False
              Flat = True
              TabOrder = 2
              Separators = True
              object PInfoProy: TLFPanel
                Left = 0
                Top = 0
                Width = 489
                Height = 21
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 0
                object DBEArtProy: TLFDbedit
                  Left = 1
                  Top = 0
                  Width = 121
                  Height = 21
                  Color = clInfoBk
                  DataField = 'FAMILIA'
                  DataSource = DMFamilias.DSQMFamilias
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBEArtDescProy: TLFDbedit
                  Left = 123
                  Top = 0
                  Width = 354
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMFamilias.DSQMFamilias
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
          end
          object TSProyTabla: TTabSheet
            Caption = 'Proyectos Tabla'
            ImageIndex = 3
            object DBGProyectos: THYTDBGrid
              Left = 0
              Top = 0
              Width = 884
              Height = 302
              Align = alClient
              Color = clInfoBk
              DataSource = DMFamilias.DSQMProyectos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'ARTICULO'
                'CANAL'
                'CTA_ABONO_COMPRAS'
                'CTA_ABONO_VENTAS'
                'CTA_COMPRAS'
                'CTA_DEVOLUCION_COMPRAS'
                'CTA_DEVOLUCION_VENTAS'
                'CTA_VENTAS'
                'EJERCICIO'
                'EMPRESA'
                'ID_C_A'
                'PROYECTO')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PROYECTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_VENTAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_VENTAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_VENTAS'
                  Width = 100
                  Visible = True
                end>
            end
          end
          object TSProySeries: TTabSheet
            Caption = 'Proyectos/Series'
            object TBCuentasProyectosSeries: TLFToolBar
              Left = 0
              Top = 280
              Width = 884
              Height = 22
              Align = alBottom
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavProySeries: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMFamilias.DSQMProyectosSeries
                Align = alLeft
                Flat = True
                ParentShowHint = False
                PopupMenu = CEProySeriesPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBEFCtaCompProySer
                InsertaControl = DBEFProySeries
                OnClickBefore = NAVSeriesClickBefore
                Exclusivo = True
                ControlEdit = CEProySeries
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
            object TBArtProySer: TLFToolBar
              Left = 0
              Top = 0
              Width = 884
              Height = 21
              AutoSize = True
              ButtonHeight = 21
              EdgeBorders = []
              Enabled = False
              Flat = True
              TabOrder = 1
              Separators = True
              object PInfoProySer: TLFPanel
                Left = 0
                Top = 0
                Width = 489
                Height = 21
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 0
                object DBEArtProySer: TLFDbedit
                  Left = 1
                  Top = 0
                  Width = 121
                  Height = 21
                  Color = clInfoBk
                  DataField = 'FAMILIA'
                  DataSource = DMFamilias.DSQMFamilias
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBEArtDescProySer: TLFDbedit
                  Left = 123
                  Top = 0
                  Width = 354
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMFamilias.DSQMFamilias
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object PNProySeries: TLFPanel
              Left = 0
              Top = 21
              Width = 884
              Height = 259
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 2
              object LFLCtaCompProySer: TLFLabel
                Left = 2
                Top = 84
                Width = 63
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Compras'
              end
              object LFLCtaVentProySer: TLFLabel
                Left = 10
                Top = 106
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Ventas'
              end
              object LFLCtaDevCompPROYSER: TLFLabel
                Left = 13
                Top = 129
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Dev.C.'
              end
              object LFLCtaDevVentPROYSER: TLFLabel
                Left = 13
                Top = 151
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Dev.V.'
              end
              object LFLCtaAbCompProySer: TLFLabel
                Left = 20
                Top = 129
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Ab.C.'
              end
              object LFLCtaAbVentProySer: TLFLabel
                Left = 20
                Top = 152
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta.Ab.V.'
              end
              object LFLProySeries: TLFLabel
                Left = 23
                Top = 41
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Proyecto'
              end
              object LFLSerieProySer: TLFLabel
                Left = 41
                Top = 63
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie'
              end
              object DBEFCtaCompProySer: TLFDBEditFind2000
                Left = 71
                Top = 82
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_COMPRAS'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 2
                OnChange = DBEFCtaCompProySerChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitCtaCompProySer: TLFEdit
                Left = 177
                Top = 82
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object DBETitCtaVentProySer: TLFEdit
                Left = 177
                Top = 104
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBETitCtaDevCompProySer: TLFEdit
                Left = 177
                Top = 126
                Width = 298
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
              end
              object DBETitCtaDevVentProySer: TLFEdit
                Left = 177
                Top = 148
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object DBETitCtaAbVentProySer: TLFEdit
                Left = 177
                Top = 148
                Width = 298
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
              end
              object DBEFCtaDevVentProySer: TLFDBEditFind2000
                Left = 71
                Top = 148
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_VENTAS'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 5
                OnChange = DBEFCtaDevVentProySerChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaDevCompProySer: TLFDBEditFind2000
                Left = 71
                Top = 126
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_COMPRAS'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 4
                OnChange = DBEFCtaDevCompProySerChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaAbVentProySer: TLFDBEditFind2000
                Left = 71
                Top = 148
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_VENTAS'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 7
                OnChange = DBEFCtaAbVentProySerChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaAbCompProySer: TLFDBEditFind2000
                Left = 71
                Top = 126
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_COMPRAS'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 6
                OnChange = DBEFCtaAbCompProySerChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaVentProySer: TLFDBEditFind2000
                Left = 71
                Top = 104
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_VENTAS'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 3
                OnChange = DBEFCtaVentProySerChange
                OnKeyDown = TeclaExpandirCta
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnVerificacion = ExpandirCadenaCta
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitProySeries: TLFDbedit
                Left = 177
                Top = 38
                Width = 298
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMFamilias.DSxProyectosSeries
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBEFProySeries: TLFDBEditFind2000
                Left = 71
                Top = 38
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PROYECTO'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'EMP_PROYECTOS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'PROYECTO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = DBEFProySeriesBusqueda
                OrdenadoPor.Strings = (
                  'PROYECTO')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFSerieProySer: TLFDBEditFind2000
                Left = 71
                Top = 60
                Width = 105
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SERIE'
                DataSource = DMFamilias.DSQMProyectosSeries
                TabOrder = 1
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'VER_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'SERIE'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBETitSerieProySer: TLFDbedit
                Left = 177
                Top = 60
                Width = 298
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMFamilias.DSxSeries_PROYSER
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBETitCtaAbCompProySer: TLFEdit
                Left = 177
                Top = 126
                Width = 298
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
            end
          end
          object TSProySerTabla: TTabSheet
            Caption = 'Proyectos/Series Tabla'
            object DBGProySeries: THYTDBGrid
              Left = 0
              Top = 0
              Width = 884
              Height = 302
              Align = alClient
              Color = clInfoBk
              DataSource = DMFamilias.DSQMProyectosSeries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'ARTICULO'
                'CANAL'
                'CTA_ABONO_COMPRAS'
                'CTA_ABONO_VENTAS'
                'CTA_COMPRAS'
                'CTA_DEVOLUCION_COMPRAS'
                'CTA_DEVOLUCION_VENTAS'
                'CTA_VENTAS'
                'EJERCICIO'
                'EMPRESA'
                'ID_C_A'
                'PROYECTO'
                'SERIE')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PROYECTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_VENTAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_VENTAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_COMPRAS'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_VENTAS'
                  Width = 100
                  Visible = True
                end>
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 892
          Height = 328
          DataSource = DMFamilias.DSQMFamilias
          CamposAMarcar.Strings = (
            'ACT_TAR_AUTOM'
            'VENTA'
            'WEB')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'CTA_ABONO_COMPRAS'
            'CTA_ABONO_VENTAS'
            'CTA_COMPRAS'
            'CTA_DEVOLUCION_COMPRAS'
            'CTA_DEVOLUCION_VENTAS'
            'CTA_VENTAS'
            'FAMILIA'
            'ORDEN'
            'PTO_VERDE'
            'TITULO'
            'TITULO_WEB'
            'VENTA'
            'WEB')
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_COMPRAS'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_VENTAS'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IVA'
              Title.Alignment = taRightJustify
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WEB'
              Width = 45
              Visible = True
            end>
        end
      end
      object TSECommerce: TTabSheet
        Caption = 'ECommerce'
        ImageIndex = 4
        OnShow = TSECommerceShow
        object TBArticuloTiendaEC: TLFToolBar
          Left = 0
          Top = 0
          Width = 892
          Height = 25
          AutoSize = True
          ButtonHeight = 21
          TabOrder = 0
          Separators = True
          object NavFamiliaTiendaEC: THYMNavigator
            Left = 0
            Top = 2
            Width = 150
            Height = 21
            DataSource = DMFamilias.DSQMConfECPrestashop
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbRefresh]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep2: TToolButton
            Left = 150
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object PNLECommerceFamilia: TLFPanel
            Left = 158
            Top = 2
            Width = 304
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object DBEECommerceFamilia: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              Color = clInfoBk
              DataField = 'FAMILIA'
              DataSource = DMFamilias.DSQMFamilias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEECommerceTituloFamilia: TLFDbedit
              Left = 70
              Top = 0
              Width = 234
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMFamilias.DSQMFamilias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object TBSep3: TToolButton
            Left = 462
            Top = 2
            Width = 8
            ImageIndex = 0
            Style = tbsSeparator
          end
          object PNLTiendaPrestashop: TLFPanel
            Left = 470
            Top = 2
            Width = 304
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object DBETiendaPrestashop: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              Color = clInfoBk
              DataField = 'ID'
              DataSource = DMFamilias.DSQMConfECPrestashop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBETituloTiendaPrestashop: TLFDbedit
              Left = 70
              Top = 0
              Width = 234
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMFamilias.DSQMConfECPrestashop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object PNLFijarTiendaPrestashop: TLFPanel
            Left = 774
            Top = 2
            Width = 105
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 3
            object LFijarTiendaPrestashop: TLFLabel
              Left = 0
              Top = 3
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fijar Tienda'
            end
            object EFFijarTiendaPrestashop: TLFEditFind2000
              Left = 59
              Top = 0
              Width = 46
              Height = 21
              TabOrder = 0
              OnChange = EFFijarTiendaPrestashopChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'ID'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'SYS_CONF_PRESTASHOP'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ID')
              Filtros = [obEmpresa, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object TBSep4: TToolButton
            Left = 879
            Top = 2
            Width = 8
            ImageIndex = 1
            Style = tbsSeparator
          end
        end
        object DBGFamiliaECPrestashop: TDBGridFind2000
          Left = 0
          Top = 25
          Width = 892
          Height = 278
          Align = alClient
          Color = clInfoBk
          Ctl3D = True
          DataSource = DMFamilias.DSQMFamiliaECPrestashop
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGFamiliaECPrestashopDrawColumnCell
          Insercion = True
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
            'SUBFAMILIAS')
          CamposAMostrar.Strings = (
            'SUBFAMILIAS'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'WEB')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'SUBFAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_SUBFAMILIAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ORDEN')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_CATEGORY'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_FAMILIA'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBFAMILIA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_SUBFAMILIA'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ULT_SINCRONIZACION'
              Visible = True
            end>
        end
        object PNLSincronizacionPrestashop: TPanel
          Left = 0
          Top = 303
          Width = 892
          Height = 25
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object LSubirFamiliasPrestashop: TLFLabel
            Left = 104
            Top = 6
            Width = 341
            Height = 13
            Hint = 
              'Crea familias y subfamilias marcadas como WEB en la tienda Prest' +
              'ashop'
            Caption = 
              'Crea familias y subfamilias marcadas como WEB en la tienda Prest' +
              'ashop'
          end
          object BSubirFamiliasPrestashop: TButton
            Left = 24
            Top = 0
            Width = 75
            Height = 25
            Hint = 
              'Crea familias y subfamilias marcadas como WEB en la tienda Prest' +
              'ashop'
            Caption = 'Subir'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = BSubirFamiliasPrestashopClick
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 386
    Width = 904
  end
  inherited CEMain: TControlEdit
    Left = 376
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 376
    Top = 40
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
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 330
    Top = 40
    object AVisualizarFamilias: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado de Familias Filtradas'
      Hint = 'Visualizar Listado de Familias Filtradas'
      ImageIndex = 14
      OnExecute = AVisualizarFamiliasExecute
    end
    object AImprimirFamilias: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado de Familias Filtradas'
      Hint = 'Imprimir Listado de Familias Filtradas'
      ImageIndex = 14
      OnExecute = AImprimirFamiliasExecute
    end
    object AVisualizarArtFamilias: TAction
      Category = 'Listados'
      Caption = 'Visualizar Art'#237'culos por Familias Filtradas y Tarifas Activas'
      Hint = 'Visualizar Art'#237'culos por Familias Filtradas y Tarifas Activas'
      ImageIndex = 14
      OnExecute = AVisualizarArtFamiliasExecute
    end
    object AImprimirArtFamiliaFiltrados: TAction
      Category = 'Listados'
      Caption = 'Imprimir Art'#237'culos por Familias Filtradas y Tarifas Activas'
      Hint = 'Imprimir Art'#237'culos por Familias Filtradas y Tarifas Activas'
      ImageIndex = 14
      OnExecute = AImprimirArtFamiliaFiltradosExecute
    end
    object AMovArtFamilia: TAction
      Category = 'Listados'
      Caption = 'Listado de Movimientos de Art'#237'culos por Familias'
      Hint = 'Listado de Movimientos de Art'#237'culos por Familias'
      ImageIndex = 14
      OnExecute = AMovArtFamiliaExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfListadosFamilias: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Familias'
      Hint = 'Listados de Familias'
      ImageIndex = 14
      OnExecute = AConfListadosFamiliasExecute
    end
    object AConfListadoArticulosPorFamilias: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Art'#237'culos por Familias'
      Hint = 'Listados de Art'#237'culos por Familias'
      ImageIndex = 14
      OnExecute = AConfListadoArticulosPorFamiliasExecute
    end
    object AConfListadosMovArticulosPorFamilias: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Movimientos de Art'#237'culos por Familias'
      Hint = 'Listados de Movimientos de Art'#237'culos por Familias'
      ImageIndex = 14
      OnExecute = AConfListadosMovArticulosPorFamiliasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object APropagaCuentasSeries: TAction
      Category = 'Procesos'
      Caption = 'Propaga las cuentas de las Series a los Art'#237'culos'
      Hint = 'Propaga las cuentas de las Series a los Art'#237'culos'
      ImageIndex = 98
      OnExecute = APropagaCuentasSeriesExecute
    end
    object APropagaMargenTarifas: TAction
      Category = 'Procesos'
      Caption = 'Propaga el Margen a todas las Tarifas'
      Hint = 'Propaga el Margen a todas las Tarifas'
      ImageIndex = 33
      OnExecute = APropagaMargenTarifasExecute
    end
    object APropagaMargenArticulos: TAction
      Category = 'Procesos'
      Caption = 'Propaga el Margen a todos los Art'#237'culos'
      Hint = 'Propaga el Margen a todos los Art'#237'culos'
      ImageIndex = 86
      OnExecute = APropagaMargenArticulosExecute
    end
    object APropagaRedondeo: TAction
      Category = 'Procesos'
      Caption = 'Propaga el Redondeo y Precio Base a los Art'#237'culos'
      Hint = 'Propaga el Redondeo a todos los Art'#237'culos'
      ImageIndex = 86
      OnExecute = APropagaRedondeoExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AVerFamiliaSistema: TAction
      Category = 'Procesos'
      Caption = 'Ver Familia de Sistema'
      Hint = 'Ver Familia de Sistema'
      ImageIndex = 7
      OnExecute = AVerFamiliaSistemaExecute
    end
    object AFiltraArticulos: TAction
      Category = 'Procesos'
      Caption = 'Filtra articulos'
      Hint = 'Muestra la ficha de articulos de esta familia'
      ImageIndex = 10
      OnExecute = AFiltraArticulosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFFijarTiendaPrestashop.Text')
    Left = 330
    Top = 8
  end
  object CESeries: TControlEdit
    EnlazadoA = CEProyectos
    FichaEdicion = TSSeries
    FichaExclusiva = TSSeries
    PanelEdicion = PNSeries
    PopUpMenu = CESeriesPMEdit
    Teclas = DMMain.Teclas
    Left = 409
    Top = 8
  end
  object CESeriesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 409
    Top = 40
    object CESeriesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CESeriesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CESeriesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CESeriesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CESeriesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CESeriesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CESeriesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CESeriesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CESeriesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CESeriesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEProyectos: TControlEdit
    EnlazadoA = CEProySeries
    FichaEdicion = TSProyectos
    FichaExclusiva = TSProyectos
    PanelEdicion = PNProyectos
    PopUpMenu = CEProyectosPMEdit
    Teclas = DMMain.Teclas
    Left = 442
    Top = 8
  end
  object CEProyectosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 442
    Top = 40
    object CEProyectosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEProyectosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEProyectosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEProyectosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEProyectosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEProyectosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEProyectosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEProyectosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEProyectosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEProyectosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEProySeries: TControlEdit
    EnlazadoA = CESubfamilias
    FichaEdicion = TSProySeries
    FichaExclusiva = TSProySeries
    PanelEdicion = PNProySeries
    PopUpMenu = CEProySeriesPMEdit
    Teclas = DMMain.Teclas
    Left = 475
    Top = 8
  end
  object CEProySeriesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 475
    Top = 40
    object CEProySeriesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEProySeriesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEProySeriesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEProySeriesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEProySeriesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEProySeriesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEProySeriesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEProySeriesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEProySeriesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEProySeriesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CESubfamilias: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSSubfamilias
    FichaExclusiva = TSSubfamilias
    PopUpMenu = CESubfamiliasPMEdit
    Teclas = DMMain.Teclas
    Left = 508
    Top = 8
  end
  object CESubfamiliasPMEdit: TPopUpTeclas
    Left = 508
    Top = 40
    object CESubfamiliasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CESubfamiliasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CESubfamiliasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CESubfamiliasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CESubfamiliasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CESubfamiliasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CESubfamiliasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CESubfamiliasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CESubfamiliasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CESubfamiliasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
