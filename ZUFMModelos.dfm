inherited ZFMModelos: TZFMModelos
  Left = 445
  Top = 263
  Width = 812
  Height = 533
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Modelos'
  Constraints.MinHeight = 390
  Constraints.MinWidth = 812
  FormStyle = fsNormal
  PopupMenu = CEIncrPrecioColorPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 802
    Height = 480
    inherited TBMain: TLFToolBar
      Width = 798
      inherited NavMain: THYMNavigator
        DataSource = ZDMModelos.DSQMModelos
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBECodigo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 798
      Height = 450
      inherited TSFicha: TTabSheet
        object SBAModelosDet: TSpeedButton [0]
          Left = 138
          Top = 3
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = AModelosDetExecute
        end
        inherited PEdit: TLFPanel
          Width = 790
          Height = 422
          inherited G2KTableLoc: TG2KTBLoc
            Left = 17
            Top = -1
            Tabla_a_buscar = 'Z_SYS_MODELOS'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LblCodigo: TLFLabel
            Left = 66
            Top = 24
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LblDescripcion: TLFLabel
            Left = 43
            Top = 46
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LblDiasServir: TLFLabel
            Left = 39
            Top = 156
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as a servir'
          end
          object LblTipo: TLFLabel
            Left = 42
            Top = 68
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Config.'
          end
          object LSubtipoConfiguracion: TLFLabel
            Left = 27
            Top = 90
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subtipo Config.'
          end
          object LIncCorte: TLFLabel
            Left = 53
            Top = 179
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Inc. Corte'
          end
          object LDecMedidaLona: TLFLabel
            Left = 11
            Top = 200
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Medida Lona'
          end
          object LDecBarrasMotor: TLFLabel
            Left = 211
            Top = 223
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Barras Motor'
          end
          object LDecBarrasManual: TLFLabel
            Left = 203
            Top = 201
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Barras Manual'
          end
          object LblArriba: TLFLabel
            Left = 302
            Top = 182
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Arriba'
          end
          object LblAbajo: TLFLabel
            Left = 353
            Top = 182
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Abajo'
          end
          object LTipoConfeccion: TLFLabel
            Left = 21
            Top = 244
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Confecci'#243'n'
          end
          object LRegistrosDatos: TLFLabel
            Left = 386
            Top = 28
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registros Datos'
          end
          object LTipo: TLFLabel
            Left = 194
            Top = 24
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LRegDatos: TLFLabel
            Left = 45
            Top = 265
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Reg. Datos'
          end
          object LBLImagen: TLFLabel
            Left = 64
            Top = 111
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LBultos: TLFLabel
            Left = 70
            Top = 133
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bultos'
          end
          object LDecMotorMedidaLona: TLFLabel
            Left = 4
            Top = 222
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. Motor M. Lona'
          end
          object LCoeficienteCompra: TLFLabel
            Left = 27
            Top = 287
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coefic. Compra'
          end
          object LFamilia: TLFLabel
            Left = 67
            Top = 309
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LSubfamilia: TLFLabel
            Left = 51
            Top = 331
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subfamilia'
          end
          object LTiempoFase: TLFLabel
            Left = 37
            Top = 372
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tiempo Fase'
          end
          object LTiempoFaseCHE: TLFLabel
            Left = 103
            Top = 353
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'CHE'
          end
          object LTiempoFaseMON: TLFLabel
            Left = 159
            Top = 353
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'MON'
          end
          object LTiempoFasePRE: TLFLabel
            Left = 215
            Top = 353
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'PRE'
          end
          object LTiempoFaseTER: TLFLabel
            Left = 271
            Top = 353
            Width = 50
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'TER'
          end
          object DBECodigo: TLFDbedit
            Left = 103
            Top = 20
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 103
            Top = 42
            Width = 454
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 3
          end
          object DBEDiasServir: TLFDbedit
            Left = 103
            Top = 152
            Width = 50
            Height = 21
            DataField = 'DIAS_SERVIR'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 13
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 103
            Top = 64
            Width = 50
            Height = 21
            DataField = 'CONFIG_TIPO'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 4
            OnChange = DBEFTipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TIPOS_CONFIG'
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
          object DescTipo: TLFHYDBDescription
            Left = 154
            Top = 64
            Width = 403
            Height = 21
            Color = clInfoBk
            DataSource = ZDMModelos.DSQMModelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Tabla_a_buscar = 'Z_SYS_TIPOS_CONFIG'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CONFIG_TIPO')
            CamposWhereTabla.Strings = (
              'TIPO')
          end
          object DescSubtipo: TLFHYDBDescription
            Left = 154
            Top = 86
            Width = 403
            Height = 21
            Color = clInfoBk
            DataSource = ZDMModelos.DSQMModelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Tabla_a_buscar = 'Z_SYS_TIPOS_CONFIG_DET'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CONFIG_SUBTIPO'
              'CONFIG_TIPO')
            CamposWhereTabla.Strings = (
              'SUBTIPO'
              'TIPO')
          end
          object DBEFSubtipo: TLFDBEditFind2000
            Left = 103
            Top = 86
            Width = 50
            Height = 21
            DataField = 'CONFIG_SUBTIPO'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 6
            OnChange = DBEFSubtipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TIPOS_CONFIG_DET'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SUBTIPO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFSubtipoBusqueda
            OrdenadoPor.Strings = (
              'SUBTIPO')
            Filtros = []
          end
          object DBEIncCorte: TLFDbedit
            Left = 103
            Top = 174
            Width = 50
            Height = 21
            DataField = 'INC_CORTE'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 14
          end
          object DBEDecBarrasManualArriba: TLFDbedit
            Left = 302
            Top = 196
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MANUAL_ARRIBA'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 16
          end
          object DBEDecBarrasMotorArriba: TLFDbedit
            Left = 302
            Top = 218
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MOTOR_ARRIBA'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 19
          end
          object DBEDecMedidaLona: TLFDbedit
            Left = 103
            Top = 196
            Width = 50
            Height = 21
            DataField = 'DEC_MANUAL_MEDIDA_LONA'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 15
          end
          object DBEDecBarrasManualAbajo: TLFDbedit
            Left = 353
            Top = 196
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MANUAL_ABAJO'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 17
          end
          object DBEDecBarrasMotorAbajo: TLFDbedit
            Left = 353
            Top = 218
            Width = 50
            Height = 21
            DataField = 'DEC_BARRAS_MOTOR_ABAJO'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 20
          end
          object DBEFTipoConfeccion: TLFDBEditFind2000
            Left = 103
            Top = 240
            Width = 50
            Height = 21
            DataField = 'TIPO_CONFECCION'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 22
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
            Left = 154
            Top = 240
            Width = 249
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = ZDMModelos.DSQMModelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 23
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
          object LFWeb: TLFDBCheckBox
            Left = 566
            Top = 22
            Width = 57
            Height = 17
            Caption = 'Web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 34
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB'
            DataSource = ZDMModelos.DSQMModelos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBRegDatos: TLFDbedit
            Left = 103
            Top = 262
            Width = 50
            Height = 21
            DataField = 'COUNT'
            DataSource = ZDMModelos.DSxRegDatosModelos
            Enabled = False
            TabOrder = 24
          end
          object RGOrdenTarifas: TDBRadioGroup
            Left = 419
            Top = 185
            Width = 125
            Height = 75
            Caption = 'Orden tarifas'
            DataField = 'TIPO_LINEA_SALIDA'
            DataSource = ZDMModelos.DSQMModelos
            Items.Strings = (
              'Linea/Salida'
              'Salida/Linea')
            TabOrder = 21
            TabStop = True
            Values.Strings = (
              '0'
              '1')
          end
          object LFImatge: TLFPanel
            Left = 566
            Top = 42
            Width = 220
            Height = 368
            Align = alCustom
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 35
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 220
              Height = 368
              Align = alClient
              Proportional = True
              Stretch = True
            end
          end
          object DBETipoModelo: TLFDBEditFind2000
            Left = 221
            Top = 20
            Width = 50
            Height = 21
            DataField = 'TIPO_MODELO'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 1
            OnChange = DBETipoModeloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_TIPO_MODELO'
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
          object DescTipoModelo: TLFHYDBDescription
            Left = 272
            Top = 20
            Width = 285
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = ZDMModelos.DSQMModelos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Tabla_a_buscar = 'Z_TIPO_MODELO'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_MODELO')
            CamposWhereTabla.Strings = (
              'CODIGO')
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 103
            Top = 108
            Width = 50
            Height = 21
            DataField = 'IMAGEN'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 8
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
            Left = 154
            Top = 108
            Width = 403
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
          object BCargarImagen: TButton
            Left = 509
            Top = 109
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde archivo'
            Caption = '...'
            TabOrder = 10
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 533
            Top = 109
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 11
            Visible = False
            OnClick = BClipboardClick
          end
          object DBEBultos: TLFDbedit
            Left = 103
            Top = 130
            Width = 50
            Height = 21
            DataField = 'BULTOS'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 12
          end
          object DBEDecMotorMedidaLona: TLFDbedit
            Left = 103
            Top = 218
            Width = 50
            Height = 21
            DataField = 'DEC_MOTOR_MEDIDA_LONA'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 18
          end
          object DBECoeficienteCompra: TLFDbedit
            Left = 103
            Top = 284
            Width = 50
            Height = 21
            DataField = 'COEFICIENTE_COMPRA'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 25
          end
          object DBEFFamilia: TLFDBEditFind2000
            Left = 103
            Top = 306
            Width = 50
            Height = 21
            DataField = 'FAMILIA'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 26
            OnChange = DBEFFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloFamilia: TLFEdit
            Left = 154
            Top = 306
            Width = 403
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
          end
          object ETituloSubFamilia: TLFEdit
            Left = 154
            Top = 328
            Width = 403
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
          object DBEFSubFamilia: TLFDBEditFind2000
            Left = 103
            Top = 328
            Width = 50
            Height = 21
            DataField = 'SUBFAMILIA'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 28
            OnChange = DBEFSubFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_SUBFAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SUBFAMILIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFSubFamiliaBusqueda
            OrdenadoPor.Strings = (
              'SUBFAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETiempoFaseCHE: TLFDbedit
            Left = 103
            Top = 369
            Width = 50
            Height = 21
            DataField = 'TIEMPO_FASE_CHE'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 30
          end
          object DBETiempoFaseMON: TLFDbedit
            Left = 159
            Top = 369
            Width = 50
            Height = 21
            DataField = 'TIEMPO_FASE_MON'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 31
          end
          object DBETiempoFasePRE: TLFDbedit
            Left = 215
            Top = 369
            Width = 50
            Height = 21
            DataField = 'TIEMPO_FASE_PRE'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 32
          end
          object DBETiempoFaseTER: TLFDbedit
            Left = 271
            Top = 369
            Width = 50
            Height = 21
            DataField = 'TIEMPO_FASE_TER'
            DataSource = ZDMModelos.DSQMModelos
            TabOrder = 33
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        object PnlCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 790
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PnlCabNotasD: TLFPanel
            Left = 0
            Top = 0
            Width = 269
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBECodigoNotas: TLFDbedit
              Left = 1
              Top = 0
              Width = 40
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CODIGO'
              DataSource = ZDMModelos.DSQMModelos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEDescCodNotas: TLFDbedit
              Left = 42
              Top = 0
              Width = 223
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DESCRIPCION'
              DataSource = ZDMModelos.DSQMModelos
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
          object NavNotas: THYMNavigator
            Left = 270
            Top = 0
            Width = 66
            Height = 21
            DataSource = ZDMModelos.DSQMModelos
            VisibleButtons = [nbEdit, nbPost, nbCancel]
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
        object PnlEdNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 790
          Height = 400
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 790
            Height = 400
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'NOTAS'
            DataSource = ZDMModelos.DSQMModelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object TSDiasRetraso: TTabSheet [2]
        Caption = '&D'#237'as Retraso'
        ImageIndex = 3
        object DBGDiasColor: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 790
          Height = 343
          Align = alClient
          DataSource = ZDMModelos.DSQMModelosDiasColor
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
            'CODIGO_COLOR')
          CamposAMostrar.Strings = (
            'CODIGO_COLOR'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CODIGO_COLOR'
            'DIAS_RETRASO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'Z_SYS_COLORES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'DESCRIPCION')
          Posicion = tpCentrado
          OnBusqueda = DBGDiasColorBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CODIGO')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_COLOR'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESC_COLOR'
              ReadOnly = True
              Width = 210
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAS_RETRASO'
              Width = 81
              Visible = True
            end>
        end
        object PNLDiasColor: TLFPanel
          Left = 0
          Top = 0
          Width = 790
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object PNLDias: TLFPanel
            Left = 0
            Top = 0
            Width = 269
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBECodigoDias: TLFDbedit
              Left = 1
              Top = 0
              Width = 40
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CODIGO'
              DataSource = ZDMModelos.DSQMModelos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEDescCodDias: TLFDbedit
              Left = 42
              Top = 0
              Width = 223
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DESCRIPCION'
              DataSource = ZDMModelos.DSQMModelos
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
          object NavDiasColor: THYMNavigator
            Left = 278
            Top = 0
            Width = 200
            Height = 21
            DataSource = ZDMModelos.DSQMModelosDiasColor
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGDiasColor
            InsertaControl = DBGDiasColor
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSIncrPrecioColor: TTabSheet [3]
        Caption = 'Incr. Precio Color'
        ImageIndex = 5
        object PNLIncrPrecioColor: TLFPanel
          Left = 0
          Top = 0
          Width = 790
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLIncrPrecioColor2: TLFPanel
            Left = 0
            Top = 0
            Width = 269
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEIncrPrecioColorCodigo: TLFDbedit
              Left = 1
              Top = 0
              Width = 40
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CODIGO'
              DataSource = ZDMModelos.DSQMModelos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEIncrPrecioColorDesc: TLFDbedit
              Left = 42
              Top = 0
              Width = 223
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DESCRIPCION'
              DataSource = ZDMModelos.DSQMModelos
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
          object NavIncrPrecioColor: THYMNavigator
            Left = 278
            Top = 0
            Width = 200
            Height = 21
            DataSource = ZDMModelos.DSIncrPrecioColor
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGIncrPrecioColor
            InsertaControl = DBGIncrPrecioColor
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGIncrPrecioColor: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 790
          Height = 343
          Align = alClient
          DataSource = ZDMModelos.DSIncrPrecioColor
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'CODIGO_COLOR')
          CamposAMostrar.Strings = (
            'CODIGO_COLOR'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CODIGO_COLOR'
            'DIAS_RETRASO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'Z_SYS_COLORES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'DESCRIPCION')
          Posicion = tpCentrado
          OnBusqueda = DBGIncrPrecioColorBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CODIGO')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_COLOR'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESC_COLOR'
              Width = 210
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCR_PRECIO'
              Width = 81
              Visible = True
            end>
        end
      end
      object TSAgrupaciones: TTabSheet [4]
        Caption = 'Agrupaciones'
        ImageIndex = 4
        OnResize = TSAgrupacionesResize
        OnShow = TSAgrupacionesShow
        object TBAgrupaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 790
          Height = 24
          ButtonWidth = 22
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLCabAgrupaciones: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBExTit: TLFDbedit
              Left = 67
              Top = 1
              Width = 260
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'DESCRIPCION'
              DataSource = ZDMModelos.DSQMModelos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBtnText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBExModelo: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CODIGO'
              DataSource = ZDMModelos.DSQMModelos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBtnText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton5: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAgrupaciones: THYMNavigator
            Left = 336
            Top = 0
            Width = 88
            Height = 22
            DataSource = ZDMModelos.DSxAgrupSon
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alLeft
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = False
            ControlEdit = CEAgrupaciones
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton2: TToolButton
            Left = 424
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavDispopibles: THYMNavigator
            Left = 432
            Top = 0
            Width = 88
            Height = 22
            DataSource = ZDMModelos.DSxAgrupDisp
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesDispPMEdit
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEAgrupacionesDisp
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBCGPertenece: TLFDBCtrlGrid
          Left = 0
          Top = 43
          Width = 790
          Height = 130
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = ZDMModelos.DSxAgrupSon
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelBorder = gbNone
          PanelHeight = 26
          PanelWidth = 774
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          RowCount = 5
          SelectedColor = clHighlight
          OnDblClick = DBCGPerteneceDblClick
          object DBEAgDentro: TLFDbedit
            Left = 7
            Top = 0
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = ZDMModelos.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBtnText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDentro: TLFDbedit
            Left = 72
            Top = 0
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMModelos.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBtnText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PPertenece: TLFPanel
          Left = 0
          Top = 24
          Width = 790
          Height = 19
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
          TabOrder = 2
        end
        object PDisponibles: TLFPanel
          Left = 0
          Top = 173
          Width = 790
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones disponibles'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBCGDisponibles: TLFDBCtrlGrid
          Left = 0
          Top = 192
          Width = 790
          Height = 230
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = ZDMModelos.DSxAgrupDisp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelBorder = gbNone
          PanelHeight = 38
          PanelWidth = 774
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          RowCount = 6
          SelectedColor = clHighlight
          OnDblClick = DBCGDisponiblesDblClick
          object DBEAgCodDisp: TLFDbedit
            Left = 7
            Top = 0
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = ZDMModelos.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBtnText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDisp: TLFDbedit
            Left = 72
            Top = 0
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMModelos.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBtnText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 790
          Height = 365
          DataSource = ZDMModelos.DSQMModelos
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 346
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAS_SERVIR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 480
    Width = 802
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 644
    Top = 88
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 680
    Top = 88
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 644
    Top = 164
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AListado: TAction
      Category = 'Listados'
      Caption = 'Listado Modelos'
      ImageIndex = 14
      OnExecute = AListadoExecute
    end
    object ACrearDatosModelo: TAction
      Category = 'Procesos'
      Caption = 'Crear Datos Modelo'
      ImageIndex = 94
      OnExecute = ACrearDatosModeloExecute
    end
    object ABorrarModeloTodos: TAction
      Category = 'Procesos'
      Caption = 'Borrar modelo (todos)'
      ImageIndex = 39
      OnExecute = ABorrarModeloTodosExecute
    end
    object ABorrarModeloObsoletos: TAction
      Category = 'Procesos'
      Caption = 'Borrar modelo (obsoletos)'
      ImageIndex = 11
      OnExecute = ABorrarModeloObsoletosExecute
    end
    object AAdjunto: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de Modelo'
      Hint = 'Adjuntos de Modelo'
      ImageIndex = 59
      OnExecute = AAdjuntoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 680
    Top = 200
  end
  object CENotas: TControlEdit
    EnlazadoA = CEIncrPrecioColor
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PnlEdNotas
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 644
    Top = 124
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 680
    Top = 124
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
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
  object ALModelos: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 644
    Top = 200
    object AModelosDet: TAction
      Caption = 'AModelosDet'
      OnExecute = AModelosDetExecute
    end
  end
  object OPImagen: TOpenPictureDialog
    Left = 680
    Top = 164
  end
  object CEAgrupacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 676
    Top = 236
    object CEAgrupacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEAgrupacionesDispPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 676
    Top = 266
    object CEAgrupacionesDispMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesDispMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesDispMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesDispMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesDispMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesDispMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesDispMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesDispMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesDispMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesDispMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEAgrupacionesDisp: TControlEdit
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesDispPMEdit
    Teclas = DMMain.Teclas
    Left = 646
    Top = 266
  end
  object CEAgrupaciones: TControlEdit
    EnlazadoA = CEAgrupacionesDisp
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 646
    Top = 236
  end
  object CEIncrPrecioColor: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSIncrPrecioColor
    FichaExclusiva = TSIncrPrecioColor
    PopUpMenu = CEIncrPrecioColorPMEdit
    Teclas = DMMain.Teclas
    Left = 648
    Top = 56
  end
  object CEIncrPrecioColorPMEdit: TPopUpTeclas
    Left = 680
    Top = 56
  end
end
