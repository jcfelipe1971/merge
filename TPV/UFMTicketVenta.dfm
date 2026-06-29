object FMTicketVenta: TFMTicketVenta
  Left = 266
  Top = 121
  Width = 1276
  Height = 748
  Caption = 'Ticket Venta'
  Color = clBtnFace
  Constraints.MinHeight = 721
  Constraints.MinWidth = 1024
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object PNLVentas: TLFPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 721
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'PNLVentas'
    TabOrder = 0
    OnResize = PNLVentasResize
    object PNLCabecera: TLFPanel
      Left = 0
      Top = 0
      Width = 465
      Height = 89
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object PNLTotales: TLFPanel
        Left = 0
        Top = 64
        Width = 465
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object PNLTotalesUnidades: TLFPanel
          Left = 0
          Top = 0
          Width = 97
          Height = 25
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'PNLTotalesUnidades'
          ParentColor = True
          TabOrder = 0
          object DBTUnidadesTotales: TDBText
            Left = 0
            Top = 0
            Width = 97
            Height = 25
            Align = alClient
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'UNIDADES'
            DataSource = DMTicketVenta.DSxInfoActualizada
          end
        end
        object PNLTotalesBase: TLFPanel
          Left = 97
          Top = 0
          Width = 247
          Height = 25
          Align = alClient
          BevelOuter = bvNone
          Caption = 'PNLTotalesUnidades'
          TabOrder = 1
          object DBTSumaBases: TDBText
            Left = 0
            Top = 0
            Width = 247
            Height = 25
            Align = alClient
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'S_BASES'
            DataSource = DMTicketVenta.DSxInfoActualizada
          end
        end
        object PNLTotalesIVA: TLFPanel
          Left = 344
          Top = 0
          Width = 121
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          Caption = 'PNLTotalesUnidades'
          TabOrder = 2
          object DBTSumaCuotaIVA: TDBText
            Left = 0
            Top = 0
            Width = 121
            Height = 25
            Align = alClient
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'S_CUOTA_IVA'
            DataSource = DMTicketVenta.DSxInfoActualizada
          end
        end
      end
      object PNLTotal: TLFPanel
        Left = 0
        Top = 0
        Width = 465
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object DBTTotal: TDBText
          Left = 224
          Top = 0
          Width = 241
          Height = 32
          Align = alRight
          Alignment = taRightJustify
          DataField = 'LIQUIDO'
          DataSource = DMTicketVenta.DSxInfoActualizada
        end
        object DBNumTicket: TDBText
          Left = 16
          Top = 0
          Width = 208
          Height = 32
          Align = alClient
          DataField = 'NUM_TICKET'
          DataSource = DMTicketVenta.DSxInfoActualizada
        end
        object LRIT: TLabel
          Left = 0
          Top = 0
          Width = 16
          Height = 32
          Align = alLeft
          Caption = '#'
        end
        object DBTCliente: TDBText
          Left = 0
          Top = 32
          Width = 465
          Height = 33
          Align = alBottom
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMTicketVenta.DSxInfoActualizada
        end
      end
    end
    object PNLPie: TLFPanel
      Left = 0
      Top = 556
      Width = 465
      Height = 165
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object LArticulosNoValidos: TLabel
        Left = 0
        Top = 40
        Width = 182
        Height = 121
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object EFArticulo: TLFEditFind2000
        Left = 1
        Top = 8
        Width = 181
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyUp = EFArticuloKeyUp
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object BIncrementarCantidad: TFlatButton
        Left = 311
        Top = 8
        Width = 70
        Height = 70
        Hint = '+ Incrementar Cantidad'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BIncrementarCantidadClick
      end
      object BReducirCantidad: TFlatButton
        Left = 311
        Top = 90
        Width = 70
        Height = 70
        Hint = '- Reducir Cantidad'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 2
        OnClick = BReducirCantidadClick
      end
      object BSubir: TFlatButton
        Left = 394
        Top = 8
        Width = 70
        Height = 70
        Hint = 'Linea Anterior'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 3
        OnClick = BSubirClick
      end
      object BBajar: TFlatButton
        Left = 394
        Top = 90
        Width = 70
        Height = 70
        Hint = 'Linea Siguiente'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 4
        OnClick = BBajarClick
      end
      object BEliminarLinea: TFlatButton
        Left = 228
        Top = 50
        Width = 70
        Height = 70
        Hint = 'Supr Eliminar Linea'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 5
        OnClick = BEliminarLineaClick
      end
      object BNuevoTicket: TFlatButton
        Left = 54
        Top = 90
        Width = 70
        Height = 70
        Hint = 'Ctrl + Nuevo Ticket'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 6
        OnClick = BNuevoTicketClick
      end
      object BBuscaArticulo: TFlatButton
        Left = 183
        Top = 8
        Width = 28
        Height = 28
        Hint = 'Nuevo Ticket'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 7
        OnClick = BBuscaArticuloClick
      end
    end
    object DBCG1: TLFDBCtrlGrid
      Left = 0
      Top = 89
      Width = 465
      Height = 467
      Align = alClient
      ColCount = 1
      DataSource = DMTicketVenta.DSQMDetalle
      PanelBorder = gbNone
      PanelHeight = 58
      PanelWidth = 449
      TabOrder = 2
      RowCount = 8
      SelectedColor = clBackground
      OnClick = DBCG1Click
      OnPaintPanel = DBCG1PaintPanel
      object DBTLinea: TDBText
        Left = 0
        Top = 0
        Width = 15
        Height = 58
        Align = alLeft
        DataField = 'LINEA'
        DataSource = DMTicketVenta.DSQMDetalle
      end
      object PNLLinea: TLFPanel
        Left = 15
        Top = 0
        Width = 434
        Height = 58
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object PNLLineaTop: TLFPanel
          Left = 0
          Top = 0
          Width = 434
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          Color = clWindow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object DBTTitulo: TDBText
            Left = 0
            Top = 0
            Width = 434
            Height = 21
            Align = alClient
            DataField = 'TITULO'
            DataSource = DMTicketVenta.DSQMDetalle
          end
        end
        object PNLLineaBottom: TLFPanel
          Left = 0
          Top = 21
          Width = 434
          Height = 37
          Align = alClient
          BevelOuter = bvNone
          Color = clBackground
          TabOrder = 1
          object DBTDescuento: TDBText
            Left = 299
            Top = 0
            Width = 63
            Height = 37
            Align = alRight
            Alignment = taRightJustify
            DataField = 'DESCUENTO'
            DataSource = DMTicketVenta.DSQMDetalle
          end
          object DBTP_IVA: TDBText
            Left = 114
            Top = 0
            Width = 60
            Height = 37
            Align = alRight
            Alignment = taRightJustify
            DataField = 'P_IVA'
            DataSource = DMTicketVenta.DSQMDetalle
          end
          object DBTPrecio: TDBText
            Left = 234
            Top = 0
            Width = 65
            Height = 37
            Align = alRight
            Alignment = taRightJustify
            DataField = 'PRECIO'
            DataSource = DMTicketVenta.DSQMDetalle
          end
          object DBTArticulo: TDBText
            Left = 0
            Top = 0
            Width = 114
            Height = 37
            Align = alClient
            Alignment = taRightJustify
            DataField = 'ARTICULO'
            DataSource = DMTicketVenta.DSQMDetalle
            Transparent = True
          end
          object DBTUnidades: TDBText
            Left = 174
            Top = 0
            Width = 60
            Height = 37
            Align = alRight
            Alignment = taRightJustify
            DataField = 'UNIDADES'
            DataSource = DMTicketVenta.DSQMDetalle
          end
          object DBTTotalLinea: TDBText
            Left = 362
            Top = 0
            Width = 72
            Height = 37
            Align = alRight
            Alignment = taRightJustify
            DataField = 'TOTAL_LINEA'
            DataSource = DMTicketVenta.DSQMDetalle
          end
        end
      end
    end
  end
  object PNLSeleccion: TLFPanel
    Left = 465
    Top = 0
    Width = 803
    Height = 721
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PNLSeleccion'
    TabOrder = 1
    object PNLAcciones: TLFPanel
      Left = 0
      Top = 0
      Width = 82
      Height = 721
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object BCobrar: TFlatButton
        Left = 9
        Top = 8
        Width = 70
        Height = 70
        Hint = 'F5 Cobrar'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 0
        OnClick = BCobrarClick
      end
      object BDatosCliente: TFlatButton
        Left = 8
        Top = 90
        Width = 70
        Height = 70
        Hint = 'F6 Datos Cliente'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BDatosClienteClick
      end
      object BEditarLinea: TFlatButton
        Left = 8
        Top = 172
        Width = 70
        Height = 70
        Hint = 'F7 Editar Linea'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 2
        OnClick = BEditarLineaClick
      end
      object BMuestraTIckets: TFlatButton
        Left = 8
        Top = 254
        Width = 70
        Height = 70
        Hint = 'F8 Mostrar Tickets del Turno'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 3
        OnClick = BMuestraTIcketsClick
      end
      object BCierraTurno: TFlatButton
        Left = 8
        Top = 414
        Width = 70
        Height = 70
        Hint = 'F10 Cerrar Turno'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 5
        OnClick = BCierraTurnoClick
      end
      object BIngresosEgresos: TFlatButton
        Left = 8
        Top = 334
        Width = 70
        Height = 70
        Hint = 'F9 Realizar un ingreso o una retirada o egreso.'
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGray
        ColorShadow = clWhite
        NumGlyphs = 2
        TabOrder = 4
        OnClick = BIngresosEgresosClick
      end
    end
    object PCMain: TLFPageControl
      Left = 82
      Top = 0
      Width = 721
      Height = 721
      ActivePage = TSCobro
      Align = alClient
      OwnerDraw = True
      TabIndex = 3
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSSeleccionArticulo: TTabSheet
        Caption = 'Selecci'#243'n Art'#237'culo'
        OnShow = TSSeleccionArticuloShow
        object PNLSeleccionArticulo: TLFPanel
          Left = 0
          Top = 0
          Width = 713
          Height = 683
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLSeleccionArticuloResize
          object DBCGFamilia: TLFDBCtrlGrid
            Left = 0
            Top = 0
            Width = 113
            Height = 672
            Align = alLeft
            ColCount = 1
            DataSource = DMTicketVenta.DSxFamilia
            PanelBorder = gbNone
            PanelHeight = 42
            PanelWidth = 97
            TabOrder = 0
            RowCount = 16
            SelectedColor = clBlue
            OnClick = DBCGFamiliaClick
            object LIndicadorFamiliaL: TLFLabel
              Left = 0
              Top = 0
              Width = 10
              Height = 42
              Align = alLeft
              AutoSize = False
            end
            object PNLFamilia: TLFPanel
              Left = 10
              Top = 0
              Width = 87
              Height = 42
              Align = alClient
              BevelOuter = bvNone
              Caption = 'PNLFamili'
              TabOrder = 0
              object DBTFamilia: TDBText
                Left = 0
                Top = 1
                Width = 87
                Height = 24
                Align = alTop
                Alignment = taCenter
                Color = clNavy
                DataField = 'FAMILIA'
                DataSource = DMTicketVenta.DSxFamilia
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -21
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                OnClick = DBTFamiliaClick
              end
              object DBTTituloFamilia: TDBText
                Left = 0
                Top = 25
                Width = 87
                Height = 16
                Align = alClient
                Alignment = taCenter
                Color = clSkyBlue
                DataField = 'TITULO'
                DataSource = DMTicketVenta.DSxFamilia
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                WordWrap = True
                OnClick = DBTFamiliaClick
              end
              object LIndicadorFamiliaB: TLFLabel
                Left = 0
                Top = 41
                Width = 87
                Height = 1
                Align = alBottom
                AutoSize = False
                Color = clWhite
                ParentColor = False
              end
              object LIndicadorFamiliaT: TLFLabel
                Left = 0
                Top = 0
                Width = 87
                Height = 1
                Align = alTop
                AutoSize = False
                Color = clWhite
                ParentColor = False
              end
            end
          end
          object PNLSeleccionaArticulos: TLFPanel
            Left = 113
            Top = 0
            Width = 600
            Height = 683
            Align = alClient
            BevelOuter = bvNone
            Caption = 'PNLSeleccionaArticulos'
            TabOrder = 1
            object PNLPosicionArticulo: TLFPanel
              Left = 0
              Top = 0
              Width = 600
              Height = 90
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object BAnterior: TFlatButton
                Left = 3
                Top = 3
                Width = 70
                Height = 70
                Hint = 'Re P'#225'g Anterior'
                ColorFocused = clBtnFace
                ColorDown = clBtnFace
                ColorBorder = clGray
                ColorShadow = clWhite
                NumGlyphs = 2
                TabOrder = 0
                OnClick = BAnteriorClick
              end
              object BSiguiente: TFlatButton
                Left = 82
                Top = 3
                Width = 70
                Height = 70
                Hint = 'Av P'#225'g Siguiente'
                ColorFocused = clBtnFace
                ColorDown = clBtnFace
                ColorBorder = clGray
                ColorShadow = clWhite
                NumGlyphs = 2
                TabOrder = 1
                OnClick = BSiguienteClick
              end
              object CBImagenes: TCheckBox
                Left = 162
                Top = 28
                Width = 241
                Height = 18
                Caption = 'Mostrar Imagenes'
                Checked = True
                State = cbChecked
                TabOrder = 2
                OnClick = CBImagenesClick
              end
            end
            object SBArticulo: TScrollBox
              Left = 0
              Top = 90
              Width = 600
              Height = 593
              Align = alClient
              BevelEdges = []
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 1
            end
            object SBSubfamilia: TScrollBox
              Left = 0
              Top = 90
              Width = 600
              Height = 593
              Align = alClient
              BevelEdges = []
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 2
            end
          end
        end
      end
      object TSCliente: TTabSheet
        Caption = 'Cliente'
        ImageIndex = 1
        OnShow = TSClienteShow
        object PNLCabeceraCliente: TLFPanel
          Left = 0
          Top = 0
          Width = 713
          Height = 90
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLCabeceraClienteResize
          object BOkCliente: TFlatButton
            Left = 3
            Top = 3
            Width = 70
            Height = 70
            Hint = 'F2 Confirmar Cambios'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 0
            OnClick = BOkClienteClick
          end
          object BCancelarCliente: TFlatButton
            Left = 557
            Top = 3
            Width = 70
            Height = 70
            Hint = 'ESC Cancelar Cambios'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 1
            OnClick = BCancelarClienteClick
          end
        end
        object PNLDetalleCliente: TPanel
          Left = 0
          Top = 90
          Width = 713
          Height = 593
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          OnResize = PNLDetalleClienteResize
          DesignSize = (
            713
            593)
          object LNIF: TLFLabel
            Left = 41
            Top = 81
            Width = 25
            Height = 23
            Alignment = taRightJustify
            Caption = 'CIF'
          end
          object LAgente: TLFLabel
            Left = 13
            Top = 295
            Width = 54
            Height = 23
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LCarnetAplicador: TLFLabel
            Left = 18
            Top = 241
            Width = 97
            Height = 23
            Alignment = taRightJustify
            Caption = 'Carnet Aplic.'
          end
          object LCliente: TLFLabel
            Left = 16
            Top = 7
            Width = 52
            Height = 23
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LDescripcionCliente: TLFLabel
            Left = 25
            Top = 201
            Width = 90
            Height = 23
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LDescuentoCliente: TLFLabel
            Left = 15
            Top = 160
            Width = 100
            Height = 23
            Alignment = taRightJustify
            Caption = '% Descuento'
          end
          object LNombreComercialTercero: TLFLabel
            Left = 6
            Top = 113
            Width = 61
            Height = 23
            Hint = 'Nombre Comercial'
            Alignment = taRightJustify
            Caption = 'N. Com.'
          end
          object LNombreComercialCliente: TLFLabel
            Left = 6
            Top = 41
            Width = 61
            Height = 23
            Hint = 'Nombre Comercial'
            Alignment = taRightJustify
            Caption = 'N. Com.'
          end
          object LCategoria: TLFLabel
            Left = 20
            Top = 329
            Width = 48
            Height = 23
            Alignment = taRightJustify
            Caption = 'Categ.'
          end
          object BCreaTercero: TFlatButton
            Left = 559
            Top = 74
            Width = 70
            Height = 70
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 6
            OnClick = BCreaTerceroClick
          end
          object EAgente: TLFEdit
            Left = 171
            Top = 291
            Width = 533
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 11
          end
          object ECarnetAplicador: TLFEdit
            Left = 120
            Top = 237
            Width = 310
            Height = 31
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 9
          end
          object ECliente: TLFEdit
            Left = 171
            Top = 3
            Width = 533
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
          object EDescripcionCabecera: TLFEdit
            Left = 120
            Top = 197
            Width = 584
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
          object EDescuentoComercial: TLFEdit
            Left = 120
            Top = 156
            Width = 108
            Height = 31
            TabOrder = 7
          end
          object EFAgente: TLFEditFind2000
            Left = 72
            Top = 291
            Width = 97
            Height = 31
            TabOrder = 10
            OnChange = EFAgenteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGENTE_USUARIO'
            CampoStr = 'TITULO_AGENTE_USUARIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGENTES_USUARIOS_CAJAS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFAgenteBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFCliente: TLFEditFind2000
            Left = 72
            Top = 3
            Width = 97
            Height = 31
            TabOrder = 0
            OnChange = EFClienteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'NOMBRE_COMERCIAL')
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ENIF: TLFEdit
            Left = 72
            Top = 77
            Width = 161
            Height = 31
            TabOrder = 3
            OnChange = ENIFChange
          end
          object ETituloTercero: TLFEdit
            Left = 235
            Top = 77
            Width = 378
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 4
          end
          object ENombreComercial: TLFEdit
            Left = 72
            Top = 36
            Width = 632
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 2
          end
          object ENombreComercialTercero: TLFEdit
            Left = 72
            Top = 110
            Width = 541
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 5
          end
          object ETituloCategoria: TLFEdit
            Left = 171
            Top = 324
            Width = 533
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 13
          end
          object ECategoria: TLFEdit
            Left = 72
            Top = 324
            Width = 97
            Height = 31
            Color = clInfoBk
            Enabled = False
            TabOrder = 12
            OnChange = ECategoriaChange
          end
        end
      end
      object TSLinea: TTabSheet
        Caption = 'L'#237'nea'
        ImageIndex = 2
        OnShow = TSLineaShow
        object PNLCabeceraLinea: TLFPanel
          Left = 0
          Top = 0
          Width = 713
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLCabeceraLineaResize
          object BOkLinea: TFlatButton
            Left = 3
            Top = 3
            Width = 70
            Height = 70
            Hint = 'F2 Confirmar Cambios'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 0
            OnClick = BOkLineaClick
          end
          object BCancelarLinea: TFlatButton
            Left = 557
            Top = 3
            Width = 70
            Height = 70
            Hint = 'ESC Cancelar Cambios'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 2
            OnClick = BCancelarLineaClick
          end
          object BInfoStock: TFlatButton
            Left = 83
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Ctrl S Informaci'#243'n del stock del art'#237'culo'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BInfoStockClick
          end
        end
        object PNLDetalleLinea: TLFPanel
          Left = 0
          Top = 81
          Width = 713
          Height = 144
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            713
            144)
          object LUnidades: TLFLabel
            Left = 2
            Top = 44
            Width = 72
            Height = 23
            Caption = 'Unidades'
          end
          object LArticuloLinea: TLFLabel
            Left = 2
            Top = -4
            Width = 60
            Height = 23
            Caption = 'Art'#237'culo'
          end
          object LDescuento: TLFLabel
            Left = 216
            Top = 44
            Width = 51
            Height = 23
            Caption = '% Dto.'
          end
          object LPrecio: TLFLabel
            Left = 109
            Top = 44
            Width = 48
            Height = 23
            Caption = 'Precio'
          end
          object LPrecioCoste: TLFLabel
            Left = 303
            Top = 44
            Width = 95
            Height = 23
            Caption = 'Precio Coste'
          end
          object LMargen: TLFLabel
            Left = 410
            Top = 44
            Width = 78
            Height = 23
            Caption = '% M'#225'rgen'
          end
          object LMargenBruto: TLFLabel
            Left = 497
            Top = 44
            Width = 70
            Height = 23
            Caption = 'Beneficio'
          end
          object LCodigoDeBarras: TLFLabel
            Left = 2
            Top = 91
            Width = 130
            Height = 23
            Caption = 'C'#243'digo de Barras'
          end
          object LTipoIva: TLFLabel
            Left = 302
            Top = 92
            Width = 65
            Height = 23
            Caption = 'Tipo IVA'
          end
          object LSimboloPociento: TLFLabel
            Left = 412
            Top = 116
            Width = 14
            Height = 23
            Caption = '%'
          end
          object EDescuento: TLFEdit
            Left = 216
            Top = 64
            Width = 80
            Height = 31
            TabOrder = 4
            OnChange = EDescuentoChange
            OnEnter = EDescuentoEnter
          end
          object EFArticuloLinea: TLFEditFind2000
            Left = 2
            Top = 16
            Width = 181
            Height = 31
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 0
            OnChange = EFArticuloLineaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EPrecio: TLFEdit
            Left = 109
            Top = 64
            Width = 100
            Height = 31
            TabOrder = 3
            OnChange = EPrecioChange
            OnEnter = EPrecioEnter
          end
          object ETituloArticuloLinea: TLFEdit
            Left = 190
            Top = 16
            Width = 516
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object EUnidades: TLFEdit
            Left = 2
            Top = 64
            Width = 100
            Height = 31
            TabOrder = 2
            OnChange = EUnidadesChange
            OnEnter = EUnidadesEnter
          end
          object EPrecioCoste: TLFEdit
            Left = 303
            Top = 64
            Width = 100
            Height = 31
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 5
            OnChange = EPrecioCosteChange
            OnEnter = EPrecioEnter
          end
          object EMargen: TLFEdit
            Left = 410
            Top = 64
            Width = 80
            Height = 31
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 6
            OnEnter = EPrecioEnter
          end
          object EMargenBruto: TLFEdit
            Left = 497
            Top = 64
            Width = 100
            Height = 31
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 7
            OnChange = EPrecioCosteChange
            OnEnter = EPrecioEnter
          end
          object ECodigoBarras: TLFEdit
            Left = 2
            Top = 113
            Width = 295
            Height = 31
            TabOrder = 8
          end
          object EFTipoIva: TLFEditFind2000
            Left = 304
            Top = 113
            Width = 60
            Height = 31
            TabOrder = 9
            Text = 'EFTipoIva'
            OnChange = EFTipoIvaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoADevolver = 'TIPO'
            CampoNum = 'P_IVA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'SYS_TIPO_IVA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'P_IVA DESC, TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETipoIva: TLFEdit
            Left = 368
            Top = 113
            Width = 41
            Height = 31
            Color = clInfoBk
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
        end
        object PNLImagen: TLFPanel
          Left = 0
          Top = 529
          Width = 713
          Height = 154
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object Imagen: TImage
            Left = 0
            Top = 0
            Width = 713
            Height = 154
            Align = alClient
            AutoSize = True
            Center = True
            IncrementalDisplay = True
            Proportional = True
            Stretch = True
          end
        end
        object PNLRegFitosanitario: TLFPanel
          Left = 0
          Top = 225
          Width = 713
          Height = 304
          Align = alTop
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          DesignSize = (
            713
            304)
          object LRegistroFitosanitario: TLFLabel
            Left = 0
            Top = 0
            Width = 713
            Height = 25
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Registro Fitosanitartio'
          end
          object LFitosanitarioNombre: TLFLabel
            Left = 2
            Top = 92
            Width = 63
            Height = 23
            Caption = 'Nombre'
          end
          object LFitosanitarioNIF: TLFLabel
            Left = 532
            Top = 92
            Width = 27
            Height = 23
            Anchors = [akTop, akRight]
            Caption = 'NIF'
          end
          object LFitosanitarioDireccion: TLFLabel
            Left = 2
            Top = 140
            Width = 72
            Height = 23
            Caption = 'Direcci'#243'n'
          end
          object LFitosanitarioCodigoPostal: TLFLabel
            Left = 2
            Top = 188
            Width = 86
            Height = 23
            Caption = 'C'#243'd. Postal'
          end
          object LFitosanitarioTelefono: TLFLabel
            Left = 2
            Top = 236
            Width = 67
            Height = 23
            Caption = 'Tel'#233'fono'
          end
          object LFitosanitarioCarnetAplicador: TLFLabel
            Left = 256
            Top = 236
            Width = 128
            Height = 23
            Caption = 'Carnet Aplicador'
          end
          object LFitosanitarioLocalidad: TLFLabel
            Left = 114
            Top = 188
            Width = 72
            Height = 23
            Caption = 'Localidad'
          end
          object BBuscaTercero: TFlatButton
            Left = 3
            Top = 23
            Width = 70
            Height = 70
            Hint = 'Datos Tercero'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 7
            OnClick = BBuscaTerceroClick
          end
          object ERegFitoNombre: TLFEdit
            Left = 2
            Top = 112
            Width = 526
            Height = 31
            Hint = 'Nombre'
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 40
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object ERegFitoNIF: TLFEdit
            Left = 533
            Top = 112
            Width = 172
            Height = 31
            Hint = 'NIF'
            Anchors = [akTop, akRight]
            MaxLength = 20
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object ERegFitoDireccion: TLFEdit
            Left = 2
            Top = 160
            Width = 702
            Height = 31
            Hint = 'Direcci'#243'n'
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 40
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object ERegFitoCP: TLFEdit
            Left = 2
            Top = 208
            Width = 106
            Height = 31
            Hint = 'C'#243'digo Postal'
            MaxLength = 10
            TabOrder = 3
          end
          object ERegFitoLocalidad: TLFEdit
            Left = 114
            Top = 208
            Width = 590
            Height = 31
            Hint = 'Nombre de la Localidad'
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 40
            TabOrder = 4
          end
          object ERegCarnetAplicador: TLFEdit
            Left = 256
            Top = 258
            Width = 448
            Height = 31
            Hint = 'Carnet de Aplicador'
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 20
            TabOrder = 6
          end
          object EFBuscaNIF: TLFEditFind2000
            Left = 532
            Top = 113
            Width = 17
            Height = 31
            Anchors = [akTop, akRight]
            TabOrder = 9
            Visible = False
            OnChange = EFBuscaNIFChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'NIF'
              'DIR_TELEFONO01')
            CampoADevolver = 'TERCERO'
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            CondicionBusqueda = 'TERCERO > 0'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_TERCEROS_DIRECCION'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'NOMBRE_R_SOCIAL')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object BRegistroFitosanitario: TFlatButton
            Left = 83
            Top = 23
            Width = 70
            Height = 70
            Hint = 'Rellena datos de registro Fitosanitario'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = BRegistroFitosanitarioClick
          end
          object ERegTelefono: TLFEdit
            Left = 2
            Top = 258
            Width = 247
            Height = 31
            Hint = 'Tel'#233'fono'
            MaxLength = 15
            TabOrder = 5
          end
        end
      end
      object TSCobro: TTabSheet
        Caption = 'Cobro'
        ImageIndex = 3
        OnShow = TSCobroShow
        object PNLCabeceraCobro: TLFPanel
          Left = 0
          Top = 0
          Width = 713
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLCabeceraCobroResize
          object BOkCobro: TFlatButton
            Left = 11
            Top = 3
            Width = 70
            Height = 70
            Hint = 'F2 Cobrar Ticket'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 0
            OnClick = BOkCobroClick
          end
          object BCancelarCobro: TFlatButton
            Left = 629
            Top = 3
            Width = 70
            Height = 70
            Hint = 'ESC Cancelar Cobro'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 8
            OnClick = BCancelarCobroClick
          end
          object BImprimirTicket: TFlatButton
            Left = 83
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Ctrl+I Imprimir Ticket'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 1
            OnClick = BImprimirTicketClick
          end
          object BCobrarTicketSinImprimir: TFlatButton
            Left = 163
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Ctrl O Cobrar Ticket sin Imprimir Ticket'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 2
            OnClick = BCobrarTicketSinImprimirClick
          end
          object BImprimeRecibo: TFlatButton
            Left = 323
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Recibo'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 4
            OnClick = BImprimeReciboClick
          end
          object BAbrirCaja: TFlatButton
            Left = 243
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Ctrl A Abrir Caja'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 3
            OnClick = BAbrirCajaClick
          end
          object BCrearNuevoAlCobrar: TFlatButton
            Left = 552
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Ctrl + Nuevo ticket'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 7
            OnClick = BNuevoTicketClick
          end
          object BFacturar: TFlatButton
            Left = 476
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Recibo'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 6
            OnClick = BFacturarClick
          end
          object BAlbaranar: TFlatButton
            Left = 400
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Genera Albaran'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 5
            OnClick = BAlbaranarClick
          end
        end
        object PNLFormasPago: TLFPanel
          Left = 0
          Top = 81
          Width = 713
          Height = 80
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
        end
        object PNLFormaPago: TLFPanel
          Left = 0
          Top = 161
          Width = 713
          Height = 168
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            713
            168)
          object LFormaPago: TLFLabel
            Left = 0
            Top = 25
            Width = 48
            Height = 37
            Alignment = taCenter
            AutoSize = False
            Caption = 'CON'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LImporteFormaPago: TLFLabel
            Left = 51
            Top = 0
            Width = 63
            Height = 23
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LADevolver: TLFLabel
            Left = 237
            Top = 0
            Width = 84
            Height = 23
            Caption = 'A Devolver'
          end
          object LAgenteCobro: TLFLabel
            Left = 19
            Top = 95
            Width = 54
            Height = 23
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LEmail: TLFLabel
            Left = 17
            Top = 132
            Width = 56
            Height = 23
            Alignment = taRightJustify
            Caption = 'E-MAIL'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object BOkFormaPago: TFlatButton
            Left = 164
            Top = 8
            Width = 70
            Height = 70
            Hint = 'Ctrl F Aceptar Forma de Pago'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 0
            OnClick = BOkFormaPagoClick
          end
          object EImporteFormaPago: TLFEdit
            Left = 51
            Top = 25
            Width = 111
            Height = 37
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            Text = '0'
            OnKeyUp = EImporteFormaPagoKeyUp
          end
          object EADevolver: TLFEdit
            Left = 237
            Top = 25
            Width = 99
            Height = 37
            TabStop = False
            Color = clInfoBk
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = '0'
            OnChange = EADevolverChange
            OnKeyUp = EImporteFormaPagoKeyUp
          end
          object CBMoneda: TCheckBox
            Left = 51
            Top = 62
            Width = 111
            Height = 17
            Caption = 'D'#243'lares'
            TabOrder = 3
            OnClick = CBMonedaClick
          end
          object EFAgenteCobro: TLFEditFind2000
            Left = 77
            Top = 88
            Width = 57
            Height = 31
            TabOrder = 4
            OnChange = EFAgenteCobroChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGENTE_USUARIO'
            CampoStr = 'TITULO_AGENTE_USUARIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGENTES_USUARIOS_CAJAS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFAgenteBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EAgenteCobro: TLFEdit
            Left = 135
            Top = 88
            Width = 446
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 5
          end
          object EEmail: TLFEdit
            Left = 77
            Top = 126
            Width = 504
            Height = 37
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object BEnviaEmail: TButton
            Left = 591
            Top = 127
            Width = 114
            Height = 37
            Anchors = [akTop, akRight]
            Caption = 'Envia E-mail'
            TabOrder = 7
            OnClick = BEnviaEmailClick
          end
          object BSafeMoney: TFlatButton
            Left = 558
            Top = 8
            Width = 70
            Height = 70
            Hint = 'Cobrar mediante cajon SafeMoney'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            Caption = 'SafeMoney'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 8
            OnClick = BSafeMoneyClick
          end
          object BSonido: TFlatButton
            Left = 478
            Top = 8
            Width = 70
            Height = 70
            Hint = 'Sonido'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            Caption = 'Sonido'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 9
            OnClick = BSonidoClick
          end
        end
        object PNLTotalFormasPago: TLFPanel
          Left = 0
          Top = 329
          Width = 713
          Height = 354
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object DBGTotalFormaPago: THYTDBGrid
            Left = 0
            Top = 0
            Width = 713
            Height = 354
            Align = alClient
            DataSource = DMTicketVenta.DSxTicketFormaPago
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -27
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'FORMA_PAGO'
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 192
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_ENTREGADO'
                Width = 182
                Visible = True
              end>
          end
        end
      end
      object TSTickets: TTabSheet
        Caption = 'Tickets'
        ImageIndex = 4
        OnShow = TSTicketsShow
        object PCabeceraTicket: TLFPanel
          Left = 0
          Top = 0
          Width = 713
          Height = 90
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PCabeceraTicketResize
          object BOkTicket: TFlatButton
            Left = 3
            Top = 3
            Width = 70
            Height = 70
            Hint = 'F2 Ir a Ticket'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 0
            OnClick = BOkTicketClick
          end
          object BCancelarTicket: TFlatButton
            Left = 557
            Top = 3
            Width = 70
            Height = 70
            Hint = 'ESC Cancelar Seleccion'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 5
            OnClick = BCancelarTicketClick
          end
          object BAnteriorTicket: TFlatButton
            Left = 83
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Anterior'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 1
            OnClick = BAnteriorTicketClick
          end
          object BSiguienteTicket: TFlatButton
            Left = 163
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Siguiente'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 2
            OnClick = BSiguienteTicketClick
          end
          object BNuevoTicket2: TFlatButton
            Left = 243
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Ctrl + Nuevo Ticket'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 3
            OnClick = BNuevoTicketClick
          end
          object BAnularTicket: TFlatButton
            Left = 323
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Anular el ticket seleccionado'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 4
            OnClick = BAnularTicketClick
          end
        end
        object PCuerpoTickets: TLFPanel
          Left = 0
          Top = 90
          Width = 713
          Height = 552
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGTickets: THYTDBGrid
            Left = 0
            Top = 0
            Width = 713
            Height = 552
            Align = alClient
            DataSource = DMTicketVenta.DSTickets
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -16
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = DBGTicketsDrawColumnCell
            OnKeyUp = DBGTicketsKeyUp
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'RIT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LIQUIDO'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_ESTADO'
                Width = 205
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLIENTE'
                Width = 61
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE_R_SOCIAL'
                Width = 400
                Visible = True
              end>
          end
        end
        object PNLTicketsTotales: TLFPanel
          Left = 0
          Top = 642
          Width = 713
          Height = 41
          Align = alBottom
          TabOrder = 2
          object LTotalLiquido: TLFLabel
            Left = 230
            Top = 8
            Width = 56
            Height = 23
            Caption = 'L'#237'quido'
          end
          object LCantidadTickets: TLFLabel
            Left = 24
            Top = 8
            Width = 53
            Height = 23
            Caption = 'Tickets'
          end
          object LPromedio: TLFLabel
            Left = 437
            Top = 8
            Width = 75
            Height = 23
            Caption = 'Promedio'
          end
          object ECantidadTickets: TLFEdit
            Left = 83
            Top = 4
            Width = 121
            Height = 31
            Color = clInfoBk
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object ETotalLiquido: TLFEdit
            Left = 293
            Top = 4
            Width = 121
            Height = 31
            Color = clInfoBk
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
          object EPromedio: TLFEdit
            Left = 516
            Top = 4
            Width = 121
            Height = 31
            Color = clInfoBk
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = '0'
          end
        end
      end
      object TSIngresosEgresos: TTabSheet
        Caption = 'Ing / Egr'
        ImageIndex = 6
        OnExit = TSIngresosEgresosExit
        OnShow = TSIngresosEgresosShow
        object PnlIngCabecera: TLFPanel
          Left = 0
          Top = 0
          Width = 713
          Height = 90
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PnlIngCabeceraResize
          object BOKIngresoEgreso: TFlatButton
            Left = 3
            Top = 3
            Width = 70
            Height = 70
            Hint = 'F2 Crear Movimiento'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 0
            OnClick = BOKIngresoEgresoClick
          end
          object BCancelarIngresoEgreso: TFlatButton
            Left = 557
            Top = 3
            Width = 70
            Height = 70
            Hint = 'ESC Cancelar movimiento'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 1
            OnClick = BCancelarIngresoEgresoClick
          end
          object BImprimirIngEgr: TFlatButton
            Left = 83
            Top = 3
            Width = 70
            Height = 70
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 2
            OnClick = BImprimirIngEgrClick
          end
        end
        object PnlIngCuerpo: TLFPanel
          Left = 0
          Top = 90
          Width = 713
          Height = 270
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            713
            270)
          object LTipoMov: TLFLabel
            Left = 4
            Top = 45
            Width = 130
            Height = 23
            Caption = 'Tipo Movimiento'
          end
          object LDescripcion: TLFLabel
            Left = 4
            Top = 124
            Width = 90
            Height = 23
            Caption = 'Descripci'#243'n'
          end
          object LNota: TLFLabel
            Left = 57
            Top = 164
            Width = 37
            Height = 23
            Caption = 'Nota'
          end
          object LImporte: TLFLabel
            Left = 71
            Top = 84
            Width = 63
            Height = 23
            Caption = 'Importe'
          end
          object BNuevoIngresoRetirada: TFlatButton
            Left = 292
            Top = 40
            Width = 70
            Height = 70
            Hint = 'Ctrl + Nuevo Ingreso/Egreso'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 0
            OnClick = BNuevoIngresoRetiradaClick
          end
          object BEliminarIngresoRetirada: TFlatButton
            Left = 372
            Top = 40
            Width = 70
            Height = 70
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 1
            Visible = False
            OnClick = BEliminarIngresoRetiradaClick
          end
          object CBTipoMov: TLFComboBox
            Left = 140
            Top = 40
            Width = 145
            Height = 31
            ItemHeight = 23
            ItemIndex = 0
            TabOrder = 2
            Text = 'Ingreso'
            Items.Strings = (
              'Ingreso'
              'Egreso')
          end
          object EImporte: TLFEdit
            Left = 140
            Top = 80
            Width = 145
            Height = 31
            TabOrder = 3
          end
          object EDescripcion: TLFEdit
            Left = 100
            Top = 120
            Width = 603
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object MNota: TLFMemo
            Left = 100
            Top = 160
            Width = 603
            Height = 89
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
        end
        object PnlIngPie: TLFPanel
          Left = 0
          Top = 360
          Width = 713
          Height = 323
          Align = alBottom
          TabOrder = 2
          object DBGIngresosEgresos: TDBGrid
            Left = 1
            Top = 1
            Width = 711
            Height = 321
            Align = alClient
            Color = clInfoBk
            DataSource = DMTicketVenta.DSQMIngresosEgresos
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -19
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_TIPO_MOVIEMIENTO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMPORTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Width = 310
                Visible = True
              end>
          end
        end
      end
      object TSCierre: TTabSheet
        Caption = 'Cierre'
        ImageIndex = 5
        OnShow = TSCierreShow
        object PNLCabeceraCierre: TLFPanel
          Left = 0
          Top = 0
          Width = 713
          Height = 90
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLCabeceraCierreResize
          object LCierre: TLFLabel
            Left = 232
            Top = 8
            Width = 46
            Height = 23
            Caption = 'Cierre'
          end
          object LTotalVentas: TLFLabel
            Left = 232
            Top = 40
            Width = 93
            Height = 23
            Caption = 'Total ventas'
          end
          object BOKCierre: TFlatButton
            Left = 3
            Top = 3
            Width = 70
            Height = 70
            Hint = 'F2 Cerrar Turno'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 0
            OnClick = BOKCierreClick
          end
          object BCancelCierre: TFlatButton
            Left = 557
            Top = 3
            Width = 70
            Height = 70
            Hint = 'ESC Cancelar Cierre de Turno'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            TabOrder = 2
            OnClick = BCancelCierreClick
          end
          object BImprimirArqueo: TFlatButton
            Left = 83
            Top = 3
            Width = 70
            Height = 70
            Hint = 'Imprimir Arqueo'
            ColorFocused = clBtnFace
            ColorDown = clBtnFace
            ColorBorder = clGray
            ColorShadow = clWhite
            NumGlyphs = 2
            TabOrder = 1
            OnClick = BImprimirArqueoClick
          end
        end
        object PDetalleCierre: TLFPanel
          Left = 0
          Top = 90
          Width = 713
          Height = 593
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object PNLDatosUsuarioCierre: TLFPanel
            Left = 0
            Top = 0
            Width = 713
            Height = 147
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LUsuarioCierre: TLFLabel
              Left = 134
              Top = 11
              Width = 60
              Height = 23
              Alignment = taRightJustify
              Caption = 'Usuario'
            end
            object LApertura: TLFLabel
              Left = 124
              Top = 107
              Width = 69
              Height = 23
              Alignment = taRightJustify
              Caption = 'Apertura'
            end
            object LSerieCierre: TLFLabel
              Left = 156
              Top = 43
              Width = 38
              Height = 23
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LSesionCierre: TLFLabel
              Left = 143
              Top = 75
              Width = 50
              Height = 23
              Alignment = taRightJustify
              Caption = 'Sesi'#243'n'
            end
            object LCajaCierre: TLFLabel
              Left = 289
              Top = 75
              Width = 33
              Height = 23
              Alignment = taRightJustify
              Caption = 'Caja'
            end
            object LTurnoCierre: TLFLabel
              Left = 403
              Top = 75
              Width = 46
              Height = 23
              Alignment = taRightJustify
              Caption = 'Turno'
            end
            object LExistenTicketsAbiertos: TLFLabel
              Left = 328
              Top = 107
              Width = 192
              Height = 23
              Caption = #161'Existen Tickets Abiertos!'
              Color = clRed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object ETituloUsuarioCierre: TLFEdit
              Left = 260
              Top = 8
              Width = 254
              Height = 31
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 6
            end
            object ETituloSerieCierre: TLFEdit
              Left = 260
              Top = 40
              Width = 254
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 7
            end
            object DEApartura: TLFDateEdit
              Left = 200
              Top = 104
              Width = 120
              Height = 31
              CheckOnExit = True
              Color = clInfoBk
              Enabled = False
              NumGlyphs = 2
              TabOrder = 5
            end
            object EUsuarioCierre: TLFEdit
              Left = 200
              Top = 8
              Width = 59
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 0
              OnChange = EUsuarioCierreChange
            end
            object ESerieCierre: TLFEdit
              Left = 200
              Top = 40
              Width = 59
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
              OnChange = ESerieCierreChange
            end
            object ECajaCierre: TLFEdit
              Left = 328
              Top = 72
              Width = 59
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 3
            end
            object ESesionCierre: TLFEdit
              Left = 200
              Top = 72
              Width = 59
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 2
            end
            object ETurnoCierre: TLFEdit
              Left = 455
              Top = 72
              Width = 59
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 4
            end
          end
          object PNLDatosCierre: TLFPanel
            Left = 0
            Top = 147
            Width = 713
            Height = 238
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LSaldoInicialCierre: TLFLabel
              Left = 105
              Top = 11
              Width = 89
              Height = 23
              Alignment = taRightJustify
              Caption = 'Saldo inicial'
            end
            object LVentasEfectivo: TLFLabel
              Left = 76
              Top = 45
              Width = 118
              Height = 23
              Alignment = taRightJustify
              Caption = 'Ventas efectivo'
            end
            object LRetiradoTurno: TLFLabel
              Left = 82
              Top = 165
              Width = 112
              Height = 23
              Alignment = taRightJustify
              Caption = 'Retirado turno'
            end
            object LCambioSiguienteTurno: TLFLabel
              Left = 16
              Top = 197
              Width = 178
              Height = 23
              Alignment = taRightJustify
              Caption = 'Cambio siguiente turno'
            end
            object LTotalVentasTurno: TLFLabel
              Left = 449
              Top = 85
              Width = 95
              Height = 23
              Alignment = taRightJustify
              Caption = 'Total Ventas'
            end
            object LSaldoIngresoEgreso: TLFLabel
              Left = 84
              Top = 79
              Width = 111
              Height = 23
              Caption = 'Saldo Ing / Egr'
            end
            object LTotalEfectivo: TLFLabel
              Left = 88
              Top = 114
              Width = 103
              Height = 23
              Caption = 'Total Efectivo'
            end
            object ESaldoInicial: TLFEdit
              Left = 200
              Top = 8
              Width = 150
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 0
            end
            object EVentasEfectivo: TLFEdit
              Left = 200
              Top = 42
              Width = 150
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
            end
            object ERetirtadoTurno: TLFEdit
              Left = 200
              Top = 162
              Width = 150
              Height = 31
              TabOrder = 4
              OnEnter = ERetirtadoTurnoEnter
            end
            object ECambioSiguienteTurno: TLFEdit
              Left = 200
              Top = 194
              Width = 150
              Height = 31
              TabOrder = 5
              OnEnter = ECambioSiguienteTurnoEnter
            end
            object ETotalVentasTurno: TLFEdit
              Left = 448
              Top = 110
              Width = 150
              Height = 31
              Color = clInfoBk
              Enabled = False
              TabOrder = 6
            end
            object ESaldoIngresoEgreso: TLFEdit
              Left = 200
              Top = 76
              Width = 150
              Height = 31
              Color = clInfoBk
              ReadOnly = True
              TabOrder = 2
            end
            object ETotalEfectivo: TLFEdit
              Left = 200
              Top = 110
              Width = 150
              Height = 31
              Color = clInfoBk
              ReadOnly = True
              TabOrder = 3
            end
          end
          object PDatosFormasPago: TLFPanel
            Left = 0
            Top = 385
            Width = 713
            Height = 208
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object DBGFormaPagoCierre: TDBGrid
              Left = 0
              Top = 0
              Width = 713
              Height = 208
              Align = alClient
              DataSource = DMTicketVenta.DSTurnoFP
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -19
              TitleFont.Name = 'Calibri'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TITULO_FP'
                  Width = 445
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOTAL_COBRADO'
                  Width = 142
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  object PNLSeleccionCaja: TLFPanel
    Left = 32
    Top = 144
    Width = 377
    Height = 241
    TabOrder = 2
    object LSeleccionCaja: TLabel
      Left = 1
      Top = 1
      Width = 375
      Height = 23
      Align = alTop
      Caption = 'Seleccione Caja'
    end
  end
  object ALTicket: TActionList
    Left = 184
    Top = 264
    object AAsignaCliente: TAction
      OnExecute = AAsignaClienteExecute
    end
    object AFocoArticulo: TAction
      Caption = 'AFocoArticulo'
      ShortCut = 113
      OnExecute = AFocoArticuloExecute
    end
    object ACobrar: TAction
      Caption = 'ACobrar'
      ShortCut = 116
      OnExecute = ACobrarExecute
    end
    object ADatosCliente: TAction
      Caption = 'ADatosCliente'
      ShortCut = 117
      OnExecute = ADatosClienteExecute
    end
    object AEditarLinea: TAction
      Caption = 'AEditarLinea'
      ShortCut = 118
      OnExecute = AEditarLineaExecute
    end
    object AMuestraTickets: TAction
      Caption = 'AMuestraTickets'
      ShortCut = 119
      OnExecute = AMuestraTicketsExecute
    end
    object AIngresoEgreso: TAction
      Caption = 'AIngresoEgreso'
      ShortCut = 120
      OnExecute = AIngresoEgresoExecute
    end
    object ACierraTurno: TAction
      Caption = 'ACierraTurno'
      ShortCut = 121
      OnExecute = ACierraTurnoExecute
    end
  end
  object tmrSafemoney: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrSafemoneyTimer
    Left = 32
    Top = 8
  end
end
