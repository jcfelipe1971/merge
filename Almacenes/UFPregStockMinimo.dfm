inherited FPregStockMinimo: TFPregStockMinimo
  Left = 403
  Top = 269
  HelpContext = 139
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Stock bajo minimos'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
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
      end
    end
    inherited PBListado: TProgressBar
      Top = 327
      Width = 592
      TabOrder = 2
    end
    object PNLStockMin: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 291
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBArticulo: TGroupBox
        Left = 0
        Top = 151
        Width = 592
        Height = 77
        Align = alTop
        Caption = 'Articulo'
        TabOrder = 2
        object LDesdeArticulo: TLFLabel
          Left = 24
          Top = 24
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaArticulo: TLFLabel
          Left = 27
          Top = 46
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFArticulo_D: TLFEditFind2000
          Left = 60
          Top = 20
          Width = 108
          Height = 21
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
          Top = 42
          Width = 108
          Height = 21
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
          Top = 20
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
          Top = 42
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
        Top = 70
        Width = 592
        Height = 81
        Align = alTop
        Caption = 'Familia'
        TabOrder = 1
        object LDesdeFamilia: TLFLabel
          Left = 86
          Top = 26
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFamilia: TLFLabel
          Left = 89
          Top = 48
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFFamilia_H: TLFEditFind2000
          Left = 123
          Top = 45
          Width = 45
          Height = 21
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
          Top = 23
          Width = 45
          Height = 21
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
          Top = 23
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
          Top = 45
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
        Width = 592
        Height = 70
        Align = alTop
        TabOrder = 0
        object LAlmacen: TLFLabel
          Left = 77
          Top = 22
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almacen'
        end
        object EFSelAlmacen: TLFEditFind2000
          Left = 123
          Top = 19
          Width = 45
          Height = 21
          MaxLength = 3
          TabOrder = 0
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
          Top = 19
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
          Top = 44
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
      end
      object GBDatos: TGroupBox
        Left = 0
        Top = 218
        Width = 592
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
        object DTPFechaListado: TLFDateEdit
          Left = 169
          Top = 16
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
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
    Left = 496
    Top = 4
  end
end
