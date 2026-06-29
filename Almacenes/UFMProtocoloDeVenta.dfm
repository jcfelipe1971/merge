inherited FMProtocoloDeVenta: TFMProtocoloDeVenta
  Left = 497
  Top = 355
  Caption = 'Protocolo De Venta'
  ClientWidth = 562
  OldCreateOrder = True
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 562
    inherited TBMain: TLFToolBar
      Width = 558
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBDEFechaAlta
        InsertaControl = DBEProtocolo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      object ToolButton1: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBTipoProtocolo: TLFComboBox
        Left = 347
        Top = 0
        Width = 145
        Height = 21
        AutoDropDown = True
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 2
        Text = 'Cliente-Familia'
        OnChange = CBTipoProtocoloChange
        Items.Strings = (
          'Cliente-Articulo'
          'Cliente-Familia')
      end
    end
    inherited PCMain: TLFPageControl
      Width = 558
      Height = 109
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 550
          Height = 81
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMProtocoloDeVenta.DSQMProtocolo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_PROTOCOLO_C'
            CampoNum = 'PROTOCOLO'
            CampoStr = 'TIPO'
            CondicionBusqueda = 'TIPO='#39'CCA'#39
          end
          object LProtocolo: TLFLabel
            Left = 32
            Top = 12
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Protocolo'
          end
          object LFechaAlta: TLFLabel
            Left = 26
            Top = 33
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
          end
          object LFechaBaja: TLFLabel
            Left = 23
            Top = 55
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Baja'
          end
          object DBEProtocolo: TLFDBEditFind2000
            Left = 80
            Top = 8
            Width = 121
            Height = 21
            DataField = 'PROTOCOLO'
            DataSource = DMProtocoloDeVenta.DSQMProtocolo
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PROTOCOLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROTOCOLO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROTOCOLO')
            Filtros = []
          end
          object DBDEFechaAlta: TLFDBDateEdit
            Left = 80
            Top = 30
            Width = 121
            Height = 21
            DataField = 'ALTA'
            DataSource = DMProtocoloDeVenta.DSQMProtocolo
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBDEFechaBaja: TLFDBDateEdit
            Left = 80
            Top = 52
            Width = 121
            Height = 21
            DataField = 'BAJA'
            DataSource = DMProtocoloDeVenta.DSQMProtocolo
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBETitulo: TLFDbedit
            Left = 201
            Top = 8
            Width = 345
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProtocoloDeVenta.DSQMProtocolo
            Enabled = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 550
          Height = 81
          DataSource = DMProtocoloDeVenta.DSQMProtocolo
          Columns = <
            item
              Expanded = False
              FieldName = 'PROTOCOLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Width = 100
              Visible = True
            end>
        end
      end
    end
    object PDetalle: TLFPanel
      Left = 2
      Top = 137
      Width = 558
      Height = 193
      Align = alClient
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 1
        Top = 1
        Width = 556
        Height = 22
        AutoSize = True
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 240
          Height = 22
          DataSource = DMProtocoloDeVenta.DSQMDetalle
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGDetalle
          InsertaControl = DBGDetalle
          Exclusivo = False
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
      object DBGDetalle: TDBGridFind2000
        Left = 1
        Top = 23
        Width = 556
        Height = 169
        Align = alClient
        DataSource = DMProtocoloDeVenta.DSQMDetalle
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 1
        UsaDicG2K = True
        Changed = False
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        Transaction = DMProtocoloDeVenta.TLocal
        BuscarNums = False
        Campos.Strings = (
          'ARTICULO'
          'FAMILIA')
        CamposAMostrar.Strings = (
          'ARTICULO'
          '0'
          'FAMILIA'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0')
        CamposADevolver.Strings = (
          'ARTICULO'
          'FAMILIA')
        CamposDesplegar.Strings = (
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'ARTICULO'
          'FAMILIA')
        MensajeNoExiste = False
        Numericos.Strings = (
          'ARTICULO'
          'FAMILIA')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'VER_ARTICULOS_EF'
          'ART_FAMILIAS')
        Acciones.Strings = (
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGDetalleBusqueda
        Planes.Strings = (
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'ARTICULO'
          'FAMILIA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAMILIA'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNID_MINIMAS'
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNID_MAXIMAS'
            ReadOnly = True
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO_2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO_3'
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 562
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadoProtocolo: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado de Protocolo'
      Hint = 'Visualizar Listado de Protocolo'
      ImageIndex = 14
      OnExecute = AListadoProtocoloExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfListadosProtocolo: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Protocolo'
      Hint = 'Listados de Protocolo'
      ImageIndex = 14
      OnExecute = AConfListadosProtocoloExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      Hint = 'Procesos'
      ImageIndex = 16
    end
    object ARegeneraCondiciones: TAction
      Category = 'Procesos'
      Caption = 'Regenera Condiciones de Cliente'
      Hint = 'Regenera las condiciones de Cliente'
      ImageIndex = 26
      OnExecute = ARegeneraCondicionesExecute
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 280
    Top = 72
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 320
    Top = 72
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
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
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
end
