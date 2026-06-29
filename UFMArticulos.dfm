inherited FMArticulos: TFMArticulos
  Left = 196
  Top = 132
  Width = 1219
  Height = 716
  HelpContext = 79
  ActiveControl = EFArticulo
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Art'#237'culos'
  Constraints.MinHeight = 540
  Constraints.MinWidth = 1200
  FormStyle = fsNormal
  PopupMenu = CECaracteristicasPMEdit
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1209
    Height = 663
    inherited TBMain: TLFToolBar
      Width = 1205
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBEArticulo
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Listado de Movimientos de Articulos'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
        Hint = '[Ctrl+Alt+C]'
      end
      object TButtRefrescarTabla: TToolButton
        Left = 319
        Top = 0
        Hint = 'Refrescar todos los Art'#237'culos'
        Caption = 'Refrescar Tabla'
        ImageIndex = 109
        OnClick = TButtRefrescarTablaClick
      end
      object TButtBuscaPorCodProv: TToolButton
        Left = 342
        Top = 0
        Action = ABuscaPorCodProv
      end
      object TButtBuscaPorCodCli: TToolButton
        Left = 365
        Top = 0
        Action = ABuscaPorCodCli
      end
      object TBFichaTec: TToolButton
        Left = 388
        Top = 0
        Action = AFichaTec
      end
      object TButtSep1: TToolButton
        Left = 411
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object Z_TButtDatosEsp: TToolButton
        Left = 419
        Top = 0
        Hint = 'Ver datos especiales del art'#237'culo'
        Action = ZADatosToldo
        Caption = 'Datos Especiales Art'#237'culo'
        Enabled = False
        ImageIndex = 58
      end
      object TButtDocumentos: TToolButton
        Left = 442
        Top = 0
        Action = ADocumentos
      end
      object TButtFiltraEscandallosProd: TToolButton
        Left = 465
        Top = 0
        Action = AFiltraEscandallosProd
      end
      object TButtFiltraEscandallosProdComponente: TToolButton
        Left = 488
        Top = 0
        Action = AFiltraEscandalloProdComponente
      end
      object TButtSep3: TToolButton
        Left = 511
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfoStock: TToolButton
        Left = 519
        Top = 0
        Action = AInfoStocks
      end
      object TBSepEginer: TToolButton
        Left = 542
        Top = 0
        Width = 8
        ImageIndex = 2
        Style = tbsSeparator
      end
      object PNLEginer: TLFPanel
        Left = 550
        Top = 0
        Width = 150
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object BCopiarEnlace: TButton
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          Caption = 'Enlace'
          TabOrder = 0
          OnClick = BCopiarEnlaceClick
        end
        object BCopiarImagen: TButton
          Left = 75
          Top = 0
          Width = 75
          Height = 22
          Caption = 'Imagen'
          TabOrder = 1
          OnClick = TBCopiarImagenPortapapelesClick
        end
      end
    end
    inherited PCMain: TLFPageControl
      Top = 50
      Width = 1205
      Height = 611
      OnChange = PCMainChange
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBArticulo: TSpeedButton [0]
          Left = 117
          Top = 51
          Width = 124
          Height = 25
          Hint = 'Doble Click copia codigo de articulo al portapapeles'
          GroupIndex = -1
          OnDblClick = SBArticuloDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1197
          Height = 583
          inherited G2KTableLoc: TG2KTBLoc
            Top = 13
            Plan.Strings = (
              
                'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
                'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
            DataSource = DMArticulos.DSQMArticulos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object LBLArticuloFicha: TLFLabel
            Left = 75
            Top = 3
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LBLNombreFicha: TLFLabel
            Left = 75
            Top = 24
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LBLFamilia: TLFLabel
            Left = 80
            Top = 47
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LBLPcoste: TLFLabel
            Left = 72
            Top = 201
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste'
          end
          object LBLCtaCompra: TLFLabel
            Left = 49
            Top = 91
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Compras'
          end
          object LBLCtaVenta: TLFLabel
            Left = 57
            Top = 112
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Ventas'
          end
          object LBLIVA: TLFLabel
            Left = 86
            Top = 179
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.V.A.'
          end
          object LBLUnidades: TLFLabel
            Left = 67
            Top = 333
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LBLDisponibilidad: TLFLabel
            Left = 47
            Top = 223
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Disponibilidad'
          end
          object LBLPtoVerde: TLFLabel
            Left = 452
            Top = 245
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pto. Verde'
          end
          object LblControlaUnidades: TLFLabel
            Left = 44
            Top = 435
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Controla Unid.'
          end
          object LBLGarantia: TLFLabel
            Left = 70
            Top = 245
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Garant'#237'a'
          end
          object LBLDescuento: TLFLabel
            Left = 60
            Top = 311
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuento'
          end
          object LPCosteCanal: TLFLabel
            Left = 312
            Top = 202
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste Canal'
          end
          object LFactorEscala: TLFLabel
            Left = 438
            Top = 435
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factor Escala'
            Visible = False
          end
          object LBLCompraMinima: TLFLabel
            Left = 19
            Top = 456
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ud. m'#237'nima Compra'
          end
          object LBLVentaMinima: TLFLabel
            Left = 221
            Top = 457
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ud. m'#237'nima Venta'
          end
          object LCampo1: TLFLabel
            Left = 809
            Top = 4
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 1'
            FocusControl = DBECampo1
          end
          object LCampo2: TLFLabel
            Left = 809
            Top = 24
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 2'
            FocusControl = DBECampo2
          end
          object LCampo3: TLFLabel
            Left = 809
            Top = 47
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 3'
            FocusControl = DBECampo3
          end
          object LCampo4: TLFLabel
            Left = 809
            Top = 68
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 4'
            FocusControl = DBECampo4
          end
          object LCampo5: TLFLabel
            Left = 809
            Top = 91
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 5'
            FocusControl = DBECampo5
          end
          object LblPeso: TLFLabel
            Left = 87
            Top = 355
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso'
          end
          object LblCodigoIntra: TLFLabel
            Left = 372
            Top = 311
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Arancelario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBCtaAbonoC: TLFLabel
            Left = 15
            Top = 135
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Abono Compras'
          end
          object CtaAbnV: TLFLabel
            Left = 23
            Top = 157
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Abono Ventas'
          end
          object LBCtaDevC: TLFLabel
            Left = 29
            Top = 135
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.Dev.Compras'
          end
          object LBCtaDevV: TLFLabel
            Left = 37
            Top = 157
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.Dev.Ventas'
          end
          object LBVolumen: TLFLabel
            Left = 333
            Top = 356
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Volumen Unid.'
          end
          object LBDiametro: TLFLabel
            Left = 187
            Top = 355
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Di'#225'metro Unid.'
          end
          object LBDefUdSec: TLFLabel
            Left = 438
            Top = 333
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Def. Ud. Sec.'
          end
          object LBLFabricante: TLFLabel
            Left = 62
            Top = 68
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fabricante'
          end
          object LblTipoArticulo: TLFLabel
            Left = 38
            Top = 502
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Art'#237'culo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LbMerma: TLFLabel
            Left = 80
            Top = 479
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Merma'
          end
          object LFechaAltaModif: TLFLabel
            Left = 271
            Top = 4
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Alta/Modif.'
          end
          object LClaveADR: TLFLabel
            Left = 774
            Top = 179
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Clave ADR'
          end
          object LSubfamilia: TLFLabel
            Left = 322
            Top = 47
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subfamilia'
          end
          object LCampo6: TLFLabel
            Left = 809
            Top = 112
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 6'
            FocusControl = DBECampo6
          end
          object LblSubTipoArticulo: TLFLabel
            Left = 21
            Top = 524
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subtipo Art'#237'culo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LCosteAdicional: TLFLabel
            Left = 336
            Top = 202
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste Adic.'
          end
          object LCampo7: TLFLabel
            Left = 809
            Top = 135
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 7'
            FocusControl = DBECampo7
          end
          object LCampo8: TLFLabel
            Left = 809
            Top = 157
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 8'
            FocusControl = DBECampo8
          end
          object LADRBulto: TLFLabel
            Left = 801
            Top = 202
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bulto ADR'
          end
          object LTipoMaterial: TLFLabel
            Left = 790
            Top = 223
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Material'
          end
          object LBloqueoCompras: TLFLabel
            Left = 773
            Top = 245
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bloqueo Compra'
          end
          object LBloqueoVentas: TLFLabel
            Left = 781
            Top = 290
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bloqueo Venta'
          end
          object LMotivoBloqueoCompra: TLFLabel
            Left = 753
            Top = 268
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Bloq. Compra'
          end
          object LMotivoBloqueoVenta: TLFLabel
            Left = 761
            Top = 311
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Bloq. Venta'
          end
          object LMotivoBaja: TLFLabel
            Left = 795
            Top = 355
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Baja'
          end
          object LTipoRegistroFitosanitario: TLFLabel
            Left = 776
            Top = 377
            Width = 75
            Height = 13
            Hint = 'Tipo de Registro Fitosanitario'
            Alignment = taRightJustify
            Caption = 'Tipo Reg. Fitos.'
            ParentShowHint = False
            ShowHint = True
          end
          object LLitrosPorUnidad: TLFLabel
            Left = 47
            Top = 413
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Litros/Unidad'
          end
          object LTipoIBAE: TLFLabel
            Left = 233
            Top = 413
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'IBAE'
          end
          object LMarca: TLFLabel
            Left = 821
            Top = 399
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Marca'
          end
          object LFormulaDefecto: TLFLabel
            Left = 773
            Top = 421
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Formula Defecto'
          end
          object LTipoImpuestoAdicional: TLFLabel
            Left = 761
            Top = 443
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Imp. Adicional'
          end
          object LSeccion: TLFLabel
            Left = 350
            Top = 223
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seccion'
          end
          object LFactorUnidad: TLFLabel
            Left = 474
            Top = 356
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factor'
          end
          object LPesoFactor: TDBText
            Left = 117
            Top = 371
            Width = 61
            Height = 13
            Alignment = taRightJustify
            DataField = 'PESO_FACTOR'
            DataSource = DMArticulos.DSQMArticulos
          end
          object LDiametroFactor: TDBText
            Left = 263
            Top = 371
            Width = 61
            Height = 13
            Alignment = taRightJustify
            DataField = 'DIAMETRO_FACTOR'
            DataSource = DMArticulos.DSQMArticulos
          end
          object LVolumenFactor: TDBText
            Left = 407
            Top = 372
            Width = 61
            Height = 13
            Alignment = taRightJustify
            DataField = 'VOLUMEN_FACTOR'
            DataSource = DMArticulos.DSQMArticulos
          end
          object LAncho: TLFLabel
            Left = 225
            Top = 391
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho'
          end
          object LAlto: TLFLabel
            Left = 94
            Top = 391
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alto'
          end
          object LFondo: TLFLabel
            Left = 372
            Top = 392
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fondo'
          end
          object LTasaDestruccion: TLFLabel
            Left = 12
            Top = 267
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tasa de Destruccion'
          end
          object LImporteIEPNR: TLFLabel
            Left = 307
            Top = 267
            Width = 56
            Height = 13
            Hint = 'Importe Impuesto Especial Plasticos No Reutilizables'
            Alignment = taRightJustify
            Caption = 'Imp. IEPNR'
            ParentShowHint = False
            ShowHint = True
          end
          object LKgPlasticoVirgen: TLFLabel
            Left = 442
            Top = 267
            Width = 60
            Height = 13
            Hint = 'Kg Plastico Virgen'
            Alignment = taRightJustify
            Caption = 'Kg Plast. Vir.'
            ParentShowHint = False
            ShowHint = True
          end
          object LPastadaCantEtiquetas: TLFLabel
            Left = 946
            Top = 465
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etiq./Pastada'
          end
          object LPastadas: TLFLabel
            Left = 807
            Top = 465
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pastadas'
          end
          object LEcotasa: TLFLabel
            Left = 189
            Top = 267
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ecotasa'
          end
          object LPareto: TLFLabel
            Left = 820
            Top = 488
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pareto'
          end
          object LEstrategiaCompra: TLFLabel
            Left = 765
            Top = 509
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estrategia Compra'
          end
          object LIEPNRClaveProducto: TLFLabel
            Left = 15
            Top = 289
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = 'IEPNR - Clave Prod.'
          end
          object LIENPRKilogramos: TLFLabel
            Left = 347
            Top = 289
            Width = 16
            Height = 13
            Hint = 'Peso unitario para IEPNR'
            Alignment = taRightJustify
            Caption = 'Kg.'
            ParentShowHint = False
            ShowHint = True
          end
          object LIENPRKilogramosNoReciclados: TLFLabel
            Left = 435
            Top = 289
            Width = 67
            Height = 13
            Hint = 'Kg Plastico No Reciclable'
            Alignment = taRightJustify
            Caption = 'Kg. no Recicl.'
            ParentShowHint = False
            ShowHint = True
          end
          object LBlister: TLFLabel
            Left = 824
            Top = 531
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Blister'
          end
          object LProyecto: TLFLabel
            Left = 809
            Top = 552
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = DBEFProyectoArt
          end
          object DBEArticulo: TLFDbedit
            Left = 117
            Top = 0
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ARTICULO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 117
            Top = 22
            Width = 459
            Height = 21
            DataField = 'TITULO_LARGO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 3
            OnEnter = DBETituloEnter
          end
          object ETitFamilia: TLFEdit
            Left = 177
            Top = 44
            Width = 144
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
            OnChange = ETitFamiliaChange
          end
          object DBCBAbierto: TLFDBCheckBox
            Left = 589
            Top = 178
            Width = 170
            Height = 17
            Hint = 'El art'#237'culo tiene escandallo de venta'
            Caption = 'Tiene Escandallo de Venta'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            TabOrder = 87
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ABIERTO'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPCoste: TLFDbedit
            Left = 117
            Top = 198
            Width = 107
            Height = 21
            DataField = 'P_COSTE'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 26
          end
          object DBCBControlStock: TLFDBCheckBox
            Left = 589
            Top = 24
            Width = 170
            Height = 17
            Caption = 'Control de Stocks'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 80
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBControlStockChange
            DataField = 'CONTROL_STOCK'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFFamilia: TLFDBEditFind2000
            Left = 117
            Top = 44
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FAMILIA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 4
            OnChange = DBEFFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_FAMILIAS                   '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFFamiliaBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCompras: TLFDBEditFind2000
            Left = 117
            Top = 88
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_COMPRAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 10
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
          object ETitCompras: TLFEdit
            Left = 225
            Top = 88
            Width = 351
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
          object DBEFVentas: TLFDBEditFind2000
            Left = 117
            Top = 110
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_VENTAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 12
            OnChange = DBEFVentasChange
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
          object ETitVentas: TLFEdit
            Left = 225
            Top = 110
            Width = 351
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
          object DBEFIva: TLFDBEditFind2000
            Left = 117
            Top = 176
            Width = 39
            Height = 21
            DataField = 'TIPO_IVA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 22
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
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETipIva: TLFDbedit
            Left = 157
            Top = 176
            Width = 67
            Height = 21
            Color = clInfoBk
            DataField = 'P_IVA'
            DataSource = DMArticulos.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 23
          end
          object DBERecIva: TLFDbedit
            Left = 225
            Top = 176
            Width = 61
            Height = 21
            Color = clInfoBk
            DataField = 'P_RECARGO'
            DataSource = DMArticulos.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
          end
          object DBETitIva: TLFDbedit
            Left = 287
            Top = 176
            Width = 289
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
          end
          object DBEFUnidades: TLFDBEditFind2000
            Left = 117
            Top = 330
            Width = 37
            Height = 21
            DataField = 'UNIDADES'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 50
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_UNIDADES_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitUnidades: TLFDbedit
            Left = 155
            Top = 330
            Width = 172
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxUnidades
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 51
          end
          object DBCBVirtual: TLFDBCheckBox
            Left = 589
            Top = 68
            Width = 170
            Height = 17
            Hint = 
              'Solo realiza movimientos de stock de los componentes del escanda' +
              'llo'
            Caption = 'Virtual'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 82
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VIRTUAL'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFDisponibilidad: TLFDBEditFind2000
            Left = 117
            Top = 220
            Width = 37
            Height = 21
            DataField = 'DISPONIBILIDAD'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 31
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
            Left = 155
            Top = 220
            Width = 172
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxDisponibilidad
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 32
          end
          object DBCHKActVenta: TLFDBCheckBox
            Left = 589
            Top = 2
            Width = 170
            Height = 17
            Caption = 'Actualiza venta'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 79
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTUALIZA_VENTA'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPtoVerde: TLFDbedit
            Left = 507
            Top = 242
            Width = 69
            Height = 21
            DataField = 'PTO_VERDE'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 37
          end
          object DBEControlaUnidades: TLFDbedit
            Left = 117
            Top = 432
            Width = 37
            Height = 21
            DataField = 'CONTROLA_MEDIDAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 63
            OnChange = DBEControlaUnidadesChange
          end
          object DBCBSerizalizado: TLFDBCheckBox
            Left = 589
            Top = 90
            Width = 170
            Height = 17
            Hint = 'Serializaci'#243'n KRI'
            Caption = 'Serializado'
            ClicksDisabled = False
            ColorCheck = 57088
            ShowHint = True
            TabOrder = 83
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SERIALIZADO_KRI'
            DataSource = DMArticulos.DSQMArticulos
            ParentShowHint = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFGarantia: TLFDBEditFind2000
            Left = 117
            Top = 242
            Width = 37
            Height = 21
            DataField = 'GARANTIA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 35
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PLAZOS_GARANTIA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBETitGarantia: TLFDbedit
            Left = 155
            Top = 242
            Width = 237
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxTipoGarantia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 36
          end
          object DBCHKProduccion: TLFDBCheckBox
            Left = 589
            Top = 223
            Width = 170
            Height = 17
            Caption = 'Producci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            TabOrder = 89
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PRODUCCION'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDto: TLFDbedit
            Left = 117
            Top = 308
            Width = 69
            Height = 21
            DataField = 'DESCUENTO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 46
          end
          object DBEDto2: TLFDbedit
            Left = 187
            Top = 308
            Width = 69
            Height = 21
            DataField = 'DESCUENTO_2'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 47
          end
          object DBEDto3: TLFDbedit
            Left = 257
            Top = 308
            Width = 69
            Height = 21
            DataField = 'DESCUENTO_3'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 48
          end
          object DBCHBAplicaIVAEscandallo: TLFDBCheckBox
            Left = 589
            Top = 201
            Width = 170
            Height = 17
            Caption = 'Aplica IVA Escandallo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 88
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'IVA_ESCANDALLO'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EDMonedaEmpresa: TLFEdit
            Left = 225
            Top = 198
            Width = 61
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 27
          end
          object EDMonedaCanal: TLFEdit
            Left = 509
            Top = 198
            Width = 67
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 30
          end
          object DBEPCosteCanal: TLFDbedit
            Left = 387
            Top = 198
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'P_COSTE_CANAL'
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            ReadOnly = True
            TabOrder = 29
          end
          object DBCHKBUd_Secundaria: TLFDBCheckBox
            Left = 589
            Top = 245
            Width = 170
            Height = 17
            Caption = 'Utilizar PVP por Ud. Secund.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 90
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKBUd_SecundariaChange
            DataField = 'PVP_POR_UD_SECUNDARIA'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBLoteable: TLFDBCheckBox
            Left = 589
            Top = 46
            Width = 170
            Height = 17
            Caption = 'Control de Lotes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 81
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'LOTES'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBECampo1: TLFDbedit
            Left = 856
            Top = 0
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_1'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 100
          end
          object DBECampo2: TLFDbedit
            Left = 856
            Top = 22
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_2'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 101
          end
          object DBECampo3: TLFDbedit
            Left = 856
            Top = 44
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_3'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 102
          end
          object DBECampo4: TLFDbedit
            Left = 856
            Top = 66
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_4'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 103
          end
          object DBECampo5: TLFDbedit
            Left = 856
            Top = 88
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_5'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 104
          end
          object DBEMultiplo1: TLFDbedit
            Left = 165
            Top = 432
            Width = 60
            Height = 21
            Hint = 'La unidad extendida debera ser multiplo de este valor'
            DataField = 'MULTIPLO_1'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 64
            Visible = False
          end
          object DBEMultiplo2: TLFDbedit
            Left = 226
            Top = 432
            Width = 60
            Height = 21
            Hint = 'La unidad extendida debera ser multiplo de este valor'
            DataField = 'MULTIPLO_2'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 65
            Visible = False
          end
          object DBEMultiplo3: TLFDbedit
            Left = 287
            Top = 432
            Width = 60
            Height = 21
            Hint = 'La unidad extendida debera ser multiplo de este valor'
            DataField = 'MULTIPLO_3'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 66
            Visible = False
          end
          object DBEMultiplo4: TLFDbedit
            Left = 348
            Top = 432
            Width = 60
            Height = 21
            Hint = 'La unidad extendida debera ser multiplo de este valor'
            DataField = 'MULTIPLO_4'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 67
            Visible = False
          end
          object DBEFactorEscala: TLFDbedit
            Left = 508
            Top = 432
            Width = 68
            Height = 21
            DataField = 'FACTOR_ESCALA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 68
            Visible = False
          end
          object DBEMinimaCompra: TLFDbedit
            Left = 117
            Top = 454
            Width = 65
            Height = 21
            DataField = 'UD_MINIMO_COMPRA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 69
          end
          object DBEMinimaVenta: TLFDbedit
            Left = 311
            Top = 454
            Width = 65
            Height = 21
            DataField = 'UD_MINIMO_VENTA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 70
          end
          object DBEPeso: TLFDbedit
            Left = 117
            Top = 352
            Width = 65
            Height = 21
            DataField = 'PESO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 53
          end
          object DBECodigoIntra: TLFDbedit
            Left = 466
            Top = 308
            Width = 110
            Height = 21
            DataField = 'CODIGO_INTRA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 49
          end
          object DBEFDevVentas: TLFDBEditFind2000
            Left = 117
            Top = 154
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_DEVOLUCION_VENTAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 20
            OnChange = DBEFDevVentasChange
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
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFDevCompras: TLFDBEditFind2000
            Left = 117
            Top = 132
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_DEVOLUCION_COMPRAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 16
            OnChange = DBEFDevComprasChange
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
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitDevCompras: TLFEdit
            Left = 225
            Top = 132
            Width = 351
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object ETitDevVentas: TLFEdit
            Left = 225
            Top = 154
            Width = 351
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 21
          end
          object DBEFAbonoCompras: TLFDBEditFind2000
            Left = 117
            Top = 132
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_ABONO_COMPRAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 14
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
            Left = 117
            Top = 154
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_ABONO_VENTAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 18
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
          object ETitAbonoVentas: TLFEdit
            Left = 225
            Top = 154
            Width = 351
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object ETitAbonoCompras: TLFEdit
            Left = 225
            Top = 132
            Width = 351
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
          object DBCBUbicable: TLFDBCheckBox
            Left = 589
            Top = 112
            Width = 170
            Height = 17
            Caption = 'Ubicable'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 84
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'UBICABLE'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEVolumenUnit: TLFDbedit
            Left = 407
            Top = 352
            Width = 65
            Height = 21
            DataField = 'VOLUMEN_UNIT'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 55
          end
          object DBEDiametroUnit: TLFDbedit
            Left = 262
            Top = 352
            Width = 65
            Height = 21
            DataField = 'DIAMETRO_UNIT'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 54
          end
          object DBEDefUdSec: TLFDbedit
            Left = 508
            Top = 330
            Width = 68
            Height = 21
            DataField = 'DEFECTO_UD_SECUNDARIA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 52
          end
          object DBCHKAnticipo: TLFDBCheckBox
            Left = 589
            Top = 267
            Width = 170
            Height = 16
            Caption = 'Anticipo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 91
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKAnticipoChange
            DataField = 'ANTICIPO'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKAnticipoContado: TLFDBCheckBox
            Left = 589
            Top = 288
            Width = 170
            Height = 17
            Caption = 'Anticipo Contado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 92
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKAnticipoContadoChange
            DataField = 'ANTICIPO_CONTADO'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKAnticipoPregDatos: TLFDBCheckBox
            Left = 589
            Top = 334
            Width = 170
            Height = 17
            Caption = 'Pregunta. Datos Anticipo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 94
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ANTICIPO_PREG_DATOS'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBChkWeb: TLFDBCheckBox
            Left = 589
            Top = 356
            Width = 170
            Height = 17
            Caption = 'Web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 95
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFabricante: TLFDBEditFind2000
            Left = 117
            Top = 66
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FABRICANTE'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 8
            OnChange = DBEFabricanteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            CampoADevolver = 'TERCERO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitFabricante: TLFDbedit
            Left = 177
            Top = 66
            Width = 399
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_FABRICANTE'
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object DBCBNoCalculaStockMinMax: TLFDBCheckBox
            Left = 589
            Top = 134
            Width = 170
            Height = 17
            Caption = 'No Calcula Stock Min.Max.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 85
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_CALCULA_STOCKMINMAX'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKBaja: TLFDBCheckBox
            Left = 799
            Top = 332
            Width = 70
            Height = 17
            Caption = 'Baja'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 117
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKBajaChange
            DataField = 'BAJA'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 877
            Top = 330
            Width = 87
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = DMArticulos.DSQMArticulos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 118
          end
          object DBCHKCantidadLimitada: TLFDBCheckBox
            Left = 955
            Top = 178
            Width = 110
            Height = 17
            Caption = 'Cantidad limitada'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 109
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'CANTIDAD_LIMITADA'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFClaveADR: TLFDBEditFind2000
            Left = 856
            Top = 176
            Width = 65
            Height = 21
            DataField = 'TIPO_CLAVE_ADR'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 108
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ADR_TIPOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'UN_NUMBER')
            CampoNum = 'ID'
            CampoStr = 'NAME'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object Z_DescTipoArt: TLFHYDBDescription
            Left = 148
            Top = 498
            Width = 90
            Height = 21
            Color = clInfoBk
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 75
            Tabla_a_buscar = 'SYS_TIPOS_ARTICULO_TYC'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_ARTICULO_TYC')
            CamposWhereTabla.Strings = (
              'TIPO_ARTICULO_TYC')
          end
          object Z_DBEFTipoArt: TLFDBEditFind2000
            Left = 117
            Top = 498
            Width = 30
            Height = 21
            DataField = 'TIPO_ARTICULO_TYC'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 74
            OnChange = Z_DBEFTipoArtChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPOS_ARTICULO_TYC'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_ARTICULO_TYC'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO_ARTICULO_TYC')
            Filtros = []
          end
          object DBCBPreparable: TLFDBCheckBox
            Left = 398
            Top = 478
            Width = 91
            Height = 17
            Caption = 'Preparable'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 73
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'Z_PREPARABLE'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEMerma: TLFDbedit
            Left = 117
            Top = 476
            Width = 65
            Height = 21
            DataField = 'Z_MERMA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 71
          end
          object DBCHKCompoMotor: TLFDBCheckBox
            Left = 214
            Top = 478
            Width = 131
            Height = 17
            Caption = 'Componente tipo motor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 72
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'COMPONENTE_MOTOR'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PCToldosYCortinas: TLFPageControl
            Left = 239
            Top = 496
            Width = 506
            Height = 75
            ActivePage = TSLama
            OwnerDraw = True
            Style = tsFlatButtons
            TabOrder = 78
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSTipoKit: TTabSheet
              Caption = 'TSTipoKit'
              TabVisible = False
              object Z_LblKitColor: TLFLabel
                Left = 151
                Top = 25
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Color'
              end
              object Z_LblKitTipo: TLFLabel
                Left = 24
                Top = 25
                Width = 21
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo'
              end
              object Z_LblFamilia: TLFLabel
                Left = 15
                Top = 4
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Familia'
              end
              object Z_DBEFKitColor: TLFDBEditFind2000
                Left = 180
                Top = 22
                Width = 50
                Height = 21
                DataField = 'Z_TIPO_LACADO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 2
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
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object Z_DBCBVKitTipo: TDBComboBoxValue
                Left = 51
                Top = 22
                Width = 93
                Height = 21
                Style = csDropDownList
                DataField = 'Z_KIT_TIPO'
                DataSource = DMArticulos.DSQMArticulos
                DropDownCount = 3
                ItemHeight = 13
                Items.Strings = (
                  'MO - Motor'
                  'MA - M'#225'quina'
                  'NO - Nada')
                Values.Strings = (
                  'MO'
                  'MA'
                  'NO')
                TabOrder = 1
              end
              object Z_DBEFFamilia: TLFDBEditFind2000
                Left = 51
                Top = 0
                Width = 59
                Height = 21
                CharCase = ecUpperCase
                DataField = 'FAMILIA'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 0
                OnChange = DBEFFamiliaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = True
                Tabla_a_buscar = 'ART_FAMILIAS                   '
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'FAMILIA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = DBEFFamiliaBusqueda
                OrdenadoPor.Strings = (
                  'FAMILIA')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object Z_ETitFamilia: TLFEdit
                Left = 111
                Top = 0
                Width = 354
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
              object DBCBQuitarSiMotor: TLFDBCheckBox
                Left = 238
                Top = 24
                Width = 183
                Height = 17
                Caption = 'Quitar de escandallo si hay motor'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'Z_QUITAR_SI_HAY_MOTOR'
                DataSource = DMArticulos.DSQMArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEFSusituto: TLFDBEditFind2000
                Left = 364
                Top = 22
                Width = 101
                Height = 21
                DataField = 'Z_SUSTITUTO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 4
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'TIPO_ARTICULO_TYC="C" or TIPO_ARTICULO_TYC="K"'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
            end
            object TSTipoComponente: TTabSheet
              Caption = 'TSTipoComponente'
              ImageIndex = 1
              TabVisible = False
              object Z_LblTipoLacado: TLFLabel
                Left = 208
                Top = 4
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Lacado'
              end
              object ZLbTipoLacado: TLFLabel
                Left = 330
                Top = 3
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Lacado Forzado'
              end
              object LLargoTipoComponente: TLFLabel
                Left = 380
                Top = 25
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'Largo'
              end
              object Z_DBChkBLacado: TLFDBCheckBox
                Left = 0
                Top = 3
                Width = 58
                Height = 17
                Caption = 'Lacado'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'Z_LACADO'
                DataSource = DMArticulos.DSQMArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object Z_DBChkBCorte: TLFDBCheckBox
                Left = 0
                Top = 24
                Width = 50
                Height = 17
                Caption = 'Corte'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 4
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'Z_CORTE'
                DataSource = DMArticulos.DSQMArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object Z_DBEFTipoLacado: TLFDBEditFind2000
                Left = 273
                Top = 0
                Width = 50
                Height = 21
                DataField = 'Z_TIPO_LACADO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 2
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
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object Z_DBChkBQuitarSiMotor: TLFDBCheckBox
                Left = 48
                Top = 24
                Width = 112
                Height = 17
                Caption = 'Quitar si hay motor'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 5
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'Z_QUITAR_SI_HAY_MOTOR'
                DataSource = DMArticulos.DSQMArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object Z_DBESustituto: TLFDBEditFind2000
                Left = 273
                Top = 22
                Width = 97
                Height = 21
                DataField = 'Z_SUSTITUTO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 7
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'TIPO_ARTICULO_TYC="C"'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = []
              end
              object ZLbEfTipoLacado: TLFDBEditFind2000
                Left = 414
                Top = 0
                Width = 83
                Height = 21
                DataField = 'Z_TIPO_LACADO_FORZADO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 3
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
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object ZCbForzarLacado: TLFDBCheckBox
                Left = 75
                Top = 3
                Width = 99
                Height = 17
                Caption = 'Lacado Forzado'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'Z_FORZAR_LACADO_SN'
                DataSource = DMArticulos.DSQMArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBELargoTipoComponente: TLFDbedit
                Left = 414
                Top = 22
                Width = 83
                Height = 21
                DataField = 'Z_LAM_LARGO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 8
              end
              object Z_DBChkBQuitarSiManual: TLFDBCheckBox
                Left = 157
                Top = 24
                Width = 112
                Height = 17
                Caption = 'Quitar si es manual'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 6
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'Z_QUITAR_SI_ES_MANUAL'
                DataSource = DMArticulos.DSQMArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object TSTipoLona: TTabSheet
              Caption = 'TSTipoLona'
              ImageIndex = 2
              TabVisible = False
              object LblLonaTipo: TLFLabel
                Left = 6
                Top = 4
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Lona'
              end
              object LblFormaLona: TLFLabel
                Left = 240
                Top = 4
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Forma'
              end
              object LblModeloLona: TLFLabel
                Left = 20
                Top = 25
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Modelo'
              end
              object LblConfeccionLona: TLFLabel
                Left = 187
                Top = 25
                Width = 81
                Height = 13
                Alignment = taRightJustify
                Caption = 'Confecci'#243'n Lona'
              end
              object LblColorHilo: TLFLabel
                Left = 355
                Top = 25
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Color Hilo'
              end
              object LRibeteDefecto: TLFLabel
                Left = 1
                Top = 48
                Width = 54
                Height = 13
                Hint = 'Ribete Defecto'
                Alignment = taRightJustify
                Caption = 'Ribete Def.'
              end
              object LColorLona: TLFLabel
                Left = 234
                Top = 44
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Colores'
              end
              object Z_DBEFTipoLona: TLFDBEditFind2000
                Left = 58
                Top = 0
                Width = 34
                Height = 21
                DataField = 'Z_LONA_TIPO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 0
                OnChange = Z_DBEFTipoLonaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_LONAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object Z_DBEFFormaLona: TLFDBEditFind2000
                Left = 272
                Top = 0
                Width = 34
                Height = 21
                DataField = 'Z_LONA_FORMA'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 1
                OnChange = Z_DBEFFormaLonaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_LONAS_FORMA'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object Z_DescTipoLona: TLFHYDBDescription
                Left = 93
                Top = 0
                Width = 113
                Height = 21
                Color = clInfoBk
                DataSource = DMArticulos.DSQMArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                Tabla_a_buscar = 'Z_SYS_LONAS'
                Campo_Descripcion = 'DESCRIPCION'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'Z_LONA_TIPO')
                CamposWhereTabla.Strings = (
                  'CODIGO')
              end
              object Z_DescFormaLona: TLFHYDBDescription
                Left = 307
                Top = 0
                Width = 135
                Height = 21
                Color = clInfoBk
                DataSource = DMArticulos.DSQMArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                Tabla_a_buscar = 'Z_SYS_LONAS_FORMA'
                Campo_Descripcion = 'DESCRIPCION'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'Z_LONA_FORMA')
                CamposWhereTabla.Strings = (
                  'CODIGO')
              end
              object Z_DBEModeloLona: TLFDbedit
                Left = 58
                Top = 22
                Width = 79
                Height = 21
                CharCase = ecUpperCase
                DataField = 'Z_LONA_MODELO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 2
              end
              object Z_DBEFConfeccionLona: TLFDBEditFind2000
                Left = 272
                Top = 22
                Width = 34
                Height = 21
                DataField = 'Z_LONA_CONFECCION'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 3
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_AUXILIARES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                CondicionBusqueda = 'tipo_aux="CFL"'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object DBEFColorHilo: TLFDBEditFind2000
                Left = 405
                Top = 22
                Width = 37
                Height = 21
                BevelEdges = []
                DataField = 'COD_COLOR_HILO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 4
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_RIBETES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object DBEFRibeteDefecto: TLFDBEditFind2000
                Left = 58
                Top = 44
                Width = 34
                Height = 21
                DataField = 'Z_RIBETE_DEFECTO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 7
                OnChange = DBEFRibeteDefectoChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_RIBETES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object LFHYDBDRibeteDefecto: TLFHYDBDescription
                Left = 93
                Top = 44
                Width = 113
                Height = 21
                Color = clInfoBk
                DataSource = DMArticulos.DSQMArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
                Tabla_a_buscar = 'Z_SYS_RIBETES'
                Campo_Descripcion = 'DESCRIPCION'
                Base_de_datos = DMMain.DataBase
                CamposWhereOrigen.Strings = (
                  'Z_RIBETE_DEFECTO')
                CamposWhereTabla.Strings = (
                  'CODIGO')
              end
              object DBEFLonaColor1: TLFDBEditFind2000
                Left = 272
                Top = 44
                Width = 56
                Height = 21
                DataField = 'Z_LON_COLOR_1'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 9
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'ART_COLORES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'COD_COLOR'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'COD_COLOR')
                Filtros = []
              end
              object DBEFLonaColor2: TLFDBEditFind2000
                Left = 329
                Top = 44
                Width = 56
                Height = 21
                DataField = 'Z_LON_COLOR_2'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 10
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'ART_COLORES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'COD_COLOR'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'COD_COLOR')
                Filtros = []
              end
              object DBEFLonaColor3: TLFDBEditFind2000
                Left = 386
                Top = 44
                Width = 56
                Height = 21
                DataField = 'Z_LON_COLOR_3'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 11
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'ART_COLORES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'COD_COLOR'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'COD_COLOR')
                Filtros = []
              end
            end
            object TSTipoArmazon: TTabSheet
              Caption = 'TSTipoArmazon'
              ImageIndex = 3
              TabVisible = False
              object Z_LblModelo: TLFLabel
                Left = 14
                Top = 4
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Modelo'
              end
              object Z_LblSalida: TLFLabel
                Left = 222
                Top = 4
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Salida'
              end
              object Z_LblLinea: TLFLabel
                Left = 124
                Top = 4
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'L'#237'nea'
              end
              object Z_DBEFModelo: TLFDBEditFind2000
                Left = 53
                Top = 0
                Width = 50
                Height = 21
                DataField = 'Z_MODELO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_MODELOS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object Z_DBEFSalida: TLFDBEditFind2000
                Left = 255
                Top = 0
                Width = 50
                Height = 21
                DataField = 'Z_SALIDA'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 2
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_MODELOS_DET'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'SALIDA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = Z_DBEFSalidaBusqueda
                OrdenadoPor.Strings = (
                  'SALIDA')
                Filtros = []
              end
              object Z_DBEFLinea: TLFDBEditFind2000
                Left = 154
                Top = 0
                Width = 50
                Height = 21
                DataField = 'Z_LINEA'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 1
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'Z_SYS_MODELOS_DET'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'LINEA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = Z_DBEFLineaBusqueda
                OrdenadoPor.Strings = (
                  'LINEA')
                Filtros = []
              end
            end
            object TSTipoToldo: TTabSheet
              Caption = 'TSTipoToldo'
              TabVisible = False
              object Z_LblArmazon: TLFLabel
                Left = 14
                Top = 4
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'Armaz'#243'n'
              end
              object Z_LblLona: TLFLabel
                Left = 178
                Top = 4
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Lona'
                Visible = False
              end
              object Z_DBEFArmazon: TLFDBEditFind2000
                Left = 58
                Top = 0
                Width = 103
                Height = 21
                DataField = 'Z_ARMAZON'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'TIPO_ARTICULO_TYC="A"'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object Z_DBEFLona: TLFDBEditFind2000
                Left = 207
                Top = 0
                Width = 103
                Height = 21
                DataField = 'Z_LONA'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 1
                Visible = False
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'TIPO_ARTICULO_TYC="L"'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'ARTICULO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
            end
            object TSLama: TTabSheet
              Caption = 'TSLama'
              TabVisible = False
              object LLargoLama: TLFLabel
                Left = 18
                Top = 26
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'Largo'
              end
              object LColor: TLFLabel
                Left = 132
                Top = 3
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Color'
              end
              object LAnchoTyC: TLFLabel
                Left = 14
                Top = 3
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ancho'
              end
              object Z_DescColor: TLFHYDBDescription
                Left = 214
                Top = 0
                Width = 140
                Height = 21
                Color = clInfoBk
                DataSource = DMArticulos.DSQMArticulos
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
                  'Z_LAM_COLOR')
                CamposWhereTabla.Strings = (
                  'CODIGO')
              end
              object Z_DBColor: TLFDBEditFind2000
                Left = 160
                Top = 0
                Width = 53
                Height = 21
                DataField = 'Z_LAM_COLOR'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 2
                OnChange = Z_DBColorChange
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
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object Z_DBAncho: TLFDbedit
                Left = 48
                Top = 0
                Width = 63
                Height = 21
                DataField = 'Z_LAM_ANCHO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 0
              end
              object DBELargoLama: TLFDbedit
                Left = 48
                Top = 22
                Width = 63
                Height = 21
                DataField = 'Z_LAM_LARGO'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 1
              end
            end
          end
          object DBEUltimaModificacion: TLFDbedit
            Left = 464
            Top = 0
            Width = 112
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'ULT_MODIFICACION'
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            TabOrder = 2
          end
          object DBEFSubfamilia: TLFDBEditFind2000
            Left = 372
            Top = 44
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SUBFAMILIA'
            DataSource = DMArticulos.DSQMArticulos
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
            SalirSiVacio = False
            OnBusqueda = DBEFSubfamiliaBusqueda
            OrdenadoPor.Strings = (
              'ORDEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitSubfamilia: TLFEdit
            Left = 432
            Top = 44
            Width = 144
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
          object DBECampo6: TLFDbedit
            Left = 856
            Top = 110
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_6'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 105
          end
          object Z_DescSubTipoArt: TLFHYDBDescription
            Left = 148
            Top = 520
            Width = 90
            Height = 21
            Color = clInfoBk
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 77
            Tabla_a_buscar = 'SYS_SUBTIPOS_ARTICULO_TYC'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'SUBTIPO_ARTICULO_TYC'
              'TIPO_ARTICULO_TYC')
            CamposWhereTabla.Strings = (
              'SUBTIPO_ARTICULO_TYC'
              'TIPO_ARTICULO_TYC')
          end
          object Z_DBEFSubTipoArt: TLFDBEditFind2000
            Left = 117
            Top = 520
            Width = 30
            Height = 21
            DataField = 'SUBTIPO_ARTICULO_TYC'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 76
            OnChange = Z_DBEFSubTipoArtChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_SUBTIPOS_ARTICULO_TYC'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SUBTIPO_ARTICULO_TYC'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = Z_DBEFSubTipoArtBusqueda
            OrdenadoPor.Strings = (
              'SUBTIPO_ARTICULO_TYC')
            Filtros = []
          end
          object CBExportar: TLFDBCheckBox
            Left = 589
            Top = 378
            Width = 170
            Height = 17
            Caption = 'Exportar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 96
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EXPORTAR'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBECosteAdicional: TLFDbedit
            Left = 386
            Top = 198
            Width = 68
            Height = 21
            DataField = 'COSTE_ADICIONAL'
            DataSource = DMArticulos.DSQMArticulos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
          end
          object DBECampo7: TLFDbedit
            Left = 856
            Top = 132
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_7'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 106
          end
          object DBECampo8: TLFDbedit
            Left = 856
            Top = 154
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALFA_8'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 107
          end
          object DBEMotivoBaja: TLFDbedit
            Left = 856
            Top = 352
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MOTIVO_BAJA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 119
          end
          object DBEADRBulto: TLFDbedit
            Left = 856
            Top = 198
            Width = 339
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ADR_PACKAGE'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 110
          end
          object DBEFTipoArticulo: TLFDBEditFind2000
            Left = 856
            Top = 220
            Width = 37
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO_ARTICULO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 111
            OnChange = DBEFTipoArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_TIPO_ARTICULO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitTipoArticulo: TLFEdit
            Left = 894
            Top = 220
            Width = 301
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 112
          end
          object DBEMotivoBloqueoCompras: TLFDbedit
            Left = 856
            Top = 264
            Width = 338
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MOTIVO_BLOQUEO_COMPRAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 114
          end
          object DBCBBloqueoCompras: TLFDBComboBoxValue
            Left = 856
            Top = 242
            Width = 195
            Height = 21
            Hint = 'Tipo de bloqueo'
            DataField = 'BLOQUEO_COMPRAS'
            DataSource = DMArticulos.DSQMArticulos
            ItemHeight = 13
            Items.Strings = (
              'Sin mensaje'
              'Avisar'
              'Bloquear')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 113
          end
          object DBEMotivoBloqueoVentas: TLFDbedit
            Left = 856
            Top = 308
            Width = 338
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MOTIVO_BLOQUEO_VENTAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 116
          end
          object DBCBBloqueoVentas: TLFDBComboBoxValue
            Left = 856
            Top = 286
            Width = 195
            Height = 21
            Hint = 'Tipo de bloqueo'
            DataField = 'BLOQUEO_VENTAS'
            DataSource = DMArticulos.DSQMArticulos
            ItemHeight = 13
            Items.Strings = (
              'Sin mensaje'
              'Avisar'
              'Bloquear')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 115
          end
          object DBCBTipoRegistroFitosanitario: TLFDBComboBoxValue
            Left = 856
            Top = 374
            Width = 121
            Height = 21
            Hint = 'Tipo de registro fitosanitario'
            DataField = 'TIPO_REGISTRO_FITOSANITARIO'
            DataSource = DMArticulos.DSQMArticulos
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
            TabOrder = 120
          end
          object DBCPreparable: TLFDBCheckBox
            Left = 589
            Top = 156
            Width = 170
            Height = 17
            Caption = 'Preparable en pedidos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 86
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PREPARABLE'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEListrosPorUnidad: TLFDbedit
            Left = 117
            Top = 410
            Width = 65
            Height = 21
            DataField = 'LITROS_POR_UNIDAD'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 60
          end
          object DBEFTipoIBAE: TLFDBEditFind2000
            Left = 262
            Top = 410
            Width = 37
            Height = 21
            DataField = 'TIPO_IBAE'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 61
            OnChange = DBEFTipoIBAEChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_IBAE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFTipoIBAEBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoIBAE: TLFEdit
            Left = 300
            Top = 410
            Width = 172
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
            ReadOnly = True
            TabOrder = 62
          end
          object EMarca: TLFEdit
            Left = 914
            Top = 396
            Width = 280
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 122
          end
          object DBEFIdMarca: TLFDBEditFind2000
            Left = 856
            Top = 396
            Width = 57
            Height = 21
            DataField = 'ID_MARCA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 121
            OnChange = DBEFIdMarcaChange
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
            OrdenadoPor.Strings = (
              'TITULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFFormulaDefecto: TLFDBEditFind2000
            Left = 856
            Top = 418
            Width = 57
            Height = 21
            DataField = 'FORMULA_DEFECTO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 123
            OnChange = DBEFFormulaDefectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_FORMULAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_FORMULA'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID_FORMULA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFormulaDefecto: TLFEdit
            Left = 914
            Top = 418
            Width = 280
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 124
          end
          object DBEFTipoImpuestoAdicional: TLFDBEditFind2000
            Left = 856
            Top = 440
            Width = 57
            Height = 21
            DataField = 'TIPO_IMPUESTO_ADICIONAL'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 125
            OnChange = DBEFTipoImpuestoAdicionalChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_TIPO_IMPUESTO_ADICIONAL'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'PORCENTAJE')
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoImpuestoAdicional: TLFEdit
            Left = 914
            Top = 440
            Width = 280
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 126
          end
          object DBCBGenerarPedidoSiempre: TLFDBCheckBox
            Left = 589
            Top = 310
            Width = 170
            Height = 17
            Hint = 
              'Unidades a Pedir en Trasp. PEC a PEP/OFP no tiene en cuenta el s' +
              'tock.'#13#10'Unidades a Pedir = Unidades.'
            Caption = 'Generar Pedido Siempre'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 93
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GENERAR_PEDIDO_COMPRA_SIEMPRE'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFSeccion: TLFDBEditFind2000
            Left = 394
            Top = 220
            Width = 37
            Height = 21
            DataField = 'SECCION'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 33
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
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'SECCION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFactorUnidad: TLFDbedit
            Left = 508
            Top = 352
            Width = 68
            Height = 21
            DataField = 'FACTOR_UNIDAD'
            DataSource = DMArticulos.DSQMArticulos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 56
          end
          object ETituloSeccion: TLFEdit
            Left = 432
            Top = 220
            Width = 144
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
            ReadOnly = True
            TabOrder = 34
          end
          object DBCBNoAplicaDescLineaCliente: TLFDBCheckBox
            Left = 589
            Top = 402
            Width = 170
            Height = 17
            Caption = 'No aplica desc. linea cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 97
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_APLICA_DESC_LINEA_CLIENTE'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAncho: TLFDbedit
            Left = 262
            Top = 388
            Width = 65
            Height = 21
            DataField = 'ANCHO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 58
          end
          object DBEAlto: TLFDbedit
            Left = 117
            Top = 388
            Width = 65
            Height = 21
            DataField = 'ALTO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 57
          end
          object DBEFondo: TLFDbedit
            Left = 407
            Top = 388
            Width = 65
            Height = 21
            DataField = 'FONDO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 59
          end
          object DBEFechaAlta: TLFDbedit
            Left = 351
            Top = 0
            Width = 112
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            TabOrder = 1
          end
          object DBETasaDestruccion: TLFDbedit
            Left = 117
            Top = 264
            Width = 69
            Height = 21
            DataField = 'TASA_DE_DESTRUCCION'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 38
          end
          object DBEImporteIEPNR: TLFDbedit
            Left = 368
            Top = 264
            Width = 69
            Height = 21
            DataField = 'IMPORTE_IEPNR'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 40
          end
          object DBEKgPlasticoVirgen: TLFDbedit
            Left = 507
            Top = 264
            Width = 69
            Height = 21
            DataField = 'KG_PLASTICO_VIRGEN'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 41
          end
          object DBEPastadas: TLFDbedit
            Left = 856
            Top = 462
            Width = 57
            Height = 21
            DataField = 'PASTADAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 127
          end
          object DBEPastadaCantEtiquetas: TLFDbedit
            Left = 1016
            Top = 462
            Width = 57
            Height = 21
            DataField = 'PASTADA_CANT_ETIQUETAS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 128
          end
          object DBEEcotasa: TLFDbedit
            Left = 233
            Top = 264
            Width = 69
            Height = 21
            DataField = 'ECOTASA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 39
          end
          object DBCBInfluyeMargen: TLFDBCheckBox
            Left = 589
            Top = 424
            Width = 170
            Height = 17
            Caption = 'Influye Margen'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 98
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INFLUYE_MARGEN'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFEstrategiaCompra: TLFDBEditFind2000
            Left = 856
            Top = 506
            Width = 37
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ESTRATEGIA_COMPRA'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 130
            OnChange = DBEFEstrategiaCompraChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_ESTRATEGIA_COMPRA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ESTRATEGIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'ESTRATEGIA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EEstrategiaCompra: TLFEdit
            Left = 894
            Top = 506
            Width = 301
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 131
          end
          object DBEPareto: TLFDbedit
            Left = 856
            Top = 484
            Width = 57
            Height = 21
            DataField = 'PARETO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 129
          end
          object DBEFIEPNRClaveProducto: TLFDBEditFind2000
            Left = 117
            Top = 286
            Width = 37
            Height = 21
            DataField = 'IEPNR_CLAVE_PRODUCTO'
            DataSource = DMArticulos.DSQMArticulos
            ParentShowHint = False
            ShowHint = True
            TabOrder = 42
            OnChange = DBEFIEPNRClaveProductoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IEPNR_CLAVE_PRODUCTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object EIEPNRClaveProducto: TLFEdit
            Left = 155
            Top = 286
            Width = 171
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
            ReadOnly = True
            TabOrder = 43
          end
          object DBEIENPRKilogramos: TLFDbedit
            Left = 368
            Top = 286
            Width = 69
            Height = 21
            DataField = 'IEPNR_KILOGRAMOS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 44
          end
          object DBEIENPRKilogramosNoReciclados: TLFDbedit
            Left = 507
            Top = 286
            Width = 69
            Height = 21
            DataField = 'IEPNR_KILOGRAMOS_NO_RECICLADOS'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 45
          end
          object DBCBRequiereLoteSimple: TLFDBCheckBox
            Left = 589
            Top = 445
            Width = 170
            Height = 17
            Caption = 'Requiere Lote Simple'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 99
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'REQUIERE_LOTE_SIMPLE'
            DataSource = DMArticulos.DSQMArticulos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFBlister: TLFDBEditFind2000
            Left = 857
            Top = 528
            Width = 96
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BLISTER'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 132
            OnChange = DBEFBlisterChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFBlisterBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EBlister: TLFEdit
            Left = 954
            Top = 528
            Width = 240
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 133
            OnChange = ETitFamiliaChange
          end
          object DBEFProyectoArt: TLFDBEditFind2000
            Left = 857
            Top = 550
            Width = 56
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMArticulos.DSQMArticulos
            TabOrder = 134
            OnChange = DBEFProyectoArtChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EProyecto: TLFEdit
            Left = 912
            Top = 550
            Width = 282
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 135
          end
        end
      end
      object TSIdioma: TTabSheet [1]
        Caption = '&Idioma'
        ImageIndex = 12
        OnShow = TSIdiomaShow
        object PNIdiomas: TLFPanel
          Left = 0
          Top = 21
          Width = 1197
          Height = 562
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGFIdiomas: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 1197
            Height = 233
            Align = alTop
            DataSource = DMArticulos.DSQMIdiomas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColEnter = DBGFIdiomasColEnter
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
              'IDIOMA')
            CamposAMostrar.Strings = (
              'IDIOMA'
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
              'IDIOMA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_IDIOMAS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFIdiomasBusqueda
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              '')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'IDIOMA'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Visible = True
              end>
          end
          object PNLDescripcionExtendida: TLFPanel
            Left = 0
            Top = 233
            Width = 1197
            Height = 329
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBREIdioma: TDBRichEdit
              Left = 0
              Top = 24
              Width = 1197
              Height = 305
              Align = alClient
              DataField = 'DESCRIPCION_EXTENDIDA'
              DataSource = DMArticulos.DSQMIdiomas
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              PlainText = True
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = DBRENotasComprasEnter
              OnSelectionChange = DBREIdiomaSelectionChange
            end
            object TBIdioma: TLFToolBar
              Left = 0
              Top = 0
              Width = 1197
              Height = 24
              AutoSize = True
              EdgeInner = esNone
              EdgeOuter = esNone
              Images = DMMain.ToolbarImages
              TabOrder = 1
              Visible = False
              Separators = True
              object TButtIdiomaNegrita: TToolButton
                Left = 0
                Top = 2
                Action = FMain.RichEditBold1
              end
              object TButtIdiomaCursiva: TToolButton
                Left = 23
                Top = 2
                Action = FMain.RichEditItalic1
              end
              object TButtIdiomaSubrayado: TToolButton
                Left = 46
                Top = 2
                Action = FMain.RichEditUnderline1
              end
              object TButtSep4: TToolButton
                Left = 69
                Top = 2
                Width = 8
                Style = tbsSeparator
                Visible = False
              end
              object TButtIdiomaAlinIzq: TToolButton
                Left = 77
                Top = 2
                Action = FMain.RichEditAlignLeft1
              end
              object TButtIdiomaAlinCentr: TToolButton
                Left = 100
                Top = 2
                Action = FMain.RichEditAlignCenter1
              end
              object TButtIdiomaAlinDer: TToolButton
                Left = 123
                Top = 2
                Action = FMain.RichEditAlignRight1
              end
              object TButtSep5: TToolButton
                Left = 146
                Top = 2
                Width = 8
                Style = tbsSeparator
                Visible = False
              end
              object TButtIdiomaBullet: TToolButton
                Left = 154
                Top = 2
                Action = FMain.RichEditBullets1
              end
              object TButtIdiomaSep3: TToolButton
                Left = 177
                Top = 2
                Width = 8
                Style = tbsSeparator
                Visible = False
              end
              object CBFontName: TLFComboBox
                Left = 185
                Top = 2
                Width = 192
                Height = 21
                ItemHeight = 13
                TabOrder = 1
                Text = 'Nombre de la fuente'
                OnChange = CBFontNameChange
              end
              object TButtSep6: TToolButton
                Left = 377
                Top = 2
                Width = 8
                Style = tbsSeparator
              end
              object PNLTamanoIdioma: TLFPanel
                Left = 385
                Top = 2
                Width = 40
                Height = 22
                TabOrder = 0
                object EFontSize: TLFEdit
                  Left = 1
                  Top = 0
                  Width = 24
                  Height = 21
                  TabOrder = 0
                  Text = '0'
                  OnChange = EFontSizeNotasChange
                end
                object UpDownFontSize: TUpDown
                  Left = 25
                  Top = 0
                  Width = 15
                  Height = 21
                  Associate = EFontSize
                  Min = 0
                  Position = 0
                  TabOrder = 1
                  Wrap = True
                end
              end
            end
          end
        end
        object TBIdiomas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNIdiomas1: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETitArticulo: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBETitArtic: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavIdiomas: THYMNavigator
            Left = 425
            Top = 0
            Width = 240
            Height = 21
            DataSource = DMArticulos.DSQMIdiomas
            Flat = True
            ParentShowHint = False
            PopupMenu = CEIdiomasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEIdiomas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSHistCost: TTabSheet [2]
        Caption = '&His. Coste'
        ImageIndex = 2
        OnShow = TSHistCostShow
        object HYTDBGHistCoste: THYTDBGrid
          Left = 0
          Top = 22
          Width = 1197
          Height = 561
          Align = alClient
          DataSource = DMArticulos.DSxHistCoste
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
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Width = 139
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'USUARIO'
              Width = 215
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MAQUINA'
              Width = 240
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              Title.Alignment = taRightJustify
              Width = 147
              Visible = True
            end>
        end
        object PNLTitHist: TLFPanel
          Left = 0
          Top = 0
          Width = 1197
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBExCod: TLFDbedit
            Left = 0
            Top = 0
            Width = 120
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = DMArticulos.DSQMArticulos
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
          object DBExTitulo: TLFDbedit
            Left = 121
            Top = 0
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSQMArticulos
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
      object TSStocks: TTabSheet [3]
        Caption = '&Stocks'
        ImageIndex = -1
        OnShow = TSStocksShow
        object PCStocks: TLFPageControl
          Left = 81
          Top = 22
          Width = 1116
          Height = 535
          ActivePage = TSStocksStock
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabPosition = tpBottom
          OnChanging = PCStocksChanging
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSStocksStock: TTabSheet
            Caption = 'Stock'
            object PNLEStocks: TLFPanel
              Left = 0
              Top = 0
              Width = 1108
              Height = 509
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGStocks: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 1108
                Height = 509
                Align = alClient
                DataSource = DMArticulos.DSQMArtStocks
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGStocksDrawColumnCell
                OnDblClick = DBGStocksDblClick
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = False
                Changed = False
                Idioma = 'CAS'
                AutoCambiarColumna = False
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
                  'ARTICULO')
                CamposAMostrar.Strings = (
                  'ARTICULO'
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
                  'AVISO_STOCK_MINIMO'
                  'ALMACEN_DEFECTO')
                ColumnasChecked.Strings = (
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
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
                Planes.Strings = (
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  'ARTICULO')
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TITULO_ALM'
                    ReadOnly = True
                    Width = 270
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALMACEN_DEFECTO'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AVISO_STOCK_MINIMO'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STOCK_MINIMO'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STOCK_MAXIMO'
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clAqua
                    Expanded = False
                    FieldName = 'PEDIDOS_A_PRO'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clAqua
                    Expanded = False
                    FieldName = 'PEDIDOS_D_CLI'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'EXISTENCIAS'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LANZADAS'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'STOCK_REAL'
                    PopupMenu = CEArticuloCEPMEdit
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'STOCK_VIRTUAL'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PREPARACION'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end>
              end
            end
          end
          object TSStocksUbicaciones: TTabSheet
            Caption = 'Stock Ubicaciones'
            ImageIndex = 1
            OnShow = TSStocksUbicacionesShow
            object PNLStockUbicaciones: TLFPanel
              Left = 0
              Top = 0
              Width = 1108
              Height = 509
              Align = alClient
              BevelOuter = bvNone
              BiDiMode = bdRightToLeftReadingOnly
              ParentBiDiMode = False
              TabOrder = 0
              object DBGStockUbicacion: THYTDBGrid
                Left = 0
                Top = 25
                Width = 1108
                Height = 484
                Align = alClient
                Color = clInfoBk
                DataSource = DMArticulos.DSQMStockUbicaciones
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGStockUbicacionDrawColumnCell
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_UBICACION'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CALLE'
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTANTERIA'
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REPISA'
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'POSICION'
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTICULO'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMPOSICION'
                    Width = 98
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_COMP'
                    Width = 116
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ENTRADAS'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALIDAS'
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'EXISTENCIAS'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DISPONIBLE'
                    Width = 55
                    Visible = True
                  end>
              end
              object TBStockUbicaciones: TLFToolBar
                Left = 0
                Top = 0
                Width = 1108
                Height = 25
                AutoSize = True
                EdgeBorders = [ebBottom]
                EdgeInner = esNone
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 1
                Separators = True
                object NavStockUbicacion: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 125
                  Height = 22
                  DataSource = DMArticulos.DSQMStockUbicaciones
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
                object TSep7: TToolButton
                  Left = 125
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtRecalculaUbicaciones: TToolButton
                  Left = 133
                  Top = 2
                  Action = ARecalculaStockUbicaciones
                end
                object TSep10: TToolButton
                  Left = 156
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtIniciaRecalculo: TToolButton
                  Left = 164
                  Top = 2
                  Action = AIniciaRecalculo
                end
                object TButtParaRecalculo: TToolButton
                  Left = 187
                  Top = 2
                  Action = AParaRecalculo
                end
                object cbSoloUbicacionConStock: TLFCheckBox
                  Left = 210
                  Top = 2
                  Width = 180
                  Height = 22
                  Caption = 'Solo Ubicacion con Stock'
                  Checked = True
                  State = cbChecked
                  ClicksDisabled = False
                  ColorCheck = 57088
                  Layout = checkboxRight
                  TabOrder = 1
                  TabStop = True
                  Alignment = taLeftJustify
                  OnChange = cbSoloUbicacionConStockChange
                end
              end
            end
          end
          object TSStocksLote: TTabSheet
            Caption = 'Stocks Lote'
            ImageIndex = 2
            OnShow = TSStocksLoteShow
            object PNLStockLote: TLFPanel
              Left = 0
              Top = 0
              Width = 1108
              Height = 509
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBStockLote: THYTDBGrid
                Left = 0
                Top = 25
                Width = 1108
                Height = 484
                Align = alClient
                Color = clInfoBk
                DataSource = DMArticulos.DSNrosLote
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBStockLoteCellClick
                OnDrawColumnCell = DBGStockMovimientosDrawColumnCell
                OnDblClick = DBStockLoteDblClick
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CANAL'
                    Width = 22
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_LOTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LOTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CLASIFICACION'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'STOCK'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_UBICACION'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CALLE'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTANTERIA'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REPISA'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'POSICION'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'F_ENVASADO'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'F_CADUCIDAD'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'F_FABRICACION'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SERIE'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AUTO_REETIQUETADO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PROVEEDOR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VOLUMEN_MAX'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DIAMETRO_MAX'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_MAX'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VOLUMEN_ACC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_ACC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DIAMETRO_ACC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMPOSICION'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'GENERAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES_ACC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SECTOR'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DISPONIBLE'
                    Visible = True
                  end>
              end
              object TBStockLote: TLFToolBar
                Left = 0
                Top = 0
                Width = 1108
                Height = 25
                AutoSize = True
                EdgeBorders = [ebBottom]
                EdgeInner = esNone
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 1
                Separators = True
                object NavStockLote: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 125
                  Height = 22
                  DataSource = DMArticulos.DSNrosLote
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
                object TSep9: TToolButton
                  Left = 125
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object cbSoloLoteConStock: TLFCheckBox
                  Left = 133
                  Top = 2
                  Width = 180
                  Height = 22
                  Caption = 'Solo Ubicacion con Stock'
                  Checked = True
                  State = cbChecked
                  ClicksDisabled = False
                  ColorCheck = 57088
                  Layout = checkboxRight
                  TabOrder = 1
                  TabStop = True
                  Alignment = taLeftJustify
                  OnChange = cbSoloUbicacionConStockChange
                end
              end
            end
          end
          object TSStockNroSerieKRI: TTabSheet
            Caption = 'Stock Nro. Serie'
            ImageIndex = 3
            OnShow = TSStockNroSerieKRIShow
            object DBStockSerieKRI: THYTDBGrid
              Left = 0
              Top = 25
              Width = 1299
              Height = 431
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMNroSerieKRI
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
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
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NRO_SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN_ENT'
                  Width = 73
                  Visible = True
                end>
            end
            object TBStockSerieKRI: TLFToolBar
              Left = 0
              Top = 0
              Width = 1299
              Height = 25
              AutoSize = True
              EdgeBorders = [ebBottom]
              EdgeInner = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object NavStockSerieKRI: THYMNavigator
                Left = 0
                Top = 2
                Width = 125
                Height = 22
                DataSource = DMArticulos.DSQMNroSerieKRI
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
            end
          end
          object TSStockNroSerie: TTabSheet
            Caption = 'Stock Nro. Serie'
            OnShow = TSStockNroSerieShow
            object TBStockSerie: TLFToolBar
              Left = 0
              Top = 0
              Width = 1331
              Height = 25
              AutoSize = True
              EdgeBorders = [ebBottom]
              EdgeInner = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavStockSerie: THYMNavigator
                Left = 0
                Top = 2
                Width = 125
                Height = 22
                DataSource = DMArticulos.DSQMNroSerie
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
              object B1: TToolButton
                Left = 125
                Top = 2
                Width = 8
                Style = tbsSeparator
              end
              object TButtRecalculaStockNroSerie: TToolButton
                Left = 133
                Top = 2
                Hint = 'Recalcular Stock Nro. Serie'
                Caption = 'Recalcular Stock Nro. Serie'
                ImageIndex = 3
                ParentShowHint = False
                ShowHint = True
                OnClick = TButtRecalculaStockNroSerieClick
              end
            end
            object DBStockSerie: THYTDBGrid
              Left = 0
              Top = 25
              Width = 1331
              Height = 404
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMNroSerie
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBStockSerieDrawColumnCell
              OnDblClick = DBStockSerieDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NSERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_CADUCIDAD'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_GARANTIA_CLIENTE'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_GARANTIA_PROVEEDOR'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLIENTE_REPARACION'
                  Width = 60
                  Visible = True
                end>
            end
          end
          object TSStockFuturo: TTabSheet
            Caption = 'Stock a Futuro'
            ImageIndex = 6
            OnShow = TSStockFuturoShow
            object TBStockFuturo: TLFToolBar
              Left = 0
              Top = 0
              Width = 1299
              Height = 25
              AutoSize = True
              EdgeBorders = [ebBottom]
              EdgeInner = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavStockFuturo: THYMNavigator
                Left = 0
                Top = 2
                Width = 125
                Height = 22
                DataSource = DMArticulos.DSQMStockFuturo
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
              object TSep6: TToolButton
                Left = 125
                Top = 2
                Width = 8
                Style = tbsSeparator
              end
              object CBSepararAlmacenes: TLFCheckBox
                Left = 133
                Top = 2
                Width = 164
                Height = 22
                Caption = 'Separar Almacenes'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 1
                TabStop = True
                OnClick = CBSepararAlmacenesClick
                Alignment = taLeftJustify
              end
              object LColorLanzada: TLFLabel
                Left = 297
                Top = 2
                Width = 70
                Height = 22
                Alignment = taCenter
                AutoSize = False
                Caption = 'Lanzada'
                Color = clLime
                ParentColor = False
                Layout = tlCenter
              end
              object LColorReservada: TLFLabel
                Left = 367
                Top = 2
                Width = 70
                Height = 22
                Alignment = taCenter
                AutoSize = False
                Caption = 'Reservada'
                Color = clSkyBlue
                ParentColor = False
                Layout = tlCenter
              end
              object LColorCerradaParcialmente: TLFLabel
                Left = 437
                Top = 2
                Width = 70
                Height = 22
                Alignment = taCenter
                AutoSize = False
                Caption = 'Cerrada Parc.'
                Color = clFuchsia
                ParentColor = False
                Layout = tlCenter
              end
            end
            object DBGStockFuturo: THYTDBGrid
              Left = 0
              Top = 25
              Width = 1299
              Height = 431
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMStockFuturo
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGStockFuturoCellClick
              OnDrawColumnCell = DBGStockFuturoDrawColumnCell
              OnDblClick = DBGStockFuturoDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Width = 110
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOCUMENTO'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANTIDAD'
                  Width = 70
                  Visible = True
                end
                item
                  Color = clYellow
                  Expanded = False
                  FieldName = 'STOCK'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CLI_PRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SU_REFERENCIA'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_ENTREGA_PREV'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_ENTREGA_PREV_DET'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_CONF'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_CONF_DET'
                  Width = 90
                  Visible = True
                end>
            end
          end
          object TSMovimientosStock: TTabSheet
            Caption = 'Movimientos'
            OnShow = TSMovimientosStockShow
            object DBGStockMovimientos: THYTDBGrid
              Left = 0
              Top = 24
              Width = 1108
              Height = 485
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMMovimientosStock
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGStockMovimientosCellClick
              OnDrawColumnCell = DBGStockMovimientosDrawColumnCell
              OnDblClick = DBGStockMovimientosDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPO_OPER'
                  Width = 41
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_LOTE'
                  Width = 48
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SALIDAS'
                  Visible = True
                end
                item
                  Color = clYellow
                  Expanded = False
                  FieldName = 'STOCK'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOC_TIPO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOC_SERIE'
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOC_NUMERO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REF_PEDIDO'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CLI_PRO'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_CLI_PRO'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO_SIN_DTO'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMENTARIO'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_2'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASIFICACION'
                  Width = 100
                  Visible = True
                end>
            end
            object TBStockMovimientos: TLFToolBar
              Left = 0
              Top = 0
              Width = 1108
              Height = 24
              AutoSize = True
              EdgeBorders = []
              EdgeInner = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object NavStockMovimientos: THYMNavigator
                Left = 0
                Top = 2
                Width = 125
                Height = 22
                DataSource = DMArticulos.DSQMMovimientosStock
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
              object PNLStockMovimientosPMP: TLFPanel
                Left = 125
                Top = 2
                Width = 185
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object CBCalcularPMPMovimientos: TLFCheckBox
                  Left = 10
                  Top = 3
                  Width = 175
                  Height = 17
                  Caption = 'Calcular PMP de Movimientos'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 0
                  TabStop = True
                  Alignment = taLeftJustify
                  OnChange = CBCalcularPMPMovimientosChange
                end
              end
            end
          end
        end
        object TBStocks: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLCabStocks: TLFPanel
            Left = 0
            Top = 0
            Width = 513
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBExTitStk: TLFDbedit
              Left = 121
              Top = 0
              Width = 392
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBExCodStk: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = DBExCodStkChange
            end
          end
          object TButtSep2: TToolButton
            Left = 513
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavStocks: THYMNavigator
            Left = 521
            Top = 0
            Width = 132
            Height = 22
            DataSource = DMArticulos.DSQMArtStocks
            VisibleButtons = [nbPrior, nbNext, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEStocksPMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavStocksBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGStocks
            Exclusivo = False
            ControlEdit = CEStocks
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavStocksClickAfterAdjust
          end
          object TSep11: TToolButton
            Left = 653
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object TButtRecalcularStock: TToolButton
            Left = 661
            Top = 0
            Hint = 'Recalcula stock del articulo en el almacen'
            Caption = 'Recalcular Stock'
            ImageIndex = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtRecalcularStockClick
          end
          object TButtHistPrecios: TToolButton
            Left = 684
            Top = 0
            Hint = 'Hist'#243'rico de Precios'
            Caption = 'AHistPrecios'
            ImageIndex = 56
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object TBCalculaStockMinMaxKri: TToolButton
            Left = 707
            Top = 0
            Action = ACalculaStockMinMax
          end
          object TBStockTyC: TToolButton
            Left = 730
            Top = 0
            Action = AStockTyC
          end
        end
        object PNLStocksAlmacen: TLFPanel
          Left = 0
          Top = 22
          Width = 81
          Height = 535
          Align = alLeft
          BevelOuter = bvNone
          BorderWidth = 2
          TabOrder = 2
          object PNLTitStocksalmacenBotom: TLFPanel
            Left = 2
            Top = 513
            Width = 77
            Height = 20
            Align = alBottom
            BevelOuter = bvNone
            Color = clAppWorkSpace
            Enabled = False
            TabOrder = 0
          end
          object DBGStocksAlmacen: TDBGridFind2000
            Left = 2
            Top = 2
            Width = 77
            Height = 511
            Align = alClient
            Color = clInfoBk
            DataSource = DMArticulos.DSQMArtStocks
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
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Width = 36
                Visible = True
              end>
          end
        end
        object PNLStockTiendaVirtual: TLFPanel
          Left = 0
          Top = 557
          Width = 1197
          Height = 26
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            1197
            26)
          object LStockTiendaVirtual: TLFLabel
            Left = 945
            Top = 6
            Width = 96
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Stock Tienda Virtual'
          end
          object LEStockTiendaVirtual: TLFLabel
            Left = 1050
            Top = 2
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            ParentColor = False
            Layout = tlCenter
          end
        end
      end
      object TSFabricacion: TTabSheet [4]
        Caption = 'F&abric.'
        ImageIndex = 6
        OnResize = TSFabricacionResize
        OnShow = TSFabricacionShow
        object DBCtrlFabricacion: TLFDBCtrlGrid
          Left = 0
          Top = 67
          Width = 1197
          Height = 516
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          DataSource = DMArticulos.DSQMArtStocks
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 34
          PanelWidth = 1181
          ParentFont = False
          TabOrder = 0
          RowCount = 15
          SelectedColor = clHighlight
          object DBEFabAlmacen: TLFDbedit
            Left = 4
            Top = 2
            Width = 41
            Height = 21
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = DMArticulos.DSQMArtStocks
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEFabAlmDesc: TLFDbedit
            Left = 46
            Top = 2
            Width = 173
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_ALM'
            DataSource = DMArticulos.DSQMArtStocks
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEExistencias: TLFDbedit
            Left = 220
            Top = 2
            Width = 99
            Height = 21
            Color = clInfoBk
            DataField = 'EXISTENCIAS'
            DataSource = DMArticulos.DSQMArtStocks
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEFabricables: TLFDbedit
            Left = 320
            Top = 2
            Width = 99
            Height = 21
            Hint = 
              'Fabricaci'#243'n sin tener en cuenta la posible fabricaci'#243'n de su esc' +
              'andallo'
            Color = clInfoBk
            DataField = 'fabricables'
            DataSource = DMArticulos.DSQMArtStocks
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object DBEExistFabr: TLFDbedit
            Left = 420
            Top = 2
            Width = 99
            Height = 21
            Hint = 'Fabricaci'#243'n contando la fabricaci'#243'n de sus componentes'
            TabStop = False
            Color = clInfoBk
            DataField = 'ExistFabr'
            DataSource = DMArticulos.DSQMArtStocks
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 4
          end
        end
        object PNLFabricar2: TLFPanel
          Left = 0
          Top = 48
          Width = 1197
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Color = clAppWorkSpace
          Enabled = False
          TabOrder = 1
          object LFabricacionAlmacen: TLFLabel
            Left = 4
            Top = 3
            Width = 41
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Almac'#233'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LFabricacionTitulo: TLFLabel
            Left = 49
            Top = 3
            Width = 170
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'T'#237'tulo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLExistencias: TLFLabel
            Left = 221
            Top = 3
            Width = 100
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Existencias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLFabricables: TLFLabel
            Left = 321
            Top = 3
            Width = 99
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fabr. Directa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLFabrNiveles: TLFLabel
            Left = 420
            Top = 3
            Width = 90
            Height = 13
            Alignment = taCenter
            Caption = 'Fabr. Otros Niveles'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
        object TBFabricacion1: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 24
          ButtonHeight = 23
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 2
          Separators = True
          object PNLFabricar4: TLFPanel
            Left = 0
            Top = 0
            Width = 522
            Height = 23
            BevelOuter = bvNone
            TabOrder = 2
            object DBEArticuloFab: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBETituloArtFab: TLFDbedit
              Left = 121
              Top = 0
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object TSep12: TToolButton
            Left = 522
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object HYMNavFabricar: THYMNavigator
            Left = 530
            Top = 0
            Width = 66
            Height = 23
            VisibleButtons = [nbPrior, nbNext, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFabricacionPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEFabricacion
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TSep3: TToolButton
            Left = 596
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object PNLFabricar3: TLFPanel
            Left = 604
            Top = 0
            Width = 24
            Height = 23
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              24
              23)
            object SBFabricacion: TSpeedButton
              Left = 0
              Top = 0
              Width = 23
              Height = 23
              Hint = 'Fabricaci'#243'n de Art'#237'culos'
              AllowAllUp = True
              Anchors = [akLeft, akTop, akBottom]
              GroupIndex = 1
              Flat = True
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = TBFabricarClick
            end
          end
          object PNLFabricar5: TLFPanel
            Left = 628
            Top = 0
            Width = 24
            Height = 23
            BevelOuter = bvNone
            TabOrder = 3
            DesignSize = (
              24
              23)
            object SBDesFabricacion: TSpeedButton
              Left = 0
              Top = 0
              Width = 23
              Height = 23
              Hint = 'Desfabricaci'#243'n de Art'#237'culos'
              AllowAllUp = True
              Anchors = [akLeft, akTop, akBottom]
              GroupIndex = 1
              Flat = True
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = SBDesfabricacionClick
            end
          end
        end
        object PNLFabricar1: TLFPanel
          Left = 0
          Top = 24
          Width = 1197
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object LBLAFabricar: TLFLabel
            Left = 224
            Top = 5
            Width = 147
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero de Art'#237'culos a Fabricar'
          end
          object EDFabricar: TLFEdit
            Left = 378
            Top = 1
            Width = 83
            Height = 21
            TabOrder = 0
            OnChange = EDFabricarChange
          end
          object EDTUnidadesExt: TLFEdit
            Left = 462
            Top = 1
            Width = 84
            Height = 21
            TabStop = False
            Color = clInfoBk
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
      object TSPrecios: TTabSheet [5]
        Caption = '&Precios'
        OnShow = TSPreciosShow
        object TBPrecios: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLCabPrecios: TLFPanel
            Left = 0
            Top = 0
            Width = 521
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBExCodTar: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBExTitTar: TLFDbedit
              Left = 121
              Top = 0
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object TButtSep7: TToolButton
            Left = 521
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavPreciosBase: THYMNavigator
            Left = 529
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMArticulos.DSQMArticulosPrecios
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPreciosBasePMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFTipoPrecioBase
            Exclusivo = True
            ControlEdit = CEPreciosBase
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TButtSep8: TToolButton
            Left = 617
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object TButtRecalcula: TToolButton
            Left = 625
            Top = 0
            Hint = 'Recalcula tabla de precios base'
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object TButtMargen: TToolButton
            Left = 648
            Top = 0
            Hint = 'Propaga el margen a todas las Tarifas'
            ImageIndex = 21
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
        end
        object PNLEPrecios: TLFPanel
          Left = 0
          Top = 141
          Width = 1197
          Height = 442
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGTarifasPrecios: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 1197
            Height = 420
            Align = alClient
            DataSource = DMArticulos.DSQMArticuloTarifas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGTarifasPreciosCellClick
            OnColEnter = DBGTarifasPreciosColEnter
            OnKeyDown = DBGTarifasPreciosKeyDown
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 7
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = True
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
            CamposAOrdernar.Strings = (
              'CALCULO'
              'TARIFA'
              'TITULO_CALCULO'
              'UNID_MAXIMAS'
              'UNID_MINIMAS'
              'PRECIO_BASE'
              'PRECIO_VENTA')
            ColumnasCheckBoxes.Strings = (
              'BLOQUEADO')
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
                FieldName = 'TARIFA'
                ReadOnly = True
                Width = 32
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CALCULO'
                ReadOnly = True
                Width = 27
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_CALCULO'
                ReadOnly = True
                Width = 145
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_COMPRA'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_COMPRA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_COMPRA_2'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_COMPRA_3'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRECIO_COSTE'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MONEDA'
                ReadOnly = True
                Width = 26
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNID_MINIMAS'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNID_MAXIMAS'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRECIO_BASE_MONEDA'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEN'
                Width = 41
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COMISION'
                ReadOnly = True
                Width = 47
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COMISION_CANAL'
                ReadOnly = True
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_VENTA_MONEDA'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_VENTA'
                Visible = False
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRECIO_VENTA_CANAL'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BLOQUEADO'
                Width = 28
                Visible = True
              end
              item
                Color = clMoneyGreen
                Expanded = False
                FieldName = 'PRECIO_SIN_IVA'
                Width = 75
                Visible = True
              end
              item
                Color = clMoneyGreen
                Expanded = False
                FieldName = 'PRECIO_CON_IVA'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MARGEN_PC'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MARGEN_PV'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_TARIFA'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_ARTICULO_TARIFA'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ACTIVA'
                Width = 30
                Visible = True
              end>
          end
          object TBPreciosDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 1197
            Height = 22
            AutoSize = True
            EdgeBorders = [ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 1
            Separators = True
            object NavPrecios: THYMNavigator
              Left = 0
              Top = 0
              Width = 176
              Height = 22
              DataSource = DMArticulos.DSQMArticuloTarifas
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEPreciosPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGTarifasPrecios
              InsertaControl = DBGTarifasPrecios
              OnClickBefore = NavPreciosClickBefore
              Exclusivo = True
              ControlEdit = CEPrecios
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object PNLBlister: TLFPanel
              Left = 176
              Top = 0
              Width = 552
              Height = 22
              BevelOuter = bvNone
              Color = clYellow
              Enabled = False
              TabOrder = 1
              object LBlisterPrecio: TLFLabel
                Left = 11
                Top = 4
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'Blister'
              end
              object EBlisterPrecio: TLFEdit
                Left = 45
                Top = 1
                Width = 96
                Height = 21
                CharCase = ecUpperCase
                Color = clInfoBk
                ReadOnly = True
                TabOrder = 0
              end
              object ETituloBlisterPrecio: TLFEdit
                Left = 142
                Top = 1
                Width = 317
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
              object EPrecioBlisterPrecio: TLFEdit
                Left = 460
                Top = 1
                Width = 88
                Height = 21
                CharCase = ecUpperCase
                Color = clInfoBk
                ReadOnly = True
                TabOrder = 2
              end
            end
          end
        end
        object PNLPrecios: TLFPanel
          Left = 0
          Top = 22
          Width = 1197
          Height = 119
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object LBLTipoPrecioBase: TLFLabel
            Left = 7
            Top = 9
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Precio Base'
          end
          object LBLMargen: TLFLabel
            Left = 375
            Top = 32
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen'
          end
          object LBLPrecioEntrada: TLFLabel
            Left = 196
            Top = 53
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio Entrada'
          end
          object LBLPrecioUltEntrada: TLFLabel
            Left = 169
            Top = 75
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = #218'lt. Entrada s/Desc.'
          end
          object LBLPrecioUltVenta: TLFLabel
            Left = 173
            Top = 96
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio '#218'ltima Venta'
          end
          object LBLPrecioPMP: TLFLabel
            Left = 356
            Top = 53
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio PMP'
          end
          object LBLPrecioLIFO: TLFLabel
            Left = 356
            Top = 75
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio LIFO'
          end
          object LBLPrecioFIFO: TLFLabel
            Left = 356
            Top = 97
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio FIFO'
          end
          object LBLPrecioMercado: TLFLabel
            Left = 494
            Top = 52
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio Mercado'
          end
          object LBLPrecioManual: TLFLabel
            Left = 501
            Top = 74
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio Manual'
          end
          object LBLPuntos: TLFLabel
            Left = 536
            Top = 97
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Puntos'
          end
          object LCanalCalculo: TLFLabel
            Left = 23
            Top = 31
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal C'#225'lculo'
          end
          object LAlmacenCalculo: TLFLabel
            Left = 208
            Top = 31
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. C'#225'lculo'
          end
          object LTipoRedondeo: TLFLabel
            Left = 340
            Top = 9
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Redondeo'
          end
          object LProrrateoKri: TLFLabel
            Left = 693
            Top = 10
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prorrateo'
            Visible = False
          end
          object LPMP_Prorrateo: TLFLabel
            Left = 668
            Top = 32
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'P.Coste+Prorr.'
            Visible = False
          end
          object LPCostePrecios: TLFLabel
            Left = 48
            Top = 54
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste'
          end
          object LCosteAdicionalPrecio: TLFLabel
            Left = 35
            Top = 76
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste Adic.'
          end
          object LCosteMasCAdicional: TLFLabel
            Left = 0
            Top = 98
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste + C. Adic.'
          end
          object LFechaUltimaFacturaVenta: TLFLabel
            Left = 837
            Top = 58
            Width = 110
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Ult. Factura Venta'
          end
          object LFechaUltimoAlbaranVenta: TLFLabel
            Left = 837
            Top = 36
            Width = 110
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Ult. Albaran Venta'
          end
          object LFechaUltimaFacturaCompra: TLFLabel
            Left = 829
            Top = 102
            Width = 118
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Ult. Factura Compra'
          end
          object LFechaUltimoAlbaranCompra: TLFLabel
            Left = 829
            Top = 80
            Width = 118
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Ult. Albaran Compra'
          end
          object LPrecioReposicion: TLFLabel
            Left = 669
            Top = 96
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio Repos.'
          end
          object LGama: TLFLabel
            Left = 708
            Top = 53
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gama'
          end
          object LPrecioBaseReposicion: TLFLabel
            Left = 647
            Top = 75
            Width = 89
            Height = 13
            Hint = 'Precio Base Reposicion'
            Alignment = taRightJustify
            Caption = 'Prec. Base Repos.'
          end
          object DBCBActTarAutom: TLFDBCheckBox
            Left = 573
            Top = 31
            Width = 97
            Height = 17
            Caption = 'Act. Tar. Autom.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACT_TAR_AUTOM'
            DataSource = DMArticulos.DSQMArticulosPrecios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEMargen: TLFDbedit
            Left = 417
            Top = 28
            Width = 68
            Height = 21
            DataField = 'MARGEN'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 6
          end
          object DBEPrecioEntrada: TLFDbedit
            Left = 271
            Top = 50
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_ENTRADA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object DBEPrecioUltEntrada: TLFDbedit
            Left = 271
            Top = 72
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_ULT_ENTRADA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBEPrecioUltVenta: TLFDbedit
            Left = 271
            Top = 94
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_ULT_VENTA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBEPrecioPMP: TLFDbedit
            Left = 417
            Top = 50
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_PMP'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBEPrecioLIFO: TLFDbedit
            Left = 417
            Top = 72
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_LIFO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object DBEPrecioFIFO: TLFDbedit
            Left = 417
            Top = 94
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_FIFO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
          end
          object DBEPrecioMercado: TLFDbedit
            Left = 573
            Top = 50
            Width = 68
            Height = 21
            DataField = 'PRECIO_MERCADO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 17
          end
          object DBEPrecioManual: TLFDbedit
            Left = 573
            Top = 72
            Width = 68
            Height = 21
            DataField = 'PRECIO_MANUAL'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 18
          end
          object DBEPuntos: TLFDbedit
            Left = 573
            Top = 94
            Width = 68
            Height = 21
            DataField = 'PUNTOS'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 19
          end
          object DBEFTipoPrecioBase: TLFDBEditFind2000
            Left = 93
            Top = 6
            Width = 45
            Height = 21
            DataField = 'TIPO_PRECIO_BASE'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 0
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
          object DBEFCanalCalculo: TLFDBEditFind2000
            Left = 93
            Top = 28
            Width = 68
            Height = 21
            DataField = 'CANAL_CALCULO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAlmCalculo: TLFDBEditFind2000
            Left = 271
            Top = 28
            Width = 68
            Height = 21
            DataField = 'ALMACEN_CALCULO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFTipoRedondeo: TLFDBEditFind2000
            Left = 417
            Top = 6
            Width = 45
            Height = 21
            DataField = 'TIPO_REDONDEO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 2
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
            Left = 463
            Top = 6
            Width = 200
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxTiposRedondeos
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
          object DBEProrrateoKri: TLFDbedit
            Left = 741
            Top = 6
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PRORRATEO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
            Visible = False
          end
          object DBETitTipoPrecioBase: TLFDbedit
            Left = 139
            Top = 6
            Width = 200
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxTiposPreciosBase
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
          object RMEPMP_Prorrateo: TLFDbedit
            Left = 741
            Top = 28
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'PMP_MAS_PRORRATEO'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
            Visible = False
          end
          object DBEPCostePrecios: TLFDbedit
            Left = 93
            Top = 50
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBECosteAdicionalPrecio: TLFDbedit
            Left = 93
            Top = 72
            Width = 68
            Height = 21
            DataField = 'COSTE_ADICIONAL'
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object DBEPCosteMasAdicional: TLFDbedit
            Left = 93
            Top = 94
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'P_COSTE_MAS_ADICIONAL'
            DataSource = DMArticulos.DSQMArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBEFechaUltimaFacturaVenta: TLFDbedit
            Left = 951
            Top = 54
            Width = 80
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'FECHA_ULT_FACTURA_VENTA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            TabOrder = 24
          end
          object DBEFechaUltimoAlbaranVenta: TLFDbedit
            Left = 951
            Top = 32
            Width = 80
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'FECHA_ULT_ALBARAN_VENTA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            TabOrder = 23
          end
          object DBEFechaUltimaFacturaCompra: TLFDbedit
            Left = 951
            Top = 98
            Width = 80
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'FECHA_ULT_FACTURA_COMPRA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            TabOrder = 26
          end
          object DBEFechaUltimoAlbaranCompra: TLFDbedit
            Left = 951
            Top = 76
            Width = 80
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'FECHA_ULT_ALBARAN_COMPRA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            Enabled = False
            TabOrder = 25
          end
          object DBEPrecioReposicion: TLFDbedit
            Left = 741
            Top = 94
            Width = 68
            Height = 21
            DataField = 'PRECIO_REPOSICION'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 22
          end
          object DBEFGama: TLFDBEditFind2000
            Left = 741
            Top = 50
            Width = 68
            Height = 21
            DataField = 'GAMA'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 20
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_GAMAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'GAMA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'GAMA')
            Filtros = []
          end
          object DBEPrecioBaseReposicion: TLFDbedit
            Left = 741
            Top = 72
            Width = 68
            Height = 21
            DataField = 'PRECIO_BASE_REPOSICION'
            DataSource = DMArticulos.DSQMArticulosPrecios
            TabOrder = 21
          end
        end
      end
      object TSCondiciones: TTabSheet [6]
        Caption = 'Condiciones'
        ImageIndex = 19
        OnShow = TSCondicionesShow
        object TBCondiciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 22
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLCondiciones: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETituloCondiciones: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBEArticuloCondiciones: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavCondiciones: THYMNavigator
            Left = 425
            Top = 0
            Width = 120
            Height = 22
            DataSource = DMArticulos.DSxCondiciones
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = PMUnidadesLogisitcas
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGCondiciones: THYTDBGrid
          Left = 0
          Top = 22
          Width = 1197
          Height = 561
          Align = alClient
          Color = clInfoBk
          DataSource = DMArticulos.DSxCondiciones
          DefaultDrawing = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGCondicionesDrawColumnCell
          OnDblClick = DBGCondicionesDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'AGRUPACION'
            'ALTA'
            'BAJA'
            'CLIENTE'
            'DESCUENTO'
            'DESCUENTO_2'
            'DESCUENTO_3'
            'FAMILIA'
            'LINEA'
            'PERFIL'
            'PRECIO'
            'RIG'
            'TIPO'
            'TITULO_CLIENTE')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CLIENTE'
              Width = 214
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERFIL'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGRUPACION'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNID_MINIMAS'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNID_MAXIMAS'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_2'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_3'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Width = 80
              Visible = True
            end>
        end
      end
      object TSProveedores: TTabSheet [7]
        Caption = 'P&rov.'
        OnResize = TSProveedoresResize
        OnShow = TSProveedoresShow
        object PCProveedores: TLFPageControl
          Left = 0
          Top = 0
          Width = 1197
          Height = 583
          ActivePage = TSPedidosProv
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSPedidosProv: TTabSheet
            Caption = 'Pedidos'
            OnShow = TSPedidosProvShow
            object PNLProveedores: TLFPanel
              Left = 0
              Top = 0
              Width = 1189
              Height = 557
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object TBProv: TLFToolBar
                Left = 0
                Top = 0
                Width = 1189
                Height = 23
                EdgeBorders = [ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object PNLCabProveedores: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 523
                  Height = 22
                  Align = alLeft
                  BevelOuter = bvNone
                  Enabled = False
                  TabOrder = 0
                  object DBExTitProv: TLFDbedit
                    Left = 122
                    Top = 1
                    Width = 400
                    Height = 21
                    AutoSize = False
                    Color = clInfoBk
                    DataField = 'TITULO'
                    DataSource = DMArticulos.DSQMArticulos
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object DBExCodProv: TLFDbedit
                    Left = 1
                    Top = 1
                    Width = 120
                    Height = 21
                    Color = clInfoBk
                    DataField = 'ARTICULO'
                    DataSource = DMArticulos.DSQMArticulos
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
                object TButtSep9: TToolButton
                  Left = 523
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object NavProv: THYMNavigator
                  Left = 531
                  Top = 0
                  Width = 176
                  Height = 22
                  DataSource = DMArticulos.DSQMProveedores
                  VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
                  Align = alClient
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEProveedoresPMEdit
                  ShowHint = True
                  TabOrder = 1
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBE_Prov_Prioridad
                  InsertaControl = DBE_Prov_Codigo
                  OnClickBefore = NavProvClickBefore
                  Exclusivo = False
                  ControlEdit = CEProveedores
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
              object PNLTitProveedores: TLFPanel
                Left = 0
                Top = 23
                Width = 1189
                Height = 19
                Align = alTop
                BevelOuter = bvNone
                Color = clAppWorkSpace
                Enabled = False
                TabOrder = 1
                object LBLProv: TLFLabel
                  Left = 4
                  Top = 3
                  Width = 81
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Prov.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LBLTituloProv: TLFLabel
                  Left = 86
                  Top = 3
                  Width = 173
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Titulo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LBLPrioridad: TLFLabel
                  Left = 260
                  Top = 3
                  Width = 46
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Prioridad'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LBLPedMinimo: TLFLabel
                  Left = 307
                  Top = 3
                  Width = 71
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Ped. Minimo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LBLPedOptimo: TLFLabel
                  Left = 379
                  Top = 3
                  Width = 71
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Ped. Optimo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LBLActivo: TLFLabel
                  Left = 607
                  Top = 3
                  Width = 35
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Activo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LBLDiasEntrega: TLFLabel
                  Left = 523
                  Top = 3
                  Width = 71
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dias Entrega'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LBLIncrPedido: TLFLabel
                  Left = 451
                  Top = 3
                  Width = 71
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Incr. Pedido'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object PNLEProveedores: TLFPanel
                Left = 0
                Top = 42
                Width = 1189
                Height = 515
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 2
                object DBCGProveedores: TLFDBCtrlGrid
                  Left = 0
                  Top = 0
                  Width = 1189
                  Height = 515
                  Align = alClient
                  AllowDelete = False
                  AllowInsert = False
                  ColCount = 1
                  Color = clBtnFace
                  DataSource = DMArticulos.DSQMProveedores
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  PanelHeight = 34
                  PanelWidth = 1173
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  RowCount = 15
                  SelectedColor = clHighlight
                  OnEnter = DBCGProveedoresEnter
                  object DBE_Prov_Codigo: TLFDBEditFind2000
                    Left = 4
                    Top = 2
                    Width = 81
                    Height = 21
                    Color = clInfoBk
                    DataField = 'PROVEEDOR'
                    DataSource = DMArticulos.DSQMProveedores
                    Enabled = False
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    AutoCambiarFoco = False
                    Base_de_datos = DMMain.DataBase
                    BuscarNums = False
                    Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
                    Tabla_asociada.DesplegarBusqueda = False
                    CampoNum = 'PROVEEDOR'
                    CampoStr = 'TITULO'
                    ReemplazarCaracter = True
                    SalirSiNoExiste = False
                    SalirSiVacio = False
                    OrdenadoPor.Strings = (
                      'PROVEEDOR')
                    Filtros = [obEmpresa]
                    Entorno = DMMain.EntornoBusqueda
                  end
                  object DBE_Prov_Titulo: TLFDbedit
                    Left = 86
                    Top = 2
                    Width = 173
                    Height = 21
                    Color = clInfoBk
                    DataField = 'TITULO'
                    DataSource = DMArticulos.DSQMProveedores
                    Enabled = False
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                  end
                  object DBE_Prov_PedMin: TLFDbedit
                    Left = 307
                    Top = 2
                    Width = 71
                    Height = 21
                    DataField = 'PEDIDO_MINIMO'
                    DataSource = DMArticulos.DSQMProveedores
                    TabOrder = 3
                  end
                  object DBE_Prov_PedOpt: TLFDbedit
                    Left = 379
                    Top = 2
                    Width = 71
                    Height = 21
                    DataField = 'PEDIDO_OPTIMO'
                    DataSource = DMArticulos.DSQMProveedores
                    TabOrder = 4
                  end
                  object DBCB_Prov_Activo: TLFDBCheckBox
                    Left = 618
                    Top = 4
                    Width = 20
                    Height = 17
                    ClicksDisabled = False
                    ColorCheck = 57088
                    TabOrder = 6
                    TabStop = True
                    OnExit = DBCB_Prov_ActivoExit
                    Alignment = taLeftJustify
                    DataField = 'ACTIVO'
                    DataSource = DMArticulos.DSQMProveedores
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                  end
                  object DBE_Prov_Prioridad: TLFDbedit
                    Left = 260
                    Top = 2
                    Width = 46
                    Height = 21
                    DataField = 'PRIORIDAD'
                    DataSource = DMArticulos.DSQMProveedores
                    TabOrder = 2
                  end
                  object DBE_Prov_Incr: TLFDbedit
                    Left = 451
                    Top = 2
                    Width = 71
                    Height = 21
                    DataField = 'INCR_PEDIDO'
                    DataSource = DMArticulos.DSQMProveedores
                    TabOrder = 5
                  end
                  object DBE_Dias_Entrega: TLFDbedit
                    Left = 523
                    Top = 2
                    Width = 71
                    Height = 21
                    DataField = 'DIAS_ENTREGA'
                    DataSource = DMArticulos.DSQMProveedores
                    TabOrder = 7
                  end
                end
              end
            end
          end
          object TSCodigoProv: TTabSheet
            Caption = 'C'#243'digos Proveedor'
            ImageIndex = 1
            OnShow = TSCodigoProvShow
            object PNLCodigoProv: TLFPanel
              Left = 0
              Top = 0
              Width = 1189
              Height = 533
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object TBCodigoProveedor: TLFToolBar
                Left = 0
                Top = 0
                Width = 1189
                Height = 22
                AutoSize = True
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object PNLTBCodProv: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 524
                  Height = 22
                  BevelOuter = bvNone
                  TabOrder = 0
                  object DBExCodProvCod: TLFDbedit
                    Left = 1
                    Top = 1
                    Width = 120
                    Height = 21
                    Color = clInfoBk
                    DataField = 'ARTICULO'
                    DataSource = DMArticulos.DSQMArticulos
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object DBExCodProvTit: TLFDbedit
                    Left = 122
                    Top = 1
                    Width = 400
                    Height = 21
                    AutoSize = False
                    Color = clInfoBk
                    DataField = 'TITULO'
                    DataSource = DMArticulos.DSQMArticulos
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
                object TBCopiaAModelo: TToolButton
                  Left = 524
                  Top = 0
                  Hint = 'Copia codigos de proveedor al resto de articulos del Modelo'
                  Caption = 'Copia a Modelo'
                  ImageIndex = 86
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = TBCopiaAModeloClick
                end
              end
              object DBGFProvArt: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 1189
                Height = 511
                Align = alClient
                DataSource = DMArticulos.DSQMProvArt
                Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
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
                  'PROVEEDOR')
                CamposAMostrar.Strings = (
                  'PROVEEDOR'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0')
                CamposADevolver.Strings = (
                  'PROVEEDOR')
                CamposDesplegar.Strings = (
                  '1')
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                Numericos.Strings = (
                  'PROVEEDOR')
                SalirSiVacio = False
                SalirSiNoExiste = True
                Tablas.Strings = (
                  'VER_PROVEEDORES_CUENTAS')
                Titulos.Strings = (
                  'TITULO')
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'PROVEEDOR'
                    Width = 71
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'NOMBRE_PROVEEDOR'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 218
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_PROVEEDOR'
                    Width = 164
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_ART'
                    Width = 287
                    Visible = True
                  end>
              end
            end
            object PNLProv: TLFPanel
              Left = 0
              Top = 533
              Width = 1189
              Height = 24
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object NavProvArt: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMArticulos.DSQMProvArt
                Flat = True
                ParentShowHint = False
                PopupMenu = CEProveedoresPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFProvArt
                InsertaControl = DBGFProvArt
                Exclusivo = True
                ControlEdit = CEProveedores
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
          end
          object TSCondicionesProv: TTabSheet
            Caption = 'Condiciones'
            ImageIndex = 2
            object DBGCondicionesProv: THYTDBGrid
              Left = 0
              Top = 23
              Width = 1189
              Height = 534
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMCondiciones
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGCondicionesProvDrawColumnCell
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAMarcar.Strings = (
                'ACTIVO')
              CamposChecked.Strings = (
                '1')
              CamposNoChecked.Strings = (
                '0')
              CamposAOrdenar.Strings = (
                'ACTIVO'
                'ALTA'
                'BAJA'
                'DESCUENTO'
                'DESCUENTO_2'
                'DESCUENTO_3'
                'DIAS_ENTREGA'
                'LINEA'
                'NOMBRE_R_SOCIAL'
                'PEDIDO_MINIMO'
                'PEDIDO_OPTIMO'
                'PRECIO'
                'PRIORIDAD'
                'PROVEEDOR'
                'RIG'
                'TIPO'
                'UNID_MAXIMAS'
                'UNID_MINIMAS')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FAMILIA'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AGRUPACION'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PROVEEDOR'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE_R_SOCIAL'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRIORIDAD'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PEDIDO_MINIMO'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNID_MINIMAS'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIAS_ENTREGA'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_2'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_3'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Visible = True
                end>
            end
            object TBCodicionesProv: TLFToolBar
              Left = 0
              Top = 0
              Width = 1189
              Height = 23
              EdgeBorders = []
              Flat = True
              TabOrder = 1
              Separators = True
              object PNLCondicionesProv: TLFPanel
                Left = 0
                Top = 0
                Width = 772
                Height = 22
                BevelOuter = bvNone
                TabOrder = 0
                object DBEArticuloCondicionesProv: TLFDbedit
                  Left = 1
                  Top = 1
                  Width = 120
                  Height = 21
                  Color = clInfoBk
                  DataField = 'ARTICULO'
                  DataSource = DMArticulos.DSQMArticulos
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBETituloCondicionesProv: TLFDbedit
                  Left = 122
                  Top = 1
                  Width = 400
                  Height = 21
                  AutoSize = False
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMArticulos.DSQMArticulos
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
          object TSTarfiasProveedor: TTabSheet
            Caption = 'Tarfias Proveedor'
            ImageIndex = 3
            object PNLTarifasProveedor: TLFPanel
              Left = 0
              Top = 0
              Width = 1189
              Height = 557
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object TBTarfiasProveedor: TLFToolBar
                Left = 0
                Top = 0
                Width = 1189
                Height = 22
                AutoSize = True
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object PNLTarifasProveedorArt: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 524
                  Height = 22
                  BevelOuter = bvNone
                  TabOrder = 0
                  object DBETarifasProveedorArticulo: TLFDbedit
                    Left = 1
                    Top = 1
                    Width = 120
                    Height = 21
                    Color = clInfoBk
                    DataField = 'ARTICULO'
                    DataSource = DMArticulos.DSQMArticulos
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object DBETarifasProveedorTituloArt: TLFDbedit
                    Left = 122
                    Top = 1
                    Width = 400
                    Height = 21
                    AutoSize = False
                    Color = clInfoBk
                    DataField = 'TITULO'
                    DataSource = DMArticulos.DSQMArticulos
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
              object DBGTarifasProveedor: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 1189
                Height = 535
                Align = alClient
                Color = clInfoBk
                DataSource = DMArticulos.DSxTarfiasProveedor
                Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGTarifasProveedorDrawColumnCell
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = False
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
                  'PROVEEDOR')
                CamposAMostrar.Strings = (
                  'PROVEEDOR'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0')
                CamposADevolver.Strings = (
                  'PROVEEDOR')
                CamposDesplegar.Strings = (
                  '1')
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                Numericos.Strings = (
                  'PROVEEDOR')
                SalirSiVacio = False
                SalirSiNoExiste = True
                Tablas.Strings = (
                  'VER_PROVEEDORES_CUENTAS')
                Titulos.Strings = (
                  'TITULO')
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'EJERCICIO'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PROVEEDOR'
                    Width = 70
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
                    FieldName = 'TARIFA'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_INICIO'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_FINAL'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCUENTO1'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCUENTO2'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCUENTO3'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTICULO'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTICULO_PROVEEDOR'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'P_COSTE'
                    Width = 80
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      object TSClientes: TTabSheet [8]
        Caption = 'Cli.'
        ImageIndex = 17
        OnShow = TSClientesShow
        object PNLCodCli: TLFPanel
          Left = 0
          Top = 0
          Width = 1197
          Height = 561
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBCodCli: TLFToolBar
            Left = 0
            Top = 0
            Width = 1197
            Height = 23
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            Separators = True
            object PNLTBCodCli: TLFPanel
              Left = 0
              Top = 0
              Width = 772
              Height = 22
              BevelOuter = bvNone
              TabOrder = 0
              object DBEArticuloCodCli: TLFDbedit
                Left = 1
                Top = 1
                Width = 120
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = DMArticulos.DSQMArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBETituloArticuloCodCli: TLFDbedit
                Left = 122
                Top = 1
                Width = 400
                Height = 21
                AutoSize = False
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMArticulos.DSQMArticulos
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
          object DBGCodCli: TDBGridFind2000
            Left = 0
            Top = 23
            Width = 1197
            Height = 538
            Align = alClient
            DataSource = DMArticulos.DSQMCliArt
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
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
              'CLIENTE')
            CamposAMostrar.Strings = (
              'CLIENTE'
              '1'
              'NOMBRE_COMERCIAL')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'CLIENTE'
              'NOMBRE_CLIENTE'
              'TITULO_ART'
              'CODIGO_CLIENTE')
            MensajeNoExiste = False
            Numericos.Strings = (
              'CLIENTE')
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tablas.Strings = (
              'VER_CLIENTES_EF')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'CLIENTE'
                Width = 71
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE_R_SOCIAL'
                ReadOnly = True
                Width = 218
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_CLIENTE'
                Width = 164
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_ARTICULO_CLIENTE'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTAS_PREPARACION'
                Width = 300
                Visible = True
              end>
          end
        end
        object PNLNavCodCli: TLFPanel
          Left = 0
          Top = 561
          Width = 1197
          Height = 22
          Align = alBottom
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object NavCodCli: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMArticulos.DSQMCliArt
            Flat = True
            ParentShowHint = False
            PopupMenu = CEClientesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGCodCli
            InsertaControl = DBGCodCli
            Exclusivo = True
            ControlEdit = CEClientes
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSNotas: TTabSheet [9]
        Caption = '&Notas'
        ImageIndex = 7
        OnShow = TSNotasShow
        object PNLNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 1197
          Height = 561
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object PNLTitNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 1197
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LblTituloCorto: TLFLabel
              Left = 61
              Top = 5
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'T'#237'tulo corto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LNotasNotas: TLFLabel
              Left = 0
              Top = 20
              Width = 1197
              Height = 13
              Align = alBottom
              Caption = 'Notas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBTituloCorto: THYDBEdit
              Left = 121
              Top = 1
              Width = 265
              Height = 21
              DataField = 'TITULO_CORTO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              TabOrder = 0
            end
          end
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 33
            Width = 1197
            Height = 149
            Align = alTop
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'NOTAS'
            DataSource = DMArticulos.DSQMArticulos
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object PNLNotasKri: TLFPanel
            Left = 0
            Top = 182
            Width = 1197
            Height = 379
            Align = alClient
            TabOrder = 2
            object PNLNotasKriL: TLFPanel
              Left = 1
              Top = 1
              Width = 1195
              Height = 377
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LNotasCompras: TLFLabel
                Left = 0
                Top = 0
                Width = 1195
                Height = 13
                Align = alTop
                Caption = 'Notas Compras'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LNotasVentas: TLFLabel
                Left = 0
                Top = 136
                Width = 1195
                Height = 13
                Align = alTop
                Caption = 'Notas Ventas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBRENotasCompras: TDBRichEdit
                Left = 0
                Top = 42
                Width = 1195
                Height = 94
                Align = alTop
                BevelEdges = []
                BevelInner = bvNone
                BevelOuter = bvNone
                DataField = 'NOTAS_COMPRAS'
                DataSource = DMArticulos.DSQMArticulos
                PlainText = True
                ScrollBars = ssVertical
                TabOrder = 0
                OnEnter = DBRENotasComprasEnter
                OnSelectionChange = DBRENotasVentasSelectionChange
              end
              object TBRichNotas: TLFToolBar
                Left = 0
                Top = 13
                Width = 1195
                Height = 29
                EdgeInner = esNone
                EdgeOuter = esNone
                Images = DMMain.ToolbarImages
                TabOrder = 1
                Visible = False
                Separators = True
                object TButtNotasNegrita: TToolButton
                  Left = 0
                  Top = 2
                  Action = FMain.RichEditBold1
                end
                object TButtNotasItalica: TToolButton
                  Left = 23
                  Top = 2
                  Action = FMain.RichEditItalic1
                end
                object TButtNotasSubrayado: TToolButton
                  Left = 46
                  Top = 2
                  Action = FMain.RichEditUnderline1
                end
                object TButtSep12: TToolButton
                  Left = 69
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                  Visible = False
                end
                object TButtNotasAlinIzq: TToolButton
                  Left = 77
                  Top = 2
                  Action = FMain.RichEditAlignLeft1
                end
                object TButtNotasAlinCent: TToolButton
                  Left = 100
                  Top = 2
                  Action = FMain.RichEditAlignCenter1
                end
                object TButtNotasAlinDer: TToolButton
                  Left = 123
                  Top = 2
                  Action = FMain.RichEditAlignRight1
                end
                object TButtSep13: TToolButton
                  Left = 146
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                  Visible = False
                end
                object TButtNotasBullets: TToolButton
                  Left = 154
                  Top = 2
                  Action = FMain.RichEditBullets1
                end
                object TButtSep14: TToolButton
                  Left = 177
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                  Visible = False
                end
                object CBFontNameNotas: TLFComboBox
                  Left = 185
                  Top = 2
                  Width = 192
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  OnChange = CBFontNameChange
                end
                object TButtSep15: TToolButton
                  Left = 377
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object PNLTamanoNotas: TLFPanel
                  Left = 385
                  Top = 2
                  Width = 40
                  Height = 22
                  TabOrder = 0
                  object EFontSizeNotas: TLFEdit
                    Left = 1
                    Top = 0
                    Width = 24
                    Height = 21
                    TabOrder = 0
                    Text = '0'
                    OnChange = EFontSizeNotasChange
                  end
                  object UpDown1: TUpDown
                    Left = 25
                    Top = 0
                    Width = 15
                    Height = 21
                    Associate = EFontSizeNotas
                    Min = 0
                    Position = 0
                    TabOrder = 1
                    Wrap = True
                  end
                end
              end
              object DBRENotasVentas: TDBRichEdit
                Left = 0
                Top = 149
                Width = 1195
                Height = 228
                Align = alClient
                BevelEdges = []
                BevelInner = bvNone
                BevelOuter = bvNone
                DataField = 'NOTAS_VENTAS'
                DataSource = DMArticulos.DSQMArticulos
                PlainText = True
                ScrollBars = ssVertical
                TabOrder = 2
                OnEnter = DBRENotasComprasEnter
                OnSelectionChange = DBRENotasVentasSelectionChange
              end
            end
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLCabNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 522
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBArtNotas: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBTituloNotas: TLFDbedit
              Left = 121
              Top = 0
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object TButtSep10: TToolButton
            Left = 522
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 530
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMArticulos.DSQMArticulos
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = False
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBTituloCorto
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TButtSep11: TToolButton
            Left = 618
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtImprimirNotas: TToolButton
            Left = 626
            Top = 0
            Action = AImprimirNotas
          end
        end
      end
      object TSCodBarra: TTabSheet [10]
        Caption = 'C. &Barras'
        ImageIndex = 8
        OnShow = TSCodBarraShow
        object PNLCodBarras1: TLFPanel
          Left = 0
          Top = 561
          Width = 1197
          Height = 22
          Align = alBottom
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object BCrearCodigoBarra: TSpeedButton
            Left = 232
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Crear codigo de barra con codigo de articulo'
            ParentShowHint = False
            ShowHint = True
            OnClick = BCrearCodigoBarraClick
          end
          object BCrearCodigoBarraEAN13: TSpeedButton
            Left = 256
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Crear codigo de barra EAN13'
            ParentShowHint = False
            ShowHint = True
            OnClick = BCrearCodigoBarraEAN13Click
          end
          object NavCodBarras: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMArticulos.DSCodigoBarra
            Flat = True
            ParentShowHint = False
            PopupMenu = CEBarrasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCodBarra
            InsertaControl = DBGFCodBarra
            Exclusivo = True
            ControlEdit = CEBarras
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object CBConfigCBarras: TLFCheckBox
            Left = 307
            Top = 2
            Width = 240
            Height = 17
            Caption = 'Insertar C'#243'digo de Barras al insertar el Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            OnClick = CBConfigCBarrasClick
            Alignment = taLeftJustify
          end
        end
        object PNLCodBarras2: TLFPanel
          Left = 0
          Top = 0
          Width = 1197
          Height = 561
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object BVCodBarras: TBevel
            Left = 590
            Top = 143
            Width = 127
            Height = 99
          end
          object ICodBarras: TImage
            Left = 591
            Top = 144
            Width = 125
            Height = 97
            Stretch = True
          end
          object LCodigoBarras: TLFLabel
            Left = 592
            Top = 119
            Width = 120
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'C'#243'digo de Barras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TBCodBarras1: TLFToolBar
            Left = 0
            Top = 0
            Width = 1197
            Height = 21
            AutoSize = True
            ButtonHeight = 21
            EdgeBorders = []
            Enabled = False
            Flat = True
            TabOrder = 1
            Separators = True
            object PNLArtCodBarras: TLFPanel
              Left = 0
              Top = 0
              Width = 789
              Height = 21
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object DBArtCodBarras: TLFDbedit
                Left = 0
                Top = 0
                Width = 120
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = DMArticulos.DSQMArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBTitCodBarras: TLFDbedit
                Left = 121
                Top = 0
                Width = 400
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMArticulos.DSQMArticulos
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
          object DBGFCodBarra: TDBGridFind2000
            Left = 0
            Top = 21
            Width = 540
            Height = 540
            Align = alLeft
            DataSource = DMArticulos.DSCodigoBarra
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColEnter = DBGFCodBarraColEnter
            OnDrawColumnCell = DBGFCodBarraDrawColumnCell
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'TIPO')
            CamposAMostrar.Strings = (
              'TIPO'
              '1'
              'LONGITUD')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'BARRAS')
            CamposNoAccesibles.Strings = (
              'TITULO')
            MensajeNoExiste = False
            Numericos.Strings = (
              'TIPO')
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tablas.Strings = (
              'SYS_TIPO_CODIGO_BARRAS         ')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BARRAS'
                Width = 183
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
                Width = 198
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FUNCION'
                Width = 60
                Visible = True
              end>
          end
          object DBECodBarras: THYDBEdit
            Left = 595
            Top = 86
            Width = 73
            Height = 21
            DataField = 'BARRAS'
            DataSource = DMArticulos.DSCodigoBarra
            Enabled = True
            TabOrder = 2
            Visible = False
            OnChange = DBECodBarrasChange
          end
        end
      end
      object TSCuentas: TTabSheet [11]
        Caption = '&Ctas.'
        ImageIndex = 30
        OnShow = TSCuentasShow
        object PCCuentas: TLFPageControl
          Left = 0
          Top = 0
          Width = 1197
          Height = 583
          ActivePage = TSFichaSeries
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabPosition = tpBottom
          OnChange = PCCuentasChange
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSFichaSeries: TTabSheet
            Caption = 'Series'
            object PNSeries: TLFPanel
              Left = 0
              Top = 0
              Width = 1189
              Height = 535
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 1
              object LCuentasSerieCuentaCompras: TLFLabel
                Left = 113
                Top = 127
                Width = 63
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Compras'
              end
              object LCuentasSerieCuentaVentas: TLFLabel
                Left = 121
                Top = 149
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Ventas'
              end
              object LBCtaDevlC: TLFLabel
                Left = 91
                Top = 171
                Width = 83
                Height = 13
                Caption = 'Cta.Dev.Compras'
              end
              object LbCtaDvnV: TLFLabel
                Left = 101
                Top = 194
                Width = 75
                Height = 13
                Caption = 'Cta.Dev.Ventas'
              end
              object LBCtaAbnC: TLFLabel
                Left = 80
                Top = 171
                Width = 97
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Abono Compras'
              end
              object LbCtaAbnV: TLFLabel
                Left = 88
                Top = 193
                Width = 89
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Abono Ventas'
              end
              object LCuentasSerie: TLFLabel
                Left = 151
                Top = 105
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie'
              end
              object TBArtSeries: TLFToolBar
                Left = 0
                Top = 0
                Width = 1189
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 10
                Separators = True
                object PInfoSeries: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 522
                  Height = 22
                  BevelOuter = bvNone
                  Enabled = False
                  TabOrder = 0
                  object DBEArtSeries: TLFDbedit
                    Left = 0
                    Top = 0
                    Width = 120
                    Height = 21
                    Color = clInfoBk
                    DataField = 'ARTICULO'
                    DataSource = DMArticulos.DSQMArticulos
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object DBEArtDescSeries: TLFDbedit
                    Left = 121
                    Top = 0
                    Width = 400
                    Height = 21
                    Color = clInfoBk
                    DataField = 'TITULO'
                    DataSource = DMArticulos.DSQMArticulos
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
                object TSep13: TToolButton
                  Left = 522
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                  Visible = False
                end
                object TButtHerencia: TToolButton
                  Left = 530
                  Top = 0
                  Hint = 'Heredar las Cuentas de la Familia'
                  ImageIndex = 97
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                end
              end
              object DBEFCtaCompras: TLFDBEditFind2000
                Left = 181
                Top = 124
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_COMPRAS'
                DataSource = DMArticulos.DSQMSeries
                TabOrder = 2
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
              object ETitCtaCompras: TLFEdit
                Left = 289
                Top = 124
                Width = 351
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
              object ETitCtaVentas: TLFEdit
                Left = 289
                Top = 146
                Width = 351
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
              object ETitCtaDevCompras: TLFEdit
                Left = 289
                Top = 168
                Width = 351
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
              object ETitCtaDevVentas: TLFEdit
                Left = 289
                Top = 190
                Width = 351
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
              object ETitCtaAbonoCompras: TLFEdit
                Left = 289
                Top = 168
                Width = 351
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
              object ETitCtaAbonoVentas: TLFEdit
                Left = 289
                Top = 190
                Width = 351
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
              object DBEFCtaAbonoVentas: TLFDBEditFind2000
                Left = 181
                Top = 190
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_VENTAS'
                DataSource = DMArticulos.DSQMSeries
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
              object DBEFCtaAbonoCompras: TLFDBEditFind2000
                Left = 181
                Top = 168
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_COMPRAS'
                DataSource = DMArticulos.DSQMSeries
                TabOrder = 11
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
              object DBEFCtaDevVentas: TLFDBEditFind2000
                Left = 181
                Top = 190
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_VENTAS'
                DataSource = DMArticulos.DSQMSeries
                TabOrder = 8
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
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaDevCompras: TLFDBEditFind2000
                Left = 181
                Top = 168
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_COMPRAS'
                DataSource = DMArticulos.DSQMSeries
                TabOrder = 6
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
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaVentas: TLFDBEditFind2000
                Left = 181
                Top = 146
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_VENTAS'
                DataSource = DMArticulos.DSQMSeries
                TabOrder = 4
                OnChange = DBEFCtaVentasChange
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
              object ETitSerie: TLFEdit
                Left = 289
                Top = 102
                Width = 351
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEFSerie: TLFDBEditFind2000
                Left = 181
                Top = 102
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SERIE'
                DataSource = DMArticulos.DSQMSeries
                TabOrder = 0
                OnChange = DBEFSerieChange
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
            end
            object TBSeries: TLFToolBar
              Left = 0
              Top = 535
              Width = 1189
              Height = 22
              Align = alBottom
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavSeries: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMArticulos.DSQMSeries
                Align = alLeft
                Flat = True
                ParentShowHint = False
                PopupMenu = CESeriesPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBEFSerie
                InsertaControl = DBEFSerie
                OnClickBefore = NavMainClickBefore
                Exclusivo = True
                ControlEdit = CESeries
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
          end
          object TSSerieTabla: TTabSheet
            Caption = 'Series Tabla'
            ImageIndex = 1
            object DBGSeries: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1189
              Height = 557
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMSeries
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
              TabFicha = TSFichaSeries
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'DIR_LOCALIDAD')
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
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_VENTAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_COMPRAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_VENTAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_COMPRAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_VENTAS'
                  Width = 65
                  Visible = True
                end>
            end
          end
          object TSProyectos: TTabSheet
            Caption = 'Proyectos'
            ImageIndex = 2
            object PNProyectos: TLFPanel
              Left = 0
              Top = 0
              Width = 1189
              Height = 535
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LFLCtaCompras: TLFLabel
                Left = 114
                Top = 126
                Width = 63
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Compras'
              end
              object LFLCtaVentas: TLFLabel
                Left = 122
                Top = 148
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Ventas'
              end
              object LFLCtaDevComp: TLFLabel
                Left = 94
                Top = 171
                Width = 83
                Height = 13
                Caption = 'Cta.Dev.Compras'
              end
              object LFLCtaDevVent: TLFLabel
                Left = 102
                Top = 192
                Width = 75
                Height = 13
                Caption = 'Cta.Dev.Ventas'
              end
              object LFLCtaAbonoComp: TLFLabel
                Left = 80
                Top = 170
                Width = 97
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Abono Compras'
              end
              object LFLCtaAbonoVentas: TLFLabel
                Left = 88
                Top = 192
                Width = 89
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Abono Ventas'
              end
              object LFLProyecto: TLFLabel
                Left = 135
                Top = 105
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Proyecto'
              end
              object TBArtProy: TLFToolBar
                Left = 0
                Top = 0
                Width = 1189
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 10
                Separators = True
                object PInfoProy: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 522
                  Height = 22
                  BevelOuter = bvNone
                  Enabled = False
                  TabOrder = 0
                  object DBEArtProy: TLFDbedit
                    Left = 0
                    Top = 0
                    Width = 121
                    Height = 21
                    Color = clInfoBk
                    DataField = 'ARTICULO'
                    DataSource = DMArticulos.DSQMArticulos
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
                    Left = 121
                    Top = 0
                    Width = 400
                    Height = 21
                    Color = clInfoBk
                    DataField = 'TITULO'
                    DataSource = DMArticulos.DSQMArticulos
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
                object TSep14: TToolButton
                  Left = 522
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                  Visible = False
                end
                object TButtProyectosHerencia: TToolButton
                  Left = 530
                  Top = 0
                  Hint = 'Heredar las Cuentas de la Familia'
                  ImageIndex = 97
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                end
              end
              object DBEFCtaCompProy: TLFDBEditFind2000
                Left = 181
                Top = 124
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_COMPRAS'
                DataSource = DMArticulos.DSQMProyectos
                TabOrder = 2
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object ETitCtaCompProy: TLFEdit
                Left = 289
                Top = 124
                Width = 351
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
              object ETitCtaVentProy: TLFEdit
                Left = 289
                Top = 146
                Width = 351
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
              object ETitCtaDevCompProy: TLFEdit
                Left = 289
                Top = 168
                Width = 351
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
              object ETitCtaDevVentProy: TLFEdit
                Left = 289
                Top = 190
                Width = 351
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
              object ETitCtaAbCompProy: TLFEdit
                Left = 289
                Top = 168
                Width = 351
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
              object ETitCtaAbVentProy: TLFEdit
                Left = 289
                Top = 190
                Width = 351
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
              object DBEFCtaDevVentProy: TLFDBEditFind2000
                Left = 181
                Top = 190
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_VENTAS'
                DataSource = DMArticulos.DSQMProyectos
                TabOrder = 12
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
              object DBEFCtaDevCompProy: TLFDBEditFind2000
                Left = 181
                Top = 168
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_COMPRAS'
                DataSource = DMArticulos.DSQMProyectos
                TabOrder = 11
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
              object DBEFCtaAbVentProy: TLFDBEditFind2000
                Left = 181
                Top = 190
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_VENTAS'
                DataSource = DMArticulos.DSQMProyectos
                TabOrder = 8
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaAbCompProy: TLFDBEditFind2000
                Left = 181
                Top = 168
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_COMPRAS'
                DataSource = DMArticulos.DSQMProyectos
                TabOrder = 6
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaVentProy: TLFDBEditFind2000
                Left = 181
                Top = 146
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_VENTAS'
                DataSource = DMArticulos.DSQMProyectos
                TabOrder = 4
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object ETitProyecto: TLFEdit
                Left = 289
                Top = 102
                Width = 351
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEFProyecto: TLFDBEditFind2000
                Left = 181
                Top = 102
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PROYECTO'
                DataSource = DMArticulos.DSQMProyectos
                TabOrder = 0
                OnChange = DBEFProyectoChange
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
            end
            object TBProyectos: TLFToolBar
              Left = 0
              Top = 535
              Width = 1189
              Height = 22
              Align = alBottom
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object NavProy: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMArticulos.DSQMProyectos
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
          end
          object TSProyTabla: TTabSheet
            Caption = 'Proyectos Tabla'
            ImageIndex = 3
            object DBGProyectos: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1189
              Height = 557
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMProyectos
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
              TabFicha = TSFichaSeries
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
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_VENTAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_COMPRAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_VENTAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_COMPRAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_VENTAS'
                  Width = 65
                  Visible = True
                end>
            end
          end
          object TSProySeries: TTabSheet
            Caption = 'Proyectos/Series'
            object PNProySeries: TLFPanel
              Left = 0
              Top = 0
              Width = 1189
              Height = 535
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LFLCtaCompProySer: TLFLabel
                Left = 114
                Top = 126
                Width = 63
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Compras'
              end
              object LFLCtaVentProySer: TLFLabel
                Left = 122
                Top = 148
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Ventas'
              end
              object LFLCtaDevCompPROYSER: TLFLabel
                Left = 94
                Top = 170
                Width = 83
                Height = 13
                Caption = 'Cta.Dev.Compras'
              end
              object LFLCtaDevVentPROYSER: TLFLabel
                Left = 102
                Top = 192
                Width = 75
                Height = 13
                Caption = 'Cta.Dev.Ventas'
              end
              object LFLCtaAbCompProySer: TLFLabel
                Left = 80
                Top = 170
                Width = 97
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Abono Compras'
              end
              object LFLCtaAbVentProySer: TLFLabel
                Left = 88
                Top = 192
                Width = 89
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cta. Abono Ventas'
              end
              object LFLProySeries: TLFLabel
                Left = 135
                Top = 83
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Proyecto'
              end
              object LFLSerieProySer: TLFLabel
                Left = 152
                Top = 105
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie'
              end
              object TBArtProySerie: TLFToolBar
                Left = 0
                Top = 0
                Width = 1189
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 12
                Separators = True
                object PInfoProySerie: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 522
                  Height = 22
                  BevelOuter = bvNone
                  Enabled = False
                  TabOrder = 0
                  object DBEArtProySer: TLFDbedit
                    Left = 0
                    Top = 0
                    Width = 120
                    Height = 21
                    Color = clInfoBk
                    DataField = 'ARTICULO'
                    DataSource = DMArticulos.DSQMArticulos
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
                    Left = 121
                    Top = 0
                    Width = 400
                    Height = 21
                    Color = clInfoBk
                    DataField = 'TITULO'
                    DataSource = DMArticulos.DSQMArticulos
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
                object TSep5: TToolButton
                  Left = 522
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                  Visible = False
                end
                object TButtProyectosSerieHerencia: TToolButton
                  Left = 530
                  Top = 0
                  Hint = 'Heredar las Cuentas de la Familia'
                  Caption = 'Herencia'
                  ImageIndex = 97
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                end
              end
              object DBEFCtaCompProySer: TLFDBEditFind2000
                Left = 181
                Top = 124
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_COMPRAS'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 4
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object ETitCtaCompProySer: TLFEdit
                Left = 289
                Top = 124
                Width = 351
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
              object ETitCtaVentProySer: TLFEdit
                Left = 289
                Top = 146
                Width = 351
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
              object ETitCtaDevCompProySer: TLFEdit
                Left = 289
                Top = 168
                Width = 351
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
              object ETitCtaDevVentProySer: TLFEdit
                Left = 289
                Top = 190
                Width = 351
                Height = 21
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
              object ETitCtaAbCompProySer: TLFEdit
                Left = 289
                Top = 168
                Width = 351
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
              object ETitCtaAbVentProySer: TLFEdit
                Left = 289
                Top = 190
                Width = 351
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
              object DBEFCtaDevVentProySer: TLFDBEditFind2000
                Left = 181
                Top = 190
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_VENTAS'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 14
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaDevCompProySer: TLFDBEditFind2000
                Left = 181
                Top = 168
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_DEVOLUCION_COMPRAS'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 13
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaAbVentProySer: TLFDBEditFind2000
                Left = 181
                Top = 190
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_VENTAS'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 10
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaAbCompProySer: TLFDBEditFind2000
                Left = 181
                Top = 168
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_ABONO_COMPRAS'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 8
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFCtaVentProySer: TLFDBEditFind2000
                Left = 181
                Top = 146
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CTA_VENTAS'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 6
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
                Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                Entorno = DMMain.EntornoBusqueda
              end
              object ETitProyectoSeries: TLFEdit
                Left = 289
                Top = 80
                Width = 351
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEFProyectoSeries: TLFDBEditFind2000
                Left = 181
                Top = 80
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PROYECTO'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 0
                OnChange = DBEFProyectoSeriesChange
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
                OnBusqueda = DBEFProyectoSeriesBusqueda
                OrdenadoPor.Strings = (
                  'proyecto')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEFSerieProySer: TLFDBEditFind2000
                Left = 181
                Top = 102
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SERIE'
                DataSource = DMArticulos.DSQMProyectosSeries
                TabOrder = 2
                OnChange = DBEFSerieProySerChange
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
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object ETitSerieProySer: TLFEdit
                Left = 289
                Top = 102
                Width = 351
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
            end
            object TBProySeries: TLFToolBar
              Left = 0
              Top = 535
              Width = 1189
              Height = 22
              Align = alBottom
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object NavProySeries: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMArticulos.DSQMProyectosSeries
                Align = alLeft
                Flat = True
                ParentShowHint = False
                PopupMenu = CEProyectosSeriesPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBEFCtaCompProySer
                InsertaControl = DBEFProyectoSeries
                Exclusivo = True
                ControlEdit = CEProyectosSeries
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
          end
          object TSProySerTabla: TTabSheet
            Caption = 'Proyecto/Series Tabla'
            object DBGProySeries: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1189
              Height = 557
              Align = alClient
              Color = clInfoBk
              DataSource = DMArticulos.DSQMProyectosSeries
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
              TabFicha = TSFichaSeries
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
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_VENTAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_COMPRAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_DEVOLUCION_VENTAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_COMPRAS'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTA_ABONO_VENTAS'
                  Width = 65
                  Visible = True
                end>
            end
          end
        end
      end
      object TSAgrupacion: TTabSheet [12]
        Caption = '&Agrup.'
        OnResize = TSAgrupacionResize
        OnShow = TSAgrupacionShow
        object TBAgrupacion: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLAgrupacion: TLFPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEArtAgrupacion: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBETitAgrupacion: TLFDbedit
              Left = 121
              Top = 0
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
        object PPertenece: TLFPanel
          Left = 0
          Top = 22
          Width = 1197
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones a las que pertenece'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBCGDisponibles: TLFDBCtrlGrid
          Left = 0
          Top = 314
          Width = 1197
          Height = 264
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMArticulos.DSxAgrupDisp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 33
          PanelWidth = 1181
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          RowCount = 8
          SelectedColor = clHighlight
          OnDblClick = DBCGDisponiblesDblClick
          object DBEAgDentro: TLFDbedit
            Left = 10
            Top = 2
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMArticulos.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDentro: TLFDbedit
            Left = 68
            Top = 2
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PDisponibles: TLFPanel
          Left = 0
          Top = 293
          Width = 1197
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones disponibles'
          Color = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object EFiltroAgrupacion: TLFEdit
            Left = 0
            Top = 0
            Width = 300
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = EFiltroAgrupacionChange
          end
        end
        object DBCGPertenece: TLFDBCtrlGrid
          Left = 0
          Top = 43
          Width = 1197
          Height = 250
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMArticulos.DSxAgrupSon
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 25
          PanelWidth = 1181
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          RowCount = 10
          SelectedColor = clHighlight
          OnDblClick = DBCGPerteneceDblClick
          object DBEAgrupacionSon: TLFDbedit
            Left = 10
            Top = 2
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMArticulos.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgrupacionSonTitulo: TLFDbedit
            Left = 68
            Top = 2
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TSImagenes: TTabSheet [13]
        Caption = 'I&m'#225'g.'
        ImageIndex = -1
        OnShow = TSImagenesShow
        object Splitter1: TSplitter
          Left = 839
          Top = 0
          Width = 9
          Height = 583
          Cursor = crHSplit
          Align = alRight
          Color = clAppWorkSpace
          ParentColor = False
        end
        object PNLImagenes: TLFPanel
          Left = 0
          Top = 0
          Width = 839
          Height = 583
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object SBAGaleria: TSpeedButton
            Left = 125
            Top = 59
            Width = 153
            Height = 20
            Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
            GroupIndex = -1
            OnDblClick = SBAGaleriaDblClick
          end
          object SBAImagen: TSpeedButton
            Left = 125
            Top = 45
            Width = 153
            Height = 20
            Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
            GroupIndex = -1
            OnDblClick = SBAImagenDblClick
          end
          object TBImagenes: TLFToolBar
            Left = 0
            Top = 0
            Width = 839
            Height = 22
            AutoSize = True
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object PInfoImagenes: TLFPanel
              Left = 0
              Top = 0
              Width = 522
              Height = 22
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object DBEArtImagen: TLFDbedit
                Left = 0
                Top = 0
                Width = 120
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = DMArticulos.DSQMArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = DBEArtImagenChange
              end
              object DBETitImagenes: TLFDbedit
                Left = 121
                Top = 0
                Width = 400
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMArticulos.DSQMArticulos
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
            object TButtSep16: TToolButton
              Left = 522
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object NavImagenes: THYMNavigator
              Left = 530
              Top = 0
              Width = 88
              Height = 22
              DataSource = DMArticulos.DSQMArticulos
              VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEImagenesPMEdit
              ShowHint = True
              TabOrder = 1
              OnClick = NavImagenesClick
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBEFImagen
              InsertaControl = DBEFImagen
              Exclusivo = True
              ControlEdit = CEImagenes
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TBSep5: TToolButton
              Left = 618
              Top = 0
              Width = 8
              ImageIndex = 0
              Style = tbsSeparator
            end
            object TBCopiarImagenPortapapeles: TToolButton
              Left = 626
              Top = 0
              Hint = 'Copiar Imagen al Portapapeles'
              Caption = 'Copiar Imagen al Portapapeles'
              ImageIndex = 29
              ParentShowHint = False
              ShowHint = True
              OnClick = TBCopiarImagenPortapapelesClick
            end
          end
          object PEditImagenes: TLFPanel
            Left = 0
            Top = 22
            Width = 839
            Height = 561
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object ScrBImagen: TScrollBox
              Left = 0
              Top = 65
              Width = 839
              Height = 496
              HorzScrollBar.Visible = False
              VertScrollBar.Visible = False
              Align = alClient
              AutoScroll = False
              BevelEdges = []
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              object Imagen: TImage
                Left = 0
                Top = 0
                Width = 839
                Height = 496
                Align = alClient
                AutoSize = True
                Center = True
                IncrementalDisplay = True
                Proportional = True
                Stretch = True
              end
            end
            object PNLImagen: TLFPanel
              Left = 0
              Top = 0
              Width = 839
              Height = 65
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object LBLImagen: TLFLabel
                Left = 14
                Top = 14
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Imagen'
              end
              object LGaleria: TLFLabel
                Left = 14
                Top = 36
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Galer'#237'a'
              end
              object ETituloImagen: TLFEdit
                Left = 121
                Top = 10
                Width = 363
                Height = 21
                Color = clAqua
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEFImagen: TLFDBEditFind2000
                Left = 54
                Top = 10
                Width = 66
                Height = 21
                DataField = 'IMAGEN'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 1
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
              object BCargarImagen: TButton
                Left = 436
                Top = 11
                Width = 23
                Height = 18
                Hint = 'Cargar imagen desde archivo'
                Caption = '...'
                TabOrder = 2
                Visible = False
                OnClick = BCargarImagenClick
              end
              object ETituloGaleria: TLFEdit
                Left = 121
                Top = 32
                Width = 363
                Height = 21
                Color = clAqua
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnDblClick = ETituloGaleriaDblClick
              end
              object DBEFGaleria: TLFDBEditFind2000
                Left = 54
                Top = 32
                Width = 66
                Height = 21
                DataField = 'ID_GALERIA'
                DataSource = DMArticulos.DSQMArticulos
                TabOrder = 4
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
              object BClipboard: TButton
                Left = 460
                Top = 11
                Width = 23
                Height = 18
                Hint = 'Cargar imagen desde porta papeles'
                Caption = 'P'
                TabOrder = 5
                Visible = False
                OnClick = BClipboardClick
              end
            end
          end
        end
        object PNLPictogramas: TLFPanel
          Left = 848
          Top = 0
          Width = 349
          Height = 583
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object TBPictogramas: TLFToolBar
            Left = 0
            Top = 0
            Width = 349
            Height = 29
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavPictogramas: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMArticulos.DSQMPictograma
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGPictograma
              InsertaControl = DBGPictograma
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
              OnClickAfterAdjust = NavPictogramasClickAfterAdjust
            end
          end
          object PNLEdicitPictogramas: TLFPanel
            Left = 0
            Top = 29
            Width = 349
            Height = 368
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGPictograma: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 349
              Height = 368
              Align = alClient
              DataSource = DMArticulos.DSQMPictograma
              Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              AutoCambiarColumna = False
              AutoPostEnCheckBox = False
              AutoStartDrag = False
              AutoStartDragInterval = 0
              IndiceBitmapOrdenable = 0
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              Transaction = DMArticulos.TLocal
              BuscarNums = False
              Campos.Strings = (
                'IMAGEN')
              CamposAMostrar.Strings = (
                'IMAGEN'
                '0')
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
                'CODIGO')
              SalirSiVacio = False
              SalirSiNoExiste = True
              Tablas.Strings = (
                'SYS_IMAGENES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'NOMBRE')
              Posicion = tpCentrado
              OnExiste = DBGPictogramaRowChange
              OnRowChange = DBGPictogramaRowChange
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'CODIGO')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PICTOGRAMA'
                  ReadOnly = True
                  Width = 44
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMAGEN'
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'NOMBRE'
                  Width = 202
                  Visible = True
                end>
            end
          end
          object PNLImagenesPictogramas: TLFPanel
            Left = 0
            Top = 397
            Width = 349
            Height = 186
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object ImgPictograma: TImage
              Left = 0
              Top = 0
              Width = 349
              Height = 186
              Align = alClient
              AutoSize = True
              Center = True
              IncrementalDisplay = True
              Proportional = True
              Stretch = True
            end
          end
        end
      end
      object TSSimilares: TTabSheet [14]
        Caption = 'Similares'
        OnShow = TSSimilaresShow
        object TBSimilares: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLSimilares: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETitulosSimilares: TLFDbedit
              Left = 121
              Top = 0
              Width = 304
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBEArticulosSimilares: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavSimilares: THYMNavigator
            Left = 425
            Top = 0
            Width = 125
            Height = 21
            DataSource = DMArticulos.DSQMArticulosSimilares
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CESimilaresPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGArticulosSimilares: TDBGridFind2000
          Left = 0
          Top = 21
          Width = 1197
          Height = 541
          Align = alClient
          DataSource = DMArticulos.DSQMArticulosSimilares
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMArticulos.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO_SIMILAR')
          CamposAMostrar.Strings = (
            'ARTICULO_SIMILAR'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO')
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
          OnBusqueda = DBGArticulosSimilaresBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ARTICULO'
            'TIPO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO_SIMILAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_SIMILAR'
              Width = 317
              Visible = True
            end>
        end
      end
      object TSPropuestas: TTabSheet [15]
        Caption = 'Pr&op.'
        OnShow = TSPropuestasShow
        object Splitter10Kri: TSplitter
          Left = 0
          Top = 245
          Width = 1197
          Height = 8
          Cursor = crVSplit
          Align = alTop
        end
        object PNLPropuestas: TLFPanel
          Left = 0
          Top = 25
          Width = 1197
          Height = 220
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LPropuestas: TLFLabel
            Left = 0
            Top = 0
            Width = 53
            Height = 13
            Align = alTop
            Caption = 'Propuestas'
          end
          object HYDBGPropuestas: THYTDBGrid
            Left = 0
            Top = 13
            Width = 1197
            Height = 207
            Align = alClient
            Color = clInfoBk
            DataSource = DMArticulos.DSPropuestas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = HYDBGPropuestasDblClick
            OnTitleClick = HYDBGPropuestasTitleClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            TabFicha = TSFicha
            PermutaPaneles = False
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Width = 30
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'SERIE'
                Width = 40
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'TIPO'
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'RIG'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_PRE_CAB'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROVEEDOR'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_PROVEEDOR'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_COSTE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_2'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_3'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'B_IMPONIBLE'
                Visible = True
              end>
          end
        end
        object PNLPropuestasConfir: TLFPanel
          Left = 0
          Top = 253
          Width = 1197
          Height = 330
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LPropuestasConfir: TLFLabel
            Left = 0
            Top = 0
            Width = 114
            Height = 13
            Align = alTop
            Caption = 'Propuestas Confirmadas'
          end
          object HYDBGPropuestasConfir: THYTDBGrid
            Left = 0
            Top = 13
            Width = 1197
            Height = 317
            Align = alClient
            Color = clInfoBk
            DataSource = DMArticulos.DSPropuestasConfir
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = HYDBGPropuestasConfirDblClick
            OnTitleClick = HYDBGPropuestasConfirTitleClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            TabFicha = TSFicha
            PermutaPaneles = False
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Width = 30
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'SERIE'
                Width = 40
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'TIPO'
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'RIG'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_PRE_CAB'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROVEEDOR'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_PROVEEDOR'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_COSTE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_2'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_3'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'B_IMPONIBLE'
                Visible = True
              end>
          end
        end
        object PNLPropuesta: TLFPanel
          Left = 0
          Top = 0
          Width = 1197
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LAlmacenPropuestasKri: TLFLabel
            Left = 530
            Top = 6
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen'
          end
          object LFDBArticuloPropuestaKri: TLFDbedit
            Left = 3
            Top = 2
            Width = 120
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = DMArticulos.DSQMArticulos
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
          object LFDBTituloPropuestasKri: TLFDbedit
            Left = 124
            Top = 2
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSQMArticulos
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
          object CBSoloPropPendientes: TLFCheckBox
            Left = 646
            Top = 4
            Width = 127
            Height = 17
            Caption = 'Solo Propuestas Pend.'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CalcularPropuesta
          end
          object CBAlmacenPropuestasKri: TLFComboBox
            Left = 574
            Top = 2
            Width = 66
            Height = 21
            ItemHeight = 13
            TabOrder = 3
            Text = 'Todos'
            OnChange = CalcularPropuesta
          end
        end
      end
      object TSPedidos: TTabSheet [16]
        Caption = 'P&edi.'
        ImageIndex = 13
        OnShow = TSPedidosShow
        object Splitter1Kri: TSplitter
          Left = 0
          Top = 193
          Width = 1197
          Height = 8
          Cursor = crVSplit
          Align = alTop
        end
        object PNLPedidosDeClientes: TLFPanel
          Left = 0
          Top = 25
          Width = 1197
          Height = 168
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LPedidosDeClientes: TLFLabel
            Left = 0
            Top = 0
            Width = 93
            Height = 13
            Align = alTop
            Caption = 'Pedidos de Clientes'
          end
          object HYDBGPedidosDeCliente: THYTDBGrid
            Left = 0
            Top = 13
            Width = 1197
            Height = 155
            Align = alClient
            Color = clInfoBk
            DataSource = DMArticulos.DSPedidosDeClientes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = HYDBGPedidosDeClienteDrawColumnCell
            OnDblClick = HYDBGPedidosDeClienteDblClick
            OnTitleClick = HYDBGPedidosDeClienteTitleClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            TabFicha = TSFicha
            PermutaPaneles = False
            CamposAMarcar.Strings = (
              'SERVIDO')
            CamposChecked.Strings = (
              '1')
            CamposNoChecked.Strings = (
              '0')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Width = 30
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'SERIE'
                Width = 40
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'TIPO'
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'RIG'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'U_PENDIENTES'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SERVIDO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 72
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
                FieldName = 'TITULO_CLIENTE'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AGENTE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_ENTREGA_PREV'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_ENTREGA_ARTICULO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_CONF_DET'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_2'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_3'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'B_IMPONIBLE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'U_SERVIDAS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_CLIENTE'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_CLIENTE'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SU_REFERENCIA'
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PEDIDO_CLIENTE'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_REC_DET'
                Width = 72
                Visible = True
              end>
          end
        end
        object PNLPedidosAProveedor: TLFPanel
          Left = 0
          Top = 201
          Width = 1197
          Height = 382
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LPedidosAProveedor: TLFLabel
            Left = 0
            Top = 0
            Width = 99
            Height = 13
            Align = alTop
            Caption = 'Pedidos a Proveedor'
          end
          object HYDBGPedidosAProveedor: THYTDBGrid
            Left = 0
            Top = 13
            Width = 1197
            Height = 369
            Align = alClient
            Color = clInfoBk
            DataSource = DMArticulos.DSPedidosAProveedor
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = HYDBGPedidosAProveedorDrawColumnCell
            OnDblClick = HYDBGPedidosAProveedorDblClick
            OnTitleClick = HYDBGPedidosAProveedorTitleClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            TabFicha = TSFicha
            PermutaPaneles = False
            CamposAMarcar.Strings = (
              'LINEA_SERVIDA')
            CamposChecked.Strings = (
              '1')
            CamposNoChecked.Strings = (
              '0')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Width = 30
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'SERIE'
                Width = 40
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'TIPO'
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'RIG'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_POR_SERVIR'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA_SERVIDA'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROVEEDOR'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_PROVEEDOR'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_PRE_DET'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_CONF_KRI'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PALZO_CONFIRM_KRI_DET'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_COSTE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_2'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_3'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'B_IMPONIBLE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_SERVIDAS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PLAZO_INICIAL_KRI'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_CONFIRMADA_KRI'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PALZO_CONFIRM_KRI_CAB'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_PRE_CAB'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_PROVEEDOR'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SU_REFERENCIA'
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_REC_DET'
                Width = 72
                Visible = True
              end>
          end
        end
        object PNLPedidos: TLFPanel
          Left = 0
          Top = 0
          Width = 1197
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LAlmacenPedidosPendientesKri: TLFLabel
            Left = 530
            Top = 6
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LFDBArticuloPedidoKri: TLFDbedit
            Left = 3
            Top = 2
            Width = 120
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = DMArticulos.DSQMArticulos
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
          object LFDBTituloPedidoKri: TLFDbedit
            Left = 124
            Top = 2
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArticulos.DSQMArticulos
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
          object CBSoloPendientes: TLFCheckBox
            Left = 646
            Top = 4
            Width = 139
            Height = 17
            Caption = 'Solo Pedidos Pend.'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CalcularPedidos
          end
          object CBAlmacenPedidosPendientesKri: TLFComboBox
            Left = 574
            Top = 2
            Width = 66
            Height = 21
            ItemHeight = 13
            TabOrder = 3
            Text = 'Todos'
            OnChange = CalcularPedidos
          end
        end
      end
      object TSUnidadesLogisitcas: TTabSheet [17]
        Caption = 'Uds. Log.'
        ImageIndex = 14
        OnShow = TSUnidadesLogisitcasShow
        object TBUnidadesLogisitcas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLUnidadesLogisitcas: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETituloArtUdsLogisitcas: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBEArticuloUdsLogisitcas: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavUnidadesLogisitcas: THYMNavigator
            Left = 425
            Top = 0
            Width = 240
            Height = 21
            DataSource = DMArticulos.DSQMUnidadesLogisticas
            Flat = True
            ParentShowHint = False
            PopupMenu = PMUnidadesLogisitcas
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGUnidadesLogisitcas: TDBGridFind2000
          Left = 0
          Top = 21
          Width = 1197
          Height = 562
          Align = alClient
          DataSource = DMArticulos.DSQMUnidadesLogisticas
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = -1
          BaseDeDatos = DMMain.DataBase
          Transaction = DMArticulos.TLocal
          BuscarNums = False
          Campos.Strings = (
            'IDIOMA'
            'TIPO')
          CamposAMostrar.Strings = (
            'IDIOMA'
            '0'
            'TIPO'
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
            'DEFECTO'
            'PESO'
            'PESO_TOTAL'
            'TIPO')
          ColumnasCheckBoxes.Strings = (
            'DEFECTO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'IDIOMA'
            'TIPO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_IDIOMAS'
            'SYS_TIPO_UNIDAD_LOGISTICA')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'TIPO')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Width = 71
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_TOTAL'
              ReadOnly = True
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              Visible = True
            end>
        end
      end
      object TSEquivalencias: TTabSheet [18]
        Caption = 'Equiv.'
        ImageIndex = 18
        OnShow = TSEquivalenciasShow
        object TBEquivalencias: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLEquivalencias: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETituloArticuloEquivalencias: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBEArticuloEquivalencias: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavEquivalencias: THYMNavigator
            Left = 425
            Top = 0
            Width = 240
            Height = 21
            DataSource = DMArticulos.dsQMEquivalenciasCab
            Flat = True
            ParentShowHint = False
            PopupMenu = PMUnidadesLogisitcas
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFEquivalenciasCab: TDBGridFind2000
          Left = 0
          Top = 21
          Width = 1197
          Height = 163
          Align = alTop
          DataSource = DMArticulos.dsQMEquivalenciasCab
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGFEquivalenciasCabDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = -1
          BaseDeDatos = DMMain.DataBase
          Transaction = DMArticulos.TLocal
          BuscarNums = False
          Campos.Strings = (
            'IDIOMA'
            'TIPO')
          CamposAMostrar.Strings = (
            'IDIOMA'
            '0'
            'TIPO'
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
            'DEFECTO'
            'PESO'
            'PESO_TOTAL'
            'TIPO')
          ColumnasCheckBoxes.Strings = (
            'DEFECTO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'IDIOMA'
            'TIPO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_IDIOMAS'
            'SYS_TIPO_UNIDAD_LOGISTICA')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'TIPO')
          Filtros = []
          Columns = <
            item
              Color = clAqua
              Expanded = False
              FieldName = 'ID_EQUIVAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_EQUIVAL'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Visible = True
            end>
        end
        object DBGFEquivalenciasDet: TDBGridFind2000
          Left = 0
          Top = 184
          Width = 1197
          Height = 399
          Align = alClient
          DataSource = DMArticulos.DSQMEquivalenciasDet
          ReadOnly = True
          TabOrder = 2
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = -1
          BaseDeDatos = DMMain.DataBase
          Transaction = DMArticulos.TLocal
          BuscarNums = False
          Campos.Strings = (
            'IDIOMA'
            'TIPO')
          CamposAMostrar.Strings = (
            'IDIOMA'
            '0'
            'TIPO'
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
            'DEFECTO'
            'PESO'
            'PESO_TOTAL'
            'TIPO')
          ColumnasCheckBoxes.Strings = (
            'DEFECTO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'IDIOMA'
            'TIPO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_IDIOMAS'
            'SYS_TIPO_UNIDAD_LOGISTICA')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'TIPO')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'LINEA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO_EQUIVAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 200
              Visible = True
            end>
        end
      end
      object TSCombinaciones: TTabSheet [19]
        Caption = 'Combinaciones'
        ImageIndex = 20
        OnShow = TSCombinacionesShow
        object TBCombinaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLCombinaciones: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            TabOrder = 1
            object DBECombinacionesTitulo: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBECombinacionesArticulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavCombinaciones: THYMNavigator
            Left = 425
            Top = 0
            Width = 224
            Height = 21
            DataSource = DMArticulos.DSxCombinaciones
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = PMUnidadesLogisitcas
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLCombinacionesDetalle: TLFPanel
          Left = 0
          Top = 21
          Width = 1197
          Height = 562
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object PNLCombinacionesCreacion: TLFPanel
            Left = 0
            Top = 0
            Width = 1197
            Height = 35
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object CBMarca: TLFComboBox
              Left = 16
              Top = 8
              Width = 181
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = CBMarcaChange
            end
            object CBModelo: TLFComboBox
              Left = 200
              Top = 8
              Width = 181
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              OnChange = CBModeloChange
            end
            object CBEspecificacion: TLFComboBox
              Left = 384
              Top = 8
              Width = 181
              Height = 21
              ItemHeight = 13
              TabOrder = 2
            end
            object CBBombin: TLFComboBox
              Left = 568
              Top = 8
              Width = 181
              Height = 21
              ItemHeight = 13
              TabOrder = 3
            end
            object CBLlave: TLFComboBox
              Left = 752
              Top = 8
              Width = 181
              Height = 21
              ItemHeight = 13
              TabOrder = 4
            end
            object BCrearCombinacion: TButton
              Left = 1120
              Top = 6
              Width = 48
              Height = 25
              Hint = 'Crear Combinacion'
              Caption = 'Crear'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BCrearCombinacionClick
            end
            object CBTipoVehiculo: TLFComboBox
              Left = 936
              Top = 8
              Width = 181
              Height = 21
              ItemHeight = 13
              TabOrder = 6
            end
          end
          object DBGCombinaciones: TDBGridFind2000
            Left = 0
            Top = 35
            Width = 1197
            Height = 527
            Align = alClient
            DataSource = DMArticulos.DSxCombinaciones
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGCombinacionesDblClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = True
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = -1
            BaseDeDatos = DMMain.DataBase
            Transaction = DMArticulos.TLocal
            BuscarNums = False
            Campos.Strings = (
              'IDIOMA'
              'TIPO')
            CamposAMostrar.Strings = (
              'IDIOMA'
              '0'
              'TIPO'
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
              'DEFECTO'
              'PESO'
              'PESO_TOTAL'
              'TIPO')
            ColumnasCheckBoxes.Strings = (
              'DEFECTO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'IDIOMA'
              'TIPO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_IDIOMAS'
              'SYS_TIPO_UNIDAD_LOGISTICA')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              'TIPO')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'MARCA'
                Width = 190
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODELO'
                Width = 190
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESPECIFICACION'
                Width = 190
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BOMBIN'
                Width = 190
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LLAVE'
                Width = 190
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_VEHICULO'
                Width = 190
                Visible = True
              end>
          end
        end
      end
      object TSECommerce: TTabSheet [20]
        Caption = 'E-Commerce'
        ImageIndex = 21
        OnShow = TSECommerceShow
        object PCECommerce: TLFPageControl
          Left = 0
          Top = 0
          Width = 1197
          Height = 583
          ActivePage = TSECPrestashop
          Align = alClient
          Images = DMMain.ILMain_Ac
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSECPrestashop: TTabSheet
            Caption = 'Prestashop'
            object PNLDatosArticuloPrestashop: TLFPanel
              Left = 313
              Top = 22
              Width = 498
              Height = 532
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object TBArticuloEC: TLFToolBar
                Left = 0
                Top = 503
                Width = 498
                Height = 29
                Align = alBottom
                TabOrder = 3
                Separators = True
                object NavArticuloEC: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 174
                  Height = 22
                  DataSource = DMArticulos.DSQMArticuloECPrestashop
                  VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
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
              end
              object PNLPrestashopTop: TLFPanel
                Left = 0
                Top = 0
                Width = 498
                Height = 90
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  498
                  90)
                object LTituloECPrestashop: TLFLabel
                  Left = 40
                  Top = 32
                  Width = 26
                  Height = 13
                  Caption = 'Titulo'
                end
                object LReferenciaECPrestashop: TLFLabel
                  Left = 14
                  Top = 54
                  Width = 52
                  Height = 13
                  Caption = 'Referencia'
                end
                object DBETituloECPrestashop: TLFDbedit
                  Left = 72
                  Top = 28
                  Width = 397
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'TITULO'
                  DataSource = DMArticulos.DSQMArticuloECPrestashop
                  TabOrder = 0
                end
                object DBEReferenciaECPrestashop: TLFDbedit
                  Left = 72
                  Top = 50
                  Width = 121
                  Height = 21
                  DataField = 'REFERENCIA'
                  DataSource = DMArticulos.DSQMArticuloECPrestashop
                  TabOrder = 1
                end
              end
              object PNLPrestashopBottom: TLFPanel
                Left = 0
                Top = 443
                Width = 498
                Height = 60
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                DesignSize = (
                  498
                  60)
                object LStockECPrestashop: TLFLabel
                  Left = 319
                  Top = 24
                  Width = 28
                  Height = 13
                  Anchors = [akTop, akRight]
                  Caption = 'Stock'
                end
                object LPrecioECPrestashop: TLFLabel
                  Left = 37
                  Top = 24
                  Width = 30
                  Height = 13
                  Caption = 'Precio'
                end
                object DBEPrecioECPrestashop: TLFDbedit
                  Left = 72
                  Top = 20
                  Width = 95
                  Height = 21
                  DataField = 'PRECIO'
                  DataSource = DMArticulos.DSQMArticuloECPrestashop
                  TabOrder = 0
                end
                object DBEStockECPrestashop: TLFDbedit
                  Left = 353
                  Top = 20
                  Width = 121
                  Height = 21
                  Anchors = [akTop, akRight]
                  DataField = 'STOCK'
                  DataSource = DMArticulos.DSQMArticuloECPrestashop
                  TabOrder = 1
                end
              end
              object PNLPrestashopMiddle: TLFPanel
                Left = 0
                Top = 90
                Width = 498
                Height = 353
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                OnResize = PNLPrestashopMiddleResize
                object PNLPrestashopDescCorta: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 498
                  Height = 145
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'PNLPrestashopDescCorta'
                  TabOrder = 0
                  object LDescripcionCortaPrestashop: TLFLabel
                    Left = 0
                    Top = 0
                    Width = 83
                    Height = 13
                    Align = alTop
                    Caption = 'Descripcion corta'
                  end
                  object DBMDescripcionCortaPrestashop: TLFDBMemo
                    Left = 0
                    Top = 13
                    Width = 498
                    Height = 132
                    Align = alClient
                    DataField = 'DESCRIPCION_CORTA'
                    DataSource = DMArticulos.DSQMArticuloECPrestashop
                    TabOrder = 0
                  end
                end
                object PNLPrestashopDescLarga: TLFPanel
                  Left = 0
                  Top = 145
                  Width = 498
                  Height = 208
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object LDescripcionLargaPrestashop: TLFLabel
                    Left = 0
                    Top = 0
                    Width = 82
                    Height = 13
                    Align = alTop
                    Caption = 'Descripci'#243'n larga'
                  end
                  object DBMDescripcionLargaPrestashop: TLFDBMemo
                    Left = 0
                    Top = 13
                    Width = 498
                    Height = 195
                    Align = alClient
                    DataField = 'DESCRIPCION_LARGA'
                    DataSource = DMArticulos.DSQMArticuloECPrestashop
                    TabOrder = 0
                  end
                end
              end
            end
            object PNLECImagenPrestashop: TLFPanel
              Left = 0
              Top = 22
              Width = 313
              Height = 532
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object ImagenECPrestashop: TImage
                Left = 0
                Top = 21
                Width = 313
                Height = 511
                Align = alClient
                Proportional = True
                Stretch = True
              end
              object PNLImagenPrestashop: TLFPanel
                Left = 0
                Top = 0
                Width = 313
                Height = 21
                Align = alTop
                TabOrder = 0
                object DBImagenECPrestashop: TLFDBEditFind2000
                  Left = 0
                  Top = 0
                  Width = 48
                  Height = 21
                  Color = clInfoBk
                  DataField = 'IMAGEN'
                  DataSource = DMArticulos.DSQMArticulos
                  Enabled = False
                  TabOrder = 0
                  OnChange = DBImagenECPrestashopChange
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
                  Entorno = DMMain.EntornoBusqueda
                end
                object ETituloImagenECPrestashop: TLFEdit
                  Left = 49
                  Top = 0
                  Width = 261
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 1
                end
                object BECClipboardPrestashop: TButton
                  Left = 288
                  Top = 0
                  Width = 21
                  Height = 21
                  Caption = 'P'
                  TabOrder = 2
                  Visible = False
                  OnClick = BECClipboardPrestashopClick
                end
                object BECCargarImagenPrestashop: TButton
                  Left = 267
                  Top = 0
                  Width = 21
                  Height = 21
                  Caption = '...'
                  TabOrder = 3
                  Visible = False
                  OnClick = BECCargarImagenPrestashopClick
                end
              end
            end
            object PNLSincronizacionPrestashop: TLFPanel
              Left = 811
              Top = 22
              Width = 378
              Height = 532
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
              object LIDProductoPrestashop: TLFLabel
                Left = 74
                Top = 21
                Width = 57
                Height = 13
                Caption = 'ID Producto'
              end
              object LIDCombinacionPrestashop: TLFLabel
                Left = 56
                Top = 43
                Width = 75
                Height = 13
                Caption = 'ID Combinaci'#243'n'
              end
              object LIDAtributoPrestashop: TLFLabel
                Left = 82
                Top = 65
                Width = 50
                Height = 13
                Caption = 'ID Atributo'
              end
              object LUltSincronizacionPrestashop: TLFLabel
                Left = 44
                Top = 87
                Width = 88
                Height = 13
                Caption = 'Ult. Sincronizacion'
              end
              object DBEIDProductoPrestashop: TLFDbedit
                Left = 136
                Top = 16
                Width = 121
                Height = 21
                DataField = 'ID_PRODUCT'
                DataSource = DMArticulos.DSQMArticuloECPrestashop
                TabOrder = 0
              end
              object DBEIDAtributoPrestashop: TLFDbedit
                Left = 136
                Top = 60
                Width = 121
                Height = 21
                DataField = 'ID_ATTRIBUTE'
                DataSource = DMArticulos.DSQMArticuloECPrestashop
                TabOrder = 2
              end
              object DBDUltSincronizacionPrestashop: TLFDBDateEdit
                Left = 136
                Top = 82
                Width = 121
                Height = 21
                DataField = 'ULT_SINCRONIZACION'
                DataSource = DMArticulos.DSQMArticuloECPrestashop
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 3
              end
              object BtnSubirPrestashop: TButton
                Left = 80
                Top = 168
                Width = 75
                Height = 25
                Caption = 'Subir'
                TabOrder = 4
                OnClick = BtnSubirPrestashopClick
              end
              object BtnBajarPrestashop: TButton
                Left = 224
                Top = 168
                Width = 75
                Height = 25
                Caption = 'Bajar'
                TabOrder = 5
              end
              object DBEIDCombinacionPrestashop: TLFDbedit
                Left = 136
                Top = 38
                Width = 121
                Height = 21
                DataField = 'ID_PRODUCT_ATTRIBUTE'
                DataSource = DMArticulos.DSQMArticuloECPrestashop
                TabOrder = 1
              end
            end
            object TBArticuloTiendaEC: TLFToolBar
              Left = 0
              Top = 0
              Width = 1189
              Height = 22
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              EdgeInner = esNone
              EdgeOuter = esNone
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 3
              Separators = True
              object PNLECommerceArticulo: TLFPanel
                Left = 0
                Top = 0
                Width = 307
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object DBArticuloEC: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 69
                  Height = 21
                  Color = clInfoBk
                  DataField = 'ARTICULO'
                  DataSource = DMArticulos.DSQMArticulos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBArticuloTituloEC: TLFDbedit
                  Left = 70
                  Top = 0
                  Width = 234
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMArticulos.DSQMArticulos
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
                Left = 307
                Top = 0
                Width = 8
                ImageIndex = 0
                Style = tbsSeparator
              end
              object NavArticuloTiendaEC: THYMNavigator
                Left = 315
                Top = 0
                Width = 150
                Height = 22
                DataSource = DMArticulos.DSQMConfECPrestashop
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
                Left = 465
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object PNLTiendaPrestashop: TLFPanel
                Left = 473
                Top = 0
                Width = 307
                Height = 22
                BevelOuter = bvNone
                TabOrder = 2
                object DBETiendaPrestashop: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 69
                  Height = 21
                  Color = clInfoBk
                  DataField = 'ID'
                  DataSource = DMArticulos.DSQMConfECPrestashop
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
                  DataSource = DMArticulos.DSQMConfECPrestashop
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
              object TBSep4: TToolButton
                Left = 780
                Top = 0
                Width = 8
                ImageIndex = 1
                Style = tbsSeparator
              end
              object PNLFijarTiendaPrestashop: TLFPanel
                Left = 788
                Top = 0
                Width = 121
                Height = 22
                BevelOuter = bvNone
                TabOrder = 3
                object LFijarTiendaPrestashop: TLFLabel
                  Left = 9
                  Top = 4
                  Width = 55
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fijar Tienda'
                end
                object EFFijarTiendaPrestashop: TLFEditFind2000
                  Left = 72
                  Top = -1
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
            end
          end
          object TSECWoocommerce: TTabSheet
            Caption = 'Woocommerce'
            ImageIndex = 1
            object PnlSincronizacionWoocommerce: TLFPanel
              Left = 811
              Top = 22
              Width = 378
              Height = 532
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object LIDProductoWC: TLFLabel
                Left = 74
                Top = 21
                Width = 57
                Height = 13
                Caption = 'ID Producto'
              end
              object LUltSincronizacionWC: TLFLabel
                Left = 43
                Top = 65
                Width = 88
                Height = 13
                Caption = 'Ult. Sincronizaci'#243'n'
              end
              object LFLabel1: TLFLabel
                Left = 74
                Top = 43
                Width = 56
                Height = 13
                Caption = 'ID Variedad'
              end
              object DBEIDProductoWC: TLFDbedit
                Left = 136
                Top = 16
                Width = 121
                Height = 21
                DataField = 'ID_PRODUCT'
                DataSource = DMArticulos.DSQMArticuloECWoocommerce
                TabOrder = 0
              end
              object LFDBDateEdit1: TLFDBDateEdit
                Left = 136
                Top = 60
                Width = 121
                Height = 21
                DataField = 'ULT_SINCRONIZACION'
                DataSource = DMArticulos.DSQMArticuloECWoocommerce
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 2
              end
              object BtnSubirWC: TButton
                Left = 80
                Top = 168
                Width = 75
                Height = 25
                Caption = 'Subir'
                TabOrder = 3
                OnClick = BtnSubirWCClick
              end
              object BtnBajarWC: TButton
                Left = 224
                Top = 168
                Width = 75
                Height = 25
                Caption = 'Bajar'
                TabOrder = 4
              end
              object DBEIdVariation: TLFDbedit
                Left = 136
                Top = 38
                Width = 121
                Height = 21
                DataField = 'ID_VARIATION'
                DataSource = DMArticulos.DSQMArticuloECWoocommerce
                TabOrder = 1
              end
            end
            object TBArticuloWoocommerce: TLFToolBar
              Left = 0
              Top = 0
              Width = 1189
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
              object PNLWoocommerceArticulo: TLFPanel
                Left = 0
                Top = 0
                Width = 307
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object DBArticuloWC: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 69
                  Height = 21
                  Color = clInfoBk
                  DataField = 'ARTICULO'
                  DataSource = DMArticulos.DSQMArticulos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBArticuloTituloWC: TLFDbedit
                  Left = 70
                  Top = 0
                  Width = 234
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMArticulos.DSQMArticulos
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
              object TSep4: TToolButton
                Left = 307
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object NavTiendaWC: THYMNavigator
                Left = 315
                Top = 0
                Width = 150
                Height = 22
                DataSource = DMArticulos.DSQMConfECWoocommerce
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
              object TSep2: TToolButton
                Left = 465
                Top = 0
                Width = 8
                ImageIndex = 0
                Style = tbsSeparator
              end
              object PNLTiendaWoocommerce: TLFPanel
                Left = 473
                Top = 0
                Width = 307
                Height = 22
                BevelOuter = bvNone
                TabOrder = 2
                object DBTiendaWC: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 69
                  Height = 21
                  Color = clInfoBk
                  DataField = 'ID'
                  DataSource = DMArticulos.DSQMConfECWoocommerce
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBTiendaTituloWC: TLFDbedit
                  Left = 70
                  Top = 0
                  Width = 234
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMArticulos.DSQMConfECWoocommerce
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
            end
            object PNLDatosArticuloWoocommerce: TLFPanel
              Left = 313
              Top = 22
              Width = 498
              Height = 532
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object TBArticuloWC: TLFToolBar
                Left = 0
                Top = 503
                Width = 498
                Height = 29
                Align = alBottom
                TabOrder = 3
                Separators = True
                object NavArticuloWC: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 135
                  Height = 22
                  DataSource = DMArticulos.DSQMArticuloECWoocommerce
                  VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
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
              end
              object PNLWooCommerceTop: TLFPanel
                Left = 0
                Top = 0
                Width = 498
                Height = 90
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  498
                  90)
                object LTituloWC: TLFLabel
                  Left = 40
                  Top = 32
                  Width = 26
                  Height = 13
                  Caption = 'Titulo'
                end
                object LReferenciaWC: TLFLabel
                  Left = 14
                  Top = 54
                  Width = 52
                  Height = 13
                  Caption = 'Referencia'
                end
                object DBETituloWC: TLFDbedit
                  Left = 72
                  Top = 28
                  Width = 413
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'TITULO'
                  DataSource = DMArticulos.DSQMArticuloECWoocommerce
                  TabOrder = 0
                end
                object DBEReferenciaWC: TLFDbedit
                  Left = 72
                  Top = 50
                  Width = 121
                  Height = 21
                  DataField = 'REFERENCIA'
                  DataSource = DMArticulos.DSQMArticuloECWoocommerce
                  TabOrder = 1
                end
              end
              object PNLWooCommerceBottom: TLFPanel
                Left = 0
                Top = 443
                Width = 498
                Height = 60
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                DesignSize = (
                  498
                  60)
                object LStockWC: TLFLabel
                  Left = 319
                  Top = 24
                  Width = 28
                  Height = 13
                  Anchors = [akTop, akRight]
                  Caption = 'Stock'
                end
                object LPrecioWC: TLFLabel
                  Left = 37
                  Top = 24
                  Width = 30
                  Height = 13
                  Caption = 'Precio'
                end
                object DBEPrecioWC: TLFDbedit
                  Left = 72
                  Top = 20
                  Width = 121
                  Height = 21
                  DataField = 'PRECIO'
                  DataSource = DMArticulos.DSQMArticuloECWoocommerce
                  TabOrder = 0
                end
                object DBEStockWC: TLFDbedit
                  Left = 351
                  Top = 20
                  Width = 121
                  Height = 21
                  Anchors = [akTop, akRight]
                  DataField = 'STOCK'
                  DataSource = DMArticulos.DSQMArticuloECWoocommerce
                  TabOrder = 1
                end
              end
              object PNLWooCommerceMiddle: TLFPanel
                Left = 0
                Top = 90
                Width = 498
                Height = 353
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                OnResize = PNLWooCommerceMiddleResize
                object PNLWooCommerceDescCorta: TLFPanel
                  Left = 0
                  Top = 0
                  Width = 498
                  Height = 145
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object LDescripcionCortaWC: TLFLabel
                    Left = 0
                    Top = 0
                    Width = 83
                    Height = 13
                    Align = alTop
                    Caption = 'Descripcion corta'
                  end
                  object DBMDescripcionCortaWC: TLFDBMemo
                    Left = 0
                    Top = 13
                    Width = 498
                    Height = 132
                    Align = alClient
                    DataField = 'DESCRIPCION_CORTA'
                    DataSource = DMArticulos.DSQMArticuloECWoocommerce
                    TabOrder = 0
                  end
                end
                object PNLWooComerceDescLarga: TLFPanel
                  Left = 0
                  Top = 145
                  Width = 498
                  Height = 187
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object LDescripcionLargaWC: TLFLabel
                    Left = 0
                    Top = 0
                    Width = 82
                    Height = 13
                    Align = alTop
                    Caption = 'Descripci'#243'n larga'
                  end
                  object DBMDescripcionLargaWC: TLFDBMemo
                    Left = 0
                    Top = 13
                    Width = 498
                    Height = 174
                    Align = alClient
                    DataField = 'DESCRIPCION_LARGA'
                    DataSource = DMArticulos.DSQMArticuloECWoocommerce
                    TabOrder = 0
                  end
                end
              end
            end
            object PNLECImagenWoocommerce: TLFPanel
              Left = 0
              Top = 22
              Width = 313
              Height = 532
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 3
              object ImagenECWoocommerce: TImage
                Left = 0
                Top = 21
                Width = 313
                Height = 490
                Align = alClient
                Proportional = True
                Stretch = True
              end
              object PNLImagenWoocommerce: TLFPanel
                Left = 0
                Top = 0
                Width = 313
                Height = 21
                Align = alTop
                TabOrder = 0
                object DBImagenWC: TLFDBEditFind2000
                  Left = 0
                  Top = 0
                  Width = 48
                  Height = 21
                  Color = clInfoBk
                  DataField = 'IMAGEN'
                  DataSource = DMArticulos.DSQMArticulos
                  Enabled = False
                  TabOrder = 0
                  OnChange = DBImagenWCChange
                  AutoCambiarFoco = False
                  BuscarNums = False
                  Tabla_asociada.DesplegarBusqueda = False
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  Filtros = []
                end
                object ETituloImagenWC: TLFEdit
                  Left = 49
                  Top = 0
                  Width = 261
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 1
                end
                object BClipboardWC: TButton
                  Left = 288
                  Top = 0
                  Width = 21
                  Height = 21
                  Caption = 'P'
                  TabOrder = 2
                  Visible = False
                end
                object BCargarImagenWC: TButton
                  Left = 267
                  Top = 0
                  Width = 21
                  Height = 21
                  Caption = '...'
                  TabOrder = 3
                  Visible = False
                end
              end
            end
          end
        end
      end
      object TSAvisos: TTabSheet [21]
        Caption = 'Avisos'
        ImageIndex = 22
        OnShow = TSAvisosShow
        object TBAvisos: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLArticuloAvisos: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            TabOrder = 1
            object DBEAvisosArticulo: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBEAvisosTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavAvisos: THYMNavigator
            Left = 425
            Top = 0
            Width = 112
            Height = 21
            DataSource = DMArticulos.DSxAvisos
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAvisosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMAvisoOFC
            InsertaControl = DBMAvisoOFC
            Exclusivo = True
            ControlEdit = CEAvisos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLAvisos: TLFPanel
          Left = 0
          Top = 21
          Width = 1197
          Height = 562
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          OnResize = PNLAvisosResize
          object DBCBAvisoActivoOFC: TLFDBCheckBox
            Left = 5
            Top = 7
            Width = 338
            Height = 17
            Caption = 'Activo en Ofertas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_OFC'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoOFC: TLFDBMemo
            Left = 5
            Top = 24
            Width = 550
            Height = 70
            DataField = 'MENSAJE_OFC'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 1
          end
          object DBCBAvisoActivoPEC: TLFDBCheckBox
            Left = 5
            Top = 103
            Width = 338
            Height = 17
            Caption = 'Activo en Pedidos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_PEC'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoPEC: TLFDBMemo
            Left = 5
            Top = 120
            Width = 550
            Height = 70
            DataField = 'MENSAJE_PEC'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 3
          end
          object DBCBAvisoActivoALB: TLFDBCheckBox
            Left = 5
            Top = 191
            Width = 338
            Height = 17
            Caption = 'Activo en Albaranes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_ALB'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoALB: TLFDBMemo
            Left = 5
            Top = 208
            Width = 550
            Height = 70
            DataField = 'MENSAJE_ALB'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 5
          end
          object DBCBAvisoActivoFAC: TLFDBCheckBox
            Left = 5
            Top = 287
            Width = 338
            Height = 17
            Caption = 'Activo en Facturas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_FAC'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoFAC: TLFDBMemo
            Left = 5
            Top = 304
            Width = 550
            Height = 70
            DataField = 'MENSAJE_FAC'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 7
          end
          object DBCBAvisoActivoOCP: TLFDBCheckBox
            Left = 568
            Top = 103
            Width = 338
            Height = 17
            Caption = 'Activo en Propuestas Confirmadas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_OCP'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoOCP: TLFDBMemo
            Left = 568
            Top = 120
            Width = 550
            Height = 70
            DataField = 'MENSAJE_OCP'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 11
          end
          object DBCBAvisoActivoPEP: TLFDBCheckBox
            Left = 568
            Top = 199
            Width = 338
            Height = 17
            Caption = 'Activo en Pedidos a Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_PEP'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoPEP: TLFDBMemo
            Left = 568
            Top = 216
            Width = 550
            Height = 70
            DataField = 'MENSAJE_PEP'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 13
          end
          object DBCBAvisoActivoALP: TLFDBCheckBox
            Left = 568
            Top = 287
            Width = 338
            Height = 17
            Caption = 'Activo en Albaranes de Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_ALP'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoALP: TLFDBMemo
            Left = 568
            Top = 304
            Width = 550
            Height = 70
            DataField = 'MENSAJE_ALP'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 15
          end
          object DBCBAvisoActivoFAP: TLFDBCheckBox
            Left = 568
            Top = 383
            Width = 338
            Height = 17
            Caption = 'Activo en Facturas de Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 16
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_FAP'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoFAP: TLFDBMemo
            Left = 568
            Top = 400
            Width = 550
            Height = 70
            DataField = 'MENSAJE_FAP'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 17
          end
          object DBCBAvisoActivoOFP: TLFDBCheckBox
            Left = 568
            Top = 7
            Width = 338
            Height = 17
            Caption = 'Activo en Propuestas de Pedido a Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_OFP'
            DataSource = DMArticulos.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoOFP: TLFDBMemo
            Left = 568
            Top = 24
            Width = 550
            Height = 70
            DataField = 'MENSAJE_OFP'
            DataSource = DMArticulos.DSxAvisos
            TabOrder = 9
          end
        end
      end
      object TSBultos: TTabSheet [22]
        Caption = 'Bultos'
        ImageIndex = 23
        OnShow = TSBultosShow
        object TBBultos: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLArticuloBultos: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETituloArticuloBultos: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBEArticuloBultos: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavBultos: THYMNavigator
            Left = 425
            Top = 0
            Width = 240
            Height = 21
            DataSource = DMArticulos.DSxBultos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEBultosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEBultos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGBultos: TDBGridFind2000
          Left = 0
          Top = 21
          Width = 1197
          Height = 562
          Align = alClient
          DataSource = DMArticulos.DSxBultos
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = -1
          BaseDeDatos = DMMain.DataBase
          Transaction = DMArticulos.TLocal
          BuscarNums = False
          Campos.Strings = (
            'BULTO')
          CamposAMostrar.Strings = (
            'BULTO'
            '1'
            'BULTO')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'BULTO'
            'TITULO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'BULTO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_BULTOS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'TIPO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'BULTO'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 70
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1197
          Height = 583
          DataSource = DMArticulos.DSQMArticulos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'ABIERTO'
            'ACTUALIZA_VENTA'
            'BAJA'
            'BLOQUEO_COMPRAS'
            'BLOQUEO_VENTAS'
            'CONTROL_STOCK'
            'CONTROLA_MEDIDAS'
            'DEFECTO_UD_SECUNDARIA'
            'EXPORTAR'
            'GARANTIA'
            'INFLUYE_MARGEN'
            'IVA_ESCANDALLO'
            'LOTES'
            'LOTES_KRI'
            'NO_APLICA_DESC_LINEA_CLIENTE'
            'NO_CALCULA_STOCKMINMAX'
            'PREPARABLE'
            'PRODUCCION'
            'REQUIERE_LOTE_SIMPLE'
            'SERIALIZADO'
            'SERIALIZADO_KRI'
            'UBICABLE'
            'VIRTUAL'
            'WEB')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
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
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ABIERTO'
            'ADR_PACKAGE'
            'ALFA_1'
            'ALFA_2'
            'ALFA_3'
            'ALFA_4'
            'ALFA_5'
            'ALFA_6'
            'ALFA_7'
            'ALFA_8'
            'ALTO'
            'ANCHO'
            'ARTICULO'
            'BAJA'
            'BLOQUEO_COMPRAS'
            'BLOQUEO_VENTAS'
            'COD_COLOR_HILO'
            'CODIGO_INTRA'
            'CONTROL_STOCK'
            'CONTROLA_MEDIDAS'
            'CTA_ABONO_COMPRAS'
            'CTA_ABONO_VENTAS'
            'CTA_COMPRAS'
            'CTA_DEVOLUCION_COMPRAS'
            'CTA_DEVOLUCION_VENTAS'
            'CTA_VENTAS'
            'DESCUENTO'
            'DESCUENTO_2'
            'DESCUENTO_3'
            'DIAMETRO_UNIT'
            'DISPONIBILIDAD'
            'ECOTASA'
            'ESTRATEGIA_COMPRA'
            'EXPORTAR'
            'FABRICANTE'
            'FAMILIA'
            'FECHA_ALTA'
            'FECHA_BAJA'
            'FONDO'
            'ID_A'
            'IEPNR_CLAVE_PRODUCTO'
            'LITROS_POR_UNIDAD'
            'LOTES'
            'MARCA'
            'P_COSTE'
            'PARETO'
            'PASTADA_CANT_ETIQUETAS'
            'PASTADAS'
            'PESO'
            'PTO_VERDE'
            'REQUIERE_LOTE_SIMPLE'
            'SECCION'
            'SERIALIZADO'
            'SUBFAMILIA'
            'SUBTIPO_ARTICULO_TYC'
            'TASA_DE_DESTRUCCION'
            'TIPO_ARTICULO'
            'TIPO_ARTICULO_TYC'
            'TIPO_CLAVE_ADR'
            'TIPO_IBAE'
            'TIPO_IMPUESTO_ADICIONAL'
            'TIPO_IVA'
            'TIPO_REGISTRO_FITOSANITARIO'
            'TITULO'
            'TITULO_CORTO'
            'TITULO_LARGO'
            'TITULO_MARCA'
            'UBICABLE'
            'ULT_MODIFICACION'
            'UNIDADES'
            'VIRTUAL'
            'VOLUMEN_UNIT'
            'WEB')
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_LARGO'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COSTE'
              Title.Alignment = taRightJustify
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK_ALM'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LANZADA_ALM'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_FABRICANTE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_TARIFA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_MERCADO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PMP'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_A_M'
              Visible = True
            end>
        end
      end
      object TSLogistica: TTabSheet
        Caption = 'Logistica'
        ImageIndex = 24
        OnShow = TSLogisticaShow
        object TBLogistica: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLLogisticaArticulo: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBELogisticatitulo: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBELogisticaArticulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavLogistica: THYMNavigator
            Left = 425
            Top = 0
            Width = 240
            Height = 21
            DataSource = DMArticulos.DSxLogistica
            Flat = True
            ParentShowHint = False
            PopupMenu = CEBultosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLLogistica: TLFPanel
          Left = 0
          Top = 21
          Width = 1197
          Height = 562
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LEnvase: TLFLabel
            Left = 33
            Top = 8
            Width = 570
            Height = 13
            AutoSize = False
            Caption = 'Envase'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LCaja: TLFLabel
            Left = 33
            Top = 152
            Width = 570
            Height = 13
            AutoSize = False
            Caption = 'Caja'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LPalet: TLFLabel
            Left = 33
            Top = 319
            Width = 570
            Height = 13
            AutoSize = False
            Caption = 'Palet'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LEnvaseEAN13: TLFLabel
            Left = 97
            Top = 28
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'EAN13'
            FocusControl = DBEEnvaseEAN13
          end
          object LEnvasePesoGr: TLFLabel
            Left = 89
            Top = 52
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso (gr)'
            FocusControl = DBEEnvasePesoGr
          end
          object LEnvaseFondoCM: TLFLabel
            Left = 78
            Top = 76
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fondo (cm)'
            FocusControl = DBEEnvaseFondoCm
          end
          object LEnvaseAnchoCM: TLFLabel
            Left = 77
            Top = 100
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho (cm)'
            FocusControl = DBEEnvaseAnchoCm
          end
          object LEnvaseAltoCM: TLFLabel
            Left = 90
            Top = 124
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alto (cm)'
            FocusControl = DBEEnvaseAltoCm
          end
          object LFLabel2: TLFLabel
            Left = 95
            Top = 172
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'DUN14'
            FocusControl = DBECajaDUN14
          end
          object LCajaPesoGr: TLFLabel
            Left = 89
            Top = 220
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso (gr)'
            FocusControl = DBECajaPesoGr
          end
          object LCajaFondoCm: TLFLabel
            Left = 78
            Top = 244
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fondo (cm)'
            FocusControl = DBECajaFondoCm
          end
          object LCajaAnchoCm: TLFLabel
            Left = 77
            Top = 268
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho (cm)'
            FocusControl = DBECajaAnchoCm
          end
          object LCajaAltoCm: TLFLabel
            Left = 90
            Top = 292
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alto (cm)'
            FocusControl = DBECajaAltoCm
          end
          object LCajaUnidades: TLFLabel
            Left = 86
            Top = 196
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
            FocusControl = DBECajaUnidades
          end
          object LPaletPesoKg: TLFLabel
            Left = 86
            Top = 340
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso (kg)'
            FocusControl = DBEPaletPesoKg
          end
          object LPaletCajas: TLFLabel
            Left = 105
            Top = 364
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cajas'
            FocusControl = DBEPaletCajas
          end
          object LPaletCapas: TLFLabel
            Left = 101
            Top = 388
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Capas'
            FocusControl = DBEPaletCapas
          end
          object LPaletAltoM: TLFLabel
            Left = 96
            Top = 412
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alto (m)'
            FocusControl = DBEPaletAltoM
          end
          object DBEEnvaseEAN13: TLFDbedit
            Left = 136
            Top = 24
            Width = 339
            Height = 21
            DataField = 'EAN13'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 0
            OnChange = DBEEnvaseEAN13Change
          end
          object DBEEnvasePesoGr: TLFDbedit
            Left = 136
            Top = 48
            Width = 105
            Height = 21
            DataField = 'PESO_ENVASE_GR'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 2
          end
          object DBEEnvaseFondoCm: TLFDbedit
            Left = 136
            Top = 72
            Width = 105
            Height = 21
            DataField = 'FONDO_ENVASE_CM'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 3
          end
          object DBEEnvaseAnchoCm: TLFDbedit
            Left = 136
            Top = 96
            Width = 105
            Height = 21
            DataField = 'ANCHO_ENVASE_CM'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 4
          end
          object DBEEnvaseAltoCm: TLFDbedit
            Left = 136
            Top = 120
            Width = 105
            Height = 21
            DataField = 'ALTO_ENVASE_CM'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 5
          end
          object DBECajaDUN14: TLFDbedit
            Left = 136
            Top = 168
            Width = 339
            Height = 21
            DataField = 'DUN14'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 7
            OnChange = DBECajaDUN14Change
          end
          object DBECajaPesoGr: TLFDbedit
            Left = 136
            Top = 216
            Width = 105
            Height = 21
            DataField = 'PESO_CAJA_GR'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 10
          end
          object DBECajaFondoCm: TLFDbedit
            Left = 136
            Top = 240
            Width = 105
            Height = 21
            DataField = 'FONDO_CAJA_CM'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 11
          end
          object DBECajaAnchoCm: TLFDbedit
            Left = 136
            Top = 264
            Width = 105
            Height = 21
            DataField = 'ANCHO_CAJA_CM'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 12
          end
          object DBECajaAltoCm: TLFDbedit
            Left = 136
            Top = 288
            Width = 105
            Height = 21
            DataField = 'ALTO_CAJA_CM'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 13
          end
          object DBECajaUnidades: TLFDbedit
            Left = 136
            Top = 192
            Width = 105
            Height = 21
            DataField = 'UNIDADES_X_CAJA'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 9
          end
          object DBEPaletPesoKg: TLFDbedit
            Left = 136
            Top = 336
            Width = 105
            Height = 21
            DataField = 'PESO_PALET_KG'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 14
          end
          object DBEPaletCajas: TLFDbedit
            Left = 136
            Top = 360
            Width = 105
            Height = 21
            DataField = 'CAJAS_X_PALET'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 15
          end
          object DBEPaletCapas: TLFDbedit
            Left = 136
            Top = 384
            Width = 105
            Height = 21
            DataField = 'CAPAS_PALET'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 16
          end
          object DBEPaletAltoM: TLFDbedit
            Left = 136
            Top = 408
            Width = 105
            Height = 21
            DataField = 'ALTO_PALET_M'
            DataSource = DMArticulos.DSxLogistica
            TabOrder = 17
          end
          object BLogisticaAsignarEAN13: TButton
            Left = 480
            Top = 22
            Width = 113
            Height = 25
            Hint = 'Asignar a codigo de barras del art'#237'culo'
            Caption = 'Asignar a C. Barras'
            TabOrder = 1
            OnClick = BLogisticaAsignarEAN13Click
          end
          object BLogisticaAsignarDUN14: TButton
            Left = 480
            Top = 166
            Width = 113
            Height = 25
            Hint = 'Asignar a codigo de barras del art'#237'culo'
            Caption = 'Asignar a C. Barras'
            TabOrder = 8
            OnClick = BLogisticaAsignarDUN14Click
          end
          object BLogisticaAsignarMedidas: TButton
            Left = 248
            Top = 83
            Width = 113
            Height = 25
            Hint = 'Asignar a codigo de barras del art'#237'culo'
            Caption = 'Asignar a Ficha'
            TabOrder = 6
            OnClick = BLogisticaAsignarMedidasClick
          end
        end
      end
      object TSCaracteristicas: TTabSheet
        Caption = 'Caracteristicas'
        ImageIndex = 25
        OnShow = TSCaracteristicasShow
        object TBCaracteristicas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1197
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLArticuloCaracteristicas: TLFPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETituloArticuloCaracteristica: TLFDbedit
              Left = 121
              Top = 0
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMArticulos.DSQMArticulos
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
            object DBEArticuloCaracteristica: TLFDbedit
              Left = 0
              Top = 0
              Width = 120
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMArticulos.DSQMArticulos
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
          object NavCaracteristicas: THYMNavigator
            Left = 425
            Top = 0
            Width = 240
            Height = 21
            DataSource = DMArticulos.DSxCaracteristica
            Flat = True
            ParentShowHint = False
            PopupMenu = CECaracteristicasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGCaracteristicas
            InsertaControl = DBGCaracteristicas
            Exclusivo = True
            ControlEdit = CECaracteristicas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGCaracteristicas: TDBGridFind2000
          Left = 0
          Top = 21
          Width = 1197
          Height = 562
          Align = alClient
          DataSource = DMArticulos.DSxCaracteristica
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMArticulos.TLocal
          BuscarNums = False
          Campos.Strings = (
            'CODIGO')
          CamposAMostrar.Strings = (
            'CODIGO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_CARACTERISTICAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CODIGO'
            'TIPO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 401
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR1'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR2'
              Width = 200
              Visible = True
            end>
        end
      end
    end
    object PNLFiltroArticulo: TLFPanel
      Left = 2
      Top = 28
      Width = 1205
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LFiltroArticulo: TLFLabel
        Left = 110
        Top = 3
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art.'
      end
      object LFiltroCodigoBarra: TLFLabel
        Left = 485
        Top = 3
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cod. Bar.'
      end
      object LFiltroCliente: TLFLabel
        Left = 638
        Top = 3
        Width = 14
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cli.'
        Layout = tlCenter
      end
      object LFiltroProveedor: TLFLabel
        Left = 711
        Top = 3
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Prov.'
        Layout = tlCenter
      end
      object LFiltraRefProveedor: TLabel
        Left = 881
        Top = 3
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ref. Prov.'
        Layout = tlCenter
      end
      object LFiltraRefCliente: TLabel
        Left = 787
        Top = 3
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ref. Cli.'
        Layout = tlCenter
      end
      object LFamilia: TLFLabel
        Left = 12
        Top = 3
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fam.'
      end
      object EFArticulo: TLFEditFind2000
        Left = 130
        Top = 0
        Width = 100
        Height = 21
        TabOrder = 1
        OnChange = EFArticuloChange
        OnKeyUp = EFArticuloKeyUp
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFBarras: TLFEditFind2000
        Left = 533
        Top = 0
        Width = 100
        Height = 21
        TabOrder = 3
        OnChange = EFBarrasChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'BARRAS'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_ARTICULOS_BARRAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'BARRAS')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCliente: TLFEditFind2000
        Left = 655
        Top = 0
        Width = 49
        Height = 21
        Hint = 'Filtra articulos por cliente'
        TabOrder = 4
        OnChange = EFClienteChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'CLIENTE'
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFProveedor: TLFEditFind2000
        Left = 739
        Top = 0
        Width = 49
        Height = 21
        Hint = 'Filtra articulos por Proveedor'
        TabOrder = 5
        OnChange = EFProveedorChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'PROVEEDOR'
        CampoNum = 'PROVEEDOR'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_PROVEEDORES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ERefCliente: TLFEdit
        Left = 826
        Top = 0
        Width = 49
        Height = 21
        TabOrder = 6
        OnKeyPress = ERefClienteKeyPress
      end
      object ERefProveedor: TLFEdit
        Left = 930
        Top = 0
        Width = 49
        Height = 21
        TabOrder = 7
        OnKeyPress = ERefProveedorKeyPress
      end
      object EFFiltroFamilia: TLFEditFind2000
        Left = 39
        Top = 0
        Width = 60
        Height = 21
        TabOrder = 0
        OnChange = EFFiltroFamiliaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFiltroTitulo: TLFEdit
        Left = 231
        Top = 0
        Width = 250
        Height = 21
        TabOrder = 2
        OnKeyUp = EFiltroTituloKeyUp
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 663
    Width = 1209
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEIdiomas
    Left = 720
    Top = 112
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 752
    Top = 112
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
    object TSep1: TMenuItem
      Caption = '-'
    end
    object MIEscandallo: TMenuItem
      Caption = 'Escandallo'
      ShortCut = 49235
    end
  end
  inherited ALMain: TLFActionList
    Left = 688
    object AListadodeEtiquetasdeArticulos: TAction
      Category = 'Listados'
      Caption = 'Listado de Etiquetas de Articulos'
      Hint = 'Listado de Etiquetas de Articulos'
      ImageIndex = 95
      OnExecute = AListadodeEtiquetasdeArticulosExecute
    end
    object AEscandallo: TAction
      Category = 'Otros'
      Caption = 'Escandallo'
      Hint = 'Escandallo de Art'#237'culos'
      ImageIndex = 10
      OnExecute = AEscandalloExecute
    end
    object AInfoStocks: TAction
      Category = 'Especiales'
      Caption = 'Informaci'#243'n de Stocks'
      Hint = 'Informaci'#243'n de Stocks'
      ImageIndex = 1
      OnExecute = AInfoStocksExecute
    end
    object ANoCalcularStock: TAction
      Category = 'Calculos;Stock;Almacen'
      Caption = 'No calcular stock'
      ImageIndex = 27
      OnExecute = AStockAlmacenExecute
    end
    object AHistPrecios: TAction
      Category = 'Especiales'
      Caption = 'Hist'#243'rico de Precios'
      Hint = 'Hist'#243'rico de Precios'
      ImageIndex = 56
      OnExecute = AHistPreciosExecute
    end
    object AMargen: TLFDatasetAction
      Category = 'Especiales'
      Caption = 'Propaga el margen a todas las Tarifas'
      Hint = 'Propaga el margen a todas las Tarifas'
      ImageIndex = 86
      OnExecute = AMargenExecute
      DataSource = DMArticulos.DSQMArticulosPrecios
    end
    object AGenerarCodBarras: TLFDatasetAction
      Category = 'Especiales'
      Caption = 'Generar C'#243'digos de Barras Autom'#225'ticamente a TODOS los Art'#237'culos'
      Hint = 'Generar C'#243'digos de Barras autom'#225'ticamente a TODOS los Art'#237'culos'
      ImageIndex = 38
      OnExecute = AGenerarCodBarrasExecute
      DataSource = DMArticulos.DSCodigoBarra
    end
    object AHerencia: TLFDatasetAction
      Category = 'Especiales'
      Caption = 'Heredar las Cuentas de la Familia'
      Hint = 'Heredar las Cuentas de la Familia'
      ImageIndex = 97
      OnExecute = AHerenciaExecute
      DataSource = DMArticulos.DSQMSeries
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Especiales'
      Caption = 'Especiales'
      ImageIndex = 58
    end
    object ALstArticulos: TAction
      Category = 'Listados'
      Caption = 'Listado de Art'#237'culos'
      Hint = 'Listado de Art'#237'culos'
      ImageIndex = 14
      OnExecute = ALstArticulosExecute
    end
    object ALstMovArt: TAction
      Category = 'Listados'
      Caption = 'Listado de Movimientos de Art'#237'culos'
      Hint = 'Listado de Movimientos de Art'#237'culos'
      ImageIndex = 14
      OnExecute = ALstMovArtExecute
    end
    object ALstMovsResumido: TAction
      Category = 'Listados'
      Caption = 'Listado de Movimientos Resumido'
      Hint = 'Listado de Movimientos Resumido'
      ImageIndex = 14
      OnExecute = ALstMovsResumidoExecute
    end
    object ALstAgrupacionArt: TAction
      Category = 'Listados'
      Caption = 'Listado de Art'#237'culos por Agrupaci'#243'n'
      Hint = 'Listado de Art'#237'culos por Agrupaci'#243'n'
      ImageIndex = 14
      OnExecute = ALstAgrupacionArtExecute
    end
    object AAjustaConFamilia: TAction
      Category = 'Procesos'
      Caption = 
        'Ajustar cuentas contables+IVA a las de la Familia para este Art'#237 +
        'culo'
      Hint = 
        'Ajustar cuentas contables+IVA a las de la Familia para este Art'#237 +
        'culo [Ctrl+Alt+F]'
      ImageIndex = 19
      ShortCut = 49222
      OnExecute = AAjustaConFamiliaExecute
    end
    object AAdjuntosArticulo: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Art'#237'culo'
      ImageIndex = 59
      OnExecute = AAdjuntosArticuloExecute
    end
    object AListCodBarras1: TAction
      Category = 'Listados'
      Caption = 'Listado de C'#243'digo de Barras'
      Hint = 'Listado de C'#243'digo de Barras'
      ImageIndex = 38
      OnExecute = AListCodBarrasExecute
    end
    object ACodigosBarras: TAction
      Category = 'Listados'
      Caption = 'Mantenimiento de Impresi'#243'n de C'#243'digos de Barras'
      Hint = 'Mantenimiento de Impresi'#243'n de C'#243'digos de Barras'
      ImageIndex = 38
      OnExecute = ACodigosBarrasExecute
    end
    object ALstArticuloProv: TAction
      Category = 'Listados'
      Caption = 'Listado Articulos Proveedor'
      Hint = 'Listado Articulos Proveedor'
      ImageIndex = 14
      OnExecute = ALstArticuloProvExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfListArt: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Art'#237'culos'
      Hint = 'Listados de Art'#237'culos'
      ImageIndex = 77
      OnExecute = AConfListArtExecute
    end
    object AConfListMovArt: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Mov. Art'#237'culos'
      Hint = 'Listado de Mov. Art'#237'culos'
      ImageIndex = 77
      OnExecute = AConfListMovArtExecute
    end
    object AConfLstMovResumido: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Movimientos Resumido'
      Hint = 'Listado de Movimientos Resumido'
      ImageIndex = 77
      OnExecute = AConfLstMovResumidoExecute
    end
    object AConfCodBarras: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de C'#243'digo de Barras'
      Hint = 'Listado de C'#243'digo de Barras'
      ImageIndex = 77
      OnExecute = AConfCodBarrasExecute
    end
    object AConfLstArticulosProv: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Articulos Proveedor'
      Hint = 'Listado  Articulos Proveedor'
      ImageIndex = 77
      OnExecute = AConfLstArticulosProvExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AVentasArt: TAction
      Category = 'Otros'
      Caption = 'Ventas a Clientes'
      Hint = 'Ventas del Art'#237'culo a Clientes'
      ImageIndex = 125
      OnExecute = AVentasArtExecute
    end
    object AControlLotes: TAction
      Category = 'Otros'
      Caption = 'Control de Lotes'
      Hint = 'Control de Lotes'
      ImageIndex = 120
      OnExecute = AControlLotesExecute
    end
    object AClientesArticulo: TAction
      Category = 'Otros'
      Caption = 'Clientes del Art'#237'culo'
      Hint = 'Clientes del Art'#237'culo'
      ImageIndex = 89
      OnExecute = AClientesArticuloExecute
    end
    object AProveedoresArticulo: TAction
      Category = 'Otros'
      Caption = 'Proveedores del Art'#237'culo'
      Hint = 'Proveedores del Art'#237'culo'
      ImageIndex = 89
      OnExecute = AProveedoresArticuloExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AAjustarCuentas: TAction
      Category = 'Procesos'
      Caption = 'Regenerar cuentas contables de todos los Art'#237'culos'
      Hint = 'Regenerar cuentas contables de todos los Art'#237'culos [Ctrl+Alt+U]'
      ImageIndex = 25
      ShortCut = 49237
      OnExecute = AAjustarCuentasExecute
    end
    object AAjustarFamiliasArt: TAction
      Tag = 1
      Category = 'Procesos'
      Caption = 
        'Ajustar cuentas contables+IVA a las de la Familia en todos los A' +
        'rt'#237'culos'
      Hint = 
        'Ajustar cuentas contables+IVA a las de la Familia en todos los A' +
        'rt'#237'culos [Ctrl+Alt+A]'
      ImageIndex = 119
      ShortCut = 49217
      OnExecute = AAjustarCuentasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AVerArtSistema: TAction
      Category = 'Procesos'
      Caption = 'Visualizar Art'#237'culos del Sistema'
      Hint = 'Visualizar Art'#237'culos del Sistema'
      ImageIndex = 7
      OnExecute = AVerArtSistemaExecute
    end
    object AUbicacionArticulo: TLFDatasetAction
      Category = 'Especiales'
      Caption = 'Ubicaci'#243'n en el almac'#233'n'
      Hint = 'Ubicaci'#243'n del art'#237'culo en el almac'#233'n'
      ImageIndex = 81
      OnExecute = AUbicacionArticuloExecute
      DataSource = DMArticulos.DSQMArticulos
    end
    object ABuscaPorCodProv: TAction
      Category = 'Otros'
      Caption = 'Busca por Codigo de Proveedor'
      Hint = 'Busca por Codigo de Proveedor'
      ImageIndex = 64
      OnExecute = ABuscaPorCodProvExecute
    end
    object ABuscaPorCodCli: TAction
      Category = 'Otros'
      Caption = 'Busca por Codigo de Cliente'
      Hint = 'Busca por Codigo de Cliente'
      ImageIndex = 104
      OnExecute = ABuscaPorCodCliExecute
    end
    object ACambiarCodigo: TAction
      Category = 'Procesos'
      Caption = 'Cambiar el c'#243'digo del Art'#237'culo'
      Hint = 'Cambiar el c'#243'digo del Art'#237'culo'
      ImageIndex = 109
      OnExecute = ACambiarCodigoExecute
    end
    object ZADatosToldo: TAction
      Category = 'Otros'
      Caption = 'Datos Especiales Toldo'
      Hint = 'Ver datos especiales del art'#237'culo Toldo'
      ImageIndex = 31
      OnExecute = ZADatosToldoExecute
    end
    object AHistoricoSerializacion: TAction
      Category = 'Otros'
      Caption = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      Hint = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      ImageIndex = 115
      OnExecute = AHistoricoSerializacionExecute
    end
    object ADuplicaArticuloKri: TAction
      Category = 'Procesos'
      Caption = 'Duplica Art'#237'culo'
      ImageIndex = 37
      OnExecute = ADuplicaArticuloKriExecute
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object ARecalculaStockUbicaciones: TAction
      Category = 'Especiales'
      Caption = 'Recalcula Stock Ubicaciones'
      Hint = 'Recalcula el stock de las unidades ubicadas'
      ImageIndex = 80
      OnExecute = ARecalculaStockUbicacionesExecute
    end
    object AIniciaRecalculo: TAction
      Category = 'Especiales'
      Caption = 'Inicia Recalculo Ubicaciones'
      Hint = 'Inicia Recalculo Ubicaciones de los articulos filtrados'
      ImageIndex = 3
      OnExecute = AIniciaRecalculoExecute
    end
    object AParaRecalculo: TAction
      Category = 'Especiales'
      Caption = 'Para Recalculo'
      ImageIndex = 39
      OnExecute = AParaRecalculoExecute
    end
    object AFichaTec: TAction
      Category = 'Otros'
      Caption = 'Ficha Tecnica'
      Hint = 'Abrir ficha tecnica actual'
      ImageIndex = 32
      OnExecute = AFichaTecExecute
    end
    object AImprimirNotas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Notas'
      Hint = 'Imprimir Notas'
      ImageIndex = 14
      OnExecute = AImprimirNotasExecute
    end
    object AGaleria: TAction
      Category = 'Otros'
      Caption = 'Abre Galeria'
      Hint = 'Abre la galer'#237'a de im'#225'genes de este articulo'
      ImageIndex = 28
      OnExecute = AGaleriaExecute
    end
    object ADocumentos: TAction
      Category = 'Otros'
      Caption = 'Documentos'
      Hint = 'Documentos asociados al articulo'
      ImageIndex = 87
      OnExecute = ADocumentosExecute
    end
    object AFiltraEscandallosProd: TAction
      Category = 'Otros'
      Caption = 'Filtra Escandallos de Produccion'
      Hint = 
        'Muestra las fichas de los escandallos de produccion pertenecient' +
        'es a este modelo'
      ImageIndex = 10
      OnExecute = AFiltraEscandallosProdExecute
    end
    object AFiltraEscandalloProdComponente: TAction
      Category = 'Otros'
      Caption = 'Filtra Escandallo (Componente)'
      Hint = 
        'Filtra los escandallos que contienen este componente dentro de s' +
        'u lista de materiales.'
      ImageIndex = 5
      OnExecute = AFiltraEscandalloProdComponenteExecute
    end
    object LFCategoryAction7: TLFCategoryAction
      Category = 'Calculos;Stock'
      Caption = 'Stock'
      ImageIndex = 3
    end
    object LFCategoryAction8: TLFCategoryAction
      Category = 'Calculos;Stock;Almacen'
      Caption = 'Almacen'
      ImageIndex = 128
    end
    object LFCategoryAction9: TLFCategoryAction
      Category = 'Calculos'
      Caption = 'C'#225'lculos'
      ImageIndex = 3
    end
    object LFCategoryAction10: TLFCategoryAction
      Category = 'Calculos;Precio;Tarifa'
      Caption = 'Tarifa'
      ImageIndex = 33
    end
    object ANoCalcularTarifa: TAction
      Category = 'Calculos;Precio;Tarifa'
      Caption = 'No calcular Tarifa'
      ImageIndex = 27
      OnExecute = APrecioTarifaExecute
    end
    object LFCategoryAction11: TLFCategoryAction
      Category = 'Calculos;Precio'
      Caption = 'Precio'
      ImageIndex = 3
    end
    object AModelo: TAction
      Category = 'Otros'
      Caption = 'Filtra Modelo'
      Hint = 'Muestra ficha del Modelo del articulo seleccionado'
      ImageIndex = 133
      OnExecute = AModeloExecute
    end
    object AFiltraAgrupacion: TAction
      Category = 'Procesos'
      Caption = 'Filtrado de Articulos por Agrupaci'#243'n'
      Hint = 'Filtrado de Articulos por Agrupaci'#243'n'
      ImageIndex = 5
      OnExecute = AFiltraAgrupacionExecute
    end
    object LFCategoryAction12: TLFCategoryAction
      Category = 'Calculos;Lanzadas'
      Caption = 'Lanzadas'
      ImageIndex = 3
    end
    object LFCategoryAction13: TLFCategoryAction
      Category = 'Calculos;Lanzadas;Almacen'
      Caption = 'Almacen'
      ImageIndex = 128
    end
    object ANoCalcularLanzads: TAction
      Category = 'Calculos;Lanzadas;Almacen'
      Caption = 'No calcular Lanzads'
      Hint = 'No calcular Lanzads'
      ImageIndex = 27
      OnExecute = ALanzadaAlmacenExecute
    end
    object AFiltraEscandalloProdSimpComponente: TAction
      Category = 'Otros'
      Caption = 'Filtra Escandallo (Componente)'
      Hint = 
        'Filtra los escandallos que contienen este componente dentro de s' +
        'u lista de materiales.'
      ImageIndex = 5
      OnExecute = AFiltraEscandalloProdSimpComponenteExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'HYDBGPedidosAProveedor.Columns'
      'HYDBGPedidosDeCliente.Columns'
      'HYDBGPropuestas.Columns'
      'HYDBGPropuestasConfir.Columns'
      'CBSepararAlmacenes.Checked'
      'CBCalcularPMPMovimientos.Checked'
      'EFFijarTiendaPrestashop.Text')
    Left = 760
  end
  object CEPrecios: TControlEdit
    EnlazadoA = CEProveedores
    FichaEdicion = TSPrecios
    FichaExclusiva = TSPrecios
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEPreciosPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 80
  end
  object CEPreciosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 752
    Top = 208
    object CEPreciosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
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
  object CEStocks: TControlEdit
    EnlazadoA = CEFabricacion
    FichaEdicion = TSStocks
    FichaExclusiva = TSStocks
    PanelEdicion = PNLCabStocks
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEStocksPMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 144
  end
  object CEStocksPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 752
    Top = 144
    object CEStocksMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEStocksMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEStocksMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEStocksMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEStocksMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEStocksMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEStocksMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEStocksMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEStocksMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEStocksMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ACalculaStockMinMax: TAction
    Category = 'Macros'
    Caption = 'Calcula Stock Min Max'
    Hint = 'Calcula Stock Min Max'
    ImageIndex = 3
    OnExecute = ACalculaStockMinMaxExecute
  end
  object AStockTyC: TAction
    Category = 'Macros'
    Caption = 'Stock Tallas y Colores'
    Hint = 'Stock tallas y colores'
    ImageIndex = 128
    OnExecute = AStockTyCExecute
  end
  object CENotas: TControlEdit
    EnlazadoA = CEBarras
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLNotas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 176
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 688
    Top = 176
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
    end
  end
  object CodBarras: TCodeBar
    Alto = 100
    OrigenY = 0
    OrigenX = 0
    Modulo = 1
    Ratio = 2
    ChequearDigito = False
    TipoChequeo = csmModulo10
    Porcentaje = 20
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 720
    Top = 48
  end
  object CEBarras: TControlEdit
    EnlazadoA = CESeries
    FichaEdicion = TSCodBarra
    FichaExclusiva = TSCodBarra
    SubComplementario = ALMain
    PopUpMenu = CEBarrasPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 208
  end
  object CEBarrasPMEdit: TPopUpTeclas
    Left = 688
    Top = 208
    object CEBarrasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEBarrasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEBarrasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEBarrasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEBarrasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEBarrasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEBarrasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEBarrasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEBarrasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEBarrasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEFabricacion: TControlEdit
    EnlazadoA = CEPreciosBase
    FichaEdicion = TSFabricacion
    FichaExclusiva = TSFabricacion
    Complementario = TBPrecios
    SubComplementario = ALMain
    PopUpMenu = CEFabricacionPMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 176
  end
  object CEFabricacionPMEdit: TPopUpTeclas
    Left = 752
    Top = 176
    object CEFabricacionMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEFabricacionMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFabricacionMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFabricacionMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEFabricacionMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEFabricacionMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEFabricacionMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEFabricacionMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEFabricacionMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEFabricacionMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEProveedores: TControlEdit
    EnlazadoA = CENotas
    FichaEdicion = TSProveedores
    FichaExclusiva = TSProveedores
    PanelEdicion = PNLCabProveedores
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEProveedoresPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 144
  end
  object CEProveedoresPMEdit: TPopUpTeclas
    Left = 688
    Top = 144
    object CEProveedoresMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEProveedoresMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEProveedoresMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEProveedoresMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEProveedoresMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEProveedoresMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEProveedoresMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEProveedoresMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEProveedoresMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEProveedoresMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CESeries: TControlEdit
    EnlazadoA = CEImagenes
    FichaEdicion = TSFichaSeries
    FichaExclusiva = TSFichaSeries
    PanelEdicion = PNSeries
    SubComplementario = ALMain
    PopUpMenu = CESeriesPMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 240
  end
  object CESeriesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 752
    Top = 240
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
  object CEPreciosBase: TControlEdit
    EnlazadoA = CEPrecios
    FichaEdicion = TSPrecios
    FichaExclusiva = TSPrecios
    PanelEdicion = PNLPrecios
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEPreciosBasePMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 208
  end
  object CEPreciosBasePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 688
    Top = 80
    object CEPreciosBaseMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEPreciosBaseMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEPreciosBaseMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEPreciosBaseMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEPreciosBaseMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEPreciosBaseMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEPreciosBaseMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPreciosBaseMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPreciosBaseMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPreciosBaseMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEImagenes: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSImagenes
    FichaExclusiva = TSImagenes
    PanelEdicion = PEditImagenes
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEImagenesPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 240
  end
  object CEImagenesPMEdit: TPopUpTeclas
    Left = 688
    Top = 240
    object CEImagenesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEImagenesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEImagenesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEImagenesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEImagenesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEImagenesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEImagenesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEIdiomas: TControlEdit
    EnlazadoA = CEUnidadesLogisitcas
    FichaEdicion = TSIdioma
    FichaExclusiva = TSIdioma
    PanelEdicion = PNIdiomas1
    PopUpMenu = CEIdiomasPMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 80
  end
  object CEIdiomasPMEdit: TPopUpTeclas
    Left = 752
    Top = 80
    object CEIdiomasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEIdiomasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEIdiomasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEIdiomasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEIdiomasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEIdiomasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEIdiomasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEIdiomasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEIdiomasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEIdiomasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEProyectos: TControlEdit
    EnlazadoA = CESeries
    FichaEdicion = TSProyectos
    FichaExclusiva = TSProyectos
    PanelEdicion = PNProyectos
    SubComplementario = ALMain
    PopUpMenu = CEProyectosPMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 272
  end
  object CEProyectosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 752
    Top = 272
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
  object CEProyectosSeries: TControlEdit
    EnlazadoA = CEProyectos
    FichaEdicion = TSProySeries
    FichaExclusiva = TSProySeries
    PanelEdicion = PNProySeries
    SubComplementario = ALMain
    PopUpMenu = CEProyectosSeriesPMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 304
  end
  object CEProyectosSeriesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 752
    Top = 304
    object CEProyectosSeriesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEProyectosSeriesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEProyectosSeriesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEProyectosSeriesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEProyectosSeriesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEProyectosSeriesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEProyectosSeriesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEProyectosSeriesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEProyectosSeriesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEProyectosSeriesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEUnidadesLogisitcas: TControlEdit
    EnlazadoA = CEStocks
    FichaEdicion = TSUnidadesLogisitcas
    FichaExclusiva = TSUnidadesLogisitcas
    PanelEdicion = PNLUnidadesLogisitcas
    PopUpMenu = PMUnidadesLogisitcas
    Teclas = DMMain.Teclas
    Left = 656
    Top = 112
  end
  object PMUnidadesLogisitcas: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 688
    Top = 112
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
      Visible = False
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
      Visible = False
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
      Caption = 'Primero'
      ShortCut = 16464
    end
    object MenuItem12: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object MenuItem13: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object MenuItem14: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object MenuItem15: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object MenuItem16: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object MenuItem17: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object MenuItem18: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object MenuItem19: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object MenuItem20: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CESimilares: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSSimilares
    FichaExclusiva = TSSimilares
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CESimilaresPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 272
  end
  object CESimilaresPMEdit: TPopUpTeclas
    Left = 688
    Top = 272
    object MenuItem21: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object MenuItem22: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object MenuItem23: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object MenuItem24: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object MenuItem25: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem26: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem27: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object MenuItem28: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem29: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem30: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEClientes: TControlEdit
    EnlazadoA = CENotas
    FichaEdicion = TSClientes
    SubComplementario = ALMain
    PopUpMenu = CEClientesPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 304
  end
  object CEClientesPMEdit: TPopUpTeclas
    Left = 688
    Top = 304
    object CEClientesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEClientesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEClientesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEClientesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEClientesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEClientesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEClientesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEClientesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEClientesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEClientesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECombincaciones: TControlEdit
    DataSource = DMArticulos.DSxCombinaciones
    EnlazadoA = CECommerce
    SubComplementario = ALMain
    PopUpMenu = CECombincacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 336
  end
  object CECombincacionesPMEdit: TPopUpTeclas
    Left = 688
    Top = 336
    object CECombincacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECombincacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECombincacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECombincacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECombincacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECombincacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECombincacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECombincacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECombincacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECombincacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEECommercePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 688
    Top = 368
  end
  object CECommerce: TControlEdit
    DataSource = DMArticulos.DSQMConfECPrestashop
    EnlazadoA = CEAvisos
    SubComplementario = ALMain
    PopUpMenu = CEECommercePMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 368
  end
  object CEArticuloPrestashopCE: TControlEdit
    DataSource = DMArticulos.DSQMArticuloECPrestashop
    SubComplementario = ALMain
    PopUpMenu = CEArticuloCEPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 400
  end
  object CEArticuloCEPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 688
    Top = 400
  end
  object TPopUpTeclas
    Left = 752
    Top = 464
  end
  object CEArticuloPrestashopCEPMEdit: TPopUpTeclas
    Left = 752
    Top = 432
  end
  object CEArticuloWC: TControlEdit
    DataSource = DMArticulos.DSQMArticuloECWoocommerce
    SubComplementario = ALMain
    PopUpMenu = CEArticuloWCPMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 400
  end
  object CEArticuloWCPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 752
    Top = 400
  end
  object CEWoocommerce: TControlEdit
    DataSource = DMArticulos.DSQMConfECWoocommerce
    SubComplementario = ALMain
    PopUpMenu = CEWoocommercePMEdit
    Teclas = DMMain.Teclas
    Left = 720
    Top = 368
  end
  object CEWoocommercePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 752
    Top = 368
  end
  object CEAvisos: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PNLAvisos
    PopUpMenu = CEAvisosPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 432
  end
  object CEAvisosPMEdit: TPopUpTeclas
    Left = 688
    Top = 432
    object CEAvisosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEAvisosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEAvisosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEAvisosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEAvisosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAvisosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAvisosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAvisosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAvisosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAvisosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEBultos: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEBultosPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 464
  end
  object CEBultosPMEdit: TPopUpTeclas
    Left = 688
    Top = 464
    object CEBultosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEBultosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEBultosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEBultosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEBultosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEBultosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEBultosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEBultosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEBultosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEBultosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object TMRFiltro: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TMRFiltroTimer
    Left = 1000
    Top = 24
  end
  object tmrStockFuturo: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tmrStockFuturoTimer
    Left = 1032
    Top = 24
  end
  object CECaracteristicas: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CECaracteristicasPMEdit
    Teclas = DMMain.Teclas
    Left = 656
    Top = 496
  end
  object CECaracteristicasPMEdit: TPopUpTeclas
    Left = 688
    Top = 496
    object CECaracteristicasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECaracteristicasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECaracteristicasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECaracteristicasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECaracteristicasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECaracteristicasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECaracteristicasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECaracteristicasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECaracteristicasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECaracteristicasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
