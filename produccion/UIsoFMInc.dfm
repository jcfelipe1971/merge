inherited IsoFMINC: TIsoFMINC
  Left = 332
  Top = 96
  Width = 800
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Informes No Conformidad'
  FormStyle = fsNormal
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 547
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = IsoDMInc.DSQMInc
        Hints.Strings = ()
        EditaControl = DBEFTipo
        InsertaControl = DBEFTipo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBEFTipo
        Busca02 = DBEFTercero
        Busca05 = DBEFResponsable
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Visible = True
        OnClick = TbuttCompClick
      end
      object ToolButton2: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 517
      inherited TSFicha: TTabSheet
        object SBADevolver: TSpeedButton [0]
          Left = 225
          Top = 193
          Width = 32
          Height = 23
          Hint = 'Doble click o Ctrl+Alt+D para ver los datos de la devolucion'
          GroupIndex = -1
          Caption = 'ADevolver'
          ParentShowHint = False
          ShowHint = True
          OnDblClick = SBADevolverDblClick
        end
        object SBADoc: TSpeedButton [1]
          Left = 24
          Top = 4
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+S para ver los datos del Documento'
          GroupIndex = -1
          OnDblClick = SBADocDblClick
        end
        inherited PEdit: TLFPanel
          Width = 778
          Height = 321
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 8
            Top = 57
            DataSource = IsoDMInc.DSQMInc
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ISO_NO_CONFORMIDAD'
            CampoNum = 'RIC'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIC')
          end
          object LSuRef: TLFLabel
            Left = 625
            Top = 114
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LNDoc: TLFLabel
            Left = 441
            Top = 114
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Devolucion'
          end
          object LContador: TLFLabel
            Left = 614
            Top = 4
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador'
          end
          object LFFEchaCierre: TLFLabel
            Left = 536
            Top = 292
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cierre'
          end
          object LEvidencia: TLFLabel
            Left = 439
            Top = 157
            Width = 53
            Height = 13
            Caption = 'Resoluci'#243'n'
          end
          object LDepartamento: TLFLabel
            Left = 18
            Top = 114
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Departamento'
            FocusControl = DBETituloDepartamento
          end
          object LCosteAcciones: TLFLabel
            Left = 441
            Top = 48
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste Acciones'
          end
          object LCantidad: TLFLabel
            Left = 463
            Top = 26
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidades'
            FocusControl = DBECantidad
          end
          object LbTercero: TLFLabel
            Left = 49
            Top = 47
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLTipo: TLFLabel
            Left = 144
            Top = 4
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBLSerieDoc: TLFLabel
            Left = 467
            Top = 70
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie Doc.'
          end
          object LBLRIC: TLFLabel
            Left = 67
            Top = 4
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'INC'
          end
          object LBLResponsable: TLFLabel
            Left = 23
            Top = 92
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
            FocusControl = DBETituloEmpleado
          end
          object LBLPorClas: TLFLabel
            Left = 461
            Top = 92
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factor Clas.'
          end
          object LBLNDoc: TLFLabel
            Left = 612
            Top = 70
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Doc.'
          end
          object LBLLugar: TLFLabel
            Left = 54
            Top = 70
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Origen'
          end
          object LBLFechaInc: TLFLabel
            Left = 468
            Top = 4
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inc'
          end
          object LBLDescripcion: TLFLabel
            Left = 29
            Top = 136
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LbCliPro: TLFLabel
            Left = 17
            Top = 26
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Cli./Prov.'
          end
          object LActuacion: TLFLabel
            Left = 91
            Top = 157
            Width = 48
            Height = 13
            Caption = 'Actuaci'#243'n'
          end
          object DBCBAceptar: TLFDBCheckBox
            Left = 227
            Top = 273
            Width = 130
            Height = 17
            Caption = 'Aceptar tal cual'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            OnClick = DBCBAceptarClick
            Alignment = taLeftJustify
            DataField = 'ACEPTAR'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDContador: TLFDbedit
            Left = 661
            Top = 0
            Width = 97
            Height = 21
            Color = clInfoBk
            DataField = 'CONTADOR'
            DataSource = IsoDMInc.DSQMInc
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object LFDBECliPro: TLFDBEditFind2000
            Left = 90
            Top = 22
            Width = 48
            Height = 21
            DataField = 'CLIPRO'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 5
            OnChange = LFDBECliProChange
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
            OnBusqueda = LFDBECliProBusqueda
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDbDescCliPro: TLFEdit
            Left = 140
            Top = 22
            Width = 297
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
          object LFDBCosteINC: TLFDbedit
            Left = 610
            Top = 44
            Width = 88
            Height = 21
            DataField = 'COSTE_INC'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 11
          end
          object LFDBCosteAcc: TLFDbedit
            Left = 520
            Top = 44
            Width = 88
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'COSTE_TOTAL'
            DataSource = IsoDMInc.DSQMInc
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBMEvidencia: TLFDBMemo
            Left = 440
            Top = 172
            Width = 318
            Height = 83
            DataField = 'EVIDENCIA'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 32
          end
          object DBMemo: TLFDBMemo
            Left = 90
            Top = 172
            Width = 319
            Height = 83
            DataField = 'NOTAS'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 25
          end
          object DBFEchaCierre: TLFDBDateEdit
            Left = 599
            Top = 288
            Width = 97
            Height = 21
            DataField = 'FECHA_CIERRE'
            DataSource = IsoDMInc.DSQMInc
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 36
          end
          object DBETituloTipo: TLFDbedit
            Left = 218
            Top = 0
            Width = 219
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION_TIPO'
            DataSource = IsoDMInc.DSQMInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBETituloTercero: TLFDbedit
            Left = 140
            Top = 44
            Width = 297
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = IsoDMInc.DSQMInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBETituloFactorCla: TLFDbedit
            Left = 571
            Top = 88
            Width = 187
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = IsoDMInc.DsxFactorCla
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object DBETituloEmpleado: TLFDbedit
            Left = 140
            Top = 88
            Width = 297
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_RESPONSABLE'
            DataSource = IsoDMInc.DSQMInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object DBETituloDocumento: TLFDbedit
            Left = 140
            Top = 66
            Width = 297
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = IsoDMInc.DSxTipoDocumento
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBETituloDepartamento: TLFDbedit
            Left = 140
            Top = 110
            Width = 297
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_DEPARTAMENTO'
            DataSource = IsoDMInc.DSQMInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 21
          end
          object DBESuRef: TLFDbedit
            Left = 661
            Top = 110
            Width = 97
            Height = 21
            DataField = 'REFERENCIACLI'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 23
          end
          object DBESerieDoc: TLFDBEditFind2000
            Left = 521
            Top = 66
            Width = 88
            Height = 21
            DataField = 'SERIE_DOC'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 14
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
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBENDocCli: TLFDbedit
            Left = 521
            Top = 110
            Width = 88
            Height = 21
            DataField = 'NDOCCLI'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 22
          end
          object DBENDev: TLFDbedit
            Left = 359
            Top = 256
            Width = 34
            Height = 21
            DataField = 'NDEVOLUCION'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 30
            Visible = False
            OnDblClick = SBADevolverDblClick
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 169
            Top = 0
            Width = 48
            Height = 21
            DataField = 'TIPO'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 1
            OnChange = DBEFTipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ISO_NO_CONFORMIDAD_TIPO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 90
            Top = 44
            Width = 48
            Height = 21
            DataField = 'CLI_PRO_INTE'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 8
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
            OnBusqueda = DBEFTerceroBusqueda
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
          end
          object DBEFResponsable: TLFDBEditFind2000
            Left = 90
            Top = 88
            Width = 48
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 16
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFFactorCla: TLFDBEditFind2000
            Left = 521
            Top = 88
            Width = 48
            Height = 21
            DataField = 'POR_CLASIFICA'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 18
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ISO_INC_FACTOR_CLA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'COD'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEFDocumento: TLFDBEditFind2000
            Left = 90
            Top = 66
            Width = 48
            Height = 21
            DataField = 'SITUACION'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 12
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ISO_INC_DOCUMENTO_TIPO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEDoc: TLFDBEditFind2000
            Left = 661
            Top = 66
            Width = 97
            Height = 21
            DataField = 'NUM_DOC'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 15
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RIG'
            CampoStr = 'FECHA'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEDocBusqueda
            OrdenadoPor.Strings = (
              'RIG')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEdFDepartamento: TLFDBEditFind2000
            Left = 90
            Top = 110
            Width = 48
            Height = 21
            DataField = 'DEPARTAMENTO'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 20
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_DEPARTAMENTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DEPARTAMENTO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DEPARTAMENTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescripcion: TLFDbedit
            Left = 90
            Top = 132
            Width = 668
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 24
          end
          object DBECodigo: TLFDbedit
            Left = 90
            Top = 0
            Width = 48
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIC'
            DataSource = IsoDMInc.DSQMInc
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
          object DBECantidad: TLFDbedit
            Left = 520
            Top = 22
            Width = 88
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CANTIDAD'
            DataSource = IsoDMInc.DSQMInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBDTPFechaInc: TLFDBDateEdit
            Left = 520
            Top = 0
            Width = 88
            Height = 21
            DataField = 'FECHA_INC'
            DataSource = IsoDMInc.DSQMInc
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBCBVBCalidad: TLFDBCheckBox
            Left = 439
            Top = 273
            Width = 130
            Height = 17
            Caption = 'V'#186' B'#186' Calidad'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 34
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VBCALIDAD'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBTirar: TLFDBCheckBox
            Left = 90
            Top = 255
            Width = 130
            Height = 17
            Caption = 'Tirar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 26
            TabStop = True
            OnClick = DBCBTirarClick
            Alignment = taLeftJustify
            DataField = 'TIRAR'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBRespDepart: TLFDBCheckBox
            Left = 439
            Top = 255
            Width = 239
            Height = 17
            Caption = 'V'#186' B'#186' Responsable Depto. Afectado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 33
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VBRESDEPARTAMENTO'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBRecuperar: TLFDBCheckBox
            Left = 90
            Top = 273
            Width = 130
            Height = 17
            Caption = 'Reparar'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            ParentColor = False
            TabOrder = 27
            TabStop = True
            OnClick = DBCBRecuperarClick
            Alignment = taLeftJustify
            DataField = 'RECUPERAR_ISO'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPiezas: TLFDBCheckBox
            Left = 439
            Top = 291
            Width = 60
            Height = 17
            Caption = 'Cerrado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 35
            TabStop = True
            OnClick = DBCBPiezasClick
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBOtros: TLFDBCheckBox
            Left = 90
            Top = 291
            Width = 130
            Height = 17
            Caption = 'Otros'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 28
            TabStop = True
            OnClick = DBCBOtrosClick
            Alignment = taLeftJustify
            DataField = 'OTROS'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBDevolver: TLFDBCheckBox
            Left = 227
            Top = 255
            Width = 130
            Height = 17
            Caption = 'Devolver al proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 29
            TabStop = True
            OnClick = DBCBDevolverClick
            Alignment = taLeftJustify
            DataField = 'DEVOLVER'
            DataSource = IsoDMInc.DSQMInc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 321
          Width = 778
          Height = 168
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 778
            Height = 26
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavDet: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = IsoDMInc.DSQMDetArticulos
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFDetArticulo
              InsertaControl = DBGFDetArticulo
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = True
            end
            object ToolButton8: TToolButton
              Left = 240
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtNotasDetalle: TToolButton
              Left = 248
              Top = 0
              Action = ANotasDetalle
            end
            object TBAcciones: TToolButton
              Left = 271
              Top = 0
              Action = AAcciones
              ParentShowHint = False
              ShowHint = True
            end
          end
          object PCDetalle: TLFPageControl
            Left = 0
            Top = 26
            Width = 778
            Height = 142
            ActivePage = TSDetAccion
            Align = alClient
            OwnerDraw = True
            TabIndex = 1
            TabOrder = 1
            TabPosition = tpBottom
            OnChange = PCDetalleChange
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSDetArticulos: TTabSheet
              Caption = '&Art'#237'culos'
              ImageIndex = 1
              OnShow = TSDetArticulosShow
              object DBGFDetArticulo: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 770
                Height = 116
                Align = alClient
                DataSource = IsoDMInc.DSQMDetArticulos
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                IniStorage = FSMain
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
                CondicionBusqueda = 'familia<>'#39'SYS'#39
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
                  '')
                Filtros = [obEmpresa, obEjercicio, obCanal]
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
                    Visible = True
                  end
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
                    Width = 282
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CANTIDAD'
                    Visible = True
                  end>
              end
            end
            object TSDetAccion: TTabSheet
              Caption = 'A&cciones'
              OnShow = TSDetAccionShow
              object DBGFDetalle: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 770
                Height = 116
                Align = alClient
                DataSource = IsoDMInc.DSQMDetalle
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                IniStorage = FSMain
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
                BuscarNums = False
                Campos.Strings = (
                  'RESPONSABLE_ACCION'
                  'TIPO_ACCION')
                CamposAMostrar.Strings = (
                  'RESPONSABLE_ACCION'
                  '0'
                  'TIPO_ACCION'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0'
                  '0'
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
                  'ACCION'
                  'TIPO_ACCION'
                  'NUM_DOC'
                  'RIC'
                  'RESPONSABLE_ACCION'
                  'FECHA_ACCION')
                ColumnasCheckBoxes.Strings = (
                  'REALIZADO')
                ColumnasChecked.Strings = (
                  '1')
                ColumnasNoChecked.Strings = (
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'EMPLEADO'
                  'TIPO')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'VER_EMPLEADOS_EF'
                  'ISO_INC_ACCIONES_TIPO')
                Acciones.Strings = (
                  ''
                  '')
                Titulos.Strings = (
                  'TITULO'
                  'DESCRIPCION')
                Posicion = tpCentrado
                OnBusqueda = DBGFDetalleBusqueda
                Planes.Strings = (
                  ''
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  'EMPLEADO'
                  'TIPO'
                  ''
                  '')
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ACCION'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_ACCION'
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescTipo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DEFINICION_ACCION'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RESPONSABLE_ACCION'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescResponsable'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_ACCION'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'SERIE_DOC'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'NUM_DOC'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REALIZADO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COSTE'
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object LFPNotas: TLFPanel
          Left = 0
          Top = 49
          Width = 778
          Height = 440
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBMNotas: TDBRichEdit
            Left = 0
            Top = 0
            Width = 778
            Height = 440
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'NOTAS_INC'
            DataSource = IsoDMInc.DSQMInc
            TabOrder = 0
            OnSelectionChange = SelectionChange
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 778
          Height = 23
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object DBRicNotas: TLFDbedit
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CONTADOR'
            DataSource = IsoDMInc.DSQMInc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object ToolButton4: TToolButton
            Left = 40
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object DBETerceroNotas: TLFDbedit
            Left = 48
            Top = 0
            Width = 33
            Height = 21
            Color = clInfoBk
            DataField = 'CLI_PRO_INTE'
            DataSource = IsoDMInc.DSQMInc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEDescTerceroNotas: TLFDbedit
            Left = 81
            Top = 0
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = IsoDMInc.DSQMInc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object ToolButton5: TToolButton
            Left = 323
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 331
            Top = 0
            Width = 80
            Height = 21
            DataSource = IsoDMInc.DSQMInc
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object TButtNotas: TLFToolBar
          Left = 0
          Top = 23
          Width = 778
          Height = 26
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ToolbarImages
          TabOrder = 2
          Separators = True
          object TButtUndo: TToolButton
            Left = 0
            Top = 0
            Caption = 'Deshacer'
            ImageIndex = 4
            OnClick = TButtUndoClick
          end
          object TButtCut: TToolButton
            Left = 23
            Top = 0
            Caption = 'Cortar'
            ImageIndex = 5
            OnClick = TButtCutClick
          end
          object TButtCopy: TToolButton
            Left = 46
            Top = 0
            Caption = 'Copiar'
            ImageIndex = 6
            OnClick = TButtCopyClick
          end
          object TButtPaste: TToolButton
            Left = 69
            Top = 0
            Caption = 'Paste'
            ImageIndex = 7
            OnClick = TButtPasteClick
          end
          object ToolButton6: TToolButton
            Left = 92
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object FontName: TLFComboBox
            Left = 100
            Top = 0
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = FontNameChange
          end
          object FontSize: TLFEdit
            Left = 245
            Top = 0
            Width = 22
            Height = 22
            TabOrder = 1
            Text = '0'
            OnChange = FontSizeChange
          end
          object UpDown1: TUpDown
            Left = 267
            Top = 0
            Width = 15
            Height = 22
            Associate = FontSize
            Min = 0
            Position = 0
            TabOrder = 2
            Wrap = False
          end
          object ToolButton3: TToolButton
            Left = 282
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtNegrita: TToolButton
            Left = 290
            Top = 0
            Caption = 'Negrita'
            ImageIndex = 8
            Style = tbsCheck
            OnClick = TButtNegritaClick
          end
          object TButtCursiva: TToolButton
            Left = 313
            Top = 0
            Caption = 'Cursiva'
            ImageIndex = 9
            Style = tbsCheck
            OnClick = TButtCursivaClick
          end
          object TButtSubrayado: TToolButton
            Left = 336
            Top = 0
            Caption = 'Subrayado'
            ImageIndex = 10
            Style = tbsCheck
            OnClick = TButtSubrayadoClick
          end
          object ToolButton7: TToolButton
            Left = 359
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtLeftAlign: TToolButton
            Left = 367
            Top = 0
            Caption = 'Alinear izquierda'
            Grouped = True
            ImageIndex = 11
            Style = tbsCheck
            OnClick = TButtLeftAlignClick
          end
          object TButtCenterAlign: TToolButton
            Tag = 2
            Left = 390
            Top = 0
            Caption = 'Centrar'
            Grouped = True
            ImageIndex = 12
            Style = tbsCheck
            OnClick = TButtCenterAlignClick
          end
          object TButtRightAlign: TToolButton
            Tag = 1
            Left = 413
            Top = 0
            Caption = 'Alinear derecha'
            Grouped = True
            ImageIndex = 13
            Style = tbsCheck
            OnClick = TButtRightAlignClick
          end
          object ToolButton1: TToolButton
            Left = 436
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtColor: TToolButton
            Left = 444
            Top = 0
            Caption = 'Color'
            ImageIndex = 15
            OnClick = TButtColorClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 489
          DataSource = IsoDMInc.DSQMInc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'ACEPTAR'
            'DEVOLVER'
            'OTROS'
            'RECUPERAR_ISO'
            'TIRAR'
            'VBCALIDAD'
            'VBRESDEPARTAMENTO')
          CamposChecked.Strings = (
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
            '0')
          CamposAOrdenar.Strings = (
            'ACEPTAR'
            'CANTIDAD'
            'CLI_PRO_INTE'
            'CLIPRO'
            'CONTADOR'
            'COSTE_INC'
            'COSTE_TOTAL'
            'DEPARTAMENTO'
            'DESCRIPCION'
            'DESCRIPCION_TIPO'
            'DEVOLVER'
            'EJERCICIO'
            'ESTADO'
            'EVIDENCIA'
            'FECHA_CIERRE'
            'FECHA_INC'
            'LINEA'
            'NDEVOLUCION'
            'NDOCCLI'
            'NOMBRE_R_SOCIAL'
            'NUM_DOC'
            'OTROS'
            'POR_CLASIFICA'
            'RECUPERAR_ISO'
            'REFERENCIACLI'
            'RESPONSABLE'
            'RIC'
            'SERIE_DOC'
            'SITUACION'
            'TIPO'
            'TIRAR'
            'TITULO_DEPARTAMENTO'
            'TITULO_RESPONSABLE'
            'VBCALIDAD'
            'VBRESDEPARTAMENTO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLI_PRO_INTE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SITUACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE_DOC'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_DOC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_RESPONSABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEPARTAMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_DEPARTAMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIRAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEVOLVER'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACEPTAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTROS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VBCALIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VBRESDEPARTAMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POR_CLASIFICA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NDEVOLUCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTADOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EVIDENCIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NDOCCLI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REFERENCIACLI'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 790
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetArt
    Left = 499
    Top = 16
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 528
    Top = 16
  end
  inherited ALMain: TLFActionList
    Left = 704
    Top = 256
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AInformeNoCon: TAction
      Category = 'Listados'
      Caption = 'Informe No Conformidad'
      ImageIndex = 14
      OnExecute = AInformeNoConExecute
    end
    object AEtiquetasNoCon: TAction
      Category = 'Listados'
      Caption = 'Listado Etiquetas'
      ImageIndex = 95
      OnExecute = AEtiquetasNoConExecute
    end
    object ALstResumenInc: TAction
      Category = 'Listados'
      Caption = 'Listado Resumen INC'
      ImageIndex = 14
      OnExecute = ALstResumenIncExecute
    end
    object AConfInformeNoCon: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Informe No Conformidad'
      ImageIndex = 77
      OnExecute = AConfInformeNoConExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ADevolucionArt: TAction
      Category = 'Procesos'
      Caption = 'Devolucion art'#237'culos'
      ImageIndex = 70
      OnExecute = ADevolucionArtExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AEtiquetadNoconf: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiquetas No Conformidad'
      ImageIndex = 77
      OnExecute = AEtiquetadNoconfExecute
    end
    object AConfInformeLstResumenInc: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Resumen INC'
      ImageIndex = 77
      OnExecute = AConfInformeLstResumenIncExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntoIncidencia: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de Inf. No Conformidad'
      Hint = 'Visualiza los adjuntos de Informe No Conformidad'
      ImageIndex = 59
      OnExecute = AAdjuntoIncidenciaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 696
    Top = 184
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSDetAccion
    FichaExclusiva = TSDetAccion
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 640
    Top = 15
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 672
    Top = 15
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDetArt: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = TSDetArticulos
    FichaExclusiva = TSDetArticulos
    PopUpMenu = CEDetArtPMEdit
    Teclas = DMMain.Teclas
    Left = 567
    Top = 15
  end
  object CEDetArtPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 599
    Top = 15
    object CEDetArtMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CEDetArtMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CEDetArtMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CEDetArtMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CEDetArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CEDetArtMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CEDetArtMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CEDetArtMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CEDetArtMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CEDetArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = LFPNotas
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 408
    Top = 16
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 440
    Top = 16
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
  object ALInc: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 616
    Top = 260
    object ANotasDetalle: TAction
      Caption = 'Notas'
      Hint = 'Edita les notas de la linea seleccionada (Ctrl + N)'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
    end
    object AAcciones: TAction
      Hint = 'Mantenimiento de Acciones'
      ImageIndex = 94
      OnExecute = AAccionesExecute
    end
    object ADevolucion: TAction
      ImageIndex = 27
    end
    object ADevolver: TAction
      Caption = 'ADevolver'
      Hint = 'Doble click o Ctrl+Alt+D para ver los datos de la devolucion'
      ShortCut = 49220
      OnExecute = ADevolverExecute
    end
    object AAbreDocs: TAction
      Caption = 'Abre Documento'
      OnExecute = AAbreDocsExecute
    end
  end
end
