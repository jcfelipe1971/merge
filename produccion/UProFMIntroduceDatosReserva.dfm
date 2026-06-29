object ProFMIntroduceDatosReserva: TProFMIntroduceDatosReserva
  Left = 655
  Top = 189
  Width = 900
  Height = 583
  Caption = 'Introducci'#243'n datos  Reserva'
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 900
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 556
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LFPMain: TLFPanel
      Left = 0
      Top = 81
      Width = 892
      Height = 384
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PCMain: TLFPageControl
        Left = 0
        Top = 0
        Width = 892
        Height = 384
        ActivePage = TSCompuestos
        Align = alClient
        OwnerDraw = True
        TabIndex = 1
        TabOrder = 0
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSComponentes: TTabSheet
          Caption = 'Componentes'
          object PNLComponentes: TLFPanel
            Left = 0
            Top = 22
            Width = 884
            Height = 334
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGLot_Ubi: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 884
              Height = 334
              Align = alClient
              DataSource = DSQMMaterialesLot_Ubi
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGridDrawColumnCell
              OnKeyUp = DBGLot_UbiKeyUp
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 9
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
              Campos.Strings = (
                'ID_UBICACION'
                'ALMACEN_DEVOLVER'
                'ALMACEN_SAL_RES'
                'COMPONENTE_RES')
              CamposAMostrar.Strings = (
                'ID_UBICACION'
                '1'
                'ALMACEN'
                'ALMACEN_DEVOLVER'
                '0'
                'ALMACEN_SAL_RES'
                '0'
                'COMPONENTE_RES'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0'
                '0'
                '0'
                '0')
              CamposADevolver.Strings = (
                ''
                ''
                ''
                '')
              CamposDesplegar.Strings = (
                '1'
                '1'
                '1'
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              ColumnasCheckBoxes.Strings = (
                'PREPARADO'
                'UBICABLE'
                'CONTROL_STOCK'
                'CTROL_UBICACION')
              ColumnasChecked.Strings = (
                '1'
                '1'
                '1'
                '1')
              ColumnasNoChecked.Strings = (
                '0'
                '0'
                '0'
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'ID_UBICACION'
                'ALMACEN'
                'ALMACEN'
                'ARTICULO')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_ALMACENES_UBICACIONES'
                'VER_ALMACENES'
                'VER_ALMACENES'
                'ART_ARTICULOS')
              Acciones.Strings = (
                ''
                ''
                ''
                '')
              Titulos.Strings = (
                'TITULO'
                'AL_TITULO'
                'AL_TITULO'
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGLot_UbiBusqueda
              Planes.Strings = (
                ''
                ''
                ''
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'COMPOSICION'
                ''
                ''
                '')
              Filtros = []
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA_FASE'
                  ReadOnly = True
                  Width = 35
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA_MAT'
                  ReadOnly = True
                  Width = 35
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ALMACEN_SAL'
                  ReadOnly = True
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN_SAL_RES'
                  Width = 109
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMPONENTE_RES'
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ALMACEN'
                  ReadOnly = True
                  Width = 36
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'COMPONENTE'
                  ReadOnly = True
                  Width = 67
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
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'UNIDADES_FAB'
                  ReadOnly = True
                  Width = 60
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'UNIDADES_STOCK'
                  ReadOnly = True
                  Width = 60
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'UDS_POSIBLES'
                  ReadOnly = True
                  Width = 60
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'STOCK_ALM_SAL'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'STOCK_ALM_LAN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PREPARADO'
                  Width = 27
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_ENVIAR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_LOTE'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASIFICACION'
                  Width = 200
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO_LOTE'
                  ReadOnly = True
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_UBICACION'
                  Width = 60
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'Titulo_Ubicacion'
                  ReadOnly = True
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MERMA'
                  Width = 60
                  Visible = True
                end>
            end
          end
          object TBLotes: TLFToolBar
            Left = 0
            Top = 0
            Width = 884
            Height = 22
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavComponentes: THYMNavigator
              Left = 0
              Top = 0
              Width = 160
              Height = 22
              DataSource = DSQMMaterialesLot_Ubi
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGLot_Ubi
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton1: TToolButton
              Left = 160
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtAsignarLotesAutomaticamente: TToolButton
              Left = 168
              Top = 0
              Hint = 
                'Asigna los lotes a los articulos que los necesiten tomando el ma' +
                's antiguo'
              Caption = 'tAsignar Lotes Automaticamente'
              ImageIndex = 120
              OnClick = TButtAsignarLotesAutomaticamenteClick
            end
          end
        end
        object TSCompuestos: TTabSheet
          Caption = 'Compuesto'
          ImageIndex = 1
          object PNLCompuesto: TLFPanel
            Left = 0
            Top = 22
            Width = 884
            Height = 334
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGFCompuesto: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 884
              Height = 334
              Align = alClient
              DataSource = DSQMCompuesto
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGridDrawColumnCell
              OnKeyUp = DBGFCompuestoKeyUp
              Insercion = False
              ColumnaInicial = 10
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
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'ID_UBICACION')
              CamposAMostrar.Strings = (
                'ID_UBICACION'
                '1'
                'ALMACEN')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              MensajeNoExiste = False
              Numericos.Strings = (
                'ID_UBICACION')
              SalirSiVacio = False
              SalirSiNoExiste = True
              Tablas.Strings = (
                'ART_ALMACENES_UBICACIONES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGFCompuestoBusqueda
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'COMPOSICION')
              Filtros = []
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ID_ORDEN'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'RIG_OF'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'SUBORDEN'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ALMACEN_SAL'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ALMACEN_LAN'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ALMACEN_ENT'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'FECHA_ORD'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Width = 80
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'CLIENTE'
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'COMPUESTO'
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_RES'
                  ReadOnly = False
                  Width = 73
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_LOTE_RESERVA'
                  ReadOnly = False
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASIFICACION'
                  Width = 200
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'Titulo_Lotes'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_UBICACION'
                  ReadOnly = False
                  Width = 66
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'Titulo_Ubicacion'
                  Width = 100
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DESC_LOTE'
                  Width = 100
                  Visible = True
                end>
            end
          end
          object TBCompuesto: TLFToolBar
            Left = 0
            Top = 0
            Width = 884
            Height = 22
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavCompuesto: THYMNavigator
              Left = 0
              Top = 0
              Width = 160
              Height = 22
              DataSource = DSQMCompuesto
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
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
          end
        end
        object TSSeriesComponente: TTabSheet
          Caption = 'Serializaci'#243'n Componentes'
          ImageIndex = 3
          object TBSerializacionComponentes: TLFToolBar
            Left = 0
            Top = 0
            Width = 884
            Height = 22
            AutoSize = True
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavSerializacionComponentes: THYMNavigator
              Left = 0
              Top = 0
              Width = 160
              Height = 22
              DataSource = DSSerieComponente
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
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
          end
          object PNLSerieComponente: TLFPanel
            Left = 0
            Top = 22
            Width = 884
            Height = 334
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGSerieComponente: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 884
              Height = 334
              Align = alClient
              DataSource = DSSerieComponente
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 2
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
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'COD_SERIALIZACION')
              CamposAMostrar.Strings = (
                'COD_SERIALIZACION'
                '2'
                'FECHA_GARANTIA_PROVEEDOR'
                'FECHA_GARANTIA_CLIENTE')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              MensajeNoExiste = False
              Numericos.Strings = (
                'NSERIE')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_ARTICULOS_SERIALIZACION')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'FECHA_CADUCIDAD')
              Posicion = tpCentrado
              OnBusqueda = DBGSerieComponenteBusqueda
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'NSERIE')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA'
                  ReadOnly = True
                  Width = 40
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'COMPONENTE'
                  ReadOnly = True
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_SERIALIZACION'
                  Width = 200
                  Visible = True
                end>
            end
          end
        end
        object TSSeriesCompuesto: TTabSheet
          Caption = 'Serializaci'#243'n Compuesto'
          ImageIndex = 2
          object TBSerializacionCompuesto: TLFToolBar
            Left = 0
            Top = 0
            Width = 884
            Height = 22
            AutoSize = True
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavSerializacionCompuesto: THYMNavigator
              Left = 0
              Top = 0
              Width = 160
              Height = 22
              DataSource = DSSerieCompuesto
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
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
          end
          object PNLSeriesCompuesto: TLFPanel
            Left = 0
            Top = 22
            Width = 884
            Height = 334
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGSerieCompuesto: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 884
              Height = 334
              Align = alClient
              DataSource = DSSerieCompuesto
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 2
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
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              BuscarChars = False
              Campos.Strings = (
                'COD_SERIALIZACION')
              CamposAMostrar.Strings = (
                'COD_SERIALIZACION'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              MensajeNoExiste = False
              Numericos.Strings = (
                'NSERIE')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_ARTICULOS_SERIALIZACION')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'NSERIE')
              Posicion = tpCentrado
              OnBusqueda = DBGSerieCompuestoBusqueda
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                '')
              Filtros = [obEmpresa, obCanal]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA'
                  ReadOnly = True
                  Width = 40
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'COMPONENTE'
                  ReadOnly = True
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_SERIALIZACION'
                  Width = 200
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object LFPDatosGen: TLFPanel
      Left = 0
      Top = 0
      Width = 892
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LIDOrden: TLFLabel
        Left = 71
        Top = 14
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'ID Orden'
      end
      object LCompuesto: TLFLabel
        Left = 61
        Top = 37
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Compuesto'
      end
      object LFecha: TLFLabel
        Left = 504
        Top = 15
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Ord.'
      end
      object LUnidades: TLFLabel
        Left = 704
        Top = 15
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades'
      end
      object LUnidadesPosibles: TLFLabel
        Left = 493
        Top = 59
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Uds. Posibles'
      end
      object LMinUnidadesPosibles: TLFLabel
        Left = 562
        Top = 56
        Width = 87
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = '0.00'
        Color = clLime
        Enabled = False
        ParentColor = False
        Layout = tlCenter
      end
      object LUnidadesAReservar: TLFLabel
        Left = 14
        Top = 59
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades a Reservar'
      end
      object LUnidadesReservadas: TLFLabel
        Left = 688
        Top = 37
        Width = 62
        Height = 13
        Hint = 'Unidades Reservadas'
        Alignment = taRightJustify
        Caption = 'Uds. Reserv.'
      end
      object LReservas: TLFLabel
        Left = 513
        Top = 37
        Width = 45
        Height = 13
        Hint = 'Cantidad de Reservas'
        Alignment = taRightJustify
        Caption = 'Reservas'
      end
      object LUnidadesPendientesReservar: TLFLabel
        Left = 657
        Top = 59
        Width = 93
        Height = 13
        Hint = 'Unidades Reservadas'
        Alignment = taRightJustify
        Caption = 'Uds. Pend. Reserv.'
      end
      object LFechaReserva: TLFLabel
        Left = 286
        Top = 59
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fec. Reserva'
      end
      object DBEFechaOrden: TLFDbedit
        Left = 562
        Top = 11
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'FECHA_ORD'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        TabOrder = 5
      end
      object DBEUnidades: TLFDbedit
        Left = 754
        Top = 11
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'UNI_TOTAL'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        TabOrder = 7
      end
      object DBEIDOrden: TLFDbedit
        Left = 118
        Top = 11
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'ID_ORDEN'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        TabOrder = 0
      end
      object DBEFCompuesto: TLFDbedit
        Left = 118
        Top = 33
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        TabOrder = 1
        OnChange = DBEFCompuestoChange
      end
      object EDescCompuesto: TLFEdit
        Left = 206
        Top = 33
        Width = 269
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEUnidadesAReservar: TLFDbedit
        Left = 118
        Top = 55
        Width = 87
        Height = 21
        DataField = 'UNIDADES_RES'
        DataSource = DSQMCompuesto
        TabOrder = 3
        OnChange = DBEUnidadesAReservarChange
        OnEnter = DBEUnidadesAReservarEnter
        OnExit = DBEUnidadesAReservarExit
        OnKeyPress = DBEUnidadesAReservarKeyPress
      end
      object DBELUnidadesReservadas: TLFDbedit
        Left = 754
        Top = 33
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'UNIDADES_RESERVAS'
        DataSource = DSQMCompuesto
        Enabled = False
        TabOrder = 8
      end
      object DBEReservas: TLFDbedit
        Left = 562
        Top = 33
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'CANT_RESERVAS'
        DataSource = DSQMCompuesto
        Enabled = False
        TabOrder = 6
      end
      object DBEUnidadesPendientesReservar: TLFDbedit
        Left = 754
        Top = 55
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'UNIDADES_PENDIENTES_RESERVAR'
        DataSource = DSQMCompuesto
        Enabled = False
        TabOrder = 9
      end
      object DBEEsado: TLFDbedit
        Left = 244
        Top = 11
        Width = 51
        Height = 21
        Color = clInfoBk
        DataField = 'ESTADO'
        DataSource = ProDMIntroduceDatosReserva.DSReserva
        Enabled = False
        TabOrder = 10
        OnChange = DBEEsadoChange
      end
      object EEstado: TLFEdit
        Left = 296
        Top = 11
        Width = 179
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 11
      end
      object DBDEFechaReserva: TLFDBDateEdit
        Left = 354
        Top = 55
        Width = 121
        Height = 21
        DataField = 'FECHA'
        DataSource = DSQMCompuesto
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
        OnExit = DBEUnidadesAReservarExit
      end
    end
    object PNLComponentesBotonera: TLFPanel
      Left = 0
      Top = 515
      Width = 892
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object BSeguir: TBitBtn
        Left = 662
        Top = 7
        Width = 137
        Height = 30
        Caption = '&Guardar sin Reservar'
        ModalResult = 1
        TabOrder = 0
        OnClick = BSeguirClick
        NumGlyphs = 2
      end
      object BCancelar: TBitBtn
        Left = 803
        Top = 7
        Width = 80
        Height = 30
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
        NumGlyphs = 2
      end
      object BBorrarReserva: TBitBtn
        Left = 11
        Top = 7
        Width = 80
        Height = 30
        Cancel = True
        Caption = '&Eliminar'
        ModalResult = 2
        TabOrder = 4
        Visible = False
        OnClick = BBorrarReservaClick
        NumGlyphs = 2
      end
      object BBReservar: TBitBtn
        Left = 113
        Top = 8
        Width = 100
        Height = 30
        Caption = '&Reservar'
        ModalResult = 1
        TabOrder = 2
        OnClick = BBReservarClick
      end
      object BDesreservar: TBitBtn
        Left = 216
        Top = 8
        Width = 100
        Height = 30
        Cancel = True
        Caption = '&DesReservar'
        TabOrder = 3
        OnClick = BDesreservarClick
      end
      object btnImprimirPreparacion: TBitBtn
        Left = 341
        Top = 8
        Width = 95
        Height = 30
        Hint = 'Imprimir listado de preparacion'
        Caption = 'Preparaci'#243'n'
        TabOrder = 5
        OnClick = btnImprimirPreparacionClick
      end
      object btnImprimirReserva: TBitBtn
        Left = 439
        Top = 8
        Width = 95
        Height = 30
        Hint = 'Imprimir listado de preparacion'
        Caption = 'Reserva'
        TabOrder = 6
        OnClick = btnImprimirReservaClick
      end
      object BtnImprimirEtiqueta: TBitBtn
        Left = 537
        Top = 8
        Width = 95
        Height = 30
        Caption = 'Etiqueta'
        TabOrder = 7
        OnClick = BtnImprimirEtiquetaClick
      end
    end
    object PNLComentarioReserva: TLFPanel
      Left = 0
      Top = 465
      Width = 892
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object MComentarioReserva: TLFDBMemo
        Left = 0
        Top = 25
        Width = 892
        Height = 25
        Align = alClient
        BevelInner = bvNone
        DataField = 'NOTAS'
        DataSource = ProDMIntroduceDatosReserva.DSReserva
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object TBNotasreserva: TLFToolBar
        Left = 0
        Top = 0
        Width = 892
        Height = 25
        Caption = 'TBNotasreserva'
        EdgeInner = esNone
        EdgeOuter = esNone
        TabOrder = 1
        Separators = True
        object NavNotasReserva: THYMNavigator
          Left = 0
          Top = 2
          Width = 121
          Height = 22
          DataSource = ProDMIntroduceDatosReserva.DSReserva
          VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
          Align = alClient
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = MComentarioReserva
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 6
    Top = 10
  end
  object DSQMMaterialesLot_Ubi: TDataSource
    DataSet = ProDMIntroduceDatosReserva.QMMaterialesLot_Ubi
    Left = 24
    Top = 160
  end
  object DSQMCompuesto: TDataSource
    DataSet = ProDMIntroduceDatosReserva.QMCompuesto
    Left = 24
    Top = 208
  end
  object DSSerieComponente: TDataSource
    DataSet = ProDMIntroduceDatosReserva.QMSerieComponente
    Left = 24
    Top = 256
  end
  object DSSerieCompuesto: TDataSource
    DataSet = ProDMIntroduceDatosReserva.QMSerieCompuesto
    Left = 24
    Top = 304
  end
end
