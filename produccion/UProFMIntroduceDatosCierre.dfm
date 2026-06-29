object ProFMIntroduceDatosCierre: TProFMIntroduceDatosCierre
  Left = 449
  Top = 98
  Width = 936
  Height = 583
  Caption = 'Introducci'#243'n datos Cierre'
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 830
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
    Width = 928
    Height = 556
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LFPMain: TLFPanel
      Left = 0
      Top = 81
      Width = 928
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PCMain: TLFPageControl
        Left = 0
        Top = 0
        Width = 928
        Height = 434
        ActivePage = TSComponentes
        Align = alClient
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 0
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSComponentes: TTabSheet
          Caption = 'Componentes'
          object PNLComponentes: TLFPanel
            Left = 0
            Top = 22
            Width = 920
            Height = 384
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGLot_Ubi: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 920
              Height = 384
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
                'ID_UBICACION'
                'ALMACEN_DEVOLVER')
              CamposAMostrar.Strings = (
                'ID_UBICACION'
                '1'
                'ALMACEN'
                'ALMACEN_DEVOLVER'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0'
                '0')
              CamposADevolver.Strings = (
                ''
                '')
              CamposDesplegar.Strings = (
                '1'
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              MensajeNoExiste = False
              Numericos.Strings = (
                'ID_UBICACION'
                'ALMACEN')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_ALMACENES_UBICACIONES'
                'VER_ALMACENES')
              Acciones.Strings = (
                ''
                '')
              Titulos.Strings = (
                'TITULO'
                'AL_TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGLot_UbiBusqueda
              Planes.Strings = (
                ''
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'COMPOSICION'
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
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'COMPONENTE'
                  ReadOnly = True
                  Width = 75
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
                  Width = 79
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
                  FieldName = 'ID_LOTE'
                  Width = 60
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
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_DEVOLVER'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN_DEVOLVER'
                  Width = 45
                  Visible = True
                end>
            end
          end
          object TBLotes: TLFToolBar
            Left = 0
            Top = 0
            Width = 920
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
            Width = 920
            Height = 384
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGFCompuesto: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 920
              Height = 384
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
                  FieldName = 'ID_LOTE'
                  ReadOnly = False
                  Width = 60
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DESC_LOTE'
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
                end>
            end
          end
          object TBCompuesto: TLFToolBar
            Left = 0
            Top = 0
            Width = 920
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
            Width = 920
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
            Width = 920
            Height = 384
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGSerieComponente: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 920
              Height = 384
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
                'VER_DETALLE_SERIALIZACION')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'NSERIE')
              Posicion = tpCentrado
              OnBusqueda = DBGSerieComponenteBusqueda
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
        object TSSeriesCompuesto: TTabSheet
          Caption = 'Serializaci'#243'n Compuesto'
          ImageIndex = 2
          object TBSerializacionCompuesto: TLFToolBar
            Left = 0
            Top = 0
            Width = 920
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
            Width = 920
            Height = 384
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGSerieCompuesto: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 920
              Height = 384
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
      Width = 928
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
        Left = 527
        Top = 15
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object LUnidades: TLFLabel
        Left = 512
        Top = 37
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades'
      end
      object LUnidadesReservadas: TLFLabel
        Left = 664
        Top = 37
        Width = 62
        Height = 13
        Hint = 'Unidades Reservadas'
        Alignment = taRightJustify
        Caption = 'Uds. Reserv.'
      end
      object LReservas: TLFLabel
        Left = 681
        Top = 15
        Width = 45
        Height = 13
        Hint = 'Cantidad de Reservas'
        Alignment = taRightJustify
        Caption = 'Reservas'
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
        TabOrder = 0
      end
      object DBEUnidades: TLFDbedit
        Left = 562
        Top = 33
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'UNI_TOTAL'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        TabOrder = 1
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
        TabOrder = 2
      end
      object DBECompuesto: TLFDbedit
        Left = 118
        Top = 33
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMOrden.DSQMProOrd
        Enabled = False
        TabOrder = 3
        OnChange = DBECompuestoChange
      end
      object ETituloCompuesto: TLFEdit
        Left = 206
        Top = 33
        Width = 269
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBELUnidadesReservadas: TLFDbedit
        Left = 730
        Top = 33
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'UNIDADES_RESERVAS'
        DataSource = DSQMCompuesto
        Enabled = False
        TabOrder = 5
      end
      object DBEReservas: TLFDbedit
        Left = 730
        Top = 11
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'CANT_RESERVAS'
        DataSource = DSQMCompuesto
        Enabled = False
        TabOrder = 6
      end
    end
    object PNLComponentesBotonera: TLFPanel
      Left = 0
      Top = 515
      Width = 928
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object BSeguir: TBitBtn
        Left = 233
        Top = 7
        Width = 80
        Height = 30
        Caption = '&Aceptar'
        ModalResult = 1
        TabOrder = 0
        OnClick = BSeguirClick
      end
      object BCancelar: TBitBtn
        Left = 489
        Top = 7
        Width = 80
        Height = 30
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = BCancelarClick
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
    Left = 646
    Top = 10
  end
  object DSQMMaterialesLot_Ubi: TDataSource
    DataSet = ProDMIntroduceDatosCierre.QMMaterialesLot_Ubi
    Left = 24
    Top = 160
  end
  object DSQMCompuesto: TDataSource
    DataSet = ProDMIntroduceDatosCierre.QMCompuesto
    Left = 24
    Top = 208
  end
  object DSSerieComponente: TDataSource
    DataSet = ProDMIntroduceDatosCierre.QMSerieComponente
    Left = 24
    Top = 256
  end
  object DSSerieCompuesto: TDataSource
    DataSet = ProDMIntroduceDatosCierre.QMSerieCompuesto
    Left = 24
    Top = 304
  end
end
