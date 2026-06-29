inherited FPregEtiArticulosKri: TFPregEtiArticulosKri
  Left = 340
  Top = 201
  Caption = 'Listado de Etiquetas de Articulos'
  ClientHeight = 237
  ClientWidth = 595
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 595
    Height = 237
    inherited TBMain: TLFToolBar
      Width = 595
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfiguracion
      end
    end
    inherited PBListado: TProgressBar
      Top = 221
      Width = 595
      TabOrder = 7
    end
    object RBCatidad: TRadioGroup
      Left = 0
      Top = 176
      Width = 595
      Height = 45
      Align = alClient
      Caption = 'Cantidad'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Stock Actual'
        'Cantidad')
      TabOrder = 1
      OnClick = RBCatidadClick
    end
    object GBFamilias: TGroupBox
      Left = 0
      Top = 106
      Width = 595
      Height = 70
      Align = alTop
      Caption = 'Familias'
      TabOrder = 2
      object LDesdeFamilia: TLFLabel
        Left = 80
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFamilia: TLFLabel
        Left = 83
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFFamiliaDesde: TLFEditFind2000
        Left = 115
        Top = 16
        Width = 55
        Height = 21
        TabOrder = 0
        OnChange = EFFamiliaDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'familia')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFamiliaHasta: TLFEditFind2000
        Left = 115
        Top = 38
        Width = 55
        Height = 21
        TabOrder = 1
        OnChange = EFFamiliaHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          '')
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'familia')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFamiliaDesde: TLFEdit
        Left = 171
        Top = 16
        Width = 412
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 2
      end
      object EFamiliaHasta: TLFEdit
        Left = 171
        Top = 38
        Width = 412
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
    end
    object GBArticulos: TGroupBox
      Left = 0
      Top = 36
      Width = 595
      Height = 70
      Align = alTop
      Caption = 'Art'#237'culos'
      TabOrder = 3
      object LDesdeArticulo: TLFLabel
        Left = 27
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 30
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArtDesde: TLFEditFind2000
        Left = 62
        Top = 16
        Width = 108
        Height = 21
        TabOrder = 0
        OnChange = EFArtDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = True
        CampoNum = 'BARRAS'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_ARTICULOS_BARRAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'barras')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArtHasta: TLFEditFind2000
        Left = 62
        Top = 38
        Width = 108
        Height = 21
        TabOrder = 1
        OnChange = EFArtHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'BARRAS'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_ARTICULOS_BARRAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'barras')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloDesde: TLFEdit
        Left = 171
        Top = 16
        Width = 412
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 2
      end
      object EArticuloHasta: TLFEdit
        Left = 171
        Top = 38
        Width = 412
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
    end
    object EFAlmacen: TLFEditFind2000
      Left = 96
      Top = 201
      Width = 65
      Height = 21
      TabOrder = 4
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
      SalirSiNoExiste = True
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object CBMustraPVP: TLFCheckBox
      Left = 464
      Top = 204
      Width = 97
      Height = 17
      Caption = 'Muestra PVP'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      OnClick = CBMustraPVPClick
      Alignment = taLeftJustify
    end
    object ECantidad: TLFEdit
      Left = 272
      Top = 202
      Width = 41
      Height = 21
      TabOrder = 6
      Text = '1'
    end
  end
  inherited ALMain: TLFActionList
    Left = 252
    Top = 38
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfiguracion: TAction
      Caption = 'Conf. Rapida'
      ImageIndex = 77
      OnExecute = AConfiguracionExecute
    end
  end
end
