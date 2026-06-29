inherited ZFPregStockMinimo: TZFPregStockMinimo
  Left = 331
  Top = 211
  HelpContext = 139
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Stock bajo minimos (TyC)'
  ClientHeight = 415
  ClientWidth = 601
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 601
    Height = 415
    inherited TBMain: TLFToolBar
      Width = 601
      ButtonWidth = 85
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtImprimir: TToolButton
        Left = 85
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 170
      end
      inherited TButtSalir: TToolButton
        Left = 255
      end
      object TButtConfiguracionRapida: TToolButton
        Left = 340
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtMultiCanal: TToolButton
        Left = 425
        Top = 0
        Action = AMultiSeleccion
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
    end
    inherited PBListado: TProgressBar
      Top = 399
      Width = 601
      TabOrder = 2
    end
    object PNLStockMin: TLFPanel
      Left = 0
      Top = 36
      Width = 601
      Height = 363
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBArticulo: TGroupBox
        Left = 0
        Top = 154
        Width = 601
        Height = 74
        Align = alTop
        Caption = 'Art'#237'culo'
        TabOrder = 2
        object LDesdeArticulo: TLFLabel
          Left = 24
          Top = 21
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaArticulo: TLFLabel
          Left = 27
          Top = 43
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticulo_D: TLFEditFind2000
          Left = 60
          Top = 17
          Width = 108
          Height = 21
          MaxLength = 15
          TabOrder = 0
          OnChange = EFArticulo_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_DBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EFArticulo_H: TLFEditFind2000
          Left = 60
          Top = 39
          Width = 108
          Height = 21
          MaxLength = 15
          TabOrder = 1
          OnChange = EFArticulo_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticulo_HBusqueda
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EArticuloDesde: TLFEdit
          Left = 169
          Top = 17
          Width = 402
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
        object EArticuloHasta: TLFEdit
          Left = 169
          Top = 39
          Width = 402
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
        Top = 81
        Width = 601
        Height = 73
        Align = alTop
        Caption = 'Familia'
        TabOrder = 1
        object LDesdeFamilia: TLFLabel
          Left = 86
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFamilia: TLFLabel
          Left = 89
          Top = 42
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFFamilia_H: TLFEditFind2000
          Left = 123
          Top = 39
          Width = 45
          Height = 21
          MaxLength = 5
          TabOrder = 1
          OnChange = EFFamilia_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            '')
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamilia_HBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EFFamilia_D: TLFEditFind2000
          Left = 123
          Top = 17
          Width = 45
          Height = 21
          MaxLength = 5
          TabOrder = 0
          OnChange = EFFamilia_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            '')
          CampoNum = 'FAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFamilia_DBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = EF2000Filtra
        end
        object EFamiliaDesde: TLFEdit
          Left = 169
          Top = 17
          Width = 270
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
        object EFamiliaHasta: TLFEdit
          Left = 169
          Top = 39
          Width = 270
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
      object GBAlmacen: TGroupBox
        Left = 0
        Top = 0
        Width = 601
        Height = 81
        Align = alTop
        Caption = 'Almacen'
        TabOrder = 0
        object LAlmacen: TLFLabel
          Left = 77
          Top = 14
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almac'#233'n'
        end
        object LAlmacen2: TLFLabel
          Left = 64
          Top = 54
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = '2'#186' Almac'#233'n'
        end
        object EFSelAlmacen: TLFEditFind2000
          Left = 123
          Top = 11
          Width = 45
          Height = 21
          MaxLength = 3
          TabOrder = 0
          Text = 'EFSelAlmacen'
          OnChange = EFSelAlmacenChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
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
          Entorno = EF2000Filtra
        end
        object EAlmacenDesc: TLFEdit
          Left = 169
          Top = 11
          Width = 270
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object CBStockVirtual: TLFCheckBox
          Left = 122
          Top = 33
          Width = 163
          Height = 17
          Caption = 'Basarse en el stock virtual'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object EFSelAlmacen2: TLFEditFind2000
          Left = 123
          Top = 51
          Width = 45
          Height = 21
          MaxLength = 3
          TabOrder = 3
          Text = 'EFSelAlmacen2'
          OnChange = EFSelAlmacen2Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
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
          Entorno = EF2000Filtra
        end
        object EAlmacen2Desc: TLFEdit
          Left = 169
          Top = 51
          Width = 270
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
      end
      object GBDatos: TGroupBox
        Left = 0
        Top = 290
        Width = 601
        Height = 73
        Align = alBottom
        TabOrder = 3
        object LBLFechaListado: TLFLabel
          Left = 99
          Top = 20
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha listado'
        end
        object LBLComentario: TLFLabel
          Left = 109
          Top = 42
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comentario'
        end
        object EComentario: TLFEdit
          Left = 169
          Top = 38
          Width = 276
          Height = 21
          MaxLength = 35
          TabOrder = 1
        end
        object DTPFechaListado: TDateEdit
          Left = 169
          Top = 16
          Width = 87
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object GBCanal: TGroupBox
        Left = 0
        Top = 228
        Width = 601
        Height = 62
        Align = alClient
        Caption = ' Canal '
        TabOrder = 4
        object LDesdeCanal: TLFLabel
          Left = 84
          Top = 19
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaCanal: TLFLabel
          Left = 87
          Top = 39
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFCanalD: TLFEditFind2000
          Left = 120
          Top = 15
          Width = 48
          Height = 21
          TabOrder = 0
          OnChange = EFCanalDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCanalH: TLFEditFind2000
          Left = 120
          Top = 37
          Width = 48
          Height = 21
          TabOrder = 1
          OnChange = EFCanalHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object ECanalD: TLFEdit
          Left = 169
          Top = 15
          Width = 173
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
        object ECanalH: TLFEdit
          Left = 169
          Top = 37
          Width = 173
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
  inherited ALMain: TLFActionList
    Left = 510
    Top = 58
    inherited ASalir: TAction
      Tag = 2
    end
    inherited ARecargar: TAction
      Tag = 2
      OnExecute = ARecargarExecute
    end
    object AMultiSeleccion: TAction
      Caption = '&Multi-Selecci'#243'n'
      Hint = 'Multi-Selecci'#243'n'
      ImageIndex = 132
      OnExecute = AMultiSeleccionExecute
    end
  end
  object EF2000Filtra: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 532
    Top = 12
  end
end
