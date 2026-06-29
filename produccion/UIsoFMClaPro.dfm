inherited IsoFMClaPro: TIsoFMClaPro
  Left = 264
  Width = 766
  Height = 473
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Clasificaci'#243'n de Proveedores'
  FormStyle = fsNormal
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 420
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = IsoDMClaPro.DSQMIsoClaPro
        Hints.Strings = ()
        EditaControl = DBEFCodPro
        InsertaControl = DBEFCodPro
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 390
      inherited TSFicha: TTabSheet
        object SBAProveedor: TSpeedButton [0]
          Left = 464
          Top = 16
          Width = 41
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAProveedorDblClick
        end
        inherited PEdit: TLFPanel
          Width = 744
          Height = 153
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 12
            Top = 12
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_VER_PROVEEDOR'
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LProveedor: TLFLabel
            Left = 57
            Top = 21
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LClasManual: TLFLabel
            Left = 45
            Top = 43
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clas. Manual'
          end
          object LFecha: TLFLabel
            Left = 76
            Top = 64
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LNdeINC: TLFLabel
            Left = 336
            Top = 44
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' de INC'
            FocusControl = DBENdeINC
          end
          object LValorInc: TLFLabel
            Left = 210
            Top = 66
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor INC'
            FocusControl = DBEValorINC
            Visible = False
          end
          object LFactorInc: TLFLabel
            Left = 333
            Top = 66
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factor INC'
            FocusControl = DBEFactorINC
          end
          object LFechaCertificacion: TLFLabel
            Left = 136
            Top = 88
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha certificaci'#243'n'
          end
          object LFFechaBaja: TLFLabel
            Left = 173
            Top = 108
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha baja'
            Visible = False
          end
          object LFMotivoBaja: TLFLabel
            Left = 51
            Top = 130
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo baja'
            Visible = False
          end
          object LProducto: TLFLabel
            Left = 464
            Top = 21
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Producto'
          end
          object LFEchaVto: TLFLabel
            Left = 333
            Top = 88
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha vto.'
          end
          object DBEFCodPro: TLFDBEditFind2000
            Left = 110
            Top = 17
            Width = 41
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'iso9000=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescProveedor: TLFDbedit
            Left = 152
            Top = 17
            Width = 303
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            OnDblClick = SBAProveedorDblClick
          end
          object DBENdeINC: TLFDbedit
            Left = 388
            Top = 39
            Width = 67
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'N_INC'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEValorINC: TLFDbedit
            Left = 260
            Top = 61
            Width = 65
            Height = 21
            DataField = 'VALOR_INC'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            TabOrder = 7
            Visible = False
          end
          object DBEFactorINC: TLFDbedit
            Left = 388
            Top = 61
            Width = 67
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FACTOR_INC'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBEClaManual: TLFDbedit
            Left = 152
            Top = 39
            Width = 173
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = IsoDMClaPro.DSxClaManual
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEFClaManual: TLFDBEditFind2000
            Left = 110
            Top = 39
            Width = 41
            Height = 21
            DataField = 'CLAS_MANUAL'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ISO_TIPO_CLASIFICACION_MANUAL'
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
          object DBDTPFecha: TLFDBDateEdit
            Left = 110
            Top = 61
            Width = 94
            Height = 21
            DataField = 'FECHA'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object LFCBIso9000: TLFDBCheckBox
            Left = 65
            Top = 86
            Width = 58
            Height = 17
            Caption = 'ISO9000 '
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ISO9000'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBFechaIso: TLFDBDateEdit
            Left = 230
            Top = 83
            Width = 88
            Height = 21
            DataField = 'FECHA_CERT_ISO'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
          object LFCBBaja: TLFDBCheckBox
            Left = 81
            Top = 105
            Width = 41
            Height = 17
            Caption = 'Baja '
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            OnChange = LFCBBajaChange
            DataField = 'BAJA'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBFechabaja: TLFDBDateEdit
            Left = 230
            Top = 105
            Width = 88
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 13
            Visible = False
          end
          object LFDBMotivobaja: TLFDbedit
            Left = 110
            Top = 127
            Width = 345
            Height = 21
            DataField = 'MOTIVO_BAJA'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            TabOrder = 14
            Visible = False
          end
          object LFDBProducto: TLFDbedit
            Left = 511
            Top = 17
            Width = 220
            Height = 21
            DataField = 'PRODUCTO'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            TabOrder = 2
          end
          object LFDBFechaVtoIso: TLFDBDateEdit
            Left = 388
            Top = 83
            Width = 88
            Height = 21
            DataField = 'FECHA_VTO_ISO'
            DataSource = IsoDMClaPro.DSQMIsoClaPro
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 11
          end
          object GBFirmas: TGroupBox
            Left = 481
            Top = 103
            Width = 254
            Height = 45
            Caption = 'Firmas ISO'
            TabOrder = 15
            object ChkBAprobado: TLFDBCheckBox
              Left = 17
              Top = 19
              Width = 67
              Height = 17
              Caption = 'Aprobado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ISO_APROBADO'
              DataSource = IsoDMClaPro.DSQMIsoClaPro
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object ChkBVerificado: TLFDBCheckBox
              Left = 97
              Top = 19
              Width = 66
              Height = 17
              Caption = 'Verificado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ISO_VERIFICADO'
              DataSource = IsoDMClaPro.DSQMIsoClaPro
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object ChkBValidado: TLFDBCheckBox
              Left = 182
              Top = 19
              Width = 59
              Height = 17
              Caption = 'Validado'
              AllowGrayed = True
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ISO_VALIDADO'
              DataSource = IsoDMClaPro.DSQMIsoClaPro
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 153
          Width = 744
          Height = 209
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 744
            Height = 24
            EdgeBorders = [ebLeft, ebRight, ebBottom]
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 0
              Width = 200
              Height = 22
              DataSource = IsoDMClaPro.DSQMDetIsoClaPro
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGDetalle
              InsertaControl = DBGDetalle
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = True
            end
            object ToolButton1: TToolButton
              Left = 200
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtNotasDetalle: TToolButton
              Left = 208
              Top = 0
              Action = ANotasDetalle
              ParentShowHint = False
              ShowHint = True
            end
            object TButtRecalcularDetalle: TToolButton
              Left = 231
              Top = 0
              Action = ARecalcularDetalle
            end
          end
          object DBGDetalle: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 744
            Height = 185
            Align = alClient
            DataSource = IsoDMClaPro.DSQMDetIsoClaPro
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawDataCell = DBGDetalleDrawDataCell
            OnDrawColumnCell = DBGDetalleDrawColumnCell
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
              'RESPONSABLE')
            CamposAMostrar.Strings = (
              'RESPONSABLE'
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
              'EMPLEADO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_EMPLEADOS_EF')
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
                FieldName = 'LINEA'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_FIN'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_COMPRAS_FAC'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NUM_PEDIDO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NUM_DIAS_RETRASO'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NUM_INC'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NUM_RECHAZO'
                ReadOnly = True
                Width = 83
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FACTOR'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DECISIONES'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RESPONSABLE'
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Desc_Ope'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VAL_CALIDAD_SUMINISTROS'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VAL_CALIDAD_PRODUCTO'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VAL_SERVICIO_ENTREGA'
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VAL_PRECIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VAL_VARIOS'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VAL_MANUAL'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VAL_INC_PED'
                ReadOnly = True
                Width = 85
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VAL_COSTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VAL_ENTREGAS'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COSTE_ACCIONES'
                ReadOnly = True
                Width = 80
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'IPR_INDICE'
                ReadOnly = True
                Width = 65
                Visible = True
              end>
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        object PNLNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 744
          Height = 362
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBNotas: TLFToolBar
            Left = 0
            Top = 0
            Width = 744
            Height = 26
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 0
            Separators = True
            object NavNotas: THYMNavigator
              Left = 0
              Top = 0
              Width = 80
              Height = 22
              DataSource = IsoDMClaPro.DSQMIsoClaPro
              VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CENotasPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBMObservaciones
              Exclusivo = True
              ControlEdit = CENotas
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object LFPNotas: TLFPanel
            Left = 0
            Top = 26
            Width = 744
            Height = 336
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBMObservaciones: TLFDBMemo
              Left = 0
              Top = 0
              Width = 744
              Height = 336
              Align = alClient
              BevelOuter = bvNone
              DataField = 'OBSERVACIONES'
              DataSource = IsoDMClaPro.DSQMIsoClaPro
              TabOrder = 0
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 362
          DataSource = IsoDMClaPro.DSQMIsoClaPro
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'BAJA'
            'ISO_APROBADO'
            'ISO_VALIDADO'
            'ISO_VERIFICADO'
            'ISO9000')
          CamposChecked.Strings = (
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
            '0')
          CamposAOrdenar.Strings = (
            'BAJA'
            'CLAS_MANUAL'
            'FACTOR_INC'
            'FECHA'
            'FECHA_BAJA'
            'FECHA_CERT_ISO'
            'FECHA_VTO_ISO'
            'ISO_APROBADO'
            'ISO_VALIDADO'
            'ISO_VERIFICADO'
            'ISO9000'
            'MOTIVO_BAJA'
            'N_INC'
            'PRODUCTO'
            'PROVEEDOR'
            'TERCERO'
            'TITULO'
            'VALOR_INC')
          Columns = <
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescProv'
              Width = 176
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLAS_MANUAL'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_INC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_INC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FACTOR_INC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO9000'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CERT_ISO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUCTO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_BAJA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO_BAJA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_VTO_ISO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_APROBADO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_VERIFICADO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_VALIDADO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 420
    Width = 756
  end
  inherited CEMain: TControlEdit
    Left = 396
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 432
    Top = 8
  end
  inherited ALMain: TLFActionList
    Left = 600
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ALstClaProv: TAction
      Category = 'Listados'
      Caption = 'Listado Clas. Proveedor Actual'
      ImageIndex = 14
      OnExecute = ALstClaProvExecute
    end
    object ALstClaTodosProv: TAction
      Category = 'Listados'
      Caption = 'Listado Clas. Proveedores'
      ImageIndex = 14
      OnExecute = ALstClaTodosProvExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object ALstCfgClasProvAct: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Clas. Prov. Actual'
      ImageIndex = 77
      OnExecute = ALstCfgClasProvActExecute
    end
    object ALstCfgClasProv: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Clas. Proveedores'
      ImageIndex = 77
      OnExecute = ALstCfgClasProvExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntoClasificacion: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de la Clasificacion de Proveedores'
      Hint = 'Adjuntos de la Clasificacion de Proveedores'
      ImageIndex = 59
      OnExecute = AAdjuntoClasificacionExecute
    end
    object AAdjuntosProveedor: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Proveedor'
      Hint = 'Adjuntos del Proveedor'
      ImageIndex = 59
      OnExecute = AAdjuntosProveedorExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      Hint = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 198
    Top = 26
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = LFPNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 488
    Top = 8
  end
  object CENotasPMEdit: TPopUpTeclas
    Left = 520
    Top = 8
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
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 488
    Top = 48
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 520
    Top = 48
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
  object AProveedores: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 608
    Top = 40
    object AProveedor: TAction
      Caption = 'Proveedor'
      OnExecute = AProveedorExecute
    end
    object ANotasDetalle: TAction
      Caption = 'ANotasDetalle'
      Hint = 'Edita les notas de la linea seleccionada (Ctrl + N)'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
    end
    object ARecalcularDetalle: TAction
      Caption = 'Recalcular'
      Hint = 'Recalcular Detalle'
      ImageIndex = 3
      OnExecute = ARecalcularDetalleExecute
    end
  end
end
