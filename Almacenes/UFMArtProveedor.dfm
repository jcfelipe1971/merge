inherited FMArtProveedor: TFMArtProveedor
  Left = 335
  Width = 800
  Height = 451
  HelpContext = 93
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Tarifas de Proveedor'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 173
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = DMArtProveedor.DSQMTarifasProv
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEDescripcion
        InsertaControl = DBEFProveedor
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
        ImageIndex = 7
      end
      object TBSep: TToolButton
        Left = 337
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBInc: TToolButton
        Left = 345
        Top = 0
        Hint = 'Aplicar Incremento Porcentual'
        Caption = 'Aplicar Incremento Porcentual'
        ImageIndex = 92
        OnClick = TBIncClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 143
      inherited TSFicha: TTabSheet
        object SBAProveedor: TSpeedButton [0]
          Left = 118
          Top = 30
          Width = 160
          Height = 21
          Action = AProveedor
        end
        inherited PEdit: TLFPanel
          Width = 778
          Height = 115
          object LblTarifa: TLFLabel
            Left = 50
            Top = 40
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LblProveedor: TLFLabel
            Left = 28
            Top = 18
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LBLInicio: TLFLabel
            Left = 19
            Top = 84
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inicio'
          end
          object LBLFinal: TLFLabel
            Left = 186
            Top = 83
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Final'
          end
          object LBLDescuento1: TLFLabel
            Left = 464
            Top = 18
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. 1'
          end
          object LBLDescuento2: TLFLabel
            Left = 464
            Top = 40
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. 2'
          end
          object LBLDescuento3: TLFLabel
            Left = 464
            Top = 62
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. 3'
          end
          object LblMoneda: TLFLabel
            Left = 38
            Top = 62
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LUltimaModificacion: TLFLabel
            Left = 388
            Top = 83
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ult. Modif.'
          end
          object DBETarifa: TLFDbedit
            Left = 81
            Top = 36
            Width = 55
            Height = 21
            DataField = 'TARIFA'
            DataSource = DMArtProveedor.DSQMTarifasProv
            TabOrder = 1
          end
          object DBEDescripcion: TLFDbedit
            Left = 137
            Top = 36
            Width = 318
            Height = 21
            DataField = 'TITULO'
            DataSource = DMArtProveedor.DSQMTarifasProv
            TabOrder = 2
          end
          object DBEFProveedor: TLFDBEditFind2000
            Left = 81
            Top = 14
            Width = 55
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = DMArtProveedor.DSQMTarifasProv
            TabOrder = 0
            Accion = FMain.AProveedores
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ver_proveedores_cuentas'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBTICKInicio: TLFDBDateEdit
            Left = 81
            Top = 80
            Width = 87
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMArtProveedor.DSQMTarifasProv
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBTICKFin: TLFDBDateEdit
            Left = 245
            Top = 80
            Width = 87
            Height = 21
            DataField = 'FECHA_FINAL'
            DataSource = DMArtProveedor.DSQMTarifasProv
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBEDescuento1: TLFDbedit
            Left = 497
            Top = 14
            Width = 55
            Height = 21
            DataField = 'DESCUENTO1'
            DataSource = DMArtProveedor.DSQMTarifasProv
            TabOrder = 7
          end
          object DBEDescuento2: TLFDbedit
            Left = 497
            Top = 36
            Width = 55
            Height = 21
            DataField = 'DESCUENTO2'
            DataSource = DMArtProveedor.DSQMTarifasProv
            TabOrder = 8
          end
          object DBEDescuento3: TLFDbedit
            Left = 497
            Top = 58
            Width = 55
            Height = 21
            DataField = 'DESCUENTO3'
            DataSource = DMArtProveedor.DSQMTarifasProv
            TabOrder = 9
          end
          object DBETitProveedor: TLFDbedit
            Left = 137
            Top = 14
            Width = 318
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_PROVEEDOR'
            DataSource = DMArtProveedor.DSQMTarifasProv
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            OnDblClick = DBETitProveedorDblClick
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 81
            Top = 58
            Width = 55
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMArtProveedor.DSQMTarifasProv
            TabOrder = 3
            OnChange = DBEFMonedaChange
            Accion = FMain.AMonedas
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
          end
          object DBEMoneda: TLFDbedit
            Left = 137
            Top = 58
            Width = 318
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArtProveedor.DSxMonedas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEUltModificacion: TLFDbedit
            Left = 440
            Top = 80
            Width = 112
            Height = 21
            Color = clInfoBk
            DataField = 'ULT_MODIFICACION'
            DataSource = DMArtProveedor.DSQMTarifasProv
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 115
          DataSource = DMArtProveedor.DSQMTarifasProv
          UsaDicG2K = False
          CamposAOrdenar.Strings = (
            'DESCUENTO1'
            'DESCUENTO2'
            'DESCUENTO3'
            'FECHA_FINAL'
            'FECHA_INICIO'
            'MONEDA'
            'PROVEEDOR'
            'TARIFA'
            'TITULO'
            'TITULO_PROVEEDOR'
            'ULT_MODIFICACION')
          Columns = <
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_PROVEEDOR'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 288
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FINAL'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO1'
              Title.Alignment = taRightJustify
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO2'
              Title.Alignment = taRightJustify
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO3'
              Title.Alignment = taRightJustify
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ULT_MODIFICACION'
              Visible = True
            end>
        end
      end
    end
  end
  object PEdDetalle: TLFPanel [1]
    Left = 0
    Top = 173
    Width = 790
    Height = 225
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGDetalle: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 790
      Height = 201
      Align = alClient
      DataSource = DMArtProveedor.DSQMTarifasProvArt
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGDetalleCellClick
      OnColEnter = DBGDetalleColEnter
      OnDrawColumnCell = DBGDetalleDrawColumnCell
      OnDblClick = DBGDetalleDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
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
      BuscarNums = True
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '2'
        'TITULO'
        'ARTICULO')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'ARTICULO_PROVEEDOR'
        'P_COSTE'
        'TITULO'
        'ULT_MODIFICACION'
        'ALFA_1'
        'ALFA_2'
        'ALFA_3'
        'ALFA_4'
        'ALFA_5'
        'ALFA_6'
        'ALFA_7'
        'ALFA_8')
      CamposNoAccesibles.Strings = (
        'CANAL'
        'EJERCICIO'
        'EMPRESA'
        'PROVEEDOR')
      CamposNoAccMenosAlIns.Strings = (
        'ARTICULO')
      MensajeNoExiste = False
      Numericos.Strings = (
        'ARTICULO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_ARTICULOS_CUENTAS          ')
      Acciones.Strings = (
        'FMain.AArticulos')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      OnBusqueda = DBGDetalleBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        '')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 89
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
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO_PROVEEDOR'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ULT_MODIFICACION'
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 790
      Height = 24
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = DMArtProveedor.DSQMTarifasProvArt
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGDetalle
        InsertaControl = DBGDetalle
        Exclusivo = True
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
      object TBVerArticulosPorTarifaKri: TToolButton
        Left = 228
        Top = 0
        Hint = 'Tarifas de Proveedor en las que se encuentra el articulo'
        Caption = 'Ver Articulos Por Tarifa'
        ImageIndex = 50
        OnClick = TBVerArticulosPorTarifaKriClick
      end
      object PNLFiltroAgrupacion: TLFPanel
        Left = 251
        Top = 0
        Width = 294
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LAgrupacion: TLFLabel
          Left = 7
          Top = 4
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agrup.'
        end
        object EFAgrupacion: TLFEditFind2000
          Left = 40
          Top = 0
          Width = 57
          Height = 21
          TabOrder = 0
          OnChange = EFAgrupacionChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMArtProveedor.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGRUPACION'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO='#39'T'#39
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_AGRUPACIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGRUPACION')
          Filtros = []
        end
        object EAgrupacion: TLFEdit
          Left = 98
          Top = 0
          Width = 194
          Height = 21
          TabOrder = 1
        end
      end
      object TBSep2: TToolButton
        Left = 545
        Top = 0
        Width = 8
        ImageIndex = 57
        Style = tbsSeparator
      end
      object TBEstablecerPrecio: TToolButton
        Left = 553
        Top = 0
        Hint = 'Establecer Precio de los articulos filtrados'
        Caption = 'Establecer Precio'
        ImageIndex = 56
        OnClick = TBEstablecerPrecioClick
      end
      object TBTraspasoPreciosCosteArticulo: TToolButton
        Left = 576
        Top = 0
        Hint = 
          'Traspasa los precios de una tarifa de proveedor a P_COSTE del ar' +
          'ticulo'
        Caption = 'Traspasar Precios de Coste a Art'#237'culos'
        ImageIndex = 55
        OnClick = TBTraspasoPreciosCosteArticuloClick
      end
      object TBImportar: TToolButton
        Left = 599
        Top = 0
        Hint = 'Importar tarifa desde Excel'
        Caption = 'Importar'
        ImageIndex = 49
        OnClick = TBImportarClick
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 790
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 664
    Top = 6
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 698
    Top = 6
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
    Left = 664
    Top = 66
  end
  inherited FSMain: TLFFibFormStorage
    Left = 698
    Top = 66
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = PMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 664
    Top = 36
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 698
    Top = 36
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
  object ALOtros: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 664
    Top = 96
    object AArticulo: TAction
      Caption = 'Abre ficha de articulo'
      Hint = 'Abre ficha de articulo'
      OnExecute = AArticuloExecute
    end
    object AProveedor: TAction
      Caption = 'Abre ficha de proveedor'
      Hint = 'Abre ficha de proveedor'
      OnExecute = AProveedorExecute
    end
  end
end
