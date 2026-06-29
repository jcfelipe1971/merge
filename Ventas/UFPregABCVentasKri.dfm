inherited FPRegABCVentasKri: TFPRegABCVentasKri
  Left = 353
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'ABC Ventas Kri'
  ClientHeight = 448
  ClientWidth = 642
  OldCreateOrder = True
  Position = poDefault
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 642
    Height = 448
    inherited TBMain: TLFToolBar
      Width = 642
      inherited TButtImprimir: TToolButton
        Enabled = False
      end
      inherited TButtPrevisualizar: TToolButton
        Enabled = False
      end
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Hint = 'Configuraci'#243'n Rapida del Listado'
        Caption = '&Configurar'
        ImageIndex = 77
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfigurarClick
      end
    end
    object PCAbc: TLFPageControl
      Left = 0
      Top = 36
      Width = 642
      Height = 383
      ActivePage = TSAgente
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      OnChange = PCAbcChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSAgente: TTabSheet
        Caption = '&Agentes'
        object PAgente: TLFPanel
          Left = 0
          Top = 0
          Width = 634
          Height = 355
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object RGAgentes: TRadioGroup
            Left = 0
            Top = 0
            Width = 634
            Height = 253
            Align = alTop
            ItemIndex = 0
            Items.Strings = (
              'Por Agente'
              'Por Agrupaci'#243'n'
              'Por Familia'
              'Por Volumen'
              'Por Rutas'
              'Por Fam. 1 dig.')
            TabOrder = 5
            OnClick = RGAgentesClick
          end
          object EFAgrupacion: TLFEditFind2000
            Left = 112
            Top = 53
            Width = 64
            Height = 21
            TabOrder = 2
            OnChange = EFAgrupacionChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFAgente: TLFEditFind2000
            Left = 112
            Top = 9
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = EFAgenteChange
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
          object DBEAgente: TLFDbedit
            Left = 177
            Top = 9
            Width = 411
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxAgente
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
          object DBEAgrupacion: TLFDbedit
            Left = 177
            Top = 53
            Width = 411
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxAgrupacionCli
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
          object EFAgenteH: TLFEditFind2000
            Left = 112
            Top = 31
            Width = 64
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
          object DBEAgenteh: TLFDbedit
            Left = 177
            Top = 31
            Width = 411
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxAgenteH
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
          object EFAgrupacionH: TLFEditFind2000
            Left = 112
            Top = 75
            Width = 64
            Height = 21
            TabOrder = 3
            OnChange = EFAgrupacionHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEAgrupacionH: TLFDbedit
            Left = 177
            Top = 75
            Width = 411
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxAgrupacionCliH
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
          object CBVolumen: TLFComboBox
            Left = 112
            Top = 141
            Width = 99
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            Text = '>10.000.000'
            OnKeyPress = CBVolumenKeyPress
            Items.Strings = (
              ' >10.000.000'
              ' >5.000.000'
              ' >4.000.000'
              ' >3.000.000'
              ' >2.000.000'
              ' >1.000.000'
              ' >300.000'
              ' <300.000'
              ' VENTA 0')
          end
          object EFFamD: TLFEditFind2000
            Left = 112
            Top = 97
            Width = 64
            Height = 21
            TabOrder = 10
            Visible = False
            OnChange = EFFamDChange
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
            OnBusqueda = EFFamDBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFFamH: TLFEditFind2000
            Left = 112
            Top = 119
            Width = 64
            Height = 21
            TabOrder = 11
            Visible = False
            OnChange = EFFamHChange
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
          object DBFamD: TLFDbedit
            Left = 177
            Top = 97
            Width = 411
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxFamiliaD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
            Visible = False
          end
          object DBFamH: TLFDbedit
            Left = 177
            Top = 119
            Width = 411
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxFamiliaH
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
            Visible = False
          end
          object CBTipoCli: TLFComboBox
            Left = 375
            Top = 141
            Width = 110
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 14
            OnKeyPress = CBTipoCliKeyPress
            Items.Strings = (
              '')
          end
          object CHKTipoCli: TLFCheckBox
            Left = 274
            Top = 144
            Width = 97
            Height = 17
            Caption = 'Por Tipo Cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBRutaDesde: TLFComboBox
            Left = 111
            Top = 169
            Width = 99
            Height = 21
            ItemHeight = 13
            TabOrder = 16
            Text = 'CBRutaDesde'
            OnKeyPress = CBRutaDesdeKeyPress
          end
          object CBRutaHasta: TLFComboBox
            Left = 111
            Top = 191
            Width = 99
            Height = 21
            ItemHeight = 13
            TabOrder = 17
            Text = 'CBRutaHasta'
            OnKeyPress = CBRutaHastaKeyPress
          end
          object PNLFiltroAgentes: TLFPanel
            Left = 0
            Top = 259
            Width = 634
            Height = 96
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 18
            object LNivel: TLFLabel
              Left = 466
              Top = 39
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nivel'
              Layout = tlCenter
              Visible = False
            end
            object LBLFechas: TLFLabel
              Left = 21
              Top = 39
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fechas de C'#225'lculo'
              Layout = tlCenter
            end
            object Label1: TLFLabel
              Left = 44
              Top = 16
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ordenado por'
              Layout = tlCenter
            end
            object LEjercicioAge: TLFLabel
              Left = 450
              Top = 16
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
              Layout = tlCenter
            end
            object DTPFechaD: TLFDateEdit
              Left = 113
              Top = 34
              Width = 85
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DTPFechaH: TLFDateEdit
              Left = 203
              Top = 34
              Width = 85
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object CBOrden: TLFComboBox
              Left = 113
              Top = 12
              Width = 175
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              OnKeyPress = CBOrdenKeyPress
              Items.Strings = (
                'Codigo Agente Ascendente'
                'Codigo Agente Descendente'
                'Margen Ascendente'
                'Margen Descendente'
                'Total Ventas Ascendente'
                'Total Ventas Descendente'
                'Nombre Agente Ascendente'
                'Nombre Agente Descendente')
            end
            object CHKComparaAge: TLFCheckBox
              Left = 308
              Top = 15
              Width = 69
              Height = 17
              Caption = 'Comparar'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
            end
            object CHKVerCosteAge: TLFCheckBox
              Left = 308
              Top = 39
              Width = 120
              Height = 17
              Caption = 'Ver Coste de Ventas'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBNiveles: TLFComboBox
              Left = 494
              Top = 35
              Width = 37
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 5
              Visible = False
              OnKeyPress = CBNivelesKeyPress
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5')
            end
            object SEEjercicioAge: TSpinEdit
              Left = 494
              Top = 12
              Width = 51
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 6
              Value = 0
            end
          end
        end
      end
      object TSClientes: TTabSheet
        Caption = '&Clientes'
        ImageIndex = 1
        object PClientes: TLFPanel
          Left = 0
          Top = 0
          Width = 634
          Height = 355
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object RGClientes: TRadioGroup
            Left = 0
            Top = 0
            Width = 634
            Height = 178
            Align = alTop
            ItemIndex = 0
            Items.Strings = (
              'Por Clientes'
              'Por Agrupaci'#243'n'
              'Por Familia'
              'Por Familias')
            TabOrder = 6
            OnClick = RGAgentesClick
          end
          object EFCliente: TLFEditFind2000
            Left = 112
            Top = 10
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = EFClienteChange
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
          object DBECliente: TLFDbedit
            Left = 177
            Top = 10
            Width = 411
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxCliente
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
          object DBEAgrupacionCli: TLFDbedit
            Left = 177
            Top = 54
            Width = 411
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxAgrupacionCli
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
          object EFClienteH: TLFEditFind2000
            Left = 112
            Top = 32
            Width = 64
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
          object DBEClienteH: TLFDbedit
            Left = 177
            Top = 32
            Width = 411
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxClienteH
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
          object EFAgrupacionCli: TLFEditFind2000
            Left = 112
            Top = 54
            Width = 64
            Height = 21
            TabOrder = 2
            OnChange = EFAgrupacionCliChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFAGrupacionCliH: TLFEditFind2000
            Left = 112
            Top = 76
            Width = 64
            Height = 21
            TabOrder = 3
            OnChange = EFAgrupacionHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEAgrupacionCliH: TLFDbedit
            Left = 177
            Top = 76
            Width = 411
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxAgrupacionCliH
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object EFFAmDesde: TLFEditFind2000
            Left = 112
            Top = 90
            Width = 64
            Height = 21
            TabOrder = 4
            Visible = False
            OnChange = EFFAmDesdeChange
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
            OnBusqueda = EFFAmDesdeBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFFAmHasta: TLFEditFind2000
            Left = 112
            Top = 112
            Width = 64
            Height = 21
            TabOrder = 5
            Visible = False
            OnChange = EFFAmHastaChange
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
            OnBusqueda = EFFAmHastaBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFamDesde: TLFDbedit
            Left = 177
            Top = 90
            Width = 411
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxFamiliaD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
            Visible = False
          end
          object DBEFamHasta: TLFDbedit
            Left = 177
            Top = 112
            Width = 411
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxFamiliaH
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
            Visible = False
          end
          object PSelFamilia: TLFPanel
            Left = 111
            Top = 131
            Width = 478
            Height = 44
            BevelOuter = bvNone
            TabOrder = 13
            object EFFamilia: TLFEditFind2000
              Left = 1
              Top = 1
              Width = 64
              Height = 21
              TabOrder = 0
              OnKeyPress = EFFamiliaKeyPress
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
              OrdenadoPor.Strings = (
                'FAMILIA')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object TBorrar: TButton
              Left = 3
              Top = 22
              Width = 60
              Height = 20
              Caption = '&Borrar'
              TabOrder = 1
              OnClick = TBorrarClick
            end
            object MSeleccion: TLFMemo
              Left = 116
              Top = 0
              Width = 362
              Height = 44
              Align = alRight
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 2
            end
            object bAgregarFamilia: TButton
              Left = 71
              Top = 2
              Width = 37
              Height = 17
              Caption = '-->'
              TabOrder = 3
              OnClick = bAgregarFamiliaClick
            end
          end
          object LFPanel1: TLFPanel
            Left = 0
            Top = 178
            Width = 634
            Height = 81
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 14
            object LDesdeAgente: TLFLabel
              Left = 41
              Top = 26
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde Agente'
            end
            object LHastaAgente: TLFLabel
              Left = 44
              Top = 48
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta Agente'
            end
            object LListadosEntreLosAgentes: TLFLabel
              Left = 0
              Top = 0
              Width = 634
              Height = 13
              Align = alTop
              Caption = 'Listados entre los Agentes'
              WordWrap = True
            end
            object EFAgenteHasta: TLFEditFind2000
              Left = 113
              Top = 22
              Width = 64
              Height = 21
              TabOrder = 0
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
            object EFAgenteDesde: TLFEditFind2000
              Left = 113
              Top = 44
              Width = 64
              Height = 21
              TabOrder = 1
              OnChange = EFAgenteChange
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
            object DBEAgenteDesde: TLFDbedit
              Left = 178
              Top = 22
              Width = 410
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentasKri.DSxAgente
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
            object DBEAgenteHasta: TLFDbedit
              Left = 178
              Top = 44
              Width = 410
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentasKri.DSxAgenteH
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
          object PNLFiltroClientes: TLFPanel
            Left = 0
            Top = 259
            Width = 634
            Height = 96
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 15
            object LFechaCalculo: TLFLabel
              Left = 21
              Top = 39
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fechas de C'#225'lculo'
              Layout = tlCenter
            end
            object LOrdenadoPorClientes: TLFLabel
              Left = 44
              Top = 17
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ordenado por'
              Layout = tlCenter
            end
            object LNivelCli: TLFLabel
              Left = 466
              Top = 39
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nivel'
              Layout = tlCenter
              Visible = False
            end
            object LEjercicioCli: TLFLabel
              Left = 450
              Top = 16
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
              Layout = tlCenter
            end
            object DTPFechadCli: TLFDateEdit
              Left = 113
              Top = 34
              Width = 85
              Height = 22
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DTPFechahCli: TLFDateEdit
              Left = 203
              Top = 34
              Width = 85
              Height = 22
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object CBOrdenCli: TLFComboBox
              Left = 113
              Top = 12
              Width = 175
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              Items.Strings = (
                'Codigo Cliente Ascendente'
                'Codigo Cliente Descendente'
                'Margen Ascendente'
                'Margen Descendente'
                'Total Ventas Ascendente'
                'Total Ventas Descendente'
                'Nombre Cliente Ascendente'
                'Nombre Cliente Descendente')
            end
            object CHKComparaCli: TLFCheckBox
              Left = 308
              Top = 15
              Width = 69
              Height = 17
              Caption = 'Comparar'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
            end
            object CHKVerCosteCli: TLFCheckBox
              Left = 308
              Top = 39
              Width = 121
              Height = 17
              Caption = 'Ver Coste de Ventas'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBNivelesCli: TLFComboBox
              Left = 494
              Top = 35
              Width = 37
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 5
              Visible = False
              OnKeyPress = CBNivelesKeyPress
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5')
            end
            object SEEjercicioCli: TSpinEdit
              Left = 494
              Top = 12
              Width = 51
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 6
              Value = 0
            end
          end
        end
      end
      object TSArticulos: TTabSheet
        Caption = '&Art'#237'culos'
        ImageIndex = 2
        object PNArticulos: TLFPanel
          Left = 0
          Top = 0
          Width = 634
          Height = 355
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object RGArticulos: TRadioGroup
            Left = 0
            Top = 0
            Width = 634
            Height = 176
            Align = alTop
            Caption = 'Filtrar listado de Art'#237'culos...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Por Art'#237'culos'
              'Por Fam'#237'lia')
            ParentFont = False
            TabOrder = 2
            OnClick = RGAgentesClick
          end
          object EFArticuloD: TLFEditFind2000
            Left = 91
            Top = 36
            Width = 90
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
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticuloDBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFArticuloH: TLFEditFind2000
            Left = 91
            Top = 58
            Width = 90
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
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticuloHBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEArticuloH: TLFDbedit
            Left = 182
            Top = 58
            Width = 409
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxArticuloH
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
          object DBEArticuloD: TLFDbedit
            Left = 182
            Top = 36
            Width = 409
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxArticuloD
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
          object EFFamiliaDesde: TLFEditFind2000
            Left = 91
            Top = 120
            Width = 90
            Height = 21
            TabOrder = 5
            OnChange = EFFamiliaDesdeChange
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
            OnBusqueda = EFFamiliaDesdeBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFFamiliaHasta: TLFEditFind2000
            Left = 91
            Top = 142
            Width = 90
            Height = 21
            TabOrder = 6
            OnChange = EFFamiliaHastaChange
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
            OnBusqueda = EFFamiliaHastaBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFamiliaDesde: TLFDbedit
            Left = 182
            Top = 120
            Width = 409
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxFamiliaD
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
          object DBEFamiliaHasta: TLFDbedit
            Left = 182
            Top = 142
            Width = 409
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCVentasKri.DSxFamiliaH
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
          object PNLFiltroFamiliaArticulos: TLFPanel
            Left = 0
            Top = 176
            Width = 634
            Height = 83
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 9
            object LHastaFamilia: TLFLabel
              Left = 59
              Top = 45
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object LListadoDeFamilias: TLFLabel
              Left = 0
              Top = 0
              Width = 634
              Height = 13
              Align = alTop
              Caption = 'Listado de Familias'
              WordWrap = True
            end
            object LDesdeFamilia: TLFLabel
              Left = 56
              Top = 25
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object CHKFamilias: TLFCheckBox
              Left = 18
              Top = 36
              Width = 17
              Height = 17
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              OnClick = CHKFamiliasClick
              Alignment = taLeftJustify
            end
            object EfamHasta: TLFEditFind2000
              Left = 91
              Top = 42
              Width = 90
              Height = 21
              TabOrder = 1
              OnChange = EfamHastaChange
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
              OnBusqueda = EfamHastaBusqueda
              OrdenadoPor.Strings = (
                'FAMILIA')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFamdesde: TLFEditFind2000
              Left = 91
              Top = 20
              Width = 90
              Height = 21
              TabOrder = 2
              OnChange = EFamdesdeChange
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
              OnBusqueda = EFamdesdeBusqueda
              OrdenadoPor.Strings = (
                'FAMILIA')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBFamDesde: TLFDbedit
              Left = 182
              Top = 20
              Width = 408
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentasKri.DSXFamiliaD2
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
            object DBFamHasta: TLFDbedit
              Left = 182
              Top = 42
              Width = 408
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentasKri.DSxFamiliaH2
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
          end
          object PNLFiltroArticulos: TLFPanel
            Left = 0
            Top = 259
            Width = 634
            Height = 96
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 10
            object LOrdenadoPorArticulos: TLFLabel
              Left = 43
              Top = 16
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ordenado por'
              Layout = tlCenter
            end
            object LFechaCalculoArticulos: TLFLabel
              Left = 21
              Top = 38
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fechas de C'#225'lculo'
              Layout = tlCenter
            end
            object LEjercicioArt: TLFLabel
              Left = 450
              Top = 16
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
              Layout = tlCenter
            end
            object LBLNivel: TLFLabel
              Left = 466
              Top = 39
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nivel'
              Layout = tlCenter
              Visible = False
            end
            object DTPFechadArt: TLFDateEdit
              Left = 113
              Top = 34
              Width = 85
              Height = 22
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object CBOrdenArt: TLFComboBox
              Left = 113
              Top = 12
              Width = 175
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              Items.Strings = (
                'Codigo Art'#237'culo Ascendente'
                'Codigo Art'#237'culo Descendente'
                'Margen Ascendente'
                'Margen Descendente'
                'Total Ventas Ascendente'
                'Total Ventas Descendente'
                'Nombre Art'#237'culo Ascendente'
                'Nombre Art'#237'culo Descendente')
            end
            object DTPFechahArt: TLFDateEdit
              Left = 203
              Top = 34
              Width = 85
              Height = 22
              CheckOnExit = True
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              NumGlyphs = 2
              TabOrder = 2
            end
            object CHKVerCosteArt: TLFCheckBox
              Left = 308
              Top = 40
              Width = 121
              Height = 17
              Caption = 'Ver Coste de Ventas'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
            end
            object CHKComparaArt: TLFCheckBox
              Left = 308
              Top = 16
              Width = 69
              Height = 17
              Caption = 'Comparar'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object SEEjercicioArt: TSpinEdit
              Left = 494
              Top = 12
              Width = 51
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 5
              Value = 0
            end
            object CBNivelArt: TLFComboBox
              Left = 494
              Top = 35
              Width = 37
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 6
              Text = '1'
              Visible = False
              OnKeyPress = CBNivelesKeyPress
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5')
            end
          end
        end
      end
    end
    object PBajo: TLFPanel
      Left = 0
      Top = 419
      Width = 642
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object TBCalculos: TLFToolBar
        Left = 0
        Top = 0
        Width = 642
        Height = 22
        AutoSize = True
        ButtonWidth = 24
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        Separators = True
        object CBCanales: TLFComboBox
          Left = 0
          Top = 0
          Width = 109
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnKeyPress = CBCanalesKeyPress
          Items.Strings = (
            'Todos los canales')
        end
        object ToolButton2: TToolButton
          Left = 109
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object CBAlmacenes: TLFComboBox
          Left = 117
          Top = 0
          Width = 171
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnKeyPress = CBAlmacenesKeyPress
          Items.Strings = (
            'Todos los Almacenes')
        end
        object ToolButton3: TToolButton
          Left = 288
          Top = 0
          Width = 19
          Style = tbsSeparator
        end
        object TButtAcumula: TToolButton
          Left = 307
          Top = 0
          Action = AAcumularABC
        end
        object TButtSep4: TToolButton
          Left = 331
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object CBBorrado: TLFCheckBox
          Left = 339
          Top = 0
          Width = 61
          Height = 22
          Hint = 'Borra los saldos anteriores'
          Caption = 'Borrado'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object ToolButton1: TToolButton
          Left = 400
          Top = 0
          Width = 10
          Style = tbsSeparator
        end
        object Label6: TLFLabel
          Left = 410
          Top = 0
          Width = 39
          Height = 22
          Caption = 'Moneda'
          Layout = tlCenter
        end
        object CBMoneda: TLFComboBox
          Left = 449
          Top = 0
          Width = 135
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          OnKeyPress = CBMonedaKeyPress
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 450
    Top = 8
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AAcumularABC: TAction
      Caption = 'AAcumularABC'
      ImageIndex = 3
      OnExecute = AAcumularABCExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 412
    Top = 8
  end
end
