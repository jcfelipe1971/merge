inherited FPregControlUbicaciones: TFPregControlUbicaciones
  Left = 643
  Top = 309
  Caption = 'Listado Ubicaciones'
  ClientHeight = 312
  ClientWidth = 448
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 448
    Height = 312
    inherited TBMain: TLFToolBar
      Width = 448
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 247
      Width = 448
      TabOrder = 5
    end
    object RGTipoListado: TRadioGroup
      Left = 0
      Top = 263
      Width = 448
      Height = 49
      Align = alBottom
      Caption = 'Tipo Listado'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Articulos por Ubicacion'
        'Ubicaciones por Articulo')
      TabOrder = 1
    end
    object GBUbicaciones: TGroupBox
      Left = 0
      Top = 187
      Width = 448
      Height = 60
      Align = alClient
      Caption = ' Ubicaciones '
      TabOrder = 2
      object LDesdeUbicacion: TLFLabel
        Left = 38
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaUbicacion: TLFLabel
        Left = 41
        Top = 45
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFDesdeUbicacion: TLFEditFind2000
        Left = 72
        Top = 20
        Width = 49
        Height = 21
        TabOrder = 0
        OnChange = EFDesdeUbicacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_UBICACION'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaUbicacion: TLFEditFind2000
        Left = 72
        Top = 41
        Width = 49
        Height = 21
        TabOrder = 1
        OnChange = EFHastaUbicacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_UBICACION'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeUbicacion: TLFEdit
        Left = 122
        Top = 20
        Width = 319
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object EHastaUbicacion: TLFEdit
        Left = 122
        Top = 41
        Width = 319
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object GBArticulos: TGroupBox
      Left = 0
      Top = 36
      Width = 448
      Height = 71
      Align = alTop
      Caption = 'Art'#237'culos'
      TabOrder = 3
      object LDesdeArticulo: TLFLabel
        Left = 38
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LhastaArticulo: TLFLabel
        Left = 41
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFDesdeArticulo: TLFEditFind2000
        Left = 72
        Top = 16
        Width = 89
        Height = 21
        TabOrder = 0
        OnChange = EFDesdeArticuloChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaArticulo: TLFEditFind2000
        Left = 72
        Top = 37
        Width = 89
        Height = 21
        TabOrder = 1
        OnChange = EFHastaArticuloChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeArticulo: TLFEdit
        Left = 162
        Top = 16
        Width = 279
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object EHastaArticulo: TLFEdit
        Left = 162
        Top = 37
        Width = 279
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object GBAlmacenes: TGroupBox
      Left = 0
      Top = 107
      Width = 448
      Height = 80
      Align = alTop
      Caption = 'Almacenes'
      TabOrder = 4
      object LDesdeAlmacen: TLFLabel
        Left = 38
        Top = 26
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaAlmacen: TLFLabel
        Left = 41
        Top = 48
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFDesdeAlmacen: TLFEditFind2000
        Left = 72
        Top = 22
        Width = 49
        Height = 21
        TabOrder = 0
        OnChange = EFDesdeAlmacenChange
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
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaAlmacen: TLFEditFind2000
        Left = 72
        Top = 43
        Width = 49
        Height = 21
        TabOrder = 1
        OnChange = EFHastaAlmacenChange
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
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeAlmacen: TLFEdit
        Left = 122
        Top = 22
        Width = 319
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object EHastaAlmacen: TLFEdit
        Left = 122
        Top = 43
        Width = 319
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 380
    Top = 6
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
