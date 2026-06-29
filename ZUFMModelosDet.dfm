inherited ZFMModelosDet: TZFMModelosDet
  Left = 369
  Top = 276
  Width = 831
  Height = 576
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Datos de Modelos'
  PopupMenu = CEMotoresPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  object SBAModelo: TSpeedButton [0]
    Left = 472
    Top = 12
    Width = 23
    Height = 22
    GroupIndex = -1
    OnDblClick = SBAModeloDblClick
  end
  inherited PMain: TLFPanel
    Top = 41
    Width = 821
    Height = 280
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 817
      inherited NavMain: THYMNavigator
        DataSource = ZDMModelosDet.DSQMModelosDet
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEIncCorte
        InsertaControl = DBELinea
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
    end
    inherited PCMain: TLFPageControl
      Width = 817
      Height = 250
      inherited TSFicha: TTabSheet
        object SBAEscandallo: TSpeedButton [0]
          Left = 488
          Top = 208
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAEscandalloDblClick
        end
        object SBAArmazon: TSpeedButton [1]
          Left = 326
          Top = 47
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = AArmazonExecute
        end
        object SBAToldo: TSpeedButton [2]
          Left = 326
          Top = 93
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = AToldoExecute
        end
        object SBAEscandallocolor: TSpeedButton [3]
          Left = 552
          Top = 204
          Width = 23
          Height = 22
          GroupIndex = -1
          Caption = 'Abrir Escandallos Modelo'
          OnDblClick = SBAEscandallocolorDblClick
        end
        inherited PEdit: TLFPanel
          Width = 809
          Height = 222
          inherited G2KTableLoc: TG2KTBLoc
            Left = 177
            Top = 26
          end
          object LblImagen: TLFLabel
            Left = 555
            Top = 33
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LblSalida: TLFLabel
            Left = 191
            Top = 9
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Salida'
          end
          object LDecBarrasManual: TLFLabel
            Left = 19
            Top = 114
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Barras Manual'
          end
          object LblLinea: TLFLabel
            Left = 87
            Top = 9
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea'
          end
          object LDecBarrasMotor: TLFLabel
            Left = 27
            Top = 136
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Barras Motor'
          end
          object LIncCoste: TLFLabel
            Left = 67
            Top = 31
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Inc. Corte'
          end
          object LDecMedidaLona: TLFLabel
            Left = 25
            Top = 53
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Medida Lona'
          end
          object LblArriba: TLFLabel
            Left = 118
            Top = 93
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Arriba'
          end
          object LblAbajo: TLFLabel
            Left = 169
            Top = 93
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Abajo'
          end
          object LTipoConfeccion: TLFLabel
            Left = 233
            Top = 114
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Confecci'#243'n'
          end
          object LAramzon: TLFLabel
            Left = 198
            Top = 31
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Armaz'#243'n'
          end
          object LToldo: TLFLabel
            Left = 212
            Top = 53
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Toldo'
          end
          object LLineaMinima: TLFLabel
            Left = 297
            Top = 9
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea M'#237'nima'
          end
          object LDecMotorMedidaLona: TLFLabel
            Left = 18
            Top = 75
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Motor M. Lona'
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 594
            Top = 29
            Width = 51
            Height = 21
            DataField = 'CODIGO_IMAGEN'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 15
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
            Left = 646
            Top = 29
            Width = 158
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
            TabOrder = 16
          end
          object ScrBImagen: TScrollBox
            Left = 656
            Top = 66
            Width = 144
            Height = 130
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 19
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
          object DBESalida: TLFDbedit
            Left = 224
            Top = 5
            Width = 50
            Height = 21
            DataField = 'SALIDA'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 1
          end
          object DBEDecBarrasManualArriba: TLFDbedit
            Left = 118
            Top = 110
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MANUAL_ARRIBA'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 8
          end
          object DBELinea: TLFDbedit
            Left = 118
            Top = 5
            Width = 50
            Height = 21
            DataField = 'LINEA'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 0
          end
          object DBEIncCorte: TLFDbedit
            Left = 118
            Top = 27
            Width = 50
            Height = 21
            DataField = 'INC_CORTE'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 3
          end
          object DBEDecBarrasMotorArriba: TLFDbedit
            Left = 118
            Top = 132
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MOTOR_ARRIBA'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 10
          end
          object DBEDecMedidaLona: TLFDbedit
            Left = 118
            Top = 49
            Width = 50
            Height = 21
            DataField = 'DEC_MANUAL_MEDIDA_LONA'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 4
          end
          object DBEDecBarrasManualAbajo: TLFDbedit
            Left = 169
            Top = 110
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MANUAL_ABAJO'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 9
          end
          object DBEDecBarrasMotorAbajo: TLFDbedit
            Left = 169
            Top = 132
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MOTOR_ABAJO'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 11
          end
          object DBEFTipoConfeccion: TLFDBEditFind2000
            Left = 316
            Top = 110
            Width = 50
            Height = 21
            DataField = 'TIPO_CONFECCION'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 12
            OnChange = DBEFTipoConfeccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'tipo_aux="TCF"'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DescTipoConfeccion: TLFHYDBDescription
            Left = 367
            Top = 110
            Width = 182
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = ZDMModelosDet.DSQMModelosDet
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_AUX'
              'TIPO_CONFECCION')
            CamposWhereTabla.Strings = (
              'TIPO_AUX'
              'CODIGO')
          end
          object DBChkBIncrLacado: TLFDBCheckBox
            Left = 235
            Top = 134
            Width = 104
            Height = 17
            Caption = 'Incr. Lacado PVP'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INCR_LACADO_PVP'
            DataSource = ZDMModelosDet.DSQMModelosDet
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBArmazon: TLFDbedit
            Left = 244
            Top = 27
            Width = 101
            Height = 21
            DataField = 'Armazon'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 6
          end
          object LFDBToldo: TLFDbedit
            Left = 244
            Top = 49
            Width = 101
            Height = 21
            DataField = 'Toldo'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 7
          end
          object LFDescArmazon: TLFDbedit
            Left = 346
            Top = 27
            Width = 193
            Height = 21
            Color = clInfoBk
            DataField = 'DescArmazon'
            DataSource = ZDMModelosDet.DSQMModelosDet
            Enabled = False
            TabOrder = 21
          end
          object LFDescToldo: TLFDbedit
            Left = 346
            Top = 49
            Width = 193
            Height = 21
            Color = clInfoBk
            DataField = 'DescToldo'
            DataSource = ZDMModelosDet.DSQMModelosDet
            Enabled = False
            TabOrder = 22
          end
          object LFDBCheckBox1: TLFDBCheckBox
            Left = 654
            Top = 7
            Width = 121
            Height = 17
            Caption = 'Obsoleto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OBSOLETO'
            DataSource = ZDMModelosDet.DSQMModelosDet
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GroupBox1: TGroupBox
            Left = 2
            Top = 161
            Width = 579
            Height = 53
            Caption = 'Escandallo'
            TabOrder = 23
            object LNormal: TLFLabel
              Left = 10
              Top = 25
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Normal'
            end
            object LColor: TLFLabel
              Left = 299
              Top = 25
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Color'
            end
            object DBEEscandallo: TLFFibDBEditFind
              Left = 48
              Top = 21
              Width = 49
              Height = 21
              DataField = 'ESCANDALLO'
              DataSource = ZDMModelosDet.DSQMModelosDet
              TabOrder = 0
              OnChange = DBEEscandalloChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ESCANDALLO'
              CampoStr = 'COMPUESTO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'ESCANDALLO')
            end
            object DescEscandallo: TLFHYDBDescription
              Left = 98
              Top = 21
              Width = 189
              Height = 21
              Color = clInfoBk
              DataSource = ZDMModelosDet.DSQMModelosDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
              Campo_Descripcion = 'COMPUESTO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'EMPRESA'
                'ESCANDALLO')
              CamposWhereTabla.Strings = (
                'EMPRESA'
                'ESCANDALLO')
            end
            object DescEscandalloColor: TLFHYDBDescription
              Left = 378
              Top = 21
              Width = 189
              Height = 21
              Color = clInfoBk
              DataSource = ZDMModelosDet.DSQMModelosDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
              Campo_Descripcion = 'COMPUESTO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'EMPRESA'
                'ESCANDALLO_COLOR')
              CamposWhereTabla.Strings = (
                'EMPRESA'
                'ESCANDALLO')
            end
            object DBEEscColor: TLFFibDBEditFind
              Left = 328
              Top = 21
              Width = 49
              Height = 21
              DataField = 'ESCANDALLO_COLOR'
              DataSource = ZDMModelosDet.DSQMModelosDet
              TabOrder = 3
              OnChange = DBEEscColorChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ESCANDALLO'
              CampoStr = 'COMPUESTO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'ESCANDALLO')
            end
          end
          object BCargarImagen: TButton
            Left = 756
            Top = 31
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 17
            Visible = False
            OnClick = BCargarImagenClick
          end
          object DBELineaMinima: TLFDbedit
            Left = 366
            Top = 5
            Width = 50
            Height = 21
            DataField = 'LINEA_MINIMA'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 2
          end
          object BClipboard: TButton
            Left = 779
            Top = 31
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 18
            Visible = False
            OnClick = BClipboardClick
          end
          object DBEDecMotorMedidaLona: TLFDbedit
            Left = 118
            Top = 71
            Width = 50
            Height = 21
            DataField = 'DEC_MOTOR_MEDIDA_LONA'
            DataSource = ZDMModelosDet.DSQMModelosDet
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 809
          Height = 222
          DataSource = ZDMModelosDet.DSQMModelosDet
          Columns = <
            item
              Expanded = False
              FieldName = 'LINEA'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALIDA'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INC_CORTE'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEC_MANUAL_MEDIDA_LONA'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEC_BARRAS_MANUAL_ARRIBA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEC_BARRAS_MANUAL_ABAJO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEC_BARRAS_MOTOR_ARRIBA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEC_BARRAS_MOTOR_ABAJO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALUMINIO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HIERRO'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MIXTO'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMAGEN'
              Width = 38
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 821
  end
  object PnlModelo: TLFPanel [3]
    Left = 0
    Top = 0
    Width = 821
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object LblModelo: TLFLabel
      Left = 70
      Top = 12
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    object EFModelo: TLFEditFind2000
      Left = 110
      Top = 9
      Width = 50
      Height = 21
      TabOrder = 0
      OnChange = EFModeloChange
      OnDblClick = SBAModeloDblClick
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CODIGO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_SYS_MODELOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODIGO')
      Filtros = []
    end
    object DBEDescModelo: TLFDbedit
      Left = 161
      Top = 9
      Width = 300
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'DESCRIPCION'
      DataSource = ZDMModelosDet.DSxModelo
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
  object PnlDetalles: TLFPanel [4]
    Left = 0
    Top = 321
    Width = 821
    Height = 202
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object PCDetalles: TLFPageControl
      Left = 0
      Top = 0
      Width = 821
      Height = 202
      ActivePage = TSCalcLonas
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCalcLonas: TTabSheet
        Caption = 'C'#225'lculo de &Lonas'
        object PnlCalcLonas: TLFPanel
          Left = 0
          Top = 0
          Width = 813
          Height = 174
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBCalcLonas: TLFToolBar
            Left = 0
            Top = 0
            Width = 813
            Height = 22
            AutoSize = True
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            Separators = True
            object NavCalcLonas: THYMNavigator
              Left = 0
              Top = 0
              Width = 230
              Height = 22
              DataSource = ZDMModelosDet.DSQMModelosCalc
              Flat = True
              ParentShowHint = False
              PopupMenu = CECalcLonasPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFCalcLonas
              InsertaControl = DBGFCalcLonas
              Exclusivo = True
              ControlEdit = CECalcLonas
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGFCalcLonas: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 813
            Height = 152
            Align = alClient
            DataSource = ZDMModelosDet.DSQMModelosCalc
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
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
            Transaction = ZDMModelosDet.TLocal
            BuscarNums = False
            Campos.Strings = (
              'TIPO_LONA'
              'LONA'
              'FABRICACION')
            CamposAMostrar.Strings = (
              'TIPO_LONA'
              '0'
              'LONA'
              '0'
              'FABRICACION'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'TIPO_CALCULO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'CODIGO'
              'ARTICULO'
              'ARTICULO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'Z_SYS_LONAS'
              'VER_ARTICULOS_CUENTAS'
              'VER_ARTICULOS_EF')
            Acciones.Strings = (
              ''
              ''
              '')
            Titulos.Strings = (
              'DESCRIPCION'
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFCalcLonasBusqueda
            Planes.Strings = (
              ''
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              ''
              '')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'TIPO_LONA'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescTipoLona'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 147
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Multiplo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 72
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Multiplo_Salida'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INC_SALIDA'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_LINEA'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_SALIDA'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TotalM2Lona'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LONA'
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_CALCULO'
                Visible = True
              end>
          end
        end
      end
      object TSMotores: TTabSheet
        Caption = '&Motores'
        ImageIndex = 1
        object PnlMotores: TLFPanel
          Left = 0
          Top = 0
          Width = 813
          Height = 174
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBMotores: TLFToolBar
            Left = 0
            Top = 0
            Width = 813
            Height = 22
            AutoSize = True
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            Separators = True
            object NavMotores: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = ZDMModelosDet.DSQMMotores
              Flat = True
              ParentShowHint = False
              PopupMenu = CEMotoresPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFMotores
              InsertaControl = DBGFMotores
              Exclusivo = True
              ControlEdit = CEMotores
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGFMotores: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 813
            Height = 152
            Align = alClient
            DataSource = ZDMModelosDet.DSQMMotores
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
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
              'MOTOR'
              'ARTICULO_KIT')
            CamposAMostrar.Strings = (
              'MOTOR'
              '0'
              'ARTICULO_KIT'
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
              'MOTOR'
              'ORDEN')
            CondicionBusqueda = 'tipo_articulo_tyc="M"'
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO'
              'ARTICULO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_ARTICULOS_EF'
              'VER_ARTICULOS_EF')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFMotoresBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              '')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'ORDEN'
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOTOR'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescMotor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO_KIT'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescKit'
                ReadOnly = True
                Width = 250
                Visible = True
              end>
          end
        end
      end
      object TSLama: TTabSheet
        Caption = 'Lama'
        ImageIndex = 2
        object PnlLamas: TLFPanel
          Left = 0
          Top = 0
          Width = 813
          Height = 174
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBLamas: TLFToolBar
            Left = 0
            Top = 0
            Width = 813
            Height = 22
            AutoSize = True
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            Separators = True
            object NavLamas: THYMNavigator
              Left = 0
              Top = 0
              Width = 200
              Height = 22
              DataSource = ZDMModelosDet.DSQMLamas
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGLamas
              InsertaControl = DBGLamas
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = True
            end
          end
          object DBGLamas: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 813
            Height = 152
            Align = alClient
            DataSource = ZDMModelosDet.DSQMLamas
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
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'ARTICULO'
              'TIPO_LAMA')
            CamposAMostrar.Strings = (
              'ARTICULO'
              '0'
              'TIPO_LAMA'
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
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO'
              'CODIGO')
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tablas.Strings = (
              'ART_ARTICULOS'
              'Z_SYS_LONAS')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'DESCRIPCION')
            Posicion = tpCentrado
            OnBusqueda = DBGLamasBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              '')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'TIPO_LAMA'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescLama'
                ReadOnly = True
                Width = 120
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
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'AnchoLama'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LargoLama'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ColorLama'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescColor'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_LAMAS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MERMA'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CODIGO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ANCHO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LARGO'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CECalcLonas
    Left = 407
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 443
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
  inherited ALMain: TLFActionList
    Left = 407
    Top = 72
    object ALstPreciosModelo: TAction
      Category = 'Listados'
      Caption = 'Listado de precios del Modelo'
      Hint = 'Listado de precios del Modelo'
      ImageIndex = 14
      OnExecute = ALstPreciosModeloExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ACrearArmazones: TAction
      Category = 'Procesos'
      Caption = 'Crear Armazones'
      Hint = 'Crear Armazones del Modelo'
      ImageIndex = 17
      Visible = False
      OnExecute = ACrearArmazonesExecute
    end
    object ACrearToldos: TAction
      Category = 'Procesos'
      Caption = 'Crear Toldos'
      Hint = 'Crear Toldos del Modelo'
      ImageIndex = 31
      Visible = False
      OnExecute = ACrearToldosExecute
    end
    object ASep1: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ARecrearToldos: TAction
      Category = 'Procesos'
      Caption = '&Recrear Toldos'
      Hint = 'Recrear Toldos del Modelo'
      ImageIndex = 31
      OnExecute = ARecrearToldosExecute
    end
    object ASep2: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AReplicarCalculos: TAction
      Category = 'Procesos'
      Caption = 'Replicar C'#225'lculos a todo el Modelo'
      Hint = 'Replicar C'#225'lculos a todo el Modelo'
      ImageIndex = 3
      Visible = False
      OnExecute = AReplicarCalculosExecute
    end
    object AReplicarTipoConfeccion: TAction
      Category = 'Procesos'
      Caption = 'Replicar Tipos de Confecci'#243'n a todo el Modelo'
      Hint = 'Replicar Tipos de Confecci'#243'n a todo el Modelo'
      ImageIndex = 86
      Visible = False
      OnExecute = AReplicarTipoConfeccionExecute
    end
    object AReplicarIncrLacadoPVP: TAction
      Category = 'Procesos'
      Caption = 'Replicar Incr. Lacado PVP a todo el Modelo'
      Hint = 'Replicar Incr. Lacado PVP a todo el Modelo'
      ImageIndex = 37
      Visible = False
      OnExecute = AReplicarIncrLacadoPVPExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AReplicaciones: TAction
      Category = 'Procesos'
      Caption = 'Replicaciones'
      ImageIndex = 86
      OnExecute = AReplicacionesExecute
    end
    object AAsignarEsc: TAction
      Category = 'Procesos'
      Caption = 'Asignar escandallo perdido'
      ImageIndex = 10
      OnExecute = AAsignarEscExecute
    end
    object ATarifasModelos: TAction
      Category = 'Procesos'
      Caption = 'Tarifas Modelos'
      ImageIndex = 56
      OnExecute = ATarifasModelosExecute
    end
    object ABorrarDuplicados: TAction
      Category = 'Procesos'
      Caption = 'Eliminar lonas duplicadas'
      Hint = 'Eliminar registros de toldos'
      ImageIndex = 20
      OnExecute = ABorrarDuplicadosExecute
    end
    object AAcualizarPreciosEsc: TAction
      Category = 'Procesos'
      Caption = 'Actualizar Precios Escandallo'
      Hint = 'Actualizar Precios Escandallo'
      ImageIndex = 42
      Visible = False
      OnExecute = AAcualizarPreciosEscExecute
    end
    object AAbrirEscModelo: TAction
      Category = 'Procesos'
      Caption = 'Abrir Escandallos Modelo'
      ImageIndex = 10
      OnExecute = AAbrirEscModeloExecute
    end
    object AActualizarMedidas: TAction
      Category = 'Procesos'
      Caption = 'Actualizar Medidas Esc.'
      ImageIndex = 118
      OnExecute = AActualizarMedidasExecute
    end
    object AActuModeloEsc: TAction
      Category = 'Procesos'
      Caption = 'Informar el modelo en el escandallo'
      ImageIndex = 133
      OnExecute = AActuModeloEscExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 444
    Top = 72
  end
  object CECalcLonas: TControlEdit
    EnlazadoA = CEMotores
    FichaEdicion = TSCalcLonas
    FichaExclusiva = TSCalcLonas
    SubComplementario = ALMain
    PopUpMenu = CECalcLonasPMEdit
    Teclas = DMMain.Teclas
    Left = 520
    Top = 37
  end
  object CECalcLonasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 555
    Top = 37
    object CECalcLonasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECalcLonasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECalcLonasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECalcLonasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECalcLonasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECalcLonasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECalcLonasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECalcLonasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECalcLonasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECalcLonasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEMotores: TControlEdit
    EnlazadoA = CECalcLonas
    FichaEdicion = TSMotores
    FichaExclusiva = TSMotores
    SubComplementario = ALMain
    PopUpMenu = CEMotoresPMEdit
    Teclas = DMMain.Teclas
    Left = 632
    Top = 37
  end
  object CEMotoresPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 667
    Top = 38
    object CEMotoresMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMotoresMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMotoresMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMotoresMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMotoresMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMotoresMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMotoresMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMotoresMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMotoresMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMotoresMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALModelos: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 488
    Top = 72
    object AAEscandallo: TAction
      Caption = 'AAEscandallo'
      OnExecute = AAEscandalloExecute
    end
    object AArmazon: TAction
      Caption = 'AArmazon'
      OnExecute = AArmazonExecute
    end
    object AToldo: TAction
      Caption = 'AToldo'
      OnExecute = AToldoExecute
    end
    object AAEscandalloColor: TAction
      OnExecute = AAEscandalloColorExecute
    end
    object AModelo: TAction
      Caption = 'AModelo'
      OnExecute = AModeloExecute
    end
  end
end
