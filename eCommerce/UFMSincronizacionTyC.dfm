inherited FMSincronizacionTyC: TFMSincronizacionTyC
  Width = 700
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion Toldos y Cortinas'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 690
    Height = 241
    inherited TBMain: TLFToolBar
      Width = 686
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = DMSincronizacionTyC.DSQMCabecera
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 278
      end
      inherited TbuttComp: TToolButton
        Left = 286
      end
    end
    inherited PCMain: TLFPageControl
      Width = 686
      Height = 211
      inherited TSFicha: TTabSheet
        object SBADocumento: TSpeedButton [0]
          Left = 122
          Top = 86
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBADocumentoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 678
          Height = 183
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Tabla_a_buscar = 'API_PEDIDOS_TOLDOS_CAB'
            CampoNum = 'ID'
            CampoStr = 'REFERENCE'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'DATE_ADD desc')
          end
          object LCliente: TLFLabel
            Left = 41
            Top = 49
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LId: TLFLabel
            Left = 65
            Top = 5
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object LReference: TLFLabel
            Left = 22
            Top = 27
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
          end
          object LFechaEnvio: TLFLabel
            Left = 335
            Top = 28
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Envio'
          end
          object LDireccion: TLFLabel
            Left = 28
            Top = 71
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
          end
          object LTotalAmount: TLFLabel
            Left = 49
            Top = 137
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total'
          end
          object LMagin: TLFLabel
            Left = 243
            Top = 137
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen'
          end
          object LInstalationAmount: TLFLabel
            Left = 15
            Top = 93
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Inst.'
          end
          object LShippingAmount: TLFLabel
            Left = 43
            Top = 115
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object LSalesBudget: TLFLabel
            Left = 216
            Top = 93
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sales Budget'
          end
          object LSalesBudgetPlusTaxes: TLFLabel
            Left = 187
            Top = 115
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sales Budget + IVA'
          end
          object LDocumento: TLFLabel
            Left = 361
            Top = 5
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dest.'
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 79
            Top = 46
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CLIENTE'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            ReadOnly = True
            TabOrder = 2
            OnChange = DBEFClienteChange
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
            Entorno = DMFacturas.EntornoDoc
          end
          object DBETituloCliente: TLFDbedit
            Left = 144
            Top = 46
            Width = 520
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEId: TLFDbedit
            Left = 80
            Top = 2
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEReference: TLFDbedit
            Left = 80
            Top = 24
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'REFERENCE'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBDEDeliveryDate: TLFDBDateEdit
            Left = 392
            Top = 24
            Width = 90
            Height = 21
            DataField = 'DELIVERY_DATE'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            ReadOnly = True
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 13
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 79
            Top = 68
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            ReadOnly = True
            TabOrder = 4
            OnChange = DBEFDireccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMFacturas.EntornoDoc
          end
          object DBEDireccionCliente: TLFDbedit
            Left = 144
            Top = 68
            Width = 520
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'DIR_COMPLETA_N'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBETotalAmount: TLFDbedit
            Left = 79
            Top = 134
            Width = 100
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TOTAL_AMOUNT'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBEMagin: TLFDbedit
            Left = 285
            Top = 134
            Width = 100
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'MARGIN'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBEInstalationAmount: TLFDbedit
            Left = 79
            Top = 90
            Width = 100
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'INSTALLATION_AMOUNT'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBEShippingAmount: TLFDbedit
            Left = 79
            Top = 112
            Width = 100
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'SHIPPING_AMOUNT'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBESalesBudget: TLFDbedit
            Left = 285
            Top = 90
            Width = 100
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'SALES_BUDGET'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBESalesBudgetPlusTaxes: TLFDbedit
            Left = 285
            Top = 112
            Width = 100
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'SALES_BUDGET_PLUS_TAXES'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBMObservations: TLFDBMemo
            Left = 392
            Top = 90
            Width = 272
            Height = 65
            DataField = 'OBSERVATIONS'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            ReadOnly = True
            TabOrder = 14
          end
          object DBEDocumento: TLFDbedit
            Left = 392
            Top = 2
            Width = 271
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            DataField = 'DOCUMENTO'
            DataSource = DMSincronizacionTyC.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 678
          Height = 183
          DataSource = DMSincronizacionTyC.DSQMCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REFERENCE'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DELIVERY_DATE'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_COMPLETA_N'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_AMOUNT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARGIN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INSTALLATION_AMOUNT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHIPPING_AMOUNT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALES_BUDGET'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALES_BUDGET_PLUS_TAXES'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATE_ADD'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATE_UPD'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_S'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Width = 150
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Left = 302
          Top = 175
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 241
    Width = 690
    Height = 206
    inherited TBDetalle: TLFToolBar
      Width = 690
      inherited NavDetalle: THYMNavigator
        Width = 210
        DataSource = DMSincronizacionTyC.DSQMDetalle
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 690
      Height = 184
      Color = clInfoBk
      DataSource = DMSincronizacionTyC.DSQMDetalle
      PopupMenu = nil
      ReadOnly = True
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      ColumnasCheckBoxes.Strings = (
        'CREATED'
        'ES_MOTOR'
        'ES_TOLDO')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0')
      Columns = <
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_LARGO'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNITS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RATE_BEFORE_DISCOUNT'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREATED'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_DESPIECE_CAB'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_TOLDO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO'
          Width = 50
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
          FieldName = 'MEDIDAS_UDS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEJIDO_LONA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LONA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COLOR_ESTRUCTURA_COLOR'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COLOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_LINEA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_SALIDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_AUTO_LADO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_AUTO_LONG_MANIVELA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_AUTO_TIPO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_BRAZOS_LUZ_LED'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_ESCUADRA_A_TECHO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_ESCUADRA_A_TECHO_UDS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_ESCUADRA_SOPORTE_A_TECHO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_JUEGO_SOPORTES_TECHO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_JUEGO_SOPORTES_TECHO_TIP'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_LASTRE_HORMIGO_MACETERO_'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_LUZ_LED_BARRA_DE_CARGA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_LUZ_LED_PERFIL_COFRE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_MACETERO_GEMINI_POT'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_PAREJA_PUNTALES_TELESCOP'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_PL_AJ_SOPORTE_BRAZO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_PL_AJ_SOPORTE_BRAZO_UDS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_PL_AJ_SOPORTE_CENTRAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_PLACA_PATAS_FIJAS_MACETE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_RUEDA_GIRATORIA_MACETERO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_SOPORTE_ENTREPAREDES'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_SOPORTE_ENTREPAREDES_UDS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_SOPORTE_LARGO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_SOPORTE_LARGO_UDS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_TEJADILLO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_TEJADILLO_JUEGO_TAPAS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_TEJADILLO_N_LAMAS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_OP_VIGAS_PIES_100_100'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INSTALACION_TIPO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_ALTURA_DELANTERA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_ALTURA_PIES'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_ALTURA_PORTERIA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_ALTURA_PORTERIA_2'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_ALTURA_TRASERA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDAS_CAIDA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_DOBLE_TIRO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_GUIA_120_120'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_GUIA_ADICIONAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_N_LATERALES'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_PERIMETRAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_PILAR_AD_BASE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_PILAR_AD_BASE_UDS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_POLEA_TIRO_CUERDA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_SUPLEMENTO_TAPA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_TEJ_MOD'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_TEJ_MOD_N_LAMAS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_TEJ_MO_SOPORTE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_TEJ_MOD_TAPA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ESTRUCTURA_TEJAD_MOD_UDS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEJIDO_ALTURA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEJIDO_BAMBALINA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEJIDO_ONDA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEJIDO_RIBETE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_ADD'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_UPD'
          Width = 64
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
        end
        item
          Expanded = False
          FieldName = 'COLOCACION'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTAJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_MOTOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANIVELA'
          Width = 64
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 690
  end
  inherited CEMain: TControlEdit
    Left = 464
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 496
    Top = 0
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 392
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 424
    Top = 0
  end
  inherited CEDetalle: TControlEdit
    Left = 536
    Top = 0
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 568
    Top = 0
    inherited CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      Visible = False
    end
    inherited CEDetalleMipost: TMenuItem
      Visible = False
    end
    inherited CEDetalleMicancel: TMenuItem
      Visible = False
    end
  end
end
