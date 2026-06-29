inherited FPregPropPedidos: TFPregPropPedidos
  Left = 568
  Top = 337
  Caption = 'Propuesta de Pedidos'
  ClientHeight = 210
  ClientWidth = 469
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBMain: TLFToolBar
    Width = 469
    TabOrder = 1
    object TButtConfigurar: TToolButton
      Left = 288
      Top = 0
      Action = AConfigurar
    end
  end
  inherited PCMain: TLFPageControl
    Width = 469
    Height = 174
    ActivePage = TSFamilia
    TabIndex = 0
    TabOrder = 0
    object TSFamilia: TTabSheet
      Caption = '&Familia'
      object GBFamilia: TGroupBox
        Left = 0
        Top = 0
        Width = 461
        Height = 73
        Align = alTop
        Caption = 'Familia'
        TabOrder = 0
        object LDesdeFamilia: TLFLabel
          Left = 36
          Top = 28
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFamilia: TLFLabel
          Left = 223
          Top = 28
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesdeFam: TEditFind2000
          Left = 72
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
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
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHastaFam: TEditFind2000
          Left = 256
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 1
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
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object GBAlmacenFamilia: TGroupBox
        Left = 0
        Top = 73
        Width = 461
        Height = 72
        Align = alClient
        Caption = 'Almacen'
        TabOrder = 1
        object LDesdeAlmacenFam: TLFLabel
          Left = 36
          Top = 28
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaAlmacenFam: TLFLabel
          Left = 223
          Top = 28
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesdeAlmFam: TEditFind2000
          Left = 72
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
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
        object EFHastaAlmFam: TEditFind2000
          Left = 256
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 1
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
        object CBTodosLosAlmFam: TLFCheckBox
          Left = 152
          Top = 48
          Width = 129
          Height = 17
          Caption = 'Todos los Almacenes'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          OnClick = CBTodosLosAlmFamClick
          Alignment = taLeftJustify
        end
      end
    end
    object TSProveedor: TTabSheet
      Caption = '&Proveedor'
      ImageIndex = 1
      object GBAlmacenProveedor: TGroupBox
        Left = 0
        Top = 73
        Width = 461
        Height = 72
        Align = alClient
        Caption = 'Almacen'
        TabOrder = 1
        object LDesdeAlmacenProv: TLFLabel
          Left = 36
          Top = 28
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaAlmacenProv: TLFLabel
          Left = 223
          Top = 28
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesdeAlmProv: TEditFind2000
          Left = 72
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
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
        object EFHastaAlmProv: TEditFind2000
          Left = 256
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 1
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
        object CBTodosLosAlmProv: TLFCheckBox
          Left = 152
          Top = 48
          Width = 129
          Height = 17
          Caption = 'Todos los Almacenes'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          OnClick = CBTodosLosAlmProvClick
          Alignment = taLeftJustify
        end
      end
      object GBProveedor: TGroupBox
        Left = 0
        Top = 0
        Width = 461
        Height = 73
        Align = alTop
        Caption = 'Proveedor'
        TabOrder = 0
        object LDesdeProveedor: TLFLabel
          Left = 36
          Top = 28
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaProveedor: TLFLabel
          Left = 223
          Top = 28
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesdeProv: TEditFind2000
          Left = 72
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
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
          Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHastaProv: TEditFind2000
          Left = 256
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 1
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
          Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
