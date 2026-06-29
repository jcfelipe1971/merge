inherited FMCalculaStockMinMax: TFMCalculaStockMinMax
  Left = 248
  Top = 271
  Caption = 'Calcula Stock M'#237'nimo y Maximo'
  ClientHeight = 376
  ClientWidth = 421
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 421
    Height = 352
    inherited TBMain: TLFToolBar
      Width = 417
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        ImageIndex = 1
        Style = tbsSeparator
      end
      object BCalcular: TToolButton
        Left = 41
        Top = 0
        Action = ACalcular
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 417
      Height = 322
      ActivePage = TSCalculoStockMinMax2
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCalculoStockMinMax1: TTabSheet
        Caption = 'Calculos Stock Min-Max'
        object PNLDatos: TLFPanel
          Left = 0
          Top = 0
          Width = 409
          Height = 294
          Align = alClient
          TabOrder = 0
          DesignSize = (
            409
            294)
          object LDesdeAlmacen: TLFLabel
            Left = 17
            Top = 12
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Almac'#233'n'
          end
          object LHastaAlmancen: TLFLabel
            Left = 20
            Top = 33
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Almac'#233'n'
          end
          object LMesInicial: TLFLabel
            Left = 43
            Top = 56
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mes inicial'
          end
          object LMeses: TLFLabel
            Left = 61
            Top = 78
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Meses'
          end
          object EFDesdeAlmacen: TLFEditFind2000
            Left = 96
            Top = 8
            Width = 57
            Height = 21
            TabOrder = 0
            OnChange = EFDesdeAlmacenChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaAlmacen: TLFEditFind2000
            Left = 96
            Top = 30
            Width = 57
            Height = 21
            TabOrder = 1
            OnChange = EFHastaAlmacenChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EdDesdeAlmacen: TLFEdit
            Left = 154
            Top = 8
            Width = 250
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 2
          end
          object EdHastaAlmacen: TLFEdit
            Left = 154
            Top = 30
            Width = 250
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
          end
          object EdMesInicial: TLFEdit
            Left = 96
            Top = 52
            Width = 57
            Height = 21
            TabOrder = 4
            Text = '1'
          end
          object EdMeses: TLFEdit
            Left = 96
            Top = 74
            Width = 57
            Height = 21
            TabOrder = 5
            Text = '3'
          end
        end
      end
      object TSCalculoStockMinMax2: TTabSheet
        Caption = 'Calculos Stock Min-Max'
        ImageIndex = 1
        DesignSize = (
          409
          294)
        object LAlmacenDesde2: TLFLabel
          Left = 17
          Top = 12
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Almac'#233'n'
        end
        object LAlmacenHasta2: TLFLabel
          Left = 20
          Top = 33
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Almac'#233'n'
        end
        object LArticuloDesde: TLFLabel
          Left = 23
          Top = 108
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Articulo'
        end
        object LArticuloHasta: TLFLabel
          Left = 26
          Top = 129
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Articulo'
        end
        object LFamiliaDesde: TLFLabel
          Left = 26
          Top = 156
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Familia'
        end
        object LFamiliaHasta: TLFLabel
          Left = 29
          Top = 177
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Familia'
        end
        object LPeriodoDesde: TLFLabel
          Left = 22
          Top = 203
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Periodo'
        end
        object LPeriodoHasta: TLFLabel
          Left = 25
          Top = 224
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Periodo'
        end
        object LEFactorStockMinimo: TLFLabel
          Left = 8
          Top = 250
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Factor Stock Min.'
        end
        object LEFactorStockMaximo: TLFLabel
          Left = 5
          Top = 272
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Factor Stock Max.'
        end
        object LCanalDesde: TLFLabel
          Left = 31
          Top = 60
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Canal'
        end
        object LanalHasta: TLFLabel
          Left = 34
          Top = 81
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Canal'
        end
        object EFAlmacenDesde2: TLFEditFind2000
          Left = 96
          Top = 8
          Width = 57
          Height = 21
          TabOrder = 0
          OnChange = EFAlmacenDesde2Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmacenHasta2: TLFEditFind2000
          Left = 96
          Top = 30
          Width = 57
          Height = 21
          TabOrder = 1
          OnChange = EFAlmacenHasta2Change
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacenDesde2: TLFEdit
          Left = 154
          Top = 8
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 4
        end
        object EAlmacenHasta2: TLFEdit
          Left = 154
          Top = 30
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 5
        end
        object EFArticuloDesde: TLFEditFind2000
          Left = 96
          Top = 104
          Width = 57
          Height = 21
          TabOrder = 6
          OnChange = EFArticuloDesdeChange
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
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFArticuloHasta: TLFEditFind2000
          Left = 96
          Top = 126
          Width = 57
          Height = 21
          TabOrder = 7
          OnChange = EFArticuloHastaChange
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
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EArticuloDesde: TLFEdit
          Left = 154
          Top = 104
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 8
        end
        object EArticuloHasta: TLFEdit
          Left = 154
          Top = 126
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 9
        end
        object EFFamiliaDesde: TLFEditFind2000
          Left = 96
          Top = 152
          Width = 57
          Height = 21
          TabOrder = 10
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
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFFamiliaHasta: TLFEditFind2000
          Left = 96
          Top = 174
          Width = 57
          Height = 21
          TabOrder = 11
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
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFamiliaDesde: TLFEdit
          Left = 154
          Top = 152
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 12
        end
        object EFamiliaHasta: TLFEdit
          Left = 154
          Top = 174
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 13
        end
        object EFPeriodoDesde: TLFEditFind2000
          Left = 96
          Top = 199
          Width = 57
          Height = 21
          TabOrder = 14
          OnChange = EFPeriodoDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PERIODO')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFPeriodoHasta: TLFEditFind2000
          Left = 96
          Top = 221
          Width = 57
          Height = 21
          TabOrder = 15
          OnChange = EFPeriodoHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PERIODO')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFactorStockMinimo: TLFEdit
          Left = 96
          Top = 246
          Width = 57
          Height = 21
          TabOrder = 16
        end
        object EFactorStockMaximo: TLFEdit
          Left = 96
          Top = 268
          Width = 57
          Height = 21
          TabOrder = 17
        end
        object EPeriodoHasta: TLFEdit
          Left = 154
          Top = 221
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 18
        end
        object EPeriodoDesde: TLFEdit
          Left = 154
          Top = 199
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 19
        end
        object EFCanalDesde: TLFEditFind2000
          Left = 96
          Top = 56
          Width = 57
          Height = 21
          TabOrder = 2
          OnChange = EFCanalDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCanalHasta: TLFEditFind2000
          Left = 96
          Top = 78
          Width = 57
          Height = 21
          TabOrder = 3
          OnChange = EFCanalHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ECanalDesde: TLFEdit
          Left = 154
          Top = 56
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 20
        end
        object ECanalHasta: TLFEdit
          Left = 154
          Top = 78
          Width = 250
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 21
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 352
    Width = 421
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    Top = 8
    object ACalcular: TAction
      Category = 'Procesos'
      Caption = 'Calcular'
      Hint = 'Calcula Stock Minimo y Maximo'
      ImageIndex = 3
      OnExecute = ACalcularExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFactorStockMaximo.Text'
      'EFactorStockMinimo.Text')
    Left = 384
    Top = 8
  end
end
