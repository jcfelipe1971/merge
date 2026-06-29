inherited FPregCobrosVencidos: TFPregCobrosVencidos
  Left = 301
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Cobros/Pagos Vencidos'
  ClientHeight = 549
  ClientWidth = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 549
    inherited TBMain: TLFToolBar
      Width = 592
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 533
      Width = 592
      TabOrder = 3
    end
    inherited PCMain: TLFPageControl
      Width = 592
      ActivePage = TSClientes
      Align = alTop
      TabIndex = 0
      object TSClientes: TTabSheet
        Caption = 'Clientes'
        OnShow = AbreTab
        object PNClientes: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 137
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LZona: TLFLabel
            Left = 67
            Top = 120
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Zona'
          end
          object GBTitulo: TGroupBox
            Left = 46
            Top = 28
            Width = 498
            Height = 75
            Caption = 'Clientes'
            TabOrder = 0
            object LDesdeCliente: TLFLabel
              Left = 14
              Top = 24
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaCliente: TLFLabel
              Left = 17
              Top = 46
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object EFCliDesde: TLFEditFind2000
              Left = 50
              Top = 20
              Width = 66
              Height = 21
              TabOrder = 0
              OnChange = EFCliDesdeChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
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
            object EFCliHasta: TLFEditFind2000
              Left = 50
              Top = 42
              Width = 66
              Height = 21
              TabOrder = 1
              OnChange = EFCliHastaChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
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
            object ETituloClienteDesde: TLFEdit
              Left = 117
              Top = 20
              Width = 370
              Height = 21
              Color = clInfoBk
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
            object ETituloClienteHasta: TLFEdit
              Left = 117
              Top = 42
              Width = 370
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object ETituloZona: TLFEdit
            Left = 163
            Top = 116
            Width = 370
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEFZona: TLFEditFind2000
            Left = 96
            Top = 116
            Width = 66
            Height = 21
            TabOrder = 1
            OnChange = DBEFZona_Change
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ZONA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'SYS_ZONAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'DEFECTO DESC, ZONA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSProAcre: TTabSheet
        Caption = 'Proveedores / Acreedores'
        ImageIndex = 1
        OnShow = AbreTab
        object PNProvAcr: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 153
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LBProAcre: TLFLabel
            Left = 263
            Top = 163
            Width = 3
            Height = 13
          end
          object GBAcreedores: TGroupBox
            Left = 0
            Top = 75
            Width = 584
            Height = 75
            Align = alTop
            Caption = 'Acreedores'
            TabOrder = 1
            object LDesdeAcreedor: TLFLabel
              Left = 49
              Top = 24
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaAcreedor: TLFLabel
              Left = 52
              Top = 46
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object EFAcrDesde: TLFEditFind2000
              Left = 85
              Top = 20
              Width = 66
              Height = 21
              TabOrder = 0
              OnChange = EFAcrDesdeChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'ACREEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_ACREEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ACREEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFAcrHasta: TLFEditFind2000
              Left = 85
              Top = 42
              Width = 66
              Height = 21
              TabOrder = 1
              OnChange = EFAcrHastaChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'ACREEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_ACREEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ACREEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloAcreedorDesde: TLFEdit
              Left = 152
              Top = 20
              Width = 370
              Height = 21
              Color = clInfoBk
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
            object ETituloAcreedorHasta: TLFEdit
              Left = 152
              Top = 42
              Width = 370
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object GBProveedores: TGroupBox
            Left = 0
            Top = 0
            Width = 584
            Height = 75
            Align = alTop
            Caption = 'Proveedores'
            TabOrder = 0
            object LBProvdesde: TLFLabel
              Left = 49
              Top = 24
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LBProvHasta: TLFLabel
              Left = 52
              Top = 46
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object EFProvDesde: TLFEditFind2000
              Left = 85
              Top = 20
              Width = 66
              Height = 21
              TabOrder = 0
              OnChange = EFProvDesdeChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'PROVEEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_PROVEEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'PROVEEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFProvHasta: TLFEditFind2000
              Left = 85
              Top = 42
              Width = 66
              Height = 21
              TabOrder = 1
              OnChange = EFProvHastaChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'PROVEEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_PROVEEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'PROVEEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloProveedorDesde: TLFEdit
              Left = 152
              Top = 20
              Width = 370
              Height = 21
              Color = clInfoBk
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
            object ETituloProveedorHasta: TLFEdit
              Left = 152
              Top = 42
              Width = 370
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
    end
    object PNFormulario: TLFPanel
      Left = 0
      Top = 202
      Width = 592
      Height = 331
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object PNFechas: TLFPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 331
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object GBFechasProv: TGroupBox
          Left = 0
          Top = 41
          Width = 592
          Height = 43
          Align = alTop
          TabOrder = 1
          object LBLHastaProv: TLFLabel
            Left = 155
            Top = 16
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha de C'#225'lculo'
          end
          object DEFechaCalculo: TLFDateEdit
            Left = 251
            Top = 12
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
        end
        object GBFechasVTO: TGroupBox
          Left = 0
          Top = 0
          Width = 592
          Height = 41
          Align = alTop
          Caption = 'Fechas Vto.'
          TabOrder = 0
          object LDesdeVencimiento: TLFLabel
            Left = 52
            Top = 17
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaVencimiento: TLFLabel
            Left = 201
            Top = 17
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object DEFechaD: TLFDateEdit
            Left = 88
            Top = 13
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DEFechaH: TLFDateEdit
            Left = 235
            Top = 13
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object CBTodosLosCanal: TLFCheckBox
            Left = 448
            Top = 16
            Width = 121
            Height = 17
            Caption = 'Todos los canales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
        end
        object GBOpciones: TGroupBox
          Left = 0
          Top = 84
          Width = 592
          Height = 247
          Align = alClient
          Caption = 'Opciones'
          TabOrder = 2
          object LBTipoListado: TLFLabel
            Left = 372
            Top = 21
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Listado de '
          end
          object LMoneda: TLFLabel
            Left = 32
            Top = 56
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda del listado'
          end
          object LFechaListado: TLFLabel
            Left = 39
            Top = 80
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha del listado'
          end
          object LComentario: TLFLabel
            Left = 67
            Top = 105
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LOrdenadoPorKri: TLFLabel
            Left = 57
            Top = 129
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ordenado por'
          end
          object CBProACr: TLFComboBox
            Left = 431
            Top = 16
            Width = 106
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = 'Proveedores'
            OnChange = CBProACrChange
            Items.Strings = (
              'Proveedores'
              'Acreedores'
              'Ambos')
          end
          object CBMoneda: TLFCheckBox
            Left = 20
            Top = 23
            Width = 245
            Height = 17
            Caption = 'Moneda origen del cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = CBMonedaClick
            Alignment = taLeftJustify
          end
          object EFMoneda: TLFEditFind2000
            Left = 127
            Top = 52
            Width = 58
            Height = 21
            TabOrder = 2
            OnChange = EFMonedaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
          end
          object ETituloMoneda: TLFEdit
            Left = 186
            Top = 52
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DEFechaLst: TLFDateEdit
            Left = 127
            Top = 77
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object EComentario: TLFEdit
            Left = 126
            Top = 101
            Width = 423
            Height = 21
            TabOrder = 5
          end
          object GBFP: TGroupBox
            Left = 2
            Top = 200
            Width = 588
            Height = 45
            Align = alBottom
            Caption = 'Filtrar por Forma de Pago'
            TabOrder = 8
            object CBFP: TLFCheckBox
              Left = 20
              Top = 20
              Width = 15
              Height = 17
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = CBFPClick
              Alignment = taLeftJustify
            end
            object EFFormaPago: TLFEditFind2000
              Left = 84
              Top = 18
              Width = 57
              Height = 21
              TabOrder = 1
              OnChange = EFFormaPagoChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'FORMA'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'FORMA')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloFormaPago: TLFEdit
              Left = 142
              Top = 18
              Width = 370
              Height = 21
              Color = clInfoBk
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
          end
          object GBSerieKri: TGroupBox
            Left = 2
            Top = 159
            Width = 588
            Height = 41
            Align = alBottom
            Caption = 'Filtro por Serie'
            TabOrder = 7
            object CBBC: TLFCheckBox
              Left = 10
              Top = 16
              Width = 50
              Height = 17
              Caption = 'BC'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBIR: TLFCheckBox
              Left = 64
              Top = 16
              Width = 50
              Height = 17
              Caption = 'IR'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBSE: TLFCheckBox
              Left = 119
              Top = 16
              Width = 50
              Height = 17
              Caption = 'SE'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBGJ: TLFCheckBox
              Left = 174
              Top = 16
              Width = 50
              Height = 17
              Caption = 'GJ'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBMAR: TLFCheckBox
              Left = 228
              Top = 16
              Width = 50
              Height = 17
              Caption = 'MAR'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBGAS: TLFCheckBox
              Left = 283
              Top = 16
              Width = 50
              Height = 17
              Caption = 'GAS'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBAgrup: TLFCheckBox
              Left = 338
              Top = 16
              Width = 50
              Height = 17
              Caption = 'Agrup'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
            end
          end
          object CBOrdenadoPorKri: TLFComboBox
            Left = 127
            Top = 125
            Width = 422
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 6
            Text = 'cli/prov/acr, cod. cli/pro, numero documento, vencimiento'
            OnChange = CBProACrChange
            Items.Strings = (
              'cli/prov/acr, cod. cli/pro, numero documento, vencimiento'
              'cli/prov/acr, nombre cli/pro, numero documento, vencimiento'
              
                'cli/prov/acr, importe deuda decreciente, cod. cli/pro, numero do' +
                'cumento, vencimiento'
              
                'cli/prov/acr, importe deuda decreciente, nombre cli/pro, numero ' +
                'documento, vencimiento'
              'cli/prov/acr, fecha documento')
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 340
    Top = 22
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
