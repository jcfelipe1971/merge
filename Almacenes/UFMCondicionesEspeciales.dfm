inherited FMCondicionesEspeciales: TFMCondicionesEspeciales
  Left = 387
  Top = 307
  Width = 600
  Height = 451
  HelpContext = 94
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Condiciones Especiales'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 253
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 586
      ButtonWidth = 24
      inherited NavMain: THYMNavigator
        DataSource = DMCondicionesEspeciales.DSQMCondiciones
        Hints.Strings = ()
        EditaControl = DBDTPFechaAlta
        InsertaControl = DBDTPFechaAlta
      end
      inherited EPMain: THYMEditPanel
        Width = 48
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 276
      end
      inherited TbuttComp: TToolButton
        Left = 284
      end
      object ToolButton1: TToolButton
        Left = 308
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBTipoCondicion: TLFComboBox
        Left = 316
        Top = 0
        Width = 196
        Height = 21
        Style = csDropDownList
        DropDownCount = 12
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBTipoCondicionChange
        Items.Strings = (
          'Elija Tipo de Condici'#243'n Especial:'
          'Cond. Cliente / Art'#237'culo'
          'Cond. Agrupaci'#243'n Clientes / Art'#237'culo'
          'Cond. Perfil / Art'#237'culo'
          'Cond. Art'#237'culo'
          'Cond. Cliente / Familia'
          'Cond. Agrupaci'#243'n Clientes / Familia'
          'Cond. Perfil / Familia'
          'Cond. Familia'
          'Cond. Agrupaci'#243'n Clientes'
          'Cond. Perfil'
          'Cond. Cliente / Agrupaci'#243'n  Art'#237'culo')
      end
    end
    inherited PCMain: TLFPageControl
      Top = 50
      Width = 586
      Height = 201
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 173
          inherited G2KTableLoc: TG2KTBLoc
            Top = 28
          end
          object LBLArticulo: TLFLabel
            Left = 52
            Top = 104
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LBLCondicion: TLFLabel
            Left = 42
            Top = 6
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Condici'#243'n'
          end
          object LBLCliente: TLFLabel
            Left = 57
            Top = 28
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LBLFechaAlta: TLFLabel
            Left = 264
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Alta'
          end
          object LBLFechaBaja: TLFLabel
            Left = 397
            Top = 6
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Baja'
          end
          object LBLAgrupacion: TLFLabel
            Left = 18
            Top = 60
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrup. Clientes'
          end
          object LBLPerfil: TLFLabel
            Left = 66
            Top = 82
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perfil'
          end
          object LBLFamilia: TLFLabel
            Left = 57
            Top = 126
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object DBCHKActiva: TLFDBCheckBox
            Left = 95
            Top = 146
            Width = 59
            Height = 17
            Caption = 'Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFArticulo: TLFDBEditFind2000
            Left = 95
            Top = 100
            Width = 102
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            TabOrder = 5
            OnChange = DBEFArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFArticuloBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDBDArticulo: TLFHYDBDescription
            Left = 198
            Top = 100
            Width = 327
            Height = 21
            Color = clInfoBk
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'ARTICULO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'ARTICULO')
          end
          object DBECondicion: TLFDbedit
            Left = 95
            Top = 2
            Width = 102
            Height = 21
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 95
            Top = 24
            Width = 102
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            TabOrder = 2
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDBDCliente: TLFHYDBDescription
            Left = 198
            Top = 24
            Width = 327
            Height = 21
            Color = clInfoBk
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'EJERCICIO'
              'CANAL'
              'CLIENTE')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EJERCICIO'
              'CANAL'
              'CLIENTE')
          end
          object DBDTPFechaAlta: TLFDBDateEdit
            Left = 301
            Top = 2
            Width = 87
            Height = 21
            DataField = 'ALTA'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 438
            Top = 2
            Width = 87
            Height = 21
            DataField = 'BAJA'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEFAgrupacion: TLFDBEditFind2000
            Left = 95
            Top = 56
            Width = 102
            Height = 21
            DataField = 'AGRUPACION'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            TabOrder = 3
            OnChange = DBEFAgrupacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGRUPACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo='#39'C'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDBDAgrupacion: TLFHYDBDescription
            Left = 198
            Top = 56
            Width = 327
            Height = 21
            Color = clInfoBk
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            Tabla_a_buscar = 'VER_AGRUPACIONES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'AGRUPACION')
            CamposWhereTabla.Strings = (
              'AGRUPACION')
          end
          object HYDBDPerfil: TLFHYDBDescription
            Left = 198
            Top = 78
            Width = 327
            Height = 21
            Color = clInfoBk
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            Tabla_a_buscar = 'SYS_PERFILES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'PERFIL')
            CamposWhereTabla.Strings = (
              'PERFIL')
          end
          object DBEFPerfil: TLFDBEditFind2000
            Left = 95
            Top = 78
            Width = 102
            Height = 21
            DataField = 'PERFIL'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            TabOrder = 4
            OnChange = DBEFPerfilChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PERFILES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PERFIL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PERFIL')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDBDFamilia: TLFHYDBDescription
            Left = 198
            Top = 122
            Width = 327
            Height = 21
            Color = clInfoBk
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
            Tabla_a_buscar = 'ART_FAMILIAS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'FAMILIA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'FAMILIA')
          end
          object DBEFFamilia: TLFDBEditFind2000
            Left = 95
            Top = 122
            Width = 102
            Height = 21
            DataField = 'FAMILIA'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            TabOrder = 6
            OnChange = DBEFFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFFamiliaBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCHKTraspasar: TLFDBCheckBox
            Left = 203
            Top = 146
            Width = 154
            Height = 17
            Caption = 'Traspasar entre ejercicios'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TRASPASAR'
            DataSource = DMCondicionesEspeciales.DSQMCondiciones
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 173
          DataSource = DMCondicionesEspeciales.DSQMCondiciones
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'AGRUPACION'
            'ALTA'
            'ARTICULO'
            'BAJA'
            'CLIENTE'
            'FAMILIA'
            'PERFIL'
            'RIG'
            'TITULO_AGRUPACION'
            'TITULO_ARTICULO'
            'TITULO_CLIENTE'
            'TITULO_FAMILIA'
            'TITULO_PERFIL')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTA'
              Width = 177
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Width = 148
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_FAMILIA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERFIL'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_PERFIL'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGRUPACION'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_AGRUPACION'
              Width = 87
              Visible = True
            end>
        end
      end
    end
    object PBusqueda: TLFPanel
      Left = 2
      Top = 28
      Width = 586
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LCliente: TLFLabel
        Left = 5
        Top = 3
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
      end
      object LAgrupacion: TLFLabel
        Left = 110
        Top = 3
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupacion'
      end
      object LPerfil: TLFLabel
        Left = 234
        Top = 3
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'Perfil'
      end
      object LArticulo: TLFLabel
        Left = 333
        Top = 2
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Articulo'
      end
      object LFamilia: TLFLabel
        Left = 479
        Top = 2
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Familia'
      end
      object EFCliente: TLFEditFind2000
        Left = 40
        Top = 1
        Width = 65
        Height = 21
        TabOrder = 0
        OnChange = EFClienteChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFAgrupacion: TLFEditFind2000
        Left = 167
        Top = 1
        Width = 65
        Height = 21
        TabOrder = 1
        OnChange = EFAgrupacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArticulo: TLFEditFind2000
        Left = 372
        Top = 1
        Width = 101
        Height = 21
        TabOrder = 3
        OnChange = EFArticuloChange
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
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFPerfil: TLFEditFind2000
        Left = 261
        Top = 1
        Width = 65
        Height = 21
        TabOrder = 2
        OnChange = EFPerfilChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PERFIL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PERFILES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PERFIL')
        Filtros = []
      end
      object EFFamilia: TLFEditFind2000
        Left = 515
        Top = 1
        Width = 65
        Height = 21
        TabOrder = 4
        OnChange = EFFamiliaChange
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
    end
  end
  object PDetalle: TLFPanel [1]
    Left = 0
    Top = 253
    Width = 590
    Height = 145
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 22
      Width = 590
      Height = 123
      HelpContext = 94
      Align = alClient
      DataSource = DMCondicionesEspeciales.DSQMDetalle
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGFDetalleColEnter
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
      Transaction = DMCondicionesEspeciales.TLocal
      BuscarNums = False
      CamposAMostrarAnchos.Strings = (
        '0')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'LINEA'
        'UNID_MINIMAS'
        'UNID_MAXIMAS'
        'PRECIO'
        'DESCUENTO'
        'DESCUENTO_2'
        'DESCUENTO_3')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNID_MINIMAS'
          Width = 85
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNID_MAXIMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_2'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_3'
          Width = 70
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 590
      Height = 22
      AutoSize = True
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
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
        DataSource = DMCondicionesEspeciales.DSQMDetalle
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
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 376
    Top = 86
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 422
    Top = 88
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AVisualizarCondEsp: TLFDatasetAction
      Category = 'Listados'
      Caption = 'Visualizar Listado de Condiciones Filtradas'
      Hint = 'Visualizar Listado de Condiciones Filtradas'
      ImageIndex = 14
      OnExecute = AVisualizarCondEspExecute
      DataSource = DMCondicionesEspeciales.DSQMCondiciones
    end
    object AImprimirCondiciones: TLFDatasetAction
      Category = 'Listados'
      Caption = 'Imprimir Listado de Condiciones Filtradas'
      Hint = 'Imprimir Listado de Condiciones Filtradas'
      ImageIndex = 14
      OnExecute = AImprimirCondicionesExecute
      DataSource = DMCondicionesEspeciales.DSQMCondiciones
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfListadosCondiciones: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Condiciones'
      Hint = 'Listados de Condiciones'
      ImageIndex = 14
      OnExecute = AConfListadosCondicionesExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = PMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 378
    Top = 129
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 424
    Top = 130
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
