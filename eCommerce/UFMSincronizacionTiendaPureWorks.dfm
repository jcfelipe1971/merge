inherited FMSincronizacionTiendaPureWorks: TFMSincronizacionTiendaPureWorks
  Left = 463
  Top = 184
  Width = 1100
  Height = 616
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion Tienda PureWorks'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1090
    Height = 563
    inherited TBMain: TLFToolBar
      Width = 1086
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSincronizar: TToolButton
        Left = 41
        Top = 0
        Action = ASincronizar
      end
      object TSep2: TToolButton
        Left = 64
        Top = 0
        Width = 8
        ImageIndex = 27
        Style = tbsSeparator
      end
      object TButtGuardarConfiguracion: TToolButton
        Left = 72
        Top = 0
        Action = AGuardarConfiguracion
      end
    end
    object PNLConexion: TLFPanel
      Left = 2
      Top = 28
      Width = 1086
      Height = 165
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LHost: TLFLabel
        Left = 110
        Top = 7
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Host'
      end
      object LPort: TLFLabel
        Left = 113
        Top = 29
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'Port'
      end
      object LUser: TLFLabel
        Left = 110
        Top = 52
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'User'
      end
      object LPassword: TLFLabel
        Left = 86
        Top = 75
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Password'
      end
      object LCarpetaImportacion: TLFLabel
        Left = 37
        Top = 95
        Width = 95
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carpeta Importacion'
      end
      object LCarpetaExportacion: TLFLabel
        Left = 36
        Top = 116
        Width = 96
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carpeta Exportacion'
      end
      object LProveedor: TLFLabel
        Left = 83
        Top = 140
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Proveedor'
      end
      object EHost: TLFEdit
        Left = 136
        Top = 3
        Width = 433
        Height = 21
        TabOrder = 0
      end
      object EPort: TLFEdit
        Left = 136
        Top = 25
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object EUser: TLFEdit
        Left = 136
        Top = 47
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object EPassword: TLFEdit
        Left = 136
        Top = 69
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 3
      end
      object ECarpetaImportacion: TLFEdit
        Left = 136
        Top = 91
        Width = 433
        Height = 21
        TabOrder = 4
      end
      object ECarpetaExportacion: TLFEdit
        Left = 136
        Top = 113
        Width = 433
        Height = 21
        TabOrder = 5
      end
      object EFProveedor: TLFEditFind2000
        Left = 136
        Top = 135
        Width = 65
        Height = 21
        TabOrder = 6
        Text = '0'
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
        Left = 202
        Top = 135
        Width = 367
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 7
      end
      object MLog: TLFMemo
        Left = 600
        Top = 0
        Width = 486
        Height = 165
        Align = alRight
        ScrollBars = ssVertical
        TabOrder = 8
      end
    end
    object PNLDatos: TLFPanel
      Left = 2
      Top = 193
      Width = 1086
      Height = 368
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 1086
        Height = 22
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 220
          Height = 22
          DataSource = DMSincronizacionTiendaPureWorks.DSxImportacionArticulos
          Flat = True
          ParentShowHint = False
          PopupMenu = CEMainPMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = False
          ControlEdit = CEMain
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object TSep3: TToolButton
          Left = 220
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object TButtCrearModificar: TToolButton
          Left = 228
          Top = 0
          Action = ACrearModificarArticulos
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 832
        Height = 346
        Align = alClient
        DataSource = DMSincronizacionTiendaPureWorks.DSxImportacionArticulos
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFDetalleDrawColumnCell
        OnDblClick = DBGFDetalleDblClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = False
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        Transaction = DMSincronizacionTiendaPureWorks.TLocal
        BuscarNums = False
        BuscarChars = False
        Campos.Strings = (
          'ARTICULO')
        CamposAMostrar.Strings = (
          'ARTICULO'
          '2'
          'ALFA_2'
          'ALFA_1')
        CamposAMostrarAnchos.Strings = (
          '0')
        CamposADevolver.Strings = (
          '')
        CamposDesplegar.Strings = (
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'ALFA_1'
          'ALFA_2'
          'ARTICULO'
          'EMPRESA'
          'P_VENTA_RECOMENDADO'
          'PCOMPRA1'
          'PCOMPRA2'
          'PCOSTE1'
          'PCOSTE2'
          'PVENTA1'
          'PVENTA2'
          'REF_PROVEEDOR'
          'TITULO'
          'TRASPASADO')
        ColumnasCheckBoxes.Strings = (
          'TRASPASADO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'ARTICULO')
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tablas.Strings = (
          'VER_ARTICULOS_EF')
        Acciones.Strings = (
          '')
        Titulos.Strings = (
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleBusqueda
        Planes.Strings = (
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Width = 100
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRASPASADO'
            Width = 33
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'REF_PROVEEDOR'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_PROVEEDOR'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PVENTA1'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PVENTA2'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'P_VENTA_RECOMENDADO'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PCOMPRA1'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PCOMPRA2'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PCOSTE1'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PCOSTE2'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_1'
            ReadOnly = True
            Width = 100
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_2'
            ReadOnly = True
            Width = 70
            Visible = True
          end>
      end
      object DBMNotas: TLFDBMemo
        Left = 832
        Top = 22
        Width = 254
        Height = 346
        Align = alRight
        DataField = 'NOTAS'
        DataSource = DMSincronizacionTiendaPureWorks.DSxImportacionArticulos
        TabOrder = 2
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 563
    Width = 1090
  end
  inherited CEMain: TControlEdit
    Left = 520
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 560
    Top = 8
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
    Left = 600
    Top = 8
    object ASincronizar: TAction
      Category = 'Procesos'
      Caption = 'Sincronizar esta tienda'
      Hint = 'Sincroniza con esta p'#225'gina web'
      ImageIndex = 98
      OnExecute = ASincronizarExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AGuardarConfiguracion: TAction
      Category = 'Procesos'
      Caption = 'Guardar Configuracion'
      Hint = 'Guarda datos de configuracion de conexion'
      ImageIndex = 41
      OnExecute = AGuardarConfiguracionExecute
    end
    object ACrearModificarArticulos: TAction
      Category = 'Procesos'
      Caption = 'Crear Modificar Articulos'
      Hint = 'Crear Modificar Articulos marcados'
      ImageIndex = 16
      OnExecute = ACrearModificarArticulosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 600
    Top = 40
  end
end
