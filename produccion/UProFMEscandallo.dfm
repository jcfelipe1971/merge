inherited ProFMEscandallo: TProFMEscandallo
  Left = 270
  Top = 104
  Width = 1279
  Height = 724
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Escandallo'
  FormStyle = fsNormal
  PopupMenu = CEPreciosPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1269
    Height = 671
    inherited TBMain: TLFToolBar
      Width = 1265
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = ProDMEscandallo.DSQMProEscandallo
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEFCompuesto
        InsertaUltimo = True
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
      object TButtInfoStocksCompuesto: TToolButton
        Left = 299
        Top = 0
        Hint = 'Informaci'#243'n de Stocks'
        Caption = 'Informaci'#243'n de Stocks'
        ImageIndex = 1
        OnClick = AInfoStockExecute
      end
      object ToolButton6: TToolButton
        Left = 322
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object TButtInforme: TToolButton
        Left = 330
        Top = 0
        Hint = 'Ver Informe de Escandallo'
        Caption = 'Ver Informe de Escandallo'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtInformeClick
      end
      object TBArbol: TToolButton
        Left = 353
        Top = 0
        Hint = 'Refresco del '#225'rbol'
        Caption = 'TBArbol'
        ImageIndex = 137
        OnClick = TBArbolClick
      end
      object TBDocumentos: TToolButton
        Left = 376
        Top = 0
        Hint = 'Documentos de escandallo'
        Caption = 'Documentos de escandallo'
        ImageIndex = 87
        OnClick = TBDocumentosClick
      end
      object TBCarpetas: TToolButton
        Left = 399
        Top = 0
        Hint = 'Explorar Carpetas'
        ImageIndex = 81
        OnClick = TBCarpetasClick
      end
      object ToolButton4: TToolButton
        Left = 422
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBActivo: TToolButton
        Left = 430
        Top = 0
        Hint = 'Desactiva Escandallo'
        Caption = 'Activo'
        DropdownMenu = PMEstado
        ImageIndex = 67
        Style = tbsDropDown
      end
      object BTCalcForm: TToolButton
        Left = 466
        Top = 0
        Action = ACalculoFormulas
      end
      object TBPrecios: TToolButton
        Left = 489
        Top = 0
        Action = AActPrecios
        ImageIndex = 56
      end
      object ToolButton5: TToolButton
        Left = 512
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBCalcFiltro: TToolButton
        Left = 520
        Top = 0
        Hint = 'C'#225'culo escandallo'
        ImageIndex = 18
        OnClick = TBCalcFiltroClick
      end
      object TButtFiltraComponente: TToolButton
        Left = 543
        Top = 0
        Action = AFiltraComponente
        ImageIndex = 5
      end
      object TButtFiltraSubescandallos: TToolButton
        Left = 566
        Top = 0
        Action = AFiltraSubescandallos
        ImageIndex = 5
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1265
      Height = 587
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBACompuesto: TSpeedButton [0]
          Left = 123
          Top = 42
          Width = 160
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
          GroupIndex = -1
          OnDblClick = SBACompuestoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1257
          Height = 209
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 27
            Top = 5
            AutoSize = True
            Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LblEscandallo: TLFLabel
            Left = 147
            Top = 16
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
            FocusControl = DBEEscandallo
          end
          object LblCompuesto: TLFLabel
            Left = 10
            Top = 38
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Compuesto'
          end
          object LblFecha: TLFLabel
            Left = 565
            Top = 16
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Creaci'#243'n'
          end
          object LblUnidades: TLFLabel
            Left = 18
            Top = 60
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
            FocusControl = DBEUnidades
          end
          object LblMedida1: TLFLabel
            Left = 587
            Top = 82
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 1'
            FocusControl = DBEMedida1
          end
          object LBLVersion: TLFLabel
            Left = 456
            Top = 16
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Versi'#243'n'
          end
          object LblUnidad: TLFLabel
            Left = 137
            Top = 60
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidad'
          end
          object LblMedida2: TLFLabel
            Left = 587
            Top = 104
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 2'
            FocusControl = DBEMedida2
          end
          object LblMedida3: TLFLabel
            Left = 587
            Top = 126
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 3'
            FocusControl = DBEMedida3
          end
          object LblArbol: TLFLabel
            Left = 3
            Top = 192
            Width = 38
            Height = 16
            Caption = #193'rbol'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblAlmLanz: TLFLabel
            Left = 17
            Top = 148
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm.Lanz.'
          end
          object LblAlmEntrada: TLFLabel
            Left = 6
            Top = 170
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm.Entrada'
          end
          object LblAlmSalida: TLFLabel
            Left = 14
            Top = 126
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm.Salida'
          end
          object LblMedida4: TLFLabel
            Left = 587
            Top = 148
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 4'
          end
          object LDescripcion: TLFLabel
            Left = 7
            Top = 82
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object Z_LblEstado: TLFLabel
            Left = 274
            Top = 16
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object Z_LblTipoControl: TLFLabel
            Left = 573
            Top = 170
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Control'
          end
          object LResponsable: TLFLabel
            Left = 1
            Top = 104
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LDiasPlazoFabricacion: TLFLabel
            Left = 439
            Top = 104
            Width = 50
            Height = 13
            Hint = 'Dias plazo fabricaci'#243'n'
            Alignment = taRightJustify
            Caption = 'Plazo Fab.'
          end
          object LLoteOptimo: TLFLabel
            Left = 432
            Top = 60
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote '#211'ptimo'
            ParentShowHint = False
            ShowHint = False
          end
          object LMerma: TLFLabel
            Left = 457
            Top = 82
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Merma'
          end
          object LUnidadesXCaja: TLFLabel
            Left = 413
            Top = 148
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades x caja'
          end
          object LTiempoEstimado: TLFLabel
            Left = 408
            Top = 126
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tiempo Estimado'
          end
          object LblSubtipo: TLFLabel
            Left = 595
            Top = 60
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subtipo'
            FocusControl = DBEMedida1
          end
          object LIdEscandallo: TLFLabel
            Left = 30
            Top = 16
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Esc.'
            FocusControl = DBEIdEscandallo
          end
          object LCajasXBulto: TLFLabel
            Left = 428
            Top = 170
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cajas x Bulto'
          end
          object DBEEscandallo: TLFDbedit
            Left = 203
            Top = 12
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ESCANDALLO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
          end
          object DBEFCompuesto: TLFDBEditFind2000
            Left = 67
            Top = 34
            Width = 88
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'COMPUESTO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 0
            OnChange = DBEFCompuestoChange
            OnExit = DBEFCompuestoExit
            Accion = ANewArticulo
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CampoADevolver = 'ARTICULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 635
            Top = 12
            Width = 100
            Height = 21
            DataField = 'FECHA_CREAC'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBEUnidades: TLFDbedit
            Left = 67
            Top = 56
            Width = 60
            Height = 21
            DataField = 'UNIDADES'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 1
          end
          object DBEFUnidad: TLFDBEditFind2000
            Left = 175
            Top = 56
            Width = 41
            Height = 21
            AutoSize = False
            DataField = 'UNIDAD'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 2
            OnChange = DBEFUnidadChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_UNIDADES_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEMedida1: TLFDbedit
            Left = 635
            Top = 78
            Width = 63
            Height = 21
            DataField = 'MEDIDA_1'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 18
          end
          object DBEMedida2: TLFDbedit
            Left = 635
            Top = 100
            Width = 63
            Height = 21
            DataField = 'MEDIDA_2'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 19
          end
          object DBEVersion: TLFDbedit
            Left = 494
            Top = 12
            Width = 64
            Height = 21
            DataField = 'VERSION_ESCANDALLO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 8
          end
          object DBEMedida3: TLFDbedit
            Left = 635
            Top = 122
            Width = 63
            Height = 21
            DataField = 'MEDIDA_3'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 20
          end
          object DBEFAlmacenEnt: TLFDBEditFind2000
            Left = 67
            Top = 166
            Width = 60
            Height = 21
            DataField = 'ALMACEN_ENT'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 7
            OnChange = DBEFAlmacenEntChange
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
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAlmacenLan: TLFDBEditFind2000
            Left = 67
            Top = 144
            Width = 60
            Height = 21
            DataField = 'ALMACEN_LAN'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 6
            OnChange = DBEFAlmacenLanChange
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
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCBMateriales: TLFDBCheckBox
            Left = 753
            Top = 80
            Width = 67
            Height = 17
            Caption = 'Materiales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 25
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTUALIZA_MAT'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBRecursos: TLFDBCheckBox
            Left = 753
            Top = 58
            Width = 66
            Height = 17
            Caption = 'Recursos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 24
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTUALIZA_REC'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 753
            Top = 14
            Width = 77
            Height = 17
            Caption = 'Por Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBGeneraOF: TLFDBCheckBox
            Left = 753
            Top = 36
            Width = 118
            Height = 17
            Caption = 'Genera OF Pedido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 23
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GENERA_OF'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GBFirmas: TGroupBox
            Left = 753
            Top = 99
            Width = 104
            Height = 89
            Caption = 'Firmas ISO'
            Enabled = False
            TabOrder = 26
            object ChkBAprobado: TLFCheckBox
              Left = 10
              Top = 17
              Width = 65
              Height = 15
              Caption = 'Aprobado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
            end
            object ChkBVerificado: TLFCheckBox
              Left = 10
              Top = 41
              Width = 66
              Height = 15
              Caption = 'Verificado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
            end
            object ChkBValidado: TLFCheckBox
              Left = 10
              Top = 65
              Width = 64
              Height = 15
              Caption = 'Validado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
            end
          end
          object DescAlmacenEnt: TLFEdit
            Left = 128
            Top = 166
            Width = 267
            Height = 21
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
          object DBEFAlmacenSal: TLFDBEditFind2000
            Left = 67
            Top = 122
            Width = 60
            Height = 21
            DataField = 'ALMACEN_SAL'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 5
            OnChange = DBEFAlmacenSalChange
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
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescAlmacenLan: TLFEdit
            Left = 128
            Top = 144
            Width = 267
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 29
          end
          object DescAlmacenSal: TLFEdit
            Left = 128
            Top = 122
            Width = 267
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 32
          end
          object EDescCompuesto: TLFEdit
            Left = 156
            Top = 34
            Width = 402
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
            OnDblClick = SBACompuestoDblClick
            OnEnter = EDescCompuestoEnter
          end
          object EDescTipoUnidad: TLFEdit
            Left = 217
            Top = 56
            Width = 178
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
            OnEnter = EDescTipoUnidadEnter
          end
          object DBEMedida4: TLFDbedit
            Left = 635
            Top = 144
            Width = 63
            Height = 21
            DataField = 'MEDIDA_4'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 21
          end
          object DBEDescripcion: TLFDbedit
            Left = 67
            Top = 78
            Width = 328
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 3
          end
          object Z_DBCBVTipoControl: TDBComboBoxValue
            Left = 635
            Top = 166
            Width = 118
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_CONTROL'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            ItemHeight = 13
            Items.Strings = (
              'Ninguno'
              'Parcial'
              'Total')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 16
          end
          object LFDBEstado: TLFDbedit
            Left = 311
            Top = 12
            Width = 138
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescEstado'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            ReadOnly = True
            TabOrder = 33
            OnChange = LFDBEstadoChange
          end
          object LFDPlazo_Fab: TLFDbedit
            Left = 494
            Top = 100
            Width = 64
            Height = 21
            DataField = 'PLAZO_FABRICACION'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 12
          end
          object LFDBLoteOptimo: TLFDbedit
            Left = 494
            Top = 56
            Width = 64
            Height = 21
            Hint = 'Cantidad '#243'ptima fabricaci'#243'n'
            DataField = 'LOTE_OPTIMO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
          end
          object LFDBMerma: TLFDbedit
            Left = 494
            Top = 78
            Width = 64
            Height = 21
            DataField = 'MERMA'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 11
          end
          object DBEUnidadesXCaja: TLFDbedit
            Left = 494
            Top = 144
            Width = 64
            Height = 21
            DataField = 'UNIDADES_POR_CAJA'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 14
          end
          object LFResponsable: TLFDBEditFind2000
            Left = 67
            Top = 100
            Width = 60
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 4
            OnChange = LFResponsableChange
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
          object ETituloResponsable: TLFEdit
            Left = 128
            Top = 100
            Width = 267
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 34
          end
          object DBETEstimado: TLFDbedit
            Left = 494
            Top = 122
            Width = 64
            Height = 21
            DataField = 'TIEMPO_ESTIMADO_FABRICACION'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 13
          end
          object DBESubtipo: TLFDBEditFind2000
            Left = 635
            Top = 56
            Width = 63
            Height = 21
            AutoSize = False
            DataField = 'SUBTIPO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 17
            OnChange = DBEFUnidadChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_SUBTIPO_ESCANDALLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SUBTIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'SUBTIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'SUBTIPO')
            Filtros = []
          end
          object DBEIdEscandallo: TLFDbedit
            Left = 67
            Top = 12
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_ESC'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 35
          end
          object DBECajasXBulto: TLFDbedit
            Left = 494
            Top = 166
            Width = 64
            Height = 21
            DataField = 'CAJAS_POR_BULTO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 15
          end
        end
        object Arbol: TTreeView
          Left = 0
          Top = 209
          Width = 1257
          Height = 350
          Align = alClient
          AutoExpand = True
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInfoBk
          Indent = 19
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 1
          TabStop = False
          Items.Data = {
            01000000230000000000000000000000FFFFFFFFFFFFFFFF0000000001000000
            0A457363616E64616C6C6F1E0000000000000000000000FFFFFFFFFFFFFFFF00
            00000002000000054661736573230000000000000000000000FFFFFFFFFFFFFF
            FF00000000000000000A4D6174657269616C65731F0000000000000000000000
            FFFFFFFFFFFFFFFF000000000000000006546172656173}
        end
      end
      object TSDetalle: TTabSheet [1]
        Caption = 'Desarrollo'
        ImageIndex = 2
        OnShow = TSDetalleShow
        object PnlDetEscandallo: TLFPanel
          Left = 0
          Top = 193
          Width = 1257
          Height = 366
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PCMatTar: TLFPageControl
            Left = 0
            Top = 0
            Width = 1257
            Height = 366
            ActivePage = TSMateriales
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            OnChanging = PCMatTarChanging
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSMateriales: TTabSheet
              Caption = 'Materiales'
              OnShow = TSMaterialesShow
              object TBMateriales: TLFToolBar
                Left = 0
                Top = 0
                Width = 1249
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavMateriales: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ProDMEscandallo.DSQMProMatEsc
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEMaterialesPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFMateriales
                  InsertaControl = DBGFMateriales
                  Exclusivo = True
                  ControlEdit = CEMateriales
                  OrdenAscendente = True
                  OnChangeState = NavMaterialesChangeState
                  InsertaUltimo = True
                end
                object TSepMat: TToolButton
                  Left = 200
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtNotasMat: TToolButton
                  Left = 208
                  Top = 0
                  Action = ANotasMaterial
                end
                object ToolButton3: TToolButton
                  Left = 231
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                  Visible = False
                end
                object TButtInfStocksMaterial: TToolButton
                  Left = 239
                  Top = 0
                  Hint = 'Informaci'#243'n de Stocks'
                  Caption = 'Informaci'#243'n de Stocks'
                  ImageIndex = 1
                  OnClick = AInfoStockExecute
                end
                object ToolButton7: TToolButton
                  Left = 262
                  Top = 0
                  Width = 8
                  ImageIndex = 38
                  Style = tbsSeparator
                end
                object ToolButton2: TToolButton
                  Left = 270
                  Top = 0
                  ImageIndex = 21
                  Visible = False
                  OnClick = ToolButton2Click
                end
                object BtCalculaFormDet: TToolButton
                  Left = 293
                  Top = 0
                  Caption = 'Calcula F'#243'rmula'
                  ImageIndex = 3
                  Visible = False
                  OnClick = BtCalculaFormDetClick
                end
                object TButtOrdenLineasMat: TToolButton
                  Left = 316
                  Top = 0
                  Hint = 'Ordenar Lineas Material'
                  Caption = 'Ordenar Lineas Material'
                  ImageIndex = 122
                  OnClick = TButtOrdenLineasMatClick
                end
                object G2kTableLocDetalle: TG2KTBLoc
                  Left = 339
                  Top = 0
                  Hint = 'Localizar'
                  Caption = 'G2kTableLocDetalle'
                  ImageIndex = 83
                  OnClick = G2kTableLocDetalleClick
                  Plan.Strings = (
                    ' ')
                  DataSource = ProDMEscandallo.DSQMProMatEsc
                  Base_de_datos = DMMain.DataBase
                  CampoNum = 'COMPONENTE'
                  CampoStr = 'TITULO'
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                  OrdenadoPor.Strings = (
                    'COMPONENTE')
                end
                object TButtImportarMateriales: TToolButton
                  Left = 362
                  Top = 0
                  Action = AImportarMateriales
                end
                object TButtDuplicarMaterial: TToolButton
                  Left = 385
                  Top = 0
                  Hint = 'Duplicar Material'
                  Caption = 'Duplicar Material'
                  ImageIndex = 37
                  OnClick = TButtDuplicarMaterialClick
                end
                object TBSep4: TToolButton
                  Left = 408
                  Top = 0
                  Width = 8
                  ImageIndex = 38
                  Style = tbsSeparator
                end
                object TBAsociarAdjuntos: TToolButton
                  Left = 416
                  Top = 0
                  Action = AAsociarAdjuntos
                end
              end
              object DBGFMateriales: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 1249
                Height = 316
                Align = alClient
                DataSource = ProDMEscandallo.DSQMProMatEsc
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGFMaterialesCellClick
                OnColEnter = DBGFMaterialesColEnter
                OnDrawColumnCell = DBGFMaterialesDrawColumnCell
                OnDblClick = DBGFMaterialesDblClick
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 1
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
                Transaction = ProDMEscandallo.TLocal
                BuscarNums = False
                Campos.Strings = (
                  'ALMACEN'
                  'COMPONENTE'
                  'MATESC'
                  'UNIDAD_FAB'
                  'UNIDAD_ART'
                  'ID_EQUIVAL'
                  'DES_TIPO_PIEZA'
                  'DES_TIPO_MATERIAL'
                  'FORMULA'
                  'LINEA_TAREA'
                  'ALMACEN_SAL')
                CamposAMostrar.Strings = (
                  'ALMACEN'
                  '0'
                  'COMPONENTE'
                  '0'
                  'MATESC'
                  '1'
                  'VERSION_ESCANDALLO'
                  'UNIDAD_FAB'
                  '0'
                  'UNIDAD_ART'
                  '0'
                  'ID_EQUIVAL'
                  '0'
                  'DES_TIPO_PIEZA'
                  '0'
                  'DES_TIPO_MATERIAL'
                  '0'
                  'FORMULA'
                  '0'
                  'LINEA_TAREA'
                  '0'
                  'ALMACEN_SAL'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80'
                  '80'
                  '80'
                  '0'
                  '0'
                  '0'
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
                  ''
                  ''
                  ''
                  ''
                  'ID_FORMULA'
                  ''
                  '')
                CamposDesplegar.Strings = (
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
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'ACTUALIZA_MAT'
                  'ALMACEN'
                  'COMPONENTE'
                  'ORDEN'
                  'LINEA_COMP'
                  'LINEA_FASE'
                  'PORCENTAJE'
                  'UNIDADES'
                  'ALMACEN_SAL'
                  'TIPO'
                  'TIPO_PIEZA')
                ColumnasCheckBoxes.Strings = (
                  'ACTUALIZA_MAT'
                  'PORCENT_SN'
                  'TIENE_ADJUNTO'
                  'UNIDADES_FIJAS'
                  'TIENE_SUBESCANDALLO')
                ColumnasChecked.Strings = (
                  '1'
                  '1'
                  '1'
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0'
                  '0'
                  '0'
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'ALMACEN'
                  'ARTICULO'
                  'ESCANDALLO'
                  'TIPO'
                  'TIPO'
                  'ID_EQUIVAL'
                  'CODIGO'
                  'TIPO'
                  'ID_FORMULA'
                  'LINEA_TAREA'
                  'ALMACEN')
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'ART_ALMACENES'
                  'VER_ARTICULOS_EF'
                  'PRO_ESCANDALLO'
                  'SYS_UNIDADES_ARTICULOS'
                  'SYS_UNIDADES_ARTICULOS'
                  'PRO_SYS_CAB_EQUIVAL'
                  'PRO_DES_TIPO_PIEZA'
                  'PRO_DES_CAB_MATERIAL'
                  'PRO_FORMULAS'
                  'PRO_TAREA_ESC'
                  'ART_ALMACENES')
                Acciones.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
                Titulos.Strings = (
                  'TITULO'
                  'TITULO'
                  'COMPUESTO'
                  'TITULO'
                  'TITULO'
                  'DESC_EQUIVAL'
                  'DESCRIPCION'
                  'DESCRIPCION'
                  'NOMBRE'
                  'TAREA'
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGFMaterialesBusqueda
                Planes.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  'ALMACEN'
                  'ARTICULO'
                  'ESCANDALLO'
                  'TIPO'
                  'TIPO'
                  'ID_EQUIVAL'
                  'CODIGO'
                  'TIPO'
                  'ID_FORMULA'
                  'LINEA_TAREA'
                  'ALMACEN')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA_COMP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 30
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALMACEN_SAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALMACEN'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESC_ALMACEN'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 161
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMPONENTE'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESC_ARTICULO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 190
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MATESC'
                    Width = 79
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_EQUIVAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PORCENT_SN'
                    Width = 68
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PORCENTAJE'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Width = 45
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DENSIDAD'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES_DENSIDAD'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES_FIJAS'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES'
                    Width = 53
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDAD_ART'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDAD_FAB'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'STOCK'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'STOCK_ALM_LAN'
                    ReadOnly = True
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRE_COS_UNI'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_VAR'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECIO_FIJO'
                    Width = 63
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 57
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEN'
                    Width = 34
                    Visible = True
                  end
                  item
                    DropDownRows = 11
                    Expanded = False
                    FieldName = 'lkTIPO_PRECIO'
                    Width = 48
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTUALIZA_MAT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MEDIDAS'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_PIEZA'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_PIEZAS'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_TIPO_MATERIAL'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESC_TIPO_MATERIAL'
                    ReadOnly = True
                    Width = 160
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_TIPO_PIEZA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescDesTPieza'
                    ReadOnly = True
                    Width = 160
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_CANTIDAD_TPIEZA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_ALTO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_ANCHO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DES_GRUESO'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DES_METROS_DESCONTAR'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMULA'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'RESULTADO_FORMULA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LINEA_TAREA'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TIENE_ADJUNTO'
                    Width = 40
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TIENE_SUBESCANDALLO'
                    ReadOnly = True
                    Width = 40
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ULT_MODIFICACION'
                    ReadOnly = True
                    Width = 85
                    Visible = True
                  end>
              end
            end
            object TSTareas: TTabSheet
              Caption = 'Tareas'
              ImageIndex = 1
              OnShow = TSTareasShow
              object TBTareas: TLFToolBar
                Left = 0
                Top = 0
                Width = 1249
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavTareas: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ProDMEscandallo.DSQMProTareaEsc
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CETareasPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFTareas
                  InsertaControl = DBGFTareas
                  Exclusivo = True
                  ControlEdit = CETareas
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
                object TSepTareas: TToolButton
                  Left = 200
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtNotasTarea: TToolButton
                  Left = 208
                  Top = 0
                  Action = ANotasTareas
                  ParentShowHint = False
                  ShowHint = True
                end
                object TButtOrdenLineasTar: TToolButton
                  Left = 231
                  Top = 0
                  Hint = 'Ordenar Lineas Tareas'
                  Caption = 'Ordenar Lineas Tareas'
                  ImageIndex = 122
                  OnClick = TButtOrdenLineasTarClick
                end
                object TButtDuplicarTarea: TToolButton
                  Left = 254
                  Top = 0
                  Hint = 'Duplicar Tarea'
                  Caption = 'Duplicar Tarea'
                  ImageIndex = 37
                  OnClick = TButtDuplicarTareaClick
                end
              end
              object DBGFTareas: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 1249
                Height = 316
                Align = alClient
                DataSource = ProDMEscandallo.DSQMProTareaEsc
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGFTareasCellClick
                OnColEnter = GetTime
                OnDblClick = DBGFTareasDblClick
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 1
                UsaDicG2K = False
                Changed = True
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
                Transaction = ProDMEscandallo.TLocal
                BuscarNums = False
                Campos.Strings = (
                  'TIPOTAREA'
                  'RECURSO'
                  'ID_UTILLAJES'
                  'LINEA_TAREA'
                  'FORMULA'
                  'MAQUINA'
                  'SECCION')
                CamposAMostrar.Strings = (
                  'TIPOTAREA'
                  '0'
                  'RECURSO'
                  '0'
                  'ID_UTILLAJES'
                  '0'
                  'LINEA_TAREA'
                  '0'
                  'FORMULA'
                  '0'
                  'MAQUINA'
                  '0'
                  'SECCION'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80'
                  '80'
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
                  'ID_FORMULA'
                  ''
                  '')
                CamposDesplegar.Strings = (
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1'
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'DESC_UTILLAJE'
                  'FORMULA'
                  'LINEA_TAREA'
                  'MAQUINA'
                  'ORDEN'
                  'RECURSO'
                  'TAREA'
                  'TIPOTAREA'
                  'TIPO')
                ColumnasCheckBoxes.Strings = (
                  'ACTUALIZA_REC'
                  'NO_PRODUCTIVA')
                ColumnasChecked.Strings = (
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'TAREA'
                  'RECURSO'
                  'CODIGO'
                  'LINEA_TAREA'
                  'ID_FORMULA'
                  'CODMAQ'
                  'SECCION')
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'PRO_SYS_TAREAS'
                  'PRO_RECURSOS'
                  'PRO_SYS_UTILLAJES'
                  'PRO_ORD_TAREA'
                  'PRO_FORMULAS'
                  'PRO_MAQUINAS_C'
                  'OPE_SECCIONES')
                Acciones.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
                Titulos.Strings = (
                  'TITULO'
                  'TITULO'
                  'DESCRIPCION'
                  'TAREA'
                  'NOMBRE'
                  'DESCRIPCION'
                  'DESCRIPCION')
                BeforeColExit = DBGFTareasBeforeColExit
                Posicion = tpCentrado
                OnBusqueda = DBGFTareasBusqueda
                Planes.Strings = (
                  ''
                  ''
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
                  ''
                  'CODMAQ'
                  'SECCION')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA_TAREA'
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
                    FieldName = 'TIPOTAREA'
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescrTarea'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 160
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RECURSO'
                    Width = 45
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DescrRecurso'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 129
                    Visible = True
                  end
                  item
                    ButtonStyle = cbsEllipsis
                    Expanded = False
                    FieldName = 'TIME'
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CANTIDAD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIEMPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRE_COS_UNI'
                    Width = 69
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL_VAR'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECIO_FIJO'
                    Width = 73
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TOTAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 73
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEN'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTUALIZA_REC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_UTILLAJES'
                    Width = 45
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESC_UTILLAJE'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OPERACIONES_NUM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OPERACIONES_TIEMPO'
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'COSTE_OPERACIONES'
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
                    FieldName = 'FORMULA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIDADES'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIEMPO_UNITARIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RESULTADO_FORMULA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CAMPO_1'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CAMPO_2'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MAQUINA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SECCION'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NO_PRODUCTIVA'
                    Visible = True
                  end>
              end
            end
          end
        end
        object PnlFases: TLFPanel
          Left = 0
          Top = 0
          Width = 1257
          Height = 193
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object PCFases: TLFPageControl
            Left = 0
            Top = 0
            Width = 1257
            Height = 193
            ActivePage = TSDibujoFases
            Align = alClient
            OwnerDraw = True
            TabIndex = 2
            TabOrder = 0
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSFases: TTabSheet
              Caption = 'Fases'
              OnShow = TSFasesShow
              object TBFases: TLFToolBar
                Left = 0
                Top = 0
                Width = 1249
                Height = 21
                AutoSize = True
                ButtonHeight = 21
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object DBEEscandalloFase: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 81
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'ESCANDALLO'
                  DataSource = ProDMEscandallo.DSQMProEscandallo
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
                object DBECompuestoFase: TLFDbedit
                  Left = 81
                  Top = 0
                  Width = 81
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'COMPUESTO'
                  DataSource = ProDMEscandallo.DSQMProEscandallo
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
                object ETituloCompuestoFase: TLFEdit
                  Left = 162
                  Top = 0
                  Width = 264
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
                  TabOrder = 1
                end
                object TSepNavFase: TToolButton
                  Left = 426
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object NavFases: THYMNavigator
                  Left = 434
                  Top = 0
                  Width = 200
                  Height = 21
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEFasesPMEdit
                  ShowHint = True
                  TabOrder = 3
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFFases
                  InsertaControl = DBGFFases
                  Exclusivo = True
                  ControlEdit = CEFases
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
              object DBGFFases: TDBGridFind2000
                Left = 0
                Top = 21
                Width = 1249
                Height = 144
                Align = alClient
                DataSource = ProDMEscandallo.DSQMProFasesEsc
                TabOrder = 1
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
                  'TIPOFASE')
                CamposAMostrar.Strings = (
                  'TIPOFASE'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '80')
                CamposADevolver.Strings = (
                  '')
                CamposDesplegar.Strings = (
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'LINEA_FASE'
                  'TIPOFASE'
                  'FASE'
                  'ORDEN'
                  'TIPO')
                ColumnasCheckBoxes.Strings = (
                  'ACTUALIZA_MAT'
                  'ACTUALIZA_REC')
                ColumnasChecked.Strings = (
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'FASE')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'PRO_SYS_FASES')
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
                Filtros = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'LINEA_FASE'
                    ReadOnly = True
                    Width = 41
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPOFASE'
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'FASE'
                    Width = 483
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEN'
                    Width = 53
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTUALIZA_MAT'
                    Width = 46
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACTUALIZA_REC'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REBAJE'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PIEZAS_HORA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MERMA_FASE'
                    Visible = True
                  end>
              end
            end
            object TSNotasFases: TTabSheet
              Caption = 'Notas'
              ImageIndex = 1
              OnShow = TSNotasFasesShow
              object TBFaseNotas: TLFToolBar
                Left = 0
                Top = 0
                Width = 1249
                Height = 21
                AutoSize = True
                ButtonHeight = 21
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object DBETipoFaseNotas: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 81
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'TIPOFASE'
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object DBEDescFaseNotas: TLFDbedit
                  Left = 81
                  Top = 0
                  Width = 264
                  Height = 21
                  TabStop = False
                  AutoSize = False
                  Color = clInfoBk
                  DataField = 'FASE'
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object TSepNavFaseNotas: TToolButton
                  Left = 345
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object NavNotasFases: THYMNavigator
                  Left = 353
                  Top = 0
                  Width = 80
                  Height = 21
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
                  VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CENotasFasesPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBMNotasFases
                  Exclusivo = True
                  ControlEdit = CENotasFases
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
              object TBButtNotasFase: TLFToolBar
                Left = 0
                Top = 21
                Width = 1249
                Height = 24
                EdgeBorders = []
                Flat = True
                Images = DMMain.ToolbarImages
                TabOrder = 1
                Separators = True
                object TButtUndoFase: TToolButton
                  Left = 0
                  Top = 0
                  Caption = 'Deshacer'
                  ImageIndex = 4
                  OnClick = TButtUndoFaseClick
                end
                object TButtCutFase: TToolButton
                  Left = 23
                  Top = 0
                  Caption = 'Cortar'
                  ImageIndex = 5
                  OnClick = TButtCutFaseClick
                end
                object TButtCopyFase: TToolButton
                  Left = 46
                  Top = 0
                  Caption = 'Copiar'
                  ImageIndex = 6
                  OnClick = TButtCopyFaseClick
                end
                object TButtPasteFase: TToolButton
                  Left = 69
                  Top = 0
                  Caption = 'Pegar'
                  ImageIndex = 7
                  OnClick = TButtPasteFaseClick
                end
                object TSepButtNotasFase1: TToolButton
                  Left = 92
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object FontNameFase: TLFComboBox
                  Left = 100
                  Top = 0
                  Width = 145
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  OnChange = FontNameFaseChange
                end
                object FontSizeFase: TLFEdit
                  Left = 245
                  Top = 0
                  Width = 22
                  Height = 22
                  TabOrder = 0
                  Text = '0'
                  OnChange = FontSizeFaseChange
                end
                object UpDown2: TUpDown
                  Left = 267
                  Top = 0
                  Width = 15
                  Height = 22
                  Associate = FontSizeFase
                  Min = 0
                  Position = 0
                  TabOrder = 2
                  Wrap = False
                end
                object TSepButtNotasFase2: TToolButton
                  Left = 282
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtNegritaFase: TToolButton
                  Left = 290
                  Top = 0
                  Caption = 'Negrita'
                  ImageIndex = 8
                  Style = tbsCheck
                  OnClick = TButtNegritaFaseClick
                end
                object TButtCursivaFase: TToolButton
                  Left = 313
                  Top = 0
                  Caption = 'Cursiva'
                  ImageIndex = 9
                  Style = tbsCheck
                  OnClick = TButtCursivaFaseClick
                end
                object TButtSubrayadoFase: TToolButton
                  Left = 336
                  Top = 0
                  Caption = 'Subrayado'
                  ImageIndex = 10
                  Style = tbsCheck
                  OnClick = TButtSubrayadoFaseClick
                end
                object TSepButtNotasFase3: TToolButton
                  Left = 359
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtLeftAlignFase: TToolButton
                  Left = 367
                  Top = 0
                  Caption = 'Alinear izquierda'
                  Grouped = True
                  ImageIndex = 11
                  Style = tbsCheck
                  OnClick = TButtLeftAlignFaseClick
                end
                object TButtCenterAlignFase: TToolButton
                  Tag = 2
                  Left = 390
                  Top = 0
                  Caption = 'Centrar'
                  Grouped = True
                  ImageIndex = 12
                  Style = tbsCheck
                  OnClick = TButtCenterAlignFaseClick
                end
                object TButtRightAlignFase: TToolButton
                  Tag = 1
                  Left = 413
                  Top = 0
                  Caption = 'Alinear derecha'
                  Grouped = True
                  ImageIndex = 13
                  Style = tbsCheck
                  OnClick = TButtRightAlignFaseClick
                end
                object TSepButtNotasFase4: TToolButton
                  Left = 436
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtColorFase: TToolButton
                  Left = 444
                  Top = 0
                  Caption = 'Color'
                  ImageIndex = 15
                  OnClick = TButtColorFaseClick
                end
              end
              object PNNotasFases: TLFPanel
                Left = 0
                Top = 45
                Width = 1249
                Height = 120
                Align = alClient
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 2
                object DBMNotasFases: TDBRichEdit
                  Left = 0
                  Top = 0
                  Width = 1249
                  Height = 120
                  Align = alClient
                  DataField = 'NOTAS'
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
                  TabOrder = 0
                  OnSelectionChange = SelectionChangeFase
                end
              end
            end
            object TSDibujoFases: TTabSheet
              Caption = 'Dibujo'
              ImageIndex = 28
              OnShow = TSDibujoFasesShow
              object TBDibujoFase: TLFToolBar
                Left = 0
                Top = 0
                Width = 1249
                Height = 22
                AutoSize = True
                ButtonWidth = 24
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object DBEFaseDib: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 81
                  Height = 22
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'TIPOFASE'
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBEDescFaseDib: TLFDbedit
                  Left = 81
                  Top = 0
                  Width = 264
                  Height = 22
                  TabStop = False
                  AutoSize = False
                  Color = clInfoBk
                  DataField = 'FASE'
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
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
                object TSepNavFaseDib: TToolButton
                  Left = 345
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object NavDibujoFases: THYMNavigator
                  Left = 353
                  Top = 0
                  Width = 80
                  Height = 22
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
                  VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEImagenesFasesPMEdit
                  ShowHint = True
                  TabOrder = 2
                  OnClick = NavDibujoFasesClick
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBEFImagen
                  InsertaControl = DBEFImagen
                  Exclusivo = True
                  ControlEdit = CEImagenesFases
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
              object PNLDibujoFase: TLFPanel
                Left = 0
                Top = 22
                Width = 417
                Height = 143
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object LblImagen: TLFLabel
                  Left = 17
                  Top = 55
                  Width = 35
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imagen'
                end
                object ETituloImagen: TLFEdit
                  Left = 108
                  Top = 52
                  Width = 280
                  Height = 21
                  Color = clInfoBk
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEFImagen: TLFFibDBEditFind
                  Left = 57
                  Top = 52
                  Width = 50
                  Height = 21
                  DataField = 'ID_IMAGEN'
                  DataSource = ProDMEscandallo.DSQMProFasesEsc
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
                end
                object BCargarImagen: TButton
                  Left = 340
                  Top = 54
                  Width = 23
                  Height = 18
                  Caption = '...'
                  TabOrder = 2
                  Visible = False
                  OnClick = BCargarImagenClick
                end
                object BClipboard: TButton
                  Left = 363
                  Top = 54
                  Width = 23
                  Height = 18
                  Hint = 'Cargar imagen desde porta papeles'
                  Caption = 'P'
                  TabOrder = 3
                  Visible = False
                  OnClick = BClipboardClick
                end
              end
              object PNLDibujoFaseImagen: TLFPanel
                Left = 417
                Top = 22
                Width = 832
                Height = 143
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 2
                object Imagen: TImage
                  Left = 0
                  Top = 0
                  Width = 832
                  Height = 143
                  Align = alClient
                  Center = True
                  Proportional = True
                end
              end
            end
          end
        end
      end
      object TSPrecios: TTabSheet [2]
        Caption = 'Costes'
        OnShow = TSPreciosShow
        object TBCostes: TLFToolBar
          Left = 0
          Top = 0
          Width = 1257
          Height = 24
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object DBEEscPrecios: TLFDbedit
            Left = 0
            Top = 0
            Width = 81
            Height = 22
            TabStop = False
            Color = clInfoBk
            DataField = 'ESCANDALLO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBECompPrecios: TLFDbedit
            Left = 81
            Top = 0
            Width = 329
            Height = 22
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETituloPrecios: TLFDbedit
            Left = 410
            Top = 0
            Width = 82
            Height = 22
            TabStop = False
            Color = clInfoBk
            DataField = 'COMPUESTO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object HYMNavigator1: THYMNavigator
            Left = 492
            Top = 0
            Width = 80
            Height = 22
            DataSource = ProDMEscandallo.DSQMProEscandallo
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPreciosPMEdit
            ShowHint = True
            TabOrder = 3
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBECosteFijo
            Exclusivo = True
            ControlEdit = CEPrecios
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLCalculoEtiquetas: TPanel
          Left = 792
          Top = 24
          Width = 465
          Height = 535
          Align = alRight
          TabOrder = 1
          object GBCalculoEtiquetas: TGroupBox
            Left = -1
            Top = 1
            Width = 465
            Height = 533
            Align = alRight
            Caption = 'C'#225'lculo Metros'
            TabOrder = 0
            object LLargo: TLFLabel
              Left = 338
              Top = 52
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Largo'
            end
            object LColores: TLFLabel
              Left = 26
              Top = 96
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Colores'
            end
            object LAncho: TLFLabel
              Left = 177
              Top = 52
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ancho'
            end
            object LTroquel: TLFLabel
              Left = 25
              Top = 54
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Troquel'
            end
            object LSHAnchoTroquel: TLFLabel
              Left = 17
              Top = 75
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'S. Ancho'
            end
            object LFigurasAnchoTroquel: TLFLabel
              Left = 137
              Top = 75
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Ancho'
            end
            object LSVAvanceTroquel: TLFLabel
              Left = 243
              Top = 75
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'S. Avance'
            end
            object LFigurasAvanceTroquel: TLFLabel
              Left = 356
              Top = 75
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Avance'
            end
            object LFormula1: TLFLabel
              Left = 24
              Top = 247
              Width = 288
              Height = 13
              Caption = '(QTY. / FIG. ANCHO) * ((AVANCE + SEP. AVANCE) / 1.000)'
            end
            object LResultadoFormula1: TLFLabel
              Left = 439
              Top = 249
              Width = 15
              Height = 13
              Caption = 'ML'
            end
            object LFormula2: TLFLabel
              Left = 24
              Top = 271
              Width = 316
              Height = 13
              Caption = 'ML DE FABRICACI'#211'N / VELOCIDAD TE'#211'RICA DE LA M'#193'QUINA'
            end
            object LResultadoFormula2: TLFLabel
              Left = 439
              Top = 273
              Width = 17
              Height = 13
              Caption = 'Min'
            end
            object LFormula3: TLFLabel
              Left = 24
              Top = 292
              Width = 222
              Height = 13
              Caption = '((ANCHO + SEP. ANCHO) * FIG. ANCHO) + 14'
            end
            object LResultadoFormula3: TLFLabel
              Left = 439
              Top = 296
              Width = 17
              Height = 13
              Caption = 'Mm'
            end
            object LAnchoArticulo: TLFLabel
              Left = 28
              Top = 149
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ancho'
            end
            object LVelocidad: TLFLabel
              Left = 13
              Top = 194
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Velocidad'
            end
            object LArticulo: TLFLabel
              Left = 23
              Top = 127
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Art'#237'culo'
            end
            object LMaquina: TLFLabel
              Left = 20
              Top = 171
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Maquina'
            end
            object LCilindro: TLFLabel
              Left = 27
              Top = 217
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cilindro'
            end
            object DBELargo: TLFDbedit
              Left = 370
              Top = 49
              Width = 81
              Height = 21
              DataField = 'LARGO'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 2
            end
            object DBEColores: TLFDbedit
              Left = 66
              Top = 93
              Width = 81
              Height = 21
              DataField = 'COLORES'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 7
            end
            object DBEAncho: TLFDbedit
              Left = 213
              Top = 49
              Width = 81
              Height = 21
              DataField = 'ANCHO'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 1
            end
            object DBEAnchoArticulo: TLFDbedit
              Left = 66
              Top = 145
              Width = 81
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ANCHO_ARTICULO'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object DBEVelocidadMaquina: TLFDbedit
              Left = 66
              Top = 190
              Width = 81
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'VELOCIDAD_MAQUINA'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
            object DBEAnchoTroquel: TLFDbedit
              Left = 66
              Top = 71
              Width = 43
              Height = 21
              DataField = 'SH_ANCHO_TROQUEL'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 3
            end
            object DBECalculo1: TLFDbedit
              Left = 346
              Top = 244
              Width = 89
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CALCULO_1'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
            end
            object DBECalculo2: TLFDbedit
              Left = 346
              Top = 268
              Width = 89
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CALCULO_2'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
            end
            object DBECalculo3: TLFDbedit
              Left = 346
              Top = 292
              Width = 89
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CALCULO_3'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 15
            end
            object EDescripcionArticulo: TLFEdit
              Left = 178
              Top = 123
              Width = 274
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 16
            end
            object EDescripcionMaquina: TLFEdit
              Left = 178
              Top = 167
              Width = 274
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 17
            end
            object DBEFigurasAnchoTroquel: TLFDbedit
              Left = 184
              Top = 71
              Width = 43
              Height = 21
              DataField = 'FIGURAS_ANCHO_TROQUEL'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 4
            end
            object DBESVAvanceTroquel: TLFDbedit
              Left = 295
              Top = 71
              Width = 43
              Height = 21
              DataField = 'SV_AVANCE_TROQUEL'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 5
            end
            object DBEFigurasAvanceTroquel: TLFDbedit
              Left = 408
              Top = 71
              Width = 43
              Height = 21
              DataField = 'FIGURAS_AVANCE_TROQUEL'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 6
            end
            object DBEFMaquina: TLFDBEditFind2000
              Left = 66
              Top = 167
              Width = 111
              Height = 21
              DataField = 'MAQUINA'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 10
              OnChange = DBEFMaquinaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'PRO_MAQUINAS_C'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODMAQ'
              CampoStr = 'DESCRIPCION'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFArticulo: TLFDBEditFind2000
              Left = 66
              Top = 123
              Width = 111
              Height = 21
              DataField = 'ARTICULO'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 8
              OnChange = DBEFArticuloChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ART_ARTICULOS'
              Tabla_asociada.DesplegarBusqueda = False
              Campos_Desplegar.Strings = (
                'ANCHO')
              CampoNum = 'ARTICULO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'ARTICULO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFTroqueles: TLFDBEditFind2000
              Left = 66
              Top = 49
              Width = 81
              Height = 21
              DataField = 'TROQUEL'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 0
              OnChange = DBEFTroquelesChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'EMP_TROQUELES'
              Tabla_asociada.DesplegarBusqueda = False
              Campos_Desplegar.Strings = (
                'AVANCE'
                'SH_ANCHO'
                'SV_AVANCE'
                'MAQUINA'
                'POS_Z')
              CampoNum = 'TROQUEL'
              CampoStr = 'ANCHO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'TROQUEL')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object TBCalculoEtiquetas: TLFToolBar
              Left = 2
              Top = 15
              Width = 461
              Height = 24
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              EdgeInner = esNone
              EdgeOuter = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 19
              Separators = True
              object NavCalculoEtiquetas: THYMNavigator
                Left = 0
                Top = 2
                Width = 144
                Height = 22
                DataSource = ProDMEscandallo.DSQMCalculoMetros
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
              object TBSep3: TToolButton
                Left = 144
                Top = 2
                Width = 8
                Style = tbsSeparator
              end
              object TBCrearDesarrollo: TToolButton
                Left = 152
                Top = 2
                Hint = 'Crear Desarrollo'
                Caption = 'Crear Desarrollo'
                ImageIndex = 92
                OnClick = TBCrearDesarrolloClick
              end
            end
            object EDescripcionCilindro: TLFEdit
              Left = 178
              Top = 213
              Width = 274
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 18
            end
            object DBEFCilindro: TLFDBEditFind2000
              Left = 66
              Top = 213
              Width = 111
              Height = 21
              DataField = 'CILINDRO'
              DataSource = ProDMEscandallo.DSQMCalculoMetros
              TabOrder = 12
              OnChange = DBEFCilindroChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'EMP_CILINDROS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CILINDRO'
              CampoStr = 'DESCRIPCION'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'CILINDRO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
        object PNLIzquierdo: TPanel
          Left = 0
          Top = 24
          Width = 792
          Height = 535
          Align = alClient
          TabOrder = 2
          object PNLCostesEscandallo: TLFPanel
            Left = 1
            Top = 322
            Width = 790
            Height = 212
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object GBCostesEscandallo: TGroupBox
              Left = 0
              Top = 0
              Width = 790
              Height = 212
              Align = alClient
              Caption = 'Costes por unidades'
              TabOrder = 0
              object DBGFCostesEscandallo: TDBGridFind2000
                Left = 2
                Top = 37
                Width = 786
                Height = 173
                Align = alClient
                DataSource = ProDMEscandallo.DSTmpCostesEscandallos
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
                Changed = True
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
                Transaction = ProDMEscandallo.TLocal
                BuscarNums = False
                CamposAMostrarAnchos.Strings = (
                  '80'
                  '80'
                  '0'
                  '0'
                  '0'
                  '0'
                  '0')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                MensajeNoExiste = False
                SalirSiVacio = True
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  'CODMAQ'
                  'SECCION')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'UNIDADES'
                    Title.Caption = 'Unidades'
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'COSTE_MATERIAL'
                    ReadOnly = True
                    Title.Caption = 'Coste Material'
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'COSTE_TAREA'
                    ReadOnly = True
                    Title.Caption = 'Coste Tarea'
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'COSTE_TOTAL'
                    ReadOnly = True
                    Title.Caption = 'Coste Total'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MARGEN'
                    Title.Caption = 'Margen'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MARGEN_2'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MARGEN_3'
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PRECIO_MARGEN'
                    ReadOnly = True
                    Title.Caption = 'Precio Margen'
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PRECIO_MARGEN_2'
                    ReadOnly = True
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PRECIO_MARGEN_3'
                    ReadOnly = True
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PRECIO_UNITARIO'
                    ReadOnly = True
                    Title.Caption = 'Precio Unitario'
                    Width = 90
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'PRECIO_VENTA'
                    ReadOnly = True
                    Title.Caption = 'Precio Venta'
                    Width = 90
                    Visible = True
                  end>
              end
              object TBCostesEscandallo: TLFToolBar
                Left = 2
                Top = 15
                Width = 786
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 1
                Separators = True
                object NavCostesEscandallo: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 186
                  Height = 22
                  DataSource = ProDMEscandallo.DSTmpCostesEscandallos
                  VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFCostesEscandallo
                  InsertaControl = DBGFCostesEscandallo
                  OnClickBefore = NavCostesEscandalloClickBefore
                  Exclusivo = True
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
                object TBSep2: TToolButton
                  Left = 186
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object TBRecalcularCostesPorUnidades: TToolButton
                  Left = 194
                  Top = 0
                  Hint = 'Recalcular Costes'
                  Caption = 'Recalcular Costes'
                  ImageIndex = 55
                  OnClick = TBRecalcularCostesPorUnidadesClick
                end
              end
            end
          end
          object PNLPPrecios: TLFPanel
            Left = 1
            Top = 1
            Width = 790
            Height = 321
            Align = alTop
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object GBCostes: TGroupBox
              Left = 0
              Top = 0
              Width = 329
              Height = 321
              Align = alLeft
              Caption = 'Costes'
              TabOrder = 0
              object LUnidadesCostes: TLFLabel
                Left = 35
                Top = 247
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Unidades'
                FocusControl = LFDUnidades
              end
              object LCosteTotal: TLFLabel
                Left = 26
                Top = 224
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Total'
              end
              object LCosteUnitario: TLFLabel
                Left = 14
                Top = 201
                Width = 66
                Height = 13
                Hint = '(Fijo+Material+Maquina+Operario+Varios)/Unidades'
                Alignment = taRightJustify
                Caption = 'Coste Unitario'
              end
              object LPrecioMaterial: TLFLabel
                Left = 117
                Top = 23
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Precios Mat.'
              end
              object LCosteFijo: TLFLabel
                Left = 34
                Top = 63
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Fijo'
              end
              object LCosteMaterial: TLFLabel
                Left = 13
                Top = 90
                Width = 67
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Material'
              end
              object LCosteMaquina: TLFLabel
                Left = 9
                Top = 112
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste M'#225'quina'
              end
              object LCosteOperario: TLFLabel
                Left = 10
                Top = 133
                Width = 70
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Operario'
              end
              object LCosteVario: TLFLabel
                Left = 21
                Top = 155
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Varios'
              end
              object LCosteTrabExt: TLFLabel
                Left = 11
                Top = 176
                Width = 73
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Trab.Ext.'
              end
              object LHorasMaquina: TLFLabel
                Left = 169
                Top = 177
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'H. M'#225'quina'
              end
              object LHorasOperario: TLFLabel
                Left = 170
                Top = 201
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'H. Operario'
              end
              object LComponent: TLFLabel
                Left = 171
                Top = 90
                Width = 65
                Height = 13
                Alignment = taRightJustify
                Caption = 'Componentes'
              end
              object LUnidadesComponentes: TLFLabel
                Left = 194
                Top = 116
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cantidad'
              end
              object LBLPeso: TLFLabel
                Left = 212
                Top = 141
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Peso'
              end
              object LHorasExternos: TLFLabel
                Left = 183
                Top = 225
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'Externos'
              end
              object LHorasVarios: TLFLabel
                Left = 195
                Top = 249
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Varios'
              end
              object LFDUnidades: TLFDbedit
                Left = 85
                Top = 244
                Width = 81
                Height = 21
                DataField = 'UNIDADES'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 11
              end
              object DBCBModif_Coste: TLFDBCheckBox
                Left = 13
                Top = 19
                Width = 91
                Height = 17
                Caption = 'Modificar Coste'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'AUTO_ENTRADA'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCBauto_calc: TLFDBCheckBox
                Left = 14
                Top = 39
                Width = 80
                Height = 17
                Caption = 'Auto Calcular'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'AUTO_CALC'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBECosteFijo: TLFDbedit
                Left = 85
                Top = 60
                Width = 81
                Height = 21
                DataField = 'COSTE_FIJO'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 3
              end
              object DBECosteMat: TLFDbedit
                Left = 85
                Top = 86
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_MATER'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBECosteOpe: TLFDbedit
                Left = 85
                Top = 130
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_MOBRA'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object DBECosteVarios: TLFDbedit
                Left = 85
                Top = 151
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_VAR'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBLKTipo_Precio: TDBLookupComboBox
                Left = 183
                Top = 17
                Width = 98
                Height = 21
                DataField = 'TIPO_PRECIO'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                KeyField = 'TIPO_PRECIO_BASE'
                ListField = 'TITULO'
                ListSource = ProDMEscandallo.DSTipo_Precio
                TabOrder = 2
              end
              object DBECosteMaq: TLFDbedit
                Left = 85
                Top = 108
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_MAQUI'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBECosteTExt: TLFDbedit
                Left = 85
                Top = 173
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_TEXTE'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBECosteTotal: TLFDbedit
                Left = 85
                Top = 221
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_TOTAL'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object DBECosteUnitario: TLFDbedit
                Left = 85
                Top = 195
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'coste_unitario'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBEHMaquina: TLFDbedit
                Left = 229
                Top = 173
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_HMAQUINA'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
              end
              object DBEHOperario: TLFDbedit
                Left = 229
                Top = 195
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_HOPERARIO'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object DBEComponentes: TLFDbedit
                Left = 244
                Top = 86
                Width = 41
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COMPONENTES'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object DBEUnidadesComponentes: TLFDbedit
                Left = 244
                Top = 112
                Width = 41
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COMPONENTES_UNIDADES'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object DBEPeso: TLFDbedit
                Left = 244
                Top = 138
                Width = 41
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_PESO'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
              end
              object DBEHExternos: TLFDbedit
                Left = 229
                Top = 218
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_HEXTERNOS'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 17
              end
              object DBEHVarios: TLFDbedit
                Left = 229
                Top = 241
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'COSTE_HVARIOS'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
            end
            object GBVentas: TGroupBox
              Left = 329
              Top = 0
              Width = 461
              Height = 321
              Align = alClient
              Caption = 'Ventas'
              TabOrder = 1
              object LBLCliente: TLFLabel
                Left = 36
                Top = 25
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente'
              end
              object LPrecioUnitario: TLFLabel
                Left = 19
                Top = 163
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'P. Unitario'
              end
              object LTarifa: TLFLabel
                Left = 40
                Top = 46
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarifa'
              end
              object LPrecioTotal: TLFLabel
                Left = 9
                Top = 233
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Precio Total'
              end
              object LBeneficio: TLFLabel
                Left = 24
                Top = 256
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Beneficio'
              end
              object LPrecioOptimoUnitario: TLFLabel
                Left = 221
                Top = 163
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'P. '#211'ptimo Unitario'
              end
              object LBeneficios: TLFLabel
                Left = 25
                Top = 187
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Beneficio'
              end
              object LBeneficioOptimoTotal: TLFLabel
                Left = 198
                Top = 256
                Width = 107
                Height = 13
                Alignment = taRightJustify
                Caption = 'Beneficio '#211'ptimo Total'
              end
              object Z_LblMargenMater: TLFLabel
                Left = 32
                Top = 82
                Width = 76
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen Material'
              end
              object Z_LblMargenMaqui: TLFLabel
                Left = 28
                Top = 107
                Width = 80
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen M'#225'quina'
              end
              object LMargenOperario: TLFLabel
                Left = 27
                Top = 134
                Width = 79
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen Operario'
              end
              object LMargenVarios: TLFLabel
                Left = 236
                Top = 81
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen Varios'
              end
              object LMargenTrabExt: TLFLabel
                Left = 219
                Top = 107
                Width = 87
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen Trabj. Ext.'
              end
              object LBeneficioOptimo: TLFLabel
                Left = 226
                Top = 187
                Width = 80
                Height = 13
                Alignment = taRightJustify
                Caption = 'Beneficio '#211'ptimo'
              end
              object LPrecioOptimoTotal: TLFLabel
                Left = 213
                Top = 231
                Width = 93
                Height = 13
                Alignment = taRightJustify
                Caption = 'Precio '#211'ptimo Total'
              end
              object EdTarifa: TLFEdit
                Left = 145
                Top = 43
                Width = 231
                Height = 21
                Hint = ' '
                TabStop = False
                Color = clInfoBk
                ReadOnly = True
                TabOrder = 3
              end
              object EFCliente: TLFDBEditFind2000
                Left = 78
                Top = 21
                Width = 66
                Height = 21
                Hint = ' '
                AutoSize = False
                BiDiMode = bdLeftToRight
                DataField = 'CLIENTE'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                ParentBiDiMode = False
                TabOrder = 0
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
                OrdenadoPor.Strings = (
                  'CLIENTE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EdDescCliente: TLFEdit
                Left = 145
                Top = 21
                Width = 231
                Height = 21
                Hint = ' '
                TabStop = False
                Color = clInfoBk
                ReadOnly = True
                TabOrder = 1
              end
              object EdLineaTarifa: TLFEdit
                Left = 78
                Top = 43
                Width = 66
                Height = 21
                Hint = 
                  'Linea de la Tarifa. Parametrizable en Almacenes, Tarifas seg'#250'n l' +
                  'a cantidad del compuesto'
                TabStop = False
                Color = clInfoBk
                ReadOnly = True
                TabOrder = 2
              end
              object DBEMargenMater: TLFDbedit
                Left = 115
                Top = 78
                Width = 81
                Height = 21
                Hint = 
                  'Margen aplicado sobre el coste de material (afectar'#225' a precio '#243'p' +
                  'timo)'
                DataField = 'MARGEN_MATER'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 4
              end
              object DBEMargenMaqui: TLFDbedit
                Left = 115
                Top = 104
                Width = 81
                Height = 21
                Hint = 
                  'Margen aplicado sobre el coste de m'#225'quina(afectar'#225' a precio '#243'pti' +
                  'mo)'
                DataField = 'MARGEN_MAQUI'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 5
              end
              object DBEMargenOpe: TLFDbedit
                Left = 115
                Top = 129
                Width = 81
                Height = 21
                Hint = 
                  'Margen aplicado sobre el coste de operario(afectar'#225' a precio '#243'pt' +
                  'imo)'
                DataField = 'MARGEN_OPE'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 6
              end
              object DBEMargenVarios: TLFDbedit
                Left = 312
                Top = 78
                Width = 81
                Height = 21
                Hint = 
                  'Margen aplicado sobre el coste de varios(afectar'#225' a precio '#243'ptim' +
                  'o)'
                DataField = 'MARGEN_VAR'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 7
              end
              object DBEMargenTrab: TLFDbedit
                Left = 312
                Top = 104
                Width = 81
                Height = 21
                Hint = 
                  'Margen aplicado sobre el coste de trabj. ext.(afectar'#225' a precio ' +
                  #243'ptimo)'
                DataField = 'MARGEN_TRAB'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 8
              end
              object CBPrecioOptimoEnOfertas: TLFDBCheckBox
                Left = 72
                Top = 277
                Width = 387
                Height = 17
                Caption = 'Utilizar Precio '#211'ptimo en Pedidos Ofertas'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 9
                TabStop = True
                Visible = False
                Alignment = taLeftJustify
                DataField = 'USA_P_OPTIMO'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object EDPrecioUni: TLFDbedit
                Left = 73
                Top = 160
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Precio_uni'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 10
              end
              object EdPrecioTotal: TLFDbedit
                Left = 72
                Top = 229
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Precio_total'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 11
              end
              object LFBenUni: TLFDbedit
                Left = 73
                Top = 184
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Ben_uni'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 12
              end
              object LFBenTot: TLFDbedit
                Left = 72
                Top = 252
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Ben_tot'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 13
              end
              object LFBenOptUni: TLFDbedit
                Left = 312
                Top = 184
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Ben_opt_uni'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 14
              end
              object LFBenTotOpt: TLFDbedit
                Left = 311
                Top = 252
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Ben_tot_opt'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 15
              end
              object LFBenUniPor: TLFDbedit
                Left = 155
                Top = 184
                Width = 49
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Ben_uni_por'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 16
              end
              object LFBenOptUniPor: TLFDbedit
                Left = 394
                Top = 184
                Width = 49
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'Ben_opt_uni_Por'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 17
              end
              object LFPOPtUni: TLFDbedit
                Left = 312
                Top = 160
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'POptUni'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 18
              end
              object LFPOptTotal: TLFDbedit
                Left = 311
                Top = 228
                Width = 81
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'POptTotal'
                DataSource = ProDMEscandallo.DSQMProEscandallo
                TabOrder = 19
              end
            end
          end
        end
      end
      object TSNotasEsc: TTabSheet [3]
        Caption = 'Notas'
        OnShow = TSNotasEscShow
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1257
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object DBEEscNotas: TLFDbedit
            Left = 0
            Top = 0
            Width = 81
            Height = 22
            TabStop = False
            Color = clInfoBk
            DataField = 'ESCANDALLO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBECompNotas: TLFDbedit
            Left = 81
            Top = 0
            Width = 81
            Height = 22
            TabStop = False
            Color = clInfoBk
            DataField = 'COMPUESTO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object ETituloNotas: TLFEdit
            Left = 162
            Top = 0
            Width = 329
            Height = 22
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object TSepNotasNav: TToolButton
            Left = 491
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotasEsc: THYMNavigator
            Left = 499
            Top = 0
            Width = 88
            Height = 22
            DataSource = ProDMEscandallo.DSQMProEscandallo
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasEscPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotasEsc
            Exclusivo = True
            ControlEdit = CENotasEsc
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 587
            Top = 0
            Width = 8
            ImageIndex = 0
            Style = tbsSeparator
          end
          object TBCopiaNotasAModelo: TToolButton
            Left = 595
            Top = 0
            Hint = 'Copia Notas a Modelo'
            Caption = 'Copia Notas a Modelo'
            ImageIndex = 86
            OnClick = TBCopiaNotasAModeloClick
          end
        end
        object TBButtNotas: TLFToolBar
          Left = 0
          Top = 22
          Width = 1257
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ToolbarImages
          TabOrder = 1
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
            Caption = 'Pegar'
            ImageIndex = 7
            OnClick = TButtPasteClick
          end
          object TSepButtNotas1: TToolButton
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
          object TSepButtNotas2: TToolButton
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
          object TSepButtNotas3: TToolButton
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
          object TSepButtNotas4: TToolButton
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
        object PNNotas: TLFPanel
          Left = 0
          Top = 44
          Width = 1257
          Height = 515
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object DBMNotasEsc: TDBRichEdit
            Left = 0
            Top = 0
            Width = 1257
            Height = 515
            Align = alClient
            DataField = 'NOTAS'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            TabOrder = 0
            OnSelectionChange = SelectionChange
          end
        end
      end
      object TSDibujoEsc: TTabSheet [4]
        Caption = 'Dibujo'
        ImageIndex = 3
        OnShow = TSDibujoEscShow
        object EscImagen: TImage
          Left = 393
          Top = 22
          Width = 864
          Height = 537
          Align = alClient
          Center = True
          Proportional = True
        end
        object DBGFDibujoEsc: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 393
          Height = 537
          Align = alLeft
          DataSource = ProDMEscandallo.DSQMProDibEsc
          PopupMenu = DialogoDib
          TabOrder = 0
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
          BuscarNums = False
          Campos.Strings = (
            'ID_IMAGEN')
          CamposAMostrar.Strings = (
            'ID_IMAGEN'
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
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_IMAGENES')
          Titulos.Strings = (
            'NOMBRE')
          Posicion = tpCentrado
          OnRowChange = DBGFDibujoEscRowChange
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_IMAGEN'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 225
              Visible = True
            end>
        end
        object TBDibujoEsc: TLFToolBar
          Left = 0
          Top = 0
          Width = 1257
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavDibEsc: THYMNavigator
            Left = 0
            Top = 0
            Width = 180
            Height = 22
            DataSource = ProDMEscandallo.DSQMProDibEsc
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDibujoEscPMEdit
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDibujoEsc
            InsertaControl = DBGFDibujoEsc
            Exclusivo = True
            ControlEdit = CEDibujoEsc
            OrdenAscendente = True
            InsertaUltimo = True
          end
          object DBEEscDib: TLFDbedit
            Left = 180
            Top = 0
            Width = 81
            Height = 22
            TabStop = False
            Color = clInfoBk
            DataField = 'ESCANDALLO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBECompDib: TLFDbedit
            Left = 261
            Top = 0
            Width = 81
            Height = 22
            TabStop = False
            Color = clInfoBk
            DataField = 'COMPUESTO'
            DataSource = ProDMEscandallo.DSQMProEscandallo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object ETituloDib: TLFEdit
            Left = 342
            Top = 0
            Width = 329
            Height = 22
            TabStop = False
            AutoSize = False
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
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Wrap = True
            Style = tbsSeparator
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1257
          Height = 559
          DataSource = ProDMEscandallo.DSQMProEscandallo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'ALMACEN_ENT'
            'ALMACEN_LAN'
            'ALMACEN_SAL'
            'CLIENTE'
            'COMPUESTO'
            'DEFECTO'
            'DESCRIPCION'
            'ESCANDALLO'
            'ESTADO'
            'FECHA_CREAC'
            'ISO_APROBADO'
            'ISO_VALIDADO'
            'ISO_VERIFICADO'
            'PLAZO_FABRICACION'
            'RESPONSABLE'
            'TITULO'
            'TITULO_ALMACEN_E'
            'TITULO_ALMACEN_L'
            'TITULO_ALMACEN_S'
            'VERSION_ESCANDALLO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ESCANDALLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CREAC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPUESTO'
              Width = 65
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
              FieldName = 'UNIDAD'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUNIDAD'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_FIJO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_MATER'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_MOBRA'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_MAQUI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_TEXTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_TOTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_VAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
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
              FieldName = 'MEDIDA_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_4'
              Visible = True
            end>
        end
      end
    end
    object PnlTotales: TLFPanel
      Left = 2
      Top = 615
      Width = 1265
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object PCTotales: TLFPageControl
        Left = 0
        Top = 0
        Width = 1265
        Height = 54
        ActivePage = TSTotales
        Align = alClient
        MultiLine = True
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 0
        TabPosition = tpBottom
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSTotales: TTabSheet
          Caption = '&Totales'
          object PnlTot: TLFPanel
            Left = 0
            Top = 0
            Width = 1257
            Height = 28
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LblTotUds: TLFLabel
              Left = 145
              Top = 7
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unidades'
            end
            object LblTotMedida1: TLFLabel
              Left = 271
              Top = 7
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Medida 1'
            end
            object LblTotCosteTot: TLFLabel
              Left = 401
              Top = 7
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Total'
            end
            object LblTotCosteUnitario: TLFLabel
              Left = 561
              Top = 7
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'Coste Unitario'
            end
            object DBETotUnids: TLFDbedit
              Left = 194
              Top = 3
              Width = 57
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'UNIDADES'
              DataSource = ProDMEscandallo.DSQMProEscandallo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBETotMedida1: TLFDbedit
              Left = 318
              Top = 3
              Width = 57
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'MEDIDA_1'
              DataSource = ProDMEscandallo.DSQMProEscandallo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBETotCosteTotal: TLFDbedit
              Left = 459
              Top = 3
              Width = 81
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COSTE_TOTAL'
              DataSource = ProDMEscandallo.DSQMProEscandallo
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBETotCosteUnitario: TLFDbedit
              Left = 631
              Top = 3
              Width = 81
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'coste_unitario'
              DataSource = ProDMEscandallo.DSQMProEscandallo
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
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 671
    Width = 1269
  end
  inherited CEMain: TControlEdit
    Left = 120
    Top = 524
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 156
    Top = 524
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
    Left = 388
    Top = 32
    object ADuplicaEscandallo: TAction
      Category = 'Procesos'
      Caption = 'Duplicar Escandallo'
      ImageIndex = 37
      OnExecute = ADuplicaEscandalloExecute
    end
    object ATraspasoEscandalloEPR: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Escandallo EPR'
      ImageIndex = 37
      OnExecute = ATraspasoEscandalloEPRExecute
    end
    object AProLstEscandallo: TAction
      Category = 'Listados'
      Caption = 'Listado de Escandallo'
      ImageIndex = 14
      OnExecute = AProLstEscandalloExecute
    end
    object ATraspasoEscandalloOFE: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Escandallo OFE'
      ImageIndex = 37
      OnExecute = ATraspasoEscandalloOFEExecute
    end
    object ARefrescarArbol: TAction
      Category = 'Procesos'
      Caption = 'Refrescar Arbol'
      ImageIndex = 26
      OnExecute = ARefrescarArbolExecute
    end
    object AVisualizarCostes: TAction
      Category = 'Procesos'
      Caption = 'Visualizar Costes Totales'
      Hint = 'Visualizar Costes Totales del Escandallo'
      ImageIndex = 56
      OnExecute = AVisualizarCostesExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos;Firmas'
      Caption = 'Firmas ISO'
      ImageIndex = 19
    end
    object AIsoAprobado: TAction
      Category = 'Procesos;Firmas'
      Caption = 'Firma Aprobado'
      OnExecute = AIsoAprobadoExecute
    end
    object AIsoVerificado: TAction
      Category = 'Procesos;Firmas'
      Caption = 'Firma Verificado'
      OnExecute = AIsoVerificadoExecute
    end
    object AProLstEscandallos: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      Hint = 'Listado de escandallos'
      ImageIndex = 14
    end
    object AIsoValidado: TAction
      Category = 'Procesos;Firmas'
      Caption = 'Firma Validado'
      OnExecute = AIsoValidadoExecute
    end
    object ALstEscDesglosado: TAction
      Tag = 1
      Category = 'Listados'
      Caption = 'Listado de Escandallo Desglosado'
      Hint = 'Listado de escandallo con subescandallos'
      ImageIndex = 14
      OnExecute = ALstEscDesglosadoExecute
    end
    object ALstEscDesglosadoIng: TAction
      Tag = 2
      Category = 'Listados'
      Caption = 'Listado de Escandallo Desglosado Ingenieria'
      Hint = 'Listado de escandallo con subescandallos Ingenieria'
      ImageIndex = 14
      OnExecute = ALstEscDesglosadoExecute
    end
    object ALstProEscImg: TAction
      Category = 'Listados'
      Caption = 'Listado de Escandallos'
      ImageIndex = 14
      OnExecute = ALstProEscImgExecute
    end
    object ALstNecEsc: TAction
      Category = 'Listados'
      Caption = 'Listado de Necesidades'
      ImageIndex = 14
      OnExecute = ALstNecEscExecute
    end
    object ALstMatEsc: TAction
      Category = 'Listados'
      Caption = 'Listado Materiales'
      ImageIndex = 14
      OnExecute = ALstMatEscExecute
    end
    object ACalcFormulaFiltro: TAction
      Category = 'Procesos'
      Caption = 'C'#225'culo F'#243'rmulas Filtrados'
      Hint = 'C'#225'culo de f'#243'rmulas de los escandallos filtrados'
      ImageIndex = 3
      OnExecute = ACalcFormulaFiltroExecute
    end
    object APropagaAlmacenLanzamientoAMateriales: TAction
      Category = 'Procesos'
      Caption = 'Propaga Alm. Lanzamiento a Materiales'
      Hint = 'Propaga alm. lanzamiento a materiales de TODAS las fases'
      ImageIndex = 86
      OnExecute = APropagaAlmacenLanzamientoAMaterialesExecute
    end
    object AActuPCosteArt: TAction
      Category = 'Procesos'
      Caption = 'Actualizar P. Coste Art'#237'culos'
      Hint = 
        'Actualizar masivamente el P. Coste de los Art'#237'culos de los  comp' +
        'uestos filtrados'
      ImageIndex = 55
      OnExecute = AActuPCosteArtExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Quitar Filtro'
      Hint = 'Quita todos los filtros'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AFFiltroNoActivo: TAction
      Category = 'Filtros'
      Caption = 'No Activo'
      Hint = 'Filtra Escandallos Inactivos'
      ImageIndex = 5
      OnExecute = AFFiltroNoActivoExecute
    end
    object AFFiltroActivos: TAction
      Category = 'Filtros'
      Caption = 'Activos'
      Hint = 'Filtra Escandallos Activos'
      ImageIndex = 5
      OnExecute = AFFiltroActivosExecute
    end
    object AFFiltroObseleto: TAction
      Category = 'Filtros'
      Caption = 'Obsoletos'
      Hint = 'Filtra Escandallos Obsoletos'
      ImageIndex = 5
      OnExecute = AFFiltroObseletoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosDeEscandallo: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Escandallo'
      Hint = 'Visualiza los adjuntos del Escandallo'
      ImageIndex = 59
      OnExecute = AAdjuntosDeEscandalloExecute
    end
    object AAdjuntosDeArticulo: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Compuesto'
      Hint = 'Visualiza los adjuntos del Compuesto'
      ImageIndex = 59
      OnExecute = AAdjuntosDeArticuloExecute
    end
    object AAdjuntosMaterial: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Componente'
      Hint = 'Visualiza los adjuntos del Componente'
      ImageIndex = 59
      OnExecute = AAdjuntosMaterialExecute
    end
    object AActivaTodos: TAction
      Category = 'Procesos'
      Caption = 'Activa todos los escandallos filtrados'
      Hint = 'Activa todos los escandallos filtrados'
      ImageIndex = 68
      OnExecute = AActivaTodosExecute
    end
    object ADesactivaTodos: TAction
      Category = 'Procesos'
      Caption = 'Desactiva todos los escandallos filtrados'
      Hint = 'Desactiva todos los escandallos filtrados'
      ImageIndex = 67
      OnExecute = ADesactivaTodosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGMain.Columns'
      'DBGFFases.Columns'
      'DBGFMateriales.Columns'
      'DBGFTareas.Columns')
    Left = 460
    Top = 32
  end
  object CENotasEsc: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotasEsc
    FichaExclusiva = TSNotasEsc
    PanelEdicion = PNNotas
    PopUpMenu = CENotasEscPMEdit
    Teclas = DMMain.Teclas
    Left = 120
    Top = 556
  end
  object CENotasEscPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 156
    Top = 556
    object CENotasEscMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasEscMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasEscMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasEscMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasEscMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasEscMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasEscMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasEscMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasEscMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasEscMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDibujoEsc: TControlEdit
    EnlazadoA = CENotasEsc
    FichaEdicion = TSDibujoEsc
    FichaExclusiva = TSDibujoEsc
    PopUpMenu = CEDibujoEscPMEdit
    Teclas = DMMain.Teclas
    Left = 120
    Top = 588
  end
  object CEDibujoEscPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 156
    Top = 588
    object CEDibujoEscMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDibujoEscMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDibujoEscMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDibujoEscMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDibujoEscMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDibujoEscMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDibujoEscMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEDibujoEscMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDibujoEscMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDibujoEscMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENotasFases: TControlEdit
    EnlazadoA = CEFases
    FichaEdicion = TSNotasFases
    FichaExclusiva = TSNotasFases
    PanelEdicion = PNNotasFases
    Complementario = TBFases
    PopUpMenu = CENotasFasesPMEdit
    Teclas = DMMain.Teclas
    Left = 48
    Top = 511
  end
  object CENotasFasesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 84
    Top = 512
    object CENotasFasesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasFasesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasFasesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasFasesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasFasesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasFasesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasFasesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasFasesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasFasesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasFasesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEMateriales: TControlEdit
    EnlazadoA = CENotasFases
    FichaEdicion = TSMateriales
    FichaExclusiva = TSMateriales
    Complementario = TBFases
    PopUpMenu = CEMaterialesPMEdit
    Teclas = DMMain.Teclas
    Left = 49
    Top = 573
  end
  object CEMaterialesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 84
    Top = 574
    object CEMaterialesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMaterialesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMaterialesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMaterialesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMaterialesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMaterialesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMaterialesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMaterialesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMaterialesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMaterialesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CETareas: TControlEdit
    EnlazadoA = CEMateriales
    FichaEdicion = TSTareas
    FichaExclusiva = TSTareas
    Complementario = TBFases
    PopUpMenu = CETareasPMEdit
    Teclas = DMMain.Teclas
    Left = 48
    Top = 604
  end
  object CETareasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 82
    Top = 604
    object CETareasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CETareasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CETareasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CETareasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CETareasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CETareasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CETareasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETareasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETareasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETareasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object DialogoDib: TPopupMenu
    AutoHotkeys = maManual
    Left = 240
    Top = 596
    object BuscarImagen1: TMenuItem
      Caption = 'Buscar Imagen'
      OnClick = BuscarImagen1Click
    end
  end
  object CEFases: TControlEdit
    EnlazadoA = CEDibujoEsc
    FichaEdicion = TSFases
    FichaExclusiva = TSFases
    Complementario = TBMateriales
    PopUpMenu = CEFasesPMEdit
    Teclas = DMMain.Teclas
    Left = 48
    Top = 481
  end
  object CEFasesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 84
    Top = 482
    object CEFasesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEFasesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFasesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFasesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEFasesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEFasesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEFasesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFasesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFasesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFasesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALEscandallo: TActionList
    Images = DMMain.ILMain_Ac
    Left = 424
    Top = 32
    object AACompuesto: TAction
      Caption = 'AACompuesto'
      Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
      ShortCut = 49219
      OnExecute = AACompuestoExecute
    end
    object ANewArticulo: TAction
      Caption = 'Crear Articulo'
      Hint = 'Crear Articulo'
      OnExecute = ANewArticuloExecute
    end
    object ANotasMaterial: TAction
      Caption = 'Editar Notas Materials (Ctrl+M)'
      Hint = 'Editar Notas Materials (Ctrl+M)'
      ImageIndex = 18
      ShortCut = 16461
      OnExecute = ANotasMaterialExecute
    end
    object ANotasTareas: TAction
      Caption = 'Editar Notas Tarea (Ctrl+T)'
      Hint = 'Editar Notas Tarea (Ctrl+T)'
      ImageIndex = 18
      ShortCut = 16468
      OnExecute = ANotasTareasExecute
    end
    object AActPrecios: TAction
      Caption = 'AActPrecios'
      Hint = 'Actualizar Precios Materiales/Recursos Actual'
      ImageIndex = 17
      OnExecute = AActPreciosExecute
    end
    object AActPreciosFiltro: TAction
      Caption = 'AActPreciosFiltro'
      Hint = 'Actualizar Precios Materiales/Recursos Filtrados'
      ImageIndex = 17
      OnExecute = AActPreciosFiltroExecute
    end
    object ACalculoFormulas: TAction
      Caption = 'Calculo Formulas'
      Hint = 'Calculo Formulas'
      ImageIndex = 3
      OnExecute = ACalculoFormulasExecute
    end
    object AActivaEscandallo: TAction
      Caption = 'Activo'
      Hint = 'Activa el Escandallo'
      ImageIndex = 68
      OnExecute = AActivaEscandalloExecute
    end
    object ADesActivaEscandallo: TAction
      Caption = 'No Activo'
      Hint = 'Desactiva el Escandallo'
      ImageIndex = 67
      OnExecute = ADesActivaEscandalloExecute
    end
    object AMarcaEscandalloComoObsoleto: TAction
      Caption = 'Obsoleto'
      Hint = 'Marca el Escandallo como Obsoleto'
      ImageIndex = 27
      OnExecute = AMarcaEscandalloComoObsoletoExecute
    end
    object AFiltraComponente: TAction
      Caption = 'Filtra Componente'
      Hint = 
        'Filtra los escandallos que contienen este componente dentro de s' +
        'u lista de materiales.'
      ImageIndex = 10
      OnExecute = AFiltraComponenteExecute
    end
    object AFiltraSubescandallos: TAction
      Caption = 'AFiltraSubescandallos'
      Hint = 'Filtra Subescandallos'
      ImageIndex = 19
      OnExecute = AFiltraSubescandallosExecute
    end
    object AImportarMateriales: TAction
      Caption = 'AImportarMateriales'
      Hint = 'Importar Materiales desde Texto'
      ImageIndex = 49
      OnExecute = AImportarMaterialesExecute
    end
    object AInfoStock: TAction
      Caption = 'Informaci'#243'n de Stocks'
      Hint = 'Informaci'#243'n de Stocks'
      ImageIndex = 1
      OnExecute = AInfoStockExecute
    end
    object AAsociarAdjuntos: TAction
      Caption = 'Asociar Adjuntos'
      Hint = 'Asociar Adjuntos con ficheros con nombre de material'
      ImageIndex = 59
      OnExecute = AAsociarAdjuntosExecute
    end
  end
  object CEImagenesFases: TControlEdit
    EnlazadoA = CEFases
    FichaEdicion = TSDibujoFases
    FichaExclusiva = TSDibujoFases
    Complementario = TBFases
    PopUpMenu = CEImagenesFasesPMEdit
    Teclas = DMMain.Teclas
    Left = 49
    Top = 542
  end
  object CEImagenesFasesPMEdit: TPopUpTeclas
    Left = 84
    Top = 542
    object CEImagenesFasesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEImagenesFasesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEImagenesFasesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEImagenesFasesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEImagenesFasesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEImagenesFasesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEImagenesFasesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenesFasesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenesFasesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenesFasesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEPrecios: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSPrecios
    FichaExclusiva = TSPrecios
    PanelEdicion = PNLPPrecios
    PopUpMenu = CEPreciosPMEdit
    Teclas = DMMain.Teclas
    Left = 120
    Top = 488
  end
  object CEMainPMPrecios: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 156
    Top = 492
  end
  object CEPreciosPMEdit: TPopUpTeclas
    Left = 352
    Top = 32
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
      Visible = False
    end
    object CEPreciosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
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
  object PMEstado: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 496
    Top = 32
    object MIActivo: TMenuItem
      Action = AActivaEscandallo
    end
    object MINoActivo: TMenuItem
      Action = ADesActivaEscandallo
    end
    object MIObsoleto: TMenuItem
      Action = AMarcaEscandalloComoObsoleto
    end
  end
end
