inherited FPregPedPdte: TFPregPedPdte
  Left = 264
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Pedidos de Venta Pendientes'
  ClientHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 330
    inherited TBMain: TLFToolBar
      object TButtMultiSerie: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSerie
        Caption = '&Multi-Serie'
      end
    end
    inherited PCMain: TLFPageControl
      Top = 80
      Height = 168
      ActivePage = TSCliente
      TabIndex = 0
      TabOrder = 2
      OnChange = PCMainChange
      object TSCliente: TTabSheet
        Caption = 'Cliente'
        object PNLCliente: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 140
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LClienteD: TLFLabel
            Left = 46
            Top = 36
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Cliente'
          end
          object LClienteH: TLFLabel
            Left = 49
            Top = 58
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Cliente'
          end
          object LClienteDesdeFecha: TLFLabel
            Left = 82
            Top = 80
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Doc. Fecha'
          end
          object LClienteHastaFecha: TLFLabel
            Left = 276
            Top = 80
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Doc. Fecha'
          end
          object EFClienteD: TLFEditFind2000
            Left = 116
            Top = 32
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFClienteDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EClienteD: TLFEdit
            Left = 176
            Top = 32
            Width = 329
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
            TabOrder = 4
          end
          object EClienteH: TLFEdit
            Left = 176
            Top = 54
            Width = 329
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
            TabOrder = 5
          end
          object EFClienteH: TLFEditFind2000
            Left = 116
            Top = 54
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFClienteHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DTPFechaD: TLFDateEdit
            Left = 176
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DTPFechaH: TLFDateEdit
            Left = 367
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
        end
      end
      object TSArticulo: TTabSheet
        Caption = 'Art'#237'culo'
        ImageIndex = 1
        object PNLArticulo: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 140
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LArtFechaD: TLFLabel
            Left = 108
            Top = 115
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object LArtFechaH: TLFLabel
            Left = 286
            Top = 115
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object LBLFamDesde: TLFLabel
            Left = 20
            Top = 17
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Familia'
          end
          object LBLFamHasta: TLFLabel
            Left = 23
            Top = 36
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Familia'
          end
          object LArticuloD: TLFLabel
            Left = 15
            Top = 65
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Art'#237'culo'
          end
          object LArticuloH: TLFLabel
            Left = 18
            Top = 86
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Art'#237'culo'
          end
          object DTPFechaArtD: TLFDateEdit
            Left = 176
            Top = 111
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DTPFechaArtH: TLFDateEdit
            Left = 351
            Top = 111
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object EFFamiliaD: TLFEditFind2000
            Left = 90
            Top = 12
            Width = 93
            Height = 21
            TabOrder = 0
            OnChange = EFFamiliaDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFFamiliaDBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFamiliaD: TLFDbedit
            Left = 184
            Top = 12
            Width = 378
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLstPedPdte.DSxFamiliaD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object EFFamiliaH: TLFEditFind2000
            Left = 90
            Top = 34
            Width = 93
            Height = 21
            TabOrder = 1
            OnChange = EFFamiliaHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFFamiliaHBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFamiliaH: TLFDbedit
            Left = 184
            Top = 34
            Width = 378
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLstPedPdte.DSxFamiliaH
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
          object EFArticuloD: TLFEditFind2000
            Left = 90
            Top = 61
            Width = 93
            Height = 21
            TabOrder = 2
            OnChange = EFArticuloDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticuloDBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEArticuloD: TLFDbedit
            Left = 184
            Top = 61
            Width = 378
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLstPedPdte.DSArticuloD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object EFArticuloH: TLFEditFind2000
            Left = 90
            Top = 83
            Width = 93
            Height = 21
            TabOrder = 3
            OnChange = EFArticuloHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticuloHBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEArticuloH: TLFDbedit
            Left = 184
            Top = 83
            Width = 378
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLstPedPdte.DSArticuloH
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
        end
      end
      object TSFechaE: TTabSheet
        Caption = 'Fecha Entrega'
        ImageIndex = 2
        object PNLFecjaEntrega: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 140
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFechaD: TLFLabel
            Left = 83
            Top = 80
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha Entr.'
          end
          object LFechaEH: TLFLabel
            Left = 277
            Top = 80
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha Entr.'
          end
          object LFecEntregaDesdeCli: TLFLabel
            Left = 46
            Top = 36
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Cliente'
          end
          object LFecEntregaHastaCli: TLFLabel
            Left = 49
            Top = 58
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Cliente'
          end
          object DTPFechaED: TLFDateEdit
            Left = 176
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPFechaEH: TLFDateEdit
            Left = 367
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object EFFecEntregaDesdeCli: TLFEditFind2000
            Left = 116
            Top = 32
            Width = 59
            Height = 21
            TabOrder = 2
            OnChange = EFFecEntregaDesdeCliChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFFecEntregaHastaCli: TLFEditFind2000
            Left = 116
            Top = 54
            Width = 59
            Height = 21
            TabOrder = 3
            OnChange = EFFecEntregaHastaCliChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFecEntregaDesdeCli: TLFEdit
            Left = 176
            Top = 32
            Width = 329
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
            TabOrder = 4
          end
          object EFecEntregaHastaCli: TLFEdit
            Left = 176
            Top = 54
            Width = 329
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
            TabOrder = 5
          end
        end
      end
      object TSAgente: TTabSheet
        Caption = 'Agente'
        ImageIndex = 3
        object PNLAgente: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 140
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LabelAgenteD: TLFLabel
            Left = 44
            Top = 36
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Agente'
          end
          object LabelAgenteH: TLFLabel
            Left = 47
            Top = 58
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Agente'
          end
          object LabelFechaD: TLFLabel
            Left = 108
            Top = 80
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object LabelFechaH: TLFLabel
            Left = 286
            Top = 80
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object DBEAgenteD: TLFDbedit
            Left = 176
            Top = 32
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLstPedPdte.DSAgenteD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEAgenteH: TLFDbedit
            Left = 176
            Top = 54
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLstPedPdte.DSAgenteH
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object EFAgenteD: TLFEditFind2000
            Left = 116
            Top = 32
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFAgenteDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFAgenteH: TLFEditFind2000
            Left = 116
            Top = 54
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFAgenteHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DTPFechaAgenteD: TLFDateEdit
            Left = 176
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DTPFechaAgenteH: TLFDateEdit
            Left = 351
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
        end
      end
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object RBServido: TRadioButton
        Left = 173
        Top = 13
        Width = 73
        Height = 17
        Caption = 'Servido'
        TabOrder = 1
      end
      object RBPdteServir: TRadioButton
        Left = 23
        Top = 13
        Width = 81
        Height = 17
        Caption = 'Pdte. Servir'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RBTodos: TRadioButton
        Left = 503
        Top = 13
        Width = 57
        Height = 17
        Caption = 'Todos'
        TabOrder = 3
      end
      object RBAnulado: TRadioButton
        Left = 333
        Top = 14
        Width = 74
        Height = 17
        Caption = 'Anulados'
        TabOrder = 2
      end
    end
    object PNLBottom: TLFPanel
      Left = 0
      Top = 248
      Width = 592
      Height = 82
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeTemporada: TLFLabel
        Left = 1
        Top = 9
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Temporada'
      end
      object LHastaTemporada: TLFLabel
        Left = 4
        Top = 30
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Temporada'
      end
      object LMarca: TLFLabel
        Left = 57
        Top = 53
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Marca'
      end
      object EFDesdeTemporada: TLFEditFind2000
        Left = 93
        Top = 5
        Width = 93
        Height = 21
        TabOrder = 0
        OnChange = EFDesdeTemporadaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CODIGO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_MOD_TEMPORADA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CODIGO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeTemporada: TLFEdit
        Left = 187
        Top = 5
        Width = 378
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
        TabOrder = 1
      end
      object EFHastaTemporada: TLFEditFind2000
        Left = 93
        Top = 27
        Width = 93
        Height = 21
        TabOrder = 2
        OnChange = EFHastaTemporadaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CODIGO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_MOD_TEMPORADA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CODIGO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EHastaTemporada: TLFEdit
        Left = 187
        Top = 27
        Width = 378
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
      object EFMarca: TLFEditFind2000
        Left = 93
        Top = 49
        Width = 93
        Height = 21
        TabOrder = 4
        OnChange = EFMarcaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_MARCA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_MOD_MARCAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFMarcaBusqueda
        OrdenadoPor.Strings = (
          'ID_MARCA')
        Filtros = []
      end
      object EMarca: TLFEdit
        Left = 187
        Top = 49
        Width = 378
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 330
    Height = 82
    inherited EComentario: TLFEdit
      TabOrder = 1
    end
    inherited CBOrden: TLFComboBox
      Width = 203
      TabOrder = 0
    end
    object CBAgrupadoPorModelo: TLFCheckBox
      Left = 108
      Top = 57
      Width = 401
      Height = 17
      Caption = 'Agrupado por Modelo-Color (Tallas y Colores)'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited ALMain: TLFActionList
    Left = 424
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMultiSerie: TAction [4]
      Caption = 'Multi-Serie'
      Hint = 'Multi-Serie'
      ImageIndex = 115
      OnExecute = AMultiSerieExecute
    end
    inherited AConfigurar: TAction
      Hint = 'Configuraci'#243'n R'#225'pida del Listado'
    end
  end
end
