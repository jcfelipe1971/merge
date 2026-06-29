object FMain: TFMain
  Left = 313
  Top = 264
  Width = 895
  Height = 454
  HelpContext = 1
  Align = alTop
  Caption = 'Merge'
  Color = clBtnFace
  Constraints.MinWidth = 652
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatBarMain: TStatusBar
    Left = 0
    Top = 353
    Width = 887
    Height = 19
    Panels = <
      item
        Bevel = pbNone
        Text = 'Fecha'
        Width = 250
      end
      item
        Bevel = pbNone
        Text = 'Usuario'
        Width = 45
      end
      item
        Bevel = pbNone
        Text = 'Nombre'
        Width = 100
      end
      item
        Bevel = pbNone
        Text = 'Nivel'
        Width = 35
      end
      item
        Alignment = taCenter
        Bevel = pbNone
        Text = '0'
        Width = 15
      end
      item
        Alignment = taCenter
        Bevel = pbNone
        Style = psOwnerDraw
        Text = 'Servicio Verifactu'
        Width = 150
      end
      item
        Bevel = pbRaised
        Text = 'Hint'
        Width = 220
      end>
    ParentColor = True
    SimplePanel = False
    OnDrawPanel = StatBarMainDrawPanel
  end
  object PNLSistema: TLFPanel
    Left = 0
    Top = 0
    Width = 887
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object PNLBotonesRapidos: TLFPanel
      Left = 1
      Top = 1
      Width = 144
      Height = 63
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object TBUtilidades: TLFToolBar
        Left = 0
        Top = 0
        Width = 144
        Height = 63
        Align = alClient
        AutoSize = True
        BorderWidth = 1
        ButtonHeight = 25
        ButtonWidth = 30
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object TButtSalir: TToolButton
          Left = 0
          Top = 0
          Action = ASalir
        end
        object TButtFecha: TToolButton
          Left = 30
          Top = 0
          Action = ACambiaFecha
        end
        object TButtMultiCambio: TToolButton
          Left = 60
          Top = 0
          Action = ACambiaUser
          DropdownMenu = PopUpMultiCambioEjercicio
          PopupMenu = PopUpMultiCambioEjercicio
          Wrap = True
          Style = tbsDropDown
        end
        object TButtAviso: TToolButton
          Left = 0
          Top = 25
          Action = AAvisos
        end
        object TButtFondo: TToolButton
          Left = 30
          Top = 25
          Action = AFondo
        end
        object TBMuestraMenu: TToolButton
          Left = 60
          Top = 25
          Action = AMuestraMenu
        end
        object TBAgenda: TToolButton
          Left = 90
          Top = 25
          Action = AAgenda
        end
      end
    end
    object PNLPestanyas: TLFPanel
      Left = 145
      Top = 1
      Width = 741
      Height = 63
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object PCMain: TLFPageControl
        Left = 0
        Top = 0
        Width = 741
        Height = 63
        ActivePage = TSEmpresa
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OwnerDraw = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabIndex = 0
        TabOrder = 0
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSEmpresa: TTabSheet
          Caption = '&Empresas'
          object TBEmpresas: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 125
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtEmpresas: TToolButton
              Left = 0
              Top = 0
              Action = AEmpresas
              AutoSize = True
            end
            object TButtEjercicios: TToolButton
              Left = 53
              Top = 0
              Action = AGenEjercicios
              AutoSize = True
              Caption = 'Ejercicios'
            end
            object TButtCanales: TToolButton
              Left = 104
              Top = 0
              Action = AGenCanales
              AutoSize = True
              Caption = 'Canales'
            end
            object TButtSeries: TToolButton
              Left = 149
              Top = 0
              Action = AGenSeries
              AutoSize = True
              Caption = 'Series'
            end
            object TButtCampanyas: TToolButton
              Left = 186
              Top = 0
              Action = ACampanyas
              AutoSize = True
              Caption = 'Campa'#241'as'
            end
            object TButtPeriodos: TToolButton
              Left = 242
              Top = 0
              Action = AGenPeriodos
              AutoSize = True
              Caption = 'Periodos'
            end
            object TButtProyectos: TToolButton
              Left = 289
              Top = 0
              Action = AProyectos
              AutoSize = True
            end
            object TButtPropagacion: TToolButton
              Left = 343
              Top = 0
              Action = APropagaEmpresa
              AutoSize = True
            end
            object TButtFormasPago: TToolButton
              Left = 445
              Top = 0
              Action = AFormasPago
              AutoSize = True
              Caption = 'F. de Pago'
            end
            object TButtTrsEjer: TToolButton
              Left = 502
              Top = 0
              Action = ATraspaso
              AutoSize = True
              ImageIndex = 36
            end
            object TButtMonedas: TToolButton
              Left = 619
              Top = 0
              Hint = 'Mantenimiento Cuentas de Moneda'
              Action = AMonedasCuenta
              AutoSize = True
            end
            object TButtCorreoElectronico: TToolButton
              Left = 667
              Top = 0
              Action = ACorreoEmpresa
              AutoSize = True
            end
            object TButtEDI: TToolButton
              Left = 790
              Top = 0
              Action = AEDI
              AutoSize = True
            end
            object TButtPersonalUlises: TToolButton
              Left = 817
              Top = 0
              Action = APersonalUlises
              AutoSize = True
            end
          end
        end
        object TSTerceros: TTabSheet
          Caption = '&Terceros'
          object TBTerceros: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 145
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtTerceros: TToolButton
              Left = 0
              Top = 0
              Action = ATerceros
              AutoSize = True
              Caption = 'Terceros'
            end
            object TButtClientes: TToolButton
              Left = 47
              Top = 0
              Action = AClientes
              AutoSize = True
              DropdownMenu = PopupClientesKri
              Style = tbsDropDown
            end
            object TButtProveedores: TToolButton
              Left = 105
              Top = 0
              Action = AProveedores
              AutoSize = True
              Caption = 'Proveedores'
            end
            object TButtAcreedores: TToolButton
              Left = 169
              Top = 0
              Action = AAcreedores
              AutoSize = True
              Caption = 'Acreedores'
            end
            object TButtAgentes: TToolButton
              Left = 227
              Top = 0
              Action = AAgentes
              AutoSize = True
              Caption = 'Agentes'
            end
            object TButtCondAgentes: TToolButton
              Left = 272
              Top = 0
              Action = ACondAgentes
              AutoSize = True
            end
            object TButtTercerosCuentas: TToolButton
              Left = 371
              Top = 0
              Action = ATercerosCuentas
              AutoSize = True
            end
            object TButtIncidencias: TToolButton
              Left = 501
              Top = 0
              Action = AIncidencias
              AutoSize = True
            end
            object TButtRepUsuTer: TToolButton
              Left = 559
              Top = 0
              Action = ARepUsuariosTerceros
              AutoSize = True
            end
            object TButtCRM: TToolButton
              Left = 702
              Top = 0
              Action = ACRM
              AutoSize = True
            end
          end
        end
        object TSAlmacenes: TTabSheet
          Caption = '&Almacenes'
          object TBAlmacenes: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 155
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtAlmacenes: TToolButton
              Left = 0
              Top = 0
              Action = AAlmacenes
              AutoSize = True
            end
            object TButtFamilias: TToolButton
              Left = 57
              Top = 0
              Action = AFamilias
              AutoSize = True
              Caption = 'Familias'
              DropdownMenu = PopupFamilias
              Style = tbsDropDown
            end
            object TButtArticulos: TToolButton
              Left = 116
              Top = 0
              Action = AArticulos
              AutoSize = True
              Caption = 'Art'#237'culos'
            end
            object TButtEscandallo: TToolButton
              Left = 164
              Top = 0
              Action = AEscandallo
              AutoSize = True
            end
            object TButtTarifas: TToolButton
              Left = 251
              Top = 0
              Hint = 'Tarifas de art'#237'culos'
              AutoSize = True
              Caption = 'Tarifas'
              DropdownMenu = PopupTarifas
              ImageIndex = 3
              Style = tbsDropDown
              OnClick = TButtTarifasClick
            end
            object TButtArticuloPorTarifa: TToolButton
              Left = 304
              Top = 0
              Action = ANewTarifas
              AutoSize = True
            end
            object TButtCondiciones: TToolButton
              Left = 421
              Top = 0
              Action = ACondicionesEspeciales
              AutoSize = True
              Caption = 'C. Especiales'
              DropdownMenu = PopupCondiciones
              Style = tbsDropDown
            end
            object Tx4: TToolButton
              Left = 503
              Top = 0
              Width = 23
              AutoSize = True
              Style = tbsSeparator
            end
            object TButtMovManStock: TToolButton
              Left = 526
              Top = 0
              Action = AMvStMan
              AutoSize = True
              Caption = 'Mov. Stock'
            end
            object TButtPropaga: TToolButton
              Left = 585
              Top = 0
              Action = APropaga
              AutoSize = True
            end
            object TButtNroSerieKri: TToolButton
              Left = 658
              Top = 0
              Action = AConsultaNroSerieKri
              AutoSize = True
              DropdownMenu = PopupNroSerieKri
              Style = tbsDropDown
            end
            object TButtRepUsuAlm: TToolButton
              Left = 787
              Top = 0
              Action = ARepUsuarioAlm
              AutoSize = True
            end
            object TButtConfAlmacenes: TToolButton
              Left = 940
              Top = 0
              Action = AConfAlmacenes
              AutoSize = True
              Caption = 'C. Almacenes'
            end
            object TButtPreciosCosteKri: TToolButton
              Left = 1010
              Top = 0
              Action = APreciosCosteKri
              AutoSize = True
            end
            object TButtListarEtiquetas: TToolButton
              Left = 1080
              Top = 0
              Action = AListarEtiquetas
              AutoSize = True
            end
          end
        end
        object TSCompras: TTabSheet
          Caption = '&Compras'
          ImageIndex = 6
          object TBCompras: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 168
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtPedProv: TToolButton
              Left = 0
              Top = 0
              Action = APedidosProv
              AutoSize = True
              Caption = 'Pedidos'
            end
            object TButtAlbProv: TToolButton
              Left = 44
              Top = 0
              Action = AAlbaranesProv
              AutoSize = True
              Caption = 'Albaranes'
            end
            object TButtFacProv: TToolButton
              Left = 96
              Top = 0
              Action = AFacturasProv
              AutoSize = True
              Caption = 'Facturas'
            end
            object TButtFacAcr: TToolButton
              Left = 144
              Top = 0
              Action = AFacturasAcr
              AutoSize = True
              Caption = 'Facturas Acr.'
            end
            object Tx3: TToolButton
              Left = 212
              Top = 0
              Width = 23
              AutoSize = True
              Style = tbsSeparator
            end
            object TButtPropPedidos: TToolButton
              Left = 235
              Top = 0
              Action = APropPedidos
              AutoSize = True
              Caption = 'Propuesta'
            end
            object TButtTraspasoPedCliAPedProv: TToolButton
              Left = 288
              Top = 0
              Action = ATraspasoPedCliAPedProv
              AutoSize = True
            end
            object TButtRecepcion: TToolButton
              Left = 454
              Top = 0
              Action = ARecepcionPedidos
              AutoSize = True
              Caption = 'Recepci'#243'n'
            end
            object TButtFacturarAlbProv: TToolButton
              Left = 509
              Top = 0
              Action = AFacAlbaranesProv
              AutoSize = True
            end
            object TButtFacAlbaranesProvDet: TToolButton
              Left = 599
              Top = 0
              Action = AFacAlbaranesProvDet
              AutoSize = True
            end
            object TButtCierraFac: TToolButton
              Left = 736
              Top = 0
              Action = ACierraFac
              AutoSize = True
            end
            object TButtABCCompras: TToolButton
              Left = 869
              Top = 0
              Action = AABCCompras
              AutoSize = True
              Caption = 'ABC'
              DropdownMenu = PopupABCCompras
              Style = tbsDropDown
            end
            object TButtProrrateoCostes: TToolButton
              Left = 912
              Top = 0
              Action = AProrrateoCostes
              AutoSize = True
            end
            object TButtRepUsuComp: TToolButton
              Left = 1037
              Top = 0
              Action = ArepUsuarioCompras
              AutoSize = True
            end
          end
        end
        object TSVentas: TTabSheet
          Caption = '&Ventas'
          ImageIndex = 3
          object TBVentas: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 133
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtOfertas: TToolButton
              Left = 0
              Top = 0
              Action = AOfertas
              AutoSize = True
              Caption = 'Ofertas'
            end
            object TButtPedidos: TToolButton
              Left = 43
              Top = 0
              Action = APedidos
              AutoSize = True
              Caption = 'Pedidos'
            end
            object TButtAlbaranes: TToolButton
              Left = 87
              Top = 0
              Action = AAlbaranes
              AutoSize = True
              Caption = 'Albaranes'
            end
            object TButtFacturas: TToolButton
              Left = 139
              Top = 0
              Action = AFacturas
              AutoSize = True
              Caption = 'Facturas'
            end
            object Tx1: TToolButton
              Left = 187
              Top = 0
              Width = 23
              AutoSize = True
              Style = tbsSeparator
            end
            object TButtAgrupacionPedidos: TToolButton
              Left = 210
              Top = 0
              Action = AAgrupacionPedidos
              AutoSize = True
              Caption = 'Agrupaci'#243'n'
            end
            object TButtFacturar: TToolButton
              Left = 267
              Top = 0
              Action = AFacAlbaranes
              AutoSize = True
            end
            object TButtFacAlbaranesCliDet: TToolButton
              Left = 357
              Top = 0
              Action = AFacAlbaranesCliDet
              AutoSize = True
            end
            object TButtHistorico: TToolButton
              Left = 494
              Top = 0
              Action = AFacHistProcesos
              AutoSize = True
              Caption = 'Hist'#243'rico'
            end
            object TButtListarFacturas: TToolButton
              Left = 542
              Top = 0
              Action = AImprimeFacturas
              AutoSize = True
            end
            object TButtListarAlbaranes: TToolButton
              Left = 616
              Top = 0
              Action = AImprimeAlbaranes
              AutoSize = True
            end
            object TButtCierraFacturas: TToolButton
              Left = 694
              Top = 0
              Action = ACierraFacturas
              AutoSize = True
            end
            object TButtFacturasDirectas: TToolButton
              Left = 808
              Top = 0
              Action = AFacturasDirectas
              AutoSize = True
            end
            object TButtABCVentas: TToolButton
              Left = 894
              Top = 0
              Action = AABCVentas
              AutoSize = True
              Caption = 'ABC'
              DropdownMenu = PopupABCVentas
              Style = tbsDropDown
            end
            object TButtEtiquetasKri: TToolButton
              Left = 937
              Top = 0
              Action = AImprimirEtiquetasKri
              AutoSize = True
            end
            object TButtRepUsuVen: TToolButton
              Left = 1024
              Top = 0
              Action = ARepUsuariosVentas
              AutoSize = True
            end
            object TButtTransmisionesPatrimoniales: TToolButton
              Left = 1157
              Top = 0
              Action = ATransmisionesPatrimoniales
              AutoSize = True
            end
            object ButtRepartirHorasProyecto: TToolButton
              Left = 1287
              Top = 0
              Action = ARepartirHorasProyecto
            end
          end
        end
        object TSContabilidad: TTabSheet
          Hint = 'Solapa de contabilidad'
          Caption = 'C&ontabilidad'
          ImageIndex = 2
          object TBContabilidad: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 154
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ParentShowHint = False
            ShowCaptions = True
            ShowHint = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtBorrador: TToolButton
              Left = 0
              Top = 0
              Action = AContaBorrador
              AutoSize = True
              Caption = 'Borrador'
            end
            object TButtMayor: TToolButton
              Left = 46
              Top = 0
              Action = AContaExtracto
              AutoSize = True
              Caption = 'Extractos'
            end
            object TButtMovimientos: TToolButton
              Left = 97
              Top = 0
              Action = AContaMovimientos
              AutoSize = True
              Caption = 'Movimientos'
            end
            object TButtSaldos: TToolButton
              Left = 161
              Top = 0
              Action = ASaldos
              AutoSize = True
            end
            object TButtDiaria: TToolButton
              Left = 255
              Top = 0
              Action = AContaDiario
              AutoSize = True
              Caption = 'Diario'
            end
            object TButtPlantillas: TToolButton
              Left = 290
              Top = 0
              Action = AContaPlantillas
              AutoSize = True
              Caption = 'Plantillas'
            end
            object Tx5: TToolButton
              Left = 338
              Top = 0
              Width = 23
              AutoSize = True
              Style = tbsSeparator
            end
            object TButtCuAnuales: TToolButton
              Left = 361
              Top = 0
              Action = AContaCuentasAnuales
              AutoSize = True
              Caption = 'Anuales'
            end
            object TButtCierreYApertura: TToolButton
              Left = 405
              Top = 0
              Action = AContaCierreYApertura
              AutoSize = True
              Caption = 'Cierre y Ap.'
            end
            object TButtCuentas: TToolButton
              Left = 467
              Top = 0
              Action = AContaCuentas
              AutoSize = True
              Caption = 'Cuentas'
            end
            object TButtEstruct: TToolButton
              Left = 513
              Top = 0
              Action = AContaEstructura
              AutoSize = True
              Caption = 'Estructura'
            end
            object TButtRepUsuConta: TToolButton
              Left = 567
              Top = 0
              Action = ARepUsuarioConta
              AutoSize = True
            end
            object TButtTipoAsiento: TToolButton
              Left = 725
              Top = 0
              Action = ATipoAsiento
              AutoSize = True
            end
            object TButtLstCentroCoste: TToolButton
              Left = 842
              Top = 0
              Action = ALstCentroCoste
              AutoSize = True
            end
          end
        end
        object TSInmovilizado: TTabSheet
          Caption = 'In&movilizado'
          ImageIndex = 8
          object TBInmovilizado: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 70
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Separators = True
            object TButtCentroInventario: TToolButton
              Left = 0
              Top = 0
              Action = ACentrosInventario
              AutoSize = True
              Caption = 'C. Inventario'
            end
            object TButtAmortizaciones: TToolButton
              Left = 66
              Top = 0
              Action = AAmortizaciones
              AutoSize = True
              Caption = 'Amortizaciones'
            end
          end
        end
        object TSImpuestos: TTabSheet
          Caption = '&Impuestos'
          object TBImpuestos: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 104
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtRegistrosIVA: TToolButton
              Left = 0
              Top = 0
              Action = ARegIVA
              AutoSize = True
              Caption = 'Registro de IVA'
            end
            object Tx2: TToolButton
              Left = 77
              Top = 0
              Width = 23
              AutoSize = True
              Style = tbsSeparator
            end
            object TButtLstIvaListado: TToolButton
              Left = 100
              Top = 0
              Action = ALSTIVAListado
              AutoSize = True
            end
            object TButtDiarioIva: TToolButton
              Left = 152
              Top = 0
              Action = ADiarioIVA
              AutoSize = True
            end
            object Tx6: TToolButton
              Left = 231
              Top = 0
              Width = 23
              AutoSize = True
              Style = tbsSeparator
            end
            object TButtRetEmpleados: TToolButton
              Left = 254
              Top = 0
              Action = ARetEmpleados
              AutoSize = True
            end
            object Tx7: TToolButton
              Left = 356
              Top = 0
              Width = 23
              AutoSize = True
              Style = tbsSeparator
            end
            object TButtHacienda: TToolButton
              Left = 379
              Top = 0
              AutoSize = True
              Caption = 'Hacienda'
              DropdownMenu = PopupHacienda
              ImageIndex = 136
              Style = tbsDropDown
              OnClick = TButtHaciendaClick
            end
          end
        end
        object TSTesoreria: TTabSheet
          Caption = 'Te&sorer'#237'a'
          ImageIndex = 7
          object TBTesoreria: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 194
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object TButtCartera: TToolButton
              Left = 0
              Top = 0
              Action = ACartera
              AutoSize = True
              Caption = 'Cartera'
            end
            object TButtRemesas: TToolButton
              Left = 42
              Top = 0
              Action = ARemesas
              AutoSize = True
            end
            object TButtBancos: TToolButton
              Left = 167
              Top = 0
              Action = ABancos
              AutoSize = True
            end
            object TButtRecibosPendientes: TToolButton
              Left = 209
              Top = 0
              Action = AListarCartera
              AutoSize = True
              Caption = 'R. Pendientes'
            end
            object TButtPagaRecAgrupados: TToolButton
              Left = 279
              Top = 0
              Action = APCRecAgrupados
              AutoSize = True
              Caption = 'C/P R. Agrup.'
            end
            object TButtNuevoRecibo: TToolButton
              Left = 349
              Top = 0
              Action = ANuevoRecibo
              AutoSize = True
            end
            object TButtListarRecibos: TToolButton
              Left = 447
              Top = 0
              Action = AImprimeRecibos
              AutoSize = True
            end
            object TButtAnticipos: TToolButton
              Left = 518
              Top = 0
              Action = AAnticipos
              AutoSize = True
            end
            object TButtConfirming: TToolButton
              Left = 710
              Top = 0
              Action = AOrdenesDePago
              AutoSize = True
              DropdownMenu = PopupConfirmingOrdPago
              Style = tbsDropDown
            end
            object TButtTalones: TToolButton
              Left = 825
              Top = 0
              Hint = 'Talones a Proveedor/Acreedor'
              AutoSize = True
              Caption = 'Talones'
              DropdownMenu = PopupTalones
              ImageIndex = 124
              Style = tbsDropDown
              OnClick = TButtTalonesClick
            end
            object TButtRecibosFacturas: TToolButton
              Left = 881
              Top = 0
              Action = AMuestraRecibos
              AutoSize = True
              Caption = 'Recibos Fac.'
            end
            object TButtAAsignaBancoRemesa: TToolButton
              Left = 948
              Top = 0
              Action = AAsignaBancoRemesa
              AutoSize = True
            end
            object TButtRepUsuTesor: TToolButton
              Left = 1057
              Top = 0
              Action = ARepUsuarioTesoreria
              AutoSize = True
            end
          end
        end
        object TSProduccion: TTabSheet
          Caption = '&Producci'#243'n'
          object TBProduccion: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 160
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Separators = True
            object TButtEscandalloProd: TToolButton
              Left = 0
              Top = 0
              Action = AEscandalloProd
              AutoSize = True
            end
            object TButtOrdenProduccion: TToolButton
              Left = 136
              Top = 0
              Action = AOrdenProduccion
              AutoSize = True
            end
            object TButtListadoNecesidades: TToolButton
              Left = 252
              Top = 0
              Action = AListNecesidades
              AutoSize = True
            end
            object TButtProcesosProd: TToolButton
              Left = 343
              Top = 0
              Hint = 'Procesos de Producci'#243'n'
              Action = AProcesosProd
              AutoSize = True
            end
            object TButtOrdenProduccionTallas: TToolButton
              Left = 442
              Top = 0
              Action = AOrdenProduccionTallasKri
              AutoSize = True
            end
            object TButtRepUsuProd: TToolButton
              Left = 554
              Top = 0
              Action = ARepUsuarioProduccion
              AutoSize = True
            end
          end
        end
        object TSProduccionDelfos: TTabSheet
          Caption = '&Producci'#243'n'
          object TBProduccionAvanzada: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 134
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Separators = True
            object TButtMantenimientoEscandallo: TToolButton
              Left = 0
              Top = 0
              Action = AProEscandalloSF
              AutoSize = True
            end
            object TButtMantenimientoOrdenesProduccion: TToolButton
              Left = 110
              Top = 0
              Action = AProOrden
              AutoSize = True
            end
            object TButtGenerarOrdenesProduccion: TToolButton
              Left = 205
              Top = 0
              Action = AProGenerarOrd
              AutoSize = True
            end
            object TButtLanzarOrdenesProduccion: TToolButton
              Left = 323
              Top = 0
              Action = AProGestionOrd
              AutoSize = True
            end
            object TButtMarcajes: TToolButton
              Left = 461
              Top = 0
              AutoSize = True
              Caption = 'Marcajes'
              DropdownMenu = PMProMarcajes
              ImageIndex = 56
              Style = tbsDropDown
            end
            object TButtMantenimientoEmpleados: TToolButton
              Left = 522
              Top = 0
              Action = AOpeEmpleados
              AutoSize = True
            end
            object TButtMaquinas: TToolButton
              Left = 579
              Top = 0
              Action = AProMaquinas
              AutoSize = True
            end
            object TButtListadosProduccion: TToolButton
              Left = 629
              Top = 0
              Hint = 'Listados de Producci'#243'n'
              AutoSize = True
              Caption = 'Listados'
              DropdownMenu = PMProListados
              ImageIndex = 14
              Style = tbsDropDown
            end
          end
        end
        object TSIso: TTabSheet
          Caption = 'ISO'
          ImageIndex = -1
          object TBProduccionISO: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 35
            ButtonWidth = 143
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentFont = False
            ShowCaptions = True
            TabOrder = 0
            Separators = True
            object TButtInformeNoConformidad: TToolButton
              Left = 0
              Top = 0
              Action = AIsoMantInformes
              AutoSize = True
            end
            object TButtAcciones: TToolButton
              Left = 147
              Top = 0
              Action = AIsoAccPreventiva
              AutoSize = True
            end
            object TButtDevolucionMaterial: TToolButton
              Left = 250
              Top = 0
              Action = AIsoDevMat
              AutoSize = True
            end
            object TButtPlanDeCapacitacion: TToolButton
              Left = 363
              Top = 0
              Action = AIsoPlanCapac
              AutoSize = True
            end
            object TButtControlEquipos: TToolButton
              Left = 449
              Top = 0
              Action = AIsoControlEquip
              AutoSize = True
            end
            object TButtClasificacionProveedores: TToolButton
              Left = 565
              Top = 0
              Action = AIsoClassProv
              AutoSize = True
            end
            object TButtPuntesodeINC: TToolButton
              Left = 686
              Top = 0
              Action = AIsoPunteos
              AutoSize = True
            end
            object TButtFirmasISO: TToolButton
              Left = 751
              Top = 0
              Action = AIsoFirmas
              AutoSize = True
            end
            object TButtTipoAcciones: TToolButton
              Left = 810
              Top = 0
              Action = AIsoMantTAcc
              AutoSize = True
            end
            object TButtIsoCursos: TToolButton
              Left = 884
              Top = 0
              Action = AIsoCursos
              AutoSize = True
            end
            object TButtIsoPlanning: TToolButton
              Left = 972
              Top = 0
              Action = AIsoPlanning
              AutoSize = True
            end
          end
        end
        object TSTallas: TTabSheet
          Caption = 'Tallas'
          object TBTallas: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 36
            ButtonWidth = 91
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ShowCaptions = True
            TabOrder = 0
            Separators = True
            object TButtMarca: TToolButton
              Left = 0
              Top = 0
              Action = AMarca
              AutoSize = True
            end
            object TButtTipoColorTallas: TToolButton
              Left = 89
              Top = 0
              Action = ATipoColorTallas
              AutoSize = True
            end
            object TButtArtColores: TToolButton
              Left = 148
              Top = 0
              Action = AColoresTallas
              AutoSize = True
            end
            object TButtGruposTallas: TToolButton
              Left = 194
              Top = 0
              Action = AGruposTallas
              AutoSize = True
            end
            object TButtModelosTallas: TToolButton
              Left = 270
              Top = 0
              Action = AModelosTallas
              AutoSize = True
            end
            object TButtKitsTallas: TToolButton
              Left = 321
              Top = 0
              Action = AKitTallas
              AutoSize = True
            end
          end
        end
        object TSCRM: TTabSheet
          Caption = 'CRM'
          ImageIndex = -1
          object TBCRM: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 35
            Align = alClient
            AutoSize = True
            ButtonHeight = 36
            ButtonWidth = 147
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ShowCaptions = True
            TabOrder = 0
            Separators = True
            object TButtCRMContactos: TToolButton
              Left = 0
              Top = 0
              Action = ACrmContactos
              AutoSize = True
            end
            object TButtCRMAcciones: TToolButton
              Left = 59
              Top = 0
              Action = ACrmAcciones
              AutoSize = True
            end
            object TButtCRMSeguimientos: TToolButton
              Left = 174
              Top = 0
              Action = ACrmConsultaAcciones
              AutoSize = True
            end
            object TButtCRMAmbitos: TToolButton
              Left = 248
              Top = 0
              Action = ACrmAmbitos
              AutoSize = True
            end
            object TButtCRMEmails: TToolButton
              Left = 296
              Top = 0
              Action = ACrmEMails
              AutoSize = True
            end
            object TButtCRMTipoAcciones: TToolButton
              Left = 447
              Top = 0
              Action = ACrmTipoAcciones
              AutoSize = True
            end
          end
        end
      end
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 144
    Top = 72
    object ATipoNCF: TAction
      Tag = 9010
      Category = 'Latino'
      Caption = 'Tipos &NCF'
      Hint = 'Configuracion de Tipos de NCF'
      ImageIndex = 2
      OnExecute = ATipoNCFExecute
    end
    object AFamilias: TAction
      Tag = 501
      Category = 'Almacenes'
      Caption = '&Familias'
      Hint = 'Mantenimiento de Familias de Art'#237'culos'
      ImageIndex = 137
      OnExecute = AFamiliasExecute
    end
    object AContaEstructura: TAction
      Tag = 601
      Category = 'Contabilidad'
      Caption = '&Estructura Contable Empresa'
      Hint = 
        'Configurar la estructura del plan de cuentas de la empresa ejerc' +
        'icio'
      ImageIndex = 97
      OnExecute = AContaEstructuraExecute
    end
    object AImprimeFacturas: TAction
      Tag = 306
      Category = 'Ventas'
      Caption = 'Lis&tar Facturas'
      Hint = 
        'Impresi'#243'n y envio por email masivo de facturas de clientes (Vent' +
        'as).'
      ImageIndex = 14
      OnExecute = AImprimeFacturasExecute
    end
    object AFacturasProv: TAction
      Tag = 401
      Category = 'Compras'
      Caption = '&Facturas Proveedor'
      Hint = 'Mantenimiento de facturas de proveedores.'
      ImageIndex = 61
      OnExecute = AFacturasProvExecute
    end
    object AProTareasMan: TAction
      Tag = 14804
      Category = 'Produccion Plan'
      Caption = 'Tareas &Manuales'
      Hint = 'Mantenimiento de las tareas manuales.'
      ImageIndex = 115
      OnExecute = AProTareasManExecute
    end
    object AClientesPotencialesKri: TAction
      Tag = 152
      Category = 'Terceros'
      Caption = 'Clientes &Potenciales'
      Hint = 'Mantenimiento de clientes potenciales.'
      ImageIndex = 104
      OnExecute = AClientesPotencialesKriExecute
    end
    object AContaCuentas: TAction
      Tag = 602
      Category = 'Contabilidad'
      Caption = '&Cuentas Contables'
      Hint = 'Mantenimiento de las cuentas contables de la empresa.'
      ImageIndex = 30
      OnExecute = AContaCuentasExecute
    end
    object AContaGrupoCuentas: TAction
      Tag = 657
      Category = 'Contabilidad'
      Caption = '&Grupo de Cuentas'
      Hint = 'Agrupaciones de cuentas contables para terceros'
      ImageIndex = 4
      OnExecute = AContaGrupoCuentasExecute
    end
    object AContaMovimientos: TAction
      Tag = 603
      Category = 'Contabilidad'
      Caption = '&Movimientos Contables'
      Hint = 'Ver ls movimientos contables de la empresa.'
      ImageIndex = 30
      OnExecute = AContaMovimientosExecute
    end
    object AContaConceptos: TAction
      Tag = 1001
      Category = 'Auxiliares'
      Caption = 'Co&nceptos'
      Hint = 'Mantenimiento de Conceptos Contables '
      ImageIndex = 21
      OnExecute = ANominaExecute
    end
    object AImprimePedidos: TAction
      Tag = 366
      Category = 'Ventas'
      Caption = 'Listar &Pedidos'
      Hint = 'Impresi'#243'n masiva de pedidos de clientes. (Ventas).'
      ImageIndex = 14
      OnExecute = AImprimePedidosExecute
    end
    object AImprimeAlbaranes: TAction
      Tag = 313
      Category = 'Ventas'
      Caption = 'Listar &Albaranes'
      Hint = 'Impresi'#243'n  masiva de albaranes de clientes.'
      ImageIndex = 14
      OnExecute = AImprimeAlbaranesExecute
    end
    object AContaExtracto: TAction
      Tag = 604
      Category = 'Contabilidad'
      Caption = 'Ex&tractos Contables'
      Hint = 'Consultas de cuentas contables. (Extractos).'
      ImageIndex = 30
      OnExecute = AContaExtractoExecute
    end
    object AContaBorrador: TAction
      Tag = 605
      Category = 'Contabilidad'
      Caption = 'B&orrador Contable'
      Hint = 'Mantenimiento del borrador de contabilidad.'
      ImageIndex = 18
      OnExecute = AContaBorradorExecute
    end
    object AContaDefBalances: TAction
      Tag = 1002
      Category = 'Auxiliares'
      Caption = '&Balances'
      Hint = 'Definici'#243'n de balances contables'
      ImageIndex = 40
      OnExecute = AContaDefBalancesExecute
    end
    object ANominasConstantes: TAction
      Tag = 14217
      Category = 'Operarios'
      Caption = 'N'#243'minas del periodo'
      Hint = 'Mantenimiento de los Constantes de n'#243'minas'
      ImageIndex = 18
      OnExecute = ANominasConstantesExecute
    end
    object AFormasPago: TAction
      Tag = 210
      Category = 'Empresas'
      Caption = 'Formas Pago'
      Hint = 
        'mantenimiento de las formas de pago de la empresa y cuentas cont' +
        'ables asociadas.'
      ImageIndex = 3
      OnExecute = AFormasPagoExecute
    end
    object AContaCuentasAnuales: TAction
      Tag = 606
      Category = 'Contabilidad'
      Caption = 'Cuentas &Anuales'
      Hint = 'Elaboraci'#243'n de las cuentas anuales de la empresa.'
      ImageIndex = 30
      OnExecute = AContaCuentasAnualesExecute
    end
    object AContaDiario: TAction
      Tag = 607
      Category = 'Contabilidad'
      Caption = 'Listar &Diario Contable'
      Hint = 'Listado libro contable diario.'
      ImageIndex = 14
      OnExecute = AContaDiarioExecute
    end
    object AContaSumYSaldos: TAction
      Tag = 608
      Category = 'Contabilidad'
      Caption = '&Sumas y Saldos'
      Hint = 'Listado de sumas y saldos.'
      ImageIndex = 14
      OnExecute = AContaSumYSaldosExecute
    end
    object AContaCierreYApertura: TAction
      Tag = 609
      Category = 'Contabilidad'
      Caption = '&Cierre Apertura'
      Hint = 'Cierre y apertura del ejercicio contable.'
      ImageIndex = 67
      OnExecute = AContaCierreYAperturaExecute
    end
    object ARepUsuariosVentas: TAction
      Tag = 350
      Category = 'Ventas'
      Caption = 'Listado Personalizado Ventas'
      Hint = 'Reportes personalizado de ventas Report Smith'
      ImageIndex = 14
      OnExecute = ARepUsuariosVentasExecute
    end
    object AContaPlantillas: TAction
      Tag = 610
      Category = 'Contabilidad'
      Caption = '&Plantillas Borrador'
      Hint = 'Plantillas de asientos contables para borrador.'
      ImageIndex = 30
      OnExecute = AContaPlantillasExecute
    end
    object AContaPGC: TAction
      Tag = 611
      Category = 'Contabilidad'
      Caption = 'Listar Plan General Contable'
      Hint = 'Listado del Plan General Contable de la empresa'
      ImageIndex = 14
      OnExecute = AContaPGCExecute
    end
    object AContaCuentasIVA: TAction
      Tag = 701
      Category = 'Impuestos'
      Caption = 'Cuen&tas IVA'
      Hint = 'Cuentas contables de IVA.'
      ImageIndex = 30
      OnExecute = AContaCuentasIVAExecute
    end
    object ATipoIva: TAction
      Tag = 702
      Category = 'Impuestos'
      Caption = '&Tipos IVA'
      Hint = 'Mantenimiento de los diversos Tipos de I.V.A.'
      ImageIndex = 110
      OnExecute = ATipoIvaExecute
    end
    object AModoIva: TAction
      Tag = 703
      Category = 'Impuestos'
      Caption = '&Modos IVA'
      Hint = 'Mantenimiento de los diversos Modos de I.V.A.'
      ImageIndex = 136
      OnExecute = AModoIvaExecute
    end
    object ARegIVA: TAction
      Tag = 704
      Category = 'Impuestos'
      Caption = 'Registro de &IVA'
      Hint = 'Registro de IVA.'
      ImageIndex = 110
      OnExecute = ARegIVAExecute
    end
    object ASalir: TAction
      Category = 'Basico'
      Caption = '&Salir'
      Hint = 'Salir del programa.'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AAcerca: TAction
      Tag = 1034
      Category = 'Auxiliares'
      Caption = '&Acerca de...'
      Hint = 'Visualizar propiedades del sistema.'
      ImageIndex = 1
      OnExecute = AAcercaExecute
    end
    object AUsuarios: TAction
      Tag = 1003
      Category = 'Auxiliares'
      Caption = '&Usuarios'
      Hint = 'Mantenimiento y configuraci'#243'n de los usuarios.'
      ImageIndex = 24
      OnExecute = AUsuariosExecute
    end
    object AProvincias: TAction
      Tag = 1004
      Category = 'Auxiliares'
      Caption = '&Provincias/Estados'
      Hint = 'Mantenimiento de Provincias/Estados'
      ImageIndex = 81
      OnExecute = AProvinciasExecute
    end
    object ALocalidades: TAction
      Tag = 1005
      Category = 'Auxiliares'
      Caption = '&Localidades'
      Hint = 'Mantenimiento de las localidades, poblaciones, ciudades..'
      ImageIndex = 81
      OnExecute = ALocalidadesExecute
    end
    object ACFGPrint: TAction
      Tag = 1006
      Category = 'Auxiliares'
      Caption = '&Configurar Impresora'
      Hint = 'Configurar las impresoras asociadas al sistema.'
      ImageIndex = 14
      OnExecute = ACFGPrintExecute
    end
    object AUbicaciones: TAction
      Tag = 1007
      Category = 'Auxiliares'
      Caption = '&Dispositivos Acceso Sistema'
      Hint = 'Ordenadores y dispositivos que se conectan al sistema.'
      ImageIndex = 81
      OnExecute = AUbicacionesExecute
    end
    object AEmpresas: TAction
      Tag = 201
      Category = 'Empresas'
      Caption = '&Empresas'
      Hint = 'Mantenimiento de empresas el sistema.'
      ImageIndex = 17
      OnExecute = AEmpresasExecute
    end
    object AMonedas: TAction
      Tag = 1008
      Category = 'Auxiliares'
      Caption = '&Monedas Sistema'
      Hint = 'Mantenimiento de las monedas que se usaran en el sistema.'
      ImageIndex = 56
      OnExecute = AMonedasExecute
    end
    object AContadores: TAction
      Tag = 1101
      Category = 'Utilidades'
      Caption = 'C&ontadores'
      Hint = 'Mantenimiento de los contadores de la aplicaci'#243'n.'
      ImageIndex = 44
      OnExecute = AContadoresExecute
    end
    object AConfig: TAction
      Tag = 1103
      Category = 'Utilidades'
      Caption = '&Configuraci'#243'n'
      Hint = 'Configuraci'#243'n y utilidades de la aplicaci'#243'n.'
      ImageIndex = 2
      OnExecute = AConfigExecute
    end
    object ACambiaUser: TAction
      Category = 'Basico'
      Caption = 'Ca&mbiar Usuario'
      Hint = 'Cambiar de usuario sin cerrar la aplicaci'#243'n.'
      ImageIndex = 12
      ShortCut = 49237
      OnExecute = ACambiaUserExecute
    end
    object ACambiarCanal: TAction
      Category = 'Basico'
      Caption = 'Cambio rapido de canal'
      Hint = 'Cambio rapido de canal'
      ImageIndex = 17
      ShortCut = 49219
      OnExecute = ACambiarCanalExecute
    end
    object ATerceros: TAction
      Tag = 155
      Category = 'Terceros'
      Caption = '&Terceros'
      Hint = 'Mantenimiento de los terceros.'
      ImageIndex = 54
      OnExecute = ATercerosExecute
    end
    object ATerceros2: TAction
      Tag = 101
      Category = 'Terceros'
      Caption = '&Terceros (Ver. 2)'
      Hint = 'Mantenimiento de los terceros. (Ver. 2)'
      ImageIndex = 54
      OnExecute = ATerceros2Execute
    end
    object APaises: TAction
      Tag = 1009
      Category = 'Auxiliares'
      Caption = '&Pa'#237'ses'
      Hint = 'Mantenimiento de Pa'#237'ses'
      ImageIndex = 81
      OnExecute = APaisesExecute
    end
    object ACanales: TAction
      Tag = 1010
      Category = 'Auxiliares'
      Caption = '&Canales'
      Hint = 
        'Configuraci'#243'n de los canales o divisiones de las empresas el sis' +
        'tema.'
      ImageIndex = 132
      OnExecute = ACanalesExecute
    end
    object AAlmacenes: TAction
      Tag = 502
      Category = 'Almacenes'
      Caption = '&Almacenes'
      Hint = 'Mantenimiento de Almacenes'
      ImageIndex = 40
      OnExecute = AAlmacenesExecute
    end
    object ATarifas: TAction
      Tag = 503
      Category = 'Almacenes'
      Caption = '&Tarifas'
      Hint = 'Mantenimiento de Tarifas de Art'#237'culos'
      ImageIndex = 33
      OnExecute = ATarifasExecute
    end
    object APropaga: TAction
      Tag = 504
      Category = 'Almacenes'
      Caption = '&Activar Tarifas'
      Hint = 'Activa las tarifas a las familias elegidas.'
      ImageIndex = 86
      OnExecute = APropagaExecute
    end
    object AArticulos: TAction
      Tag = 505
      Category = 'Almacenes'
      Caption = '&Articulos'
      Hint = 'Mantenimiento de Art'#237'culos'
      ImageIndex = 109
      OnExecute = AArticulosExecute
    end
    object AMvStMan: TAction
      Tag = 506
      Category = 'Almacenes'
      Caption = '&Movimientos Manuales Stock'
      Hint = 'Movimientos manuales en almacenes.'
      ImageIndex = 125
      OnExecute = AMvStManExecute
    end
    object APedidos: TAction
      Tag = 301
      Category = 'Ventas'
      Caption = '&Pedidos Clientes'
      Hint = 'Mantenimiento de pedidos de clientes (Ventas).'
      ImageIndex = 62
      OnExecute = APedidosExecute
    end
    object AAlbaranes: TAction
      Tag = 302
      Category = 'Ventas'
      Caption = '&Albaranes Clientes'
      Hint = 'Mantenimiento de albaranes de clientes. (Ventas).'
      ImageIndex = 60
      OnExecute = AAlbaranesExecute
    end
    object AFacturas: TAction
      Tag = 303
      Category = 'Ventas'
      Caption = '&Facturas Clientes'
      Hint = 'Mantenimiento de facturas de clientes. (Ventas).'
      ImageIndex = 61
      OnExecute = AFacturasExecute
    end
    object ACambioMonedas: TAction
      Tag = 1011
      Category = 'Auxiliares'
      Caption = 'C&ambio Moneda'
      Hint = 'Mantenimiento de historico de los cambios entre monedas.'
      ImageIndex = 55
      OnExecute = ACambioMonedasExecute
    end
    object AClientes: TAction
      Tag = 102
      Category = 'Terceros'
      Caption = '&Clientes'
      Hint = 'Mantenimiento de los clientes.'
      ImageIndex = 104
      OnExecute = AClientesExecute
    end
    object AProveedores: TAction
      Tag = 103
      Category = 'Terceros'
      Caption = '&Proveedores'
      Hint = 'Mantenimiento de los proveedores.'
      ImageIndex = 64
      OnExecute = AProveedoresExecute
    end
    object AFondo: TAction
      Category = 'Basico'
      Caption = 'Ocultar &Fondo Pantalla'
      Hint = 'Ocultar / mostar fondo de pantalla.'
      ImageIndex = 22
      OnExecute = AFondoExecute
    end
    object AAcreedores: TAction
      Tag = 104
      Category = 'Terceros'
      Caption = 'Ac&reedores'
      Hint = 'Mantenimiento de los acreedores.'
      ImageIndex = 63
      OnExecute = AAcreedoresExecute
    end
    object AAgentes: TAction
      Tag = 105
      Category = 'Terceros'
      Caption = 'A&gentes'
      Hint = 'Mantenimiento de los agentes. (Representantes/vendedores).'
      ImageIndex = 106
      OnExecute = AAgentesExecute
    end
    object ACartera: TAction
      Tag = 801
      Category = 'Tesoreria'
      Caption = '&Cartera Cobros/Pagos'
      Hint = 'Mantenimiento de cartera de cobros y pagos.'
      ImageIndex = 75
      OnExecute = ACarteraExecute
    end
    object AFormaPago: TAction
      Tag = 1012
      Category = 'Auxiliares'
      Caption = '&Formas pago'
      Hint = 'Mantenimiento de formas de pago de todas las empresas.'
      ImageIndex = 3
      OnExecute = AFormaPagoExecute
    end
    object AGenCanales: TAction
      Tag = 202
      Category = 'Empresas'
      Caption = '&Canales'
      Hint = 'Mantenimiento de los canales de la empresa.'
      ImageIndex = 132
      OnExecute = AGenCanalesExecute
    end
    object AGenSeries: TAction
      Tag = 203
      Category = 'Empresas'
      Caption = '&Series'
      Hint = 'Mantenimiento de las series de la empresa.'
      ImageIndex = 115
      OnExecute = AGenSeriesExecute
    end
    object AGenEjercicios: TAction
      Tag = 204
      Category = 'Empresas'
      Caption = '&Ejercicios'
      Hint = 'Mantenimiento de los ejercicios de la empresa activa.'
      ImageIndex = 50
      OnExecute = AGenEjerciciosExecute
    end
    object AOfertas: TAction
      Tag = 304
      Category = 'Ventas'
      Caption = '&Ofertas Clientes'
      Hint = 'Mantenimiento de ofertas a clientes. (Ventas).'
      ImageIndex = 72
      OnExecute = AOfertasExecute
    end
    object APropPedidos: TAction
      Tag = 402
      Category = 'Compras'
      Caption = 'Generar Propuesta &Compra'
      Hint = 'Propuestas de pedidos a proveedores.'
      ImageIndex = 56
      OnExecute = APropPedidosExecute
    end
    object APedidosProv: TAction
      Tag = 403
      Category = 'Compras'
      Caption = '&Pedidos Proveedor'
      Hint = 'Mantenimiento de pedidos a proveedores.'
      ImageIndex = 62
      OnExecute = APedidosProvExecute
    end
    object ARecepcionPedidos: TAction
      Tag = 404
      Category = 'Compras'
      Caption = '&Recibir Pedidos por L'#237'neas'
      Hint = 'Recepcionar los pedidos de los proveedores.'
      ImageIndex = 43
      OnExecute = ARecepcionPedidosExecute
    end
    object ABackup: TAction
      Tag = 1013
      Category = 'Auxiliares'
      Caption = 'Copias Seguridad Base Datos'
      Hint = 'Copias de Seguridad y Mantenimiento de la Base de Datos'
      ImageIndex = 41
    end
    object ASeries: TAction
      Tag = 1014
      Category = 'Auxiliares'
      Caption = '&Series'
      Hint = 
        'Mantenimiento de las series (sucursales, tiendas,  tipos de fact' +
        'uraci'#243'n) del sistema.'
      ImageIndex = 115
      OnExecute = ASeriesExecute
    end
    object ACampanyas: TAction
      Tag = 205
      Category = 'Empresas'
      Caption = '&Campa'#241'as'
      Hint = 'Mantenimiento de las campa'#241'as del ejercicio.'
      ImageIndex = 21
      OnExecute = ACampanyasExecute
    end
    object AFacAlbaranes: TAction
      Tag = 305
      Category = 'Ventas'
      Caption = 'F&acturar Albaranes'
      Hint = 'Facturaci'#243'n autom'#225'tica de albaranes de clientes.'
      ImageIndex = 19
      OnExecute = AFacAlbaranesExecute
    end
    object AFacHistProcesos: TAction
      Tag = 307
      Category = 'Ventas'
      Caption = '&Hist'#243'rico Procesos Venta'
      Hint = 'Hist'#243'rico de procesos autom'#225'ticos de venta.'
      ImageIndex = 16
      OnExecute = AFacHistProcesosExecute
    end
    object ABusqueda: TAction
      Tag = 1036
      Category = 'Auxiliares'
      Caption = '&B'#250'squeda'
      Hint = 'Explotaci'#243'n de datos o b'#250'squeda entre tablas.'
      ImageIndex = 1
      OnExecute = ABusquedaExecute
    end
    object APeriodosSistema: TAction
      Tag = 1015
      Category = 'Auxiliares'
      Caption = '&Per'#237'odos'
      Hint = 'Mantenimiento de los per'#237'odos de trabajo por empresa.'
      ImageIndex = 134
      OnExecute = APeriodosSistemaExecute
    end
    object AGenPeriodos: TAction
      Tag = 206
      Category = 'Empresas'
      Caption = '&Periodos'
      Hint = 'Mantenimiento y definici'#243'n de periodos de la empresa.'
      ImageIndex = 134
      OnExecute = AGenPeriodosExecute
    end
    object AAmortizaciones: TAction
      Tag = 901
      Category = 'Inmovilizado'
      Caption = '&Amortizaciones'
      Hint = 'Control de inmovilizados y amortizaciones de activos'
      ImageIndex = 110
      OnExecute = AAmortizacionesExecute
    end
    object ASysCuentas: TAction
      Tag = 1016
      Category = 'Auxiliares'
      Caption = '&Planes Contables'
      Hint = 
        'Mantenimiento de los planes contables generales para todo el sis' +
        'tema.'
      ImageIndex = 30
      OnExecute = ASysCuentasExecute
    end
    object APerfiles: TAction
      Tag = 1017
      Category = 'Auxiliares'
      Caption = 'P&erfiles Clientes'
      Hint = 'Mantenimiento de los perfiles de los clientes.'
      ImageIndex = 104
      OnExecute = APerfilesExecute
    end
    object AAjustes: TAction
      Tag = 1105
      Category = 'Utilidades'
      Caption = '&Actualizaciones'
      Hint = 'Visualiza las actualizaciones pasados a la base de datos.'
      ImageIndex = 119
      OnExecute = AAjustesExecute
    end
    object ACentrosInventario: TAction
      Tag = 902
      Category = 'Inmovilizado'
      Caption = '&Centros Inventario'
      Hint = 'Mantenimiento de Centros de Inventario'
      ImageIndex = 40
      OnExecute = ACentrosInventarioExecute
    end
    object ANewTarifas: TAction
      Tag = 507
      Category = 'Almacenes'
      Caption = '&Precios Tarifas Art'#237'culos '
      Hint = 'Mantenimiento de los precios de art'#237'culos por tarifa.'
      ImageIndex = 18
      OnExecute = ANewTarifasExecute
    end
    object AAlbaranesProv: TAction
      Tag = 405
      Category = 'Compras'
      Caption = '&Albaranes Proveedor'
      Hint = 'Mantenimiento de albaranes de proveedores.'
      ImageIndex = 60
      OnExecute = AAlbaranesProvExecute
    end
    object ALSTIVAListado: TAction
      Tag = 705
      Category = 'Impuestos'
      Caption = 'Listar &IVA'
      Hint = 'Listados de IVA.'
      ImageIndex = 14
      OnExecute = ALSTIVAListadoExecute
    end
    object APerfilesUsuario: TAction
      Tag = 1018
      Category = 'Auxiliares'
      Caption = 'Per&files Usuario'
      Hint = 
        'Mantenimiento de los perfiles de acceso para los usuarios del si' +
        'stema.'
      ImageIndex = 24
      OnExecute = APerfilesUsuarioExecute
    end
    object ARemesas: TAction
      Tag = 802
      Category = 'Tesoreria'
      Caption = '&Remesas Recibos Pagares'
      Hint = 'Crear remesas SEPA de recibos y pagar'#233's a los bancos.'
      ImageIndex = 123
      OnExecute = ARemesasExecute
    end
    object APregMayorCantidad: TAction
      Tag = 612
      Category = 'Contabilidad'
      Caption = 'Listar &Mayor Cantidad'
      Hint = 'Listado de mayor cantidad (347).'
      ImageIndex = 14
      OnExecute = APregMayorCantidadExecute
    end
    object ALSTStockMinimo: TAction
      Tag = 508
      Category = 'Almacenes'
      Caption = 'Listar Stock Bajo M'#237'nimo'
      Hint = 'Listar los art'#237'culos con stocks bajo minimos.'
      ImageIndex = 14
      OnExecute = ALSTStockMinimoExecute
    end
    object ALSTDiarioStock: TAction
      Tag = 509
      Category = 'Almacenes'
      Caption = 'Listar Diario Stock'
      Hint = 'Listado del Diario de Stock (Movimientos almacenes).'
      ImageIndex = 14
      OnExecute = ALSTDiarioStockExecute
    end
    object AFacAlbaranesProv: TAction
      Tag = 406
      Category = 'Compras'
      Caption = 'Facturar &Albaranes'
      Hint = 'Facturaci'#243'n de Albaranes de Proveedor'
      ImageIndex = 19
      OnExecute = AFacAlbaranesProvExecute
    end
    object AContaCuentasIRPF: TAction
      Tag = 706
      Category = 'Impuestos'
      Caption = 'Cuentas &IRPF'
      Hint = 'Cuentas de IRPF.'
      ImageIndex = 30
      OnExecute = AContaCuentasIRPFExecute
    end
    object ATipoIrpf: TAction
      Tag = 707
      Category = 'Impuestos'
      Caption = 'Tipos I&RPF'
      Hint = 'Tipos I.R.P.F.'
      ImageIndex = 110
      OnExecute = ATipoIrpfExecute
    end
    object AEscandallo: TAction
      Tag = 510
      Category = 'Almacenes'
      Caption = 'Art'#237'culos &Virtuales'
      Hint = 
        'Mantenimiento de los art'#237'culos virtuales. (Escandallos comercial' +
        'es).'
      ImageIndex = 10
      OnExecute = AEscandalloExecute
    end
    object ABancos: TAction
      Tag = 803
      Category = 'Tesoreria'
      Caption = '&Bancos'
      Hint = 'Mantenimientos de bancos de la empresa.'
      ImageIndex = 30
      OnExecute = ABancosExecute
    end
    object ALSTStockResumido: TAction
      Tag = 511
      Category = 'Almacenes'
      Caption = 'Listar &Stock Resumido'
      Hint = 'Listado de stock por periodo (mes) resumido por almac'#233'n.'
      ImageIndex = 14
      OnExecute = ALSTStockResumidoExecute
    end
    object ALSTStockAlmacen: TAction
      Tag = 512
      Category = 'Almacenes'
      Caption = 'Listar Stocks &Almac'#233'n'
      Hint = 'Listado de stocks por almac'#233'n.'
      ImageIndex = 14
      ShortCut = 49217
      OnExecute = ALSTStockAlmacenExecute
    end
    object AListarCartera: TAction
      Tag = 804
      Category = 'Tesoreria'
      Caption = 'Recibos &Pendientes Cuenta'
      Hint = 'Visualizaci'#243'n de recibos pendientes de compra y venta.'
      ImageIndex = 42
      OnExecute = AListarCarteraExecute
    end
    object ADiarioIVA: TAction
      Tag = 708
      Category = 'Impuestos'
      Caption = 'Listar &Diario IVA'
      Hint = 'Listado del diario IVA.'
      ImageIndex = 14
      OnExecute = ADiarioIVAExecute
    end
    object ALSTInventario: TAction
      Tag = 513
      Category = 'Almacenes'
      Caption = 'Listar &Inventario Stock'
      Hint = 'Listado de inventario de stocks.'
      ImageIndex = 14
      OnExecute = ALSTInventarioExecute
    end
    object AAgrupacionPedidos: TAction
      Tag = 308
      Category = 'Ventas'
      Caption = '&Servir Pedidos por L'#237'neas'
      Hint = 
        'Servir pedidos de clientes por lineas. (Ventas). Generaci'#243'n de a' +
        'lbaranes o facturas.'
      ImageIndex = 42
      OnExecute = AAgrupacionPedidosExecute
    end
    object AUnidades: TAction
      Tag = 1019
      Category = 'Auxiliares'
      Caption = 'Unidades Medida'
      Hint = 'Mantenimiento de unidades de medida. (kilos, litros, sacos)'
      ImageIndex = 69
      OnExecute = AUnidadesExecute
    end
    object ARenumeraContabilidad: TAction
      Tag = 613
      Category = 'Contabilidad'
      Caption = '&Renumerar Asientos'
      Hint = 'Renumeraci'#243'n de los asientos contables del ejercicio.'
      ImageIndex = 16
      OnExecute = ARenumeraContabilidadExecute
    end
    object AGenBancos: TAction
      Tag = 1020
      Category = 'Auxiliares'
      Caption = '&Bancos'
      Hint = 'Mantenimiento de todos los bancos del sistema.'
      ImageIndex = 56
      OnExecute = AGenBancosExecute
    end
    object ARazones: TAction
      Tag = 1021
      Category = 'Auxiliares'
      Caption = '&Tipos Razones Sociales'
      Hint = 
        'Mantenimiento de tipos de razones sociales de las empresas, pers' +
        'onas o entidades.'
      ImageIndex = 17
      OnExecute = ARazonesExecute
    end
    object AFacturasAcr: TAction
      Tag = 407
      Category = 'Compras'
      Caption = 'Facturas &Acreedor'
      Hint = 'Mantenimiento de facturas de acreedores.'
      ImageIndex = 61
      OnExecute = AFacturasAcrExecute
    end
    object ACierraFacturas: TAction
      Tag = 309
      Category = 'Ventas'
      Caption = '&Cerrar Facturas Clientes'
      Hint = 
        'Cierre masivo de facturas para generar contabilidad, cartera y r' +
        'egistro de IVA.'
      ImageIndex = 15
      OnExecute = ACierraFacturasExecute
    end
    object ABalance: TAction
      Tag = 614
      Category = 'Contabilidad'
      Caption = 'Balance'
      Hint = 'Balance'
      ImageIndex = 17
      OnExecute = ABalanceExecute
    end
    object ACuentasAnuales: TAction
      Tag = 615
      Category = 'Contabilidad'
      Caption = '&Cuentas Anuales'
      Hint = 'Confeccioar las cuentas anuales contables.'
      ImageIndex = 21
      OnExecute = ACuentasAnualesExecute
    end
    object AAGrupaciones: TAction
      Tag = 1022
      Category = 'Auxiliares'
      Caption = '&Agrupaciones'
      Hint = 
        'Mantenimiento de agrupaciones de clientes, art'#237'culos, proveedore' +
        's...'
      ImageIndex = 4
      OnExecute = AAGrupacionesExecute
    end
    object ATiposDir: TAction
      Tag = 1023
      Category = 'Auxiliares'
      Caption = 'Tipos Direcci'#243'n'
      Hint = 'Tipos de direcci'#243'n de los terceros.'
      ImageIndex = 81
      OnExecute = ATiposDirExecute
    end
    object ATiposAcreedor: TAction
      Tag = 1024
      Category = 'Auxiliares'
      Caption = 'Tipos A&creedor'
      Hint = 'Tipos de acreedores (7-Transportista)'
      ImageIndex = 63
      OnExecute = ATiposAcreedorExecute
    end
    object AListador: TAction
      Tag = 1106
      Category = 'Utilidades'
      Caption = '&Dise'#241'ar Informes'
      Hint = 'Configuraci'#243'n y dise'#241'o de informes.'
      ImageIndex = 77
      OnExecute = AListadorExecute
    end
    object AProyectos: TAction
      Tag = 208
      Category = 'Empresas'
      Caption = 'P&royectos'
      Hint = 'Mantenimiento de proyectos de la empresa activa.'
      ImageIndex = 137
      OnExecute = AProyectosExecute
    end
    object ACodigosBarras: TAction
      Tag = 1025
      Category = 'Auxiliares'
      Caption = 'Tipos C'#243'digos Barras'
      Hint = 'Tipos de c'#243'digos de barras.'
      ImageIndex = 38
      OnExecute = ACodigosBarrasExecute
    end
    object ATiposEfectos: TAction
      Tag = 1026
      Category = 'Auxiliares'
      Caption = 'Tipos &Efectos'
      Hint = 'Mantenimiento de tipos de efectos de pago y cobro.'
      ImageIndex = 21
      OnExecute = ATiposEfectosExecute
    end
    object APunteoAsientos: TAction
      Tag = 616
      Category = 'Contabilidad'
      Caption = '&Puntear Asientos'
      Hint = 'Punteo de asientos contables.'
      ImageIndex = 19
      OnExecute = APunteoAsientosExecute
    end
    object ATipoImpuestos: TAction
      Tag = 709
      Category = 'Impuestos'
      Caption = 'Tipo Impuestos'
      Hint = 'Mantenimiento de los diversos tipos de impuestos.'
      ImageIndex = 76
      OnExecute = ATipoImpuestosExecute
    end
    object ARetEmpleados: TAction
      Tag = 710
      Category = 'Impuestos'
      Caption = 'Retenci'#243'n &Empleados'
      Hint = 'Mantenimiento de retenciones de empleados'
      ImageIndex = 110
      OnExecute = ARetEmpleadosExecute
    end
    object ACondicionesProv: TAction
      Tag = 517
      Category = 'Almacenes'
      Caption = '&Condiciones Proveedores'
      Hint = 'Condiciones especiales de proveedores.'
      ImageIndex = 18
      OnExecute = ACondicionesProvExecute
    end
    object ATarifasProveedor: TAction
      Tag = 518
      Category = 'Almacenes'
      Caption = '&Tarifas Proveedor'
      Hint = 'Mantenimiento de tarifas de Proveedor.'
      ImageIndex = 143
      OnExecute = ATarifasProveedorExecute
    end
    object APropagaEmpresa: TAction
      Tag = 209
      Category = 'Empresas'
      Caption = 'Propagaci'#243'n &Empresa'
      Hint = 
        'Mantenimiento de propagaci'#243'n de los datos de una empresa y un ca' +
        'nal a otro canal.'
      ImageIndex = 86
      OnExecute = APropagaEmpresaExecute
    end
    object ASaldos: TAction
      Tag = 617
      Category = 'Contabilidad'
      Caption = 'Ver &Saldos Cuentas'
      Hint = 'Consultas predefinidas de saldos contables.'
      ImageIndex = 56
      OnExecute = ASaldosExecute
    end
    object ACondAgentes: TAction
      Tag = 106
      Category = 'Almacenes'
      Caption = 'Con&diciones Agentes'
      Hint = 'Condiciones por agentes (Vendedores).'
      ImageIndex = 106
      OnExecute = ACondAgentesExecute
    end
    object ACondAgeAgrup: TAction
      Tag = 520
      Category = 'Almacenes'
      Caption = 'Condi&ciones Agentes/Agrupaciones Cliente'
      Hint = 'Condiciones de agentes por agrupaci'#243'n de clientes.'
      ImageIndex = 106
      OnExecute = ACondAgeAgrupExecute
    end
    object ACondAgeCli: TAction
      Tag = 521
      Category = 'Almacenes'
      Caption = 'Cond&iciones Agentes/Clientes'
      Hint = 'Condiciones de agentes (vendedores)  por cliente.'
      ImageIndex = 106
      OnExecute = ACondAgeCliExecute
    end
    object AABCVentas: TAction
      Tag = 311
      Category = 'Ventas'
      Caption = 'Estad'#237'sticas ABC'#39's Ventas'
      Hint = 'Listado de las estad'#237'sticas ABC'#39's de ventas'
      ImageIndex = 32
      OnExecute = AABCVentasExecute
    end
    object AABCVentasKri: TAction
      Tag = 359
      Category = 'Ventas'
      Caption = 'Listar ABC Ventas  Albaranes'
      Hint = 'Listado ABC de ventas albaranes'
      ImageIndex = 32
      OnExecute = AABCVentasKriExecute
    end
    object ATercerosCuentas: TAction
      Tag = 107
      Category = 'Terceros'
      Caption = 'Cuentas Contables Terceros'
      Hint = 'Cuentas contables asociadas a un tercero para visualizar saldos.'
      ImageIndex = 30
      OnExecute = ATercerosCuentasExecute
    end
    object AABCCompras: TAction
      Tag = 409
      Category = 'Compras'
      Caption = 'Listar ABC Compras'
      Hint = 'Listados ABC'#39's de compras'
      ImageIndex = 32
      OnExecute = AABCComprasExecute
    end
    object APCRecAgrupados: TAction
      Tag = 805
      Category = 'Tesoreria'
      Caption = 'C&obrar Pagar Agrupar Cartera'
      Hint = 'Cobrar pagar y agrupar recibos.'
      ImageIndex = 56
      OnExecute = APCRecAgrupadosExecute
    end
    object AAyudaenLinea: TAction
      Category = 'Utilidades'
      Caption = 'Ayuda L'#237'nea'
      Hint = 'Ayuda en l'#237'nea.'
      ImageIndex = 1
      ShortCut = 16449
      OnExecute = AAyudaenLineaExecute
    end
    object APlazosGarantia: TAction
      Tag = 1027
      Category = 'Auxiliares'
      Caption = '&Plazos Garant'#237'a'
      Hint = 'Mantenimiento de los plazos de las garant'#237'as.'
      ImageIndex = 21
      OnExecute = APlazosGarantiaExecute
    end
    object AEscandalloProd: TAction
      Tag = 1201
      Category = 'Produccion'
      Caption = '&Escandallo Producci'#243'n Simple'
      Hint = 'Mantenimiento de escandallos, despieces, ensamblados.'
      ImageIndex = 10
      OnExecute = AEscandalloProdExecute
    end
    object AOrdenProduccion: TAction
      Tag = 1202
      Category = 'Produccion'
      Caption = '&Orden Producci'#243'n Simple'
      Hint = 'Mantenimiento de ordenes de producci'#243'n.'
      ImageIndex = 21
      OnExecute = AOrdenProduccionExecute
    end
    object ANuevoRecibo: TAction
      Tag = 806
      Category = 'Tesoreria'
      Caption = 'Crear &Recibo Manual'
      Hint = 'Generar y contabilizar un nuevo recibo.'
      ImageIndex = 75
      OnExecute = ANuevoReciboExecute
    end
    object ACambiaFecha: TAction
      Category = 'Basico'
      Caption = 'Cambiar Fecha Trabajo'
      Hint = 'Cambia la fecha de trabajo.'
      ImageIndex = 9
      OnExecute = ACambiaFechaExecute
    end
    object AABCComprasKri: TAction
      Tag = 454
      Category = 'Compras'
      Caption = 'Listar ABC Compras por Albar'#225'n'
      Hint = 'Listado ABC'#39's de compras x Albaranes.'
      ImageIndex = 32
      OnExecute = AABCComprasKriExecute
    end
    object AFacAlbaranesProvDet: TAction
      Tag = 410
      Category = 'Compras'
      Caption = 'Facturar Albaranes por &L'#237'neas'
      Hint = 'Facturar las l'#237'neas de albaran de proveedores.'
      ImageIndex = 87
      OnExecute = AFacAlbaranesProvDetExecute
    end
    object AListNecesidades: TAction
      Tag = 1203
      Category = 'Produccion'
      Caption = '&Listar Necesidades'
      Hint = 'Listado de Necesidades'
      ImageIndex = 143
      OnExecute = AListNecesidadesExecute
    end
    object AMRP: TAction
      Tag = 1205
      Category = 'Produccion'
      Caption = 'MRP'
      Hint = 'M.R.P.'
      ImageIndex = 116
      OnExecute = AMRPExecute
    end
    object AConfirming: TAction
      Tag = 807
      Category = 'Tesoreria'
      Caption = '&Confirming'
      Hint = 'Realizar un confirming de pagos al banco.'
      ImageIndex = 124
      OnExecute = AConfirmingExecute
    end
    object AAnticipos: TAction
      Tag = 808
      Category = 'Tesoreria'
      Caption = '&Anticipos Clientes Proveedores Acreedores'
      Hint = 'Creaci'#243'n de anticipos de clientes, proveedores y acreedores.'
      ImageIndex = 141
      OnExecute = AAnticiposExecute
    end
    object AModelo300: TAction
      Tag = 711
      Category = 'Impuestos'
      Caption = 'Modelo 300'
      Hint = 'Modelo 300'
      ImageIndex = 136
      OnExecute = AModelo300Execute
    end
    object AModelo303: TAction
      Tag = 751
      Category = 'Impuestos'
      Caption = 'Modelo 303'
      Hint = 'Modelo 303'
      ImageIndex = 136
      OnExecute = AModelo303Execute
    end
    object AModelo115: TAction
      Tag = 712
      Category = 'Impuestos'
      Caption = 'Modelo 115/180'
      Hint = 'Modelo 115/180'
      ImageIndex = 136
      OnExecute = AModelo115Execute
    end
    object AModelo110: TAction
      Tag = 713
      Category = 'Impuestos'
      Caption = 'Modelo 110/111'
      Hint = 'Modelo 110/111'
      ImageIndex = 136
      OnExecute = AModelo110Execute
    end
    object AModelo330: TAction
      Tag = 714
      Category = 'Impuestos'
      Caption = 'Modelo 330'
      Hint = 'Modelo 330'
      ImageIndex = 136
      OnExecute = AModelo330Execute
    end
    object ATalones: TAction
      Tag = 809
      Category = 'Tesoreria'
      Caption = '&Talones'
      Hint = 'Confecci'#243'n de talones a proveedor o acreedor.'
      ImageIndex = 124
      OnExecute = ATalonesExecute
    end
    object ATalonesCta: TAction
      Tag = 810
      Category = 'Tesoreria'
      Caption = 'Talones Cuentas Contables'
      Hint = 'Creaci'#243'n de talones por cuentas contables'
      ImageIndex = 30
      OnExecute = ATalonesCtaExecute
    end
    object ALSTDepositosActivos: TAction
      Tag = 523
      Category = 'Almacenes'
      Caption = 'Listar Depositos Activos'
      Hint = 'Listado de depositos activos.'
      ImageIndex = 14
      OnExecute = ALSTDepositosActivosExecute
    end
    object ALSTFichaMargendeProductos: TAction
      Tag = 524
      Category = 'Almacenes'
      Caption = 'Listar Margenes Art'#237'culos'
      Hint = 'Listado de margenes por art'#237'culos.'
      ImageIndex = 14
      OnExecute = ALSTFichaMargendeProductosExecute
    end
    object AContaDefBalancesCAB: TAction
      Tag = 1028
      Category = 'Auxiliares'
      Caption = 'Balances Contables &Cabeceras'
      Hint = 'Definici'#243'n de las cabeceras de los balances contables.'
      ImageIndex = 125
      OnExecute = AContaDefBalancesCABExecute
    end
    object ACierraFac: TAction
      Tag = 411
      Category = 'Compras'
      Caption = 'Cerrar Facturas Proveedores'
      Hint = 'Cierra masivamente las facturas de compras.'
      ImageIndex = 15
      OnExecute = ACierraFacExecute
    end
    object AMuestraRecibos: TAction
      Tag = 811
      Category = 'Tesoreria'
      Caption = 'Ver Recibos Factura'
      Hint = 'Muestra los recibos de una factura.'
      ImageIndex = 87
      OnExecute = AMuestraRecibosExecute
    end
    object ATraspaso: TAction
      Tag = 211
      Category = 'Empresas'
      Caption = 'Traspaso Entre Ejercicios'
      Hint = 
        'Procesos de traspasos de algunas cuentas de un ejercicio anterio' +
        'r al actual.'
      ImageIndex = 15
      OnExecute = ATraspasoExecute
    end
    object ALSTUnidadesPendientes: TAction
      Tag = 525
      Category = 'Almacenes'
      Caption = 'Listar Unidades Pendientes Servir'
      Hint = 'Listado de unidades (cantidades) pendientes de servir.'
      ImageIndex = 14
      OnExecute = ALSTUnidadesPendientesExecute
    end
    object AModelo190: TAction
      Tag = 715
      Category = 'Impuestos'
      Caption = 'Listado Modelo 190'
      Hint = 'Modelo 190 - Listado'
      ImageIndex = 14
      OnExecute = AModelo190Execute
    end
    object AModelo390: TAction
      Tag = 754
      Category = 'Impuestos'
      Caption = 'Modelo 390'
      Hint = 'Modelo 390'
      ImageIndex = 136
      OnExecute = AModelo390Execute
    end
    object AExporta190: TAction
      Tag = 716
      Category = 'Impuestos'
      Caption = 'Exportaci'#243'n Modelo 190'
      Hint = 'Modelo 190 - Exportaci'#243'n datos.'
      ImageIndex = 36
      OnExecute = AExporta190Execute
    end
    object ACierraTodas: TAction
      Tag = 1113
      Category = 'Utilidades'
      Caption = '&Cerrar Ventanas'
      Hint = 'Cierra todas las ventanas abiertas.'
      ImageIndex = 20
      OnExecute = ACierraTodasExecute
    end
    object AModelo340: TAction
      Tag = 750
      Category = 'Impuestos'
      Caption = 'Modelo 340'
      Hint = 'Modelo 340'
      ImageIndex = 136
      OnExecute = AModelo340Execute
    end
    object AHistoricoPMP: TAction
      Tag = 526
      Category = 'Almacenes'
      Caption = '&Visualizar Hist'#243'rico Precios'
      Hint = 'Calcular u visualizar hist'#243'rico de precios.'
      ImageIndex = 56
      OnExecute = AHistoricoPMPExecute
    end
    object APonderarDocs: TAction
      Tag = 541
      Category = 'Almacenes'
      Caption = 'Ponderar Documentos'
      Hint = 'Ponderar precios art'#237'culos seg'#250'n documentos.'
      ImageIndex = 40
      OnExecute = APonderarDocsExecute
    end
    object AMonedasCuenta: TAction
      Tag = 212
      Category = 'Empresas'
      Caption = 'Monedas'
      Hint = 
        'Mantenimiento cuentas contables de las monedas para las diferenc' +
        'ias de cambio.'
      ImageIndex = 56
      OnExecute = AMonedasCuentaExecute
    end
    object AAgrupacionFac: TAction
      Tag = 312
      Category = 'Ventas'
      Caption = 'Agru&paci'#243'n Facturas'
      Hint = 'Agrupaci'#243'n de facturas de clientes. (Ventas).'
      ImageIndex = 13
      OnExecute = AAgrupacionFacExecute
    end
    object ACorreoEmpresa: TAction
      Tag = 213
      Category = 'Empresas'
      Caption = 'Envios &Correo Electr'#243'nico '
      Hint = 'Enviar eMails de forma masiva a varios terceros.'
      ImageIndex = 34
      OnExecute = ACorreoEmpresaExecute
    end
    object AEmpCanales: TAction
      Tag = 214
      Category = 'Empresas'
      Caption = 'E&mpresa, Ejercicio, Canal'
      Hint = 
        'Ver informaci'#243'n sobre la empresa, ejercicio y canal de la empres' +
        'a.'
      ImageIndex = 132
      OnExecute = AEmpCanalesExecute
    end
    object AAvisos: TAction
      Category = 'Basico'
      Caption = 'Notificar &Usuarios'
      Hint = 'Generar y ver notificaciones de los usuarios del sistema.'
      ImageIndex = 8
      OnExecute = AAvisosExecute
    end
    object AClasesDirecciones: TAction
      Tag = 1030
      Category = 'Auxiliares'
      Caption = 'Clases &Direcciones'
      Hint = 'Clases o tipos de direcciones, calles, avenidas, carreteras...'
      ImageIndex = 40
      OnExecute = AClasesDireccionesExecute
    end
    object ACamMonCartera: TAction
      Tag = 1031
      Category = 'Auxiliares'
      Caption = 'Cambiar Moneda Cartera'
      Hint = 'Cambia la moneda en los registros de cartera. (Cobros, pagos..)'
      ImageIndex = 141
      OnExecute = ACamMonCarteraExecute
    end
    object ADuplicaEscandallo: TAction
      Tag = 542
      Category = 'Almacenes'
      Caption = 'Duplicar Escandallo'
      Hint = 'Duplica el escandallo'
      ImageIndex = 37
      OnExecute = ADuplicaEscandalloExecute
    end
    object APagares: TAction
      Tag = 812
      Category = 'Tesoreria'
      Caption = '&Pagar'#233's'
      Hint = 'Creaci'#243'n de pagares cliente, proveedor, acreedor.'
      ImageIndex = 124
      OnExecute = APagaresExecute
    end
    object AConfINI: TAction
      Tag = 1109
      Category = 'Utilidades'
      Caption = 'C&onfigurar Fichero INI'
      Hint = 'Configuraci'#243'n del fichero INI del usuario activo.'
      ImageIndex = 2
      OnExecute = AConfINIExecute
    end
    object ARepUsuarioAlm: TAction
      Tag = 550
      Category = 'Almacenes'
      Caption = '&Listador Personalizado Almacenes'
      Hint = 'Reportes personalizables y efectuados por Report Smith-'
      ImageIndex = 14
      OnExecute = ARepUsuarioAlmExecute
    end
    object ArepUsuarioCompras: TAction
      Tag = 450
      Category = 'Compras'
      Caption = 'Listados Personalizado Usuario'
      Hint = 'Listados personalizables Report Smith'
      ImageIndex = 14
      OnExecute = ArepUsuarioComprasExecute
    end
    object ARepUsuarioConta: TAction
      Tag = 650
      Category = 'Contabilidad'
      Caption = 'Listador Personalizado Contabilidad'
      Hint = 'Listados personalizados Report Smith'
      ImageIndex = 14
      OnExecute = ARepUsuarioContaExecute
    end
    object ARepUsuariosTerceros: TAction
      Tag = 150
      Category = 'Terceros'
      Caption = '&Listador Personalizado Terceros'
      Hint = 'Listador reportes Report Smith'
      ImageIndex = 14
      OnExecute = ARepUsuariosTercerosExecute
    end
    object ATipoAsiento: TAction
      Tag = 651
      Category = 'Contabilidad'
      Caption = 'Tipos Asientos Contables'
      Hint = 'Mantenimiento y configuraci'#243'n de tipos de asientos contables.'
      ImageIndex = 21
      OnExecute = ATipoAsientoExecute
    end
    object AIncrementoPorcentual: TAction
      Tag = 553
      Category = 'Almacenes'
      Caption = 'Incremento Porcentual Tarifas'
      Hint = 'Incremento Porcentual de Tarifas'
      ImageIndex = 3
      OnExecute = AIncrementoPorcentualExecute
    end
    object AContRecuperacion: TAction
      Tag = 1110
      Category = 'Utilidades'
      Caption = '&Recuperar Contadores'
      Hint = 'Mantenimiento de los contadores una vez eliminados.'
      ImageIndex = 26
      OnExecute = AContRecuperacionExecute
    end
    object ATiposCalculo: TAction
      Tag = 527
      Category = 'Almacenes'
      Caption = 'Tipos &C'#225'lculo Tarifas'
      Hint = 'Mantenimiento de los tipos de c'#225'lculo para tarifas.'
      ImageIndex = 3
      OnExecute = ATiposCalculoExecute
    end
    object ACondicionesEspeciales: TAction
      Tag = 528
      Category = 'Almacenes'
      Caption = 'Condiciones &Especiales'
      Hint = 'Mantenimiento de condiciones especiales.'
      ImageIndex = 15
      OnExecute = ACondicionesEspecialesExecute
    end
    object AMonedasMaestros: TAction
      Tag = 1111
      Category = 'Utilidades'
      Caption = '&Monedas'
      Hint = 'Mantenimiento de monedas.'
      ImageIndex = 56
      OnExecute = AMonedasMaestrosExecute
    end
    object ALSTLotes: TAction
      Tag = 529
      Category = 'Almacenes'
      Caption = 'Listar Inventario Lotes'
      Hint = 'Listado de inventario por lotes.'
      ImageIndex = 14
      OnExecute = ALSTLotesExecute
    end
    object ALSTLotesCompras: TAction
      Tag = 530
      Category = 'Almacenes'
      Caption = 'Listar Lotes Compras'
      Hint = 'Listado de lotes de las compras.'
      ImageIndex = 14
      OnExecute = ALSTLotesComprasExecute
    end
    object ALSTLotesVentas: TAction
      Tag = 531
      Category = 'Almacenes'
      Caption = 'Listar Lotes Ventas'
      Hint = 'Listado de lotes de las ventas.'
      ImageIndex = 14
      OnExecute = ALSTLotesVentasExecute
    end
    object ALSTLotesMovimientos: TAction
      Tag = 532
      Category = 'Almacenes'
      Caption = 'Listar Lotes Movimientos Manuales Stock'
      Hint = 'Listado de lotes de los movimientos manuales de stock.'
      ImageIndex = 14
      OnExecute = ALSTLotesMovimientosExecute
    end
    object AModelo347: TAction
      Tag = 718
      Category = 'Impuestos'
      Caption = 'Modelo 347'
      Hint = 'Modelo 347'
      ImageIndex = 136
      OnExecute = AModelo347Execute
    end
    object AConfModelo110: TAction
      Tag = 719
      Category = 'Impuestos'
      Caption = 'Listado Modelo 110/111'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 110/111'
      ImageIndex = 77
      OnExecute = AConfModelo110Execute
    end
    object AConfModelo115: TAction
      Tag = 720
      Category = 'Impuestos'
      Caption = 'Listado Modelo 115'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 115'
      ImageIndex = 77
      OnExecute = AConfModelo115Execute
    end
    object AConfModelo190: TAction
      Tag = 721
      Category = 'Impuestos'
      Caption = 'Listado Modelo 190'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 190'
      ImageIndex = 77
      OnExecute = AConfModelo190Execute
    end
    object AConfModelo300: TAction
      Tag = 722
      Category = 'Impuestos'
      Caption = 'Listado Modelo 300'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 300'
      ImageIndex = 77
      OnExecute = AConfModelo300Execute
    end
    object AConfModelo303: TAction
      Tag = 723
      Category = 'Impuestos'
      Caption = 'Listado Modelo 303'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 303'
      ImageIndex = 77
      OnExecute = AConfModelo303Execute
    end
    object AConfModelo330: TAction
      Tag = 723
      Category = 'Impuestos'
      Caption = 'Listado Modelo 330'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 330'
      ImageIndex = 77
      OnExecute = AConfModelo330Execute
    end
    object AConfModelo347: TAction
      Tag = 724
      Category = 'Impuestos'
      Caption = 'Listado Modelo 347'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 347'
      ImageIndex = 77
      OnExecute = AConfModelo347Execute
    end
    object AContaDiarioPartido: TAction
      Tag = 618
      Category = 'Contabilidad'
      Caption = 'Libro Diario Partido'
      Hint = 'Libro Diario Partido'
      ImageIndex = 30
    end
    object AArtProv: TAction
      Tag = 412
      Category = 'Compras'
      Caption = 'Compras A&rt'#237'culo Proveedor'
      Hint = 'Muestra los proveedores a los que se ha comprado un articulo.'
      ImageIndex = 89
      OnExecute = AArtProvExecute
    end
    object AArtCli: TAction
      Tag = 314
      Category = 'Ventas'
      Caption = 'Ventas Clientes Art'#237'culo'
      Hint = 'Ver las ventas de clientes por art'#237'culo.'
      ImageIndex = 89
      OnExecute = AArtCliExecute
    end
    object ALSTUnidPendRecibir: TAction
      Tag = 533
      Category = 'Almacenes'
      Caption = 'Listar Unidades Pendientes Recibir'
      Hint = 
        'Listado de unidades de art'#237'culos pendientes de recibir (compras)' +
        '.'
      ImageIndex = 14
      OnExecute = ALSTUnidPendRecibirExecute
    end
    object AProcesosProd: TAction
      Tag = 1204
      Category = 'Produccion'
      Caption = '&Procesos Producci'#243'n'
      Hint = 'Procesos de produccion'
      ImageIndex = 116
      OnExecute = AProcesosProdExecute
    end
    object ATiposRedondeo: TAction
      Tag = 534
      Category = 'Almacenes'
      Caption = 'Tipos &Redondeo'
      Hint = 'Mantenimiento de los tipos de redondeo para c'#225'lculos de tarifa.'
      ImageIndex = 17
      OnExecute = ATiposRedondeoExecute
    end
    object ARepUsuarioTesoreria: TAction
      Tag = 850
      Category = 'Tesoreria'
      Caption = 'Listador Personalizado Tesoreria'
      Hint = 'Listado personalizado Report Smith'
      ImageIndex = 14
      OnExecute = ARepUsuarioTesoreriaExecute
    end
    object ARepUsuarioProduccion: TAction
      Tag = 1250
      Category = 'Produccion'
      Caption = 'Reportes Usuario Producci'#243'n Simple'
      Hint = 'Reportes Report Smith producci'#243'n simple.'
      ImageIndex = 14
      OnExecute = ARepUsuarioProduccionExecute
    end
    object AConsultaNroSerieKri: TAction
      Tag = 551
      Category = 'Almacenes'
      Caption = 'Consultar Numeros Serie'
      Hint = 'Consulta de los n'#250'meros de s'#233'rie.'
      ImageIndex = 115
      OnExecute = AConsultaNroSerieKriExecute
    end
    object AMantenimientoNroSerie: TAction
      Tag = 552
      Category = 'Almacenes'
      Caption = 'N'#250'meros Serie (Serializaci'#243'n)'
      Hint = 'Mantenimiento de los n'#250'meros de serie (serializaci'#243'n)'
      ImageIndex = 115
      OnExecute = AMantenimientoNroSerieExecute
    end
    object AImprimirEtiquetasKri: TAction
      Tag = 351
      Category = 'Ventas'
      Caption = 'Imprimir Etiquetas'
      Hint = 'Impresion de etiquetas.'
      ImageIndex = 14
      OnExecute = AImprimirEtiquetasKriExecute
    end
    object AProrrateoCostes: TAction
      Tag = 451
      Category = 'Compras'
      Caption = '&Prorratear Costes Art'#237'culos'
      Hint = 'Prorrateos de los costes de compra a los art'#237'culos afectados.'
      ImageIndex = 110
      OnExecute = AProrrateoCostesExecute
    end
    object APedidosVentaPendientes: TAction
      Tag = 315
      Category = 'Ventas'
      Caption = 'Listar Pedidos Venta Pendientes'
      Hint = 'Listado de pedidos de clientes (Ventas) pendientes.'
      ImageIndex = 14
      OnExecute = APedidosVentaPendientesExecute
    end
    object APedidosCompraPendientes: TAction
      Tag = 413
      Category = 'Compras'
      Caption = 'Listar Pedidos Compra Pendientes'
      Hint = 'Listado de pedidos de compra pendientes de recibir.'
      ImageIndex = 14
      OnExecute = APedidosCompraPendientesExecute
    end
    object AImagenes: TAction
      Tag = 1032
      Category = 'Auxiliares'
      Caption = '&Im'#225'genes'
      Hint = 'Mantenimiento unificado de las im'#225'genes del sistema.'
      ImageIndex = 28
      OnExecute = AImagenesExecute
    end
    object ALSTGeneraTmpInventarioKri: TAction
      Tag = 556
      Category = 'Almacenes'
      Caption = 'Generar Temporal Inventario'
      Hint = 'Genera Temporal de inventario para ReportSmith'
      ImageIndex = 21
      OnExecute = ALSTGeneraTmpInventarioKriExecute
    end
    object ARiesgoBancos: TAction
      Tag = 813
      Category = 'Tesoreria'
      Caption = '&Listar Riesgos Bancos'
      Hint = 'Listado riesgos de bancos.'
      ImageIndex = 14
      OnExecute = ARiesgoBancosExecute
    end
    object ARiesgoClientes: TAction
      Tag = 814
      Category = 'Tesoreria'
      Caption = 'Listar &Riesgos Clientes'
      Hint = 'Listado riesgos de clientes.'
      ImageIndex = 14
      OnExecute = ARiesgoClientesExecute
    end
    object AAsignaBancoRemesa: TAction
      Tag = 851
      Category = 'Tesoreria'
      Caption = 'Asignar Banco &Remesa'
      Hint = 'Asignacion de banco a remesas.'
      ImageIndex = 56
      OnExecute = AAsignaBancoRemesaExecute
    end
    object AFacAlbaranesCliDet: TAction
      Tag = 353
      Category = 'Ventas'
      Caption = 'Facturar Albaranes por L'#237'neas'
      Hint = 'Facturaci'#243'n de las l'#237'neas de albaran de clientes. (Ventas).'
      ImageIndex = 87
      OnExecute = AFacAlbaranesCliDetExecute
    end
    object ATransmisionesPatrimoniales: TAction
      Tag = 352
      Category = 'Ventas'
      Caption = 'Transmisiones Patrimoniales'
      Hint = 'Transmisiones patrimoniales y actos jur'#237'dicos documentados.'
      ImageIndex = 56
      OnExecute = ATransmisionesPatrimonialesExecute
    end
    object ASumasYSaldosKri: TAction
      Tag = 652
      Category = 'Contabilidad'
      Caption = 'Sumas y Saldos Consolidados'
      Hint = 'Genera tabla temporal para sumas y saldos.'
      ImageIndex = 14
      OnExecute = ASumasYSaldosKriExecute
    end
    object AColoresTallas: TAction
      Tag = 1301
      Category = 'Tallas'
      Caption = '&Colores'
      Hint = 'Mantenimiento de colores.'
      ImageIndex = 109
      OnExecute = AColoresTallasExecute
    end
    object AGruposTallas: TAction
      Tag = 1302
      Category = 'Tallas'
      Caption = '&Grupos Tallas'
      Hint = 'mantenimiento de grupos de tallas.'
      ImageIndex = 4
      OnExecute = AGruposTallasExecute
    end
    object AModelosTallas: TAction
      Tag = 1303
      Category = 'Tallas'
      Caption = '&Modelos'
      Hint = 'Mantenimientro de los modelos con talla y color.'
      ImageIndex = 133
      OnExecute = AModelosTallasExecute
    end
    object ALSTStockTallas: TAction
      Tag = 557
      Category = 'Almacenes'
      Caption = 'Listar Stock Talla Resumido'
      Hint = 'Listado del stocks por tallas resumido.'
      ImageIndex = 14
      OnExecute = ALSTStockTallasExecute
    end
    object AOrdenProduccionTallasKri: TAction
      Tag = 1251
      Category = 'Produccion'
      Caption = 'Orden Produccion &Tallas'
      Hint = 'Orden de Produccion para Tallas y Colores'
      ImageIndex = 70
      OnExecute = AOrdenProduccionTallasKriExecute
    end
    object AEDI: TAction
      Tag = 250
      Category = 'Empresas'
      Caption = 'ED&I'
      Hint = 'Importaci'#243'n y exportacion de mensajes EDI'
      ImageIndex = 98
      OnExecute = AEDIExecute
    end
    object AAgrupacionDeAlbaranesKri: TAction
      Tag = 354
      Category = 'Ventas'
      Caption = 'Agrupar &Albaranes'
      Hint = 'Agrupaci'#243'n de los albaranes para facturar.'
      ImageIndex = 4
      OnExecute = AAgrupacionDeAlbaranesKriExecute
    end
    object ACentroDeCostos: TAction
      Tag = 1050
      Category = 'Auxiliares'
      Caption = 'Centros Costes'
      Hint = 'Mantenimiento de centros de coste del sistema.'
      ImageIndex = 3
      OnExecute = ACentroDeCostosExecute
    end
    object ALstCentroCoste: TAction
      Tag = 653
      Category = 'Contabilidad'
      Caption = 'Listar Centro Coste'
      Hint = 'Listados de Centros de Coste'
      ImageIndex = 14
      OnExecute = ALstCentroCosteExecute
    end
    object AIntrastat: TAction
      Tag = 726
      Category = 'Impuestos'
      Caption = '&Intrastat'
      Hint = 'Mantenimiento para generar el Intrastat.'
      ImageIndex = 136
      OnExecute = AIntrastatExecute
    end
    object AIntrastatCompras: TAction
      Tag = 727
      Category = 'Impuestos'
      Caption = 'Listar Intrastat Compras'
      Hint = 'Listado Intrastat Compras'
      ImageIndex = 14
      OnExecute = AIntrastatComprasExecute
    end
    object AIntrastatVentas: TAction
      Tag = 728
      Category = 'Impuestos'
      Caption = 'Listar Intrastat &Ventas'
      Hint = 'Listado Intrastat Ventas.'
      ImageIndex = 14
      OnExecute = AIntrastatVentasExecute
    end
    object ACierreStocks: TAction
      Tag = 535
      Category = 'Almacenes'
      Caption = 'Cierre Apertura &Stocks'
      Hint = 'Genera el cierre y la apertura de stocks.'
      ImageIndex = 68
      OnExecute = ACierreStocksExecute
    end
    object ARegStocks: TAction
      Tag = 536
      Category = 'Almacenes'
      Caption = '&Regularizaci'#243'n Stocks (Inventarios)'
      Hint = 'Procesos de regularizaci'#243'n de los stocks por almac'#233'n.'
      ImageIndex = 128
      OnExecute = ARegStocksExecute
    end
    object AConfIntrastatCV: TAction
      Tag = 729
      Category = 'Impuestos'
      Caption = 'Listar Intrastat Compras / Ventas'
      Hint = 'Configuraci'#243'n R'#225'pida de Intrastat Compras/Ventas.'
      ImageIndex = 77
      OnExecute = AConfIntrastatCVExecute
    end
    object AExporta349: TAction
      Tag = 730
      Category = 'Impuestos'
      Caption = 'Exportar Modelo 349'
      Hint = 'Modelo 349 - Exportaci'#243'n Datos y Listado'
      ImageIndex = 36
      OnExecute = AExporta349Execute
    end
    object ALotes: TAction
      Tag = 537
      Category = 'Almacenes'
      Caption = '&Lotes'
      Hint = 'Mantenimiento de Lotes. (Trazabilidad).'
      ImageIndex = 120
      OnExecute = ALotesExecute
    end
    object ALSTEstadisticasArt: TAction
      Tag = 218
      Category = 'Empresas'
      Caption = 'Estad'#237'sticas Agentes, Clientes, Proveedores'
      Hint = 'Estad'#237'sticas de agentes, clientes y proveedores.'
      ImageIndex = 32
      OnExecute = ALSTEstadisticasArtExecute
    end
    object APedFueraPlazo: TAction
      Tag = 414
      Category = 'Compras'
      Caption = 'Listar &Pedidos Fuera Plazo'
      Hint = 'Listado de los pedidos de compra que estan fuera de plazo.'
      ImageIndex = 14
      OnExecute = APedFueraPlazoExecute
    end
    object ALoteSimple: TAction
      Tag = 572
      Category = 'Almacenes'
      Caption = 'Lote &Simple'
      Hint = 'Mantenimiento de Lotes Simples.'
      ImageIndex = 120
      OnExecute = ALoteSimpleExecute
    end
    object ACondicionesVenta: TAction
      Tag = 539
      Category = 'Almacenes'
      Caption = 'Condiciones &Especiales Venta'
      Hint = 'Mantenimiento de condiciones especiales de venta.'
      ImageIndex = 15
      OnExecute = ACondicionesVentaExecute
    end
    object AAsistenteEmpresa: TAction
      Tag = 216
      Category = 'Empresas'
      Caption = '&Asistente Creaci'#243'n Nueva Empresa'
      Hint = 'Asistente para crear una nueva empresa.'
      ImageIndex = 17
      OnExecute = AAsistenteEmpresaExecute
    end
    object AAsistenteEjercicio: TAction
      Tag = 217
      Category = 'Empresas'
      Caption = 'Asistente  Crear Nuevo Ejercicio'
      Hint = 
        'Asistente para la creaci'#243'n de un nuevo ejercicio. (Siguiente eje' +
        'rcicio).'
      ImageIndex = 50
      OnExecute = AAsistenteEjercicioExecute
    end
    object ACondicionesCompra: TAction
      Tag = 540
      Category = 'Almacenes'
      Caption = 'Condiciones &Especiales Compra'
      Hint = 'Mantenimiento de condiciones especiales de compra.'
      ImageIndex = 15
      OnExecute = ACondicionesCompraExecute
    end
    object AMatriculas: TAction
      Tag = 1037
      Category = 'Auxiliares'
      Caption = '&Matr'#237'culas Transporte'
      Hint = 'Mantenimiento de los veh'#237'culos transporte. (Matriculas)'
      ImageIndex = 112
      OnExecute = AMatriculasExecute
    end
    object ANaturalezaMat: TAction
      Tag = 1038
      Category = 'Auxiliares'
      Caption = '&Transportes Naturalezas Materiales'
      Hint = 
        'mantenimiento de tipos de naturaleza de los materiales para el t' +
        'ransporte.'
      ImageIndex = 112
      OnExecute = ANaturalezaMatExecute
    end
    object APedFueraPlazoVentas: TAction
      Tag = 316
      Category = 'Ventas'
      Caption = 'Listar &Pedidos Fuera Plazo'
      Hint = 'Listado de pedidos fuera de plazo. (Ventas)'
      ImageIndex = 14
      OnExecute = APedFueraPlazoVentasExecute
    end
    object AIncidencias: TAction
      Tag = 108
      Category = 'Terceros'
      Caption = '&Incidencias'
      Hint = 
        'Mantenimiento de incidencias de clientes, proveedores, acreedore' +
        's, agentes.'
      ImageIndex = 6
      OnExecute = AIncidenciasExecute
    end
    object AParamApuntes: TAction
      Tag = 619
      Category = 'Contabilidad'
      Caption = 'Configuraci'#243'n Apuntes Contables'
      Hint = 'Parametrizaci'#243'n de los apuntes contables.'
      ImageIndex = 30
      OnExecute = AParamApuntesExecute
    end
    object AConfigTextos: TAction
      Tag = 1112
      Category = 'Utilidades'
      Caption = 'Idioma &Textos Documentos'
      Hint = 
        'Configuraci'#243'n de los textos o labels de los documentos de compra' +
        ' y venta para los idiomas seg'#250'n clientes de los listados.'
      ImageIndex = 91
      OnExecute = AConfigTextosExecute
    end
    object AFacCuotas: TAction
      Tag = 317
      Category = 'Ventas'
      Caption = 'Facturar Cuotas'
      Hint = 'Facturaci'#243'n de cuotas periodicas indicadas en los clientes.'
      ImageIndex = 42
      OnExecute = AFacCuotasExecute
    end
    object AAlmacenesCalles: TAction
      Tag = 541
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Calles'
      Hint = 
        'Mantenimiento de calles dentro de las ubicaciones de los almacen' +
        'es.'
      ImageIndex = 81
      OnExecute = AAlmacenesCallesExecute
    end
    object AAlmacenesEstanterias: TAction
      Tag = 542
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Estanterias'
      Hint = 
        'Mantenimiento de las estanter'#237'as de las calles en las ubicacione' +
        's de almacenes.'
      ImageIndex = 81
      OnExecute = AAlmacenesEstanteriasExecute
    end
    object AAlmacenesRepisas: TAction
      Tag = 543
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Repisas'
      Hint = 
        'Mantenimiento de las repisas en las estanterias de lso almacenes' +
        '.'
      ImageIndex = 81
      OnExecute = AAlmacenesRepisasExecute
    end
    object AAlmacenesPosicion: TAction
      Tag = 544
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Posiciones'
      Hint = 'Mantenimiento de las posiciones en las repisas de los almacenes.'
      ImageIndex = 81
      OnExecute = AAlmacenesPosicionExecute
    end
    object AEnvioReparto: TAction
      Tag = 318
      Category = 'Ventas'
      Caption = '&Enviar Repartir Albaranes'
      Hint = 
        'Creaci'#243'n y agrupaci'#243'n de albaranes para generar un registro de e' +
        'nv'#237'o o reparto.'
      ImageIndex = 112
      OnExecute = AEnvioRepartoExecute
    end
    object AConfigAlmcen: TAction
      Tag = 545
      Category = 'Ubicacion'
      Caption = 'Configurar &Ubicaciones'
      Hint = 'Configuraci'#243'n de las ubicaciones de los almacenes.'
      ImageIndex = 2
      OnExecute = AConfigAlmcenExecute
    end
    object AMovEntreUbicaciones: TAction
      Tag = 546
      Category = 'Ubicacion'
      Caption = 'Mover Articulos U&bicaciones'
      Hint = 'Movimientos manuales entre las ubicaciones'
      ImageIndex = 35
      OnExecute = AMovEntreUbicacionesExecute
    end
    object ALstStockPorUbicacion: TAction
      Tag = 547
      Category = 'Almacenes'
      Caption = 'Listar Stocks Ubicaci'#243'n'
      Hint = 'Listado de stocks por cada ubicaci'#243'n'
      ImageIndex = 14
      OnExecute = ALstStockPorUbicacionExecute
    end
    object ALstMovEntreUbicaciones: TAction
      Tag = 548
      Category = 'Almacenes'
      Caption = 'Listar Movimientos Ubicaciones'
      Hint = 'Listado de movimientos entre las ubicaciones de almacenes.'
      ImageIndex = 14
      OnExecute = ALstMovEntreUbicacionesExecute
    end
    object AFacturasDirectas: TAction
      Tag = 357
      Category = 'Ventas'
      Caption = 'Facturas Directas'
      Hint = 'Facturas Directas'
      ImageIndex = 1
      OnExecute = AFacturasDirectasExecute
    end
    object ACaravanas: TAction
      Tag = 557
      Category = 'Almacenes'
      Caption = 'Cara&vanas'
      Hint = 'Caravanas'
      ImageIndex = 112
      OnExecute = ACaravanasExecute
    end
    object ATipoPortes: TAction
      Tag = 207
      Category = 'Empresas'
      Caption = '&Tipos Portes'
      Hint = 'Mantenimiento y configuraci'#243'n de tipos de portes.'
      ImageIndex = 90
      OnExecute = ATipoPortesExecute
    end
    object ARangosPortes: TAction
      Tag = 219
      Category = 'Empresas'
      Caption = 'Rangos P&ortes'
      Hint = 'mantenimiento y configuraci'#243'n del rango en portes.'
      ImageIndex = 90
      OnExecute = ARangosPortesExecute
    end
    object APromocionesVenta: TAction
      Tag = 549
      Category = 'Almacenes'
      Caption = '&Promociones Ventas'
      Hint = 'Mantenimiento de promociones para ventas.'
      ImageIndex = 21
      OnExecute = APromocionesVentaExecute
    end
    object APromocionesIndirectas: TAction
      Tag = 550
      Category = 'Almacenes'
      Caption = 'Promociones Indirectas'
      Hint = 'Mantenimiento de promociones indirectas'
      ImageIndex = 21
      OnExecute = APromocionesIndirectasExecute
    end
    object AOrdenPromocion: TAction
      Tag = 1039
      Category = 'Auxiliares'
      Caption = '&Ordenes  Promociones'
      Hint = 
        'Ordenes en las que se aplicar'#225'n las promociones activas de la em' +
        'presa.'
      ImageIndex = 21
      OnExecute = AOrdenPromocionExecute
    end
    object ATrazabilidadLotes: TAction
      Tag = 551
      Category = 'Almacenes'
      Caption = 'Listar Trazabilidad Lotes'
      Hint = 'Listado de la trazabilidad de los lotes.'
      ImageIndex = 14
      OnExecute = ATrazabilidadLotesExecute
    end
    object AAsistenteTarifa: TAction
      Tag = 220
      Category = 'Empresas'
      Caption = 'Asistente  Importaci'#243'n Tarifas'
      Hint = 'Asistente para importar tarifas de tablas excel.'
      ImageIndex = 33
      OnExecute = AAsistenteTarifaExecute
    end
    object APropuestas: TAction
      Tag = 415
      Category = 'Compras'
      Caption = '&Propuestas Proveedor'
      Hint = 'Mantenimiento de propuestas de proveedores.'
      ImageIndex = 73
      OnExecute = APropuestasExecute
    end
    object APropuestasConfirm: TAction
      Tag = 416
      Category = 'Compras'
      Caption = 'Propuestas &Compra Confirmadas'
      Hint = 
        'Propuestas de compras confirmadas y pendientes de pasar a pedido' +
        's.'
      ImageIndex = 73
      OnExecute = APropuestasConfirmExecute
    end
    object AArtBultos: TAction
      Tag = 552
      Category = 'Almacenes'
      Caption = '&Bultos'
      Hint = 'Mantenimiento de los tipos de bultos.'
      ImageIndex = 90
      OnExecute = AArtBultosExecute
    end
    object AVentas: TAction
      Tag = 10000
      Category = 'TPV'
      Caption = 'Ventas TPV'
      Hint = 'Ventas'
      ImageIndex = 13
      OnExecute = AVentasExecute
    end
    object ATicketsEdicion: TAction
      Tag = 10001
      Category = 'TPV'
      Caption = 'Editar Tickets Venta'
      Hint = 'Editar los tickets de venta.'
      ImageIndex = 126
    end
    object AVentasArticulos: TAction
      Tag = 10002
      Category = 'TPV'
      Caption = 'Ver Ventas Art'#237'culos'
      Hint = 'Listado de ventas de art'#237'culos.'
      ImageIndex = 85
    end
    object AFacturarTickets: TAction
      Tag = 10003
      Category = 'TPV'
      Caption = 'Facturar Tickets TPV'
      Hint = 'Facturaci'#243'n de los tickets pendientes.'
      ImageIndex = 61
      OnExecute = AFacturarTicketsExecute
    end
    object ACobros: TAction
      Tag = 10004
      Category = 'TPV'
      Caption = 'Cobros'
      Hint = 'Cobros'
      ImageIndex = 56
    end
    object ACobrosEdicion: TAction
      Tag = 10005
      Category = 'TPV'
      Caption = 'Edici'#243'n Cobros'
      Hint = 'Edici'#243'n de Cobros'
      ImageIndex = 21
    end
    object AGastos: TAction
      Tag = 10101
      Category = 'TPV App'
      Caption = 'Gastos TPV'
      Hint = 'Gastos'
      ImageIndex = 13
    end
    object ATicketsEdicionGastos: TAction
      Tag = 10102
      Category = 'TPV App'
      Caption = 'Editar Tickets Gasto'
      Hint = 'Edici'#243'n de tickets de gasto'
      ImageIndex = 126
    end
    object AFacturarTicketsGasto: TAction
      Tag = 10103
      Category = 'TPV App'
      Caption = 'Facturar Tickets Gasto'
      Hint = 'Facturaci'#243'n de Tickets de Gasto'
      ImageIndex = 21
    end
    object ASesion: TAction
      Tag = 10202
      Category = 'TPV'
      Caption = '&Sesiones'
      Hint = 'Operar con las sesiones. (Abrir, cerrar).'
      ImageIndex = 67
    end
    object ACajas: TAction
      Tag = 10204
      Category = 'TPV'
      Caption = '&Cajas TPV'
      Hint = 'Operar con las cajas del TPV.'
      ImageIndex = 91
    end
    object ATurnos: TAction
      Tag = 10203
      Category = 'TPV'
      Caption = '&Turnos TPV'
      Hint = 'Operar con los turnos del TPV.'
      ImageIndex = 102
    end
    object ATercerosTPV: TAction
      Tag = 10300
      Category = 'TPV App'
      Caption = '&Terceros TPV'
      Hint = 'Mantenimiento de terceros en el TPV.'
      ImageIndex = 15
    end
    object AClientesTPV: TAction
      Tag = 10301
      Category = 'TPV App'
      Caption = '&Clientes TPV'
      Hint = 'mantenimiento de clientes en el TPV.'
      ImageIndex = 56
    end
    object ACajasEmpresa: TAction
      Tag = 10400
      Category = 'TPV'
      Caption = 'Cajas'
      Hint = 'Configurar las cajas de la empresa.'
      ImageIndex = 56
      OnExecute = ACajasEmpresaExecute
    end
    object ACajasSistema: TAction
      Tag = 10500
      Category = 'TPV App'
      Caption = '&Cajas TPV'
      Hint = 'Mantenimiento de las cajas del sistema.'
      ImageIndex = 90
      OnExecute = ACajasSistemaExecute
    end
    object AUsuariosTPV: TAction
      Tag = 10501
      Category = 'TPV App'
      Caption = 'Usuario / Caja'
      Hint = 'Cambio de usuario por caja.'
      ImageIndex = 12
    end
    object AEmpEjerCan: TAction
      Tag = 10502
      Category = 'TPV App'
      Caption = '&Seleccionar Empresa Ejercicio...'
      Hint = 'Selecci'#243'n de la empresa, ejercicio, canal y serie.'
      ImageIndex = 88
    end
    object AFondoTPV: TAction
      Tag = 10503
      Category = 'TPV App'
      Caption = 'Ocultar Fondo'
      Hint = 'Ocultar o mostrar fondo de pantalla.'
      ImageIndex = 22
    end
    object AConfiguracion: TAction
      Tag = 10504
      Category = 'TPV App'
      Caption = '&Configuraci'#243'n'
      Hint = 'Configuraci'#243'n del sistema TPV'
      ImageIndex = 2
    end
    object ATiposGasto: TAction
      Tag = 10507
      Category = 'TPV App'
      Caption = 'Tipos Gastos'
      Hint = 'Mantenimiento de los tipos de gasto en el TPV.'
      ImageIndex = 56
    end
    object AFormaPagoTpv: TAction
      Tag = 10508
      Category = 'TPV App'
      Caption = 'Formas Pago'
      Hint = 'Configuraci'#243'n formas de pago en TPV.'
      ImageIndex = 3
      OnExecute = AFormaPagoTpvExecute
    end
    object APerfilesUsuarioTPV: TAction
      Tag = 10509
      Category = 'TPV App'
      Caption = 'Perfiles Usuario TPV'
      Hint = 'Mantenimiento de perfiles de usuario para TPV'
      ImageIndex = 104
    end
    object APedidosPendientes: TAction
      Tag = 109
      Category = 'Terceros'
      Caption = '&Pedidos Pendientes'
      Hint = 'Pedidos Pendientes'
      ImageIndex = 12
      OnExecute = APedidosPendientesExecute
    end
    object AAlbaranesPendientes: TAction
      Tag = 110
      Category = 'Terceros'
      Caption = '&Albaranes Pendientes'
      Hint = 'Albaranes pendientes.'
      ImageIndex = 13
      OnExecute = AAlbaranesPendientesExecute
    end
    object AFiltroFacturas: TAction
      Tag = 111
      Category = 'Terceros'
      Caption = '&Filtrar Facturas'
      Hint = 'Filtro Facturas'
      ImageIndex = 14
      OnExecute = AFiltroFacturasExecute
    end
    object APedidosPendientesProv: TAction
      Tag = 112
      Category = 'Terceros'
      Caption = '&Pedidos Pendientes Proveedor'
      Hint = 'Pedidos Pendientes Proveedor'
      ImageIndex = 62
      OnExecute = APedidosPendientesProvExecute
    end
    object AAlbaranesPendientesProv: TAction
      Tag = 113
      Category = 'Terceros'
      Caption = '&Albaranes Pendientes Proveedor'
      Hint = 'Albaranes Pendientes Proveedor'
      ImageIndex = 60
      OnExecute = AAlbaranesPendientesProvExecute
    end
    object AFiltroFacturasProv: TAction
      Tag = 114
      Category = 'Terceros'
      Caption = 'Filtrar Facturas Proveedor'
      Hint = 'Filtro Facturas Proveedor'
      ImageIndex = 61
      OnExecute = AFiltroFacturasProvExecute
    end
    object AFiltroFacturasAcr: TAction
      Tag = 115
      Category = 'Terceros'
      Caption = 'Filtrar Facturas &Acreedor'
      Hint = 'Filtro Facturas Acreedor'
      ImageIndex = 61
      OnExecute = AFiltroFacturasAcrExecute
    end
    object ADivisionesMaestros: TAction
      Tag = 1051
      Category = 'Auxiliares'
      Caption = '&Divisiones'
      Hint = 'Maestro de Divisiones'
      ImageIndex = 21
      OnExecute = ADivisionesMaestrosExecute
    end
    object AUsuariosWeb: TAction
      Tag = 1040
      Category = 'Auxiliares'
      Caption = 'Usuarios &web'
      Hint = 
        'Mantenimiento de los usuarios que se conectaran a Delweb o Delpr' +
        'o'
      ImageIndex = 24
      OnExecute = AUsuariosWebExecute
    end
    object AHistoricoProcesosProv: TAction
      Tag = 417
      Category = 'Compras'
      Caption = '&Hist'#243'rico Procesos Compra'
      Hint = 'Hist'#243'rico de procesos autom'#225'ticos efectuados en compras'
      ImageIndex = 16
      OnExecute = AHistoricoProcesosProvExecute
    end
    object AAnaPlanesContables: TAction
      Tag = 1301
      Category = 'Contabilidad Analitica'
      Caption = 'Planes contables anal'#237'ticos'
      Hint = 'Mantenimiento de los Planes Contables'
      ImageIndex = 30
      OnExecute = AAnaPlanesContablesExecute
    end
    object AAnaCentrosCoste: TAction
      Tag = 1302
      Category = 'Contabilidad Analitica'
      Caption = 'Centros Coste'
      Hint = 'Mantenimiento de los Centros de Coste'
      ImageIndex = 21
      OnExecute = AAnaCentrosCosteExecute
    end
    object AAnaPlantillasImputacion: TAction
      Tag = 1303
      Category = 'Contabilidad Analitica'
      Caption = 'Plantillas Imputaci'#243'n'
      Hint = 'Mantenimiento de las Plantillas de Imputaci'#243'n'
      ImageIndex = 30
      OnExecute = AAnaPlantillasImputacionExecute
    end
    object AAnaImputacionesCostes: TAction
      Tag = 1304
      Category = 'Contabilidad Analitica'
      Caption = 'Imputaciones'
      Hint = 'Imputaciones a Centros de Coste'
      ImageIndex = 21
      OnExecute = AAnaImputacionesCostesExecute
    end
    object AAnaExtracto: TAction
      Tag = 1305
      Category = 'Contabilidad Analitica'
      Caption = 'Extractos'
      Hint = 'Consultas a los saldos de Centros de Coste'
      ImageIndex = 42
      OnExecute = AAnaExtractoExecute
    end
    object AAnaSumaYSaldos: TAction
      Tag = 1306
      Category = 'Contabilidad Analitica'
      Caption = 'Suma y Saldos'
      Hint = 'Listado de Suma y Saldos Contabilidad Anal'#237'tica'
      ImageIndex = 125
      OnExecute = AAnaSumaYSaldosExecute
    end
    object AAnaAnalisisPresupuesto: TAction
      Tag = 1307
      Category = 'Contabilidad Analitica'
      Caption = 'An'#225'lisis Presupuesto'
      Hint = 'An'#225'lisis Presupuesto Contabilidad Anal'#237'tica'
      ImageIndex = 40
      OnExecute = AAnaAnalisisPresupuestoExecute
    end
    object AAnaPropagaEstructuras: TAction
      Tag = 1308
      Category = 'Contabilidad Analitica'
      Caption = 'Propagaci'#243'n Estructuras Anal'#237'ticas'
      Hint = 'Propagar Estructuras'
      ImageIndex = 86
      OnExecute = AAnaPropagaEstructurasExecute
    end
    object AAnaLstPlanContableAnalitico: TAction
      Tag = 1309
      Category = 'Contabilidad Analitica'
      Caption = 'Plan Contable Anal'#237'tico'
      Hint = 'Listado de Plan Contable Anal'#237'tico'
      ImageIndex = 14
      OnExecute = AAnaLstPlanContableAnaliticoExecute
    end
    object AUsuarioCambiaClave: TAction
      Tag = 1041
      Category = 'Auxiliares'
      Caption = 'Cam&biar Clave Usuario'
      Hint = 'Cambio de la clave del usuario'
      ImageIndex = 12
      OnExecute = AUsuarioCambiaClaveExecute
    end
    object AImportarAsientos: TAction
      Tag = 620
      Category = 'Contabilidad'
      Caption = '&Importar Asientos'
      Hint = 'Importar asientos de una contabilidad externa.'
      ImageIndex = 49
      OnExecute = AImportarAsientosExecute
    end
    object AExportarAsientos: TAction
      Tag = 621
      Category = 'Contabilidad'
      Caption = '&Exportar Asientos'
      Hint = 'Exportar asientos contables a otra contabilidad o a excel.'
      ImageIndex = 36
      OnExecute = AExportarAsientosExecute
    end
    object AExportarSaldos: TAction
      Tag = 622
      Category = 'Contabilidad'
      Caption = 'Exportar &Saldos Contables'
      Hint = 
        'Exportar saldos de la contabilidad de la empresa a otra contabil' +
        'idad o a excel.'
      ImageIndex = 36
      OnExecute = AExportarSaldosExecute
    end
    object AParamModelosHacienda: TAction
      Tag = 731
      Category = 'Impuestos'
      Caption = 'Parametros Modelos Hacienda'
      Hint = 'Parametros de configuraci'#243'n para los modelos de hacienda.'
      ImageIndex = 136
      OnExecute = AParamModelosHaciendaExecute
    end
    object AOrdenesDePago: TAction
      Tag = 852
      Category = 'Tesoreria'
      Caption = '&Ordenes Pago CSB34'
      Hint = 'Ordenes De Pago para utilizar la norma CSB 34'
      ImageIndex = 123
      OnExecute = AOrdenesDePagoExecute
    end
    object ANorma43SLucia: TAction
      Tag = 654
      Category = 'Contabilidad'
      Caption = 'Importacion Norma 43 Santa Lucia'
      Hint = 'Importacion de ficheros con norma CSB 43 '
      ImageIndex = 49
      OnExecute = ANorma43SLuciaExecute
    end
    object ACRM: TAction
      Tag = 151
      Category = 'Terceros'
      Caption = 'CRM'
      Hint = 'C.R.M.'
      ImageIndex = 106
      OnExecute = ACRMExecute
    end
    object ASincronizarBasesKri: TAction
      Tag = 1052
      Category = 'ECommerce'
      Caption = 'Sincronizar Bases Datos'
      Hint = 
        'Sincroniza: Terceros, Clientes, Proveedores, Familias, Articulos' +
        ' y Tarifas de Venta'
      ImageIndex = 98
      OnExecute = ASincronizarBasesKriExecute
    end
    object ANorma43Kri: TAction
      Tag = 655
      Category = 'Contabilidad'
      Caption = 'Importacion Norma 43'
      Hint = 'Importacion de ficheros con norma CSB 43'
      ImageIndex = 123
      OnExecute = ANorma43KriExecute
    end
    object AContaRectAsientos: TAction
      Tag = 623
      Category = 'Contabilidad'
      Caption = 'Rectificar Asientos Negativos'
      Hint = 'Rectificaci'#243'n de Asientos'
      ImageIndex = 29
      OnExecute = AContaRectAsientosExecute
    end
    object AConfAlmacenes: TAction
      Tag = 554
      Category = 'Almacenes'
      Caption = '&Configurar Almacenes'
      Hint = 'Configuraci'#243'n de las estructura de los almacenes.'
      ImageIndex = 2
      OnExecute = AConfAlmacenesExecute
    end
    object APreciosCosteKri: TAction
      Tag = 560
      Category = 'Almacenes'
      Caption = 'P&recios Coste'
      Hint = 'Precios de coste para valorar inventarios.'
      ImageIndex = 56
      OnExecute = APreciosCosteKriExecute
    end
    object AEquivalencias: TAction
      Tag = 1042
      Category = 'Auxiliares'
      Caption = '&Equivalencias Planes Contables'
      Hint = 'Gestionar equivalencias entre planes contables.'
      ImageIndex = 30
      OnExecute = AEquivalenciasExecute
    end
    object AModificaPGC: TAction
      Tag = 624
      Category = 'Contabilidad'
      Caption = 'Modificar PGC Empresa'
      Hint = 'Modifica el PGC de una Empresa-Ejercicio-Canal'
      ImageIndex = 3
      OnExecute = AModificaPGCExecute
    end
    object AGestions: TAction
      Tag = 1043
      Category = 'Auxiliares'
      Caption = '&Gestiones Contables'
      Hint = 
        'Tipos de gestiones contables para generar los asientos de la emp' +
        'resa.'
      ImageIndex = 30
      OnExecute = AGestionsExecute
    end
    object ACambioEmpresaEjerCanal: TAction
      Tag = 1115
      Category = 'Utilidades'
      Caption = '&Cambiar  Empresa-Ejercicio-Canal'
      Hint = 'Cambio de empresa-ejercicio-canal.'
      ImageIndex = 17
      OnExecute = ACambioEmpresaEjerCanalExecute
    end
    object ATipoLineaVenta: TAction
      Tag = 1053
      Category = 'Auxiliares'
      Caption = '&Tipos L'#237'nea Venta'
      Hint = 'Definici'#243'n de los tipos de l'#237'nea de venta'
      ImageIndex = 21
      OnExecute = ATipoLineaVentaExecute
    end
    object APedidoEntreAlmacenes: TAction
      Tag = 561
      Category = 'Almacenes'
      Caption = '&Pedido Entre Almacenes'
      Hint = 'Pedidos internos entre almacenes o entre tiendas.'
      ImageIndex = 62
      OnExecute = APedidoEntreAlmacenesExecute
    end
    object ATraspasoPedCliAPedProv: TAction
      Tag = 452
      Category = 'Compras'
      Caption = 'Tras&pasar Pedidos Cliente Proveedor'
      Hint = 'Traspaso Pedidos de Cliente a Pedidos a Proveedor'
      ImageIndex = 25
      OnExecute = ATraspasoPedCliAPedProvExecute
    end
    object ARecepcionWeb: TAction
      Tag = 418
      Category = 'ECommerce'
      Caption = 'Recepcionar Pedidos &Web'
      Hint = 'Recepci'#243'n de pedidos de proveedores desde la Web.'
      ImageIndex = 62
      OnExecute = ARecepcionWebExecute
    end
    object ATipoIncidenciaKri: TAction
      Tag = 1054
      Category = 'Auxiliares'
      Caption = 'Tipos &Incidencia'
      Hint = 
        'Tipos de incidencias en clientes, proveedores, acreedores, agent' +
        'es..'
      ImageIndex = 6
      OnExecute = ATipoIncidenciaKriExecute
    end
    object AAlarmasIberfluidKri: TAction
      Tag = 453
      Category = 'Compras'
      Caption = 'Alarmas Iberfluid'
      Hint = 'Alarmas Iberfluid'
      ImageIndex = 50
      OnExecute = AAlarmasIberfluidKriExecute
    end
    object AProcesosKri: TAction
      Tag = 251
      Category = 'Empresas'
      Caption = '&Lanzar Avisos'
      Hint = 'Procesos Autom'#225'ticos - Trepat'
      ImageIndex = 16
      OnExecute = AProcesosKriExecute
    end
    object AIdiomasKri: TAction
      Tag = 1055
      Category = 'Auxiliares'
      Caption = 'Configurar Impresi'#243'n &Idiomas'
      Hint = 
        'Configuraci'#243'n de los textos de los informes (facturas, pedidos, ' +
        'etc ) de los Idiomas del sistema.'
      ImageIndex = 2
      OnExecute = AIdiomasKriExecute
    end
    object AImportarDocumentos: TAction
      Tag = 358
      Category = 'ECommerce'
      Caption = 'Importar Documentos Excel'
      Hint = 'Importar documentos de venta con tablas excel.'
      ImageIndex = 49
      OnExecute = AImportarDocumentosExecute
    end
    object AZonas: TAction
      Tag = 1056
      Category = 'Auxiliares'
      Caption = '&Zonas'
      Hint = 'Mantenimiento de las zonas de los clientes.'
      ImageIndex = 81
      OnExecute = AZonasExecute
    end
    object APersonalUlises: TAction
      Tag = 252
      Category = 'Empresas'
      Caption = 'Personal Ulises'
      Hint = 'Interfaz Comunicaci'#243'n con Personal Ulises'
      ImageIndex = 94
      OnExecute = APersonalUlisesExecute
    end
    object ATransportistasSEUR: TAction
      Tag = 253
      Category = 'Empresas'
      Caption = 'Transportistas S&EUR'
      Hint = 'Configuraci'#243'n de datos para Transportistas SEUR'
      ImageIndex = 112
      OnExecute = ATransportistasSEURExecute
    end
    object ATransportistasDHL: TAction
      Tag = 253
      Category = 'Empresas'
      Caption = 'Transportistas DHL'
      Hint = 'Configuraci'#243'n de datos para Transportistas DHL'
      ImageIndex = 112
      OnExecute = ATransportistasDHLExecute
    end
    object ATransportistasIDRIL: TAction
      Tag = 264
      Category = 'Empresas'
      Caption = 'Transportista IDRIL (GLS)'
      Hint = 'Configuraci'#243'n de datos para Transportistas IDRIL (GLS)'
      ImageIndex = 112
      OnExecute = ATransportistasIDRILExecute
    end
    object ACrmAmbitos: TAction
      Tag = 15000
      Category = 'CRM'
      Caption = '&'#193'mbitos'
      Hint = 'Mantenimiento de '#225'mbitos de los contactos.'
      ImageIndex = 21
      OnExecute = ACrmAmbitosExecute
    end
    object ACrmEMails: TAction
      Tag = 15001
      Category = 'CRM'
      Caption = 'Correos Electr'#243'nicos (E-Mails)'
      Hint = 'Mantenimiento de los correos electr'#243'nicos para envios masivos.'
      ImageIndex = 34
      OnExecute = ACrmEMailsExecute
    end
    object ACrmTipoAcciones: TAction
      Tag = 15002
      Category = 'CRM'
      Caption = '&Tipo Acciones'
      Hint = 'mantenimiento de los tipos de acciones comerciales.'
      ImageIndex = 21
      OnExecute = ACrmTipoAccionesExecute
    end
    object ACrmContactos: TAction
      Tag = 15003
      Category = 'CRM'
      Caption = '&Contactos'
      Hint = 'Mantenimiento de los contactos del CRM.'
      ImageIndex = 54
      OnExecute = ACrmContactosExecute
    end
    object ADisenarTicket: TAction
      Tag = 10550
      Category = 'TPV'
      Caption = 'Dise'#241'ar &Ticket'
      Hint = 'Dise'#241'ador de informes de Ticket'
      ImageIndex = 77
      OnExecute = ADisenarTicketExecute
    end
    object ADisenarVale: TAction
      Tag = 10551
      Category = 'TPV'
      Caption = 'Dise'#241'ar &Vale'
      Hint = 'Dise'#241'ador de informes de Vales'
      ImageIndex = 77
      OnExecute = ADisenarValeExecute
    end
    object ADisenarTicketRecogida: TAction
      Tag = 10552
      Category = 'TPV'
      Caption = 'Dise'#241'ar Ticket &Recogida'
      Hint = 'Dise'#241'ador de informes de Ticket de Recogida'
      ImageIndex = 77
      OnExecute = ADisenarTicketRecogidaExecute
    end
    object ACrmConsultaAcciones: TAction
      Tag = 15004
      Category = 'CRM'
      Caption = '&Seguimientos'
      Hint = 'Seguimiento de Acciones Comerciales'
      ImageIndex = 83
      OnExecute = ACrmConsultaAccionesExecute
    end
    object ACrmConfiguracion: TAction
      Tag = 15005
      Category = 'CRM'
      Caption = '&Configuraci'#243'n CRM'
      Hint = 'Configuraci'#243'n de  los parametros del CRM.'
      ImageIndex = 119
      OnExecute = ACrmConfiguracionExecute
    end
    object ACrmOrigenRel: TAction
      Tag = 15006
      Category = 'CRM'
      Caption = '&Origen Contacto'
      Hint = 'Mantenimiento de los origenes de los contactos.'
      ImageIndex = 21
      OnExecute = ACrmOrigenRelExecute
    end
    object ACrmImportarContactos: TAction
      Tag = 15007
      Category = 'CRM'
      Caption = 'Importar Contactos'
      Hint = 'Importaci'#243'n masiva de contactos desde un excel.'
      ImageIndex = 49
      OnExecute = ACrmImportarContactosExecute
    end
    object AEstadisticas: TAction
      Tag = 15100
      Category = 'Estadisticas'
      Caption = 'E&stad'#237'sticas Configurables'
      Hint = 'Mantenimiento de estad'#237'sticas configurables por periodos.'
      ImageIndex = 32
      OnExecute = AEstadisticasExecute
    end
    object AIsoAccPreventiva: TAction
      Tag = 14600
      Category = 'Produccion ISO'
      Caption = '&Acciones Preventivas'
      Hint = 'Mantenimiento acciones preventivas.'
      ImageIndex = 89
      OnExecute = AIsoAccPreventivaExecute
    end
    object AIsoMantTAcc: TAction
      Tag = 14601
      Category = 'Produccion ISO'
      Caption = '&Tipos Acciones'
      Hint = 'Mantenimiento tipo de los tipos de acciones.'
      ImageIndex = 94
      OnExecute = AIsoMantTAccExecute
    end
    object AIsoPlanCapac: TAction
      Tag = 14602
      Category = 'Produccion ISO'
      Caption = 'Plan &Capacitaci'#243'n'
      Hint = 'Mantenimiento planes de capacitaci'#243'n.'
      ImageIndex = 21
      OnExecute = AIsoPlanCapacExecute
    end
    object AIsoClassProv: TAction
      Tag = 14603
      Category = 'Produccion ISO'
      Caption = 'Clasificaci'#243'n &Proveedores'
      Hint = 'Clasificaci'#243'n ABC de proveedores.'
      ImageIndex = 15
      OnExecute = AIsoClassProvExecute
    end
    object AIsoDevMat: TAction
      Tag = 14604
      Category = 'Produccion ISO'
      Caption = 'Devoluci'#243'n &Material INC'
      Hint = 'Devoluci'#243'n de materiales con informe de con conformidad.'
      ImageIndex = 27
      OnExecute = AIsoDevMatExecute
    end
    object AIsoMantInformes: TAction
      Tag = 14605
      Category = 'Produccion ISO'
      Caption = 'Informes No Conformidad (INC)'
      Hint = 'Mantenimiento de informes de no conformidad. (INC)'
      ImageIndex = 21
      OnExecute = AIsoMantInformesExecute
    end
    object AIsoControlEquip: TAction
      Tag = 14606
      Category = 'Produccion ISO'
      Caption = 'Control &Equipos Medici'#243'n'
      Hint = 'Control equipos de medici'#243'n.'
      ImageIndex = 23
      OnExecute = AIsoControlEquipExecute
    end
    object AIsoPunteos: TAction
      Tag = 14607
      Category = 'Produccion ISO'
      Caption = 'Punteos INC'
      Hint = 'Punteos y cierres de informes de no conformidades.'
      ImageIndex = 118
      OnExecute = AIsoPunteosExecute
    end
    object AIsoFirmas: TAction
      Tag = 14608
      Category = 'Produccion ISO'
      Caption = '&Firmas ISO'
      Hint = 'Mantenimiento de firmas ISO.'
      ImageIndex = 19
      OnExecute = AIsoFirmasExecute
    end
    object AIsoCursos: TAction
      Tag = 14609
      Category = 'Produccion ISO'
      Caption = '&Cursos Formaci'#243'n'
      Hint = 'mantenimiento de cursos formaci'#243'n.'
      ImageIndex = 50
      OnExecute = AIsoCursosExecute
    end
    object AIsoPlanning: TAction
      Tag = 14610
      Category = 'Produccion ISO'
      Caption = 'Planning Formaci'#243'n'
      Hint = 'Planning de formacion de los empleados.'
      ImageIndex = 30
      OnExecute = AIsoPlanningExecute
    end
    object AProEscandalloSF: TAction
      Tag = 14400
      Category = 'Produccion Avanzada'
      Caption = '&Escandallos Producci'#243'n'
      Hint = 'Mantenimiento de escandallos, desglose, ensamblado, etc.'
      ImageIndex = 10
      OnExecute = AProEscandalloSFExecute
    end
    object AProMarcajesOpe: TAction
      Tag = 14401
      Category = 'Produccion Avanzada'
      Caption = 'Marcajes Operario &Tarea'
      Hint = 
        'mantenimiento de los marcajes de los operarios por el ID de la t' +
        'area.'
      ImageIndex = 15
      OnExecute = AProMarcajesOpeExecute
    end
    object AProDiario: TAction
      Tag = 14402
      Category = 'Produccion Avanzada'
      Caption = 'Mostrar &Marcajes'
      Hint = 'Grid con los marcajes filtrados entre fechas, secciones.'
      ImageIndex = 21
      OnExecute = AProDiarioExecute
    end
    object AProOrden: TAction
      Tag = 14403
      Category = 'Produccion Avanzada'
      Caption = '&Ordenes Producci'#243'n'
      Hint = 'Mantenimiento de las ordenes de producci'#243'n.Ordenes de Producci'#243'n'
      ImageIndex = 116
      OnExecute = AProOrdenExecute
    end
    object AProGestionOrd: TAction
      Tag = 14404
      Category = 'Produccion Avanzada'
      Caption = 'Lanzar/Cerrar Ordenes Masiva'
      Hint = 'Ver estado, lanzar/cerrar las ordenes de producci'#243'n.'
      ImageIndex = 68
      OnExecute = AProGestionOrdExecute
    end
    object AProMarcajesMaq: TAction
      Tag = 14405
      Category = 'Produccion Avanzada'
      Caption = 'M&arcajes M'#225'quinas'
      Hint = 'Mantenimiento marcajes de las m'#225'quina por el ID de la tarea.'
      ImageIndex = 92
      OnExecute = AProMarcajesMaqExecute
    end
    object AProMarcajesTe: TAction
      Tag = 14406
      Category = 'Produccion Avanzada'
      Caption = 'Marcajes Trabajo &Externo'
      Hint = 'Mantenimiento marcajes de los trabajos externos.'
      ImageIndex = 21
      OnExecute = AProMarcajesTeExecute
    end
    object AProMarcajesVa: TAction
      Tag = 14407
      Category = 'Produccion Avanzada'
      Caption = 'Imputar Tareas &Varias'
      Hint = 
        'Mantenimiento de los marcajes varios a las tareas de las ordenes' +
        ' de producci'#243'n.'
      ImageIndex = 92
      OnExecute = AProMarcajesVaExecute
    end
    object AProGenerarOrd: TAction
      Tag = 14408
      Category = 'Produccion Avanzada'
      Caption = 'Generar Ordenes &Pedidos'
      Hint = 
        'Generar las Ordenes de producci'#243'n de los pedidos de los clientes' +
        '.'
      ImageIndex = 92
      OnExecute = AProGenerarOrdExecute
    end
    object AProRecursosEmp: TAction
      Tag = 14409
      Category = 'Produccion Avanzada'
      Caption = '&Recursos Producci'#243'n'
      Hint = 'Mantenimiento de los recursos de producci'#243'n.'
      ImageIndex = 21
      OnExecute = AProRecursosEmpExecute
    end
    object AOpeCategoria: TAction
      Tag = 14200
      Category = 'Operarios'
      Caption = '&Categorias Empleados'
      Hint = 'Mantenimiento categorias empleados, operarios.'
      ImageIndex = 81
      OnExecute = AOpeCategoriaExecute
    end
    object AOpeCTrabajo: TAction
      Tag = 14201
      Category = 'Operarios'
      Caption = '&Centros Trabajo'
      Hint = 'Mantenimiento de los centros de trabajo de los empleados.'
      ImageIndex = 17
      OnExecute = AOpeCTrabajoExecute
    end
    object AOpeDepartamento: TAction
      Tag = 14202
      Category = 'Operarios'
      Caption = '&Departamentos'
      Hint = 'Mantenimiento de los departamentos que pertenecen los empleados.'
      ImageIndex = 21
      OnExecute = AOpeDepartamentoExecute
    end
    object AOpeSecciones: TAction
      Tag = 14203
      Category = 'Operarios'
      Caption = '&Secciones'
      Hint = 'Mantenimiento secciones de trabajo.'
      ImageIndex = 21
      OnExecute = AOpeSeccionesExecute
    end
    object AOpeTContrato: TAction
      Tag = 14204
      Category = 'Operarios'
      Caption = '&Tipos Contrato'
      Hint = 'Mantenimiento Tipos de Contrato'
      ImageIndex = 30
      OnExecute = AOpeTContratoExecute
    end
    object AOpeEmpleados: TAction
      Tag = 14205
      Category = 'Operarios'
      Caption = '&Empleados'
      Hint = 'Mantenimiento de empleados, operarios, mec'#225'nicos.'
      ImageIndex = 135
      OnExecute = AOpeEmpleadosExecute
    end
    object ANomina: TAction
      Tag = 14211
      Category = 'Operarios'
      Caption = '&Importaci'#243'n N'#243'mina'
      Hint = 'Mantenimiento e importaci'#243'n de las n'#243'minas de los empleados.'
      ImageIndex = 135
      OnExecute = ANominaExecute
    end
    object AProMaquinas: TAction
      Tag = 14410
      Category = 'Produccion Avanzada'
      Caption = 'M'#225'quinas'
      Hint = 'Mantenimiento de las m'#225'quinas para producci'#243'n.'
      ImageIndex = 17
      OnExecute = AProMaquinasExecute
    end
    object AOpeImputaciones: TAction
      Tag = 14206
      Category = 'Operarios'
      Caption = '&Imputaciones Costes Empleados'
      Hint = 'Mantenimiento imputaciones empleados.'
      ImageIndex = 42
      OnExecute = AOpeImputacionesExecute
    end
    object AOpeTImputacion: TAction
      Tag = 14207
      Category = 'Operarios'
      Caption = 'Tipos Imputaci'#243'n'
      Hint = 
        'Mantenimiento de los tipos imputacion para los costes de emplead' +
        'os.'
      ImageIndex = 43
      OnExecute = AOpeTImputacionExecute
    end
    object AOpeCalendario: TAction
      Tag = 14208
      Category = 'Operarios'
      Caption = '&Calendario Empresa'
      Hint = 'Mantenimiento de Calendario de la Empresa'
      ImageIndex = 9
      OnExecute = AOpeCalendarioExecute
    end
    object AOpeCalendarioEmp: TAction
      Tag = 14209
      Category = 'Operarios'
      Caption = 'Calendario &Empleado'
      Hint = 'Mantenimiento de Calendario de Empleado'
      ImageIndex = 9
      OnExecute = AOpeCalendarioEmpExecute
    end
    object ACalendarioZona: TAction
      Tag = 14212
      Category = 'Operarios'
      Caption = 'Calendario &Zona'
      Hint = 'Mantenimiento de Calendario por Zona.'
      ImageIndex = 9
      OnExecute = ACalendarioZonaExecute
    end
    object AProLstOrden: TAction
      Tag = 14411
      Category = 'Produccion Avanzada'
      Caption = 'Listar Orden Producci'#243'n'
      Hint = 'Listado de luna ordenes de producci'#243'n.'
      ImageIndex = 14
      OnExecute = AProLstOrdenExecute
    end
    object AProLstEscandallo: TAction
      Tag = 14412
      Category = 'Produccion Avanzada'
      Caption = 'Listar Escandallo'
      Hint = 'Listado de los datos de un escandallo.'
      ImageIndex = 14
      OnExecute = AProLstEscandalloExecute
    end
    object AProMatInc: TAction
      Tag = 14413
      Category = 'Produccion Avanzada'
      Caption = 'Incidencias Materiales'
      Hint = 
        'Mantenimiento de las ncid'#233'ncias de material en una orden de prod' +
        'ucci'#243'n.'
      ImageIndex = 6
      OnExecute = AProMatIncExecute
    end
    object AProTMaquina: TAction
      Tag = 14414
      Category = 'Produccion Avanzada'
      Caption = '&Tipo M'#225'quina'
      Hint = 'Mantenimiento de los tipos de maquinas.'
      ImageIndex = 56
      OnExecute = AProTMaquinaExecute
    end
    object AProRecMarcajes: TAction
      Tag = 14415
      Category = 'Produccion Avanzada'
      Caption = '&Recoger Marcajes Reloj'
      Hint = 'Proceso de recogida de marcajes ficheros externos.'
      ImageIndex = 50
      OnExecute = AProRecMarcajesExecute
    end
    object AProFases: TAction
      Tag = 14416
      Category = 'Produccion Avanzada'
      Caption = '&Fases Producci'#243'n'
      Hint = 'Mantenimiento de de las fases en escandallos y producci'#243'n.'
      ImageIndex = 21
      OnExecute = AProFasesExecute
    end
    object AProTareas: TAction
      Tag = 14417
      Category = 'Produccion Avanzada'
      Caption = '&Tareas Producci'#243'n'
      Hint = 
        'Mantenimiento de las tareas en los escandallos y las ordenes de ' +
        'producci'#243'n.'
      ImageIndex = 21
      OnExecute = AProTareasExecute
    end
    object AProRecursos: TAction
      Tag = 14418
      Category = 'Produccion Avanzada'
      Caption = '&Recursos Producci'#243'n'
      Hint = 'Mantenimiento de recuros en escandallos y ordenes de producci'#243'n.'
      ImageIndex = 40
      OnExecute = AProRecursosExecute
    end
    object AProLstMarcajes: TAction
      Tag = 14419
      Category = 'Produccion Avanzada'
      Caption = 'Listar &Marcajes'
      Hint = 'Listado de los marcajes de producci'#243'n.'
      ImageIndex = 14
      OnExecute = AProLstMarcajesExecute
    end
    object AProConfigMarcajes: TAction
      Tag = 14420
      Category = 'Produccion Avanzada'
      Caption = 'Configurar Recogida Marcajes'
      Hint = 'Configuraci'#243'n de recogida de marcajes.'
      ImageIndex = 92
      OnExecute = AProConfigMarcajesExecute
    end
    object AOpeHorario: TAction
      Tag = 14210
      Category = 'Operarios'
      Caption = '&Horarios'
      Hint = 'Mantenimiento de Horarios.'
      ImageIndex = 105
      OnExecute = AOpeHorarioExecute
    end
    object AProLstMontaje: TAction
      Tag = 14421
      Category = 'Produccion Avanzada'
      Caption = 'Listar Hoja Montaje'
      Hint = 'Listado de de la hoja de montaje de la orden de producci'#243'n.'
      ImageIndex = 14
      OnExecute = AProLstMontajeExecute
    end
    object AProLstNecesidades: TAction
      Tag = 14222
      Category = 'Produccion Avanzada'
      Caption = 'Listar Necesidades'
      Hint = 'Listado de las necesidades una orden de producci'#243'n.'
      ImageIndex = 14
      OnExecute = AProLstNecesidadesExecute
    end
    object AProUtillajes: TAction
      Tag = 14423
      Category = 'Produccion Avanzada'
      Caption = '&Utillajes'
      Hint = 
        'Mantenimiento de los utillajes que se asocian a las tareas en la' +
        's ordenes de producci'#243'n.'
      ImageIndex = 2
      OnExecute = AProUtillajesExecute
    end
    object AProLstHojaTrabajo: TAction
      Tag = 14424
      Category = 'Produccion Avanzada'
      Caption = 'Listar Hoja Trabajo'
      Hint = 'Listado de las hojas de trabajo entre pedidos de clientes.'
      ImageIndex = 14
      OnExecute = AProLstHojaTrabajoExecute
    end
    object AProRelacionUds: TAction
      Tag = 14425
      Category = 'Produccion Avanzada'
      Caption = '&Relaci'#243'n Unidades'
      Hint = 
        'Relaci'#243'n entre las unidades de stock y los consumos en las orden' +
        'es de producci'#243'n.'
      ImageIndex = 3
      OnExecute = AProRelacionUdsExecute
    end
    object AProOfertasE: TAction
      Tag = 14426
      Category = 'Produccion Avanzada'
      Caption = 'Escandallo &Ofertas'
      Hint = 
        'Mantenimiento de los escandallos tipo oferta. Ofertas Escandallo' +
        's'
      ImageIndex = 72
      OnExecute = AProOfertasEExecute
    end
    object AProLstofertasE: TAction
      Tag = 14427
      Category = 'Produccion Avanzada'
      Caption = 'Listar &Escandallo Oferta'
      Hint = 'Listado de los escandallos tipo oferta.'
      ImageIndex = 14
      OnExecute = AProLstofertasEExecute
    end
    object AProMarcajesOpeEsp: TAction
      Tag = 14428
      Category = 'Produccion Avanzada'
      Caption = 'Marcaje Operario &Especial'
      Hint = 'Marcajes operario con creaci'#243'n de las tareas.'
      ImageIndex = 15
      OnExecute = AProMarcajesOpeEspExecute
    end
    object AProMarcajesMaqEsp: TAction
      Tag = 14429
      Category = 'Produccion Avanzada'
      Caption = 'Marcaje &M'#225'quina Especial'
      Hint = 'Marcajes de las m'#225'quinas creando tareas.'
      ImageIndex = 92
      OnExecute = AProMarcajesMaqEspExecute
    end
    object AProPlanificar: TAction
      Tag = 14800
      Category = 'Produccion Plan'
      Caption = '&Planificar'
      Hint = 'Creaci'#243'n de la planificaci'#243'n.'
      ImageIndex = 137
      OnExecute = AProPlanificarExecute
    end
    object AProDeslanza: TAction
      Tag = 14801
      Category = 'Produccion Plan'
      Caption = '&Deslanzar'
      Hint = 'Deslanzar'
      ImageIndex = 51
      OnExecute = AProDeslanzaExecute
    end
    object AProCabPlanificacion: TAction
      Tag = 14802
      Category = 'Produccion Plan'
      Caption = 'Planificaciones'
      Hint = 'Mantenimiento tipos de planificaciones.'
      ImageIndex = 137
      OnExecute = AProCabPlanificacionExecute
    end
    object AProTipTareasMan: TAction
      Tag = 14803
      Category = 'Produccion Plan'
      Caption = 'Tipos &Tareas Manuales'
      Hint = 'Tipos de tareas manuales.'
      ImageIndex = 115
      OnExecute = AProTipTareasManExecute
    end
    object AProEquivalArt: TAction
      Tag = 14430
      Category = 'Produccion Avanzada'
      Caption = '&Equivalencia Art'#237'culos'
      Hint = 'Componentes, art'#237'culos equivalentes para los escandallos.'
      ImageIndex = 109
      OnExecute = AProEquivalArtExecute
    end
    object APauta_TipoControl: TAction
      Tag = 14700
      Category = 'Produccion Pauta'
      Caption = 'Tipo &Control'
      Hint = 
        'Mantenimiento de los tipos de control o pauta en escandallos pro' +
        'ducci'#243'n.'
      ImageIndex = 56
      OnExecute = APauta_TipoControlExecute
    end
    object APauta: TAction
      Tag = 14701
      Category = 'Produccion Pauta'
      Caption = '&Pauta Escandallos'
      Hint = 
        'Pauta y comportamientos para fabricar piezas relacionada con los' +
        ' escandallos.'
      ImageIndex = 32
      OnExecute = APautaExecute
    end
    object AObrObras: TAction
      Tag = 14100
      Category = 'Obras'
      Caption = 'Mantenimiento &Obras'
      Hint = 'Mantenimiento de obras.'
      ImageIndex = 17
      OnExecute = AObrObrasExecute
    end
    object AObrPartidas: TAction
      Tag = 14101
      Category = 'Obras'
      Caption = '&Partidas'
      Hint = 'Mantenimiento de partidas.'
      ImageIndex = 56
      OnExecute = AObrPartidasExecute
    end
    object AObrPartidasPlantilla: TAction
      Tag = 14102
      Category = 'Obras'
      Caption = 'Plantillas &Partidas'
      Hint = 'Plantillas de partidas.'
      ImageIndex = 32
      OnExecute = AObrPartidasPlantillaExecute
    end
    object AProDiagramaGantt: TAction
      Tag = 14805
      Category = 'Produccion Plan'
      Caption = 'Diagrama &Gantt'
      Hint = 'Ver diagrama de gantt.'
      ImageIndex = 16
      OnExecute = AProDiagramaGanttExecute
    end
    object AProTipoMarcajes: TAction
      Tag = 14431
      Category = 'Produccion Avanzada'
      Caption = 'Tipo Marcajes'
      Hint = 'Mantenimiento de los tipo de marcajes.'
      ImageIndex = 105
      OnExecute = AProTipoMarcajesExecute
    end
    object AProMarcajesBD: TAction
      Tag = 14432
      Category = 'Produccion Avanzada'
      Caption = 'Marcajes &Directos BD'
      Hint = 
        'Ver, corregir los marcajes directos efectuados por porcesos exte' +
        'rnos a la base de datos.'
      ImageIndex = 50
      OnExecute = AProMarcajesBDExecute
    end
    object AProDesTipoPieza: TAction
      Tag = 14500
      Category = 'Produccion Despiece'
      Caption = '&Tipos Pieza'
      Hint = 'Mantenimiento los tipos de pieza.'
      ImageIndex = 119
      OnExecute = AProDesTipoPiezaExecute
    end
    object AProDesTipoMat: TAction
      Tag = 14501
      Category = 'Produccion Despiece'
      Caption = 'Tipos &Material'
      Hint = 'Mantenimiento de tipos material.'
      ImageIndex = 56
      OnExecute = AProDesTipoMatExecute
    end
    object AProDesDespiece: TAction
      Tag = 14502
      Category = 'Produccion Despiece'
      Caption = '&Despiece Producci'#243'n'
      Hint = 'Mantenimiento despiece de producci'#243'n.'
      ImageIndex = 10
      OnExecute = AProDesDespieceExecute
    end
    object ARecalcular: TAction
      Tag = 14433
      Category = 'Produccion Avanzada'
      Caption = 'Rec'#225'lcular Reservas'
      Hint = 'Recacular las unidades reservadas de un art'#237'culo.'
      ImageIndex = 11
      OnExecute = ARecalcularExecute
    end
    object ADocumentos: TAction
      Tag = 14434
      Category = 'Produccion Avanzada'
      Caption = 'Documentos &Adjuntos'
      Hint = 'Documentos adjuntos'
      ImageIndex = 59
      OnExecute = ADocumentosExecute
    end
    object AProLstMatEsc: TAction
      Tag = 14435
      Category = 'Produccion Avanzada'
      Caption = 'Listar &Materiales Escandallo'
      Hint = 'Listado de los escandallos en la que interviene un material.'
      ImageIndex = 14
      OnExecute = AProLstMatEscExecute
    end
    object ALstNecEsc: TAction
      Tag = 14436
      Category = 'Produccion Avanzada'
      Caption = 'Listar Necesidades Escandallo'
      Hint = 
        'Listado de ls necesidades de materia prima (componentes) de un e' +
        'scandallo.'
      ImageIndex = 14
      OnExecute = ALstNecEscExecute
    end
    object AImagenesArticulos: TAction
      Tag = 14437
      Category = 'Produccion Avanzada'
      Caption = '&Im'#225'genes Art'#237'culos'
      Hint = 'Ver grid con las imagenes de todos los art'#237'culos.'
      ImageIndex = 28
      OnExecute = AImagenesArticulosExecute
    end
    object AArticulosAlmacenes: TAction
      Tag = 14438
      Category = 'Produccion Avanzada'
      Caption = '&Art'#237'culos Stocks Im'#225'gen'
      Hint = 'Almacenes Articulos'
      ImageIndex = 40
      OnExecute = AArticulosAlmacenesExecute
    end
    object AProPantMarcajes: TAction
      Tag = 14439
      Category = 'Produccion Avanzada'
      Caption = 'Ver Marcajes'
      Hint = 'Ver Marcajes'
      ImageIndex = 125
      OnExecute = AProPantMarcajesExecute
    end
    object AAgrupaRecEsc: TAction
      Tag = 14440
      Category = 'Produccion Avanzada'
      Caption = 'Agrupaci'#243'n de Recurso por Escandallo'
      Hint = 'Agrupaci'#243'n de Recurso por Escandallo'
      ImageIndex = 4
      OnExecute = AAgrupaRecEscExecute
    end
    object AProUtiles: TAction
      Tag = 14441
      Category = 'Produccion Avanzada'
      Caption = '&Configuraci'#243'n'
      Hint = #218'tiles'
      ImageIndex = 119
      OnExecute = AProUtilesExecute
    end
    object AProFormulas: TAction
      Tag = 14442
      Category = 'Produccion Avanzada'
      Caption = 'F'#243'rmulas'
      Hint = 'F'#243'rmulas'
      ImageIndex = 3
      OnExecute = AProFormulasExecute
    end
    object APresencia: TLFCategoryAction
      Tag = 14300
      Category = 'Control Presencia'
      Caption = '&Fichajes Empleados'
      Hint = 'Mantenimiento de los fichajes empleados.'
      ImageIndex = 39
      OnExecute = APresenciaExecute
    end
    object APresenciaIncidencia: TAction
      Tag = 14301
      Category = 'Control Presencia'
      Caption = '&Tipos Incidencias'
      Hint = 'Mantenimiento de los tipos de incidencias.'
      ImageIndex = 6
      OnExecute = APresenciaIncidenciaExecute
    end
    object APresenciaDispositivo: TAction
      Tag = 14306
      Category = 'Control Presencia'
      Caption = 'Dispositivos'
      Hint = 'Mantenimiento de los dispositivos de control de presencia'
      ImageIndex = 3
      OnExecute = APresenciaDispositivoExecute
    end
    object APresenciaTipoMarcaje: TAction
      Tag = 14307
      Category = 'Control Presencia'
      Caption = 'Tipo Marcaje'
      Hint = 'Mantenimiento de tipo de marcajes de presencia'
      ImageIndex = 106
      OnExecute = APresenciaTipoMarcajeExecute
    end
    object APresenciaDiario: TAction
      Tag = 14302
      Category = 'Control Presencia'
      Caption = '&Diario Presencia'
      Hint = 'Ver marcajes empleados entre fechas.'
      ImageIndex = 21
      OnExecute = APresenciaDiarioExecute
    end
    object AImportacionFichajesDePresencia: TAction
      Tag = 14304
      Category = 'Control Presencia'
      Caption = '&Importar Fichajes de Presencia'
      Hint = 'Importacion de fichajes de presencia'
      ImageIndex = 11
      OnExecute = AImportacionFichajesDePresenciaExecute
    end
    object ALstPresencia: TAction
      Tag = 14303
      Category = 'Control Presencia'
      Caption = 'Listar &Presencia'
      Hint = 'Listado de marcajes empleados entre fechas.'
      ImageIndex = 14
      OnExecute = ALstPresenciaExecute
    end
    object AProTMaquinaRevision: TAction
      Tag = 14443
      Category = 'Produccion Avanzada'
      Caption = 'Maquinas Revisi'#243'n'
      Hint = 'Maquinas Revisi'#243'n'
      ImageIndex = 118
      OnExecute = AProTMaquinaRevisionExecute
    end
    object AProTipoRevMaq: TAction
      Tag = 14444
      Category = 'Produccion Avanzada'
      Caption = 'Tipo Revisiones &M'#225'quina'
      Hint = 'Tipo Revisiones M'#225'quina'
      ImageIndex = 39
      OnExecute = AProTipoRevMaqExecute
    end
    object ACambioIdioma: TAction
      Tag = 1057
      Category = 'Auxiliares'
      Caption = 'Cambiar Idioma'
      Hint = 'Cambio de idioma de la aplicacion.'
      ImageIndex = 91
      OnExecute = ACambioIdiomaExecute
    end
    object ATipoUnidadLogistica: TAction
      Tag = 1058
      Category = 'Auxiliares'
      Caption = 'Tipo &Unidad Logistica'
      Hint = 'Configura los tipos de unidad logisticas de la empresa.'
      ImageIndex = 21
      OnExecute = ATipoUnidadLogisticaExecute
    end
    object AHojaDePreparacion: TAction
      Tag = 360
      Category = 'Ventas'
      Caption = '&Hojas Preparaci'#243'n Pedidos'
      Hint = 'Crear las hoja de preparacion de pedidos para servir.'
      ImageIndex = 57
      OnExecute = AHojaDePreparacionExecute
    end
    object AAltaHojaDePreparacion: TAction
      Tag = 361
      Category = 'Ventas'
      Caption = 'Alta Hoja Preparaci'#243'n'
      Hint = 'Alta de hoja de preparaci'#243'n.'
      ImageIndex = 30
      OnExecute = AAltaHojaDePreparacionExecute
    end
    object ACierreParcialOrden: TAction
      Tag = 1252
      Category = 'Produccion Avanzada'
      Caption = 'Cierre Parcial'
      Hint = 'Cierre parcial de orden de producci'#243'n'
      ImageIndex = 67
      OnExecute = ACierreParcialOrdenExecute
    end
    object AProtocolosDeVenta: TAction
      Tag = 1059
      Category = 'Auxiliares'
      Caption = 'P&rotocolos Venta'
      Hint = 'Mantenimiento de protocolos de venta.'
      ImageIndex = 21
      OnExecute = AProtocolosDeVentaExecute
    end
    object AProtocoloDeVentas: TAction
      Tag = 562
      Category = 'Almacenes'
      Caption = '&Protocolo Ventas'
      Hint = 'Mantenimiento de Protocolos de Venta'
      ImageIndex = 32
      OnExecute = AProtocoloDeVentasExecute
    end
    object ADepartamento: TAction
      Tag = 1060
      Category = 'Auxiliares'
      Caption = '&Departamentos'
      Hint = 'Mantinimiento de departamentos de la empresa.'
      ImageIndex = 17
      OnExecute = ADepartamentoExecute
    end
    object ACrmTipoSeguimiento: TAction
      Tag = 15008
      Category = 'CRM'
      Caption = 'Tipo Seguimiento'
      Hint = 'Mantenimiento de tipos de seguimientos comerciales.'
      ImageIndex = 21
      OnExecute = ACrmTipoSeguimientoExecute
    end
    object ATipoUbicacion: TAction
      Tag = 563
      Category = 'Ubicacion'
      Caption = '&Tipo Ubicacion'
      Hint = 'Mantenimiento de los tipos de ubicaci'#243'n.'
      ImageIndex = 81
      OnExecute = ATipoUbicacionExecute
    end
    object ASectorAlmacen: TAction
      Tag = 564
      Category = 'Almacenes'
      Caption = '&Sectores Almac'#233'n'
      Hint = 'Mantenimiento de Sectores de Almac'#233'n'
      ImageIndex = 40
      OnExecute = ASectorAlmacenExecute
    end
    object ALstUbicaciones: TAction
      Tag = 565
      Category = 'Ubicacion'
      Caption = 'Listar Ubicaciones'
      Hint = 'Listado de Ubicaciones'
      ImageIndex = 14
      OnExecute = ALstUbicacionesExecute
    end
    object AAlbaranesVentaPendientes: TAction
      Tag = 362
      Category = 'Ventas'
      Caption = 'Listar &Albaranes Venta Pendientes'
      Hint = 'Listado de albaranes de clientes pendientes. (Ventas).'
      ImageIndex = 14
      OnExecute = AAlbaranesVentaPendientesExecute
    end
    object ZASysNCF: TAction
      Tag = 9001
      Category = 'Latino'
      Caption = 'Contadores NCF'
      Hint = 'Mantenimientos de contadores NCF.'
      ImageIndex = 44
      OnExecute = ZASysNCFExecute
    end
    object ZATalones: TAction
      Tag = 9002
      Category = 'Latino'
      Caption = '&Talones'
      Hint = 'Talones'
      ImageIndex = 21
      OnExecute = ZATalonesExecute
    end
    object ZADiarioVentas: TAction
      Tag = 9003
      Category = 'Latino'
      Caption = 'Listar Diario Ventas'
      Hint = 'Listado de diario de ventas.'
      ImageIndex = 14
      OnExecute = ZADiarioVentasExecute
    end
    object ZAVentasFamilia: TAction
      Tag = 9004
      Category = 'Latino'
      Caption = '&Ventas Familia'
      Hint = 'Ventas por familia.'
      ImageIndex = 21
      OnExecute = ZAVentasFamiliaExecute
    end
    object ZAIntereses: TAction
      Tag = 9005
      Category = 'Latino'
      Caption = 'Intereses &Anticipos'
      Hint = 'Intereses en llos anticipos.'
      ImageIndex = 21
      OnExecute = ZAInteresesExecute
    end
    object AListadoITBIS: TAction
      Tag = 9006
      Category = 'Latino'
      Caption = 'Listar &ITBIS'
      Hint = 'Listado ITBIS (606-607).'
      ImageIndex = 14
      OnExecute = AListadoITBISExecute
    end
    object ALSTTalones: TAction
      Tag = 9007
      Category = 'Latino'
      Caption = 'Listar &Talones'
      Hint = 'Listado de Talones'
      ImageIndex = 14
      OnExecute = ALSTTalonesExecute
    end
    object ZARecibos: TAction
      Tag = 9008
      Category = 'Latino'
      Caption = 'Recibos &Ingresos'
      Hint = 'Recibos para los ingresos.'
      ImageIndex = 75
      OnExecute = ZArecibosExecuteExecute
    end
    object AResponsableHojaDePreparacion: TAction
      Tag = 363
      Category = 'Ventas'
      Caption = 'Validaci'#243'n Hojas Preparaci'#243'n'
      Hint = 'Responsable hoja de preparacion.'
      ImageIndex = 135
      OnExecute = AResponsableHojaDePreparacionExecute
    end
    object AGruposIncoterm: TAction
      Tag = 1061
      Category = 'Auxiliares'
      Caption = '&Grupos Incoterm'
      Hint = 'Mantenimiento de (Grupos Incoterm)'
      ImageIndex = 4
      OnExecute = AGruposIncotermExecute
    end
    object ACodigosIncoterm: TAction
      Tag = 1062
      Category = 'Auxiliares'
      Caption = 'C&odigos Incoterm'
      Hint = 'Mantenimiento de (Codigos Incoterm).'
      ImageIndex = 13
      OnExecute = ACodigosIncotermExecute
    end
    object AAsistenteImpIdiomaArticulos: TAction
      Tag = 254
      Category = 'Empresas'
      Caption = 'Asistente Importaci'#243'n Idiomas Articulos'
      Hint = 'Asistente de importaci'#243'n de idiomas de los articulos.'
      ImageIndex = 91
      OnExecute = AAsistenteImpIdiomaArticulosExecute
    end
    object AProMarcajesMaqEspTurno: TAction
      Tag = 14445
      Category = 'Produccion Avanzada'
      Caption = 'M'#225'quina Especial Turno'
      Hint = 'Marcajes de M'#225'quina Especial Turno'
      ImageIndex = 92
      OnExecute = AProMarcajesMaqEspTurnoExecute
    end
    object AProTurnos: TAction
      Tag = 14446
      Category = 'Produccion Avanzada'
      Caption = 'Turnos'
      Hint = 'Turnos'
      ImageIndex = 134
      OnExecute = AProTurnosExecute
    end
    object AProCausas: TAction
      Tag = 14447
      Category = 'Produccion Avanzada'
      Caption = 'Causas'
      Hint = 'Causas'
      ImageIndex = 137
      OnExecute = AProCausasExecute
    end
    object AProDefecto: TAction
      Tag = 14448
      Category = 'Produccion Avanzada'
      Caption = 'Defecto Material'
      Hint = 'Defecto Material'
      ImageIndex = 39
      OnExecute = AProDefectoExecute
    end
    object AProTiposDefecto: TAction
      Tag = 14449
      Category = 'Produccion Avanzada'
      Caption = 'Tipos Defecto'
      Hint = 'Tipos Defecto'
      ImageIndex = 118
      OnExecute = AProTiposDefectoExecute
    end
    object AIsoFichaTecnica: TAction
      Tag = 14611
      Category = 'Produccion ISO'
      Caption = '&Ficha T'#233'cnica ISO'
      Hint = 'Mantenimiento de fichas t'#233'cnicas de los art'#237'culos.'
      ImageIndex = 18
      OnExecute = AIsoFichaTecnicaExecute
    end
    object AIsoNormativas: TAction
      Tag = 14612
      Category = 'Produccion ISO'
      Caption = '&Normativas ISO'
      Hint = 'Mantenimientos de normativas ISO.'
      ImageIndex = 125
      OnExecute = AIsoNormativasExecute
    end
    object AIsoTipoEnsayo: TAction
      Tag = 14613
      Category = 'Produccion ISO'
      Caption = '&Tipos Ensayo ISO'
      Hint = 'Mantenimiento de tipos de ensayos.'
      ImageIndex = 87
      OnExecute = AIsoTipoEnsayoExecute
    end
    object AIsoEnsayos: TAction
      Tag = 14614
      Category = 'Produccion ISO'
      Caption = '&Ensayos ISO'
      Hint = 'Mantenimientos de ensayos ISO.'
      ImageIndex = 133
      OnExecute = AIsoEnsayosExecute
    end
    object AImportarPedidos: TAction
      Tag = 364
      Category = 'ECommerce'
      Caption = 'Importar Pedidos Excel'
      Hint = 'Importar pedidos clientes desde tablas excel. (Ventas).'
      ImageIndex = 49
      OnExecute = AImportarPedidosExecute
    end
    object ATipoRetencion: TAction
      Tag = 9009
      Category = 'Latino'
      Caption = 'Tipos &Retenci'#243'n'
      Hint = 'Tipos Retenci'#243'n'
      ImageIndex = 21
      OnExecute = ATipoRetencionExecute
    end
    object APlanMaestroProduccion: TAction
      Tag = 14450
      Category = 'Produccion Avanzada'
      Caption = 'Plan Maestro Produccion'
      Hint = 'Plan maestro de produccion'
      ImageIndex = 11
      OnExecute = APlanMaestroProduccionExecute
    end
    object ADiarioCostes: TAction
      Tag = 625
      Category = 'Contabilidad'
      Caption = '&Diario Costes'
      Hint = 'Ver el diarios de costes.'
      ImageIndex = 30
      OnExecute = ADiarioCostesExecute
    end
    object AGestionDeCobros: TAction
      Tag = 853
      Category = 'Tesoreria'
      Caption = 'Gestion de cobros/pagos'
      Hint = 'Gestion de cobros/pagos'
      ImageIndex = 29
      OnExecute = AGestionDeCobrosExecute
    end
    object AMaestros: TAction
      Tag = 16000
      Category = 'Etiquetas'
      Caption = 'Datos Maestros'
      Hint = 'Datos Maestros'
      ImageIndex = 21
      OnExecute = AMaestrosExecute
    end
    object AOrdenes: TAction
      Tag = 16001
      Category = 'Etiquetas'
      Caption = 'Ordenes'
      Hint = 'Ordenes'
      ImageIndex = 21
      OnExecute = AOrdenesExecute
    end
    object AEtiquetas: TAction
      Tag = 16002
      Category = 'Etiquetas'
      Caption = 'Etiquetas'
      Hint = 'Etiquetas'
      ImageIndex = 95
      OnExecute = AEtiquetasExecute
    end
    object APresupuestos: TAction
      Tag = 16003
      Category = 'Etiquetas'
      Caption = 'Presupuestos'
      Hint = 'Presupuestos'
      ImageIndex = 73
      OnExecute = APresupuestosExecute
    end
    object ALstPresupuestos: TAction
      Tag = 16004
      Category = 'Etiquetas'
      Caption = 'Listado Presupuestos'
      Hint = 'Listado Presupuestos'
      ImageIndex = 14
      OnExecute = ALstPresupuestosExecute
    end
    object AMaquinas: TAction
      Tag = 16005
      Category = 'Etiquetas'
      Caption = 'M'#225'quinas'
      Hint = 'M'#225'quinas'
      ImageIndex = 21
      OnExecute = AMaquinasExecute
    end
    object ADetalleMaq: TAction
      Tag = 16006
      Category = 'Etiquetas'
      Caption = 'Detalle M'#225'quinas'
      Hint = 'Detalle de M'#225'quina'
      ImageIndex = 21
      OnExecute = ADetalleMaqExecute
    end
    object ATroqueles: TAction
      Tag = 16007
      Category = 'Etiquetas'
      Caption = 'Troqueles'
      Hint = 'Troqueles'
      ImageIndex = 21
      OnExecute = ATroquelesExecute
    end
    object AEtiConstantes: TAction
      Tag = 16008
      Category = 'Etiquetas'
      Caption = 'Configuraci'#243'n'
      Hint = 'Configuraci'#243'n'
      ImageIndex = 2
      OnExecute = AEtiConstantesExecute
    end
    object ATiposArticulo: TAction
      Tag = 1064
      Category = 'Auxiliares'
      Caption = 'Tipos Art'#237'culo'
      Hint = 'Mantenimiento de tipos de art'#237'culo.'
      ImageIndex = 109
      OnExecute = ATiposArticuloExecute
    end
    object AMateriales: TAction
      Tag = 1065
      Category = 'Auxiliares'
      Caption = '&Tipos Materiales'
      Hint = 'Mantenimiento de materiales de los art'#237'culos.'
      ImageIndex = 133
      OnExecute = AMaterialesExecute
    end
    object AColadas: TAction
      Tag = 1400
      Category = 'Coladas'
      Caption = '&Coladas'
      Hint = 'Mantenimiento de coladas en el m'#243'dulo fundiciones de metal.'
      ImageIndex = 23
      OnExecute = AColadasExecute
    end
    object AReparaciones: TAction
      Tag = 1500
      Category = 'Reparaciones'
      Caption = '&Reparaciones'
      Hint = 'Mantenimiento de reparaciones.'
      ImageIndex = 119
      OnExecute = AReparacionesExecute
    end
    object AMantConsumo: TAction
      Tag = 1501
      Category = 'Reparaciones'
      Caption = '&Consumo'
      Hint = 'Mantenimiento consumo.'
      ImageIndex = 119
      OnExecute = AMantConsumoExecute
    end
    object AZLstOfertas: TAction
      Tag = 365
      Category = 'Ventas'
      Caption = 'Listar &Ofertas'
      Hint = 'Listado de ofertas filtrado por estado y agrupacion'
      ImageIndex = 14
      OnExecute = AZLstOfertasExecute
    end
    object AGas: TAction
      Tag = 18001
      Category = 'Gas'
      Caption = 'Ventas &Gas'
      Hint = 'Mantenimiento de m'#243'dulo de gas.'
      ImageIndex = 23
      OnExecute = AGasExecute
    end
    object ATiposMoneda: TAction
      Tag = 1066
      Category = 'Auxiliares'
      Caption = 'Tipos &Moneda'
      Hint = 'Mantenimiento de los tipos monedas.'
      ImageIndex = 110
      OnExecute = ATiposMonedaExecute
    end
    object AGasTanque: TAction
      Tag = 18002
      Category = 'Gas'
      Caption = '&Tanque'
      Hint = 'Mantenimiento gas tanques.'
      ImageIndex = 23
      OnExecute = AGasTanqueExecute
    end
    object AGasDispensador: TAction
      Tag = 18003
      Category = 'Gas'
      Caption = '&Dispensadores'
      Hint = 'Mantenimiento dispensadores de gas.'
      ImageIndex = 23
      OnExecute = AGasDispensadorExecute
    end
    object AGasColaCamion: TAction
      Tag = 18004
      Category = 'Gas'
      Caption = 'Colas &Cami'#243'n'
      Hint = 'Mantenimiento colas de camiones de gas.'
      ImageIndex = 112
      OnExecute = AGasColaCamionExecute
    end
    object AProSubsComponentes: TAction
      Tag = 14451
      Category = 'Produccion Avanzada'
      Caption = 'Substituir Componentes'
      Hint = 'Substituci'#243'n de componetes de escandallo'
      ImageIndex = 26
      OnExecute = AProSubsComponentesExecute
    end
    object ASincronizaIncidencias: TAction
      Tag = 1063
      Category = 'ECommerce'
      Caption = 'Sincronizar Incidencias'
      Hint = 'Sincroniza las incidencias locales con las del servidor'
      ImageIndex = 98
      OnExecute = ASincronizaIncidenciasExecute
    end
    object ACompensacionRecibos: TAction
      Tag = 854
      Category = 'Tesoreria'
      Caption = 'Compe&nsar Recibos Terceros'
      Hint = 'Compensacion de recibos entre clientes proveedores. (Terceros).'
      ImageIndex = 35
      OnExecute = ACompensacionRecibosExecute
    end
    object AGasUtiles: TAction
      Tag = 18005
      Category = 'Gas'
      Caption = '&Configuraci'#243'n Gas'
      Hint = 'Configuraci'#243'n de M'#243'dulo de gas.'
      ImageIndex = 2
      OnExecute = AGasUtilesExecute
    end
    object ASerializacion: TAction
      Tag = 566
      Category = 'Almacenes'
      Caption = '&Serializaci'#243'n'
      Hint = 'mantenimiento de la serializacion de articulos'
      ImageIndex = 115
      OnExecute = ASerializacionExecute
    end
    object ADescargasGas: TAction
      Tag = 18006
      Category = 'Gas'
      Caption = '&Descargas Gas'
      Hint = 'Descargas de gas.'
      ImageIndex = 23
      OnExecute = ADescargasGasExecute
    end
    object ASincronizaTienda: TAction
      Tag = 1067
      Category = 'ECommerce'
      Caption = 'Sincronizar Tienda PrestaShop'
      Hint = 'Sincroniza las tiendas en PrestaShop'
      ImageIndex = 98
      OnExecute = ASincronizaTiendaExecute
    end
    object ASincronizaTiendaWoocommerce: TAction
      Tag = 1090
      Category = 'ECommerce'
      Caption = 'Sincronizar Tienda Woocommerce'
      Hint = 'Sincroniza las tiendas en Woocommerce'
      ImageIndex = 98
      OnExecute = ASincronizaTiendaWoocommerceExecute
    end
    object AVerificacionesImpuestos: TAction
      Tag = 752
      Category = 'Impuestos'
      Caption = '&Verificar Impuestos'
      Hint = 'Verificaciones impuestos.'
      ImageIndex = 118
      OnExecute = AVerificacionesImpuestosExecute
    end
    object ASeriesCliente: TAction
      Tag = 1502
      Category = 'Reparaciones'
      Caption = '&Nro. Series Maquinas Cliente'
      Hint = 
        'Mantenimiento de Nros. de Series de las m'#225'quinas vendidas a clie' +
        'nte.'
      ImageIndex = 119
      OnExecute = ASeriesClienteExecute
    end
    object ACrmArticulos: TAction
      Tag = 15009
      Category = 'CRM'
      Caption = 'Articulos CRM'
      Hint = 'Mantenimiento de los art'#237'culos del CRM.'
      ImageIndex = 109
      OnExecute = ACrmArticulosExecute
    end
    object ACrmMarcajes: TAction
      Tag = 15010
      Category = 'CRM'
      Caption = 'Marcajes CRM'
      Hint = 'Marcajes'
      ImageIndex = 21
      OnExecute = ACrmMarcajesExecute
    end
    object ACrmVentas: TAction
      Tag = 15011
      Category = 'CRM'
      Caption = 'Marcajes Ventas'
      Hint = 'Mantenimiento de Marcajes Ventas'
      ImageIndex = 21
      OnExecute = ACrmVentasExecute
    end
    object ACrmAcciones: TAction
      Tag = 15012
      Category = 'CRM'
      Caption = '&Acciones Comerciales'
      Hint = 'Mantenimiento de las acciones comerciales'
      ImageIndex = 94
      OnExecute = ACrmAccionesExecute
    end
    object AIsoCertificadoAnalisis: TAction
      Tag = 15022
      Category = 'Produccion ISO'
      Caption = '&Certificado An'#225'lisis ISO'
      Hint = 'mantenimientos de certificados de an'#225'lisis.'
      ImageIndex = 14
      OnExecute = AIsoCertificadoAnalisisExecute
    end
    object AImportarArticulosExcel: TAction
      Tag = 567
      Category = 'Almacenes'
      Caption = '&Importar Art'#237'culos Excel'
      Hint = 'Importar art'#237'culos desde tablas excel.'
      ImageIndex = 49
      OnExecute = AImportarArticulosExcelExecute
    end
    object APrevisionTesoreria: TAction
      Tag = 855
      Category = 'Tesoreria'
      Caption = 'P&revisi'#243'n Tesoreria'
      Hint = 'Ver y configurar previsi'#243'n tesoreria. (Cobros/Pagos)'
      ImageIndex = 11
      OnExecute = APrevisionTesoreriaExecute
    end
    object ACrmImportarLocalidades: TAction
      Tag = 15013
      Category = 'CRM'
      Caption = 'Importar Localidades'
      Hint = 'Asistente para importar localidades, poblaciones.'
      ImageIndex = 81
      OnExecute = ACrmImportarLocalidadesExecute
    end
    object ATipoColorTallas: TAction
      Tag = 1304
      Category = 'Tallas'
      Caption = '&Tipo Color'
      Hint = 'Mantenimiento de tipos de color.'
      ImageIndex = 109
      OnExecute = ATipoColorTallasExecute
    end
    object AParametrizacionTallas: TAction
      Tag = 1305
      Category = 'Tallas'
      Caption = '&Parametros C'#243'digos Modelos'
      Hint = 'Parametrizaci'#243'n de los c'#243'digos de los modelos.'
      ImageIndex = 118
      OnExecute = AParametrizacionTallasExecute
    end
    object AProOrdTareaMat: TAction
      Tag = 14452
      Category = 'Produccion Avanzada'
      Caption = 'Tareas Realizadas'
      Hint = 'Tareas Realizadas'
      ImageIndex = 115
      OnExecute = AProOrdTareaMatExecute
    end
    object AADRNaturalezaPeligro: TAction
      Tag = 14901
      Category = 'Auxiliares'
      Caption = 'N&aturalezas Peligro'
      Hint = 'Mantenimiento de la naturalezas del peligro.'
      ImageIndex = 21
      OnExecute = AADRNaturalezaPeligroExecute
    end
    object AADRMedidasProteccion: TAction
      Tag = 14902
      Category = 'Auxiliares'
      Caption = '&Medidas Protecci'#243'n'
      Hint = 'Mantenimiento de las medidas de protecci'#243'n.'
      ImageIndex = 21
      OnExecute = AADRMedidasProteccionExecute
    end
    object ALstMatPeligrosas: TAction
      Tag = 14903
      Category = 'Auxiliares'
      Caption = 'Listar &Materias Peligrosas'
      Hint = 'Listado de materias peligrosas.'
      ImageIndex = 14
      OnExecute = ALstMatPeligrosasExecute
    end
    object AListadoCuota: TAction
      Tag = 367
      Category = 'Ventas'
      Caption = 'Listar &Cuotas Clientes'
      Hint = 'Listado de cuotas de clientes. (Venbtas).'
      ImageIndex = 14
      OnExecute = AListadoCuotaExecute
    end
    object AControlPlazas: TAction
      Tag = 569
      Category = 'Almacenes'
      Caption = 'Control Pla&zas'
      Hint = 'Control de Plazas'
      ImageIndex = 21
      OnExecute = AControlPlazasExecute
    end
    object AConsultaITBIS: TAction
      Tag = 9011
      Category = 'Latino'
      Caption = 'Consulta  ITBIS'
      Hint = 'Consulta de ITBIS.'
      ImageIndex = 70
      OnExecute = AConsultaITBISExecute
    end
    object AConciliacionBancaria: TAction
      Tag = 9012
      Category = 'Tesoreria'
      Caption = '&Conciliacion Bancaria'
      Hint = 'Conciliacion y punteo cobros en banco.'
      ImageIndex = 98
      OnExecute = AConciliacionBancariaExecute
    end
    object AAbreINI: TAction
      Tag = 1116
      Category = 'Utilidades'
      Caption = 'Abrir INI'
      Hint = 'Abre y edita el fichero INI.'
      ImageIndex = 65
      OnExecute = AAbreINIExecute
    end
    object ATraspasoMulticanales: TAction
      Tag = 9013
      Category = 'Latino'
      Caption = 'Traspasar &Multicanales'
      Hint = 'Proceso traspaso multicanal.'
      ImageIndex = 70
      OnExecute = ATraspasoMulticanalesExecute
    end
    object ZAModelos: TAction
      Tag = 16100
      Category = 'T y C Auxiliares'
      Caption = '&Modelos TYC'
      Hint = 'Modelos'
      ImageIndex = 133
      OnExecute = ZAModelosExecute
    end
    object ZALonas: TAction
      Tag = 16101
      Category = 'T y C Auxiliares'
      Caption = 'Tipos Lona'
      Hint = 'Tipos de lona.'
      ImageIndex = 31
      OnExecute = ZALonasExecute
    end
    object ZALonasForma: TAction
      Tag = 16102
      Category = 'T y C Auxiliares'
      Caption = 'Formas &Lona'
      Hint = 'Formas de Lona'
      ImageIndex = 31
      OnExecute = ZALonasFormaExecute
    end
    object ZARibetes: TAction
      Tag = 16103
      Category = 'T y C Auxiliares'
      Caption = '&Ribetes'
      Hint = 'Ribetes'
      ImageIndex = 31
      OnExecute = ZARibetesExecute
    end
    object ZABambalinas: TAction
      Tag = 16104
      Category = 'T y C Auxiliares'
      Caption = '&Bambalinas'
      Hint = 'Bambalinas'
      ImageIndex = 31
      OnExecute = ZABambalinasExecute
    end
    object ZAModelosDet: TAction
      Tag = 16105
      Category = 'T y C'
      Caption = '&Desglose Modelos'
      Hint = 'Detalles o desglose de los modelos.'
      ImageIndex = 31
      OnExecute = ZAModelosDetExecute
    end
    object ZAColores: TAction
      Tag = 16106
      Category = 'T y C Auxiliares'
      Caption = '&Colores Perfiles'
      Hint = 'Colores de los perfiles.'
      ImageIndex = 109
      OnExecute = ZAColoresExecute
    end
    object ZAModelosFechas: TAction
      Tag = 16107
      Category = 'T y C'
      Caption = 'Fechas &Servir Modelos'
      Hint = 'Fechas a servir de modelos.'
      ImageIndex = 9
      OnExecute = ZAModelosFechasExecute
    end
    object ZATarifasModelos: TAction
      Tag = 16128
      Category = 'T y C'
      Caption = 'Tarifas &Modelos'
      Hint = 'Tarifas de precios para de modelos TyC.'
      ImageIndex = 56
      OnExecute = ZATarifasModelosExecute
    end
    object ZAPedidosEsp: TAction
      Tag = 16108
      Category = 'T y C'
      Caption = 'Pedidos &Especiales'
      Hint = 'Entrada de pedidos especiales.'
      ImageIndex = 62
      OnExecute = ZAPedidosEspExecute
    end
    object ZAPedidosEspTodos: TAction
      Tag = 16109
      Category = 'T y C'
      Caption = '&Ver Pedidos Especiales'
      Hint = 'Ver los pedidos especiales.'
      ImageIndex = 83
      OnExecute = ZAPedidosEspTodosExecute
    end
    object AEquivalenciaColores: TAction
      Tag = 16136
      Category = 'T y C Auxiliares'
      Caption = '&Equivalencia Colores Perfiles'
      Hint = 'Equivalencia colores perfiles.'
      ImageIndex = 140
      OnExecute = AEquivalenciaColoresExecute
    end
    object ZADatosAuxiliares: TAction
      Tag = 16110
      Category = 'T y C Auxiliares'
      Caption = 'Datos Auxiliares'
      Hint = 'Datos auxiliares.'
      ImageIndex = 119
      OnExecute = ZADatosAuxiliaresExecute
    end
    object ZATiposConfig: TAction
      Tag = 16111
      Category = 'T y C Auxiliares'
      Caption = 'Tipos Configuraci'#243'n'
      Hint = 'Tipos de configuraci'#243'n.'
      ImageIndex = 2
      OnExecute = ZATiposConfigExecute
    end
    object ZAVerEstadoPedCli: TAction
      Tag = 16112
      Category = 'T y C'
      Caption = '&Estado Pedidos Cliente'
      Hint = 'Ver estado de los pedidos por cliente.'
      ImageIndex = 140
      OnExecute = ZAVerEstadoPedCliExecute
    end
    object ZAVerEstadoOrdenesCli: TAction
      Tag = 16113
      Category = 'T y C'
      Caption = 'Ver &Estado Ordenes Cliente'
      Hint = 'Ver estado de ordenes por cliente.'
      ImageIndex = 116
      OnExecute = ZAVerEstadoOrdenesCliExecute
    end
    object ZAMarcajeManual: TAction
      Tag = 16114
      Category = 'T y C'
      Caption = 'Marcajes &Manuales'
      Hint = 'Ver los marcajes manuales.'
      ImageIndex = 105
      OnExecute = ZAMarcajeManualExecute
    end
    object ZAPuestos: TAction
      Tag = 16115
      Category = 'T y C Auxiliares'
      Caption = 'Puestos Lectores'
      Hint = 'Puestos para los lectores de c'#243'digos de barras.'
      ImageIndex = 115
      OnExecute = ZAPuestosExecute
    end
    object ZAMarcajes: TAction
      Tag = 16116
      Category = 'T y C'
      Caption = '&Marcajes'
      Hint = 'Marcajes'
      ImageIndex = 105
      OnExecute = ZAMarcajesExecute
    end
    object ZAImprimePedEspPdte: TAction
      Tag = 16117
      Category = 'T y C Listados'
      Caption = 'Listar &Pedidos Especiales Pendientes'
      Hint = 'Imprimir Pedidos Especiales Pendientes'
      ImageIndex = 14
      OnExecute = ZAImprimePedEspPdteExecute
    end
    object ZALstPedEntrega: TAction
      Tag = 16118
      Category = 'T y C Listados'
      Caption = 'Listar Pedidos &Entrega'
      Hint = 'Listado de pedidos por entrega.'
      ImageIndex = 14
      OnExecute = ZALstPedEntregaExecute
    end
    object ZAArticulos: TAction
      Tag = 16119
      Category = 'T y C'
      Caption = 'Visualizar Articulos'
      Hint = 'Visualizar Art'#237'culos'
      ImageIndex = 109
      OnExecute = ZAArticulosExecute
    end
    object ZAPedidosAAlbaran: TAction
      Tag = 16121
      Category = 'T y C'
      Caption = 'Pedidos &Albar'#225'n'
      Hint = 'Pasar pedidos a albar'#225'n y generar etiquetas.'
      ImageIndex = 31
      OnExecute = ZAPedidosAAlbaranExecute
    end
    object ZAPedidosMalCerrados: TAction
      Tag = 16122
      Category = 'T y C'
      Caption = 'Pedidos &Mal Cerrados'
      Hint = 'Ver pedidos que tienen las ordenes mal cerradas.'
      ImageIndex = 39
      OnExecute = ZAPedidosMalCerradosExecute
    end
    object ZALstPedVenLin: TAction
      Tag = 16123
      Category = 'T y C Listados'
      Caption = 'Listar &Ventas Pedidos Lineal'
      Hint = 'Ventas de pedidos por lineal.'
      ImageIndex = 14
      OnExecute = ZALstPedVenLinExecute
    end
    object ZATiposArticulos: TAction
      Tag = 16124
      Category = 'T y C'
      Caption = 'Tipos &Art'#237'culo'
      Hint = 'Tipos de art'#237'culo toldos y cortina.'
      ImageIndex = 109
      OnExecute = ZATiposArticulosExecute
    end
    object ZALstTiempoMarc: TAction
      Tag = 16125
      Category = 'T y C'
      Caption = '&Ver Tiempos Marcaje Manual'
      Hint = 'Listado tiempos de marcajes manuales.'
      ImageIndex = 11
      OnExecute = ZALstTiempoMarcExecute
    end
    object ZAMarcManDirecto: TAction
      Tag = 16126
      Category = 'T y C'
      Caption = 'Marcajes Manuales &Directos'
      Hint = 'Marcajes manuales directos.'
      ImageIndex = 25
      OnExecute = ZAMarcManDirectoExecute
    end
    object ZALstFechaPrevProv: TAction
      Tag = 16127
      Category = 'T y C Listados'
      Caption = 'Listar &Pedidos Proveedor Fecha Prevista'
      Hint = 'Listados de los pedidos proveedor por fecha prevista.'
      ImageIndex = 14
      OnExecute = ZALstFechaPrevProvExecute
    end
    object ZAConfiguracion: TAction
      Tag = 16129
      Category = 'T y C'
      Caption = 'Configuraci'#243'n TyC'
      Hint = 'Configuraci'#243'n toldos y cortinas.'
      ImageIndex = 2
      OnExecute = ZAConfiguracionExecute
    end
    object ZAConsultarTarifasModelos: TAction
      Tag = 16131
      Category = 'T y C'
      Caption = 'Consultar &Tarifas Modelos'
      Hint = 'Consultar tarifas modelos.'
      ImageIndex = 143
      OnExecute = ZAConsultarTarifasModelosExecute
    end
    object APedidosVentaPendientesTyC: TAction
      Tag = 16132
      Category = 'T y C Listados'
      Caption = 'Listar Pedidos Ventas &Pendientes (TyC)'
      Hint = 'Listado de los pedidos de ventas pendientes (TyC).'
      ImageIndex = 14
      OnExecute = APedidosVentaPendientesTyCExecute
    end
    object AListadoDeUnidadesPendientesDeServirTyC: TAction
      Tag = 16133
      Category = 'T y C Listados'
      Caption = 'Listar Unidades &Pendientes Servir (TyC)'
      Hint = 'Listado de unidades pendientes de servir (TyC).'
      ImageIndex = 14
      OnExecute = AListadoDeUnidadesPendientesDeServirTyCExecute
    end
    object AListadoDeStockMnimoTyC: TAction
      Tag = 16134
      Category = 'T y C Listados'
      Caption = 'Listar Stock M'#237'nimo (TyC)'
      Hint = 'Listado de stock bajo m'#237'nimo (TyC)'
      ImageIndex = 14
      OnExecute = AListadoDeStockMnimoTyCExecute
    end
    object ADespiece: TAction
      Tag = 16135
      Category = 'Produccion Despiece'
      Caption = '&Despiece'
      Hint = 'Mantenimiento de despieces.'
      ImageIndex = 111
      OnExecute = ADespieceExecute
    end
    object AImprimeRecibos: TAction
      Tag = 856
      Category = 'Tesoreria'
      Caption = 'Listar &Recibos'
      Hint = 'Listado de recibos.'
      ImageIndex = 14
      OnExecute = AImprimeRecibosExecute
    end
    object AOfertasANDALplast: TAction
      Tag = 9103
      Category = 'ANDALplast'
      Caption = 'Ofertas Inyecci'#243'n Pl'#225'stico'
      Hint = 'mantenimiento de ofertas inyecci'#243'n de p'#225'stico.'
      ImageIndex = 72
      OnExecute = AOfertasANDALplastExecute
    end
    object AMoldes: TAction
      Tag = 9101
      Category = 'ANDALplast'
      Caption = '&Moldes'
      Hint = 'mantenimiento de moldes.'
      ImageIndex = 21
      OnExecute = AMoldesExecute
    end
    object APostizos: TAction
      Tag = 9102
      Category = 'ANDALplast'
      Caption = '&Postizos'
      Hint = 'mantenimiento de postizos'
      ImageIndex = 21
      OnExecute = APostizosExecute
    end
    object ALstCosteVentasMP: TAction
      Tag = 9104
      Category = 'ANDALplast'
      Caption = 'Listar Coste Mercanc'#237'a Vendida'
      Hint = 'Listado de costes de la mercancia vendida.'
      ImageIndex = 14
      OnExecute = ALstCosteVentasMPExecute
    end
    object ALstArticulosCliente: TAction
      Tag = 9105
      Category = 'ANDALplast'
      Caption = 'Listar Articulos Cliente'
      Hint = 'Listado de los art'#237'culos de clientes'
      ImageIndex = 14
      OnExecute = ALstArticulosClienteExecute
    end
    object AGestionDocumentosPago: TAction
      Tag = 857
      Category = 'Tesoreria'
      Caption = '&Gesti'#243'n Documentos Pago'
      Hint = 'Gestion de documentos de pago.'
      ImageIndex = 123
      OnExecute = AGestionDocumentosPagoExecute
    end
    object AEnviarDatosPonys: TAction
      Tag = 1068
      Category = 'ECommerce'
      Caption = 'Enviar Datos Web'
      Hint = 'Enviar datos a web (Ponys)'
      ImageIndex = 13
      OnExecute = AEnviarDatosPonysExecute
    end
    object AGaleriaImagen: TAction
      Tag = 1069
      Category = 'Auxiliares'
      Caption = '&Galeria Imagenes'
      Hint = 'Mantenimiento galeria de imagenes'
      ImageIndex = 28
      OnExecute = AGaleriaImagenExecute
    end
    object AMarca: TAction
      Tag = 1306
      Category = 'Auxiliares'
      Caption = '&Marcas Modelos'
      Hint = 'Mantenimiento de marcas asociadas a los modelos.'
      ImageIndex = 11
      OnExecute = AMarcaExecute
    end
    object AGestionTareasProduccion: TAction
      Tag = 14453
      Category = 'Produccion Avanzada'
      Caption = 'Gestion Tareas Produccion'
      Hint = 'Gestion Tareas Produccion'
      ImageIndex = 115
      OnExecute = AGestionTareasProduccionExecute
    end
    object AExportacionEuroPastry: TAction
      Tag = 1070
      Category = 'ECommerce'
      Caption = '&Exportacion EuroPastry'
      Hint = 'Proceso de exportaci'#243'n de las ventas a EuroPastry.'
      ImageIndex = 98
      OnExecute = AExportacionEuroPastryExecute
    end
    object ADividirFacturas: TAction
      Tag = 368
      Category = 'Ventas'
      Caption = '&Dividir Facturas'
      Hint = 'Divide facturas entre canales.'
      ImageIndex = 86
      OnExecute = ADividirFacturasExecute
    end
    object AMemoriaContable: TAction
      Tag = 656
      Category = 'Contabilidad'
      Caption = 'Listar Memoria Contable'
      Hint = 'Listado de la memoria contable'
      ImageIndex = 125
      OnExecute = AMemoriaContableExecute
    end
    object ASincronizaTiendaMasYMasBarato: TAction
      Tag = 1071
      Category = 'ECommerce'
      Caption = '&Sincronizar Tienda Mas y Mas Barato'
      Hint = 'Sincroniza Tienda Mas y Mas Barato'
      ImageIndex = 98
      OnExecute = ASincronizaTiendaMasYMasBaratoExecute
    end
    object AHojaDeTrabajo: TAction
      Tag = 14456
      Category = 'Produccion Avanzada'
      Caption = 'Hojas de Trabajo'
      Hint = 'Hojas de Trabajo'
      ImageIndex = 105
      OnExecute = AHojaDeTrabajoExecute
    end
    object AFichaTecnica: TAction
      Tag = 1503
      Category = 'Reparaciones'
      Caption = '&Ficha T'#233'cnica'
      Hint = 'Ficha tecnica de vehiculos.'
      ImageIndex = 119
      OnExecute = AFichaTecnicaExecute
    end
    object AMarcas: TAction
      Tag = 1072
      Category = 'Auxiliares'
      Caption = '&Marcas'
      Hint = 'Mantenimiento de marcas para modelos y art'#237'culos.'
      ImageIndex = 21
      OnExecute = AMarcasExecute
    end
    object AExtraccionDatos: TAction
      Tag = 255
      Category = 'Empresas'
      Caption = 'Extracci'#243'n &Datos'
      Hint = 
        'Extraccion de datos de la las tablas de la base de datos mediant' +
        'e sentencias SQL.'
      ImageIndex = 36
      OnExecute = AExtraccionDatosExecute
    end
    object ANecesidadMateraPrima: TAction
      Tag = 14806
      Category = 'Produccion Plan'
      Caption = '&Necesidades Materia Prima'
      Hint = 'Necesidades materiales y recursos seg'#250'n pedidos de clientes.'
      ImageIndex = 39
      OnExecute = ANecesidadMateraPrimaExecute
    end
    object AParteMovimiento: TAction
      Tag = 369
      Category = 'Ventas'
      Caption = 'Ver Parte Movimientos'
      Hint = 'Parte de Movimiento'
      ImageIndex = 14
      OnExecute = AParteMovimientoExecute
    end
    object APedidosPendientesProv2: TAction
      Tag = 456
      Category = 'Compras'
      Caption = 'Relaci'#243'n Pedidos Compra'
      Hint = 'Ver los pedidos pendientes de proveedor y reclamar.'
      ImageIndex = 29
      OnExecute = APedidosPendientesProv2Execute
    end
    object ARecibosdeIngresosDesglosados: TAction
      Tag = 9014
      Category = 'Latino'
      Caption = 'Recibos Ingresos &Desglosados'
      Hint = 'Recibos de ingresos desglosados.'
      ImageIndex = 70
      OnExecute = ARecibosdeIngresosDesglosadosExecute
    end
    object ATipoModelo: TAction
      Tag = 16111
      Category = 'T y C Auxiliares'
      Caption = 'Tipos Modelo TYC'
      Hint = 'Tipos de Modelo'
      ImageIndex = 133
      OnExecute = ATipoModeloExecute
    end
    object ARepartirHorasProyecto: TAction
      Tag = 368
      Category = 'Ventas'
      Caption = 'Repartir Horas Proyecto'
      Hint = 'Repartir Horas Proyecto'
      ImageIndex = 15
      OnExecute = ARepartirHorasProyectoExecute
    end
    object AKitTallas: TAction
      Tag = 1307
      Category = 'Tallas'
      Caption = '&Kits Tallas'
      Hint = 'Mantenimiento de los kit de las tallas y colores.'
      ImageIndex = 140
      OnExecute = AKitTallasExecute
    end
    object ASII: TAction
      Tag = 753
      Category = 'Impuestos'
      Caption = 'Suministro Inmediato &Informacion'
      Hint = 'Suministro Inmediato de Informacion.'
      ImageIndex = 94
      OnExecute = ASIIExecute
    end
    object ATipoIncidenciaMaq: TAction
      Tag = 1074
      Category = 'Auxiliares'
      Caption = 'Tipo &Incidencia M'#225'quinas'
      Hint = 'T'#237'pos de incidencia m'#225'quinas. (Producci'#243'n).'
      ImageIndex = 29
      OnExecute = ATipoIncidenciaMaqExecute
    end
    object ALSTIngresos: TAction
      Tag = 858
      Category = 'Tesoreria'
      Caption = 'Listar Ingresos'
      Hint = 'Listado de ingresos desglosados.'
      ImageIndex = 14
      OnExecute = ALSTIngresosExecute
    end
    object AImprimeCartaPortes: TAction
      Tag = 371
      Category = 'Ventas'
      Caption = 'Generar/Imprimir Carta Portes'
      Hint = 'Generar e imprimir la carta de portes.'
      ImageIndex = 112
      OnExecute = AImprimeCartaPortesExecute
    end
    object AAlquileres: TAction
      Tag = 372
      Category = 'Ventas'
      Caption = 'Alquileres'
      Hint = 'Alquileres'
      ImageIndex = 40
      OnExecute = AAlquileresExecute
    end
    object AMuestraMenu: TAction
      Category = 'Basico'
      Caption = 'Oculta &Men'#250
      Hint = 'Muestra u oculta men'#250
      ImageIndex = 97
      OnExecute = AMuestraMenuExecute
    end
    object APeriodoFacturacion: TAction
      Tag = 1075
      Category = 'Auxiliares'
      Caption = 'Periodo Fa&cturacion'
      Hint = 'Mantenimiento de periodos de facturacion'
      ImageIndex = 134
      OnExecute = APeriodoFacturacionExecute
    end
    object ASincronizacionTiendaPureWorks: TAction
      Tag = 1076
      Category = 'ECommerce'
      Caption = 'Sincronizacion Tienda PureWorks'
      Hint = 'Sincronizacion Tienda PureWorks'
      ImageIndex = 98
      OnExecute = ASincronizacionTiendaPureWorksExecute
    end
    object AImportesMaximoPeriodo: TAction
      Tag = 256
      Category = 'Empresas'
      Caption = 'Importe Maximo Periodo'
      Hint = 'Importe Maximo Periodo'
      ImageIndex = 141
      OnExecute = AImportesMaximoPeriodoExecute
    end
    object ATipoIncidenciaRep: TAction
      Tag = 1077
      Category = 'Auxiliares'
      Caption = 'Tipo Incidencia &Reparacion'
      Hint = 'T'#237'pos de incidencia reparacion. (Producci'#243'n).'
      ImageIndex = 29
      OnExecute = ATipoIncidenciaRepExecute
    end
    object ARutasAgente: TAction
      Tag = 15014
      Category = 'CRM'
      Caption = 'Rutas de Agente'
      Hint = 'Mantenimiento de rutas de agentes'
      ImageIndex = 21
      OnExecute = ARutasAgenteExecute
    end
    object ASesionCajaTurno: TAction
      Tag = 10205
      Category = 'TPV'
      Caption = 'Sesi'#243'n-Caja-Turno'
      Hint = 'Mantenimiento de Sesion-Caja-Turno'
      ImageIndex = 9
      OnExecute = ASesionCajaTurnoExecute
    end
    object AConfiguracionTPV: TAction
      Tag = 10206
      Category = 'TPV'
      Caption = 'Configuraci'#243'n TPV'
      Hint = 'Parametros de configuracion de TPV'
      ImageIndex = 2
      OnExecute = AConfiguracionTPVExecute
    end
    object ARegistroFitosanitario: TAction
      Tag = 154
      Category = 'Terceros'
      Caption = 'Registro Fitosanitario'
      Hint = 'Mantenimiento de registro fitosanitario'
      ImageIndex = 137
      OnExecute = ARegistroFitosanitarioExecute
    end
    object APorcentajeFacturacion: TAction
      Tag = 10006
      Category = 'TPV'
      Caption = '% Facturaci'#243'n'
      Hint = '% Facturacion'
      ImageIndex = 110
      OnExecute = APorcentajeFacturacionExecute
    end
    object AOpeEstadoMarcajePedido: TAction
      Tag = 14213
      Category = 'Operarios'
      Caption = '&Estado Marcaje Pedido'
      Hint = 'Estado Marcaje Pedido'
      ImageIndex = 105
      OnExecute = AOpeEstadoMarcajePedidoExecute
    end
    object ANumerosDeAutorizacion: TAction
      Tag = 9015
      Category = 'Latino'
      Caption = 'Numeros de autorizaci'#243'n'
      ImageIndex = 2
      OnExecute = ANumerosDeAutorizacionExecute
    end
    object AADRUNNumbers: TAction
      Tag = 1078
      Category = 'Auxiliares'
      Caption = '&N'#250'meros UN'
      Hint = 'Numeros UN'
      ImageIndex = 21
      OnExecute = AADRUNNumbersExecute
    end
    object AADRClases: TAction
      Tag = 1079
      Category = 'Auxiliares'
      Caption = '&Clases ADR'
      Hint = 'Clases'
      ImageIndex = 21
      OnExecute = AADRClasesExecute
    end
    object AADRPackingGroups: TAction
      Tag = 1080
      Category = 'Auxiliares'
      Caption = 'Grupos de &Embalaje'
      Hint = 'Grupos de Embalaje'
      ImageIndex = 21
      OnExecute = AADRPackingGroupsExecute
    end
    object AADRTunelCodes: TAction
      Tag = 1081
      Category = 'Auxiliares'
      Caption = 'C'#243'digos de &T'#250'nel'
      Hint = 'C'#243'digos de T'#250'nel'
      ImageIndex = 21
      OnExecute = AADRTunelCodesExecute
    end
    object AADRTipos: TAction
      Tag = 1082
      Category = 'Auxiliares'
      Caption = 'T&ipos ADR'
      Hint = 'Tipos ADR'
      ImageIndex = 102
      OnExecute = AADRTiposExecute
    end
    object ATPVSincronizacion: TAction
      Tag = 10007
      Category = 'TPV'
      Caption = 'Sincronizaci'#243'n'
      Hint = 'Sincronizaci'#243'n'
      ImageIndex = 98
      OnExecute = ATPVSincronizacionExecute
    end
    object ATPVConfigSincronizacion: TAction
      Tag = 10008
      Category = 'TPV'
      Caption = 'Configuraci'#243'n sincronizaci'#243'n'
      Hint = 'Configuraci'#243'n sincronizaci'#243'n tpv'
      ImageIndex = 2
      OnExecute = ATPVConfigSincronizacionExecute
    end
    object APedidosPendientesCli: TAction
      Tag = 373
      Category = 'Ventas'
      Caption = 'Relaci'#243'n Pedidos Venta'
      Hint = 'Relacion de Pedidos de Venta'
      ImageIndex = 29
      OnExecute = APedidosPendientesCliExecute
    end
    object AListarEtiquetas: TAction
      Tag = 570
      Category = 'Almacenes'
      Caption = 'Listar Etiquetas'
      Hint = 'Listar etiquetas de c'#243'digos de barras'
      ImageIndex = 38
      OnExecute = AListarEtiquetasExecute
    end
    object ACuotasClientes: TAction
      Tag = 374
      Category = 'Ventas'
      Caption = 'Contratos Mantenimientos / Cuotas'
      Hint = 'Mantenimiento de Cuotas a Clientes, Mantinimientos y Contratos'
      ImageIndex = 42
      OnExecute = ACuotasClientesExecute
    end
    object AExportacionHelios: TAction
      Tag = 1083
      Category = 'ECommerce'
      Caption = 'Exportacion Helios'
      Hint = 'Exportacion de stocks para Helios'
      ImageIndex = 98
      OnExecute = AExportacionHeliosExecute
    end
    object AImportacionVending: TAction
      Tag = 1084
      Category = 'ECommerce'
      Caption = 'Importacion Vending'
      Hint = 'Importacion de Maquinas Vending'
      ImageIndex = 98
      OnExecute = AImportacionVendingExecute
    end
    object AMaquinasVending: TAction
      Tag = 571
      Category = 'ECommerce'
      Caption = 'Maquinas &Vending'
      Hint = 'Mantenimiento de Maquinas Vending'
      ImageIndex = 98
      OnExecute = AMaquinasVendingExecute
    end
    object AUbicacionesSimple: TAction
      Tag = 1085
      Category = 'Auxiliares'
      Caption = 'Ubicaciones Simple'
      Hint = 'Ubicaciones Simple'
      ImageIndex = 81
      OnExecute = AUbicacionesSimpleExecute
    end
    object ALstCalendarioLaboral: TAction
      Tag = 14305
      Category = 'Control Presencia'
      Caption = 'Listar &Calendario Laboral'
      Hint = 'Listado del calendario laboral de empleados entre fechas'
      ImageIndex = 14
      OnExecute = ALstCalendarioLaboralExecute
    end
    object AAuditoria: TAction
      Tag = 1117
      Category = 'Utilidades'
      Caption = '&Auditor'#237'a'
      Hint = 'Auditoria de datos'
      ImageIndex = 85
      OnExecute = AAuditoriaExecute
    end
    object ACategoriaCliente: TAction
      Tag = 156
      Category = 'Terceros'
      Caption = '&Categorias de Cliente'
      Hint = 'Mantenimiento de Categorias de Cliente'
      ImageIndex = 21
      OnExecute = ACategoriaClienteExecute
    end
    object AAsistenteImpClientes: TAction
      Tag = 257
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Clientes'
      Hint = 'Asistente Importacion de Clientes'
      ImageIndex = 91
      OnExecute = AAsistenteImpClientesExecute
    end
    object AAsistenteImpProveedores: TAction
      Tag = 258
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Proveedores'
      Hint = 'Asistente Importacion de Proveedores'
      ImageIndex = 91
      OnExecute = AAsistenteImpProveedoresExecute
    end
    object AAsistenteImpAcreedores: TAction
      Tag = 259
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Acreedores'
      Hint = 'Asistente Importacion de Acreedores'
      ImageIndex = 91
      OnExecute = AAsistenteImpAcreedoresExecute
    end
    object AAsistenteImpArticulos: TAction
      Tag = 260
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Articulos'
      Hint = 'Asistente Importacion de Articulos'
      ImageIndex = 91
      OnExecute = AAsistenteImpArticulosExecute
    end
    object ARefrescarImpresoras: TAction
      Category = 'Basico'
      Caption = 'Refrescar Lista'
      Hint = 'Refrescar Lista de Impresoras'
      ImageIndex = 26
      OnExecute = ARefrescarImpresorasExecute
    end
    object APruebas: TAction
      Category = 'Utilidades'
      Caption = 'Pruebas'
      Hint = 'Fomrulario para pruebas de desarrollos'
      ImageIndex = 2
      OnExecute = APruebasExecute
    end
    object AExportacionTyrsa: TAction
      Tag = 1086
      Category = 'ECommerce'
      Caption = 'Exportacion Tablas Tyrsa'
      Hint = 'Exportacion Tablas Tyrsa'
      ImageIndex = 98
      OnExecute = AExportacionTyrsaExecute
    end
    object AImportaListados: TAction
      Tag = -2
      Category = 'Listados Presonalizado'
      Caption = 'Importar Listado'
      Hint = 'Importar Listado'
      ImageIndex = 49
      OnExecute = AImportaListadosExecute
    end
    object ANuevoGrupoListados: TAction
      Tag = -1
      Category = 'Listados Presonalizado'
      Caption = 'Crear nuevo grupo'
      Hint = 'Crear nuevo grupo'
      ImageIndex = 4
      OnExecute = ANuevoGrupoListadosExecute
    end
    object ARecalculaContabilidad: TAction
      Tag = 658
      Category = 'Contabilidad'
      Caption = 'Recalcula Contabilidad'
      Hint = 
        'Recalcula los saldos contables del ejercicio actual de toda la C' +
        'ontabilidad'
      ImageIndex = 3
      OnExecute = ARecalculaContabilidadExecute
    end
    object AFiltroAlbaranesCompra: TAction
      Tag = 455
      Category = 'Compras'
      Caption = 'Filtro Albaranes de Compra'
      Hint = 'Filtro Albaranes de Compra'
      ImageIndex = 83
      OnExecute = AFiltroAlbaranesCompraExecute
    end
    object ARegiones: TAction
      Tag = 1086
      Category = 'Auxiliares'
      Caption = '&Regiones'
      Hint = 'Mantenimiento de Regiones'
      ImageIndex = 81
      OnExecute = ARegionesExecute
    end
    object APoblaciones: TAction
      Tag = 1087
      Category = 'Auxiliares'
      Caption = '&Poblaciones'
      Hint = 'Mantenimiento de poblaciones'
      ImageIndex = 81
      OnExecute = APoblacionesExecute
    end
    object AImportacionDlivery: TAction
      Tag = 1087
      Category = 'ECommerce'
      Caption = 'Importacion Dlivery'
      Hint = 'Importacion de datos de Dlivery'
      ImageIndex = 98
      OnExecute = AImportacionDliveryExecute
    end
    object AImportacionMulty: TAction
      Tag = 1088
      Category = 'ECommerce'
      Caption = 'Importacion Multy'
      Hint = 'Importacion Multy'
      ImageIndex = 98
      OnExecute = AImportacionMultyExecute
    end
    object ACrmAsuntos: TAction
      Tag = 15015
      Category = 'CRM'
      Caption = 'Asuntos'
      Hint = 'Mantenimiento de Asuntos CRM'
      ImageIndex = 21
      OnExecute = ACrmAsuntosExecute
    end
    object AAtributos: TAction
      Tag = 571
      Category = 'Almacenes'
      Caption = 'Mantenimiento de Atributos'
      Hint = 'Mantenimiento de Atributos para combinaciones'
      ImageIndex = 137
      OnExecute = AAtributosExecute
    end
    object ASincronizacionEginer: TAction
      Tag = 1089
      Category = 'ECommerce'
      Caption = 'Sincronizacion Eginer'
      Hint = 'Sincronizacion Eginer'
      ImageIndex = 98
      OnExecute = ASincronizacionEginerExecute
    end
    object ASIILROE: TAction
      Tag = 760
      Category = 'Impuestos'
      Caption = 'LROE - Libro Registro Operaciones Economicas'
      Hint = 'LROE - Libro Registro Operaciones Economicas'
      ImageIndex = 94
      OnExecute = ASIILROEExecute
    end
    object AVerifactu: TAction
      Tag = 762
      Category = 'Impuestos'
      Caption = 'Verifactu'
      Hint = 'Verifactu'
      ImageIndex = 94
      OnExecute = AVerifactuExecute
    end
    object ATipoImpuestoAdicional: TAction
      Tag = 755
      Category = 'Impuestos'
      Caption = 'Tipo Impuesto Adicional'
      Hint = 'Mantenimiento de Tipos de Impuesto Adicional'
      ImageIndex = 110
      OnExecute = ATipoImpuestoAdicionalExecute
    end
    object ASIICertificadoDigital: TAction
      Tag = 17000
      Category = 'ImpuestosChile'
      Caption = 'Certificado digital'
      Hint = 'Certificado digital para SII'
      ImageIndex = 21
      OnExecute = ASIICertificadoDigitalExecute
    end
    object ASIIFolios: TAction
      Tag = 17001
      Category = 'ImpuestosChile'
      Caption = 'Folios'
      Hint = 'Folios para SII'
      ImageIndex = 21
      OnExecute = ASIIFoliosExecute
    end
    object ASIIUrlEndpoint: TAction
      Tag = 758
      Category = 'Impuestos'
      Caption = 'Url Endpoint'
      Hint = 'Url de enlace con SII'
      ImageIndex = 21
      OnExecute = ASIIUrlEndpointExecute
    end
    object AArtModGenero: TAction
      Tag = 1308
      Category = 'Tallas'
      Caption = 'G&enero'
      Hint = 'Mantenimiento de generos.'
      ImageIndex = 133
      OnExecute = AArtModGeneroExecute
    end
    object AArtModTemporada: TAction
      Tag = 1309
      Category = 'Tallas'
      Caption = 'Temp&orada'
      Hint = 'Mantenimiento de temporadas.'
      ImageIndex = 133
      OnExecute = AArtModTemporadaExecute
    end
    object AAsistenteImpModelos: TAction
      Tag = 261
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Modelos'
      Hint = 'Asistente Importacion de Modelos'
      ImageIndex = 91
      OnExecute = AAsistenteImpModelosExecute
    end
    object AListarCuadreCaja: TAction
      Tag = 859
      Category = 'Tesoreria'
      Caption = 'Listar c&uadre caja'
      Hint = 'Listar cuadre caja'
      ImageIndex = 14
      OnExecute = AListarCuadreCajaExecute
    end
    object ATiposBulto: TAction
      Tag = 1088
      Category = 'Auxiliares'
      Caption = 'Tipos Bulto'
      Hint = 'Mantenimiento de tipos de bulto.'
      ImageIndex = 90
      OnExecute = ATiposBultoExecute
    end
    object AReestablecerConexionesWEB: TAction
      Tag = 1118
      Category = 'Utilidades'
      Caption = 'Reestablecer Conexiones WEB'
      Hint = 'Reestablecer Conexiones WEB'
      ImageIndex = 26
      OnExecute = AReestablecerConexionesWEBExecute
    end
    object ATipoReparacion: TAction
      Tag = 1504
      Category = 'Reparaciones'
      Caption = 'Tipo Reparacion'
      Hint = 'Mantenimiento de tipos de reparacion'
      ImageIndex = 2
      OnExecute = ATipoReparacionExecute
    end
    object ATipoActuacion: TAction
      Tag = 1505
      Category = 'Reparaciones'
      Caption = 'Tipo Actuacion'
      Hint = 'Mantenimineto de tipos de actuacion'
      ImageIndex = 2
      OnExecute = ATipoActuacionExecute
    end
    object AServirPedidosVenta: TAction
      Tag = 375
      Category = 'Ventas'
      Caption = 'Servir Pedidos'
      Hint = 
        'Servir pedidos de clientes. (Ventas). Generaci'#243'n de albaranes o ' +
        'facturas.'
      ImageIndex = 42
      OnExecute = AServirPedidosVentaExecute
    end
    object AEnvioDTE: TAction
      Tag = 17002
      Category = 'ImpuestosChile'
      Caption = 'DTE &Ventas'
      Hint = 'Envio de factura electronica'
      ImageIndex = 46
      OnExecute = AEnvioDTEExecute
    end
    object APrevisionDeCuentas: TAction
      Tag = 659
      Category = 'Contabilidad'
      Caption = 'Prevision de cuentas'
      Hint = 'Prevision de cuentas'
      ImageIndex = 30
      OnExecute = APrevisionDeCuentasExecute
    end
    object ADatosTecnicos: TAction
      Tag = 14457
      Category = 'Produccion Avanzada'
      Caption = 'Datos Tecnicos'
      Hint = 'Datos Tecnicos'
      ImageIndex = 87
      OnExecute = ADatosTecnicosExecute
    end
    object ARefrescarBandejas: TAction
      Category = 'Basico'
      Caption = 'Refrescar Lista'
      Hint = 'Refrescar Lista de Bandejas de la Impresoras'
      ImageIndex = 26
      OnExecute = ARefrescarBandejasExecute
    end
    object ACilindros: TAction
      Tag = 16009
      Category = 'Etiquetas'
      Caption = 'Cilindros'
      Hint = 'Mantenimiento de Cilindros de Etiquetas'
      ImageIndex = 21
      OnExecute = ACilindrosExecute
    end
    object AEstadisitcasComparadas: TAction
      Tag = 15101
      Category = 'Estadisticas'
      Caption = 'Estadisitcas Comparadas'
      Hint = 'Estadisitcas Comparadas'
      ImageIndex = 32
      OnExecute = AEstadisitcasComparadasExecute
    end
    object AEstadisticaTubosParis: TAction
      Tag = 15002
      Category = 'Estadisticas'
      Caption = 'Estadisticas Tubos Paris'
      Hint = 'Estadisticas Tubos Paris'
      ImageIndex = 32
      OnExecute = AEstadisticaTubosParisExecute
    end
    object ANominas: TAction
      Tag = 14214
      Category = 'Operarios'
      Caption = 'N'#243'minas'
      Hint = 'Mantenimiento de las n'#243'minas de los empleados.'
      ImageIndex = 123
      OnExecute = ANominasExecute
    end
    object ANominasConceptos: TAction
      Tag = 14215
      Category = 'Operarios'
      Caption = 'Conceptos N'#243'minas'
      Hint = 'Mantenimiento de los Conceptos de n'#243'minas'
      ImageIndex = 18
      OnExecute = ANominasConceptosExecute
    end
    object ARHPersona: TAction
      Tag = 14216
      Category = 'Operarios'
      Caption = 'Personas'
      Hint = 'Mantenimiento de  Personas'
      ImageIndex = 89
      OnExecute = ARHPersonaExecute
    end
    object AEtiColor: TAction
      Tag = 16010
      Category = 'Etiquetas'
      Caption = 'Etiquetas Color'
      Hint = 'Mantenimiento de Color de Etiquetas'
      ImageIndex = 21
      OnExecute = AEtiColorExecute
    end
    object AEtiAnilox: TAction
      Tag = 16011
      Category = 'Etiquetas'
      Caption = 'Etiquetas Anilox'
      Hint = 'Mantenimiento de Anilox de Etiquetas'
      ImageIndex = 21
      OnExecute = AEtiAniloxExecute
    end
    object AAgrupacionOfertas: TAction
      Tag = 376
      Category = 'Ventas'
      Caption = 'Servir Ofertas por L'#237'neas'
      Hint = 'Servir Ofertas por L'#237'neas'
      ImageIndex = 42
      OnExecute = AAgrupacionOfertasExecute
    end
    object ARCVCompra: TAction
      Tag = 17003
      Category = 'ImpuestosChile'
      Caption = 'DTE &Compras'
      Hint = 'RCV Compra'
      OnExecute = ARCVCompraExecute
    end
    object AAsistenteImpStockMinMax: TAction
      Tag = 262
      Category = 'Empresas'
      Caption = 'Asistente Importacion Stock Min./Max.'
      Hint = 'Asistente Importacion de Stock Min./Max.'
      ImageIndex = 33
      OnExecute = AAsistenteImpStockMinMaxExecute
    end
    object AEmpresasChile: TAction
      Tag = 157
      Category = 'Terceros'
      Caption = 'Empresas de Chile'
      Hint = 'Empresas de Chile'
      ImageIndex = 21
      OnExecute = AEmpresasChileExecute
    end
    object AIncidenciasMarcajes: TAction
      Tag = 14458
      Category = 'Produccion Avanzada'
      Caption = 'Incidencias Marcajes'
      Hint = 'Incidencias Marcajes'
      ImageIndex = 87
      OnExecute = AIncidenciasMarcajesExecute
    end
    object ASIIConfCorreos: TAction
      Tag = 17004
      Category = 'ImpuestosChile'
      Caption = 'Conf. Correos'
      Hint = 'Configuracion de correo de envio y rececpcion SII'
      ImageIndex = 94
      OnExecute = ASIIConfCorreosExecute
    end
    object AProTareasExternas: TAction
      Tag = 14459
      Category = 'Produccion Avanzada'
      Caption = 'Tareas Externas'
      Hint = 'Tareas Externas'
      ImageIndex = 88
      OnExecute = AProTareasExternasExecute
    end
    object AGenerarFacturasElectronicasES: TAction
      Tag = 378
      Category = 'Ventas'
      Caption = 'Generar Facturas Electronicas'
      Hint = 'Generacion Masiva de Facturas Electronicas'
      ImageIndex = 61
      OnExecute = AGenerarFacturasElectronicasESExecute
    end
    object ASIITipoDTE: TAction
      Tag = 17005
      Category = 'ImpuestosChile'
      Caption = 'SII Tipo DTE'
      Hint = 'Configuracion de Tipos de DTE'
      ImageIndex = 118
      OnExecute = ASIITipoDTEExecute
    end
    object AEscandalloGarantias: TAction
      Tag = 14460
      Category = 'Produccion Avanzada'
      Caption = 'Escandallo Garantias'
      Hint = 'Mantenimiento de Escandallo de Garantias'
      ImageIndex = 110
      OnExecute = AEscandalloGarantiasExecute
    end
    object AAsignacionGarantias: TAction
      Tag = 14461
      Category = 'Produccion Avanzada'
      Caption = 'Asignacion de Garantias'
      Hint = 'Asignacion de Garantias'
      ImageIndex = 95
      OnExecute = AAsignacionGarantiasExecute
    end
    object ANominasConceptosCHL: TAction
      Tag = 14219
      Category = 'Operarios'
      Caption = 'Conceptos N'#243'minas'
      Hint = 'Mantenimiento de los Conceptos de n'#243'minas (Chile)'
      ImageIndex = 18
      OnExecute = ANominasConceptosCHLExecute
    end
    object ANominasPlantilla: TAction
      Tag = 14218
      Category = 'Operarios'
      Caption = 'Plantillas N'#243'minas'
      Hint = 'Plantillas para exportar Nominas'
      ImageIndex = 18
      OnExecute = ANominasPlantillaExecute
    end
    object AJornada: TAction
      Tag = 14220
      Category = 'Operarios'
      Caption = 'Jornadas, Horas, '#193'reas, C Costos'
      Hint = 'Mantenimiento Jornadas, Horas, Centros de Costos'
      ImageIndex = 115
      OnExecute = AJornadaExecute
    end
    object ARecepcionFichaTecnica: TAction
      Tag = 1506
      Category = 'Reparaciones'
      Caption = 'Recepciones'
      Hint = 'Recepcion de elemento a reparar'
      ImageIndex = 119
      OnExecute = ARecepcionFichaTecnicaExecute
    end
    object AMotivosAbono: TAction
      Tag = 1089
      Category = 'Auxiliares'
      Caption = 'Motivos Abono'
      Hint = 'Mantenimiento de Motivos de Abono'
      ImageIndex = 21
      OnExecute = AMotivosAbonoExecute
    end
    object AModelo592: TAction
      Tag = 761
      Category = 'Impuestos'
      Caption = 'Modelo 592 - Impuesto envases de plastino no reutilizables'
      Hint = 'Modelo 592 - Impuesto envases de plastino no reutilizables'
      ImageIndex = 136
      OnExecute = AModelo592Execute
    end
    object APrecioReposicion: TAction
      Tag = 573
      Category = 'Almacenes'
      Caption = 'Precio Reposicion'
      Hint = 'Mantenimiento de Precio de Reposicion'
      ImageIndex = 33
      OnExecute = APrecioReposicionExecute
    end
    object AGamasPrecioReposicion: TAction
      Tag = 574
      Category = 'Almacenes'
      Caption = 'Gamas Precio de Reposicion'
      Hint = 'Mantenimiento de Gamas Precio de Reposicion'
      ImageIndex = 33
      OnExecute = AGamasPrecioReposicionExecute
    end
    object ADashboard: TAction
      Tag = 263
      Category = 'Empresas'
      Caption = 'Dashboard'
      Hint = 'Panel de moniturizacion de empresa'
      ImageIndex = 30
      OnExecute = ADashboardExecute
    end
    object ABrevo: TAction
      Tag = 1091
      Category = 'ECommerce'
      Caption = 'Brevo'
      Hint = 'Mantenimiento de Contactos y Listas Brevo'
      ImageIndex = 34
      OnExecute = ABrevoExecute
    end
    object AAdjuntos: TAction
      Category = 'Utilidades'
      Caption = 'Adjuntos'
      Hint = 'Archivos Adjuntos'
      ImageIndex = 59
      OnExecute = AAdjuntosExecute
    end
    object AImportarEscProduccion: TAction
      Tag = 14462
      Category = 'Produccion Avanzada'
      Caption = 'Importar Esc. Produccion'
      Hint = 'Importar Esc. Produccion'
      ImageIndex = 98
      OnExecute = AImportarEscProduccionExecute
    end
    object AComoNosConocieron: TAction
      Tag = 1090
      Category = 'Auxiliares'
      Caption = 'Como &Nos Conocieron'
      Hint = 'Mantenimientos de Como Nos Conocieron'
      ImageIndex = 21
      OnExecute = AComoNosConocieronExecute
    end
    object AImportacionTarifasTyC: TAction
      Tag = 16137
      Category = 'T y C'
      Caption = 'Importacion Tarifas T. y C.'
      Hint = 'Importacion de TarifasToldos y Cortinas'
      ImageIndex = 49
      OnExecute = AImportacionTarifasTyCExecute
    end
    object ASincronizacionSkrit: TAction
      Tag = 1092
      Category = 'ECommerce'
      Caption = 'Sincronizacion Skrit'
      Hint = 'Sincronizacion de Albaranes de compra SKIRT'
      ImageIndex = 98
      OnExecute = ASincronizacionSkritExecute
    end
    object ASincronizacionColon: TAction
      Tag = 1093
      Category = 'ECommerce'
      Caption = 'Sincronizacion Colon'
      Hint = 'Sincronizacion de Albaranes de compra Colon'
      ImageIndex = 98
      OnExecute = ASincronizacionColonExecute
    end
    object AECFVentas: TAction
      Tag = 763
      Category = 'Impuestos'
      Caption = 'ECF Ventas'
      Hint = 'ECF Ventas'
      ImageIndex = 46
      OnExecute = AECFVentasExecute
    end
    object ADGIIConfiguracionEnvio: TAction
      Tag = 764
      Category = 'Impuestos'
      Caption = 'Configuraci'#243'n env'#237'o'
      ImageIndex = 46
      OnExecute = ADGIIConfiguracionEnvioExecute
    end
    object APresentacionesHacienda: TAction
      Tag = 765
      Category = 'Impuestos'
      Caption = 'Presentaciones'
      Hint = 'Presentaciones a Hacienda'
      ImageIndex = 136
      OnExecute = APresentacionesHaciendaExecute
    end
    object AEstadisticasSimples: TAction
      Tag = 15003
      Category = 'Estadisticas'
      Caption = 'Estadisticas Simples'
      Hint = 'Estadisticas Simples'
      ImageIndex = 32
      OnExecute = AEstadisticasSimplesExecute
    end
    object ADiarioReparaciones: TAction
      Tag = 1507
      Category = 'Reparaciones'
      Caption = 'Diario de Reparaciones'
      Hint = 'Diario de Reparaciones'
      ImageIndex = 134
      OnExecute = ADiarioReparacionesExecute
    end
    object ASincronizacionTyC: TAction
      Tag = 1094
      Category = 'ECommerce'
      Caption = 'Sincronizacion Toldos y Cortinas'
      Hint = 'Sincronizacion Toldos y Cortinas'
      ImageIndex = 31
      OnExecute = ASincronizacionTyCExecute
    end
    object AECFCompras: TAction
      Category = 'Impuestos'
      Caption = 'ECF Compras'
      Hint = 'ECF Compras'
      ImageIndex = 46
      OnExecute = AECFComprasExecute
    end
    object ASMSPubli: TAction
      Category = 'Utilidades'
      Caption = 'Configuracion SMS Publi'
      Hint = 'Configuracion SMS Publi'
      ImageIndex = 2
      OnExecute = ASMSPubliExecute
    end
    object ADivilo: TAction
      Tag = 860
      Category = 'Tesoreria'
      Caption = 'Divilo'
      Hint = 'Mantenimiento y punteo de cobros Divilo'
      ImageIndex = 143
      OnExecute = ADiviloExecute
    end
    object APresenciaFichar: TAction
      Tag = 14308
      Category = 'Control Presencia'
      Caption = 'Fichar Presencia'
      Hint = 'Fichar registro de Presencia'
      ImageIndex = 3
      OnExecute = APresenciaFicharExecute
    end
    object AConfigServidoresCorreo: TAction
      Category = 'Utilidades'
      Caption = 'Configuracion de servidores de correo'
      ImageIndex = 2
      OnExecute = AConfigServidoresCorreoExecute
    end
    object ASincronizacionHubSpot: TAction
      Tag = 1095
      Category = 'ECommerce'
      Caption = 'Sincronizacion HubSpot'
      Hint = 'Sincronizacion HubSpot'
      ImageIndex = 98
      OnExecute = ASincronizacionHubSpotExecute
    end
    object AAgenda: TAction
      Category = 'Utilidades'
      Caption = 'Acceso a la agenda'
      Hint = 'Acceso a la agenda'
      ImageIndex = 134
      OnExecute = AAgendaExecute
    end
    object ACaracteristicasArticulo: TAction
      Tag = 1091
      Category = 'Auxiliares'
      Caption = 'Caracteristicas Articulo'
      ImageIndex = 111
      OnExecute = ACaracteristicasArticuloExecute
    end
  end
  object MainMenu: TMainMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 184
    Top = 72
    object MGTerceros: TMenuItem
      Caption = '&Terceros'
      object MITerceros: TMenuItem
        Action = ATerceros
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITercerosVer2: TMenuItem
        Action = ATerceros2
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEmpresasChile: TMenuItem
        Action = AEmpresasChile
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIClientes: TMenuItem
        Action = AClientes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProveedores: TMenuItem
        Action = AProveedores
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAcreedores: TMenuItem
        Action = AAcreedores
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAgentes: TMenuItem
        Action = AAgentes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIClientesPotenciales: TMenuItem
        Action = AClientesPotencialesKri
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador1: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIIncidencias: TMenuItem
        Action = AIncidencias
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador2: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProcesos: TMenuItem
        Action = AProcesosKri
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRepUsuarioTerceros: TMenuItem
        Action = ARepUsuariosTerceros
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGAlmacenes: TMenuItem
      Caption = '&Almacenes'
      Hint = 'Men'#250' de almacenes'
      object MIArticulos: TMenuItem
        Action = AArticulos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFamilias: TMenuItem
        Action = AFamilias
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEscandallo: TMenuItem
        Action = AEscandallo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportarArtculosDesdeExcel: TMenuItem
        Action = AImportarArticulosExcel
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportesProrrateadors: TMenuItem
        Action = AProrrateoCostes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador3: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMvStMan: TMenuItem
        Action = AMvStMan
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPedidoEntreAlmacenes: TMenuItem
        Action = APedidoEntreAlmacenes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRegularizacindeStocks: TMenuItem
        Action = ARegStocks
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMovEntreUbicaciones: TMenuItem
        Action = AMovEntreUbicaciones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGAlmacenesAlmacenes: TMenuItem
        Caption = 'A&lmacenes'
        Hint = 'Mantenimiento de Almacenes'
        ImageIndex = 40
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIAlmacenes: TMenuItem
          Tag = 502
          Action = AAlmacenes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MSConfAlm: TMenuItem
          Action = AConfAlmacenes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador4: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MILotes: TMenuItem
        Action = ALotes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MILoteSimple: TMenuItem
        Action = ALoteSimple
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISerializacion: TMenuItem
        Action = ASerializacion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAlmacenesUbicaciones: TMenuItem
        Caption = '&Ubicaciones'
        ImageIndex = 81
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MICalles: TMenuItem
          Action = AAlmacenesCalles
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEstanterias: TMenuItem
          Action = AAlmacenesEstanterias
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRepisas: TMenuItem
          Action = AAlmacenesRepisas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPosiciones: TMenuItem
          Action = AAlmacenesPosicion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIConfiguraAlmacen: TMenuItem
          Action = AConfigAlmcen
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIArtBultos: TMenuItem
        Action = AArtBultos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIArtUdsBultos: TMenuItem
        Caption = 'Unidades Bulto'
        Hint = 'mantenimiento de unidades bulto.'
        ImageIndex = 21
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador5: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITarifasPorArticulo: TMenuItem
        Action = ANewTarifas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITarifas: TMenuItem
        Action = ATarifas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITiposCalculo: TMenuItem
        Action = ATiposCalculo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITiposRedondeo: TMenuItem
        Action = ATiposRedondeo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPropaga: TMenuItem
        Action = APropaga
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPrecioReposicion: TMenuItem
        Action = APrecioReposicion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGamasPrecioReposicion: TMenuItem
        Action = AGamasPrecioReposicion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador6: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICondicionesEspecialesVenta: TMenuItem
        Action = ACondicionesVenta
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPromocionesVentas: TMenuItem
        Action = APromocionesVenta
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador7: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICondAgentes: TMenuItem
        Action = ACondAgentes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICondDeAgentesCli: TMenuItem
        Action = ACondAgeCli
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICondAgentesAgrup: TMenuItem
        Action = ACondAgeAgrup
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador8: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITarifasProveedor: TMenuItem
        Action = ATarifasProveedor
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICondicionesEspecialesCompra: TMenuItem
        Action = ACondicionesCompra
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador9: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIModelosTallas: TMenuItem
        Action = AModelosTallas
        Caption = '&Modelos Tallas y Colores'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador10: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGListadosAlmacen: TMenuItem
        Caption = '&Listados'
        ImageIndex = 14
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIDiarioStock: TMenuItem
          Action = ALSTDiarioStock
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIInventario: TMenuItem
          Action = ALSTInventario
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIGeneraTemporalInventario: TMenuItem
          Action = ALSTGeneraTmpInventarioKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIStockMinimo: TMenuItem
          Action = ALSTStockMinimo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoDeStockMnimoTyC: TMenuItem
          Action = AListadoDeStockMnimoTyC
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIStockResumido: TMenuItem
          Action = ALSTStockResumido
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadodeStockResumidoporTallas: TMenuItem
          Action = ALSTStockTallas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadodeStocksPorAlmacen: TMenuItem
          Action = ALSTStockAlmacen
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIStockPorUbicacion: TMenuItem
          Action = ALstStockPorUbicacion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoMovEntreUbicaciones: TMenuItem
          Action = ALstMovEntreUbicaciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFichamargendeproductos: TMenuItem
          Action = ALSTFichaMargendeProductos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoDeDepositosActivos: TMenuItem
          Action = ALSTDepositosActivos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoUnidadesPendientes: TMenuItem
          Action = ALSTUnidadesPendientes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoDeUnidadesPendientesDeServirTyC: TMenuItem
          Action = AListadoDeUnidadesPendientesDeServirTyC
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoUnidPendRecibir: TMenuItem
          Action = ALSTUnidPendRecibir
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MSGLotes: TMenuItem
          Caption = 'L&otes'
          ImageIndex = 120
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object MIListadoLotes: TMenuItem
            Action = ALSTLotes
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoLotesCompras: TMenuItem
            Action = ALSTLotesCompras
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoLotesVentas: TMenuItem
            Action = ALSTLotesVentas
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoLotesMovimientos: TMenuItem
            Action = ALSTLotesMovimientos
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MITrazabilidadLotes: TMenuItem
            Action = ATrazabilidadLotes
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
        end
        object MIListadodeUbicaciones: TMenuItem
          Action = ALstUbicaciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListarEtiquetas: TMenuItem
          Action = AListarEtiquetas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador11: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIOtros: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIArtculosAlmacenes: TMenuItem
          Action = AArticulosAlmacenes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProtocoloDeVentas: TMenuItem
          Action = AProtocoloDeVentas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImgenesArtculos: TMenuItem
          Action = AImagenesArticulos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICondProveedores: TMenuItem
          Action = ACondicionesProv
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIHistPrecios: TMenuItem
          Action = AHistoricoPMP
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MSGCondicionesEspeciales: TMenuItem
          Action = ACondicionesEspeciales
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICierreyAperturadeStocks: TMenuItem
          Action = ACierreStocks
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIControlPlazas: TMenuItem
          Action = AControlPlazas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPreciosCoste: TMenuItem
          Action = APreciosCosteKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIRepUsuarioAlmacenes: TMenuItem
        Action = ARepUsuarioAlm
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGCompras: TMenuItem
      Caption = '&Compras'
      object MIPropuestas: TMenuItem
        Action = APropuestas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPropuestasConfirmadas: TMenuItem
        Action = APropuestasConfirm
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPedidosProv: TMenuItem
        Action = APedidosProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAlbaranesProv: TMenuItem
        Action = AAlbaranesProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacturasProv: TMenuItem
        Action = AFacturasProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacturasAcr: TMenuItem
        Action = AFacturasAcr
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador12: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRecepcionPedidos: TMenuItem
        Action = ARecepcionPedidos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacAlbaranesProv: TMenuItem
        Action = AFacAlbaranesProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacAlbaranesProvDet: TMenuItem
        Action = AFacAlbaranesProvDet
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICierraFactura: TMenuItem
        Action = ACierraFac
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIHistoricoProcesosProv: TMenuItem
        Action = AHistoricoProcesosProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITraspasoPedCliAPedProv: TMenuItem
        Action = ATraspasoPedCliAPedProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPropPedidos: TMenuItem
        Action = APropPedidos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProrrateoCostes: TMenuItem
        Action = AProrrateoCostes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador13: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPedidospendientesdeproveedor: TMenuItem
        Action = APedidosPendientesProv2
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIABCCompras: TMenuItem
        Action = AABCCompras
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIABCComprasKri: TMenuItem
        Action = AABCComprasKri
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProvArt: TMenuItem
        Action = AArtProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador14: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGListadosCompras: TMenuItem
        Caption = 'Listados'
        ImageIndex = 14
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIPedFueraPlazo: TMenuItem
          Action = APedFueraPlazo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPedidosCompraPendientes: TMenuItem
          Action = APedidosCompraPendientes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador15: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIComprasOtrasOpciones: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIAlarmasIberfluid: TMenuItem
          Action = AAlarmasIberfluidKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFacturaDirectaPro: TMenuItem
          Caption = 'Factura Directa'
          Hint = 'Facturas Directas y Abonos (Proveedores)'
          ImageIndex = 74
          Visible = False
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRepUsuarioCompras: TMenuItem
          Action = ArepUsuarioCompras
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFiltroAlbaranesCompra: TMenuItem
          Action = AFiltroAlbaranesCompra
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
    end
    object MGVentas: TMenuItem
      Caption = '&Ventas'
      Hint = 'Men'#250' de facturaci'#243'n'
      object MIOfertas: TMenuItem
        Action = AOfertas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPedidos: TMenuItem
        Action = APedidos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAlbaranes: TMenuItem
        Action = AAlbaranes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacturas: TMenuItem
        Action = AFacturas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador17: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIServirPedidosVenta: TMenuItem
        Action = AServirPedidosVenta
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAgrupacionPedidos: TMenuItem
        Action = AAgrupacionPedidos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador88: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGenerarFacturasElectrnicasES: TMenuItem
        Action = AGenerarFacturasElectronicasES
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIServirOfertasporLneas: TMenuItem
        Action = AAgrupacionOfertas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador89: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEnvioReparto: TMenuItem
        Action = AEnvioReparto
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImprimeCartadePortes: TMenuItem
        Action = AImprimeCartaPortes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacAlbaranes: TMenuItem
        Action = AFacAlbaranes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacAlbaranesCliDet: TMenuItem
        Action = AFacAlbaranesCliDet
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacturacionCuotas: TMenuItem
        Action = AFacCuotas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICierraFacturas: TMenuItem
        Action = ACierraFacturas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacHistProcesos: TMenuItem
        Action = AFacHistProcesos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador18: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICuotasClientes: TMenuItem
        Action = ACuotasClientes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador86: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRelacionPedidosVenta: TMenuItem
        Action = APedidosPendientesCli
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIABCVentas: TMenuItem
        Action = AABCVentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIABCVentasKri: TMenuItem
        Action = AABCVentasKri
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIClientesporArticulo: TMenuItem
        Action = AArtCli
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador19: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGListadosVentas: TMenuItem
        Caption = '&Listados'
        ImageIndex = 14
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIListadoOfertas: TMenuItem
          Action = AZLstOfertas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MiListarPed: TMenuItem
          Action = AImprimePedidos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListarAlb: TMenuItem
          Action = AImprimeAlbaranes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImprimeFacturas: TMenuItem
          Action = AImprimeFacturas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoCuota: TMenuItem
          Action = AListadoCuota
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPedidosVentaPendientes: TMenuItem
          Action = APedidosVentaPendientes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPedidosVentasPendientesTyC: TMenuItem
          Action = APedidosVentaPendientesTyC
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPedFueraPlazoCmp: TMenuItem
          Action = APedFueraPlazoVentas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAlbaranesdeVentaPendientes: TMenuItem
          Action = AAlbaranesVentaPendientes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador20: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIVentasOtrasOpciones: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIDividirFacturas: TMenuItem
          Action = ADividirFacturas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPartedeMovimientos: TMenuItem
          Action = AParteMovimiento
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAlquileres: TMenuItem
          Action = AAlquileres
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MGHojasDePreparacion: TMenuItem
          Caption = 'P&reparaci'#243'n Pedidos'
          Hint = 'Idiomas'
          ImageIndex = 36
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object MIAltaHojaPreparacion: TMenuItem
            Action = AAltaHojaDePreparacion
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIHojaDePreparacion: TMenuItem
            Action = AHojaDePreparacion
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIResponsableHojaDePreparacion: TMenuItem
            Action = AResponsableHojaDePreparacion
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
        end
        object MIPromocionesIndirectas: TMenuItem
          Action = APromocionesIndirectas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAgrupacionFac: TMenuItem
          Action = AAgrupacionFac
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFacDirecta: TMenuItem
          Caption = 'Factura Directa'
          Hint = 'Facturas sin detalle y abonos'
          ImageIndex = 74
          Visible = False
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAgrupaciondeAlbaranes: TMenuItem
          Action = AAgrupacionDeAlbaranesKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICaravanas: TMenuItem
          Action = ACaravanas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRepUsuarioVentas: TMenuItem
          Action = ARepUsuariosVentas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
    end
    object MGContabilidad: TMenuItem
      Caption = 'C&ontabilidad'
      Hint = 'Men'#250' de contabilidad'
      object MIContaBorrador: TMenuItem
        Action = AContaBorrador
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContaExtracto: TMenuItem
        Action = AContaExtracto
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContaMovimientos: TMenuItem
        Action = AContaMovimientos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContaDiario: TMenuItem
        Action = AContaDiario
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDiariodeCostes: TMenuItem
        Action = ADiarioCostes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContaPlantillas: TMenuItem
        Action = AContaPlantillas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPunteoAsientos: TMenuItem
        Action = APunteoAsientos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContaCierreYApertura: TMenuItem
        Action = AContaCierreYApertura
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEstructuraContableEmpresa: TMenuItem
        Action = AContaEstructura
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador21: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGImportarExportar: TMenuItem
        Caption = 'Importar/Exportar'
        ImageIndex = 36
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIImportarASI: TMenuItem
          Action = AImportarAsientos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIExportarASI: TMenuItem
          Action = AExportarAsientos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIExportarSaldos: TMenuItem
          Action = AExportarSaldos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador22: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPrevisiondecuentas: TMenuItem
        Action = APrevisionDeCuentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContaCuentas: TMenuItem
        Action = AContaCuentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITercerosCuentas: TMenuItem
        Action = ATercerosCuentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContaGrupoCuentas: TMenuItem
        Action = AContaGrupoCuentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPGC: TMenuItem
        Action = AContaPGC
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MILstCentroCoste: TMenuItem
        Action = ALstCentroCoste
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador23: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGResultados: TMenuItem
        Caption = 'Resultados'
        ImageIndex = 125
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIContaSumYSaldos: TMenuItem
          Action = AContaSumYSaldos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPregMayorCantidad: TMenuItem
          Action = APregMayorCantidad
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISaldos: TMenuItem
          Action = ASaldos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISumasySaldosConsolidados: TMenuItem
          Action = ASumasYSaldosKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMemoriaContable: TMenuItem
          Action = AMemoriaContable
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIContaCuentasAnuales: TMenuItem
          Action = AContaCuentasAnuales
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador24: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportacionNorma43: TMenuItem
        Action = ANorma43Kri
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador25: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGContabilidadOtrasOpciones: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIRectAsientos: TMenuItem
          Action = AContaRectAsientos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModificaPGC: TMenuItem
          Action = AModificaPGC
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImportacionNorma43SLucia: TMenuItem
          Action = ANorma43SLucia
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MGContabilidadAnaltica: TMenuItem
          Caption = 'Contabilidad Anal'#237'tica'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object MIPlanesContables: TMenuItem
            Action = AAnaPlanesContables
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MICentrosCoste: TMenuItem
            Action = AAnaCentrosCoste
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIPlantillasImputacion: TMenuItem
            Action = AAnaPlantillasImputacion
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIImputaciones: TMenuItem
            Action = AAnaImputacionesCostes
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MISeparador83: TMenuItem
            Caption = '-'
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIAnaExtractos: TMenuItem
            Action = AAnaExtracto
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIPropagaEstructuras: TMenuItem
            Action = AAnaPropagaEstructuras
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MISeparador84: TMenuItem
            Caption = '-'
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MSGListados: TMenuItem
            Caption = 'Listados'
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
            object MIPlanContableAnaltico: TMenuItem
              Action = AAnaLstPlanContableAnalitico
              OnDrawItem = OwnerDrawMenuItem
              OnMeasureItem = MeasureMenuItem
            end
            object MIAnaPresupuesto: TMenuItem
              Action = AAnaAnalisisPresupuesto
              OnDrawItem = OwnerDrawMenuItem
              OnMeasureItem = MeasureMenuItem
            end
            object MIAnaSumaYSaldos: TMenuItem
              Action = AAnaSumaYSaldos
              OnDrawItem = OwnerDrawMenuItem
              OnMeasureItem = MeasureMenuItem
            end
          end
        end
      end
      object MIRepUsuarioContabilidad: TMenuItem
        Action = ARepUsuarioConta
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGTesoreria: TMenuItem
      Caption = 'Te&sorer'#237'a'
      object MICartera: TMenuItem
        Action = ACartera
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListarRecibos: TMenuItem
        Action = AImprimeRecibos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPCRecAgrupados: TMenuItem
        Action = APCRecAgrupados
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRemesas: TMenuItem
        Action = ARemesas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINuevoRecibo: TMenuItem
        Action = ANuevoRecibo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAnticipos: TMenuItem
        Action = AAnticipos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRecibos: TMenuItem
        Action = ZARecibos
        Hint = 'Recibos para los ingresos. Rep. Dom.'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRecibosdeIngresosDesglosados: TMenuItem
        Action = ARecibosdeIngresosDesglosados
        Hint = 'Recibos de ingresos desglosados. Rep. Dom.'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDiariodeVentas: TMenuItem
        Action = ZADiarioVentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador31: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIBancos: TMenuItem
        Action = ABancos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRiesgosBancos: TMenuItem
        Action = ARiesgoBancos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRiesgosClientes: TMenuItem
        Action = ARiesgoClientes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListadoCaja: TMenuItem
        Action = ALSTIngresos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConfirming: TMenuItem
        Action = AConfirming
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIOrdenesdePago: TMenuItem
        Action = AOrdenesDePago
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITalones: TMenuItem
        Action = ATalones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITalonesCta: TMenuItem
        Action = ATalonesCta
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPagares: TMenuItem
        Action = APagares
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConciliacionBancaria: TMenuItem
        Action = AConciliacionBancaria
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDivilo: TMenuItem
        Action = ADivilo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador32: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListarCartera: TMenuItem
        Action = AListarCartera
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGestiondeCobros: TMenuItem
        Action = AGestionDeCobros
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGestionDocumentosPago: TMenuItem
        Action = AGestionDocumentosPago
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICompensaciondeRecibos: TMenuItem
        Action = ACompensacionRecibos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador33: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPrevisionTesoreria: TMenuItem
        Action = APrevisionTesoreria
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador34: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGTesoreriaOtrasOpciones: TMenuItem
        Caption = '&Otras Opciones'
        Hint = 'Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIAsignaBcoRemesa: TMenuItem
          Action = AAsignaBancoRemesa
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMuestraRecibos: TMenuItem
          Action = AMuestraRecibos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIRepUsuarioTesoreria: TMenuItem
        Action = ARepUsuarioTesoreria
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListarTalones: TMenuItem
        Action = ALSTTalones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListarCuadreCaja: TMenuItem
        Action = AListarCuadreCaja
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGImpuestosChile: TMenuItem
      Caption = '&SII DTE'
      object MIEnvioDTE: TMenuItem
        Action = AEnvioDTE
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object RCVCompra: TMenuItem
        Action = ARCVCompra
        ImageIndex = 61
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGImpuestos: TMenuItem
      Caption = '&Impuestos'
      object MIRegIVA: TMenuItem
        Action = ARegIVA
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador27: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MILSTIVAListado: TMenuItem
        Action = ALSTIVAListado
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDiarioIVA: TMenuItem
        Action = ADiarioIVA
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador28: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGHacienda: TMenuItem
        Caption = 'Hacienda'
        ImageIndex = 136
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIParametrosModelosdeHacienda: TMenuItem
          Action = AParamModelosHacienda
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPresentacionesHacienda: TMenuItem
          Action = APresentacionesHacienda
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModelo110: TMenuItem
          Action = AModelo110
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModelo115: TMenuItem
          Action = AModelo115
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MGModelo190: TMenuItem
          Caption = 'Modelo 190'
          ImageIndex = 136
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object ExportacionModelo190: TMenuItem
            Action = AExporta190
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object ListadoModelo190: TMenuItem
            Action = AModelo190
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
        end
        object MIModelo300: TMenuItem
          Action = AModelo300
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModelo303: TMenuItem
          Action = AModelo303
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModelo330: TMenuItem
          Action = AModelo330
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIExportacionModelo340: TMenuItem
          Action = AModelo340
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoModelo347: TMenuItem
          Action = AModelo347
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MGModelo349: TMenuItem
          Action = AExporta349
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModelo390: TMenuItem
          Action = AModelo390
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModelo592: TMenuItem
          Action = AModelo592
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MGIntrastat: TMenuItem
          Caption = 'Intrastat'
          ImageIndex = 136
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object MIIntrastatCompras: TMenuItem
            Action = AIntrastatCompras
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIIntrastatVentas: TMenuItem
            Action = AIntrastatVentas
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIIntrastat: TMenuItem
            Action = AIntrastat
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
        end
        object MISeparador30: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MGListConfigHacienda: TMenuItem
          Caption = 'Configuraci'#243'n R'#225'pida de Listados'
          ImageIndex = 77
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object MIListadoModelo110111: TMenuItem
            Action = AConfModelo110
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoModelo115: TMenuItem
            Action = AConfModelo115
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoModelo110: TMenuItem
            Action = AConfModelo190
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoModelo300: TMenuItem
            Action = AConfModelo300
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoModelo303: TMenuItem
            Action = AConfModelo303
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoModelo330: TMenuItem
            Action = AConfModelo330
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIConfModelo347: TMenuItem
            Action = AConfModelo347
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIListadoIntrastatComprasVentas: TMenuItem
            Action = AConfIntrastatCV
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
        end
      end
      object MGItbis: TMenuItem
        Caption = 'ITBIS'
        ImageIndex = 136
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIListadoITBIS: TMenuItem
          Action = AListadoITBIS
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIConsultadeItbis: TMenuItem
          Action = AConsultaITBIS
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISII: TMenuItem
        Action = ASII
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISIILROE: TMenuItem
        Action = ASIILROE
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIVerifactu: TMenuItem
        Action = AVerifactu
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador29: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRetEmpleados: TMenuItem
        Action = ARetEmpleados
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIVerificacionesImpuestos: TMenuItem
        Action = AVerificacionesImpuestos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object ECFVentas: TMenuItem
        Action = AECFVentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIECFCompras: TMenuItem
        Action = AECFCompras
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGInmovilizados: TMenuItem
      Caption = 'I&nmovilizados'
      object MIAmortizaciones: TMenuItem
        Action = AAmortizaciones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICentrosInventario: TMenuItem
        Action = ACentrosInventario
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGProduccionSimple: TMenuItem
      Caption = '&Produccion'
      object MIEscandalloProd: TMenuItem
        Action = AEscandalloProd
      end
      object MIOrdenProduccion: TMenuItem
        Action = AOrdenProduccion
      end
      object MIListNecesidades: TMenuItem
        Action = AListNecesidades
      end
      object MIProcesosProd: TMenuItem
        Action = AProcesosProd
      end
      object MIOrdenProduccionTallasKri: TMenuItem
        Action = AOrdenProduccionTallasKri
      end
    end
    object MGProduccion: TMenuItem
      Caption = '&Producci'#243'n'
      Hint = 'Men'#250' de producci'#243'n'
      object MIProMntEscandallo: TMenuItem
        Action = AProEscandalloSF
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProMntOfertasEscandallos: TMenuItem
        Action = AProOfertasE
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProEscandallos: TMenuItem
        Caption = 'Escandallos'
        Hint = 'Escandallos'
        ImageIndex = 10
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIProLstEscandallo: TMenuItem
          Action = AProLstEscandallo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MILstNecesidades: TMenuItem
          Action = ALstNecEsc
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProLstMatEsc: TMenuItem
          Action = AProLstMatEsc
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador85: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProLstOfertasEscandallo: TMenuItem
          Action = AProLstofertasE
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador40: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISubstituirComponentes: TMenuItem
          Action = AProSubsComponentes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPauta: TMenuItem
          Action = APauta
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador42: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIDespieceEnProduccion: TMenuItem
        Action = ADespiece
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDatosTecnicos: TMenuItem
        Action = ADatosTecnicos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador35: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProMntOrdenes: TMenuItem
        Action = AProOrden
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGProduccion: TMenuItem
        Caption = 'Producci'#243'n'
        Hint = 'Producci'#243'n'
        ImageIndex = 116
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIProGenerarOrdenes: TMenuItem
          Action = AProGenerarOrd
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProLanzarCerrarOrdenes: TMenuItem
          Action = AProGestionOrd
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIReclculos: TMenuItem
          Action = ARecalcular
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIDocumentos: TMenuItem
          Action = ADocumentos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProordtareaMat: TMenuItem
          Action = AProOrdTareaMat
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICierreParcialdeOrdendeProduccion: TMenuItem
          Action = ACierreParcialOrden
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MINecesidadesMateriaPrima: TMenuItem
          Action = ANecesidadMateraPrima
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITareasExternas: TMenuItem
          Action = AProTareasExternas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador43: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProLstOrdenes: TMenuItem
          Action = AProLstOrden
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProLstHojadeMontaje: TMenuItem
          Action = AProLstMontaje
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProLstNecesidades: TMenuItem
          Action = AProLstNecesidades
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProLstHojadeTrabajo: TMenuItem
          Action = AProLstHojaTrabajo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador36: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGProMarcajes: TMenuItem
        Caption = 'Marcajes'
        Hint = 'Marcajes'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIProOperario: TMenuItem
          Action = AProMarcajesOpe
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProMarcajesOperarioEspecial: TMenuItem
          Action = AProMarcajesOpeEsp
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProMaquinas: TMenuItem
          Action = AProMarcajesMaq
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProMaquinaEspecial: TMenuItem
          Action = AProMarcajesMaqEsp
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMaquinaEspecialTurno: TMenuItem
          Action = AProMarcajesMaqEspTurno
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProTrabajoExterior: TMenuItem
          Action = AProMarcajesTe
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProVarios: TMenuItem
          Action = AProMarcajesVa
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador44: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProRecogidadeMarcajes: TMenuItem
          Action = AProRecMarcajes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMarcajesDirectosaBD: TMenuItem
          Action = AProMarcajesBD
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador45: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProIncMateriales: TMenuItem
          Action = AProMatInc
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIDefectoMaterial: TMenuItem
          Action = AProDefecto
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador46: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProDiariodeMarcajes: TMenuItem
          Action = AProDiario
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProListadodemarcajes: TMenuItem
          Action = AProLstMarcajes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPantMarcajes: TMenuItem
          Action = AProPantMarcajes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIHojasdeTrabajo: TMenuItem
        Action = AHojaDeTrabajo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIIncidenciasMarcajes: TMenuItem
        Action = AIncidenciasMarcajes
        ImageIndex = 133
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador37: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMquinas: TMenuItem
        Action = AProMaquinas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMaquinasRevisin: TMenuItem
        Action = AProTMaquinaRevision
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador38: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPlanMaestroProduccion: TMenuItem
        Action = APlanMaestroProduccion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador39: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGProduccionOtrasOpciones: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MSGPlanificacin: TMenuItem
          Caption = 'Planificaci'#243'n'
          Hint = 'Planificaci'#243'n'
          ImageIndex = 137
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object MIPlanificaciones: TMenuItem
            Action = AProCabPlanificacion
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIPlanificacin: TMenuItem
            Action = AProPlanificar
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIDeslanzar: TMenuItem
            Action = AProDeslanza
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MITiposTareasManuales: TMenuItem
            Action = AProTipTareasMan
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MITareasManuales: TMenuItem
            Action = AProTareasMan
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MISeparador47: TMenuItem
            Caption = '-'
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MIDiagramaGantt: TMenuItem
            Action = AProDiagramaGantt
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
        end
        object MIGestionTareasProduccion: TMenuItem
          Action = AGestionTareasProduccion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProDesDespiece: TMenuItem
          Action = AProDesDespiece
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImportarEscProduccion: TMenuItem
          Action = AImportarEscProduccion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MGGarantias: TMenuItem
        Caption = 'Garantias'
        ImageIndex = 110
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIEscandalloGarantias: TMenuItem
          Action = AEscandalloGarantias
          OnDrawItem = OwnerDrawMenuItem
        end
        object MIAsignacionGarantias: TMenuItem
          Action = AAsignacionGarantias
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
    end
    object MGTPV: TMenuItem
      Caption = 'T&PV'
      object MISesionCajaTurno: TMenuItem
        Action = ASesionCajaTurno
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIVentasTPV: TMenuItem
        Action = AVentas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICajasEmpresa: TMenuItem
        Action = ACajasEmpresa
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFormasPagoTPV: TMenuItem
        Action = AFormaPagoTpv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFacturarTicketsTPV: TMenuItem
        Action = AFacturarTickets
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGDisenarInformeTPV: TMenuItem
        Caption = 'Dise'#241'ar informes'
        ImageIndex = 77
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIDisearTicket: TMenuItem
          Action = ADisenarTicket
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIDisearVale: TMenuItem
          Action = ADisenarVale
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIDisearTicketRecogida: TMenuItem
          Action = ADisenarTicketRecogida
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIConfiguracionTPV: TMenuItem
        Action = AConfiguracionTPV
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPorcentajeFacturacion: TMenuItem
        Action = APorcentajeFacturacion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITPVSincronizacion: TMenuItem
        Action = ATPVSincronizacion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITPVConfigSincronizacion: TMenuItem
        Action = ATPVConfigSincronizacion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGISO: TMenuItem
      Caption = 'IS&O'
      object MIMantenimientodeinformesNoconformidad: TMenuItem
        Action = AIsoMantInformes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDevoluciondematerial: TMenuItem
        Action = AIsoDevMat
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIClasificaciondeproveedores: TMenuItem
        Action = AIsoClassProv
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPunteosycierresdeinformesdeNoconformidad: TMenuItem
        Action = AIsoPunteos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador92: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFichaTecnica: TMenuItem
        Action = AIsoFichaTecnica
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIControlDeLosEquiposDeMedicion: TMenuItem
        Action = AIsoControlEquip
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICertificadoAnalisis: TMenuItem
        Action = AIsoCertificadoAnalisis
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador93: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEnsayos: TMenuItem
        Action = AIsoEnsayos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITiposEnsayo: TMenuItem
        Action = AIsoTipoEnsayo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINormativas: TMenuItem
        Action = AIsoNormativas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador91: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMantenimientodeFirmas: TMenuItem
        Action = AIsoFirmas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMantenimientotipoacciones: TMenuItem
        Action = AIsoMantTAcc
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAccionespreventivas: TMenuItem
        Action = AIsoAccPreventiva
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador90: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICursos: TMenuItem
        Action = AIsoCursos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPlandecapacitacinypolivalencia: TMenuItem
        Action = AIsoPlanCapac
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPlanning: TMenuItem
        Action = AIsoPlanning
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGCRM: TMenuItem
      Caption = 'C&RM'
      object MICRMContactos: TMenuItem
        Action = ACrmContactos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICRMConsultaAcciones: TMenuItem
        Action = ACrmConsultaAcciones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAcciones: TMenuItem
        Action = ACrmAcciones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICRMEmails: TMenuItem
        Action = ACrmEMails
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICRMImportarContactos: TMenuItem
        Action = ACrmImportarContactos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICrmImportarLocalidades: TMenuItem
        Action = ACrmImportarLocalidades
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador49: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGCRMOtrasOpciones: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIMarcajes: TMenuItem
          Action = ACrmMarcajes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMarcajesVentas: TMenuItem
          Action = ACrmVentas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICrmArticulos: TMenuItem
          Action = ACrmArticulos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MICRM: TMenuItem
        Action = ACRM
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGObras: TMenuItem
      Caption = 'O&bras'
      object MIObras: TMenuItem
        Action = AObrObras
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPartidas: TMenuItem
        Action = AObrPartidas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPlantillasdePartidas: TMenuItem
        Action = AObrPartidasPlantilla
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGGestionEtiquetas: TMenuItem
      Caption = 'Etiq&uetas'
      object MGMaestros: TMenuItem
        Caption = 'Maestros'
        ImageIndex = 21
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIDatosMaestros: TMenuItem
          Action = AMaestros
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMaquinas: TMenuItem
          Action = AMaquinas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITroqueles: TMenuItem
          Action = ATroqueles
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICilindros: TMenuItem
          Action = ACilindros
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEtiAnilox: TMenuItem
          Action = AEtiAnilox
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEtiColor: TMenuItem
          Action = AEtiColor
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIOrdenes: TMenuItem
        Action = AOrdenes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEtiquetas: TMenuItem
        Action = AEtiquetas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGPresupuestos: TMenuItem
        Caption = 'Presupuestos'
        ImageIndex = 73
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIPresupuestos: TMenuItem
          Action = APresupuestos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MILstPresupuestos: TMenuItem
          Action = ALstPresupuestos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador50: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConfiguracion: TMenuItem
        Action = AEtiConstantes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGColadas: TMenuItem
      Caption = 'Cola&das'
      object MIColadas: TMenuItem
        Action = AColadas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGGas: TMenuItem
      Caption = '&Gas'
      object MIGas: TMenuItem
        Action = AGas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDescargasGas: TMenuItem
        Action = ADescargasGas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITanque: TMenuItem
        Action = AGasTanque
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDispensador: TMenuItem
        Action = AGasDispensador
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIColaCamion: TMenuItem
        Action = AGasColaCamion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador51: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGasUtiles: TMenuItem
        Action = AGasUtiles
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGTyC: TMenuItem
      Caption = 'T&yC'
      object MIMantenimientoDeModelos: TMenuItem
        Action = ZAModelos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDatosDeModelos: TMenuItem
        Action = ZAModelosDet
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador52: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITarifasModelos: TMenuItem
        Action = ZATarifasModelos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConsultaTarifasModelos: TMenuItem
        Action = ZAConsultarTarifasModelos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportacionTarifasTyC: TMenuItem
        Action = AImportacionTarifasTyC
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador53: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDespiece: TMenuItem
        Action = ADespiece
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador54: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPedidosEspeciales: TMenuItem
        Action = ZAPedidosEsp
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIVerPedidosEspeciales: TMenuItem
        Action = ZAPedidosEspTodos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPedidosAAlbaran: TMenuItem
        Action = ZAPedidosAAlbaran
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador55: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIVerEstadodePedidosPorCliente: TMenuItem
        Action = ZAVerEstadoPedCli
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIVerEstadoDeOrdenesPorCliente: TMenuItem
        Action = ZAVerEstadoOrdenesCli
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador56: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMarcajesTyC: TMenuItem
        Action = ZAMarcajes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMarcajesManuales: TMenuItem
        Action = ZAMarcajeManual
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMarcajeManualDirecto: TMenuItem
        Action = ZAMarcManDirecto
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListadoDeTiemposDeMarcajeManual: TMenuItem
        Action = ZALstTiempoMarc
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador57: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGListadosTyC: TMenuItem
        Caption = '&Listados'
        ImageIndex = 14
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object ImprimirPedidosEspecialesPendientes1: TMenuItem
          Action = ZAImprimePedEspPdte
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object ListadodePedidosporEntrega1: TMenuItem
          Action = ZALstPedEntrega
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object VentasdePedidosporLineal1: TMenuItem
          Action = ZALstPedVenLin
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object ZALstFechaPrevProv1: TMenuItem
          Action = ZALstFechaPrevProv
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador58: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConfiguracionTyC: TMenuItem
        Action = ZAConfiguracion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador60: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGAuxiliaresTyC: TMenuItem
        Caption = 'Auxiliares TyC'
        ImageIndex = 119
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIDatosAuxiliares: TMenuItem
          Action = ZADatosAuxiliares
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantenimientoDeLonas: TMenuItem
          Action = ZALonas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFormasDeLona: TMenuItem
          Action = ZALonasForma
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantenimientoDeBambalinas: TMenuItem
          Action = ZABambalinas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantenimientoDeRibetes: TMenuItem
          Action = ZARibetes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIColoresTyC: TMenuItem
          Action = ZAColores
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEquivalenciaColoresTyC: TMenuItem
          Action = AEquivalenciaColores
          AutoHotkeys = maManual
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposDeConfiguracion: TMenuItem
          Action = ZATiposConfig
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador62: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPuestos: TMenuItem
          Action = ZAPuestos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoModelo: TMenuItem
          Action = ATipoModelo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposDeArticulo: TMenuItem
          Action = ZATiposArticulos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFechasAServirDeModelos: TMenuItem
          Action = ZAModelosFechas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MiSep87: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoColor_EnTyC: TMenuItem
          Action = ATipoColorTallas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIColores_EnTyC: TMenuItem
          Action = AColoresTallas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador61: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIOtrasOpciones1: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIPedidosMalCerrados: TMenuItem
          Action = ZAPedidosMalCerrados
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIVisualizarArticulos: TMenuItem
          Action = ZAArticulos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
    end
    object MGReparaciones: TMenuItem
      Caption = '&Reparaciones'
      object MIReparaciones: TMenuItem
        Action = AReparaciones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeriesCliente: TMenuItem
        Action = ASeriesCliente
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFichaTecnicaVehicular: TMenuItem
        Action = AFichaTecnica
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITipoReparacion: TMenuItem
        Action = ATipoReparacion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITipoActuacion: TMenuItem
        Action = ATipoActuacion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRecepcionFichaTecnica: TMenuItem
        Action = ARecepcionFichaTecnica
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDiariodeReparaciones: TMenuItem
        Action = ADiarioReparaciones
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGANDALplast: TMenuItem
      Caption = '&Moldes'
      object MIMoldes: TMenuItem
        Action = AMoldes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPostizos: TMenuItem
        Action = APostizos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MILstCostedeMercancaVendida: TMenuItem
        Action = ALstCosteVentasMP
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListadoArticulosCliente: TMenuItem
        Action = ALstArticulosCliente
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIOfertasANDALplast: TMenuItem
        Action = AOfertasANDALplast
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGEcommerce: TMenuItem
      Caption = '&eCommerce'
      object MISincronizaTienda: TMenuItem
        Action = ASincronizaTienda
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizaTiendaWoocommerce: TMenuItem
        Action = ASincronizaTiendaWoocommerce
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizaKri: TMenuItem
        Action = ASincronizarBasesKri
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizaIncidencias: TMenuItem
        Action = ASincronizaIncidencias
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEnviarDatosaWebPonys: TMenuItem
        Action = AEnviarDatosPonys
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizaTiendaMasYMasBarato: TMenuItem
        Action = ASincronizaTiendaMasYMasBarato
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIExportacionEuroPastry: TMenuItem
        Action = AExportacionEuroPastry
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIExportaClientes: TMenuItem
        Caption = '&Exportar Clientes'
        Hint = 'Exportar los clientes a fichero.'
        ImageIndex = 104
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRecepcionWeb: TMenuItem
        Action = ARecepcionWeb
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportarPedidos: TMenuItem
        Action = AImportarPedidos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportarDocumentos: TMenuItem
        Action = AImportarDocumentos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizacionTiendaPureWorks: TMenuItem
        Action = ASincronizacionTiendaPureWorks
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIExportacionHelios: TMenuItem
        Action = AExportacionHelios
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMaquinasVending: TMenuItem
        Action = AMaquinasVending
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportacionVending: TMenuItem
        Action = AImportacionVending
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object ExportacionTablasTyrsa1: TMenuItem
        Action = AExportacionTyrsa
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportacionDlivery: TMenuItem
        Action = AImportacionDlivery
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIImportacionMulty: TMenuItem
        Action = AImportacionMulty
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizacionEginer: TMenuItem
        Action = ASincronizacionEginer
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIBrevo: TMenuItem
        Action = ABrevo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizacionSkrit: TMenuItem
        Action = ASincronizacionSkrit
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizacionColon: TMenuItem
        Action = ASincronizacionColon
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizacionTyC: TMenuItem
        Action = ASincronizacionTyC
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISincronizacionHubSpot: TMenuItem
        Action = ASincronizacionHubSpot
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGListadosPers: TMenuItem
      Caption = 'Listados Personalizados'
      object MIImportaListados: TMenuItem
        Tag = -2
        Action = AImportaListados
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINuevoGrupoListados: TMenuItem
        Tag = -1
        Action = ANuevoGrupoListados
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGNominas: TMenuItem
      Caption = '&N'#243'minas'
      object MINominas: TMenuItem
        Action = ANominas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINominasConceptos: TMenuItem
        Action = ANominasConceptos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINominasConstantes: TMenuItem
        Action = ANominasConstantes
        Hint = 'Mantenimiento de las N'#243'minas en el Periodo'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINominasPlantilla: TMenuItem
        Action = ANominasPlantilla
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRHPersonas: TMenuItem
        Action = ARHPersona
        ImageIndex = 24
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINominasConceptosCHL: TMenuItem
        Action = ANominasConceptosCHL
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MINomina: TMenuItem
        Action = ANomina
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGEmpleados: TMenuItem
      Caption = '&Empleados'
      object MIEmpleados: TMenuItem
        Action = AOpeEmpleados
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGControlPresencia: TMenuItem
        Caption = 'Control &Presencia'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIPresencia: TMenuItem
          Action = APresencia
          Caption = 'Presencia de Empleados'
          Hint = 'Mantenimiento de Presencia de Empleados.'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPresenciaIncidencias: TMenuItem
          Action = APresenciaIncidencia
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPresenciaDispositivo: TMenuItem
          Action = APresenciaDispositivo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPresenciaTipoPresencia: TMenuItem
          Action = APresenciaTipoMarcaje
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador48: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPresenciaDiario: TMenuItem
          Action = APresenciaDiario
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoPresencia: TMenuItem
          Action = ALstPresencia
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoCalendarioLaboral: TMenuItem
          Action = ALstCalendarioLaboral
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador95: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImportacionFichajesDePresencia: TMenuItem
          Action = AImportacionFichajesDePresencia
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object JornadasHorariosCCostos1: TMenuItem
        Action = AJornada
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIHorario: TMenuItem
        Action = AOpeHorario
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGCalendario: TMenuItem
        Caption = '&Calendarios'
        Hint = 'Mantenimiento Calendarios'
        ImageIndex = 9
        OnClick = MGCalendarioClick
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MICalendario: TMenuItem
          Action = AOpeCalendario
          Hint = 'Mantenimiento calendario de la empresa.'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICalendarioEmpleado: TMenuItem
          Action = AOpeCalendarioEmp
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICalendarioZona: TMenuItem
          Action = ACalendarioZona
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
    end
    object MGEmpresas: TMenuItem
      Caption = '&Empresas'
      object MIEmpresas: TMenuItem
        Action = AEmpresas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIDashboard: TMenuItem
        Action = ADashboard
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador63: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGenEjercicios: TMenuItem
        Action = AGenEjercicios
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGenCanales: TMenuItem
        Action = AGenCanales
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGenSeries: TMenuItem
        Action = AGenSeries
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPropagacionEmpresa: TMenuItem
        Action = APropagaEmpresa
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGenPeriodos: TMenuItem
        Action = AGenPeriodos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEmpCanales: TMenuItem
        Action = AEmpCanales
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador64: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEmpFormasPago: TMenuItem
        Action = AFormasPago
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMonedasEmpresa: TMenuItem
        Action = AMonedasCuenta
        Caption = 'Cuentas Monedas'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador65: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIGenCampanyas: TMenuItem
        Action = ACampanyas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIProyectos: TMenuItem
        Action = AProyectos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRepartirHorasProyecto: TMenuItem
        Action = ARepartirHorasProyecto
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITiposDePortes: TMenuItem
        Action = ATipoPortes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRangosPortes: TMenuItem
        Action = ARangosPortes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador66: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGAsistentes: TMenuItem
        Caption = 'Asistentes'
        ImageIndex = 21
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIAsistenteEmpresa: TMenuItem
          Action = AAsistenteEmpresa
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAsistenteEjercicio: TMenuItem
          Action = AAsistenteEjercicio
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAsistenteTarifa: TMenuItem
          Action = AAsistenteTarifa
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIsistenteImportaciondeArticulos: TMenuItem
          Action = AAsistenteImpArticulos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIIdiomasArticulos: TMenuItem
          Action = AAsistenteImpIdiomaArticulos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAsistenteImportacionClientes: TMenuItem
          Action = AAsistenteImpClientes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAsistenteImportacionProveedores: TMenuItem
          Action = AAsistenteImpProveedores
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAsisteteImportacionAcreedores: TMenuItem
          Action = AAsistenteImpAcreedores
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITraspasoMulticanales: TMenuItem
          Action = ATraspasoMulticanales
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAsistenteImpModelos: TMenuItem
          Action = AAsistenteImpModelos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAsistenteImportacionStockMinMax: TMenuItem
          Action = AAsistenteImpStockMinMax
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIExtraccionDatos: TMenuItem
        Action = AExtraccionDatos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MSGEstadisticas: TMenuItem
        Caption = 'Estad'#237'sticas'
        Hint = 'Estad'#237'sticas'
        ImageIndex = 32
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIEmpresasABCVentas: TMenuItem
          Action = AABCVentas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEmpresasABCVentasAlb: TMenuItem
          Action = AABCVentasKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEmpresasABCCompras: TMenuItem
          Action = AABCCompras
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEmpresasABCComprasAlb: TMenuItem
          Action = AABCComprasKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEmpresasEstadisticasArt: TMenuItem
          Action = ALSTEstadisticasArt
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantenimientodeEstadsticas1: TMenuItem
          Action = AEstadisticas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEstadisticaTubosParis: TMenuItem
          Action = AEstadisticaTubosParis
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEstadisicasComparadas: TMenuItem
          Action = AEstadisitcasComparadas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEstadisticasSimples: TMenuItem
          Action = AEstadisticasSimples
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador67: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIEDI: TMenuItem
        Action = AEDI
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MITraspasoCondiciones: TMenuItem
        Action = ATraspaso
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador94: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGTransportistas: TMenuItem
        Caption = 'Transportistas'
        ImageIndex = 112
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MITransportistasSEUR: TMenuItem
          Action = ATransportistasSEUR
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITransportistasDHL: TMenuItem
          Action = ATransportistasDHL
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITransportistasIDRIL: TMenuItem
          Action = ATransportistasIDRIL
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MISeparador68: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIRegistroFitosanitario: TMenuItem
        Action = ARegistroFitosanitario
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MGEmpresasOtrasOpciones: TMenuItem
        Caption = '&Otras Opciones'
        ImageIndex = 99
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIPersonalUlises: TMenuItem
          Action = APersonalUlises
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICorreoEmpresa: TMenuItem
          Action = ACorreoEmpresa
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImportesMaximoPeriodo: TMenuItem
          Action = AImportesMaximoPeriodo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
    end
    object MGAuxiliares: TMenuItem
      Caption = 'Au&xiliares'
      Hint = 'Tablas auxiliares de la aplicaci'#243'n'
      object MGADR: TMenuItem
        Caption = 'A&DR'
        ImageIndex = 102
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIADRTipos: TMenuItem
          Action = AADRTipos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIADRClases: TMenuItem
          Action = AADRClases
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIADRCodigosDeTunel: TMenuItem
          Action = AADRTunelCodes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIADRGruposDeEmbalaje: TMenuItem
          Action = AADRPackingGroups
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIADRUNNumbers: TMenuItem
          Action = AADRUNNumbers
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIADRNaturalezasPeligro: TMenuItem
          Action = AADRNaturalezaPeligro
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIADRMedidasProteccion: TMenuItem
          Action = AADRMedidasProteccion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIListadoDeMateriasPeligrosas: TMenuItem
          Action = ALstMatPeligrosas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MGAuxiliaresAlmacen: TMenuItem
        Caption = '&Almac'#233'n'
        ImageIndex = 40
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIMarcas: TMenuItem
          Action = AMarcas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMarca: TMenuItem
          Action = AMarca
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantenimientodeSectoresdeAlmacen: TMenuItem
          Action = ASectorAlmacen
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICodigosBarras: TMenuItem
          Action = ACodigosBarras
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposArticulo: TMenuItem
          Action = ATiposArticulo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposBulto: TMenuItem
          Action = ATiposBulto
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMateriales: TMenuItem
          Action = AMateriales
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantenimientodeTipodeUbicacion: TMenuItem
          Action = ATipoUbicacion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MI0TipoUnidadLogistica1: TMenuItem
          Action = ATipoUnidadLogistica
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MINaturalezas: TMenuItem
          Action = ANaturalezaMat
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MiUbicacionesSimple: TMenuItem
          Action = AUbicacionesSimple
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIUnidades: TMenuItem
          Action = AUnidades
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantenimientodeAtributos: TMenuItem
          Action = AAtributos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICaracteristicasArticulo: TMenuItem
          Action = ACaracteristicasArticulo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MSGContables: TMenuItem
        Caption = '&Contables'
        ImageIndex = 30
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIContaDefBalances: TMenuItem
          Action = AContaDefBalances
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIBalancesCab: TMenuItem
          Action = AContaDefBalancesCAB
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICentroDeCostes: TMenuItem
          Action = ACentroDeCostos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIConceptos: TMenuItem
          Action = AContaConceptos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIParamApuntes: TMenuItem
          Action = AParamApuntes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIDivisiones: TMenuItem
          Action = ADivisionesMaestros
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEquivalencias: TMenuItem
          Action = AEquivalencias
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIContaEstructura: TMenuItem
          Action = AContaEstructura
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIGestiones: TMenuItem
          Action = AGestions
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISysCuentas: TMenuItem
          Action = ASysCuentas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoAsiento: TMenuItem
          Action = ATipoAsiento
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRecalculaContabilidad: TMenuItem
          Action = ARecalculaContabilidad
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRenumera: TMenuItem
          Action = ARenumeraContabilidad
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIMGAuxiliaresCRM: TMenuItem
        Caption = 'C&RM'
        ImageIndex = 54
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MICRMAmbitos: TMenuItem
          Action = ACrmAmbitos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICRMConfiguracion: TMenuItem
          Action = ACrmConfiguracion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICRMOrigenRel: TMenuItem
          Action = ACrmOrigenRel
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRutasAgente: TMenuItem
          Action = ARutasAgente
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICRMTipoAcciones: TMenuItem
          Action = ACrmTipoAcciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICRMTipoSeguimiento: TMenuItem
          Action = ACrmTipoSeguimiento
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICRMAsuntos: TMenuItem
          Action = ACrmAsuntos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MSGEmpleados: TMenuItem
        Caption = '&Empleados'
        Hint = 'Empleados'
        ImageIndex = 135
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MICategoriasEmpleado: TMenuItem
          Action = AOpeCategoria
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICentrosdeTrabajo: TMenuItem
          Action = AOpeCTrabajo
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIDepartamentos1: TMenuItem
          Action = AOpeDepartamento
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposEstadoMarcajePedidos: TMenuItem
          Action = AOpeEstadoMarcajePedido
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImputaciones1: TMenuItem
          Action = AOpeImputaciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISecciones: TMenuItem
          Action = AOpeSecciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposDeContrato: TMenuItem
          Action = AOpeTContrato
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposDeImputacion: TMenuItem
          Action = AOpeTImputacion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MSGGestion: TMenuItem
        Caption = '&Gesti'#243'n'
        ImageIndex = 50
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIAgrupaciones: TMenuItem
          Action = AAGrupaciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIGenBancos: TMenuItem
          Action = AGenBancos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICajasSistema: TMenuItem
          Action = ACajasSistema
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMantinimientodeDepartamentos1: TMenuItem
          Action = ADepartamento
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFormaPago: TMenuItem
          Action = AFormaPago
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMatriculas: TMenuItem
          Action = AMatriculas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIOrdenPromociones: TMenuItem
          Action = AOrdenPromocion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPeriodoFacturacion: TMenuItem
          Action = APeriodoFacturacion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPlazosGarantia: TMenuItem
          Action = APlazosGarantia
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProtocolos1: TMenuItem
          Action = AProtocolosDeVenta
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposAcreedor: TMenuItem
          Action = ATiposAcreedor
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposEfectos: TMenuItem
          Action = ATiposEfectos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposdeIncidencia1: TMenuItem
          Action = ATipoIncidenciaKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposdeLneadeVenta1: TMenuItem
          Action = ATipoLineaVenta
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIZonas: TMenuItem
          Action = AZonas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICategoriasdeCliente: TMenuItem
          Action = ACategoriaCliente
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRazones: TMenuItem
          Action = ARazones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMotivosAbono: TMenuItem
          Action = AMotivosAbono
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIComoNosConocieron: TMenuItem
          Action = AComoNosConocieron
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador69: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIGruposIncoterm: TMenuItem
          Action = AGruposIncoterm
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICodigosIncoterm: TMenuItem
          Action = ACodigosIncoterm
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MSGImpuestos: TMenuItem
        Caption = '&Impuestos'
        ImageIndex = 136
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MITiposNCF: TMenuItem
          Action = ATipoNCF
          Hint = 'Configuracion de Tipos de NCF Rep. Dom.'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIContadoresNCF2: TMenuItem
          Action = ZASysNCF
          Hint = 'Mantenimientos de contadores NCF. Rep. Dom.'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposRetencion: TMenuItem
          Action = ATipoRetencion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIContaCuentasIRPF: TMenuItem
          Action = AContaCuentasIRPF
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIContaCuentasIVA: TMenuItem
          Action = AContaCuentasIVA
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIModosIVA: TMenuItem
          Action = AModoIva
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposIVA: TMenuItem
          Action = ATipoIva
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoIrpf: TMenuItem
          Action = ATipoIrpf
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MINumerosDeAutorizacion: TMenuItem
          Action = ANumerosDeAutorizacion
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoImpuestoAdicional: TMenuItem
          Action = ATipoImpuestoAdicional
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MGSII: TMenuItem
          Caption = 'SII'
          ImageIndex = 21
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
          object MISIICertificadoDigital: TMenuItem
            Action = ASIICertificadoDigital
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MISIIFolios: TMenuItem
            Action = ASIIFolios
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MISIIUrlEndpoint: TMenuItem
            Action = ASIIUrlEndpoint
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MISIIConfCorreos: TMenuItem
            Action = ASIIConfCorreos
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
          object MISIITipoDTE: TMenuItem
            Action = ASIITipoDTE
            OnDrawItem = OwnerDrawMenuItem
            OnMeasureItem = MeasureMenuItem
          end
        end
        object MIDGII: TMenuItem
          Caption = 'DGII'
          object MIConfiguracionEnvio: TMenuItem
            Action = ADGIIConfiguracionEnvio
          end
        end
      end
      object MSGLocalidades: TMenuItem
        Caption = '&Localidades'
        ImageIndex = 81
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MITiposDir: TMenuItem
          Action = ATiposDir
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIClasesdeDirecciones: TMenuItem
          Action = AClasesDirecciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MILocalidades: TMenuItem
          Action = ALocalidades
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProvincias: TMenuItem
          Action = AProvincias
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRegiones: TMenuItem
          Action = ARegiones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPoblaciones: TMenuItem
          Action = APoblaciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPaises: TMenuItem
          Action = APaises
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MSGMonedas: TMenuItem
        Caption = '&Monedas'
        ImageIndex = 56
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MICamMonCartera: TMenuItem
          Action = ACamMonCartera
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICambioMonedas: TMenuItem
          Action = ACambioMonedas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMonedas: TMenuItem
          Action = AMonedas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIMonedasMaestros: TMenuItem
          Action = AMonedasMaestros
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposMoneda: TMenuItem
          Action = ATiposMoneda
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MGAuxiliaresProduccion: TMenuItem
        Caption = '&Producci'#243'n'
        Hint = 'Auxiliares'
        ImageIndex = 116
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MITipoMquina: TMenuItem
          Action = AProTMaquina
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoRevisionesMquina: TMenuItem
          Action = AProTipoRevMaq
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoIncidenciaMaq: TMenuItem
          Action = ATipoIncidenciaMaq
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoIncidenciaRep: TMenuItem
          Action = ATipoIncidenciaRep
          Caption = 'Tipo Incidencia &Reparaci'#243'n'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador73: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICausas: TMenuItem
          Action = AProCausas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIProConfiguracinRecogida: TMenuItem
          Action = AProConfigMarcajes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITiposDefecto: TMenuItem
          Action = AProTiposDefecto
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoDeMarcajes: TMenuItem
          Action = AProTipoMarcajes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITurnos: TMenuItem
          Action = AProTurnos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador74: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIAgrupacindeRecursoPorEscandallo: TMenuItem
          Action = AAgrupaRecEsc
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFases: TMenuItem
          Action = AProFases
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITareas: TMenuItem
          Action = AProTareas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoControl: TMenuItem
          Action = APauta_TipoControl
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRecursos: TMenuItem
          Action = AProRecursos
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIUtillajes: TMenuItem
          Action = AProUtillajes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador75: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIEquivalnciaArticulos: TMenuItem
          Action = AProEquivalArt
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIRelacinDeUds: TMenuItem
          Action = AProRelacionUds
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIFrmulas: TMenuItem
          Action = AProFormulas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador76: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoDePieza: TMenuItem
          Action = AProDesTipoPieza
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoMaterial: TMenuItem
          Action = AProDesTipoMat
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador77: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIUtiles: TMenuItem
          Action = AProUtiles
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MSGSistema: TMenuItem
        Caption = '&Sistema'
        ImageIndex = 97
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIUsuarios: TMenuItem
          Action = AUsuarios
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIUsuariosWeb: TMenuItem
          Action = AUsuariosWeb
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPerfilesUsuario: TMenuItem
          Action = APerfilesUsuario
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICambiodeclavedeusuario: TMenuItem
          Action = AUsuarioCambiaClave
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador70: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeries: TMenuItem
          Action = ASeries
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MICanales: TMenuItem
          Action = ACanales
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPeriodosSistema: TMenuItem
          Action = APeriodosSistema
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIPerfiles: TMenuItem
          Action = APerfiles
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIUbicaciones: TMenuItem
          Action = AUbicaciones
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador71: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIImagenes: TMenuItem
          Action = AImagenes
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIGaleriadeImagenes: TMenuItem
          Action = AGaleriaImagen
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MISeparador72: TMenuItem
          Caption = '-'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIIdiomas: TMenuItem
          Action = AIdiomasKri
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MGAuxiliaresTallas: TMenuItem
        Caption = '&Tallas y Colores'
        ImageIndex = 109
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIGruposTallas: TMenuItem
          Action = AGruposTallas
          Hint = 'Mantenimiento de grupos de tallas.'
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MITipoColorTallas: TMenuItem
          Action = ATipoColorTallas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIColoresTallas: TMenuItem
          Action = AColoresTallas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIParametrizaciondeTallas: TMenuItem
          Action = AParametrizacionTallas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIKitTallas: TMenuItem
          Action = AKitTallas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIArticuloModeloGenero: TMenuItem
          Action = AArtModGenero
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
        object MIArtModTemporada: TMenuItem
          Action = AArtModTemporada
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
    end
    object MGUtilidades: TMenuItem
      Caption = #218'&tiles'
      Hint = #218'tiles'
      object MIContadores: TMenuItem
        Action = AContadores
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIContRecuperacion: TMenuItem
        Action = AContRecuperacion
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador78: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIListador: TMenuItem
        Action = AListador
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConfiguracionTextos: TMenuItem
        Action = AConfigTextos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador79: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICambiorpidodeEjercicio: TMenuItem
        Action = ACambioEmpresaEjerCanal
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICambiaUser: TMenuItem
        Action = ACambiaUser
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MICambioIdioma: TMenuItem
        Action = ACambioIdioma
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador80: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIINI: TMenuItem
        Action = AConfINI
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAbreINI: TMenuItem
        Action = AAbreINI
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador81: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConfig: TMenuItem
        Action = AConfig
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISMSPubli: TMenuItem
        Action = ASMSPubli
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAuditora: TMenuItem
        Action = AAuditoria
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MISeparador82: TMenuItem
        Caption = '-'
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAjustes: TMenuItem
        Action = AAjustes
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAvisos: TMenuItem
        Action = AAvisos
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIReestablecerConexionesWEB: TMenuItem
        Action = AReestablecerConexionesWEB
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIConfigServidoresCorreo: TMenuItem
        Action = AConfigServidoresCorreo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGImpresoras: TMenuItem
      Caption = '&Impresoras'
      object MGLaser: TMenuItem
        Caption = '&Laser'
        ImageIndex = 14
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIRefrescarLista1: TMenuItem
          Action = ARefrescarImpresoras
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MGMatricial: TMenuItem
        Caption = '&Matricial'
        ImageIndex = 14
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIRefrescarLista2: TMenuItem
          Action = ARefrescarImpresoras
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MGEtiquetas: TMenuItem
        Caption = '&Etiquetas'
        ImageIndex = 95
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MIRefrescarLista3: TMenuItem
          Action = ARefrescarImpresoras
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MGBandejaLaser: TMenuItem
        Caption = 'Bandeja Laser'
        ImageIndex = 87
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
        object MERefrescarBandejas: TMenuItem
          Action = ARefrescarBandejas
          OnDrawItem = OwnerDrawMenuItem
          OnMeasureItem = MeasureMenuItem
        end
      end
      object MIConfiguarImpresora: TMenuItem
        Action = ACFGPrint
        ImageIndex = 77
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGAyuda: TMenuItem
      Caption = 'Ayu&da'
      object MIAcerca: TMenuItem
        Action = AAcerca
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIAyudaenLinea: TMenuItem
        Action = AAyudaenLinea
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MiPrueba: TMenuItem
        Action = APruebas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MGVentanas: TMenuItem
      Caption = '&Ventanas'
      object MICierraTodas: TMenuItem
        Action = ACierraTodas
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIFondo: TMenuItem
        Action = AFondo
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIMuestraMenu: TMenuItem
        Action = AMuestraMenu
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
      object MIPresenciaFichar: TMenuItem
        Action = APresenciaFichar
        OnDrawItem = OwnerDrawMenuItem
        OnMeasureItem = MeasureMenuItem
      end
    end
    object MISalir: TMenuItem
      Action = ASalir
    end
  end
  object IOFBusqueda: TIOFFind
    Database = DMMain.DataBase
    LocateOptions = []
    TableName = 'SYS_TERCEROS'
    Filtros = []
    Left = 8
    Top = 104
  end
  object PopupTarifas: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 256
    Top = 104
    object PMITarifas: TMenuItem
      Action = ATarifas
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMITiposCalculo: TMenuItem
      Action = ATiposCalculo
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMITarifasProveedor: TMenuItem
      Action = ATarifasProveedor
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object PopupHacienda: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 224
    Top = 200
    object PMIParametrosModelosdeHacienda: TMenuItem
      Action = AParamModelosHacienda
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIModelo110: TMenuItem
      Action = AModelo110
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIModelo115: TMenuItem
      Action = AModelo115
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIModelo300: TMenuItem
      Action = AModelo300
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIModelo303: TMenuItem
      Action = AModelo303
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIModelo330: TMenuItem
      Action = AModelo330
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIListadoModelo190: TMenuItem
      Action = AModelo190
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIExportacionModelo190: TMenuItem
      Action = AExporta190
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIExportacionModelo340: TMenuItem
      Action = AModelo340
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIListadoModelo347: TMenuItem
      Action = AModelo347
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIExportacionModelo349: TMenuItem
      Action = AExporta349
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIIntrastatCompras: TMenuItem
      Action = AIntrastatCompras
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIIntrastatVentas: TMenuItem
      Action = AIntrastatVentas
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object PopupTalones: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 256
    Top = 232
    object PMITalones: TMenuItem
      Action = ATalones
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMITalonesCta: TMenuItem
      Action = ATalonesCta
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIPagares: TMenuItem
      Action = APagares
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object PopupFamilias: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 224
    Top = 104
    object PMIFamilias: TMenuItem
      Action = AFamilias
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIIncrementoPorcentual: TMenuItem
      Action = AIncrementoPorcentual
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object PopupCondiciones: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 288
    Top = 104
    object PMICondicionesEsp: TMenuItem
      Action = ACondicionesEspeciales
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMICondicionesProv: TMenuItem
      Action = ACondicionesProv
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMICondAgeCli: TMenuItem
      Action = ACondAgeCli
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMICondAgeAgrup: TMenuItem
      Action = ACondAgeAgrup
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object PopupNroSerieKri: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 320
    Top = 104
    object PMINroSerie: TMenuItem
      Action = AConsultaNroSerieKri
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIMantenimientodeNroSerie: TMenuItem
      Action = AMantenimientoNroSerie
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object frOpenDBDialog1: TfrOpenDBDialog
    Left = 80
    Top = 168
  end
  object PopUpMultiCambioEjercicio: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 8
    Top = 72
    object MICambiarUsuario: TMenuItem
      Action = ACambiaUser
    end
  end
  object PopupConfirmingOrdPago: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 224
    Top = 232
    object PMIConfirming: TMenuItem
      Action = AConfirming
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIOrdenesdePago: TMenuItem
      Action = AOrdenesDePago
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object PopupClientesKri: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 224
    Top = 72
    object PMIClientes: TMenuItem
      Action = AClientes
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIClientesPotenciales: TMenuItem
      Action = AClientesPotencialesKri
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object ALEditorRichText: TActionList
    Images = DMMain.ToolbarImages
    Left = 144
    Top = 104
    object RichEditBold1: TRichEditBold
      Category = 'Format'
      AutoCheck = True
      Caption = '&Negrita'
      Hint = 'Negrita'
      ImageIndex = 8
      ShortCut = 16450
    end
    object RichEditItalic1: TRichEditItalic
      Category = 'Format'
      AutoCheck = True
      Caption = '&Cursiva'
      Hint = 'Cursiva'
      ImageIndex = 9
      ShortCut = 16457
    end
    object RichEditUnderline1: TRichEditUnderline
      Category = 'Format'
      AutoCheck = True
      Caption = '&Subrayado'
      Hint = 'Subrayado'
      ImageIndex = 10
      ShortCut = 16469
    end
    object RichEditBullets1: TRichEditBullets
      Category = 'Format'
      AutoCheck = True
      Caption = '&Vi'#241'eta'
      Hint = 'Vi'#241'eta|Inserta un punto de vi'#241'eta en la l'#237'nea actual'
      ImageIndex = 14
    end
    object RichEditAlignLeft1: TRichEditAlignLeft
      Category = 'Format'
      AutoCheck = True
      Caption = 'Alineamiento &Izquierda'
      Hint = 'Alineamiento Izquierda|Alinea el texto a la sangr'#237'a izquierda'
      ImageIndex = 11
    end
    object RichEditAlignRight1: TRichEditAlignRight
      Category = 'Format'
      AutoCheck = True
      Caption = 'Align &Right'
      Hint = 'Alineamiento Derecha|Alinea el texto a la sangr'#237'a derecha'
      ImageIndex = 13
    end
    object RichEditAlignCenter1: TRichEditAlignCenter
      Category = 'Format'
      AutoCheck = True
      Caption = '&Centrar'
      Hint = 'Centrar|Centra el texto entre m'#225'rgenes'
      ImageIndex = 12
    end
  end
  object TAvisoMensaje: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TAvisoMensajeTimer
    Left = 48
    Top = 72
  end
  object TAviso: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TAvisoTimer
    Left = 80
    Top = 72
  end
  object PMProListados: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 256
    Top = 264
    object PMILstEscandallo: TMenuItem
      Action = AProLstEscandallo
    end
    object PMILstOrdenes: TMenuItem
      Action = AProLstOrden
    end
    object PMIstNecesidades: TMenuItem
      Action = AProLstNecesidades
    end
    object PMILstHojadeMontaje: TMenuItem
      Action = AProLstMontaje
    end
    object PMILstMarcajes: TMenuItem
      Action = AProLstMarcajes
    end
  end
  object PMProMarcajes: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 224
    Top = 264
    object PMIOperario: TMenuItem
      Action = AProMarcajesOpe
    end
    object PMIMaquinas: TMenuItem
      Action = AProMarcajesMaq
    end
    object PMIExterno: TMenuItem
      Action = AProMarcajesTe
    end
    object PMIVarios: TMenuItem
      Action = AProMarcajesVa
    end
  end
  object PopupABCCompras: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 224
    Top = 136
    object PMIABCsdeCompras: TMenuItem
      Action = AABCCompras
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIABCsdeComprasxAlb: TMenuItem
      Action = AABCComprasKri
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object PopupABCVentas: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    OwnerDraw = True
    Left = 224
    Top = 168
    object PMIABCdeVentas: TMenuItem
      Action = AABCVentas
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
    object PMIABCdeVentasxAlb: TMenuItem
      Action = AABCVentasKri
      OnDrawItem = OwnerDrawMenuItem
      OnMeasureItem = MeasureMenuItem
    end
  end
  object TVerificaEntrada: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TVerificaEntradaTimer
    Left = 48
    Top = 104
  end
  object TTerminarAplicacion: TTimer
    Enabled = False
    OnTimer = TTerminarAplicacionTimer
    Left = 80
    Top = 104
  end
  object TVerificarServidor: TTimer
    Enabled = False
    OnTimer = TVerificarServidorTimer
    Left = 48
    Top = 136
  end
  object TVerificarImpresora: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TVerificarImpresoraTimer
    Left = 80
    Top = 136
  end
  object TmrVerificaVerifactu: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TmrVerificaVerifactuTimer
    Left = 48
    Top = 168
  end
end
