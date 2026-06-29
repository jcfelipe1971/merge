inherited FPregArtTarifasDetallado: TFPregArtTarifasDetallado
  Left = 385
  Top = 178
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Precios por Tarifa Detallado'
  ClientHeight = 425
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 425
    inherited TBMain: TLFToolBar
      Width = 592
      EdgeBorders = [ebTop, ebBottom]
      ParentShowHint = False
      ShowHint = True
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object BExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
    end
    object PNLFiltros: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 389
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 67
        Align = alTop
        Caption = 'Almac'#233'n'
        TabOrder = 0
        object LBLAlmacenDesde: TLFLabel
          Left = 28
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Label8: TLFLabel
          Left = 31
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFAlmacen_D: TLFEditFind2000
          Left = 64
          Top = 15
          Width = 45
          Height = 21
          TabOrder = 0
          OnChange = EFAlmacen_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmacen_H: TLFEditFind2000
          Left = 64
          Top = 37
          Width = 45
          Height = 21
          TabOrder = 1
          OnChange = EFAlmacen_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEAlmacenDesde: TLFDbedit
          Left = 110
          Top = 15
          Width = 270
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxAlmacen_Desde
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
        object DBEAlmacenHasta: TLFDbedit
          Left = 110
          Top = 37
          Width = 270
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxAlmacen_Hasta
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
        Top = 67
        Width = 592
        Height = 67
        Align = alTop
        Caption = ' Familias '
        TabOrder = 1
        object Label5: TLFLabel
          Left = 28
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Label6: TLFLabel
          Left = 31
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFFamilia_H: TLFEditFind2000
          Left = 64
          Top = 37
          Width = 45
          Height = 21
          TabOrder = 3
          OnChange = EFFamilia_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
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
          OnBusqueda = EFFamilia_HBusqueda
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFFamilia_D: TLFEditFind2000
          Left = 64
          Top = 15
          Width = 45
          Height = 21
          TabOrder = 2
          OnChange = EFFamilia_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
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
          OnBusqueda = EFFamilia_DBusqueda
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEFamiliaDesde: TLFDbedit
          Left = 110
          Top = 15
          Width = 270
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxFamilia_Desde
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEFamiliaHasta: TLFDbedit
          Left = 110
          Top = 37
          Width = 270
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxFamilia_Hasta
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
      end
      object GBTarifas: TGroupBox
        Left = 0
        Top = 134
        Width = 592
        Height = 67
        Align = alTop
        Caption = ' Tarifas '
        TabOrder = 2
        object Label3: TLFLabel
          Left = 28
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Label4: TLFLabel
          Left = 31
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFTarifa_Desde: TLFEditFind2000
          Left = 64
          Top = 15
          Width = 45
          Height = 21
          TabOrder = 2
          OnChange = EFTarifa_DesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = True
          CampoNum = 'TARIFA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_TARIFAS_C'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETarifaDesde: TLFDbedit
          Left = 110
          Top = 15
          Width = 270
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxTarifa_Desde
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBETarifaHasta: TLFDbedit
          Left = 110
          Top = 37
          Width = 270
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxTarifa_Hasta
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
        object EFTarifa_Hasta: TLFEditFind2000
          Left = 64
          Top = 37
          Width = 45
          Height = 21
          TabOrder = 3
          OnChange = EFTarifa_HastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TARIFA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_TARIFAS_C'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object GBArticulos: TGroupBox
        Left = 0
        Top = 201
        Width = 592
        Height = 67
        Align = alTop
        Caption = ' Art'#237'culos '
        TabOrder = 3
        object Label1: TLFLabel
          Left = 28
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Label2: TLFLabel
          Left = 31
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArt_Desde: TLFEditFind2000
          Left = 64
          Top = 15
          Width = 108
          Height = 21
          TabOrder = 0
          OnChange = EFArt_DesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = True
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArt_DesdeBusqueda
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEArticuloDesde: TLFDbedit
          Left = 173
          Top = 15
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxArt_Desde
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
        object EFArt_Hasta: TLFEditFind2000
          Left = 64
          Top = 37
          Width = 108
          Height = 21
          TabOrder = 1
          OnChange = EFArt_HastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
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
          OnBusqueda = EFArt_HastaBusqueda
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEArticuloHasta: TLFDbedit
          Left = 173
          Top = 37
          Width = 402
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxArt_Hasta
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
      object GBDisponibilidad: TGroupBox
        Left = 0
        Top = 268
        Width = 592
        Height = 37
        Align = alTop
        TabOrder = 4
        object CBDisponibilidad: TLFCheckBox
          Left = 64
          Top = 12
          Width = 90
          Height = 17
          Caption = 'Disponibilidad'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          OnClick = CBDisponibilidadClick
          Alignment = taLeftJustify
        end
        object DBEDisponibilidad: TLFDbedit
          Left = 206
          Top = 10
          Width = 182
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstTarifas.DSxDisponibilidad
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
        object EFDisponibilidad: TLFEditFind2000
          Left = 160
          Top = 10
          Width = 45
          Height = 21
          TabOrder = 1
          OnChange = EFDisponibilidadChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'DISPONIBILIDAD'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_ART_DISPONIBILIDAD'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object PNLPieFiltros: TLFPanel
        Left = 0
        Top = 305
        Width = 592
        Height = 84
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 5
        object RGPaginado: TRadioGroup
          Left = 0
          Top = 0
          Width = 312
          Height = 84
          Align = alLeft
          Caption = ' Paginado por '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sin paginar'
            'Tarifas'
            'Familias')
          TabOrder = 0
        end
        object PNLPieFiltrosRight: TLFPanel
          Left = 312
          Top = 0
          Width = 280
          Height = 84
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object RGOrdenado: TRadioGroup
            Left = 0
            Top = 0
            Width = 280
            Height = 38
            Align = alTop
            Caption = ' Ordenado por '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'C'#243'digos'
              'T'#237'tulos')
            TabOrder = 0
          end
          object GBPrecioCero: TGroupBox
            Left = 0
            Top = 38
            Width = 280
            Height = 46
            Align = alClient
            TabOrder = 1
            object CBArtConPrecioCero: TLFCheckBox
              Left = 9
              Top = 9
              Width = 250
              Height = 17
              Caption = 'Mostrar Art'#237'culos con Precio cero'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBArticulosBaja: TLFCheckBox
              Left = 9
              Top = 25
              Width = 250
              Height = 18
              Caption = 'Incluir Articulos de Baja'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
            end
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 444
    Top = 4
    inherited AImprimir: TAction
      Hint = 'Imprimir'
    end
    inherited APrev: TAction
      Hint = 'Visualizar'
      ImageIndex = 19
    end
    inherited ASalir: TAction
      Hint = 'Salir'
    end
    inherited ARecargar: TAction
      ImageIndex = 39
      OnExecute = ARecargarExecute
    end
  end
end
