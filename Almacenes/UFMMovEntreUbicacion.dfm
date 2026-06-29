object FMMovEntreUbicaciones: TFMMovEntreUbicaciones
  Left = 407
  Top = 143
  Width = 800
  Height = 600
  ActiveControl = EFAlmacen
  Caption = 'Movimientos entre ubicaciones'
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMovSimplePMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PCMovEntreUbicaciones: TLFPageControl
    Left = 0
    Top = 24
    Width = 792
    Height = 549
    ActivePage = TSMovEntreUbicaciones
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 0
    OnChanging = PCMovEntreUbicacionesChanging
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSMovEntreUbicaciones: TTabSheet
      Caption = 'Entre Ubicaciones'
      object PNMovimientos: TLFPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 521
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PNCabecera: TLFPanel
          Left = 0
          Top = 0
          Width = 784
          Height = 250
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object GBOrigen: TGroupBox
            Left = 0
            Top = 0
            Width = 390
            Height = 250
            Align = alLeft
            Caption = 'Ubicaci'#243'n Origen'
            TabOrder = 0
            object LFLabel1: TLFLabel
              Left = 2
              Top = 45
              Width = 386
              Height = 13
              Align = alTop
              Caption = 'Art'#237'culos en la ubicaci'#243'n'
              Layout = tlCenter
            end
            object DBGFArticulosOrigen: TDBGridFind2000
              Left = 2
              Top = 58
              Width = 386
              Height = 190
              Align = alClient
              DataSource = DMMovEntreUbicaciones.DSxArticulosO
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
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
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Width = 61
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Width = 193
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXISTENCIAS'
                  Visible = True
                end>
            end
            object LFPanel1: TLFPanel
              Left = 2
              Top = 15
              Width = 386
              Height = 30
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object EFUbicacionO: TLFEditFind2000
                Left = 4
                Top = 4
                Width = 121
                Height = 21
                TabOrder = 0
                OnChange = EFUbicacionOChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'COMPOSICION'
                CampoStr = 'TITULO'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
                Tabla_asociada.DesplegarBusqueda = False
                OnBusqueda = EFUbicacionOBusqueda
                OrdenadoPor.Strings = (
                  'COMPOSICION')
                Filtros = []
              end
              object DBETitUbicacion: TLFDbedit
                Left = 126
                Top = 4
                Width = 256
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMMovEntreUbicaciones.DSxUbicacionO
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
            end
          end
          object GBDestino: TGroupBox
            Left = 390
            Top = 0
            Width = 394
            Height = 250
            Align = alClient
            Caption = 'Ubicaci'#243'n Destino'
            TabOrder = 1
            object LFLabel2: TLFLabel
              Left = 2
              Top = 45
              Width = 390
              Height = 13
              Align = alTop
              Caption = 'Art'#237'culos en la ubicaci'#243'n'
              Layout = tlCenter
            end
            object DBGFArticulosDestino: TDBGridFind2000
              Left = 2
              Top = 58
              Width = 390
              Height = 190
              Align = alClient
              DataSource = DMMovEntreUbicaciones.DSxArticulosD
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
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
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Width = 162
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXISTENCIAS'
                  Visible = True
                end>
            end
            object LFPanel2: TLFPanel
              Left = 2
              Top = 15
              Width = 390
              Height = 30
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object EFUbicacionD: TLFEditFind2000
                Left = 4
                Top = 4
                Width = 120
                Height = 21
                TabOrder = 0
                OnChange = EFUbicacionDChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'COMPOSICION'
                CampoStr = 'TITULO'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
                Tabla_asociada.DesplegarBusqueda = False
                OnBusqueda = EFUbicacionDBusqueda
                OrdenadoPor.Strings = (
                  'COMPOSICION')
                Filtros = []
              end
              object DBETitUbicacionD: TLFDbedit
                Left = 125
                Top = 4
                Width = 256
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMMovEntreUbicaciones.DSxUbicacionD
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
            end
          end
        end
        object PMDetalle: TLFPanel
          Left = 0
          Top = 250
          Width = 784
          Height = 271
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 784
            Height = 249
            Align = alClient
            DataSource = DMMovEntreUbicaciones.DSQMDetalle
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColEnter = DBGFDetalleColEnter
            OnKeyUp = DBGFDetalleKeyUp
            IniStorage = FSMain
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
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'ARTICULO'
              'LOTE')
            CamposAMostrar.Strings = (
              'ARTICULO'
              '0'
              'LOTE'
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
            CamposNoAccesibles.Strings = (
              'ALMACEN'
              'CALLE'
              'ESTANTERIA'
              'ENTRADA'
              'ID_A'
              'ID_UBICACION'
              'POSICION'
              'REPISA'
              'LINEA')
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO'
              'LOTE')
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_ARTICULOS_UBICACIONES'
              'VER_LOTES_UBICACION_DISP_VEN')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'TITULO_DESCRIPCION'
              'CADUCIDAD')
            Posicion = tpCentrado
            OnBusqueda = DBGFDetalleBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              'LOTE')
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 360
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_LOTE'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LOTE'
                ReadOnly = True
                Width = 64
                Visible = True
              end>
          end
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 784
            Height = 22
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavMain: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 22
              DataSource = DMMovEntreUbicaciones.DSQMDetalle
              Flat = True
              ParentShowHint = False
              PopupMenu = CEMainPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CEMain
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TBSeparador1: TToolButton
              Left = 220
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtAceptar: TToolButton
              Left = 228
              Top = 0
              Action = AAceptar
            end
          end
        end
      end
    end
    object TSMovimientoSimple: TTabSheet
      Caption = 'Movimiento Simple'
      ImageIndex = 1
      OnShow = TSMovimientoSimpleShow
      object TBMovSimple: TLFToolBar
        Left = 0
        Top = 0
        Width = 784
        Height = 25
        AutoSize = True
        ButtonHeight = 23
        EdgeInner = esNone
        EdgeOuter = esNone
        HotImages = DMMain.ILMain_In
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavMovSimple: THYMNavigator
          Left = 0
          Top = 2
          Width = 240
          Height = 23
          DataSource = DMMovEntreUbicaciones.DSQMDetalleMovSimple
          ParentShowHint = False
          PopupMenu = CEMovSimplePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          ControlEdit = CEMovSimple
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object ToolButton3: TToolButton
          Left = 240
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TBTraspaso: TToolButton
          Left = 248
          Top = 2
          Caption = 'TBTraspaso'
          ImageIndex = 19
          OnClick = TBTraspasoClick
        end
      end
      object DBGMovimientoSimple: TDBGridFind2000
        Left = 0
        Top = 25
        Width = 784
        Height = 496
        Align = alClient
        DataSource = DMMovEntreUbicaciones.DSQMDetalleMovSimple
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGMovimientoSimpleColEnter
        OnKeyUp = DBGMovimientoSimpleKeyUp
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
          'ID_UBICACION'
          'D_ID_UBICACION'
          'ARTICULO'
          'LOTE')
        CamposAMostrar.Strings = (
          'ID_UBICACION'
          '1'
          'COMPOSICION'
          'D_ID_UBICACION'
          '0'
          'ARTICULO'
          '0'
          'LOTE'
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
        MensajeNoExiste = False
        Numericos.Strings = (
          'ID_UBICACION'
          'ID_UBICACION'
          'ARTICULO'
          'LOTE')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'VER_ARTICULOS_UBICACIONES'
          'ART_ALMACENES_UBICACIONES'
          'VER_ARTICULOS_CUENTAS'
          'VER_LOTES_UBICACION_DISP_VEN')
        Acciones.Strings = (
          ''
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO_DESCRIPCION'
          'COMPOSICION'
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGMovimientoSimpleBusqueda
        Planes.Strings = (
          ''
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'COMPOSICION'
          'ID_UBICACION'
          'ARTICULO'
          'LOTE'
          'ID_A')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Width = 81
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
            Expanded = False
            FieldName = 'UNIDADES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_UBICACION'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CALLE'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ESTANTERIA'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'REPISA'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'POSICION'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_UBIC_ORIGEN'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_ID_UBICACION'
            Width = 64
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'D_CALLE'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'D_ESTANTERIA'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'D_REPISA'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'D_POSICION'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_UBIC_DESTINO'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_LOTE'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LOTE'
            ReadOnly = True
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 24
    EdgeBorders = []
    Flat = True
    TabOrder = 1
    Separators = True
    object EPMain: THYMEditPanel
      Left = 0
      Top = 0
      Width = 22
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
    object ToolButton1: TToolButton
      Left = 22
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PNLAlmacen: TLFPanel
      Left = 30
      Top = 0
      Width = 385
      Height = 22
      BevelOuter = bvNone
      TabOrder = 1
      object LAlmacen: TLFLabel
        Left = 0
        Top = 0
        Width = 59
        Height = 22
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Almacen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFAlmacen: TLFEditFind2000
        Left = 62
        Top = 0
        Width = 57
        Height = 21
        TabOrder = 0
        OnChange = EFAlmacenChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ALMACEN'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'CTROL_UBICACION=1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ALMACENES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ALMACEN')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloAlmacen: TLFEdit
        Left = 120
        Top = 0
        Width = 263
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object CEMain: TControlEdit
    EnlazadoA = CEMovSimple
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 480
    Top = 352
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 568
    Top = 352
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 320
    Top = 176
    object AAceptar: TAction
      Category = 'Traspaso'
      Caption = 'Aceptar Traspaso'
      Hint = 'Aceptar Traspaso'
      ImageIndex = 19
      OnExecute = AAceptarExecute
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
    Left = 204
    Top = 154
  end
  object CEMovSimple: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEMovSimplePMEdit
    Teclas = DMMain.Teclas
    Left = 480
    Top = 384
  end
  object CEMovSimplePMEdit: TPopUpTeclas
    Left = 568
    Top = 384
    object CEMovSimpleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMovSimpleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMovSimpleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMovSimpleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMovSimpleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMovSimpleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMovSimpleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMovSimpleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMovSimpleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMovSimpleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
