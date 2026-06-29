inherited FMCondicionesCompra: TFMCondicionesCompra
  Left = 331
  Top = 170
  Width = 800
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Condiciones de Compra'
  OldCreateOrder = True
  PopupMenu = CECondProvAgrPorPrecioPMEdit
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 447
    TabOrder = 1
    object SBAProveedor: TSpeedButton [0]
      Left = 520
      Top = 0
      Width = 23
      Height = 22
      Hint = 'Para Abrir el Maestro de Proveedores: Ctrl+ALT+T '
      Action = AProveedor
      AllowAllUp = True
      ParentShowHint = False
      ShowHint = False
      OnDblClick = AProveedorExecute
    end
    inherited TBMain: TLFToolBar
      Width = 786
      inherited EPMain: THYMEditPanel
        Width = 69
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 2
        OnClickRango = EPMainClickRango
      end
      object TSep1: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LProveedor: TLFLabel
        Left = 77
        Top = 0
        Width = 59
        Height = 22
        Alignment = taRightJustify
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFProveedor: TLFEditFind2000
        Left = 136
        Top = 0
        Width = 64
        Height = 22
        TabOrder = 0
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
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETitProv: TLFEdit
        Left = 200
        Top = 0
        Width = 320
        Height = 22
        TabStop = False
        Color = clAqua
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnDblClick = AProveedorExecute
      end
    end
    object PCPrincipal: TLFPageControl
      Left = 2
      Top = 28
      Width = 786
      Height = 417
      ActivePage = TSPorUnidades
      Align = alClient
      MultiLine = True
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabWidth = 376
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSPorUnidades: TTabSheet
        Caption = 'Por Unidades'
        object PCDetalle: TLFPageControl
          Left = 0
          Top = 0
          Width = 778
          Height = 389
          ActivePage = TSCondProvArt
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSCondProvArt: TTabSheet
            Caption = 'Art'#237'culo'
            OnShow = TSCondProvArtShow
            object TBCondProvArt: TLFToolBar
              Left = 0
              Top = 0
              Width = 770
              Height = 24
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvArt: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                DataSource = DMCondicionesCompra.DSQMCondProvArt
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProArtPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvArt
                InsertaControl = DBGFCondProvArt
                Exclusivo = True
                ControlEdit = CECondProArt
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton2: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoArticuloUnidades: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
              object ToolButton4: TToolButton
                Left = 251
                Top = 0
                Width = 8
                ImageIndex = 0
                Style = tbsSeparator
              end
              object PNLFiltroArticulo: TLFPanel
                Left = 259
                Top = 0
                Width = 413
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object LFiltroArticulo: TLFLabel
                  Left = 24
                  Top = 4
                  Width = 35
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Articulo'
                end
                object EFFiltroArticulo: TLFEditFind2000
                  Left = 64
                  Top = 0
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  OnChange = EFFiltroArticuloChange
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
                  Tabla_a_buscar = 'VER_ARTICULOS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'ARTICULO')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object EFiltroArticulo: TLFEdit
                  Left = 186
                  Top = 0
                  Width = 223
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 1
                end
              end
            end
            object DBGFCondProvArt: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 770
              Height = 337
              Align = alClient
              DataSource = DMCondicionesCompra.DSQMCondProvArt
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGFCondProvArtCellClick
              OnColEnter = DBGFColEnter
              OnDrawColumnCell = DBGFCondProvArtDrawColumnCell
              OnDblClick = DBGFCondProvArtDblClick
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'ARTICULO')
              CamposAMostrar.Strings = (
                'ARTICULO'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'ARTICULO'
                'TITULO_ARTICULO')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'ARTICULO')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'VER_ARTICULOS_EF')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGFCondProvArtBusqueda
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
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_ARTICULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
          object TSCondProvFam: TTabSheet
            Caption = 'Familia'
            ImageIndex = 1
            OnShow = TSCondProvFamShow
            object TBCondProvFam: TLFToolBar
              Left = 0
              Top = 0
              Width = 770
              Height = 24
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvFam: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProvFamPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvFam
                InsertaControl = DBGFCondProvFam
                Exclusivo = True
                ControlEdit = CECondProvFam
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton5: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoFamiliaUnidades: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
              object ToolButton8: TToolButton
                Left = 251
                Top = 0
                Width = 8
                ImageIndex = 0
                Style = tbsSeparator
              end
              object PNLFiltroFamilia: TLFPanel
                Left = 259
                Top = 0
                Width = 413
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object LFamilia: TLFLabel
                  Left = 27
                  Top = 4
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Familia'
                end
                object EFFiltroFamilia: TLFEditFind2000
                  Left = 64
                  Top = 0
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  OnChange = EFFiltroFamiliaChange
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
                object EFiltroFamilia: TLFEdit
                  Left = 186
                  Top = 0
                  Width = 223
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 1
                end
              end
            end
            object DBGFCondProvFam: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 770
              Height = 337
              Align = alClient
              DataSource = DMCondicionesCompra.DSQMCondProvFam
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFColEnter
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'FAMILIA')
              CamposAMostrar.Strings = (
                'FAMILIA'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'FAMILIA'
                'TITULO_FAMILIA')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'FAMILIA')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_FAMILIAS')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGFCondProvFamBusqueda
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'FAMILIA')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FAMILIA'
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_FAMILIA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
          object TSCondProvAgrArt: TTabSheet
            Caption = 'Agrupaci'#243'n Art'#237'culos'
            ImageIndex = 7
            OnShow = TSCondProvAgrArtShow
            object TBCondProvAgrArt: TLFToolBar
              Left = 0
              Top = 0
              Width = 770
              Height = 24
              Hint = 'DMMain.ILMain_Ac'
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvAgrArt: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProvAgrArtPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvAgrArt
                InsertaControl = DBGFCondProvAgrArt
                Exclusivo = True
                ControlEdit = CECondProvAgrArt
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton7: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoAgrupArtUnidades: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
            end
            object DBGFCondProvAgrArt: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 770
              Height = 337
              Align = alClient
              DataSource = DMCondicionesCompra.DSCondProvAgrArt
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFColEnter
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'AGRUPACION')
              CamposAMostrar.Strings = (
                'AGRUPACION'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'AGRUPACION'
                'TITULO_AGRUPACION')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              CondicionBusqueda = 'TIPO='#39'T'#39
              MensajeNoExiste = False
              Numericos.Strings = (
                'AGRUPACION')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'VER_AGRUPACIONES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'AGRUPACION')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'AGRUPACION'
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_AGRUPACION'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
          object TSCondProvAg: TTabSheet
            Caption = 'Agrupaci'#243'n Proveedores'
            OnShow = TSCondProvAgShow
            object TBCondProvProvAgr: TLFToolBar
              Left = 0
              Top = 0
              Width = 770
              Height = 24
              Hint = 'DMMain.ILMain_Ac'
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvAgr: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProvAgrPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvAgr
                InsertaControl = DBGFCondProvAgr
                Exclusivo = True
                ControlEdit = CECondProvAgr
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton9: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoAgrupProvUnidades: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
            end
            object DBGFCondProvAgr: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 770
              Height = 337
              Align = alClient
              DataSource = DMCondicionesCompra.DSCondProvAgr
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFColEnter
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'AGRUPACION')
              CamposAMostrar.Strings = (
                'AGRUPACION'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'AGRUPACION'
                'TITULO_AGRUPACION')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              CondicionBusqueda = 'TIPO='#39'P'#39
              MensajeNoExiste = False
              Numericos.Strings = (
                'AGRUPACION')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'VER_AGRUPACIONES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'AGRUPACION')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'AGRUPACION'
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_AGRUPACION'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
        end
      end
      object TSPorPrecio: TTabSheet
        Caption = 'Por Precio'
        ImageIndex = 1
        object PCDetallePorPrecio: TLFPageControl
          Left = 0
          Top = 0
          Width = 778
          Height = 389
          ActivePage = TSCondProvArtPorPrecio
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSCondProvArtPorPrecio: TTabSheet
            Caption = 'Art'#237'culo'
            OnShow = TSCondProvArtPorPrecioShow
            object TBCondProvArtProPrecio: TLFToolBar
              Left = 0
              Top = 0
              Width = 770
              Height = 24
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvArtPorPrecio: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProArtPorPrecioPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvArtPorPrecio
                InsertaControl = DBGFCondProvArtPorPrecio
                Exclusivo = True
                ControlEdit = CECondProArtPorPrecio
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton3: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoArticuloPrecio: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
              object ToolButton6: TToolButton
                Left = 251
                Top = 0
                Width = 8
                ImageIndex = 0
                Style = tbsSeparator
              end
              object PNLFiltroArticuloPorPrecio: TLFPanel
                Left = 259
                Top = 0
                Width = 413
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object LFiltroArticuloPorPrecio: TLFLabel
                  Left = 24
                  Top = 4
                  Width = 35
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Articulo'
                end
                object EFFiltroArticuloPorPrecio: TLFEditFind2000
                  Left = 64
                  Top = 0
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  OnChange = EFFiltroArticuloPorPrecioChange
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
                  Tabla_a_buscar = 'VER_ARTICULOS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'ARTICULO')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object EFiltroArticuloPorPrecio: TLFEdit
                  Left = 186
                  Top = 0
                  Width = 223
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 1
                end
              end
            end
            object DBGFCondProvArtPorPrecio: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 770
              Height = 337
              Align = alClient
              DataSource = DMCondicionesCompra.DSQMCondProvArtPorPrecio
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFColEnter
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'ARTICULO')
              CamposAMostrar.Strings = (
                'ARTICULO'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'ARTICULO'
                'TITULO_ARTICULO')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'ARTICULO')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'VER_ARTICULOS_EF')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGFCondProvArtPorPrecioBusqueda
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
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_ARTICULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
          object TSCondProvFamPorPrecio: TTabSheet
            Caption = 'Familia'
            ImageIndex = 1
            OnShow = TSCondProvFamPorPrecioShow
            object TBCondProvFamPorPrecio: TLFToolBar
              Left = 0
              Top = 0
              Width = 742
              Height = 24
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvFamPorPrecio: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProvFamPorPrecioPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvFamPorPrecio
                InsertaControl = DBGFCondProvFamPorPrecio
                Exclusivo = True
                ControlEdit = CECondProvFamPorPrecio
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton10: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoFamiliaPrecio: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
              object ToolButton12: TToolButton
                Left = 251
                Top = 0
                Width = 8
                ImageIndex = 0
                Style = tbsSeparator
              end
              object PNLFiltraFamiliaPorPrecio: TLFPanel
                Left = 259
                Top = 0
                Width = 413
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object LFiltraFamiliaPorPrecio: TLFLabel
                  Left = 27
                  Top = 4
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Familia'
                end
                object EFFiltraFamiliaPorPrecio: TLFEditFind2000
                  Left = 64
                  Top = 0
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  OnChange = EFFiltraFamiliaPorPrecioChange
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
                object EFiltraFamiliaPorPrecio: TLFEdit
                  Left = 186
                  Top = 0
                  Width = 223
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 1
                end
              end
            end
            object DBGFCondProvFamPorPrecio: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 742
              Height = 314
              Align = alClient
              DataSource = DMCondicionesCompra.DSQMCondProvFamPorPrecio
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFColEnter
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'FAMILIA')
              CamposAMostrar.Strings = (
                'FAMILIA'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'FAMILIA'
                'TITULO_FAMILIA')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'FAMILIA')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_FAMILIAS')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGFCondProvFamPorPrecioBusqueda
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'FAMILIA')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FAMILIA'
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_FAMILIA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
          object TSCondProvAgrArtPorPrecio: TTabSheet
            Caption = 'Agrupaci'#243'n Art'#237'culos'
            ImageIndex = 7
            OnShow = TSCondProvAgrArtPorPrecioShow
            object TBCondProvAgrArtPorPrecio: TLFToolBar
              Left = 0
              Top = 0
              Width = 742
              Height = 24
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvAgrArtPorPrecio: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProvAgrArtPorPrecioPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvAgrArtPorPrecio
                InsertaControl = DBGFCondProvAgrArtPorPrecio
                Exclusivo = True
                ControlEdit = CECondProvAgrArtPorPrecio
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton11: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoAgrupArtPrecio: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
            end
            object DBGFCondProvAgrArtPorPrecio: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 742
              Height = 314
              Align = alClient
              DataSource = DMCondicionesCompra.DSCondProvAgrArtPorPrecio
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFColEnter
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'AGRUPACION')
              CamposAMostrar.Strings = (
                'AGRUPACION'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'AGRUPACION'
                'TITULO_AGRUPACION')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              CondicionBusqueda = 'TIPO='#39'T'#39
              MensajeNoExiste = False
              Numericos.Strings = (
                'AGRUPACION')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'VER_AGRUPACIONES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'AGRUPACION')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'AGRUPACION'
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_AGRUPACION'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
          object TSCondProvProvAgrPorPrecio: TTabSheet
            Caption = 'Agrupaci'#243'n Proveedores'
            OnShow = TSCondProvProvAgrPorPrecioShow
            object TBCondProvProvAgrPorPrecio: TLFToolBar
              Left = 0
              Top = 0
              Width = 742
              Height = 24
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavCondProvAgrPorPrecio: THYMNavigator
                Left = 0
                Top = 0
                Width = 220
                Height = 22
                Flat = True
                ParentShowHint = False
                PopupMenu = CECondProvAgrPorPrecioPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGFCondProvAgrPorPrecio
                InsertaControl = DBGFCondProvAgrPorPrecio
                Exclusivo = True
                ControlEdit = CECondProvAgrPorPrecio
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton13: TToolButton
                Left = 220
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object TButtEscaladoAgrupProvPrecio: TToolButton
                Left = 228
                Top = 0
                Action = AEscalado
              end
            end
            object DBGFCondProvAgrPorPrecio: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 742
              Height = 314
              Align = alClient
              DataSource = DMCondicionesCompra.DSCondProvAgrPorPrecio
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFColEnter
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'AGRUPACION')
              CamposAMostrar.Strings = (
                'AGRUPACION'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'AGRUPACION'
                'TITULO_AGRUPACION')
              ColumnasCheckBoxes.Strings = (
                'ACTIVO')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              CondicionBusqueda = 'TIPO='#39'P'#39
              MensajeNoExiste = False
              Numericos.Strings = (
                'AGRUPACION')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'VER_AGRUPACIONES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'AGRUPACION')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'AGRUPACION'
                  Width = 85
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_AGRUPACION'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESDE'
                  Width = 75
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'HASTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ReadOnly = True
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO1'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO2'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO3'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAJA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVO'
                  Width = 35
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 790
    ButtonWidth = 70
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 88
    Top = 184
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 120
    Top = 184
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 566
    Top = 16
    object AEscalado: TAction
      Category = 'Otros'
      Caption = 'Ver Escalado Condici'#243'n'
      Hint = 'Ver Escalado Condici'#243'n'
      ImageIndex = 45
      OnExecute = AEscaladoExecute
    end
    object CAOtros: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      Hint = 'Otros'
      ImageIndex = 99
    end
    object AImprimir: TAction
      Category = 'Listados'
      Caption = 'Listado Condiciones de Compra'
      Hint = 'Listado Condiciones de Compra'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object CAListados: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      Hint = 'Ver Escalado'
      ImageIndex = 14
    end
    object ACCC: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Condiciones de Compra'
      ImageIndex = 77
      OnExecute = ACCCExecute
    end
    object CAResumido: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AImportarExcel: TAction
      Category = 'Otros'
      Caption = 'Importar desde Excel'
      Hint = 'Importar desde Excel'
      ImageIndex = 49
      OnExecute = AImportarExcelExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 450
  end
  object AL: TLFActionList
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 410
    Top = 48
    object AProveedor: TAction
      Caption = 'AProveedor'
      Hint = 'Para Abrir el Maestro de Cliente: Ctrl+ALT+T '
      ShortCut = 49236
      OnExecute = AProveedorExecute
    end
  end
  object CECondProArt: TControlEdit
    PopUpMenu = CECondProArtPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 176
  end
  object CECondProArtPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 296
    Top = 176
    object CECondProArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondProArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondProArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondProArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondProArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondProArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondProArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondProArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondProArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondProvFam: TControlEdit
    PopUpMenu = CECondProvFamPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 208
  end
  object CECondProvFamPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 296
    Top = 208
    object CECondProvFamMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProvFamMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondProvFamMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondProvFamMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondProvFamMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondProvFamMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondProvFamMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondProvFamMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondProvFamMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondProvFamMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondProvFamGru: TControlEdit
    PopUpMenu = CECondProvFamGruPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 344
  end
  object CECondProvFamGruPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 296
    Top = 344
    object CECondProvFamGruMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProvFamGruMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondProvFamGruMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondProvFamGruMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondProvFamGruMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondProvFamGruMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondProvFamGruMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondProvFamGruMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondProvFamGruMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondProvFamGruMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondProvAgrArt: TControlEdit
    PopUpMenu = CECondProvAgrArtPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 240
  end
  object CECondProvAgrArtPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 296
    Top = 240
    object CECondProvAgrArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProvAgrArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondProvAgrArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondProvAgrArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondProvAgrArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondProvAgrArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondProvAgrArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondProvAgrArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondProvAgrArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondProvAgrArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondProvAgr: TControlEdit
    PopUpMenu = CECondProvAgrPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 272
  end
  object CECondProvAgrPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 296
    Top = 272
    object CECondProvAgrMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProvAgrMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondProvAgrMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondProvAgrMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondProvAgrMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondProvAgrMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondProvAgrMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondProvAgrMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondProvAgrMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondProvAgrMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondProArtPorPrecio: TControlEdit
    PopUpMenu = CECondProArtPorPrecioPMEdit
    Teclas = DMMain.Teclas
    Left = 344
    Top = 176
  end
  object CECondProArtPorPrecioPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 376
    Top = 176
    object MenuItem1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem11: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object MenuItem12: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem13: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem14: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem15: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem16: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem17: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem18: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem19: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem20: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CECondProArtPorPrecioMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProArtPorPrecioMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CECondProArtPorPrecioMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CECondProArtPorPrecioMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CECondProArtPorPrecioMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CECondProArtPorPrecioMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CECondProArtPorPrecioMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CECondProArtPorPrecioMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CECondProArtPorPrecioMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CECondProArtPorPrecioMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CECondProvFamPorPrecio: TControlEdit
    PopUpMenu = CECondProvFamPorPrecioPMEdit
    Teclas = DMMain.Teclas
    Left = 344
    Top = 208
  end
  object CECondProvFamPorPrecioPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 376
    Top = 208
    object MenuItem21: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem22: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem23: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem24: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem25: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem26: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem27: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem28: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem29: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem30: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem31: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object MenuItem32: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem33: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem34: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem35: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem36: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem37: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem38: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem39: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem40: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CECondProvFamPorPrecioMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProvFamPorPrecioMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CECondProvFamPorPrecioMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CECondProvFamPorPrecioMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CECondProvFamPorPrecioMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CECondProvFamPorPrecioMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CECondProvFamPorPrecioMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CECondProvFamPorPrecioMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CECondProvFamPorPrecioMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CECondProvFamPorPrecioMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CECondProvAgrArtPorPrecio: TControlEdit
    PopUpMenu = CECondProvAgrArtPorPrecioPMEdit
    Teclas = DMMain.Teclas
    Left = 344
    Top = 240
  end
  object CECondProvAgrArtPorPrecioPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 376
    Top = 240
    object MenuItem41: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem42: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem43: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem44: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem45: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem46: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem47: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem48: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem49: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem50: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem51: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object MenuItem52: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem53: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem54: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem55: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem56: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem57: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem58: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem59: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem60: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CECondProvAgrArtPorPrecioMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProvAgrArtPorPrecioMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CECondProvAgrArtPorPrecioMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CECondProvAgrArtPorPrecioMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CECondProvAgrArtPorPrecioMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CECondProvAgrArtPorPrecioMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CECondProvAgrArtPorPrecioMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CECondProvAgrArtPorPrecioMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CECondProvAgrArtPorPrecioMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CECondProvAgrArtPorPrecioMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CECondProvAgrPorPrecio: TControlEdit
    PopUpMenu = CECondProvAgrPorPrecioPMEdit
    Teclas = DMMain.Teclas
    Left = 344
    Top = 272
  end
  object CECondProvAgrPorPrecioPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 376
    Top = 272
    object MenuItem61: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem62: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem63: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem64: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem65: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem66: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem67: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem68: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem69: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem70: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem71: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object MenuItem72: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem73: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem74: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem75: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem76: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem77: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem78: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem79: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem80: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CECondProvAgrPorPrecioMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondProvAgrPorPrecioMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CECondProvAgrPorPrecioMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CECondProvAgrPorPrecioMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CECondProvAgrPorPrecioMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CECondProvAgrPorPrecioMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CECondProvAgrPorPrecioMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CECondProvAgrPorPrecioMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CECondProvAgrPorPrecioMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CECondProvAgrPorPrecioMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
end
