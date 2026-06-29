inherited ZFMPresupuesto: TZFMPresupuesto
  Left = 280
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Mantenimiento de Presupuestos'
  ClientHeight = 598
  ClientWidth = 1021
  PopupMenu = CEDatosPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1021
    Height = 574
    inherited TBMain: TLFToolBar
      Width = 1017
      inherited NavMain: THYMNavigator
        DataSource = ZDMPresupuesto.DSQMPresupuesto
        Hints.Strings = ()
        EditaControl = DBEFCliente
        InsertaControl = DBEFCliente
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      object ToolButton2: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtDuplicar: TToolButton
        Left = 347
        Top = 0
        Hint = 'Duplicar presupuesto'
        Caption = 'Duplicar'
        ImageIndex = 37
        ParentShowHint = False
        ShowHint = False
        OnClick = TButtDuplicarClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1017
      Height = 544
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1009
          Height = 516
          inherited G2KTableLoc: TG2KTBLoc
            Left = 36
          end
          object LPresupuesto: TLFLabel
            Left = 63
            Top = 8
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Presupuesto'
            FocusControl = DBENumPre
          end
          object LFecha: TLFLabel
            Left = 469
            Top = 7
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LCliente: TLFLabel
            Left = 90
            Top = 29
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
            FocusControl = DBEDescripCliente
          end
          object LResponsable: TLFLabel
            Left = 60
            Top = 51
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
            FocusControl = DBEDescContacto
          end
          object LDescripcion: TLFLabel
            Left = 66
            Top = 184
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object LComentariosPedido: TLFLabel
            Left = 11
            Top = 271
            Width = 111
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentarios del Pedido'
          end
          object LGastosIniciales: TLFLabel
            Left = 652
            Top = 228
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Ini.'
            FocusControl = DBEGastosIniciales
          end
          object LDescGastosIniciales: TLFLabel
            Left = 831
            Top = 226
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Ini. Desc.'
            FocusControl = DBEDecripGastosInciales
          end
          object LImagen: TLFLabel
            Left = 87
            Top = 228
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
            FocusControl = DBEImagen
          end
          object LAdhesivo: TLFLabel
            Left = 78
            Top = 398
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Adhesivo'
            FocusControl = DBEDescAdhesivo
          end
          object LMateria: TLFLabel
            Left = 85
            Top = 313
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Material'
            FocusControl = DBEDescMaterial
          end
          object LTinta: TLFLabel
            Left = 581
            Top = 312
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta'
            FocusControl = DBEDescTinta
          end
          object LPresentacion: TLFLabel
            Left = 663
            Top = 30
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Present.'
            FocusControl = DBEDescPresentacion
          end
          object LFormaEnvio: TLFLabel
            Left = 663
            Top = 50
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Envio'
            FocusControl = DBEDecFormaEnvio
          end
          object LSituacionPresentacion: TLFLabel
            Left = 660
            Top = 96
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sit. Pres.'
            FocusControl = DBEDescSituacionPresentacion
          end
          object LAgente: TLFLabel
            Left = 668
            Top = 73
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
            FocusControl = DBEDescAgente
          end
          object LComision: TLFLabel
            Left = 890
            Top = 96
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comision'
            FocusControl = DBEComision
          end
          object LTipoCotizacion: TLFLabel
            Left = 49
            Top = 206
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Cotizaci'#243'n'
          end
          object LGastosTroquel1: TLFLabel
            Left = 621
            Top = 250
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Troquel 1'
          end
          object LDescGastosTroquel1: TLFLabel
            Left = 800
            Top = 248
            Width = 112
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Troquel 1 Desc.'
          end
          object LGastosTroquel2: TLFLabel
            Left = 621
            Top = 272
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Troquel 2'
          end
          object LDescGastosTroquel2: TLFLabel
            Left = 800
            Top = 271
            Width = 112
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Troquel 2 Desc.'
          end
          object LTelefono: TLFLabel
            Left = 409
            Top = 75
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tel.'
            FocusControl = DBEDescContacto
          end
          object LEmail: TLFLabel
            Left = 399
            Top = 30
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-Mail'
            FocusControl = DBEDescContacto
          end
          object LCIF: TLFLabel
            Left = 106
            Top = 118
            Width = 16
            Height = 13
            Alignment = taRightJustify
            Caption = 'CIF'
            FocusControl = DBEDescContacto
          end
          object LFax: TLFLabel
            Left = 410
            Top = 97
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fax'
            FocusControl = DBEDescContacto
          end
          object LWeb: TLFLabel
            Left = 99
            Top = 73
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Web'
            FocusControl = DBEDescContacto
          end
          object LDireccion: TLFLabel
            Left = 77
            Top = 95
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
            FocusControl = DBEDescContacto
          end
          object LCodPostal: TLFLabel
            Left = 102
            Top = 162
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'C.P.'
            FocusControl = DBEDescContacto
          end
          object LPoblacion: TLFLabel
            Left = 228
            Top = 140
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Poblaci'#243'n'
            FocusControl = DBEDescContacto
          end
          object LFormaPago: TLFLabel
            Left = 50
            Top = 140
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma de Pago'
            FocusControl = DBEDescContacto
          end
          object LDatosBancarios: TLFLabel
            Left = 318
            Top = 162
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Datos Bancarios'
            FocusControl = DBEDescContacto
          end
          object LDiametroInterior: TLFLabel
            Left = 642
            Top = 116
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Di'#225'metro Int.'
            FocusControl = DBEDescPresentacion
          end
          object LDiametroExterior: TLFLabel
            Left = 783
            Top = 116
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Di'#225'metro Ext.'
            FocusControl = DBEDescPresentacion
          end
          object LEtiqPorRollo: TLFLabel
            Left = 643
            Top = 139
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etq. por rollo'
            FocusControl = DBEDescPresentacion
          end
          object LEtiqAlAncho: TLFLabel
            Left = 786
            Top = 139
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etq.al ancho'
            FocusControl = DBEDescPresentacion
          end
          object LPosicionSalida: TLFLabel
            Left = 652
            Top = 163
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pos.Salida'
            FocusControl = DBEDescripcion
          end
          object LObsevEtiqueta: TLFLabel
            Left = 3
            Top = 249
            Width = 119
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones de la Etq.'
            FocusControl = DBEDescripcion
          end
          object LArtMaterial: TLFLabel
            Left = 66
            Top = 334
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Material'
          end
          object LTinta1: TLFLabel
            Left = 572
            Top = 334
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 1'
          end
          object LTinta2: TLFLabel
            Left = 572
            Top = 356
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 2'
          end
          object LTinta3: TLFLabel
            Left = 572
            Top = 379
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 3'
          end
          object LTinta4: TLFLabel
            Left = 572
            Top = 401
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 4'
          end
          object LTinta5: TLFLabel
            Left = 572
            Top = 423
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 5'
          end
          object LTinta6: TLFLabel
            Left = 572
            Top = 445
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 6'
          end
          object LTinta7: TLFLabel
            Left = 572
            Top = 468
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 7'
          end
          object LTinta8: TLFLabel
            Left = 572
            Top = 491
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tinta 8'
          end
          object LArtAdhesivo: TLFLabel
            Left = 59
            Top = 420
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Adhesivo'
          end
          object LArtCaja: TLFLabel
            Left = 82
            Top = 442
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Caja'
          end
          object LArtBarniz: TLFLabel
            Left = 74
            Top = 377
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Barniz'
          end
          object LRecursos: TLFLabel
            Left = 82
            Top = 487
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recurso'
          end
          object LArtPortes: TLFLabel
            Left = 73
            Top = 465
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Portes'
          end
          object DBENumPre: TLFDbedit
            Left = 126
            Top = 4
            Width = 51
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'N_PRESUPUETO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
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
          object DBEDescripCliente: TLFDbedit
            Left = 178
            Top = 26
            Width = 216
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEDescContacto: TLFDbedit
            Left = 178
            Top = 48
            Width = 185
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_CONTACTO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEDescripcion: TLFDbedit
            Left = 126
            Top = 180
            Width = 475
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 21
          end
          object DBDateTimePicker1: TDBDateTimePicker
            Left = 504
            Top = 4
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963.4673863889
            Time = 42963.4673863889
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 3
            DataField = 'FECHA_EMISION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
          end
          object DBEGastosIniciales: TLFDbedit
            Left = 707
            Top = 224
            Width = 84
            Height = 21
            DataField = 'GASTOS_INICIALES'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 36
          end
          object DBEDecripGastosInciales: TLFDbedit
            Left = 913
            Top = 223
            Width = 86
            Height = 21
            DataField = 'GASTOS_INICIALES_DESCR'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 37
          end
          object DBEImagen: TLFDbedit
            Left = 126
            Top = 224
            Width = 475
            Height = 21
            DataField = 'IMAGEN_ETIQUETA'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 23
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 126
            Top = 26
            Width = 51
            Height = 21
            DataField = 'CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 5
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescAdhesivo: TLFDbedit
            Left = 178
            Top = 397
            Width = 340
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescAdhesivo'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 60
          end
          object DBEDescMaterial: TLFDbedit
            Left = 178
            Top = 309
            Width = 340
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescMaterial'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 78
          end
          object DBEDescTinta: TLFDbedit
            Left = 662
            Top = 309
            Width = 149
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTinta'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 79
          end
          object DBEFAdhesivo: TLFDBEditFind2000
            Left = 126
            Top = 397
            Width = 51
            Height = 21
            DataField = 'CODIGO_ADHESIVO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 51
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'ADH'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEFMaterial: TLFDBEditFind2000
            Left = 126
            Top = 309
            Width = 51
            Height = 21
            DataField = 'CODIGO_MATERIAL'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 42
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'MAT'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object LFNumTintas: TLFDBEditFind2000
            Left = 610
            Top = 309
            Width = 51
            Height = 21
            DataField = 'CODIGO_TINTA'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 61
            OnChange = LFNumTintasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'TIN'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEFPresentacion: TLFDBEditFind2000
            Left = 707
            Top = 26
            Width = 51
            Height = 21
            DataField = 'CODIGO_PRESENTACION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 26
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'PRE'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEDescPresentacion: TLFDbedit
            Left = 759
            Top = 26
            Width = 155
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescPresentacion'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 80
          end
          object DBEDecFormaEnvio: TLFDbedit
            Left = 759
            Top = 48
            Width = 155
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescFormaEnv'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 81
          end
          object DBEDescSituacionPresentacion: TLFDbedit
            Left = 759
            Top = 92
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescSituacionPres'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 82
          end
          object DBEFSituacionPresentacion: TLFDBEditFind2000
            Left = 707
            Top = 92
            Width = 51
            Height = 21
            DataField = 'CODIGO_SITUACION_PRES'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 29
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'SPR'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEFFormaEnvio: TLFDBEditFind2000
            Left = 707
            Top = 48
            Width = 51
            Height = 21
            DataField = 'CODIGO_FORMA_ENVIO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 27
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux='#39'ENV'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEDescAgente: TLFDbedit
            Left = 759
            Top = 70
            Width = 238
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMPresupuesto.DSxAgentes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 83
          end
          object DBEComision: TLFDbedit
            Left = 934
            Top = 92
            Width = 63
            Height = 21
            DataField = 'COMISION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 30
          end
          object DBEFAgente: TLFDBEditFind2000
            Left = 707
            Top = 70
            Width = 51
            Height = 21
            DataField = 'AGENTES'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 28
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ButPathImagen: TButton
            Left = 602
            Top = 225
            Width = 23
            Height = 21
            Caption = '...'
            TabOrder = 84
            TabStop = False
            OnClick = ButPathImagenClick
          end
          object DBEFContacto: TLFDBEditFind2000
            Left = 126
            Top = 48
            Width = 51
            Height = 21
            DataField = 'CONTACTO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 6
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_CONTACTOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'Apellidos')
            CampoNum = 'CONTACTO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFContactoBusqueda
            Filtros = []
          end
          object DBCheckWeb: TLFDBCheckBox
            Left = 256
            Top = 5
            Width = 98
            Height = 17
            Caption = 'Publicar en web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEApellidosContacto: TLFDbedit
            Left = 364
            Top = 48
            Width = 237
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'APELLIDOS_CONTACTO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBCBTipoCotiz: TDBComboBoxValue
            Left = 126
            Top = 202
            Width = 106
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_COTIZACION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            ItemHeight = 13
            Items.Strings = (
              #8364'/unidad'
              #8364'/millar'
              #8364'/total pedido')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 22
          end
          object DBEGastosTroquel1: TLFDbedit
            Left = 707
            Top = 246
            Width = 84
            Height = 21
            DataField = 'GASTOS_TROQUEL1'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 38
          end
          object DBEDescGastosTroquel1: TLFDbedit
            Left = 913
            Top = 245
            Width = 86
            Height = 21
            DataField = 'GASTOS_TROQUEL1_DESCR'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 39
          end
          object DBEGastosTroquel2: TLFDbedit
            Left = 707
            Top = 268
            Width = 84
            Height = 21
            DataField = 'GASTOS_TROQUEL2'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 40
          end
          object DBEDescGastosTroquel2: TLFDbedit
            Left = 913
            Top = 267
            Width = 86
            Height = 21
            DataField = 'GASTOS_TROQUEL2_DESCR'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 41
          end
          object DBEstampacion: TLFDBCheckBox
            Left = 211
            Top = 354
            Width = 80
            Height = 17
            Caption = 'Estampaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 46
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTAMPACION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBRelieve: TLFDBCheckBox
            Left = 298
            Top = 355
            Width = 65
            Height = 17
            Caption = 'Relieve'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 47
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RELIEVE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBReimpresion: TLFDBCheckBox
            Left = 126
            Top = 354
            Width = 80
            Height = 17
            Caption = 'Reimpresi'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 45
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'REIMPRESION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBBarniz: TLFDBCheckBox
            Left = 366
            Top = 355
            Width = 66
            Height = 17
            Caption = 'Barniz'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 48
            TabStop = True
            OnClick = DBBarnizClick
            Alignment = taLeftJustify
            DataField = 'BARNIZ'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDEmail: TLFDbedit
            Left = 431
            Top = 26
            Width = 170
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'EMAIL_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object LFDTelf: TLFDbedit
            Left = 431
            Top = 70
            Width = 170
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TELEFONO_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object LFDDiametroInt: TLFDbedit
            Left = 707
            Top = 114
            Width = 72
            Height = 21
            DataField = 'DIAMETRO_INT'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 31
          end
          object LFDDiametroExt: TLFDbedit
            Left = 848
            Top = 114
            Width = 69
            Height = 21
            DataField = 'DIAMETRO_EXT'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 32
          end
          object LFDEtqRollo: TLFDbedit
            Left = 707
            Top = 136
            Width = 72
            Height = 21
            DataField = 'ETIQUETA_ROLLO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 33
          end
          object LFDEtqAncho: TLFDbedit
            Left = 848
            Top = 136
            Width = 69
            Height = 21
            DataField = 'ETIQUETA_ANCHO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 34
          end
          object LFDbPosicionSalida: TLFDbedit
            Left = 707
            Top = 158
            Width = 72
            Height = 21
            DataField = 'POSICION_SALIDA'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 35
          end
          object LFDCif: TLFDbedit
            Left = 126
            Top = 92
            Width = 264
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CIF_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object LFDFax: TLFDbedit
            Left = 431
            Top = 92
            Width = 170
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FAX_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object LFDCP: TLFDbedit
            Left = 126
            Top = 136
            Width = 81
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CP_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object LFDDireccion: TLFDbedit
            Left = 126
            Top = 114
            Width = 475
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DIRECCION_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object LFDFormaPago: TLFDbedit
            Left = 126
            Top = 158
            Width = 189
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FORMA_PAGO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object LFDPoblacion: TLFDbedit
            Left = 279
            Top = 136
            Width = 322
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'POBLACION'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
          end
          object LFDWeb: TLFDbedit
            Left = 126
            Top = 70
            Width = 264
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'WEB_CLIENTE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object LFDDatosBancariosDC: TLFDbedit
            Left = 501
            Top = 158
            Width = 23
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DC'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object LFDDatosBancariosSucursal: TLFDbedit
            Left = 450
            Top = 158
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SUCURSAL'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object LFDDatosBancariosEntidad: TLFDbedit
            Left = 399
            Top = 158
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ENTIDAD'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object DBEObservaciones: TLFDbedit
            Left = 126
            Top = 246
            Width = 475
            Height = 21
            DataField = 'OBSERVACIONES_ETIQUETA'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 24
          end
          object DBEComentario: TLFDbedit
            Left = 126
            Top = 268
            Width = 475
            Height = 21
            DataField = 'COMENTARIOS'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 25
          end
          object LFDDatosBancariosCC: TLFDbedit
            Left = 525
            Top = 158
            Width = 76
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CC'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
          end
          object LFEFArtMAt: TLFDBEditFind2000
            Left = 126
            Top = 331
            Width = 91
            Height = 21
            DataField = 'ARTICULO_MATERIAL'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 43
            OnChange = LFEFArtMAtChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object DBEDescArtMaterial: TLFDbedit
            Left = 218
            Top = 331
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtMat'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 85
          end
          object LDBEFTinta8: TLFDBEditFind2000
            Left = 610
            Top = 485
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA8'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 76
            OnChange = LDBEFTinta8Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFTinta7: TLFDBEditFind2000
            Left = 610
            Top = 463
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA7'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 74
            OnChange = LDBEFTinta7Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFTinta6: TLFDBEditFind2000
            Left = 610
            Top = 441
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA6'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 72
            OnChange = LDBEFTinta6Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFTinta5: TLFDBEditFind2000
            Left = 610
            Top = 419
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA5'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 70
            OnChange = LDBEFTinta5Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFTinta4: TLFDBEditFind2000
            Left = 610
            Top = 397
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA4'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 68
            OnChange = LDBEFTinta4Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFTinta3: TLFDBEditFind2000
            Left = 610
            Top = 375
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA3'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 66
            OnChange = LDBEFTinta3Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFCaja: TLFDBEditFind2000
            Left = 126
            Top = 441
            Width = 91
            Height = 21
            DataField = 'ARTICULO_CAJA'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 54
            OnChange = LDBEFCajaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFAdhesivo: TLFDBEditFind2000
            Left = 126
            Top = 419
            Width = 91
            Height = 21
            DataField = 'ARTICULO_ADHESIVO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 52
            OnChange = LDBEFAdhesivoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object DBEDescCaja: TLFDbedit
            Left = 218
            Top = 441
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescartCaja'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 86
          end
          object LDBEFTinta1: TLFDBEditFind2000
            Left = 610
            Top = 331
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA1'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 62
            OnChange = LDBEFTinta1Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFTinta2: TLFDBEditFind2000
            Left = 610
            Top = 353
            Width = 91
            Height = 21
            DataField = 'ARTICULO_TINTA2'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 64
            OnChange = LDBEFTinta2Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object DBETinta1: TLFDbedit
            Left = 702
            Top = 331
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta1'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 87
          end
          object DBETinta2: TLFDbedit
            Left = 702
            Top = 353
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta2'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 88
          end
          object DBETinta3: TLFDbedit
            Left = 702
            Top = 375
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta3'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 89
          end
          object DBETinta4: TLFDbedit
            Left = 702
            Top = 397
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta4'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 90
          end
          object DBETinta5: TLFDbedit
            Left = 702
            Top = 419
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta5'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 91
          end
          object DBETinta6: TLFDbedit
            Left = 702
            Top = 441
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta6'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 92
          end
          object DBETinta7: TLFDbedit
            Left = 702
            Top = 463
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta7'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 93
          end
          object DBETinta8: TLFDbedit
            Left = 702
            Top = 485
            Width = 192
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtTinta8'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 94
          end
          object DBEDescArtBarniz: TLFDbedit
            Left = 218
            Top = 375
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtBarniz'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 95
          end
          object DBEDescDescArtAhesitov: TLFDbedit
            Left = 218
            Top = 419
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtAdh'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 96
          end
          object LDBEFBarniz: TLFDBEditFind2000
            Left = 126
            Top = 375
            Width = 91
            Height = 21
            DataField = 'ARTICULO_BARNIZ'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 49
            OnChange = LDBEFBarnizChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LFDBCantidad: TLFDbedit
            Left = 812
            Top = 309
            Width = 24
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NUM_TINTAS'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 97
          end
          object LFDBPorcentaje: TLFDbedit
            Left = 837
            Top = 309
            Width = 24
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'PORCENTAJE'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 98
          end
          object DBEPCosteMaterial: TLFDbedit
            Left = 443
            Top = 331
            Width = 75
            Height = 21
            DataField = 'P_COSTE_MATERIAL'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 44
          end
          object DBEPCosteAdhesivo: TLFDbedit
            Left = 443
            Top = 419
            Width = 75
            Height = 21
            DataField = 'P_COSTE_ADHESIVO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 53
          end
          object DBEPCosteTinta1: TLFDbedit
            Left = 895
            Top = 331
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA1'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 63
          end
          object DBEPCosteCaja: TLFDbedit
            Left = 443
            Top = 441
            Width = 75
            Height = 21
            DataField = 'P_COSTE_CAJA'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 55
          end
          object DBEPCosteTinta2: TLFDbedit
            Left = 895
            Top = 353
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA2'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 65
          end
          object DBEPCosteTinta3: TLFDbedit
            Left = 895
            Top = 375
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA3'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 67
          end
          object DBEPCosteTinta4: TLFDbedit
            Left = 895
            Top = 397
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA4'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 69
          end
          object DBEPCosteTinta5: TLFDbedit
            Left = 895
            Top = 419
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA5'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 71
          end
          object DBEPCosteTinta6: TLFDbedit
            Left = 895
            Top = 441
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA6'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 73
          end
          object DBEPCosteTinta7: TLFDbedit
            Left = 895
            Top = 463
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA7'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 75
          end
          object DBEPCosteTinta8: TLFDbedit
            Left = 895
            Top = 485
            Width = 76
            Height = 21
            DataField = 'P_COSTE_TINTA8'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 77
          end
          object DBEPRecurso: TLFDbedit
            Left = 443
            Top = 485
            Width = 75
            Height = 21
            DataField = 'P_COSTE_RECURSO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 59
          end
          object DBEDescRecurso: TLFDbedit
            Left = 218
            Top = 485
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescRecurso'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 99
          end
          object DBEDescArtPortes: TLFDbedit
            Left = 218
            Top = 463
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArtPortes'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 100
          end
          object DBEPPortes: TLFDbedit
            Left = 443
            Top = 463
            Width = 75
            Height = 21
            DataField = 'P_COSTE_PORTES'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 57
          end
          object LDBEFPortes: TLFDBEditFind2000
            Left = 126
            Top = 463
            Width = 91
            Height = 21
            DataField = 'ARTICULO_PORTES'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 56
            OnChange = LDBEFPortesChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object LDBEFRecurso: TLFDBEditFind2000
            Left = 126
            Top = 485
            Width = 91
            Height = 21
            DataField = 'RECURSO'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 58
            OnChange = LDBEFRecursoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
          end
          object DBEPCosteBarniz: TLFDbedit
            Left = 443
            Top = 375
            Width = 75
            Height = 21
            DataField = 'P_COSTE_BARNIZ'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 50
          end
        end
      end
      object TSDatos: TTabSheet [1]
        Caption = '&Datos'
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 1009
          Height = 26
          EdgeBorders = []
          TabOrder = 0
          Separators = True
          object PNLDatosPresupuesto: TLFPanel
            Left = 0
            Top = 2
            Width = 486
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LDatosPresupuesto: TLFLabel
              Left = 7
              Top = 4
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Presupuesto'
              FocusControl = DBEDatosPresupuesto
            end
            object LDatosCliente: TLFLabel
              Left = 128
              Top = 5
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
              FocusControl = DBEDatosTituloCliente
            end
            object DBEDatosTituloCliente: TLFDbedit
              Left = 214
              Top = 1
              Width = 270
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO_CLIENTE'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEDatosPresupuesto: TLFDbedit
              Left = 71
              Top = 1
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'N_PRESUPUETO'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEFDatosCliente: TLFDBEditFind2000
              Left = 164
              Top = 1
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CLIENTES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object NavDetalle: THYMNavigator
            Left = 486
            Top = 2
            Width = 220
            Height = 22
            DataSource = ZDMPresupuesto.DSQMDetalle
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDatosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = True
            ControlEdit = CEDatos
            OrdenAscendente = True
            InsertaUltimo = True
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 1009
          Height = 490
          Align = alClient
          Ctl3D = True
          DataSource = ZDMPresupuesto.DSQMDetalle
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFDetalleColEnter
          OnDrawColumnCell = DBGFDetalleDrawColumnCell
          OnDblClick = DBGFDetalleDblClick
          Insercion = False
          ColumnaInicial = 4
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
          BuscarChars = False
          Campos.Strings = (
            'MAQUINA'
            'TINTA')
          CamposAMostrar.Strings = (
            'MAQUINA'
            '2'
            'TIEMPO_CAMBIO_PLANCHA'
            'ML_CAMBIO_PLANCHA'
            'TINTA'
            '4'
            'VELOCIDAD'
            'POLIMEROS'
            'GRAMOS_BARNIZ'
            'CAMBIO_COLOR')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            'CODMAQ'
            'TINTA')
          CamposDesplegar.Strings = (
            '1'
            '1')
          CampoAOrdenarColor = clBlack
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'LINEA')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODMAQ'
            'TINTA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'Z_MAQUINAS_CAB'
            'Z_MAQUINAS_DET')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'DESCRIPCION'
            'GRAMOS_TINTA')
          Posicion = tpCentrado
          OnBusqueda = DBGFDetalleBusqueda
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            ''
            ''
            ''
            '')
          Filtros = [obEmpresa]
          Entorno = DMFacturas.EntornoDoc
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'N_PRESUPUESTO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_ESC'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TINTA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RECURSO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_RECURSO'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AVANCE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEPARACION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ANCHO_TOTAL'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FIGURAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARREGLO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAMBIOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO_BOBINA'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ML_TIRAJE'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ML_TOTAL'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'M2'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ML_PREPARACION'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ML_CAMBIO_BOBINA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ML_CAMBIO_COLOR'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ML_CAMBIO_PLANCHA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HORAS_PREPARACION_MAQUINA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HORAS_IMPRESION'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HORAS_CAMBIO_POLIMEROS'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HORAS_CAMBIO_BOBINAS'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VALOR_CAMBIO_BOBINA'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VALOR_CAMBIO'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CAMBIO_COLOR'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_CAJAS'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HORAS_CAMBIOS'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COSTE_CAMBIO_BOBINAS'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_HORAS'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO_HORAS_IMPRESION'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LONGITUD_BOBINA'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ML_CAMBIO_BOBINA_CTE'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VALOR_ML_CAMBIO_PLANCHA'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'GRAMOS_TINTA'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'GRAMOS_BARNIZ'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'KGS_TINTA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'KGS_BARNIZ'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIEMPO_PREPARACION'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VALOR_HORAS_CAMBIO'
              ReadOnly = True
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVP'
              Visible = True
            end>
        end
      end
      object TSNotas: TTabSheet [2]
        Caption = '&Notas'
        ImageIndex = 2
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1009
          Height = 26
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLNotasPresupuesto: TLFPanel
            Left = 0
            Top = 0
            Width = 486
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LNotasPresupuesto: TLFLabel
              Left = 7
              Top = 4
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Presupuesto'
              FocusControl = DBENotasPresupuesto
            end
            object LNotasCliente: TLFLabel
              Left = 128
              Top = 5
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
              FocusControl = DBENotasTituloCliente
            end
            object DBENotasTituloCliente: TLFDbedit
              Left = 214
              Top = 1
              Width = 270
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO_CLIENTE'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBENotasPresupuesto: TLFDbedit
              Left = 71
              Top = 1
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'N_PRESUPUETO'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEFNotasCliente: TLFDBEditFind2000
              Left = 164
              Top = 1
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CLIENTES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object ToolButton1: TToolButton
            Left = 486
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 494
            Top = 0
            Width = 80
            Height = 22
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
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
        object PNotas: TLFPanel
          Left = 0
          Top = 26
          Width = 1009
          Height = 490
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 1009
            Height = 490
            Align = alClient
            DataField = 'NOTAS'
            DataSource = ZDMPresupuesto.DSQMPresupuesto
            TabOrder = 0
          end
        end
      end
      object TSImagen: TTabSheet [3]
        Caption = '&Imagen'
        ImageIndex = 2
        object IImagenes: TImage
          Left = 0
          Top = 29
          Width = 1009
          Height = 487
          Align = alClient
          AutoSize = True
          Center = True
        end
        object TBImagen: TLFToolBar
          Left = 0
          Top = 0
          Width = 1009
          Height = 29
          ButtonHeight = 21
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object PNLNotasPrespuesto: TLFPanel
            Left = 0
            Top = 2
            Width = 574
            Height = 21
            BevelOuter = bvNone
            TabOrder = 0
            object LImagenPresupuesto: TLFLabel
              Left = 5
              Top = 4
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Presupuesto'
              FocusControl = DBEImagenPresupuesto
            end
            object LImagenCliente: TLFLabel
              Left = 134
              Top = 4
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
              FocusControl = DBEImagenTituloCliente
            end
            object DBEImagenPresupuesto: TLFDbedit
              Left = 70
              Top = 0
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'N_PRESUPUETO'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEFImagenCliente: TLFDBEditFind2000
              Left = 171
              Top = 0
              Width = 49
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CLIENTES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEImagenTituloCliente: TLFDbedit
              Left = 221
              Top = 0
              Width = 351
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO_CLIENTE'
              DataSource = ZDMPresupuesto.DSQMPresupuesto
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
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1009
          Height = 516
          DataSource = ZDMPresupuesto.DSQMPresupuesto
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'DESCRIPCION'
            'FECHA_EMISION'
            'N_PRESUPUETO'
            'TITULO_CLIENTE')
          Columns = <
            item
              Expanded = False
              FieldName = 'N_PRESUPUETO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_EMISION'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CLIENTE'
              Width = 221
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 140
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 574
    Width = 1021
  end
  inherited CEMain: TControlEdit
    Left = 324
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 376
    Top = 32
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
    Left = 640
    Top = 16
    object ACrearOfertaEscandallo: TAction
      Category = 'Procesos'
      Caption = 'Crear Oferta Escandallo'
      Hint = 'Crear Oferta Escandallo'
      ImageIndex = 72
      OnExecute = ACrearOfertaEscandalloExecute
    end
    object ABorrarOfertaEscandallo: TAction
      Category = 'Procesos'
      Caption = 'Eliminar Oferta Escandallo'
      ImageIndex = 27
      OnExecute = ABorrarOfertaEscandalloExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AListado: TAction
      Category = 'Listados'
      Caption = 'Listado Presupuesto'
      ImageIndex = 14
      OnExecute = AListadoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfiguracion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n Listado'
      ImageIndex = 77
      OnExecute = AConfiguracionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 576
    Top = 16
  end
  object OPPathImagen: TOpenPictureDialog
    DefaultExt = '*.bmp'
    Filter = 
      'Archivos de imagenes|*.jpg;*.jpeg;*.bmp;*.gif|JPEG|*.jpg;*.jpeg|' +
      'BMP|*.bmp|GIF|*.gif|Todos los archivos|*.*'
    Left = 425
    Top = 7
  end
  object CENotas: TControlEdit
    DataSource = ZDMPresupuesto.DSQMPresupuesto
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 528
    Top = 12
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 532
    Top = 136
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
  object PMImprime: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 472
    Top = 16
    object Listado11: TMenuItem
      Caption = 'Listado Presupuesto Mod1 Castellano'
      OnClick = Listado11Click
    end
    object Listado21: TMenuItem
      Caption = 'Listado Presupuesto Mod2 Castellano'
      OnClick = Listado21Click
    end
    object ListadoPresupuestoMod1Cataln1: TMenuItem
      Caption = 'Listado Presupuesto Mod1 Catal'#225'n'
      OnClick = ListadoPresupuestoMod1Cataln1Click
    end
    object ListadoPresupuestoMod2Cataln1: TMenuItem
      Caption = 'Listado Presupuesto Mod2 Catal'#225'n'
      OnClick = ListadoPresupuestoMod2Cataln1Click
    end
    object ListadoPresupuestoMod1Francs1: TMenuItem
      Caption = 'Listado Presupuesto Mod1 Franc'#233's'
      OnClick = ListadoPresupuestoMod1Francs1Click
    end
    object ListadoPresupuestoMod2Francs1: TMenuItem
      Caption = 'Listado Presupuesto Mod2 Franc'#233's'
      OnClick = ListadoPresupuestoMod2Francs1Click
    end
  end
  object CEDatosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 672
    Top = 168
    object CEDatosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDatosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDatosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDatosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDatosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDatosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDatosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDatosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDatosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDatosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDatos: TControlEdit
    FichaEdicion = TSDatos
    FichaExclusiva = TSDatos
    PopUpMenu = CEDatosPMEdit
    Teclas = DMMain.Teclas
    Left = 736
    Top = 156
  end
end
