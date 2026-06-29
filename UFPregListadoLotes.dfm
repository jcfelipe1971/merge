inherited FPregListadoLotes: TFPregListadoLotes
  Left = 300
  Top = 146
  HelpContext = 146
  ActiveControl = CHKArticulos
  Caption = 'Listado de Lotes'
  ClientHeight = 534
  ClientWidth = 688
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 688
    Height = 534
    inherited TBMain: TLFToolBar
      Width = 688
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 518
      Width = 688
      TabOrder = 2
    end
    object PNLMain: TLFPanel
      Left = 0
      Top = 36
      Width = 688
      Height = 482
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLTop: TLFPanel
        Left = 0
        Top = 412
        Width = 688
        Height = 70
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object GBOrdenados: TGroupBox
          Left = 0
          Top = 0
          Width = 688
          Height = 70
          Align = alClient
          Caption = 'Ordenado por'
          TabOrder = 0
          object CHKOrdFamilia: TLFCheckBox
            Left = 69
            Top = 21
            Width = 100
            Height = 17
            Caption = 'Familia'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
          end
          object CHKOrdArticulo: TLFCheckBox
            Left = 287
            Top = 21
            Width = 100
            Height = 17
            Caption = 'Art'#237'culo'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
          end
          object CHKOrdLote: TLFCheckBox
            Left = 512
            Top = 21
            Width = 100
            Height = 17
            Caption = 'Lote'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
          object CHKOrdCaducidad: TLFCheckBox
            Left = 69
            Top = 39
            Width = 152
            Height = 17
            Caption = 'Fecha Caducidad'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            OnClick = CHKOrdCaducidadClick
            Alignment = taLeftJustify
          end
          object ChkOrdCompra: TLFCheckBox
            Left = 287
            Top = 39
            Width = 100
            Height = 17
            Caption = 'Fecha Compra'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            OnClick = ChkOrdCompraClick
            Alignment = taLeftJustify
          end
          object CHKOrdVenta: TLFCheckBox
            Left = 512
            Top = 39
            Width = 100
            Height = 17
            Caption = 'Fecha Venta'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            OnClick = CHKOrdVentaClick
            Alignment = taLeftJustify
          end
        end
      end
      object PNLLimites: TLFPanel
        Left = 0
        Top = 0
        Width = 688
        Height = 281
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LHastaAlmacen: TLFLabel
          Left = 155
          Top = 84
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Almac'#233'n'
        end
        object LDesdeAlmacen: TLFLabel
          Left = 151
          Top = 62
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Almac'#233'n'
          Visible = False
        end
        object LDesdeLote: TLFLabel
          Left = 171
          Top = 12
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Lote'
        end
        object LHastaLote: TLFLabel
          Left = 174
          Top = 34
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Lote'
        end
        object LHastaFamilia: TLFLabel
          Left = 164
          Top = 155
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Familia'
        end
        object LDesdeFamilia: TLFLabel
          Left = 161
          Top = 133
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Familia'
        end
        object LHastaAgrupacion: TLFLabel
          Left = 141
          Top = 204
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Agrupaci'#243'n'
        end
        object LDesdeAgrupacion: TLFLabel
          Left = 138
          Top = 182
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Agrupaci'#243'n'
        end
        object LHastaArticulo: TLFLabel
          Left = 158
          Top = 254
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Art'#237'culo'
        end
        object LDesdeArticulo: TLFLabel
          Left = 155
          Top = 232
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Art'#237'culo'
        end
        object CHKAlmacen: TLFCheckBox
          Left = 0
          Top = 72
          Width = 133
          Height = 17
          Caption = 'Filtro por almac'#233'n'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 2
          TabStop = True
          OnClick = CHKAlmacenClick
          Alignment = taLeftJustify
        end
        object EFAlmacenHasta: TLFEditFind2000
          Left = 232
          Top = 80
          Width = 108
          Height = 21
          MaxLength = 3
          TabOrder = 5
          OnChange = EFAlmacenHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmacenDesde: TLFEditFind2000
          Left = 232
          Top = 58
          Width = 108
          Height = 21
          MaxLength = 3
          TabOrder = 3
          OnChange = EFAlmacenDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBTituloAlmacenH: TLFEdit
          Left = 341
          Top = 80
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBTituloAlmacenD: TLFEdit
          Left = 341
          Top = 58
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object CHKstock: TLFCheckBox
          Left = 232
          Top = 103
          Width = 169
          Height = 17
          Caption = 'Mostrar Art'#237'culos sin Stock'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 6
          TabStop = True
          Alignment = taLeftJustify
        end
        object EFLoteDesde: TLFEditFind2000
          Left = 232
          Top = 8
          Width = 108
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'LOTE'
          CampoStr = 'SERIE'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS_LOTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'LOTE')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFLoteHasta: TLFEditFind2000
          Left = 232
          Top = 30
          Width = 108
          Height = 21
          TabOrder = 1
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'LOTE'
          CampoStr = 'SERIE'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS_LOTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'LOTE')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object CHKFamilias: TLFCheckBox
          Left = 0
          Top = 142
          Width = 133
          Height = 17
          Caption = 'Filtro por familia'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 7
          TabStop = True
          OnClick = CHKFamiliasClick
          Alignment = taLeftJustify
        end
        object EFFamHasta: TLFEditFind2000
          Left = 232
          Top = 151
          Width = 108
          Height = 21
          MaxLength = 5
          TabOrder = 9
          OnChange = EFFamHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamHastaBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFFamDesde: TLFEditFind2000
          Left = 232
          Top = 129
          Width = 108
          Height = 21
          MaxLength = 5
          TabOrder = 8
          OnChange = EFFamDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamDesdeBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBTituloFamH: TLFEdit
          Left = 341
          Top = 151
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object DBTituloFamD: TLFEdit
          Left = 341
          Top = 129
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
        object CHKAgrupa: TLFCheckBox
          Left = 0
          Top = 189
          Width = 133
          Height = 17
          Caption = 'Filtro por agrupaci'#243'n'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 10
          TabStop = True
          OnClick = CHKAgrupaClick
          Alignment = taLeftJustify
        end
        object EFAgrupaHasta: TLFEditFind2000
          Left = 232
          Top = 200
          Width = 108
          Height = 21
          MaxLength = 3
          TabOrder = 12
          OnChange = EFAgrupaHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'AGRUPACION'
            'TITULO')
          CampoNum = 'AGRUPACION'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_AGRUPACIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFAgrupaHastaBusqueda
          OrdenadoPor.Strings = (
            'AGRUPACION')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAgrupaDesde: TLFEditFind2000
          Left = 232
          Top = 178
          Width = 108
          Height = 21
          MaxLength = 3
          TabOrder = 11
          OnChange = EFAgrupaDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'AGRUPACION'
            'TITULO')
          CampoNum = 'AGRUPACION'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_AGRUPACIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFAgrupaDesdeBusqueda
          OrdenadoPor.Strings = (
            'AGRUPACION')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBTituloAgruH: TLFEdit
          Left = 341
          Top = 200
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
        end
        object DBTituloAgruD: TLFEdit
          Left = 341
          Top = 178
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
        object CHKArticulos: TLFCheckBox
          Left = 0
          Top = 240
          Width = 133
          Height = 17
          Caption = 'Filtro por art'#237'culo'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 13
          TabStop = True
          OnClick = CHKArticulosClick
          Alignment = taLeftJustify
        end
        object EFArtHasta: TLFEditFind2000
          Left = 232
          Top = 250
          Width = 108
          Height = 21
          MaxLength = 15
          TabOrder = 15
          OnChange = EFArtHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'ARTICULO'
            'TITULO')
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArtHastaBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFArtDesde: TLFEditFind2000
          Left = 232
          Top = 228
          Width = 108
          Height = 21
          MaxLength = 15
          TabOrder = 14
          OnChange = EFArtDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'ARTICULO'
            'TITULO')
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArtDesdeBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBTituloArtH: TLFEdit
          Left = 341
          Top = 250
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
        end
        object DBTituloArtD: TLFEdit
          Left = 341
          Top = 228
          Width = 340
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
        end
      end
      object PNLResto5: TLFPanel
        Left = 0
        Top = 281
        Width = 688
        Height = 131
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object PNLFechas: TLFPanel
          Left = 0
          Top = 0
          Width = 688
          Height = 72
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object GBFAbricacion: TGroupBox
            Left = 0
            Top = 0
            Width = 235
            Height = 72
            Align = alLeft
            Caption = 'Fecha Fabricaci'#243'n'
            TabOrder = 0
            object LDesdeFechaFabricacion: TLFLabel
              Left = 58
              Top = 22
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaFechaFabricacion: TLFLabel
              Left = 61
              Top = 43
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object DTPFabricacionD: TLFDateEdit
              Left = 95
              Top = 18
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object DTPFabricacionH: TLFDateEdit
              Left = 95
              Top = 40
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
            object CHKFabricacion: TLFCheckBox
              Left = 31
              Top = 32
              Width = 15
              Height = 17
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = CHKFabricacionClick
              Alignment = taLeftJustify
            end
          end
          object GBEnvasado: TGroupBox
            Left = 455
            Top = 0
            Width = 233
            Height = 72
            Align = alRight
            Caption = 'Fecha Envasado'
            TabOrder = 2
            object LDesdeFechaEnvasado: TLFLabel
              Left = 58
              Top = 22
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaFechaEnvasado: TLFLabel
              Left = 61
              Top = 43
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object DTPEnvasadoD: TLFDateEdit
              Left = 95
              Top = 18
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object DTPEnvasadoH: TLFDateEdit
              Left = 95
              Top = 40
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
            object CHKEnvasado: TLFCheckBox
              Left = 31
              Top = 32
              Width = 15
              Height = 17
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = CHKEnvasadoClick
              Alignment = taLeftJustify
            end
          end
          object GBCaducidad: TGroupBox
            Left = 235
            Top = 0
            Width = 220
            Height = 72
            Align = alClient
            Caption = 'Fecha Caducidad'
            TabOrder = 1
            object LDesdeFechaCaducidad: TLFLabel
              Left = 58
              Top = 22
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaFechaCaducidad: TLFLabel
              Left = 61
              Top = 43
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object DTPCaducidadD: TLFDateEdit
              Left = 95
              Top = 18
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object DTPCaducidadH: TLFDateEdit
              Left = 95
              Top = 40
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
            object CHKCaducidad: TLFCheckBox
              Left = 31
              Top = 32
              Width = 15
              Height = 17
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = CHKCaducidadClick
              Alignment = taLeftJustify
            end
          end
        end
        object PNLFechas2: TLFPanel
          Left = 0
          Top = 72
          Width = 688
          Height = 59
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object GBCompra: TGroupBox
            Left = 0
            Top = 0
            Width = 235
            Height = 59
            Align = alLeft
            Caption = 'Fecha Entrada'
            TabOrder = 0
            object LDesdeFechaCompra: TLFLabel
              Left = 58
              Top = 22
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaFechaCompra: TLFLabel
              Left = 61
              Top = 43
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object DTPFcompraD: TLFDateEdit
              Left = 95
              Top = 18
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object DTPFcompraH: TLFDateEdit
              Left = 95
              Top = 40
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
            object CHKCompra: TLFCheckBox
              Left = 31
              Top = 32
              Width = 15
              Height = 17
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = CHKCompraClick
              Alignment = taLeftJustify
            end
          end
          object GBDatos: TGroupBox
            Left = 455
            Top = 0
            Width = 233
            Height = 59
            Align = alRight
            TabOrder = 2
            object LBLFechaListado: TLFLabel
              Left = 25
              Top = 22
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha listado'
            end
            object EComentario: TLFEdit
              Left = 9
              Top = 40
              Width = 216
              Height = 21
              MaxLength = 35
              TabOrder = 1
            end
            object DTPFechaListado: TLFDateEdit
              Left = 95
              Top = 18
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
          end
          object GBVenta: TGroupBox
            Left = 235
            Top = 0
            Width = 220
            Height = 59
            Align = alClient
            Caption = 'Fecha Salida'
            TabOrder = 1
            object LDesdeFechaVenta: TLFLabel
              Left = 58
              Top = 22
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LHastaFechaVenta: TLFLabel
              Left = 61
              Top = 43
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object DTPFVentaD: TLFDateEdit
              Left = 95
              Top = 18
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object DTPFVentaH: TLFDateEdit
              Left = 95
              Top = 40
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
            object CHKVenta: TLFCheckBox
              Left = 31
              Top = 32
              Width = 15
              Height = 17
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = CHKVentaClick
              Alignment = taLeftJustify
            end
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 450
    Top = 8
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CHKOrdArticulo.Checked'
      'CHKOrdCaducidad.Checked'
      'ChkOrdCompra.Checked'
      'CHKOrdFamilia.Checked'
      'CHKOrdLote.Checked'
      'CHKOrdVenta.Checked')
    Left = 492
    Top = 8
  end
end
