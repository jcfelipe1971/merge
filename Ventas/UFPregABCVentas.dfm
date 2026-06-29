inherited FPRegABCVentas: TFPRegABCVentas
  Left = 427
  Top = 177
  HelpContext = 210
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'ABC Ventas'
  ClientHeight = 607
  ClientWidth = 645
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 645
    Height = 607
    inherited TBMain: TLFToolBar
      Width = 645
      inherited TButtImprimir: TToolButton
        Enabled = False
      end
      inherited TButtPrevisualizar: TToolButton
        Enabled = False
      end
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TBExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
    end
    inherited PBListado: TProgressBar
      Top = 273
      Width = 645
      TabOrder = 4
    end
    object PNLPrincipal: TLFPanel
      Left = 0
      Top = 36
      Width = 645
      Height = 237
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PCAbc: TLFPageControl
        Left = 0
        Top = 0
        Width = 645
        Height = 237
        ActivePage = TSClientes
        Align = alClient
        OwnerDraw = True
        TabIndex = 1
        TabOrder = 0
        OnChange = PCAbcChange
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSAgente: TTabSheet
          Caption = '&Agentes'
          object PAgente: TLFPanel
            Left = 0
            Top = 0
            Width = 637
            Height = 209
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LFechaCalculoAgentes: TLFLabel
              Left = 74
              Top = 178
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fechas de c'#225'lculo'
              Layout = tlCenter
            end
            object LOrdenadoPorAgentes: TLFLabel
              Left = 96
              Top = 200
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ordenado por'
              Layout = tlCenter
            end
            object LDesdeCampanyaAgente: TLFLabel
              Left = 357
              Top = 178
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde Campa'#241'a'
              Layout = tlCenter
            end
            object LHastaCampanyaAgente: TLFLabel
              Left = 360
              Top = 200
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta Campa'#241'a'
              Layout = tlCenter
            end
            object RGAgentes: TRadioGroup
              Left = 0
              Top = 0
              Width = 637
              Height = 142
              Align = alTop
              ItemIndex = 0
              Items.Strings = (
                'Por agente'
                'Por agrupaci'#243'n')
              TabOrder = 13
              OnClick = RGAgentesClick
            end
            object EFAgrupacion: TLFEditFind2000
              Left = 112
              Top = 85
              Width = 64
              Height = 21
              TabOrder = 2
              Visible = False
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
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGRUPACIONES_AGENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGRUPACION')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFAgenteDesde: TLFEditFind2000
              Left = 112
              Top = 23
              Width = 64
              Height = 21
              TabOrder = 0
              OnChange = EFAgenteDesdeChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'AGENTE'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGENTES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGENTE')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EAgenteDesde: TLFEdit
              Left = 177
              Top = 23
              Width = 400
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
              TabOrder = 14
            end
            object DBEAgrupacion: TLFDbedit
              Left = 177
              Top = 85
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentas.DSxAgrupacionAge
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
              Visible = False
            end
            object DTPFechaH: TLFDateEdit
              Left = 254
              Top = 174
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 9
            end
            object DTPFechaD: TLFDateEdit
              Left = 165
              Top = 174
              Width = 88
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 8
            end
            object EFAgenteHasta: TLFEditFind2000
              Left = 112
              Top = 45
              Width = 64
              Height = 21
              TabOrder = 1
              OnChange = EFAgenteHastaChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'AGENTE'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGENTES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGENTE')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EAgenteHasta: TLFEdit
              Left = 177
              Top = 45
              Width = 400
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
              TabOrder = 16
            end
            object CBOrden: TLFComboBox
              Left = 165
              Top = 196
              Width = 176
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 10
              OnChange = CBCanalesChange
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
            object CBArticulos: TLFCheckBox
              Left = 1
              Top = 148
              Width = 135
              Height = 17
              Caption = 'Detallado por Art'#237'culos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBFamilias: TLFDBCheckBox
              Left = 137
              Top = 148
              Width = 121
              Height = 17
              Caption = 'Detallado por familias'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object CBPrecioCeroAge: TLFDBCheckBox
              Left = 434
              Top = 148
              Width = 136
              Height = 17
              Caption = 'Considerar Precio Cero'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 7
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object EFAgrupacionAgeH: TLFEditFind2000
              Left = 112
              Top = 107
              Width = 64
              Height = 21
              TabOrder = 3
              Visible = False
              OnChange = EFAgrupacionAgeHChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'AGRUPACION'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGRUPACIONES_AGENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGRUPACION')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEAgrupacionAgeH: TLFDbedit
              Left = 177
              Top = 107
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentas.DSxAgrupacionAgeH
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 17
              Visible = False
            end
            object CBPorAgentes: TLFDBCheckBox
              Left = 273
              Top = 148
              Width = 121
              Height = 17
              Caption = 'Detallado por agentes'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object EFDesdeCampanyaAgente: TLFEditFind2000
              Left = 440
              Top = 174
              Width = 64
              Height = 21
              TabOrder = 11
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CAMPANYA'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tabla_a_buscar = 'EMP_CAMPANYAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'CAMPANYA')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFHastaCampanyaAgente: TLFEditFind2000
              Left = 440
              Top = 196
              Width = 64
              Height = 21
              TabOrder = 12
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CAMPANYA'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tabla_a_buscar = 'EMP_CAMPANYAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'CAMPANYA')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
        object TSClientes: TTabSheet
          Caption = '&Clientes'
          ImageIndex = 1
          object PClientes: TLFPanel
            Left = 0
            Top = 0
            Width = 637
            Height = 209
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LFechaCalculoClientes: TLFLabel
              Left = 74
              Top = 178
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fechas de c'#225'lculo'
              Layout = tlCenter
            end
            object LOrdenadoPorClientes: TLFLabel
              Left = 96
              Top = 200
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ordenado por'
              Layout = tlCenter
            end
            object LDCampanaKri: TLFLabel
              Left = 357
              Top = 178
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde Campa'#241'a'
              Layout = tlCenter
            end
            object LHCampanaKri: TLFLabel
              Left = 360
              Top = 200
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta Campa'#241'a'
              Layout = tlCenter
            end
            object RGClientes: TRadioGroup
              Left = 0
              Top = 0
              Width = 637
              Height = 142
              Align = alTop
              ItemIndex = 0
              Items.Strings = (
                'Por clientes'
                'Por agrupaci'#243'n')
              TabOrder = 13
              OnClick = RGAgentesClick
            end
            object EFClienteDesde: TLFEditFind2000
              Left = 112
              Top = 23
              Width = 64
              Height = 21
              TabOrder = 0
              OnChange = EFClienteDesdeChange
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
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'CLIENTE')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EClienteDesde: TLFEdit
              Left = 177
              Top = 23
              Width = 400
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
              TabOrder = 14
            end
            object DBEAgrupacionCli: TLFDbedit
              Left = 177
              Top = 85
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentas.DSxAgrupacionCli
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
            end
            object DTPFechahCli: TLFDateEdit
              Left = 254
              Top = 174
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 9
            end
            object DTPFechadCli: TLFDateEdit
              Left = 165
              Top = 174
              Width = 88
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 8
            end
            object EFClienteHasta: TLFEditFind2000
              Left = 112
              Top = 45
              Width = 64
              Height = 21
              TabOrder = 1
              OnChange = EFClienteHastaChange
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
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'CLIENTE')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EClienteHasta: TLFEdit
              Left = 177
              Top = 45
              Width = 400
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
              TabOrder = 16
            end
            object CBOrdenCli: TLFComboBox
              Left = 165
              Top = 196
              Width = 176
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 10
              OnChange = CBCanalesChange
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
            object EFAgrupacionCli: TLFEditFind2000
              Left = 112
              Top = 85
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
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGRUPACION')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object CBDetArtCli: TLFCheckBox
              Left = 1
              Top = 148
              Width = 135
              Height = 17
              Caption = 'Detallado por Art'#237'culos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBPorFamCli: TLFDBCheckBox
              Left = 137
              Top = 148
              Width = 121
              Height = 17
              Caption = 'Detallado por familias'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object EFAgrupacionCliH: TLFEditFind2000
              Left = 112
              Top = 107
              Width = 64
              Height = 21
              TabOrder = 3
              OnChange = EFAgrupacionCliHChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'AGRUPACION'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGRUPACION')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEAgrupacionCliH: TLFDbedit
              Left = 177
              Top = 107
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentas.DSxAgrupacionCliH
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 17
            end
            object CBPrecioCeroCli: TLFDBCheckBox
              Left = 434
              Top = 148
              Width = 131
              Height = 17
              Caption = 'Considerar Precio Cero'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 7
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object CBPorClientes: TLFDBCheckBox
              Left = 273
              Top = 148
              Width = 121
              Height = 17
              Caption = 'Detallado por clientes'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object EFDesdeCampanaKri: TLFEditFind2000
              Left = 440
              Top = 174
              Width = 64
              Height = 21
              TabOrder = 11
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CAMPANYA'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tabla_a_buscar = 'EMP_CAMPANYAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'CAMPANYA')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFHastaCampanaKri: TLFEditFind2000
              Left = 440
              Top = 196
              Width = 64
              Height = 21
              TabOrder = 12
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CAMPANYA'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tabla_a_buscar = 'EMP_CAMPANYAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'CAMPANYA')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
        object TSArticulos: TTabSheet
          Caption = '&Art'#237'culos'
          ImageIndex = 2
          object PNArticulos: TLFPanel
            Left = 0
            Top = 0
            Width = 637
            Height = 209
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LOrdenadoPorArticulos: TLFLabel
              Left = 96
              Top = 200
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ordenado por'
              Layout = tlCenter
            end
            object LFechaCalculoArticulos: TLFLabel
              Left = 74
              Top = 178
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fechas de c'#225'lculo'
              Layout = tlCenter
            end
            object RGArticulos: TRadioGroup
              Left = 0
              Top = 0
              Width = 637
              Height = 142
              Align = alTop
              ItemIndex = 0
              Items.Strings = (
                'Por art'#237'culos'
                'Por agrupaci'#243'n'
                'Por familias')
              TabOrder = 3
              OnClick = RGAgentesClick
            end
            object CBOrdenArt: TLFComboBox
              Left = 165
              Top = 197
              Width = 176
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              OnChange = CBCanalesChange
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
            object DTPFechadArt: TLFDateEdit
              Left = 165
              Top = 174
              Width = 88
              Height = 22
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DTPFechahArt: TLFDateEdit
              Left = 254
              Top = 174
              Width = 87
              Height = 22
              CheckOnExit = True
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              NumGlyphs = 2
              TabOrder = 1
            end
            object EFAgrupacionArt: TLFEditFind2000
              Left = 112
              Top = 54
              Width = 64
              Height = 21
              TabOrder = 4
              Visible = False
              OnChange = EFAgrupacionArtChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'AGRUPACION'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGRUPACIONES_ART_EF'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGRUPACION')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBETitAgrArt: TLFDbedit
              Left = 177
              Top = 54
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentas.DSxAgrupacionArt
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
              Visible = False
            end
            object EFAgrupacionArtH: TLFEditFind2000
              Left = 112
              Top = 76
              Width = 64
              Height = 21
              TabOrder = 6
              Visible = False
              OnChange = EFAgrupacionArtHChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'AGRUPACION'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_AGRUPACIONES_ART_EF'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'AGRUPACION')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBETitAgrArtH: TLFDbedit
              Left = 177
              Top = 76
              Width = 401
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMABCVentas.DSxAgrupacionArtH
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              Visible = False
            end
            object CBPrecioCeroArt: TLFDBCheckBox
              Left = 1
              Top = 148
              Width = 131
              Height = 17
              Caption = 'Considerar Precio Cero'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 8
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
        end
      end
    end
    object PNOpGenerales: TLFPanel
      Left = 0
      Top = 289
      Width = 645
      Height = 296
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object GBArticulo: TGroupBox
        Left = 0
        Top = 64
        Width = 645
        Height = 64
        Align = alTop
        Caption = 'Art'#237'culo'
        TabOrder = 1
        object LBArtDesde: TLFLabel
          Left = 55
          Top = 16
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LBArtHasta: TLFLabel
          Left = 58
          Top = 37
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticuloD: TLFEditFind2000
          Left = 90
          Top = 12
          Width = 90
          Height = 21
          TabOrder = 0
          OnChange = EFArticuloDChange
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
          OnBusqueda = EFArticuloDBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EArticuloD: TLFEdit
          Left = 181
          Top = 12
          Width = 400
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
        object EFArticuloH: TLFEditFind2000
          Left = 90
          Top = 34
          Width = 90
          Height = 21
          TabOrder = 2
          OnChange = EFArticuloHChange
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
          OnBusqueda = EFArticuloHBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EArticuloH: TLFEdit
          Left = 181
          Top = 34
          Width = 400
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
      object GBFamilia: TGroupBox
        Left = 0
        Top = 128
        Width = 645
        Height = 104
        Align = alTop
        Caption = 'Familia'
        TabOrder = 2
        object LBFamDesde: TLFLabel
          Left = 55
          Top = 17
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LBFamHasta: TLFLabel
          Left = 58
          Top = 38
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LSubFamiliaD: TLFLabel
          Left = 18
          Top = 61
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde SubFam.'
        end
        object LSubFamiliaH: TLFLabel
          Left = 21
          Top = 82
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta SubFam.'
        end
        object EFFamiliaD: TLFEditFind2000
          Left = 90
          Top = 13
          Width = 90
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
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamiliaDBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFamiliaD: TLFEdit
          Left = 181
          Top = 13
          Width = 400
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
        object EFFamiliaH: TLFEditFind2000
          Left = 90
          Top = 35
          Width = 90
          Height = 21
          TabOrder = 2
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
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamiliaHBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFamiliaH: TLFEdit
          Left = 181
          Top = 35
          Width = 400
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
        object EFSubFamiliaD: TLFEditFind2000
          Left = 98
          Top = 57
          Width = 90
          Height = 21
          TabOrder = 4
          OnChange = EFSubFamiliaDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SUBFAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'ART_SUBFAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFSubFamiliaDBusqueda
          OrdenadoPor.Strings = (
            'ORDEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESubFamiliaD: TLFEdit
          Left = 189
          Top = 57
          Width = 392
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
        object EFSubFamiliaH: TLFEditFind2000
          Left = 98
          Top = 79
          Width = 90
          Height = 21
          TabOrder = 6
          OnChange = EFSubFamiliaHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SUBFAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'ART_SUBFAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFSubFamiliaHBusqueda
          OrdenadoPor.Strings = (
            'ORDEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESubFamiliaH: TLFEdit
          Left = 189
          Top = 79
          Width = 392
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
          TabOrder = 7
        end
      end
      object GBConsidera: TGroupBox
        Left = 0
        Top = 232
        Width = 645
        Height = 55
        Align = alTop
        Caption = 'Considerar'
        TabOrder = 3
        object CBAlbaranesAbiertos: TLFCheckBox
          Left = 24
          Top = 24
          Width = 121
          Height = 17
          Caption = 'Albaranes Abiertos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBAlbaranesCerrados: TLFCheckBox
          Left = 160
          Top = 24
          Width = 121
          Height = 17
          Caption = 'Albaranes Cerrados'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBFacturasAbiertas: TLFCheckBox
          Left = 304
          Top = 24
          Width = 121
          Height = 17
          Caption = 'Facturas Abiertas'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBFacturasCerradas: TLFCheckBox
          Left = 440
          Top = 24
          Width = 121
          Height = 17
          Caption = 'Facturas Cerradas'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object GBZona: TGroupBox
        Left = 0
        Top = 0
        Width = 645
        Height = 64
        Align = alTop
        Caption = 'Zona'
        TabOrder = 0
        object LZonaDesde: TLFLabel
          Left = 55
          Top = 16
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LZonaHasta: TLFLabel
          Left = 58
          Top = 37
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFZonaD: TLFEditFind2000
          Left = 90
          Top = 12
          Width = 90
          Height = 21
          TabOrder = 0
          OnChange = EFZonaDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          CampoNum = 'ZONA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'SYS_ZONAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ZONA')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EZonaD: TLFEdit
          Left = 181
          Top = 12
          Width = 400
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
        object EFZonaH: TLFEditFind2000
          Left = 90
          Top = 34
          Width = 90
          Height = 21
          TabOrder = 2
          OnChange = EFZonaHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          CampoNum = 'ZONA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'SYS_ZONAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ZONA')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EZonaH: TLFEdit
          Left = 181
          Top = 34
          Width = 400
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
    object TBCalculos: TLFToolBar
      Left = 0
      Top = 585
      Width = 645
      Height = 22
      Align = alBottom
      AutoSize = True
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Wrapable = False
      Separators = True
      object CBCanales: TLFComboBox
        Left = 0
        Top = 0
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBCanalesChange
        Items.Strings = (
          'Todos los canales')
      end
      object ToolButton2: TToolButton
        Left = 124
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBSeries: TLFComboBox
        Left = 132
        Top = 0
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBSeriesChange
        Items.Strings = (
          'Todas las series')
      end
      object ToolButton3: TToolButton
        Left = 256
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtAcumula: TToolButton
        Left = 264
        Top = 0
        Action = AAcumularABC
      end
      object TButtSep4: TToolButton
        Left = 287
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBBorrado: TLFCheckBox
        Left = 295
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
    end
  end
  inherited ALMain: TLFActionList
    Left = 462
    Top = 12
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AAcumularABC: TAction
      Caption = 'AAcumularABC'
      Hint = 'Acumular ABC'
      ImageIndex = 3
      OnExecute = AAcumularABCExecute
    end
    object AABSHOT: TAction
      Caption = 'ABSHOT'
      Hint = 'ABSHOT'
      ShortCut = 49218
      OnExecute = AABSHOTExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 428
    Top = 8
  end
end
