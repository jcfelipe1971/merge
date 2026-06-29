inherited FMExportacionHelios: TFMExportacionHelios
  Left = 289
  Top = 184
  Width = 1126
  Height = 480
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Exportaci'#243'n Helios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1116
    Height = 427
    inherited TBMain: TLFToolBar
      Width = 1112
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButCalcular: TToolButton
        Left = 33
        Top = 0
        Action = ACalcular
      end
      object TSep2: TToolButton
        Left = 56
        Top = 0
        Width = 8
        ImageIndex = 37
        Style = tbsSeparator
      end
      object TButtExportar: TToolButton
        Left = 64
        Top = 0
        Action = AExportar
      end
    end
    object PNLCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 1112
      Height = 136
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LRutaExportacion: TLFLabel
        Left = 18
        Top = 5
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ruta Exportaci'#243'n'
      end
      object LAlmacen: TLFLabel
        Left = 57
        Top = 49
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Almacen'
      end
      object LCodigoAlmacen: TLFLabel
        Left = 567
        Top = 5
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Codigo Almacen'
        Visible = False
      end
      object LDesdeArticulo: TLFLabel
        Left = 29
        Top = 93
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Articulo'
      end
      object LDesdeFecha: TLFLabel
        Left = 70
        Top = 71
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object LHastaArticulo: TLFLabel
        Left = 32
        Top = 119
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Articulo'
      end
      object LProveedor: TLFLabel
        Left = 50
        Top = 27
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Proveedor'
      end
      object LSeparador: TLFLabel
        Left = 577
        Top = 27
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Separador'
        Visible = False
      end
      object DEFecha: TLFDateEdit
        Left = 104
        Top = 67
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object DERutaExportacion: TDirectoryEdit
        Left = 104
        Top = 1
        Width = 452
        Height = 21
        DialogOptions = [sdAllowCreate]
        NumGlyphs = 1
        TabOrder = 0
        OnExit = DERutaExportacionExit
      end
      object ECodigoAlmacen: TLFEdit
        Left = 648
        Top = 1
        Width = 121
        Height = 21
        TabOrder = 12
        Visible = False
      end
      object EFAlmacen: TLFEditFind2000
        Left = 104
        Top = 45
        Width = 121
        Height = 21
        TabOrder = 2
        OnChange = EFAlmacenChange
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
      object EFProveedor: TLFEditFind2000
        Left = 104
        Top = 23
        Width = 121
        Height = 21
        TabOrder = 1
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
      object EProveedor: TLFEdit
        Left = 226
        Top = 23
        Width = 330
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 6
      end
      object EFDesdeArticulo: TLFEditFind2000
        Left = 104
        Top = 89
        Width = 121
        Height = 21
        TabOrder = 4
        OnChange = EFDesdeArticuloChange
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
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaArticulo: TLFEditFind2000
        Left = 104
        Top = 111
        Width = 121
        Height = 21
        TabOrder = 5
        OnChange = EFHastaArticuloChange
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
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EAlmacen: TLFEdit
        Left = 226
        Top = 45
        Width = 330
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 7
      end
      object EDesdeArticulo: TLFEdit
        Left = 226
        Top = 89
        Width = 330
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 8
      end
      object EHastaArticulo: TLFEdit
        Left = 226
        Top = 111
        Width = 330
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 9
      end
      object ESeparador: TLFEdit
        Left = 630
        Top = 23
        Width = 33
        Height = 21
        TabOrder = 10
        Visible = False
      end
      object CBEntrecomillado: TLFCheckBox
        Left = 664
        Top = 25
        Width = 121
        Height = 17
        Caption = 'Entrecomillado'
        ClicksDisabled = False
        ColorCheck = 57088
        Layout = checkboxRight
        TabOrder = 11
        TabStop = True
        Visible = False
        Alignment = taLeftJustify
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 164
      Width = 1112
      Height = 261
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 1112
        Height = 24
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 165
          Height = 22
          DataSource = DMExportacionHelios.DSSPStockAlmacen
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object LColumnasInformacion: TLabel
          Left = 165
          Top = 2
          Width = 164
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Columnas Informacion'
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object LColumnasExportar: TLabel
          Left = 329
          Top = 2
          Width = 164
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Columnas a Exportar'
          Color = clLime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 24
        Width = 1112
        Height = 237
        Align = alClient
        Color = clInfoBk
        DataSource = DMExportacionHelios.DSSPStockAlmacen
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGFDetalleCellClick
        OnDrawColumnCell = DBGFDetalleDrawColumnCell
        OnDblClick = DBGFDetalleDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = -1
        IndiceBitmapDescendente = 0
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Width = 90
            Visible = True
          end
          item
            Color = clLime
            Expanded = False
            FieldName = 'CODIGO_AS400'
            Width = 90
            Visible = True
          end
          item
            Color = clLime
            Expanded = False
            FieldName = 'TITULO'
            Width = 370
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXISTENCIAS'
            Width = 90
            Visible = True
          end
          item
            Color = clLime
            Expanded = False
            FieldName = 'UNIDAD'
            Width = 50
            Visible = True
          end
          item
            Color = clLime
            Expanded = False
            FieldName = 'LOTE'
            Visible = True
          end
          item
            Color = clLime
            Expanded = False
            FieldName = 'CANTIDAD'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_FABRICACION'
            Width = 80
            Visible = True
          end
          item
            Color = clLime
            Expanded = False
            FieldName = 'FECHA_CADUCIDAD'
            Width = 80
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 427
    Width = 1116
  end
  inherited CEMain: TControlEdit
    Left = 592
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 628
    Top = 60
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
    Left = 590
    Top = 28
    object ACalcular: TAction
      Caption = 'Calcular'
      Hint = 'Calcular datos a exportar'
      ImageIndex = 3
      OnExecute = ACalcularExecute
    end
    object AExportar: TAction
      Caption = 'Exportar'
      Hint = 'Exportar datos a fichero'
      ImageIndex = 36
      OnExecute = AExportarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 624
    Top = 24
  end
end
