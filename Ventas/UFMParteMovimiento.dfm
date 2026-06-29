inherited FMParteMovimiento: TFMParteMovimiento
  Width = 800
  Height = 500
  ActiveControl = DEDesdeFecha
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Parte de Movimientos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 447
    inherited TBMain: TLFToolBar
      Width = 786
      inherited EPMain: THYMEditPanel
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 41
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBRecalcularParteMovimientos: TToolButton
        Left = 49
        Top = 0
        Action = ARecalcularParteMovimientos
      end
      object TBEsportacionExcel: TToolButton
        Left = 72
        Top = 0
        Action = AExportacionExcel
      end
      object TBImprimir: TToolButton
        Left = 95
        Top = 0
        Action = AImprimir
      end
      object PNLProgreso: TLFPanel
        Left = 118
        Top = 0
        Width = 496
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object LProgreso: TLabel
          Left = 154
          Top = 4
          Width = 42
          Height = 13
          Caption = 'Progreso'
          Layout = tlCenter
        end
        object ProgressBar: TProgressBar
          Left = 0
          Top = 0
          Width = 150
          Height = 22
          Align = alLeft
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 153
      Width = 786
      Height = 292
      ActivePage = TSParteMovimiento
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSParteMovimiento: TTabSheet
        Caption = 'Parte de Movimientos'
        object sgParteMovimientos: TStringGrid
          Left = 0
          Top = 0
          Width = 778
          Height = 264
          Align = alClient
          DefaultRowHeight = 18
          FixedCols = 4
          RowCount = 3
          FixedRows = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDrawCell = sgDrawCell
          RowHeights = (
            18
            18
            18)
        end
      end
    end
    object PNLFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 786
      Height = 125
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LFechas: TLFLabel
        Left = 48
        Top = 12
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fechas'
      end
      object LProveedor: TLFLabel
        Left = 34
        Top = 55
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Proveedor'
      end
      object LSerie: TLFLabel
        Left = 59
        Top = 77
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object LArticulos: TLFLabel
        Left = 43
        Top = 33
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Articulos'
      end
      object LSerieReposicion: TLFLabel
        Left = 3
        Top = 99
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie Reposicion'
      end
      object DEDesdeFecha: TLFDateEdit
        Left = 88
        Top = 8
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DEHastaFecha: TLFDateEdit
        Left = 240
        Top = 8
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object EProveedor: TLFEdit
        Left = 210
        Top = 52
        Width = 551
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 6
      end
      object ESerie: TLFEdit
        Left = 210
        Top = 74
        Width = 551
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 7
      end
      object EFProveedor: TLFEditFind2000
        Left = 88
        Top = 52
        Width = 121
        Height = 21
        TabOrder = 4
        OnChange = EFProveedorChange
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PROVEEDORES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSerie: TLFEditFind2000
        Left = 88
        Top = 74
        Width = 121
        Height = 21
        TabOrder = 5
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArtDesde: TLFEditFind2000
        Left = 88
        Top = 30
        Width = 121
        Height = 21
        TabOrder = 2
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
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
        OnBusqueda = EFArtDesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArtHasta: TLFEditFind2000
        Left = 240
        Top = 30
        Width = 121
        Height = 21
        TabOrder = 3
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
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
        OnBusqueda = EFArtHastaBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object ESerieReposicion: TLFEdit
        Left = 210
        Top = 96
        Width = 551
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 8
      end
      object EFSerieReposicion: TLFEditFind2000
        Left = 88
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 9
        OnChange = EFSerieReposicionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 790
  end
  inherited CEMain: TControlEdit
    Left = 600
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 640
    Top = 0
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
    Left = 688
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Calculos'
      Caption = 'Calculos'
      ImageIndex = 3
    end
    object ARecalcularParteMovimientos: TAction
      Category = 'Calculos'
      Caption = 'Recalcular movimientos'
      ImageIndex = 3
      OnExecute = ARecalcularParteMovimientosExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Exportacion'
      Caption = 'Exportaciones'
      ImageIndex = 14
    end
    object AExportacionExcel: TAction
      Category = 'Exportacion'
      Caption = 'Exportaci'#243'n a Excel'
      ImageIndex = 36
      OnExecute = AExportacionExcelExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Imprimir'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AImprimir: TAction
      Category = 'Imprimir'
      Caption = 'Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object ADisenyar: TAction
      Category = 'Imprimir'
      Caption = 'Dise'#241'ar Informe'
      Hint = 'Dise'#241'ar Informe'
      ImageIndex = 77
      OnExecute = ADisenyarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFSerieReposicion.Text'
      'EFProveedor.Text')
    Left = 728
    Top = 0
  end
end
