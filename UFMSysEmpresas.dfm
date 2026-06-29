inherited FMSysEmpresas: TFMSysEmpresas
  Left = 273
  Top = 206
  Width = 786
  Height = 595
  HelpContext = 16
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Empresas'
  FormStyle = fsNormal
  PopupMenu = CELOPDPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 776
    Height = 542
    inherited TBMain: TLFToolBar
      Width = 772
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = DMSysEmpresa.DSQMSysEmpresas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        Width = 66
        DataSource = DMSysEmpresa.DSQMSysEmpresas
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEEmpresa
        Busca02 = EFTercero
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 280
        Hint = 'Muestra la informaci'#243'n del tercero asociado a la empresa'
        Visible = True
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 772
      Height = 512
      inherited TSFicha: TTabSheet
        object SBATercero: TSpeedButton [0]
          Left = 134
          Top = 30
          Width = 153
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBATerceroDblClick
        end
        inherited PEdit: TLFPanel
          Width = 764
          Height = 484
          inherited G2KTableLoc: TG2KTBLoc
            Left = 88
            Top = 31
          end
          object LEmpresa: TLFLabel
            Left = 40
            Top = 12
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa'
          end
          object LTercero: TLFLabel
            Left = 44
            Top = 33
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LApertura: TLFLabel
            Left = 248
            Top = 99
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apertura'
          end
          object LFechaAlte: TLFLabel
            Left = 401
            Top = 99
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha de Alta'
          end
          object LMoneda: TLFLabel
            Left = 42
            Top = 100
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LModoIVA: TLFLabel
            Left = 34
            Top = 122
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object LBLAutofacturas: TLFLabel
            Left = 401
            Top = 121
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie Aut.'
          end
          object LImagen: TLFLabel
            Left = 46
            Top = 55
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LBLMercantil: TLFLabel
            Left = 27
            Top = 388
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'R.Mercantil'
          end
          object LLimitePEPKri: TLFLabel
            Left = 0
            Top = 143
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lim. Ped. a Prov.'
          end
          object LBLImporteLetras: TLFLabel
            Left = 126
            Top = 351
            Width = 238
            Height = 13
            Caption = 'Listar decimales en 0-Letras 1-Fracci'#243'n 2-N'#250'meros'
          end
          object LTamanyoEmpresa: TLFLabel
            Left = 12
            Top = 429
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tama'#241'o Empr.'
          end
          object LAgenciaTributaria: TLFLabel
            Left = 19
            Top = 451
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agencia Trib.'
          end
          object LGS1CompanyPrefix: TLFLabel
            Left = 193
            Top = 143
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pref. compa'#241'ia GS1'
          end
          object LImagenFondo: TLFLabel
            Left = 13
            Top = 77
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen Fondo'
          end
          object DBEEmpresa: TLFDbedit
            Left = 86
            Top = 8
            Width = 78
            Height = 21
            Color = clInfoBk
            DataField = 'EMPRESA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 173
            Top = 8
            Width = 423
            Height = 21
            DataField = 'TITULO'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 1
          end
          object EFTercero: TLFDBEditFind2000
            Left = 86
            Top = 30
            Width = 86
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBETextTercero: TLFDbedit
            Left = 173
            Top = 30
            Width = 423
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMSysEmpresa.DSxTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnDblClick = SBATerceroDblClick
            OnEnter = DBETextTerceroEnter
          end
          object DBDTPApertura: TLFDBDateEdit
            Left = 293
            Top = 96
            Width = 87
            Height = 21
            DataField = 'APERTURA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
          end
          object DBRGDuracion: TDBRadioGroup
            Left = 200
            Top = 166
            Width = 168
            Height = 51
            Caption = 'Duraci'#243'n de los ejercicios'
            DataField = 'DURACION'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            Items.Strings = (
              '12 meses desde 1 de enero'
              '12 meses desde apertura')
            TabOrder = 37
            Values.Strings = (
              '1'
              '2')
          end
          object DBEFechaAlta: TLFDbedit
            Left = 471
            Top = 96
            Width = 125
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object DBCBAbierta: TLFDBCheckBox
            Left = 86
            Top = 168
            Width = 107
            Height = 17
            Caption = 'Abierta'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            TabOrder = 25
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ABIERTA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EFMoneda: TLFDBEditFind2000
            Left = 86
            Top = 96
            Width = 45
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 12
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEMonedaTit: TLFDbedit
            Left = 132
            Top = 96
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMSysEmpresa.DSxMoneda
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object EFModoIVA: TLFDBEditFind2000
            Left = 86
            Top = 118
            Width = 45
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 16
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODO_IVA'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'Iva'
              'Recargo'
              'Deducible')
            CampoNum = 'MODO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEModoTit: TLFDbedit
            Left = 132
            Top = 118
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMSysEmpresa.DSxModosIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object DBCBIva: TLFDBCheckBox
            Left = 252
            Top = 120
            Width = 39
            Height = 17
            Hint = 'Tiene Cargo de IVA'
            Caption = 'Iva'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            Enabled = False
            ParentColor = False
            TabOrder = 18
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'IVA'
            DataSource = DMSysEmpresa.DSxModosIVA
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBRecargo: TLFDBCheckBox
            Left = 290
            Top = 120
            Width = 45
            Height = 17
            Hint = 'Tiene Cargo de Recargo de Equivalencia'
            Caption = 'Rec.'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            Enabled = False
            ParentColor = False
            TabOrder = 19
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECARGO'
            DataSource = DMSysEmpresa.DSxModosIVA
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBDeducible: TLFDBCheckBox
            Left = 334
            Top = 120
            Width = 45
            Height = 17
            Hint = 'El tipo de IVA es Deducible'
            Caption = 'Ded.'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            Enabled = False
            ParentColor = False
            TabOrder = 20
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEDUCIBLE'
            DataSource = DMSysEmpresa.DSxModosIVA
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBClienteAuto: TLFDBCheckBox
            Left = 86
            Top = 186
            Width = 107
            Height = 17
            Caption = 'Cliente Aut'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 26
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CLIENTE_AUT'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPMP: TLFDBCheckBox
            Left = 86
            Top = 240
            Width = 107
            Height = 17
            Caption = 'PMP Neg.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 29
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PMP_CERO'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCompras: TLFDBCheckBox
            Left = 86
            Top = 258
            Width = 340
            Height = 17
            Caption = 'Activa la comprobaci'#243'n de fechas de contabilizaci'#243'n en Compras'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FECHA_CONTABILIZACION_COMPRAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCierre: TLFDBCheckBox
            Left = 86
            Top = 294
            Width = 340
            Height = 17
            Caption = 'Bloquea un ejercicio contable una vez regularizado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 32
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CIERRE_CONTABLE'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBFechaVentas: TLFDBCheckBox
            Left = 86
            Top = 276
            Width = 340
            Height = 17
            Caption = 'Activa la comprobaci'#243'n de fechas de contabilizaci'#243'n en Ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FECHA_VENTAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBLstPedCompras: TLFDBCheckBox
            Left = 435
            Top = 186
            Width = 300
            Height = 17
            Caption = 'Listar pedidos de Compras'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 39
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'LISTAR_PEDIDOS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETitSerie: TLFDbedit
            Left = 499
            Top = 118
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMSysEmpresa.DSxSeries
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 451
            Top = 118
            Width = 47
            Height = 21
            DataField = 'SERIE_AUTOFAC'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 21
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ScrBImagen: TScrollBox
            Left = 602
            Top = 7
            Width = 144
            Height = 130
            HorzScrollBar.Visible = False
            VertScrollBar.Visible = False
            AutoScroll = False
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 49
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
            Left = 86
            Top = 52
            Width = 86
            Height = 21
            DataField = 'E_IMAGEN'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 4
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
          object ETituloImagen: TLFEdit
            Left = 173
            Top = 52
            Width = 423
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
          object LFDBCBCierraDocCero: TLFDBCheckBox
            Left = 435
            Top = 204
            Width = 300
            Height = 17
            Caption = 'Cerrar Documentos con Total 0'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 40
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CIERRA_DOC_CERO'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMMercantil: TLFDBMemo
            Left = 86
            Top = 387
            Width = 660
            Height = 37
            DataField = 'REG_MERCANTIL'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 50
          end
          object CBSerializadoAuto: TLFDBCheckBox
            Left = 435
            Top = 222
            Width = 300
            Height = 17
            Caption = 'Mostrar autom'#225'ticamente ventana serializado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 41
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SERIALIZADO_AUTO'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBMoverStockVentas: TLFDBCheckBox
            Left = 86
            Top = 312
            Width = 340
            Height = 17
            Caption = 'Devolver Stock al anular albaran ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 33
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'MOV_STOCK_ANULA_VENTAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBMoverStockCompras: TLFDBCheckBox
            Left = 435
            Top = 240
            Width = 300
            Height = 17
            Caption = 'Mover Stock al bloquear/desbloquear albaran compras'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 42
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'MOV_STOCK_ANULA_COMPRAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBCalcularPortesCompras: TLFDBCheckBox
            Left = 435
            Top = 276
            Width = 300
            Height = 17
            Caption = 'Calcular portes con dto.pp (Compras)'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 44
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PORTES_COMPRAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBCalcularPortesVentas: TLFDBCheckBox
            Left = 435
            Top = 258
            Width = 300
            Height = 17
            Caption = 'Calcular portes con dto.pp (Ventas)'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 43
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PORTES_VENTAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBSeparaApuntes: TLFDBCheckBox
            Left = 435
            Top = 168
            Width = 300
            Height = 17
            Caption = 'Separar apuntes por recibos en remesas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 38
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SEPARAR_APUNTES_REMESAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBSepararPedidosEnRecep: TLFDBCheckBox
            Left = 435
            Top = 294
            Width = 300
            Height = 17
            Caption = 'Separar pedidos en recepci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 45
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SEPARAR_PEDIDOS_RECEPCION'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBControlStockNeg: TLFDBCheckBox
            Left = 435
            Top = 312
            Width = 300
            Height = 17
            Caption = 'Control de Stock Negativo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 46
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTROL_STOCK_NEG'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBCBAsientoNegativo: TLFDBCheckBox
            Left = 435
            Top = 330
            Width = 300
            Height = 17
            Caption = 'Rectificar Asientos Negativos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 47
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTROL_ASIENTO_NEG'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBELimitePEPKri: TLFDbedit
            Left = 86
            Top = 140
            Width = 85
            Height = 21
            DataField = 'IMPORTE_MAX_PEP'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 23
          end
          object DBCBImporteLetras: TDBComboBox
            Left = 86
            Top = 348
            Width = 35
            Height = 21
            Hint = '0-Letras 1-Fracci'#243'n 2-N'#250'meros'
            DataField = 'IMPORTE_LETRAS'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ItemHeight = 13
            Items.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 35
          end
          object DBCBSepararApunteDtoCial: TLFDBCheckBox
            Left = 435
            Top = 348
            Width = 300
            Height = 17
            Hint = 'Valor por defecto al momento de crear clientes.'
            Caption = 'Separar Apunte de Dto. Cial.'
            ClicksDisabled = False
            ColorCheck = 57088
            ShowHint = True
            TabOrder = 48
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SEPARAR_DTO_CIAL'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ParentShowHint = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBChkBRECC: TLFDBCheckBox
            Left = 86
            Top = 369
            Width = 340
            Height = 17
            Caption = 'Regimen Especial de Criterio de Caja'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 36
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECC'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object BCargarImagen: TButton
            Left = 548
            Top = 53
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 6
            Visible = False
            OnClick = BCargarImagenClick
          end
          object DBCBInvetarioPermanente: TLFDBCheckBox
            Left = 86
            Top = 330
            Width = 340
            Height = 17
            Caption = 'Invetario Permanente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 34
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVENTARIO_PERMANENTE'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object BClipboard: TButton
            Left = 571
            Top = 53
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 7
            Visible = False
            OnClick = BClipboardClick
          end
          object DBETamanyoEmpresa: TLFDbedit
            Left = 86
            Top = 425
            Width = 660
            Height = 21
            DataField = 'TAMANYO_EMPRESA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 51
          end
          object DBEAgenciaTributaria: TLFDbedit
            Left = 86
            Top = 447
            Width = 660
            Height = 21
            DataField = 'AGENCIA_TRIBUTARIA'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 52
          end
          object DBEGS1CompanyPrefix: TLFDbedit
            Left = 293
            Top = 140
            Width = 156
            Height = 21
            DataField = 'GS1_COMPANY_PREFIX'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 24
          end
          object DBCBProveedorAuto: TLFDBCheckBox
            Left = 86
            Top = 204
            Width = 107
            Height = 17
            Caption = 'Proveedor Aut'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 27
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PROVEEDOR_AUT'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBAcreedorAuto: TLFDBCheckBox
            Left = 86
            Top = 222
            Width = 107
            Height = 17
            Caption = 'Acreedor Aut'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 28
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACREEDOR_AUT'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFImagenFondo: TLFDBEditFind2000
            Left = 86
            Top = 74
            Width = 86
            Height = 21
            DataField = 'F_IMAGEN'
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            TabOrder = 8
            OnChange = DBEFImagenFondoChange
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
          object ETituloImagenFondo: TLFEdit
            Left = 173
            Top = 74
            Width = 423
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
          object BCargarImagenFondo: TButton
            Left = 548
            Top = 75
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 10
            Visible = False
            OnClick = BCargarImagenFondoClick
          end
          object BClipboardImagenFondo: TButton
            Left = 571
            Top = 75
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 11
            Visible = False
            OnClick = BClipboardImagenFondoClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 764
          Height = 484
          DataSource = DMSysEmpresa.DSQMSysEmpresas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ABIERTA'
            'ACREEDOR_AUT'
            'CLIENTE_AUT'
            'PROVEEDOR_AUT')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'Empresa'
            'titulo'
            'tercero'
            'Apertura')
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 374
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APERTURA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABIERTA'
              Width = 39
              Visible = True
            end>
        end
      end
      object TSEmail: TTabSheet
        Caption = '&Email'
        ImageIndex = -1
        object PNLEmail: TLFPanel
          Left = 0
          Top = 22
          Width = 640
          Height = 462
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          DesignSize = (
            640
            462)
          object LAsunto: TLFLabel
            Left = 56
            Top = 28
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asunto'
          end
          object LNotasPieEmail: TLFLabel
            Left = 15
            Top = 288
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Caption = 'Notas Pie Email'
          end
          object LTextoEnvioDocumento: TLFLabel
            Left = 7
            Top = 51
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Texto Envio Doc.'
          end
          object LServCorreo: TLFLabel
            Left = 31
            Top = 6
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serv. SMTP'
          end
          object DBEAsunto: TLFDbedit
            Left = 93
            Top = 24
            Width = 532
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ASUNTO'
            DataSource = DMSysEmpresa.DSxConfigEmail
            TabOrder = 2
            OnEnter = ComponenteFocoEnter
          end
          object DBMNotasPieCorreo: TLFDBMemo
            Left = 93
            Top = 288
            Width = 532
            Height = 171
            Anchors = [akLeft, akRight, akBottom]
            DataField = 'PIE'
            DataSource = DMSysEmpresa.DSxConfigEmail
            TabOrder = 4
            OnEnter = ComponenteFocoEnter
          end
          object DBMTextoEnvioDocumento: TLFDBMemo
            Left = 93
            Top = 46
            Width = 532
            Height = 241
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'CUERPO'
            DataSource = DMSysEmpresa.DSxConfigEmail
            TabOrder = 3
            OnEnter = ComponenteFocoEnter
          end
          object DBEServCorreo: TLFDBEditFind2000
            Left = 93
            Top = 2
            Width = 49
            Height = 21
            DataField = 'ID_CONFIG_SERV_CORREOS'
            DataSource = DMSysEmpresa.DSxConfigEmail
            TabOrder = 0
            OnChange = DBEServCorreoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_CONFIG_SERVIDOR_CORREO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'ID'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'ID')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EServCorreoTitulo: TLFEdit
            Left = 143
            Top = 2
            Width = 482
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
            TabOrder = 1
          end
        end
        object TBConfigEmail: TLFToolBar
          Left = 0
          Top = 0
          Width = 764
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
          object NavConfigEmail: THYMNavigator
            Left = 0
            Top = 0
            Width = 160
            Height = 22
            DataSource = DMSysEmpresa.DSxConfigEmail
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel]
            Align = alLeft
            Flat = True
            ParentShowHint = False
            PopupMenu = CEEmailPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEAsunto
            InsertaControl = DBEAsunto
            Exclusivo = True
            ControlEdit = CEMail
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 160
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object PNLTipoConfig: TLFPanel
            Left = 168
            Top = 0
            Width = 261
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            DesignSize = (
              261
              22)
            object LTipoConfig: TLFLabel
              Left = 8
              Top = 4
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo'
            end
            object DBETipoConfig: TLFDbedit
              Left = 32
              Top = 0
              Width = 49
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO'
              DataSource = DMSysEmpresa.DSxConfigEmail
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              OnChange = DBETipoConfigChange
            end
            object ETipoConfig: TLFEdit
              Left = 82
              Top = 0
              Width = 177
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
        object LstVariables: TListBox
          Left = 640
          Top = 22
          Width = 124
          Height = 462
          Align = alRight
          ItemHeight = 13
          TabOrder = 2
          OnDblClick = LstVariablesDblClick
        end
      end
      object TSLOPD: TTabSheet
        Caption = 'LOPD'
        ImageIndex = 3
        object TBLOPD: TLFToolBar
          Left = 0
          Top = 0
          Width = 764
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavLOPD: THYMNavigator
            Left = 0
            Top = 0
            Width = 60
            Height = 22
            DataSource = DMSysEmpresa.DSQMSysEmpresas
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Align = alLeft
            Flat = True
            ParentShowHint = False
            PopupMenu = CELOPDPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMTextoLOPD
            InsertaControl = DBMTextoLOPD
            Exclusivo = True
            ControlEdit = CELOPD
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLLOPD: TLFPanel
          Left = 0
          Top = 22
          Width = 764
          Height = 462
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object PNLTextoLOPDPieDocumento: TLFPanel
            Left = 0
            Top = 169
            Width = 764
            Height = 293
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LTextoLOPDPieDocumento: TLFLabel
              Left = 0
              Top = 0
              Width = 764
              Height = 13
              Align = alTop
              Caption = 'Texto LOPD Pie Documento'
            end
            object DBMTextoLOPDPieDocumento: TLFDBMemo
              Left = 0
              Top = 13
              Width = 764
              Height = 280
              Align = alClient
              DataField = 'TEXTO_LOPD_PIE_DOCUMENTO'
              DataSource = DMSysEmpresa.DSQMSysEmpresas
              TabOrder = 0
            end
          end
          object PNLTextoLOPD: TLFPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 169
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LTextoLOPD: TLFLabel
              Left = 0
              Top = 0
              Width = 764
              Height = 13
              Align = alTop
              Caption = 'Texto LOPD'
            end
            object DBMTextoLOPD: TLFDBMemo
              Left = 0
              Top = 13
              Width = 764
              Height = 156
              Align = alClient
              DataField = 'TEXTO_LOPD'
              DataSource = DMSysEmpresa.DSQMSysEmpresas
              TabOrder = 0
            end
          end
        end
      end
      object TSFacturaElectronica: TTabSheet
        Caption = 'Fact. Elect.'
        ImageIndex = 4
        object TBTipoGiro: TLFToolBar
          Left = 0
          Top = 0
          Width = 764
          Height = 24
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavTipoGiro: THYMNavigator
            Left = 0
            Top = 2
            Width = 220
            Height = 22
            DataSource = DMSysEmpresa.DSxTipoGiro
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = NavMainClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFTipoGiro
            InsertaControl = DBGFTipoGiro
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFTipoGiro: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 764
          Height = 460
          Align = alClient
          DataSource = DMSysEmpresa.DSxTipoGiro
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
          BuscarNums = False
          Campos.Strings = (
            'CODIGO_GIRO')
          CamposAMostrar.Strings = (
            'CODIGO_GIRO'
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
          ColumnasCheckBoxes.Strings = (
            'DEFECTO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tablas.Strings = (
            'SYS_TIPO_GIRO')
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
            'DIRECCION')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_GIRO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 602
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 43
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 542
    Width = 776
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEMail
    Left = 542
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 542
    Top = 32
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosTercero: TMenuItem
      Action = AATercero
    end
  end
  inherited ALMain: TLFActionList
    Left = 474
    Top = 4
    object ARegenera: TAction
      Category = 'Procesos'
      Caption = 'Regenerar Auxiliares de la Empresa'
      Hint = 'Regenerar Auxiliares de la Empresa'
      ImageIndex = 26
      OnExecute = ARegeneraExecute
    end
    object AActivacionECS: TAction
      Category = 'Procesos'
      Caption = 'Activar Ejercicio-Canal-Serie de la Empresa'
      Hint = 'Activar Ejercicio-Canal-Serie de la Empresa'
      ImageIndex = 94
      OnExecute = AActivacionECSExecute
    end
    object AAbrirEmpresa: TAction
      Category = 'Procesos'
      Caption = 'Abrir la Empresa actual'
      Hint = 'Abrir la Empresa actual'
      ImageIndex = 19
      OnExecute = AAbrirEmpresaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ACerrarEmpresa: TAction
      Category = 'Procesos'
      Caption = 'Cerrar la Empresa actual'
      Hint = 'Cerrar la Empresa actual'
      ImageIndex = 39
      OnExecute = ACerrarEmpresaExecute
    end
    object AAltaEjercicio: TAction
      Category = 'Procesos'
      Caption = 'Alta de nuevos ejercicios'
      Hint = 'Alta de nuevos ejercicios'
      ImageIndex = 9
      OnExecute = AAltaEjercicioExecute
    end
    object AEliminaEmpresa: TAction
      Category = 'Procesos'
      Caption = 'Elimina la Empresa aunque tenga datos'
      Hint = 'Elimina la Empresa aunque tenga datos'
      ImageIndex = 27
      OnExecute = AEliminaEmpresaExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntoEmpresa: TAction
      Category = 'Adjuntos'
      Caption = 'AAdjuntos de la Empresa'
      Hint = 'Visualiza los adjuntos de la empresa'
      ImageIndex = 59
      OnExecute = AAdjuntoEmpresaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 440
    Top = 4
  end
  object ALEmpresas: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 508
    Top = 4
    object AATercero: TAction
      Caption = 'Ver Datos Tercero'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
      ShortCut = 49236
      OnExecute = AATerceroExecute
    end
  end
  object CEMail: TControlEdit
    EnlazadoA = CELOPD
    FichaEdicion = TSEmail
    FichaExclusiva = TSEmail
    PanelEdicion = PNLEmail
    SubComplementario = ALMain
    PopUpMenu = CEEmailPMEdit
    Teclas = DMMain.Teclas
    Left = 574
    Top = 4
  end
  object CEEmailPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 574
    Top = 32
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
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
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
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem13: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem14: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem15: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem16: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object MenuItem17: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object MenuItem18: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object MenuItem19: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem20: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object MenuItem21: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
      Visible = False
    end
    object MenuItem22: TMenuItem
      Caption = '-'
    end
    object MenuItem23: TMenuItem
      Action = AATercero
    end
  end
  object CELOPD: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSLOPD
    FichaExclusiva = TSLOPD
    PanelEdicion = PNLLOPD
    SubComplementario = ALMain
    PopUpMenu = CELOPDPMEdit
    Teclas = DMMain.Teclas
    Left = 606
    Top = 4
  end
  object CELOPDPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 606
    Top = 32
    object CELOPDPMEdit1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELOPDPMEdit2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELOPDPMEdit3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELOPDPMEdit4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELOPDPMEdit5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CELOPDPMEdit6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CELOPDPMEdit7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELOPDPMEdit8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELOPDPMEdit9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELOPDPMEdit10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CELOPDPMEdit11: TMenuItem
      Caption = '-'
    end
    object CELOPDPMEdit12: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
      Visible = False
    end
    object CELOPDPMEdit13: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CELOPDPMEdit14: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CELOPDPMEdit15: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
      Visible = False
    end
    object CELOPDPMEdit16: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object CELOPDPMEdit17: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CELOPDPMEdit18: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object CELOPDPMEdit19: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object CELOPDPMEdit20: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object CELOPDPMEdit21: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
      Visible = False
    end
    object CELOPDPMEdit22: TMenuItem
      Caption = '-'
    end
    object CELOPDPMEdit23: TMenuItem
      Action = AATercero
    end
  end
end
