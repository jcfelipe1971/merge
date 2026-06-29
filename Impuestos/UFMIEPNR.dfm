inherited FMIEPNR: TFMIEPNR
  Left = 248
  Top = 214
  Width = 1261
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Impuesto Envases de Plastico No Reutilizables'
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1251
    Height = 160
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 1247
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = DMIEPNR.DSxPeriodos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEPeriodo
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 191
      end
      inherited TbuttComp: TToolButton
        Left = 199
      end
      object TButtSep2: TToolButton
        Left = 222
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSep3: TToolButton
        Left = 230
        Top = 0
        Width = 8
        ImageIndex = 27
        Style = tbsSeparator
      end
      object TBRecalcularIntrastat: TToolButton
        Left = 238
        Top = 0
        Action = ARegenerarIEPNR
      end
      object TButtSep4: TToolButton
        Left = 261
        Top = 0
        Width = 8
        ImageIndex = 95
        Style = tbsSeparator
      end
      object TBGeneraFichero: TToolButton
        Left = 269
        Top = 0
        Action = AGeneraFicheroAsientos
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1247
      Height = 130
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1239
          Height = 102
          inherited G2KTableLoc: TG2KTBLoc
            Top = 26
            Enabled = False
            Tabla_a_buscar = 'VER_PERIODOS'
          end
          object LblPeriodo: TLFLabel
            Left = 27
            Top = 10
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodo'
          end
          object DBEPeriodo: TLFDbedit
            Left = 68
            Top = 6
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'PERIODO'
            DataSource = DMIEPNR.DSxPeriodos
            Enabled = False
            TabOrder = 0
          end
          object DBETituloPeriodo: TLFDbedit
            Left = 111
            Top = 6
            Width = 290
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMIEPNR.DSxPeriodos
            Enabled = False
            TabOrder = 1
          end
          object DBEPeriodoDesde: TLFDbedit
            Left = 111
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'DESDE'
            DataSource = DMIEPNR.DSxPeriodos
            Enabled = False
            TabOrder = 2
          end
          object DBEPeriodoHasta: TLFDbedit
            Left = 271
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'HASTA'
            DataSource = DMIEPNR.DSxPeriodos
            Enabled = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1239
          Height = 102
          DataSource = DMIEPNR.DSxPeriodos
          Columns = <
            item
              Expanded = False
              FieldName = 'PERIODO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HASTA'
              Width = 72
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 1251
  end
  object PCDetalle: TLFPageControl [2]
    Left = 0
    Top = 160
    Width = 1251
    Height = 387
    ActivePage = TSDeclaracion
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSDeclaracion: TTabSheet
      Caption = 'Declaracion'
      ImageIndex = 2
      object PNLDeclaracion: TLFPanel
        Left = 0
        Top = 0
        Width = 1243
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LCIP: TLFLabel
          Left = 24
          Top = 8
          Width = 26
          Height = 13
          Caption = 'C.I.P.'
        end
        object ECIP: TLFEdit
          Left = 56
          Top = 4
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'ES'
          OnChange = ECIPChange
        end
      end
      object PNLDeclaracionDet: TLFPanel
        Left = 0
        Top = 41
        Width = 1243
        Height = 318
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PNLDeclaracionDet'
        TabOrder = 1
        object TBDeclaracion: TLFToolBar
          Left = 0
          Top = 0
          Width = 1243
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavDeclaracion: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMIEPNR.DSQMAsientos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFAsientos
            InsertaControl = DBGFAsientos
            Exclusivo = False
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 220
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescarDeclaracion: TToolButton
            Left = 228
            Top = 0
            Hint = 'Refrescar declaracion'
            Caption = 'Refrescar declaracion'
            ImageIndex = 94
            OnClick = TBRefrescarDeclaracionClick
          end
        end
        object DBGFDeclaracion: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1243
          Height = 296
          Align = alClient
          DataSource = DMIEPNR.DSQMDeclaracion
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFAsientosCellClick
          OnDrawColumnCell = DBGFAsientosDrawColumnCell
          Insercion = False
          ColumnaInicial = 1
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
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'TIPO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CIP'
              ReadOnly = True
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EPIGRAFE'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CANTIDAD'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'BASE_IMPONIBLE'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_IMPOSITIVO'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CUOTA_INTEGRA'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DEDUCCION'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMPENSACION'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CUOTA_INTEGRA_TOTAL'
              ReadOnly = True
              Width = 90
              Visible = True
            end>
        end
      end
    end
    object TSAsientos: TTabSheet
      Caption = 'Asientos'
      object PDetalle: TLFPanel
        Left = 0
        Top = 0
        Width = 1243
        Height = 359
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object TBAsientos: TLFToolBar
          Left = 0
          Top = 0
          Width = 1243
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavAsientos: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMIEPNR.DSQMAsientos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFAsientos
            InsertaControl = DBGFAsientos
            Exclusivo = False
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep2: TToolButton
            Left = 220
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBButRegenerarIEPNR: TToolButton
            Left = 228
            Top = 0
            Action = ARegenerarIEPNR
          end
        end
        object DBGFAsientos: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1243
          Height = 337
          Align = alClient
          DataSource = DMIEPNR.DSQMAsientos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFAsientosCellClick
          OnDrawColumnCell = DBGFAsientosDrawColumnCell
          Insercion = False
          ColumnaInicial = 1
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
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'TIPO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ASIENTO'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CONCEPTO'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CLAVE_PRODUCTO'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'JUSTIFICANTE'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'KILOGRAMOS'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'KILOGRAMOS_NO_RECICLADOS'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REGIMEN_FISCAL'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR_DESTINATARIO'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR_DESTINATARIO_DOC'
              ReadOnly = True
              Width = 111
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR_DESTINATARIO_TDOC'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'OBSERVACIONES'
              ReadOnly = True
              Width = 200
              Visible = True
            end>
        end
      end
    end
    object TSDetalle: TTabSheet
      Caption = 'Detalle'
      ImageIndex = 1
      object PNLDetalle: TLFPanel
        Left = 0
        Top = 0
        Width = 1243
        Height = 359
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 1243
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 216
            Height = 22
            DataSource = DMIEPNR.DSQMDetalle
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = False
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 216
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBTodos: TToolButton
            Left = 224
            Top = 0
            Caption = 'TBTodos'
            ImageIndex = 23
            OnClick = TBTodosClick
          end
          object TBDeclarar: TToolButton
            Left = 247
            Top = 0
            Caption = 'TBDeclarar'
            ImageIndex = 22
            OnClick = TBDeclararClick
          end
          object TBSep3: TToolButton
            Left = 270
            Top = 0
            Width = 8
            ImageIndex = 23
            Style = tbsSeparator
          end
          object PNLFiltroProveedor: TLFPanel
            Left = 278
            Top = 0
            Width = 461
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFLabel1: TLFLabel
              Left = 10
              Top = 4
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'Prov.'
            end
            object EFiltroProveedor: TLFEdit
              Left = 128
              Top = 0
              Width = 330
              Height = 21
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object EFFiltroProveedor: TLFEditFind2000
              Left = 39
              Top = 0
              Width = 88
              Height = 21
              TabOrder = 1
              OnChange = EFFiltroProveedorChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              Campos_Desplegar.Strings = (
                'NOMBRE_COMERCIAL')
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
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1243
          Height = 337
          Align = alClient
          DataSource = DMIEPNR.DSQMDetalle
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
          ColumnaInicial = 1
          UsaDicG2K = True
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
          BuscarNums = False
          BuscarChars = False
          Campos.Strings = (
            'CLAVE_PRODUCTO'
            'CONCEPTO'
            'REGIMEN_FISCAL')
          CamposAMostrar.Strings = (
            'CLAVE_PRODUCTO'
            '0'
            'CONCEPTO'
            '0'
            'REGIMEN_FISCAL'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'CLAVE_PRODUCTO'
            'CONCEPTO'
            'FECHA'
            'KILOGRAMOS'
            'KILOGRAMOS_NO_RECICLADOS'
            'PROVEEDOR'
            'PROVEEDOR_DESTINATARIO'
            'PROVEEDOR_DESTINATARIO_DOC'
            'REGIMEN_FISCAL'
            'RIG'
            'SERIE'
            'TITULO'
            'UNIDADES')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO'
            'CODIGO'
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_IEPNR_CLAVE_PRODUCTO'
            'SYS_IEPNR_CONCEPTO'
            'SYS_IEPNR_REGIMEN_FISCAL')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFDetalleBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CODIGO'
            'CODIGO'
            'CODIGO'
            'PAIS_C2')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ASIENTO'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONCEPTO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLAVE_PRODUCTO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KILOGRAMOS'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KILOGRAMOS_NO_RECICLADOS'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGIMEN_FISCAL'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR_DESTINATARIO'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR_DESTINATARIO_DOC'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR_DESTINATARIO_TDOC'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ART_CLAVE_PRODUCTO'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ART_KILOGRAMOS'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ART_KILOGRAMOS_NO_RECICLADOS'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 372
    Top = 10
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 12
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
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
    Left = 336
    Top = 8
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARegenerarIEPNR: TAction
      Category = 'Procesos'
      Caption = 'Recalcular declaracion'
      Hint = 
        'Borra los datos y vuelve a calcular los datos para la declaracio' +
        'n'
      ImageIndex = 94
      OnExecute = ARegenerarIEPNRExecute
    end
    object AGeneraFicheroAsientos: TAction
      Category = 'Procesos'
      Caption = 'Genera Fichero Asientos'
      Hint = 'Genera fichero de delcaracion'
      ImageIndex = 49
      OnExecute = AGeneraFicheroAsientosExecute
    end
    object AGenerarFicheroDeclaracion: TAction
      Category = 'Procesos'
      Caption = 'Generar Fichero Declaracion'
      ImageIndex = 49
      OnExecute = AGenerarFicheroDeclaracionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'ECIP.Text')
    Left = 336
    Top = 40
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = PMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 374
    Top = 118
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 426
    Top = 120
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEDetalle
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 374
    Top = 44
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 426
    Top = 46
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
