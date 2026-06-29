object ProFMConfiguracion: TProFMConfiguracion
  Left = 474
  Top = 116
  Width = 535
  Height = 398
  ActiveControl = LFCBActQuim
  Caption = 'Configuraci'#243'n Producci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEConfigPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBConf: TLFToolBar
    Left = 0
    Top = 0
    Width = 527
    Height = 25
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 80
      Height = 22
      DataSource = ProDMConfiguracion.DSConfiguracion
      VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEConfigPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEConfig
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object ToolButton1: TToolButton
      Left = 80
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBSalir: TToolButton
      Left = 88
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TBSalirClick
    end
  end
  object PCMain: TLFPanel
    Left = 0
    Top = 25
    Width = 527
    Height = 346
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object LFPCMain: TLFPageControl
      Left = 0
      Top = 0
      Width = 527
      Height = 346
      ActivePage = TSGeneral
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSGeneral: TTabSheet
        Caption = 'General'
        object LFPanelGen: TLFPanel
          Left = 0
          Top = 0
          Width = 519
          Height = 318
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFCBActQuim: TLFDBCheckBox
            Left = 18
            Top = 25
            Width = 470
            Height = 17
            Caption = 'Activar Qu'#237'micas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = LFCBActQuimClick
            Alignment = taLeftJustify
            DataField = 'ACTIVAR_QUIMICAS'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object LFCBFiltroArtFasesOF: TLFDBCheckBox
          Left = 34
          Top = 61
          Width = 400
          Height = 17
          Caption = 'Filtro Art'#237'culo Fases Producci'#243'n'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'QUIM_FILTRO_ARTICULO_FASES'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFCBTipoControl: TLFDBCheckBox
          Left = 34
          Top = 42
          Width = 400
          Height = 17
          Caption = 'Tipo Control Ordenes Producci'#243'n'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'QUIM_TIPOCONTROL'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFDensidad: TLFDBCheckBox
          Left = 34
          Top = 81
          Width = 400
          Height = 17
          Caption = 'Utilizar Densidad Escandallo'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'QUIM_DENSIDAD'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFCBPorcent: TLFDBCheckBox
          Left = 34
          Top = 101
          Width = 400
          Height = 17
          Caption = 'Utilizar % Escandallo'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'ESC_PORCENT'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TSEscandallo: TTabSheet
        Caption = 'Escandallo'
        ImageIndex = 10
        object LFPanelEscandallo: TLFPanel
          Left = 0
          Top = 0
          Width = 519
          Height = 318
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFLabel6: TLFLabel
            Left = 17
            Top = 187
            Width = 62
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Precios Mat.'
          end
          object LAlmEnt: TLFLabel
            Left = 31
            Top = 254
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Ent.'
          end
          object LAlmLan: TLFLabel
            Left = 29
            Top = 233
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Lan.'
          end
          object LAlmSal: TLFLabel
            Left = 32
            Top = 212
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Sal.'
          end
          object LAlmRec: TLFLabel
            Left = 7
            Top = 276
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Rechazo'
          end
          object LFCBGeneraOF: TLFDBCheckBox
            Left = 18
            Top = 25
            Width = 470
            Height = 17
            Caption = 'Genera OF'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'esc_genera_of'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBModifCoste: TLFDBCheckBox
            Left = 18
            Top = 46
            Width = 470
            Height = 17
            Caption = 'Modificar Coste'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESC_MODIFICAR_COSTE'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBMateriales: TLFDBCheckBox
            Left = 18
            Top = 68
            Width = 470
            Height = 17
            Caption = 'Materiales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESC_MATERIALES'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBAutoCalc: TLFDBCheckBox
            Left = 18
            Top = 89
            Width = 470
            Height = 17
            Caption = 'Auto Calcular'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESC_AUTO_CALCULAR'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBRecursos: TLFDBCheckBox
            Left = 18
            Top = 111
            Width = 470
            Height = 17
            Caption = 'Recursos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESC_RECURSOS'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBActivo: TLFDBCheckBox
            Left = 18
            Top = 133
            Width = 470
            Height = 17
            Caption = 'Poner escandallo nuevo en Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESC_ACTIVO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBTraspasarMedidas: TLFDBCheckBox
            Left = 18
            Top = 154
            Width = 470
            Height = 17
            Caption = 'Traspasar medidas a Orden de Producci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESC_TRASPASAR_MEDIDAS_OF'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBLKTipo_Precio: TDBLookupComboBox
            Left = 86
            Top = 181
            Width = 151
            Height = 21
            DataField = 'ESC_PRECIO_MAT'
            DataSource = ProDMConfiguracion.DSConfiguracion
            KeyField = 'TIPO_PRECIO_BASE'
            ListField = 'TITULO'
            ListSource = ProDMConfiguracion.DSTipo_Precio
            TabOrder = 7
          end
          object DBEAlmEnt: TLFDBEditFind2000
            Left = 80
            Top = 250
            Width = 65
            Height = 21
            DataField = 'ALMACEN_ENT'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 10
            OnChange = DBEAlmEntChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = []
          end
          object EAlmEnt: TLFEdit
            Left = 146
            Top = 250
            Width = 343
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 12
          end
          object EAlmLan: TLFEdit
            Left = 146
            Top = 229
            Width = 343
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 13
          end
          object DBEAlmLan: TLFDBEditFind2000
            Left = 80
            Top = 229
            Width = 65
            Height = 21
            DataField = 'ALMACEN_LAN'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 9
            OnChange = DBEAlmLanChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = []
          end
          object EAlmSal: TLFEdit
            Left = 146
            Top = 208
            Width = 343
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 14
          end
          object DBEAlmSal: TLFDBEditFind2000
            Left = 80
            Top = 208
            Width = 65
            Height = 21
            DataField = 'ALMACEN_SAL'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 8
            OnChange = DBEAlmSalChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = []
          end
          object EAlmRec: TLFEdit
            Left = 146
            Top = 272
            Width = 343
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
          end
          object DBEAlmRec: TLFDBEditFind2000
            Left = 80
            Top = 272
            Width = 65
            Height = 21
            DataField = 'ALMACEN_REC'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 11
            OnChange = DBEAlmRecChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSOP: TTabSheet
        Caption = 'O.P.'
        ImageIndex = 3
        DesignSize = (
          519
          318)
        object LFAlmEscandallo: TLFDBCheckBox
          Left = 15
          Top = 9
          Width = 290
          Height = 17
          Caption = 'Prevalece Almac'#233'n Orden'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'PREVALECE_ALM_ORDEN'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFReservaStock: TLFDBCheckBox
          Left = 15
          Top = 26
          Width = 290
          Height = 17
          Caption = 'Reserva Stock'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          OnChange = LFReservaStockChange
          DataField = 'RESERVA_STOCK_OP'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFUndPendCompras: TLFDBCheckBox
          Left = 15
          Top = 44
          Width = 290
          Height = 17
          Caption = 'Permitir cerrar OF con uds. pendientes < 0 (Compras)'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_UDS_PENDIENTES'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFPrecioNoDto: TLFDBCheckBox
          Left = 15
          Top = 62
          Width = 290
          Height = 17
          Caption = 'Utilizar precio sin descuento en coste de compras'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_NO_DTO_COMPRAS'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFCBModifCompras: TLFDBCheckBox
          Left = 15
          Top = 79
          Width = 290
          Height = 17
          Caption = 'Habilitar la modificaci'#243'n de compras en OF '
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_MODIF_COMPRAS'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFCBorrarComprasOF: TLFDBCheckBox
          Left = 15
          Top = 97
          Width = 290
          Height = 17
          Caption = 'Habilitar el borrado de compras en OF'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 5
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_BORRADO_COMPRAS'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFCBGenerarMovStock: TLFDBCheckBox
          Left = 15
          Top = 115
          Width = 290
          Height = 17
          Caption = 'No generar mov. stock al cerrar OF'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 6
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_MOV_STOCK_CERRAR_OP'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object GRMovStock: TGroupBox
          Left = 308
          Top = 10
          Width = 204
          Height = 87
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Permitir Mov. Stock al cerrar OF'
          TabOrder = 13
          object LFCBMovStockCompuesto: TLFDBCheckBox
            Left = 20
            Top = 22
            Width = 151
            Height = 17
            Caption = 'Mov. Stock. Compuesto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OF_MOV_STOCK_CERRAR_COMPUESTO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBMovStockComponente: TLFDBCheckBox
            Left = 20
            Top = 43
            Width = 153
            Height = 17
            Caption = 'Mov. Stock. Componente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            OnChange = LFCBMovStockComponenteChange
            DataField = 'OF_MOV_STOCK_CERRAR_COMPONENTE'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBFabricadas: TLFDBCheckBox
            Left = 47
            Top = 65
            Width = 95
            Height = 17
            Caption = 'Un. Fabricadas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OF_UN_FABRICADES_MOV_COMPONENTE'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object LFCBCrearLote: TLFDBCheckBox
          Left = 15
          Top = 150
          Width = 290
          Height = 17
          Caption = 'Crear lote al lanzar OF'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_CREAR_LOTE_LANZAR_OP'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object Importar: TDBRadioGroup
          Left = 308
          Top = 100
          Width = 204
          Height = 116
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Importar'
          DataField = 'Importar_OP'
          DataSource = ProDMConfiguracion.DSConfiguracion
          Items.Strings = (
            'Escandallo completo'
            'Fases'
            'Fases / Materiales'
            'Fases / Tareas')
          TabOrder = 14
          Values.Strings = (
            '0'
            '1'
            '2'
            '3')
        end
        object RGCaso: TDBRadioGroup
          Left = 14
          Top = 239
          Width = 499
          Height = 73
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Sub-Orden'
          DataField = 'Caso_OP'
          DataSource = ProDMConfiguracion.DSConfiguracion
          Items.Strings = (
            'Generar Sub-Ordenes'
            'Generar Ordenes Independientes'
            'No Generar Sub-Ordenes')
          TabOrder = 15
          Values.Strings = (
            '0'
            '1'
            '2')
          OnChange = RGCasoClick
        end
        object LFCerrarSubOP: TLFDBCheckBox
          Left = 234
          Top = 250
          Width = 151
          Height = 17
          Caption = 'Cerrar Sub-Ordenes'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 16
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'CERRAR_SUBORDENES'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFCompVirtual: TLFDBCheckBox
          Left = 234
          Top = 275
          Width = 151
          Height = 17
          Caption = 'No Mov. en Comp. Virtuales'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 17
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'compuestos_virtuales'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFDBIntroCierre: TLFDBCheckBox
          Left = 15
          Top = 168
          Width = 290
          Height = 17
          Caption = 'Introducir datos cierre'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 9
          TabStop = True
          Alignment = taLeftJustify
          OnChange = LFDBIntroCierreChange
          DataField = 'OF_DATOS_CIERRE'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFDBCierreParcial: TLFDBCheckBox
          Left = 15
          Top = 185
          Width = 290
          Height = 17
          Hint = 'Permite hacer cierres de mas de un lote en la misma orden'
          Caption = 'Cierre Parcial - Lote Secuencial'
          ClicksDisabled = False
          ColorCheck = 57088
          ShowHint = True
          TabOrder = 10
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_CIERRE_PARCIAL_SECUENCIAL'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ParentShowHint = False
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCBUsarPrecioLote: TLFDBCheckBox
          Left = 15
          Top = 132
          Width = 290
          Height = 17
          Caption = 'Usar precio lote Inc. Material'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 7
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_USAR_PRECIO_LOTE'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object LFDBCierreParcialMovStockComponente: TLFDBCheckBox
          Left = 15
          Top = 203
          Width = 290
          Height = 17
          Hint = 
            'No Realizar Movimiento Stock de Componentes en los cierre parcia' +
            'l de ordenes de produccion'
          Caption = 'Cierre Parcial - No Realizar Mov. Stock de Componentes'
          ClicksDisabled = False
          ColorCheck = 57088
          ShowHint = True
          TabOrder = 11
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'OF_CIERRE_PARCIAL_NO_MOV_COMPON'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ParentShowHint = False
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCBNoExcederUnidadesReservadas: TLFDBCheckBox
          Left = 15
          Top = 221
          Width = 290
          Height = 17
          Hint = 
            'No exceder unidades reservadas en los cierre parcial de ordenes ' +
            'de produccion'
          Caption = 'Cierre Parcial - No exceder unidades reservadas'
          ClicksDisabled = False
          ColorCheck = 57088
          ShowHint = True
          TabOrder = 12
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'NO_EXCEDER_UNIDADES_RESERVADAS'
          DataSource = ProDMConfiguracion.DSConfiguracion
          ParentShowHint = False
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TSGestion: TTabSheet
        Caption = 'Gesti'#243'n'
        object PNLGestion: TLFPanel
          Left = 0
          Top = 0
          Width = 519
          Height = 318
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFCBOfertesAEscandall: TLFDBCheckBox
            Left = 18
            Top = 25
            Width = 470
            Height = 17
            Caption = 
              'Al traspasar oferta a pedido, traspasar oferta escandallo y medi' +
              'das'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'gest_ofertas_esc'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBEscandallxDefecto: TLFDBCheckBox
            Left = 18
            Top = 62
            Width = 470
            Height = 17
            Caption = 
              'Al crear linea pedido, asociar linea con escandallo por defecto ' +
              '(si tiene)'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_ESC_PORDEFECTO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBFiltroEsc: TLFDBCheckBox
            Left = 18
            Top = 80
            Width = 470
            Height = 17
            Caption = 
              'En pedidos, filtrar la creaci'#243'n de un nuevo escandallo por el mi' +
              'smo articulo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_FILTRO_ESC_PED'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBOFPedProv: TLFDBCheckBox
            Left = 18
            Top = 99
            Width = 470
            Height = 17
            Caption = 'Utilizar OF en pedidos a proveedores'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_OF_PED_PROV'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBGestPed: TLFDBCheckBox
            Left = 18
            Top = 117
            Width = 470
            Height = 17
            Caption = 
              'Desde pedidos de clientes, al crear una OF, lanzarla autom'#224'ticam' +
              'ente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_PED_AUTO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBCerrarOFPed: TLFDBCheckBox
            Left = 18
            Top = 136
            Width = 470
            Height = 17
            Caption = 'Al cerrar un pedido de clientes, cerrar la OF asociada'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_OF_CIERRA'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBPreuV: TLFDBCheckBox
            Left = 18
            Top = 154
            Width = 470
            Height = 17
            Caption = 'Precio de venta de la OF proviene del pedido de cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_PRECIO_VENTA_PEDIDO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFCBOfe_defecto: TLFDBCheckBox
            Left = 18
            Top = 43
            Width = 470
            Height = 17
            Caption = 
              'Al crear linea oferta, asociar linea con escandallo (EPR) por de' +
              'fecto (si tiene)'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_OFE_ESC'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBPrecioVenta: TDBRadioGroup
            Left = 18
            Top = 203
            Width = 487
            Height = 75
            Caption = 'Precio de Venta OF'
            DataField = 'GEST_PRECIO_VENTA_PEDIDO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            Items.Strings = (
              'Precio de venta de la OF proviene de la linea del pedido'
              'Precio de venta de la OF proviene del total bruto del pedido'
              
                'Precio de venta de la OF proviene de la base imponible de la lin' +
                'ea entre las unidades')
            TabOrder = 8
            Values.Strings = (
              '1'
              '2'
              '3')
          end
          object LFCBOfe_Esc_Ofe: TLFDBCheckBox
            Left = 18
            Top = 173
            Width = 470
            Height = 17
            Caption = 'En ofertas de cliente, trabajar con escandallo ofertas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GEST_OFE_TRABAJAR_ESC_OFE'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSMarcajes: TTabSheet
        Caption = 'Marcajes'
        object PNLMarcajes: TLFPanel
          Left = 0
          Top = 0
          Width = 519
          Height = 318
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            519
            318)
          object LUtlimaFecha: TLFLabel
            Left = 46
            Top = 56
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = #218'ltima Fecha'
          end
          object LConnectionString: TLFLabel
            Left = 10
            Top = 80
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cadena de conexi'#243'n'
          end
          object DBDEUltimaFecha: TLFDBDateEdit
            Left = 112
            Top = 56
            Width = 121
            Height = 21
            DataField = 'PRES_ULT_FEC_IMP'
            DataSource = ProDMConfiguracion.DSConfiguracion
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DBMConnectionString: TLFDBMemo
            Left = 112
            Top = 78
            Width = 387
            Height = 221
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'PRES_CONNECTIONSTRING_IMESD'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 1
          end
          object DBTPHora: TDBDateTimePicker
            Left = 234
            Top = 56
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963.3871174653
            Time = 42963.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 2
            DataField = 'PRES_ULT_FEC_IMP'
            DataSource = ProDMConfiguracion.DSConfiguracion
          end
          object DBCBMultimarcaje: TLFDBCheckBox
            Left = 8
            Top = 34
            Width = 118
            Height = 17
            Caption = 'Usar multimarcaje'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'MARCAJE_TIPO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSContadores: TTabSheet
        Caption = 'Contadores'
        object PNLContadores: TLFPanel
          Left = 0
          Top = 0
          Width = 519
          Height = 318
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LContSer: TLFLabel
            Left = 12
            Top = 48
            Width = 165
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador Serialitzaci'#243'n Producci'#243'n'
          end
          object LFEContSer: TLFDbedit
            Left = 180
            Top = 44
            Width = 64
            Height = 21
            DataField = 'CONTADOR_SER_PROD'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 0
          end
          object DBCBCreacionSeriesAutomatica: TLFDBCheckBox
            Left = 12
            Top = 20
            Width = 469
            Height = 17
            Caption = 'Creaci'#243'n autom'#225'tica de series para compuestos en OP'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTADOR_CREACION_AUTO'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSTolyCor: TTabSheet
        Caption = 'Toldos y Cortinas'
        object PNLTolyCor: TLFPanel
          Left = 0
          Top = 0
          Width = 519
          Height = 318
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LAlmRet: TLFLabel
            Left = 23
            Top = 68
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Retales'
          end
          object LCantMinAlmRet: TLFLabel
            Left = 10
            Top = 90
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cant. m'#237'n. retal'
          end
          object LFCBSeparaPed: TLFDBCheckBox
            Left = 18
            Top = 25
            Width = 455
            Height = 17
            Caption = 'Crear OP por cada l'#237'nea de pedido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'z_un_ped_n_op'
            DataSource = ProDMConfiguracion.DSConfiguracion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAlmRet: TLFDBEditFind2000
            Left = 88
            Top = 64
            Width = 65
            Height = 21
            DataField = 'ALMACEN_RET'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 1
            OnChange = DBEAlmRetChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EAlmRet: TLFEdit
            Left = 154
            Top = 64
            Width = 343
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 2
          end
          object DBECantMinAlmRet: TLFDbedit
            Left = 88
            Top = 86
            Width = 65
            Height = 21
            DataField = 'CANT_MIN_ALM_RET'
            DataSource = ProDMConfiguracion.DSConfiguracion
            TabOrder = 3
          end
        end
      end
      object TSTrabExterno: TTabSheet
        Caption = 'Trab. Ext.'
        ImageIndex = 7
        object LAlmacenPreparacion: TLFLabel
          Left = 25
          Top = 20
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Preparaci'#243'n'
        end
        object LAlmacenTrabExterno: TLFLabel
          Left = 7
          Top = 43
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Trabajo Externo'
        end
        object LAlmacenEntrada: TLFLabel
          Left = 22
          Top = 65
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Alm- Entrada'
        end
        object DBEFAlmacenPreparacion: TLFDBEditFind2000
          Left = 88
          Top = 16
          Width = 65
          Height = 21
          DataField = 'ALM_PREPARACION_TE'
          DataSource = ProDMConfiguracion.DSConfiguracion
          TabOrder = 0
          OnChange = DBEFAlmacenPreparacionChange
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacenPreparacion: TLFEdit
          Left = 154
          Top = 16
          Width = 343
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
        object DBEFAlmacenTrabExterno: TLFDBEditFind2000
          Left = 88
          Top = 39
          Width = 65
          Height = 21
          DataField = 'ALM_TEX'
          DataSource = ProDMConfiguracion.DSConfiguracion
          TabOrder = 2
          OnChange = DBEFAlmacenTrabExternoChange
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacenTrabExterno: TLFEdit
          Left = 154
          Top = 39
          Width = 343
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
        object DSBEAlmacenEntrada: TLFDBEditFind2000
          Left = 88
          Top = 61
          Width = 65
          Height = 21
          DataField = 'ALM_ENTRADA_TEX'
          DataSource = ProDMConfiguracion.DSConfiguracion
          TabOrder = 4
          OnChange = DSBEAlmacenEntradaChange
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacenEntrada: TLFEdit
          Left = 154
          Top = 61
          Width = 343
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 5
        end
      end
    end
  end
  object CEContadores: TControlEdit
    PanelEdicion = PNLContadores
    PopUpMenu = CEContadoresPMEdit
    Teclas = DMMain.Teclas
    Left = 432
    Top = 4
  end
  object CEContadoresPMEdit: TPopUpTeclas
    Left = 464
    Top = 4
    object CEContadoresMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEContadoresMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEContadoresMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEContadoresMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEContadoresMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEContadoresMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEContadoresMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEContadoresMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEContadoresMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEContadoresMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEConfig: TControlEdit
    DataSource = ProDMConfiguracion.DSConfiguracion
    PopUpMenu = CEConfigPMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 4
  end
  object CEConfigPMEdit: TPopUpTeclas
    Left = 400
    Top = 4
    object CEConfigMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEConfigMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEConfigMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEConfigMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEConfigMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEConfigMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEConfigMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEConfigMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEConfigMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEConfigMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 336
    Top = 4
  end
end
