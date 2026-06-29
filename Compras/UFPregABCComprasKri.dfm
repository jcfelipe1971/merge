inherited FPRegABCComprasKri: TFPRegABCComprasKri
  Left = 335
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'ABC Compras Kri'
  ClientHeight = 290
  ClientWidth = 642
  OldCreateOrder = True
  Position = poDefault
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 642
    Height = 290
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
    object TBCalculos: TLFToolBar
      Left = 0
      Top = 268
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
      Separators = True
      object CBCanales: TLFComboBox
        Left = 0
        Top = 0
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Todos los canales')
      end
      object ToolButton2: TToolButton
        Left = 124
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBAlmacenes: TLFComboBox
        Left = 132
        Top = 0
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Todos los Almacenes')
      end
      object ToolButton3: TToolButton
        Left = 256
        Top = 0
        Width = 39
        Style = tbsSeparator
      end
      object TButtAcumula: TToolButton
        Left = 295
        Top = 0
        Action = AAcumularABC
      end
      object TButtSep4: TToolButton
        Left = 318
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBBorrado: TLFCheckBox
        Left = 326
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
    object PCAbc: TLFPageControl
      Left = 0
      Top = 36
      Width = 642
      Height = 232
      ActivePage = TSProveedores
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
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
          Height = 204
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFechaCalculoProveedores: TLFLabel
            Left = 19
            Top = 121
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fechas de C'#225'lculo'
            Layout = tlCenter
          end
          object LORdenadoPorProveedores: TLFLabel
            Left = 42
            Top = 143
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ordenado por'
            Layout = tlCenter
          end
          object LEjercicioProv: TLFLabel
            Left = 316
            Top = 121
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
            Layout = tlCenter
            Visible = False
          end
          object RGProveedores: TRadioGroup
            Left = 0
            Top = 0
            Width = 634
            Height = 111
            Align = alTop
            ItemIndex = 0
            Items.Strings = (
              'Por Proveedores'
              'Por Agrupaci'#243'n')
            TabOrder = 5
            OnClick = RGHabilitaClick
          end
          object EFProveedorD: TLFEditFind2000
            Left = 112
            Top = 13
            Width = 64
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
            Left = 177
            Top = 13
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCComprasKri.DSxProveedorD
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
            Left = 203
            Top = 117
            Width = 85
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DTPFechadPro: TLFDateEdit
            Left = 111
            Top = 117
            Width = 85
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object EFProveedorH: TLFEditFind2000
            Left = 112
            Top = 35
            Width = 64
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
          object DBEProveedorH: TLFDbedit
            Left = 177
            Top = 35
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCComprasKri.DSxProveedorH
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
            Left = 111
            Top = 140
            Width = 177
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
            Items.Strings = (
              'C'#243'digo Proveedor Ascendente'
              'C'#243'digo Proveedor Descendente'
              'Nombre Proveedor Ascendente'
              'Nombre Proveedor Descendente'
              'Total Compras Ascendente'
              'Total Compras Descendente')
          end
          object CHKComparaProv: TLFCheckBox
            Left = 317
            Top = 142
            Width = 69
            Height = 17
            Caption = 'Comparar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            OnClick = CHKComparaProvClick
            Alignment = taLeftJustify
          end
          object SEEjercicioProv: TSpinEdit
            Left = 360
            Top = 117
            Width = 51
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 9
            Value = 0
            Visible = False
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
          Height = 204
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LOrdenadoPorArticulos: TLFLabel
            Left = 42
            Top = 143
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ordenado por'
            Layout = tlCenter
          end
          object LFechaCalculoArticulos: TLFLabel
            Left = 19
            Top = 121
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fechas de C'#225'lculo'
            Layout = tlCenter
          end
          object LNivel: TLFLabel
            Left = 332
            Top = 165
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nivel'
            Layout = tlCenter
            Visible = False
          end
          object LEjercicioArt: TLFLabel
            Left = 316
            Top = 121
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
            Layout = tlCenter
            Visible = False
          end
          object RGArticulos: TRadioGroup
            Left = 0
            Top = 0
            Width = 634
            Height = 111
            Align = alTop
            ItemIndex = 0
            Items.Strings = (
              'Por Art'#237'culos'
              'Por Familias')
            TabOrder = 7
            OnClick = RGHabilitaClick
          end
          object EFArticuloD: TLFEditFind2000
            Left = 91
            Top = 14
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
            Top = 36
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
          object EFFamiliaD: TLFEditFind2000
            Left = 91
            Top = 62
            Width = 90
            Height = 21
            TabOrder = 2
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
          object EFFamiliaH: TLFEditFind2000
            Left = 91
            Top = 84
            Width = 90
            Height = 21
            TabOrder = 3
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
            Left = 182
            Top = 84
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCComprasKri.DSxFamiliaH
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
          object DBEFamiliaD: TLFDbedit
            Left = 182
            Top = 62
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCComprasKri.DSxFamiliaD
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
          object DBEArticuloH: TLFDbedit
            Left = 182
            Top = 36
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCComprasKri.DSxArticuloH
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
          object DBEArticuloD: TLFDbedit
            Left = 182
            Top = 14
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMABCComprasKri.DSxArticuloD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object CBOrdenArt: TLFComboBox
            Left = 111
            Top = 140
            Width = 177
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 6
            Items.Strings = (
              'Codigo Art'#237'culo Ascendente'
              'Codigo Art'#237'culo Descendente'
              'Nombre Art'#237'culo Ascendente'
              'Nombre Art'#237'culo Descendente'
              'Total Compras Ascendente'
              'Total Compras Descendente')
          end
          object DTPFechadArt: TLFDateEdit
            Left = 111
            Top = 117
            Width = 85
            Height = 22
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DTPFechahArt: TLFDateEdit
            Left = 203
            Top = 117
            Width = 85
            Height = 22
            CheckOnExit = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            NumGlyphs = 2
            TabOrder = 5
          end
          object CBNiveles: TLFComboBox
            Left = 360
            Top = 162
            Width = 37
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 12
            Visible = False
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5')
          end
          object CHKComparaArt: TLFCheckBox
            Left = 317
            Top = 142
            Width = 69
            Height = 16
            Caption = 'Comparar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            OnClick = CHKComparaArtClick
            Alignment = taLeftJustify
          end
          object SEEjercicioArt: TSpinEdit
            Left = 360
            Top = 117
            Width = 51
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 14
            Value = 0
            Visible = False
          end
          object CHKConventas: TLFCheckBox
            Left = 414
            Top = 164
            Width = 150
            Height = 17
            Caption = 'Comparaci'#243'n con Ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 436
    Top = 6
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
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
    Left = 404
    Top = 8
  end
end
