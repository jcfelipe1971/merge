inherited FMConfiguracionTPV: TFMConfiguracionTPV
  Left = 381
  Top = 246
  Caption = 'Configuraci'#243'n TPV'
  ClientHeight = 367
  ClientWidth = 942
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 942
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 938
      inherited NavMain: THYMNavigator
        Width = 112
        DataSource = DMConfiguracionTPV.DSQMConfiguracion
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBECliente
      end
      inherited TSepNav: TToolButton
        Left = 112
      end
      inherited EPMain: THYMEditPanel
        Left = 120
        Width = 23
        DataSource = DMConfiguracionTPV.DSQMConfiguracion
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 143
      end
      inherited TbuttComp: TToolButton
        Left = 151
      end
      object PNLTitiSerie: TLFPanel
        Left = 174
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 12
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object ETitSerie: TLFEdit
          Left = 110
          Top = 0
          Width = 160
          Height = 21
          TabStop = False
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
          TabOrder = 0
        end
        object EFSerie: TLFEditFind2000
          Left = 39
          Top = 0
          Width = 70
          Height = 21
          TabStop = False
          AutoSize = False
          TabOrder = 1
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
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 938
      Height = 313
      ActivePage = TSConfiguracion
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSConfiguracion: TTabSheet
        Caption = 'Configuraci'#243'n'
        object PEdit: TLFPanel
          Left = 0
          Top = 0
          Width = 930
          Height = 285
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LDiasCaducidadRemesa: TLFLabel
            Left = 25
            Top = 161
            Width = 114
            Height = 13
            Caption = 'D'#237'as caducidad reserva'
          end
          object LDiasCaducidadVales: TLFLabel
            Left = 6
            Top = 183
            Width = 133
            Height = 13
            Caption = 'Dias caducidad Vales/Entre'
          end
          object LDiasPropuestaPedidos: TLFLabel
            Left = 28
            Top = 205
            Width = 111
            Height = 13
            Caption = 'Dias propuesta pedidos'
          end
          object LFPPorDefecto: TLFLabel
            Left = 11
            Top = 227
            Width = 128
            Height = 13
            Caption = 'Forma de pago por defecto'
          end
          object LFPAbonos: TLFLabel
            Left = 45
            Top = 249
            Width = 94
            Height = 13
            Caption = 'Forma pago abonos'
          end
          object LCliente: TLFLabel
            Left = 107
            Top = 29
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LControlStock: TLFLabel
            Left = 77
            Top = 51
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Control stock'
          end
          object LAcreedor: TLFLabel
            Left = 96
            Top = 73
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acreedor'
          end
          object LCanalFraccion: TLFLabel
            Left = 71
            Top = 95
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal fracci'#243'n'
          end
          object LLimiteFraccion: TLFLabel
            Left = 69
            Top = 117
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'mite fracci'#243'n'
          end
          object LCuentaVales: TLFLabel
            Left = 77
            Top = 139
            Width = 62
            Height = 13
            Caption = 'Cuenta vales'
          end
          object DBETituloControlStock: TLFDbedit
            Left = 225
            Top = 47
            Width = 230
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMConfiguracionTPV.DSxTiposStock
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBCFacturarSesAuto: TLFDBCheckBox
            Left = 480
            Top = 27
            Width = 210
            Height = 17
            Caption = 'Facturar sesi'#243'n autom'#225'tica'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURAR'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCAgrupaTickets: TLFDBCheckBox
            Left = 480
            Top = 49
            Width = 210
            Height = 17
            Caption = 'Agrupar Tickets'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 16
            TabStop = True
            OnClick = DBCAgrupaTicketsClick
            Alignment = taLeftJustify
            DataField = 'UNICA_FAC'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCImprimeRolloHacienda: TLFDBCheckBox
            Left = 480
            Top = 71
            Width = 210
            Height = 17
            Caption = 'Imprimir rollo de hacienda'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ROLLO_HACIENDA'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCObligaTicketDev: TLFDBCheckBox
            Left = 480
            Top = 93
            Width = 210
            Height = 17
            Caption = 'Obliga ticket en devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 18
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OBLIGA_TICKET_DEVOLUCION'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCObligaArtEnDev: TLFDBCheckBox
            Left = 480
            Top = 115
            Width = 210
            Height = 17
            Caption = 'Obliga art'#237'culos en devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 19
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OBLIGA_ARTICULOS_DEVOLUCION'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCGeneraValeDev: TLFDBCheckBox
            Left = 480
            Top = 137
            Width = 210
            Height = 17
            Caption = 'Genera vale en devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 20
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GENERA_VALE_DEVOLUCION'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCObligaFPDev: TLFDBCheckBox
            Left = 480
            Top = 159
            Width = 210
            Height = 17
            Caption = 'Obliga Forma de pago devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 21
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OBLIGA_FP_DEVOLUCION'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCDesplegaBusqVales: TLFDBCheckBox
            Left = 480
            Top = 181
            Width = 210
            Height = 17
            Caption = 'Desplegar busquedas Vales/Entre'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DESPLEGAR_BUSQUEDA_VALES'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCUsarMediosVales: TLFDBCheckBox
            Left = 480
            Top = 203
            Width = 210
            Height = 17
            Caption = 'Usar medios vales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 23
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'USAR_MEDIOS_VALES'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCUsarMediasEntregas: TLFDBCheckBox
            Left = 480
            Top = 225
            Width = 225
            Height = 17
            Caption = 'Usar medias entregas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 24
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'USAR_MEDIAS_ENTREGAS'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCAutoGrabarCabTicket: TLFDBCheckBox
            Left = 696
            Top = 27
            Width = 225
            Height = 17
            Caption = 'Auto grabar cabecera ticket'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 25
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'AUTO_GRABA_CABECERA'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCFacPriorizaFP: TLFDBCheckBox
            Left = 696
            Top = 49
            Width = 225
            Height = 17
            Caption = 'Fact. Prioriza por Formas de Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 26
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PRIORIZA_FP'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCFacPrioPorStock: TLFDBCheckBox
            Left = 696
            Top = 71
            Width = 225
            Height = 17
            Caption = 'Fact. Prioriza por Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 27
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PRIORIZA_STK'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCFacPorImportes: TLFDBCheckBox
            Left = 696
            Top = 93
            Width = 225
            Height = 17
            Caption = 'Facturaci'#243'n por importes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 28
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'POR_IMPORTES'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCFacPorLineas: TLFDBCheckBox
            Left = 696
            Top = 115
            Width = 225
            Height = 17
            Caption = 'Facturaci'#243'n por lineas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 29
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURACION_POR_LINEAS'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCRegulMovStock: TLFDBCheckBox
            Left = 696
            Top = 137
            Width = 225
            Height = 17
            Caption = 'Regula movimiento Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'REGULA_MOV_STOCK'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCObligaClienteConcretoEnPagos: TLFDBCheckBox
            Left = 696
            Top = 159
            Width = 225
            Height = 17
            Caption = 'Obliga cliente concreto en pagos T. Cred.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OBLIGA_CLIENTE_CONCRETO'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCPermiteTicketConValorCero: TLFDBCheckBox
            Left = 696
            Top = 181
            Width = 225
            Height = 17
            Caption = 'Permite tickets con valor cero'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 32
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CERRAR_TICKET_PRECIO_0'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDiasCaducidadReservas: TLFDbedit
            Left = 142
            Top = 157
            Width = 40
            Height = 21
            DataField = 'DIAS_CADUCIDAD_RESERVA'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 10
          end
          object DBEDiasCaducidadVales: TLFDbedit
            Left = 142
            Top = 179
            Width = 40
            Height = 21
            DataField = 'DIAS_CADUCIDAD_VALES'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 11
          end
          object DBEDiasPropuestaPedido: TLFDbedit
            Left = 142
            Top = 201
            Width = 40
            Height = 21
            DataField = 'DIAS_PROPUESTA_PEDIDO'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 12
          end
          object DBEFPPorDefecto: TLFDBEditFind2000
            Left = 142
            Top = 223
            Width = 40
            Height = 21
            DataField = 'FORMA_PAGO_TICKET'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 13
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFPAbonos: TLFDBEditFind2000
            Left = 142
            Top = 245
            Width = 40
            Height = 21
            DataField = 'FORMA_PAGO_ABONO'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 14
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECliente: TLFDBEditFind2000
            Left = 143
            Top = 25
            Width = 80
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 0
            OnChange = DBEClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEControlStock: TLFDBEditFind2000
            Left = 143
            Top = 47
            Width = 80
            Height = 21
            DataField = 'CONTROL_STOCK'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'GES_TPV_TIPOS_STOCK'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEControlStockBusqueda
            Filtros = []
          end
          object DBEAcreedor: TLFDBEditFind2000
            Left = 143
            Top = 69
            Width = 80
            Height = 21
            DataField = 'ACREEDOR'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 4
            OnChange = DBEAcreedorChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ACREEDORES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ACREEDOR'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECanalFraccion: TLFDBEditFind2000
            Left = 143
            Top = 91
            Width = 80
            Height = 21
            DataField = 'CANAL_FACTURACION_DEFECTO'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 6
            OnChange = DBECanalFraccionChange
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
          object LTituloCliente: TLFEdit
            Left = 225
            Top = 25
            Width = 230
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            Text = 'LTituloCliente'
          end
          object DBECuentaVales: TLFDbedit
            Left = 143
            Top = 135
            Width = 130
            Height = 21
            DataField = 'CUENTA_VALES'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 9
          end
          object DBELimiteFraccion: TLFDbedit
            Left = 143
            Top = 113
            Width = 80
            Height = 21
            DataField = 'LIMITE_FAC'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            TabOrder = 8
          end
          object LTituloAcreedor: TLFEdit
            Left = 225
            Top = 69
            Width = 230
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 5
            Text = 'LTituloAcreedor'
          end
          object LTituloCanal: TLFEdit
            Left = 225
            Top = 91
            Width = 230
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 7
            Text = 'LTituloCanal'
          end
          object DBCControlaDisponibilidad: TLFDBCheckBox
            Left = 696
            Top = 203
            Width = 225
            Height = 17
            Caption = 'Controlar Disponibilidad'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 33
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTROLA_DISPONIBILIDAD'
            DataSource = DMConfiguracionTPV.DSQMConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 343
    Width = 942
  end
  inherited CEMain: TControlEdit
    DataSource = DMConfiguracionTPV.DSQMConfiguracion
    FichaEdicion = TSConfiguracion
    FichaExclusiva = TSConfiguracion
    PanelEdicion = PEdit
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
