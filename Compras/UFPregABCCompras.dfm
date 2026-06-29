inherited FPRegABCCompras: TFPRegABCCompras
  Left = 376
  Top = 205
  HelpContext = 181
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'ABC Compras'
  ClientHeight = 630
  ClientWidth = 642
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 642
    Height = 608
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
      Top = 296
      Width = 642
      TabOrder = 3
    end
    object PCAbc: TLFPageControl
      Left = 0
      Top = 36
      Width = 642
      Height = 260
      ActivePage = TSProveedores
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      OnChange = PCAbcChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSProveedores: TTabSheet
        Caption = '&Proveedores'
        ImageIndex = 1
        object PClientes: TLFPanel
          Left = 0
          Top = 0
          Width = 634
          Height = 232
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFechaCalculoProveedores: TLFLabel
            Left = 72
            Top = 178
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fechas de C'#225'lculo'
            Layout = tlCenter
          end
          object LOrdenadoPorProveedores: TLFLabel
            Left = 95
            Top = 199
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ordenado por'
            Layout = tlCenter
          end
          object RGProveedores: TRadioGroup
            Left = 0
            Top = 0
            Width = 634
            Height = 140
            Align = alTop
            ItemIndex = 0
            Items.Strings = (
              'Por Proveedores'
              'Por Agrupaci'#243'n')
            TabOrder = 5
            OnClick = RGHabilitaClick
          end
          object EFProveedorDesde: TLFEditFind2000
            Left = 112
            Top = 23
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = EFProveedorDesdeChange
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
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EProveedorDesde: TLFEdit
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
            TabOrder = 6
          end
          object DTPFechahPro: TLFDateEdit
            Left = 254
            Top = 174
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DTPFechadPro: TLFDateEdit
            Left = 165
            Top = 174
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object EFProveedorHasta: TLFEditFind2000
            Left = 112
            Top = 45
            Width = 64
            Height = 21
            TabOrder = 1
            OnChange = EFProveedorHastaChange
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
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EProveedorHasta: TLFEdit
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
            TabOrder = 7
          end
          object CBOrdenPro: TLFComboBox
            Left = 165
            Top = 196
            Width = 176
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
            OnChange = CBCanalesChange
            Items.Strings = (
              'C'#243'digo Proveedor Ascendente'
              'C'#243'digo Proveedor Descendente'
              'Nombre Proveedor Ascendente'
              'Nombre Proveedor Descendente'
              'Total Compras Ascendente'
              'Total Compras Descendente')
          end
          object EFAgrupacion: TLFEditFind2000
            Left = 112
            Top = 95
            Width = 64
            Height = 21
            TabOrder = 8
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
            Tabla_a_buscar = 'VER_AGRUPACIONES_PROVEEDORES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEAgrupacion: TLFDbedit
            Left = 177
            Top = 95
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCCompras.DSxAgrupacionProv
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            Visible = False
          end
          object CBDetArt: TLFCheckBox
            Left = 1
            Top = 148
            Width = 135
            Height = 17
            Caption = 'Detallado por Art'#237'culos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBPorFam: TLFDBCheckBox
            Left = 137
            Top = 148
            Width = 121
            Height = 17
            Caption = 'Detallado por familias'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object CBPorProveedor: TLFDBCheckBox
            Left = 273
            Top = 148
            Width = 152
            Height = 17
            Caption = 'Detallado por proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object CBPrecioCeroPro: TLFDBCheckBox
            Left = 434
            Top = 148
            Width = 131
            Height = 17
            Caption = 'Considerar Precio Cero'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      object TSAcreedor: TTabSheet
        Caption = 'Acr&eedores'
        ImageIndex = 2
        object LFechaCalculoAcreedores: TLFLabel
          Left = 72
          Top = 178
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fechas de C'#225'lculo'
          Layout = tlCenter
        end
        object LOrdenadoPorAcreedores: TLFLabel
          Left = 95
          Top = 199
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ordenado por'
          Layout = tlCenter
        end
        object RGAcreedores: TRadioGroup
          Left = 0
          Top = 0
          Width = 634
          Height = 140
          Align = alTop
          TabOrder = 3
        end
        object DTPFechaDAcr: TLFDateEdit
          Left = 165
          Top = 174
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPFechaHAcr: TLFDateEdit
          Left = 254
          Top = 174
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
        object CBOrdenAcr: TLFComboBox
          Left = 165
          Top = 196
          Width = 176
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = CBCanalesChange
          Items.Strings = (
            'C'#243'digo Acreedor Ascendente'
            'C'#243'digo Acreedor Descendente'
            'Nombre Acreedor Ascendente'
            'Nombre Acreedor Descendente'
            'Total Compras Ascendente'
            'Total Compras Descendente')
        end
        object EFAcreedorD: TLFEditFind2000
          Left = 112
          Top = 47
          Width = 64
          Height = 21
          TabOrder = 4
          OnChange = EFAcreedorDChange
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_ACREEDORES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ACREEDOR')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAcreedorH: TLFEditFind2000
          Left = 112
          Top = 69
          Width = 64
          Height = 21
          TabOrder = 5
          OnChange = EFAcreedorHChange
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_ACREEDORES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ACREEDOR')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEAcreFin: TLFDbedit
          Left = 177
          Top = 69
          Width = 400
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMABCCompras.DSxAcreedorH
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
        object DBEAcreIni: TLFDbedit
          Left = 177
          Top = 47
          Width = 400
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMABCCompras.DSxAcreedorD
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
        object LBAcreedor: TStaticText
          Left = 26
          Top = 60
          Width = 66
          Height = 17
          Alignment = taRightJustify
          Caption = 'Por Acreedor'
          TabOrder = 8
        end
      end
      object TSArticulos: TTabSheet
        Caption = '&Art'#237'culos'
        ImageIndex = 2
        object PNArticulos: TLFPanel
          Left = 0
          Top = 0
          Width = 634
          Height = 232
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LOrdenadoPorArticulos: TLFLabel
            Left = 95
            Top = 199
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ordenado por'
            Layout = tlCenter
          end
          object LFechaCalculoArticulos: TLFLabel
            Left = 72
            Top = 178
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fechas de C'#225'lculo'
            Layout = tlCenter
          end
          object RGArticulos: TRadioGroup
            Left = 0
            Top = 0
            Width = 634
            Height = 140
            Align = alTop
            ItemIndex = 0
            Items.Strings = (
              'Por Art'#237'culos'
              'Por Familias')
            TabOrder = 3
            OnClick = RGHabilitaClick
          end
          object CBOrdenArt: TLFComboBox
            Left = 165
            Top = 196
            Width = 176
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            OnChange = CBCanalesChange
            Items.Strings = (
              'Codigo Art'#237'culo Ascendente'
              'Codigo Art'#237'culo Descendente'
              'Nombre Art'#237'culo Ascendente'
              'Nombre Art'#237'culo Descendente'
              'Total Compras Ascendente'
              'Total Compras Descendente')
          end
          object DTPFechadArt: TLFDateEdit
            Left = 165
            Top = 174
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPFechahArt: TLFDateEdit
            Left = 254
            Top = 174
            Width = 87
            Height = 21
            CheckOnExit = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
    end
    object PNLPNOpGenerales: TLFPanel
      Left = 0
      Top = 312
      Width = 642
      Height = 296
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object grpGBArticulo: TGroupBox
        Left = 0
        Top = 64
        Width = 642
        Height = 64
        Align = alTop
        Caption = 'Art'#237'culo'
        TabOrder = 0
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
      object grpGBFamilia: TGroupBox
        Left = 0
        Top = 128
        Width = 642
        Height = 104
        Align = alTop
        Caption = 'Familia'
        TabOrder = 1
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
      object grpGBConsidera: TGroupBox
        Left = 0
        Top = 232
        Width = 642
        Height = 55
        Align = alTop
        Caption = 'Considerar'
        TabOrder = 2
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
      object grpGBZona: TGroupBox
        Left = 0
        Top = 0
        Width = 642
        Height = 64
        Align = alTop
        Caption = 'Zona'
        Enabled = False
        TabOrder = 3
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
  end
  object TBCalculos: TLFToolBar [1]
    Left = 0
    Top = 608
    Width = 642
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
    TabOrder = 1
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
  inherited ALMain: TLFActionList
    Left = 460
    Top = 6
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AAcumularABC: TAction
      Caption = 'AAcumularABC'
      Hint = 'Acumular ABC'
      ImageIndex = 3
      OnExecute = AAcumularABCExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 428
    Top = 8
  end
end
