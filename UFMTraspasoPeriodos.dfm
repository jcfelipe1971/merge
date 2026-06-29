inherited FMTraspasoPeriodos: TFMTraspasoPeriodos
  Left = 454
  Top = 378
  HelpContext = 155
  Caption = 'Traspaso de Ejercicios'
  ClientHeight = 424
  ClientWidth = 592
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 400
    inherited TBMain: TLFToolBar
      Width = 588
      ButtonWidth = 33
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 588
      Height = 370
      ActivePage = TSOtrosTraspasos
      Align = alClient
      OwnerDraw = True
      TabIndex = 3
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TBTrasConPeriodos: TTabSheet
        Caption = '&Traspaso Condiciones Periodos'
        object LBEjercicioOrigen: TLFLabel
          Left = 109
          Top = 12
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ejercicio Origen:'
        end
        object LBEjercicioDestino: TLFLabel
          Left = 352
          Top = 12
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ejercicio Destino:'
        end
        object LBCanalOrigen: TLFLabel
          Left = 122
          Top = 35
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal Origen:'
        end
        object LBCanalDestino: TLFLabel
          Left = 365
          Top = 35
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal Destino:'
        end
        object AniTempo2: TAnimate
          Left = 239
          Top = 136
          Width = 16
          Height = 16
          Active = False
          CommonAVI = aviFindComputer
          StopFrame = 8
          Visible = False
        end
        object EFEjeOrigen: TLFEditFind2000
          Left = 195
          Top = 8
          Width = 125
          Height = 21
          TabOrder = 0
          OnExit = EFEjeOrigenExit
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EJERCICIO'
          CampoStr = 'EJERCICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_CANALES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EJERCICIO')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFEjeDestino: TLFEditFind2000
          Left = 445
          Top = 8
          Width = 125
          Height = 21
          TabOrder = 1
          OnExit = EFEjeDestinoExit
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EJERCICIO'
          CampoStr = 'EJERCICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_CANALES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EJERCICIO')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCanalOrigen: TLFEditFind2000
          Left = 195
          Top = 32
          Width = 125
          Height = 21
          Enabled = False
          TabOrder = 2
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'CANAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_CANALES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFCanalOrigenBusqueda
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCanalDestino: TLFEditFind2000
          Left = 445
          Top = 32
          Width = 125
          Height = 21
          Enabled = False
          TabOrder = 3
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'CANAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_CANALES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object BTTraspasar: TBitBtn
          Left = 8
          Top = 0
          Width = 26
          Height = 26
          Action = ATraspasar
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object BTSeleccionarTodo: TBitBtn
          Left = 34
          Top = 0
          Width = 26
          Height = 26
          Action = ASeleccionarTodo
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object BTLimpiarOpciones: TBitBtn
          Left = 60
          Top = 0
          Width = 26
          Height = 26
          Action = ALimpiarTodo
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object PNLCondEsp: TLFPanel
          Left = 0
          Top = 64
          Width = 265
          Height = 280
          BevelOuter = bvNone
          TabOrder = 4
          object CBCondCliArt: TLFCheckBox
            Left = 8
            Top = 34
            Width = 253
            Height = 17
            Caption = 'Condiciones Cliente - Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgrupArt: TLFCheckBox
            Left = 8
            Top = 58
            Width = 253
            Height = 17
            Caption = 'Condiciones Agrupaci'#243'n - Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondPerArt: TLFCheckBox
            Left = 8
            Top = 82
            Width = 253
            Height = 17
            Caption = 'Condiciones Perfil - Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondArt: TLFCheckBox
            Left = 8
            Top = 106
            Width = 253
            Height = 17
            Caption = 'Condiciones Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondCliFam: TLFCheckBox
            Left = 8
            Top = 130
            Width = 253
            Height = 17
            Caption = 'Condiciones Cliente - Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgrupFam: TLFCheckBox
            Left = 8
            Top = 155
            Width = 253
            Height = 17
            Caption = 'Condiciones Agrupaci'#243'n - Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondPerFam: TLFCheckBox
            Left = 8
            Top = 179
            Width = 253
            Height = 17
            Caption = 'Condiciones Perfil - Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondFam: TLFCheckBox
            Left = 8
            Top = 203
            Width = 253
            Height = 17
            Caption = 'Condiciones Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgrup: TLFCheckBox
            Left = 8
            Top = 227
            Width = 253
            Height = 17
            Caption = 'Condiciones Agrupaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondPerf: TLFCheckBox
            Left = 8
            Top = 251
            Width = 253
            Height = 17
            Caption = 'Condiciones Perfil'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBElimCond: TLFCheckBox
            Left = 8
            Top = 8
            Width = 253
            Height = 22
            Caption = 'Borrar Cond. con conflictos de fechas en Destino'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
          end
        end
        object PNLRestoCond: TLFPanel
          Left = 263
          Top = 64
          Width = 316
          Height = 280
          BevelOuter = bvNone
          TabOrder = 5
          object CBModCond: TLFCheckBox
            Left = 7
            Top = 8
            Width = 307
            Height = 22
            Caption = 'Modificar Condiciones si existen'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondProArt: TLFCheckBox
            Left = 7
            Top = 48
            Width = 307
            Height = 17
            Caption = 'Condiciones Proveedor - Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondProvFam: TLFCheckBox
            Left = 7
            Top = 73
            Width = 307
            Height = 17
            Caption = 'Condiciones Proveedor - Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgenAgrupFam: TLFCheckBox
            Left = 7
            Top = 98
            Width = 307
            Height = 17
            Caption = 'Condiciones Agente - Agrupaci'#243'n - Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgeAgruArt: TLFCheckBox
            Left = 7
            Top = 123
            Width = 307
            Height = 17
            Caption = 'Condiciones Agente - Agrupaci'#243'n - Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgeCliArt: TLFCheckBox
            Left = 7
            Top = 147
            Width = 307
            Height = 17
            Caption = 'Condiciones Agente - Cliente - Art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgenCliFam: TLFCheckBox
            Left = 7
            Top = 173
            Width = 307
            Height = 17
            Caption = 'Condiciones Agente - Cliente - Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgenCliComisiones: TLFCheckBox
            Left = 7
            Top = 198
            Width = 307
            Height = 17
            Caption = 'Condiciones Agente - Clientes (Comisiones)'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCondAgenAgrupComisiones: TLFCheckBox
            Left = 7
            Top = 223
            Width = 307
            Height = 17
            Caption = 'Condiciones Agente - Agrupaci'#243'n Cli. (Comisiones)'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
          end
        end
      end
      object TSCuentas: TTabSheet
        Caption = 'Traspaso de Cuentas Contables'
        ImageIndex = 1
        object PNLCuentas: TLFPanel
          Left = 0
          Top = 0
          Width = 580
          Height = 342
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object CBFormasPago: TLFCheckBox
            Left = 49
            Top = 108
            Width = 200
            Height = 17
            Caption = 'Ctas. Formas de Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBAcreedores: TLFCheckBox
            Left = 49
            Top = 138
            Width = 200
            Height = 17
            Caption = 'Ctas. Acreedores'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBAgentes: TLFCheckBox
            Left = 49
            Top = 168
            Width = 200
            Height = 17
            Caption = 'Ctas. Agentes'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBProveedores: TLFCheckBox
            Left = 49
            Top = 228
            Width = 200
            Height = 17
            Caption = 'Ctas. Proveedores'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBFamilias: TLFCheckBox
            Left = 49
            Top = 258
            Width = 200
            Height = 17
            Caption = 'Ctas. Familias'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBArticulos: TLFCheckBox
            Left = 49
            Top = 288
            Width = 200
            Height = 17
            Caption = 'Ctas. Art'#237'culos'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBClientes: TLFCheckBox
            Left = 49
            Top = 198
            Width = 200
            Height = 17
            Caption = 'Ctas. Clientes'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBBancos: TLFCheckBox
            Left = 362
            Top = 108
            Width = 200
            Height = 17
            Caption = 'Ctas. Bancos'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBFinancieros: TLFCheckBox
            Left = 362
            Top = 138
            Width = 200
            Height = 20
            Caption = 'Ctas. Gastos Financieros'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBIRPF: TLFCheckBox
            Left = 362
            Top = 168
            Width = 200
            Height = 20
            Caption = 'Ctas. IRPF'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBIva: TLFCheckBox
            Left = 362
            Top = 198
            Width = 200
            Height = 17
            Caption = 'Ctas. IVA'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
          end
          object TBCuentas: TLFToolBar
            Left = 0
            Top = 0
            Width = 580
            Height = 29
            ButtonHeight = 41
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 0
            Separators = True
            object PNLTBCuentas: TLFPanel
              Left = 0
              Top = 0
              Width = 577
              Height = 41
              BevelOuter = bvNone
              TabOrder = 0
              object LEjercicioOrigenCuentas: TLFLabel
                Left = 31
                Top = 5
                Width = 116
                Height = 16
                Alignment = taRightJustify
                Caption = 'Ejercicio Origen:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LEjercicioDestinoCuentas: TLFLabel
                Left = 300
                Top = 5
                Width = 123
                Height = 16
                Alignment = taRightJustify
                Caption = 'Ejercicio Destino:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object EDTFEjerOrigenCuentas: TLFEditFind2000
                Left = 148
                Top = 3
                Width = 125
                Height = 21
                TabOrder = 0
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'EJERCICIO'
                CampoStr = 'EJERCICIO'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'EMP_CANALES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'EJERCICIO')
                Filtros = [obEmpresa, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EDTFEjerDestinoCuentas: TLFEditFind2000
                Left = 424
                Top = 3
                Width = 124
                Height = 21
                TabOrder = 1
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'EJERCICIO'
                CampoStr = 'EJERCICIO'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'EMP_CANALES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'EJERCICIO')
                Filtros = [obEmpresa, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
            end
          end
          object TBCuentas2: TLFToolBar
            Left = 0
            Top = 29
            Width = 580
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object TButtTodo: TToolButton
              Left = 0
              Top = 0
              Action = ATodo
              ParentShowHint = False
              ShowHint = True
            end
            object TButtTodoModo: TToolButton
              Left = 23
              Top = 0
              Action = ATodoModo
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton2: TToolButton
              Left = 46
              Top = 0
              Width = 14
              Style = tbsSeparator
            end
            object TButtCanal: TToolButton
              Left = 60
              Top = 0
              Action = ACanal
              ParentShowHint = False
              ShowHint = True
            end
            object TButtCanalModo: TToolButton
              Left = 83
              Top = 0
              Action = ACanalModo
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton3: TToolButton
              Left = 106
              Top = 0
              Width = 15
              Style = tbsSeparator
            end
            object TButtCanalCanal: TToolButton
              Left = 121
              Top = 0
              Hint = 
                'Traspasa todas las cuentas del canal origen a su canal destino e' +
                'n el ejercicio destino.'#13#10'Ejemplo.'#13#10'Canal 1 2006 --> Canal 1 2007' +
                #13#10'Canal 2 2006 --> Canal 2 2007'
              Action = ACanalCanal
              ParentShowHint = False
              ShowHint = True
            end
            object TButtCanalCanalModo: TToolButton
              Left = 144
              Top = 0
              Hint = 
                'Traspasa todas las cuentas seleccionadas del canal origen a su c' +
                'anal destino en el ejercicio destino.'#13#10#13#10'Ejemplo.'#13#10'Canal 1 2006 ' +
                ' --> Canal 1 2007'#13#10'Canal 2 2006  --> Canal 2 2007'
              Action = ACanalCanalModo
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton1: TToolButton
              Left = 167
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object ChkBModCuentas: TLFCheckBox
              Left = 175
              Top = 0
              Width = 159
              Height = 22
              Caption = 'Modificar Cuentas si existen'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
            end
          end
          object ANITempo: TAnimate
            Left = 261
            Top = 164
            Width = 16
            Height = 16
            Active = False
            CommonAVI = aviFindComputer
            StopFrame = 8
            Visible = False
          end
          object CBArticulosSerie: TLFCheckBox
            Left = 362
            Top = 228
            Width = 200
            Height = 17
            Caption = 'Ctas de Art'#237'culos por Serie'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBContabilidadAnalitica: TLFCheckBox
            Left = 362
            Top = 258
            Width = 200
            Height = 17
            Caption = 'Contabilidad Anal'#237'tica'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
          end
        end
      end
      object TSTraspasoPromo: TTabSheet
        Caption = 'Traspaso Promociones Periodos'
        ImageIndex = 3
        object PNPromociones: TLFPanel
          Left = 0
          Top = 0
          Width = 580
          Height = 342
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LEjercicioOrigenProm: TLFLabel
            Left = 109
            Top = 12
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio Origen:'
          end
          object LCanalOrigenProm: TLFLabel
            Left = 122
            Top = 35
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal Origen:'
          end
          object LEjercicioDestinoProm: TLFLabel
            Left = 352
            Top = 12
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio Destino:'
          end
          object LCanalDestinoProm: TLFLabel
            Left = 365
            Top = 35
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal Destino:'
          end
          object BitBtn1: TBitBtn
            Left = 8
            Top = 0
            Width = 26
            Height = 26
            Action = ATraspasoPromo
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object BitBtn2: TBitBtn
            Left = 34
            Top = 0
            Width = 26
            Height = 26
            Action = ASeleccionarPromo
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object BitBtn3: TBitBtn
            Left = 60
            Top = 0
            Width = 26
            Height = 26
            Action = ALimpiaPromo
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object EFOEjercicio: TLFEditFind2000
            Left = 195
            Top = 8
            Width = 80
            Height = 21
            TabOrder = 3
            OnExit = EFOEjercicioExit
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EJERCICIO'
            CampoStr = 'EJERCICIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EJERCICIO')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFOcanal: TLFEditFind2000
            Left = 195
            Top = 32
            Width = 80
            Height = 21
            Enabled = False
            TabOrder = 4
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'CANAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFOcanalBusqueda
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDEjercicio: TLFEditFind2000
            Left = 445
            Top = 8
            Width = 80
            Height = 21
            TabOrder = 5
            OnExit = EFDEjercicioExit
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EJERCICIO'
            CampoStr = 'EJERCICIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EJERCICIO')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDCanal: TLFEditFind2000
            Left = 445
            Top = 32
            Width = 80
            Height = 21
            Enabled = False
            TabOrder = 6
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'CANAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object PnlTraspasoPrompcionesPeriodos: TLFPanel
            Left = 130
            Top = 98
            Width = 319
            Height = 199
            BevelOuter = bvNone
            TabOrder = 7
            object CBPromocionCliArt: TLFCheckBox
              Left = 8
              Top = 32
              Width = 305
              Height = 17
              Caption = 'Promociones Cliente - Art'#237'culo'
              ClicksDisabled = False
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBPromocionArticulo: TLFCheckBox
              Left = 8
              Top = 81
              Width = 305
              Height = 17
              Caption = 'Promociones Articulo'
              ClicksDisabled = False
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBPromocionFamArt: TLFCheckBox
              Left = 8
              Top = 106
              Width = 305
              Height = 17
              Caption = 'Promociones Familia - Articulo'
              ClicksDisabled = False
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBPromocionAgrupArt: TLFCheckBox
              Left = 8
              Top = 130
              Width = 305
              Height = 17
              Caption = 'Promociones Agrupaci'#243'n - Art'#237'culo'
              ClicksDisabled = False
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBPromocionAgrupFam: TLFCheckBox
              Left = 8
              Top = 155
              Width = 305
              Height = 17
              Caption = 'Promociones Agrupaci'#243'n - Familia'
              ClicksDisabled = False
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBBorrar: TLFCheckBox
              Left = 8
              Top = 8
              Width = 305
              Height = 22
              Caption = 'Borrar promociones con conflictos de fechas en destino'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBPromocionCliFam: TLFCheckBox
              Left = 8
              Top = 57
              Width = 305
              Height = 17
              Caption = 'Promociones Cliente - Familia'
              ClicksDisabled = False
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
            end
          end
          object AniTempo3: TAnimate
            Left = 413
            Top = 324
            Width = 16
            Height = 16
            Active = False
            CommonAVI = aviFindComputer
            StopFrame = 8
            Visible = False
          end
        end
      end
      object TSOtrosTraspasos: TTabSheet
        Caption = 'Otros Traspasos'
        ImageIndex = 2
        object PNLGenericos: TLFPanel
          Left = 0
          Top = 0
          Width = 580
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LEjercicioOrigenTraspasos: TLFLabel
            Left = 31
            Top = 5
            Width = 116
            Height = 16
            Alignment = taRightJustify
            Caption = 'Ejercicio Origen:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LEjercicioDestinoTraspasos: TLFLabel
            Left = 300
            Top = 5
            Width = 123
            Height = 16
            Alignment = taRightJustify
            Caption = 'Ejercicio Destino:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EDFEjercicioOrigenGenericos: TLFEditFind2000
            Left = 148
            Top = 3
            Width = 125
            Height = 21
            TabOrder = 0
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EJERCICIO'
            CampoStr = 'EJERCICIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EJERCICIO')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDFEjercicioDestinoGenericos: TLFEditFind2000
            Left = 424
            Top = 3
            Width = 124
            Height = 21
            TabOrder = 1
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EJERCICIO'
            CampoStr = 'EJERCICIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EJERCICIO')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object PNLGenericos2: TLFPanel
          Left = 0
          Top = 29
          Width = 580
          Height = 313
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object GBListados: TGroupBox
            Left = 148
            Top = 30
            Width = 113
            Height = 129
            Caption = 'Listados'
            TabOrder = 0
            object BtnListadosCanalCanal: TBitBtn
              Left = 19
              Top = 24
              Width = 75
              Height = 25
              Hint = 
                'Traspasa los listados personalizados de este canal al mismo cana' +
                'l ejercicio destino'
              Action = AListados
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object BtnListadosCanalTodos: TBitBtn
              Left = 19
              Top = 56
              Width = 75
              Height = 25
              Hint = 
                'Traspasa los listados personalizados de este canal A TODOS los c' +
                'anales del ejercicio destino'
              Action = AListadosCanalTodos
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object BtnListadosTodosCanal: TBitBtn
              Left = 19
              Top = 88
              Width = 75
              Height = 25
              Hint = 
                'Traspasa los listados personalizados de todos los canales a su m' +
                'ismo canal del ejercicio destino'
              Action = AListadosCanalCanal
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
          end
          object GBPerfiles: TGroupBox
            Left = 148
            Top = 166
            Width = 113
            Height = 129
            Caption = 'Restricciones'
            TabOrder = 1
            object BtnRestriCanalCanal: TBitBtn
              Left = 19
              Top = 24
              Width = 75
              Height = 25
              Action = ARestriccion
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object BtnRestriCanalTodos: TBitBtn
              Left = 19
              Top = 56
              Width = 75
              Height = 25
              Action = ARestriccionTodo
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object BtnRestriTodosCanal: TBitBtn
              Left = 19
              Top = 88
              Width = 75
              Height = 25
              Hint = 
                'Traspasa las restricciones de todos los canales a su mismo canal' +
                ' en el ejercicio destino'
              Action = ARestriccionCanal
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
          end
          object GBTarifasProveedor: TGroupBox
            Left = 270
            Top = 30
            Width = 116
            Height = 129
            Caption = ' Tarifas de Prov. '
            TabOrder = 2
            object BtnTarProCanalCanal: TBitBtn
              Left = 20
              Top = 24
              Width = 75
              Height = 25
              Action = AProveedorCanalCanal
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object BtnTarProTodosCanal: TBitBtn
              Left = 20
              Top = 88
              Width = 75
              Height = 25
              Action = AProveedorTodosCanal
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object BtnTarProCanalTodos: TBitBtn
              Left = 20
              Top = 56
              Width = 75
              Height = 25
              Action = AProveedorCanalTodos
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object GBCampanyas: TGroupBox
            Left = 270
            Top = 166
            Width = 116
            Height = 65
            Caption = 'Campa'#241'as'
            TabOrder = 3
            object BtnCampanyas: TBitBtn
              Left = 20
              Top = 24
              Width = 75
              Height = 25
              Action = ACampanya
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
          object GBPrecioCosteKri: TGroupBox
            Left = 270
            Top = 233
            Width = 117
            Height = 61
            Caption = 'Precio Coste Art.'
            TabOrder = 4
            object BtnPrecioCosteKri: TBitBtn
              Left = 20
              Top = 24
              Width = 75
              Height = 25
              Action = APrecioCosteKri
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 400
    Width = 592
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 414
  end
  object ALTraspaso: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 373
    object ACerrar: TAction
      Caption = 'Cerrar'
      Hint = 'Cerrar Traspasos'
      ImageIndex = 0
      OnExecute = ACerrarExecute
    end
    object ATraspasar: TAction
      Hint = 'Realizar traspasos'
      ImageIndex = 19
      OnExecute = ATraspasarExecute
    end
    object ATodo: TAction
      Caption = 'T. Completo'
      Hint = 
        'Traspasa todas las cuentas a todos los canales del ejercicio des' +
        'tino.'#13#10#13#10'Ejemplo.'#13#10'Canal 1 2006 -->  Canal 1 2007'#13#10'Canal 1 2006 ' +
        '-->  Canal 2 2007'
      ImageIndex = 17
      OnExecute = ATodoExecute
    end
    object ACanal: TAction
      Caption = 'T. Canal'
      Hint = 
        'Traspasa todas las cuentas al mismo canal destino.'#13#10#13#10'Ejemplo.'#13#10 +
        'Canal 1 2006 --> Canal 1 2007'
      ImageIndex = 132
      OnExecute = ACanalExecute
    end
    object ATodoModo: TAction
      Caption = 'T. Completo Modo'
      Hint = 
        'Traspasa todas las cuentas seleccionadas a todos los canales del' +
        ' ejercicio destino.'#13#10#13#10'Ejemplo.'#13#10'Canal 1 2006 -->  Canal 1 2007'#13 +
        #10'Canal 1 2006 -->  Canal 2 2007'
      ImageIndex = 18
      OnExecute = ATodoModoExecute
    end
    object ACanalModo: TAction
      Caption = 'T.Canal Modo'
      Hint = 
        'Traspasa todas las cuentas seleccionadas al mismo canal destino.' +
        #13#10#13#10'Ejemplo.'#13#10'Canal 1 2006 --> Canal 1 2007'
      ImageIndex = 140
      OnExecute = ACanalModoExecute
    end
    object ACanalCanal: TAction
      Caption = 
        'Traspasa todas las cuentas del canal origen a su canal destino e' +
        'n el ejercicio destino.'
      Hint = 
        'Traspasa todas las cuentas del canal origen a su canal destino e' +
        'n el ejercicio destino.'#13#10#13#10'Ejemplo.'#13#10'Canal 1 2006 --> Canal 2 20' +
        '07'#13#10'Canal 2 2006 --> Canal 2 2007'
      ImageIndex = 36
      OnExecute = ACanalCanalExecute
    end
    object ACanalCanalModo: TAction
      Caption = 
        'Traspasa todas las cuentas seleccionadas del canal origen a su c' +
        'anal destino en el ejercicio destino.'
      Hint = 
        'Traspasa todas las cuentas seleccionadas del canal origen a su c' +
        'anal destino en el ejercicio destino.'#13#10#13#10'Ejemplo '#13#10'Canal 1 2006 ' +
        ' --> Canal 1 2007'#13#10'Canal 2 2006  --> Canal 2 2007'
      ImageIndex = 25
      OnExecute = ACanalCanalModoExecute
    end
    object AListados: TAction
      Hint = 
        'Traspasa los listados personalizados de este canal al mismo cana' +
        'l ejercicio Destino'
      ImageIndex = 90
      OnExecute = AListadosExecute
    end
    object AListadosCanalTodos: TAction
      Hint = 
        'Traspasa los listados personalizados de este canal A TODOS los c' +
        'anales del ejercicio Destino'
      ImageIndex = 91
      OnExecute = AListadosCanalTodosExecute
    end
    object AListadosCanalCanal: TAction
      Hint = 
        'Traspasa los listados personalizados de todos los canales a  su ' +
        'mismo canal del ejercicio Destino'
      ImageIndex = 92
      OnExecute = AListadosCanalCanalExecute
    end
    object ARestriccion: TAction
      Hint = 
        'Traspasa las restricciones de este canal al mismo canal del ejer' +
        'cicio destino'
      ImageIndex = 25
      OnExecute = ARestriccionExecute
    end
    object ARestriccionTodo: TAction
      Hint = 
        'Traspasa las restricciones de este canal A TODOS los canales del' +
        ' ejercicio destino'
      ImageIndex = 13
      OnExecute = ARestriccionTodoExecute
    end
    object ARestriccionCanal: TAction
      Hint = 
        'Traspasa las restricciones de todos los canales a su mismo canal' +
        ' en el ejercicio Destino'
      ImageIndex = 36
      OnExecute = ARestriccionCanalExecute
    end
    object ASeleccionarTodo: TAction
      Hint = 'Selecciona todas las opciones'
      ImageIndex = 146
      OnExecute = ASeleccionarTodoExecute
    end
    object ALimpiarTodo: TAction
      Hint = 'Limpia todas las opciones'
      OnExecute = ALimpiarTodoExecute
    end
    object AProveedorCanalCanal: TAction
      Hint = 
        'Traspasa las Tarifas de Proveedor de este canal al mismo canal d' +
        'el ejercicio destino'
      ImageIndex = 25
      OnExecute = AProveedorCanalCanalExecute
    end
    object AProveedorCanalTodos: TAction
      Hint = 
        'Traspasa las Tarifas de Proveedor de este canal A TODOS los cana' +
        'les del ejercicio destino'
      ImageIndex = 13
      OnExecute = AProveedorCanalTodosExecute
    end
    object AProveedorTodosCanal: TAction
      Hint = 
        'Traspasa las Tarifas de Proveedor de todos los canales a su mism' +
        'o canal en el ejercicio Destino'
      ImageIndex = 36
      OnExecute = AProveedorTodosCanalExecute
    end
    object ACampanya: TAction
      Hint = 'Traspasa las Campa'#241'as del ejercicio origen al ejercicio destino'
      ImageIndex = 21
      OnExecute = ACampanyaExecute
    end
    object ATraspasoPromo: TAction
      Hint = 'Realizar traspasos'
      ImageIndex = 19
      OnExecute = ATraspasoPromoExecute
    end
    object ASeleccionarPromo: TAction
      Hint = 'Selecciona todas las opciones'
      ImageIndex = 146
      OnExecute = ASeleccionarPromoExecute
    end
    object ALimpiaPromo: TAction
      Hint = 'Limpia todas las opciones'
      OnExecute = ALimpiaPromoExecute
    end
    object APrecioCosteKri: TAction
      Hint = 
        'Traspasa Precios de Coste de Ejercicio Origen a Ejercicio Destin' +
        'o'
      ImageIndex = 21
      OnExecute = APrecioCosteKriExecute
    end
  end
end
