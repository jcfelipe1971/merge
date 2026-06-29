inherited FPregPedPdteProv: TFPregPedPdteProv
  Left = 329
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Pedidos de Compra Pendientes'
  ClientHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 319
    TabOrder = 1
    inherited TBMain: TLFToolBar
      object TBMultiSer: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSerie
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 221
      TabOrder = 4
    end
    inherited PCMain: TLFPageControl
      Top = 80
      Height = 141
      ActivePage = TSProveedor
      TabIndex = 0
      TabOrder = 2
      OnChange = PCMainChange
      object TSProveedor: TTabSheet
        Caption = 'Proveedor'
        object Panel5: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 113
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LClienteD: TLFLabel
            Left = 29
            Top = 36
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Proveedor'
          end
          object LClienteH: TLFLabel
            Left = 32
            Top = 58
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Proveedor'
          end
          object LDesdeFechaProveedor: TLFLabel
            Left = 108
            Top = 80
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object LHastaFechaProveedor: TLFLabel
            Left = 286
            Top = 80
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object EFProveedorD: TLFEditFind2000
            Left = 116
            Top = 32
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFProveedorDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEProveedorD: TLFDbedit
            Left = 176
            Top = 32
            Width = 325
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLSTPedPdteProv.DSProveedorD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEProveedorH: TLFDbedit
            Left = 176
            Top = 54
            Width = 325
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLSTPedPdteProv.DSProveedorH
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object EFProveedorH: TLFEditFind2000
            Left = 116
            Top = 54
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFProveedorHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
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
      object TSArticulo: TTabSheet
        Caption = 'Art'#237'culo'
        ImageIndex = 1
        object Panel4: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 113
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LArtFechaD: TLFLabel
            Left = 108
            Top = 80
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object LArtFechaH: TLFLabel
            Left = 286
            Top = 80
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object LArticuloD: TLFLabel
            Left = 7
            Top = 36
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Art'#237'culo'
          end
          object LArticuloH: TLFLabel
            Left = 10
            Top = 58
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Art'#237'culo'
          end
          object DBEArticuloD: TLFDbedit
            Left = 176
            Top = 32
            Width = 405
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLSTPedPdteProv.DSArticuloD
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
          object DBEArticuloH: TLFDbedit
            Left = 176
            Top = 54
            Width = 405
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMLSTPedPdteProv.DSArticuloH
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
          object DTPFechaArtD: TLFDateEdit
            Left = 176
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DTPFechaArtH: TLFDateEdit
            Left = 351
            Top = 76
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object EFArticuloD: TLFEditFind2000
            Left = 82
            Top = 32
            Width = 93
            Height = 21
            TabOrder = 0
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
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticuloDBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFArticuloH: TLFEditFind2000
            Left = 82
            Top = 54
            Width = 93
            Height = 21
            TabOrder = 1
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
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticuloHBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSFechaE: TTabSheet
        Caption = 'Fecha Recepci'#243'n'
        ImageIndex = 2
        TabVisible = False
        object Panel3: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 113
          Align = alClient
          TabOrder = 0
          object LFechaD: TLFLabel
            Left = 33
            Top = 43
            Width = 64
            Height = 13
            Caption = 'Desde Fecha'
          end
          object LFechaEH: TLFLabel
            Left = 263
            Top = 43
            Width = 61
            Height = 13
            Caption = 'Hasta Fecha'
          end
          object DTPFechaED: TLFDateEdit
            Left = 103
            Top = 39
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPFechaEH: TLFDateEdit
            Left = 330
            Top = 39
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
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
      object RBRecibido: TRadioButton
        Left = 201
        Top = 15
        Width = 120
        Height = 17
        Caption = 'Recibido'
        TabOrder = 0
      end
      object RBPdteRecibir: TRadioButton
        Left = 31
        Top = 15
        Width = 120
        Height = 17
        Caption = 'Pdte. Recibir'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object RBTodos: TRadioButton
        Left = 495
        Top = 15
        Width = 90
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
      object RBAnulado: TRadioButton
        Left = 355
        Top = 16
        Width = 120
        Height = 17
        Caption = 'Anulados'
        TabOrder = 3
      end
    end
    object PNLBottom: TLFPanel
      Left = 0
      Top = 237
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
    Top = 319
    Height = 82
    TabOrder = 0
    inherited EComentario: TLFEdit
      TabOrder = 1
    end
    inherited CBOrden: TLFComboBox
      Width = 203
      TabOrder = 0
    end
    object CBAgrupadoPorModelo: TLFCheckBox
      Left = 108
      Top = 56
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
    Left = 432
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMultiSerie: TAction
      Caption = 'Multi-Serie'
      Hint = 'Multi-Serie'
      ImageIndex = 115
      OnExecute = AMultiSerieExecute
    end
  end
end
