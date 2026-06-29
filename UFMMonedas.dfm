inherited FMMonedas: TFMMonedas
  Left = 782
  Top = 249
  Width = 476
  Height = 359
  HelpContext = 297
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Monedas'
  PopupMenu = CEIdiomasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 466
    Height = 306
    inherited TBMain: TLFToolBar
      Width = 462
      inherited NavMain: THYMNavigator
        DataSource = DMMonedas.DSQMMonedas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEMoneda
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEMoneda
        Busca02 = DBETitulo
        Busca03 = DBEClave
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 462
      Height = 276
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 454
          Height = 248
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMMonedas.DSQMMonedas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_MONEDAS'
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'MONEDA')
          end
          object LBLMoneda: TLFLabel
            Left = 25
            Top = 14
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLNombre: TLFLabel
            Left = 27
            Top = 36
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LBLClave: TLFLabel
            Left = 37
            Top = 58
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave'
          end
          object LBLDecVer: TLFLabel
            Left = 225
            Top = 81
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Decimales a Ver'
          end
          object LBLDecCalc: TLFLabel
            Left = 236
            Top = 105
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dec. C'#225'lculos'
          end
          object LBLGenero: TLFLabel
            Left = 29
            Top = 80
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'G'#233'nero'
          end
          object LBLDescDecimales: TLFLabel
            Left = 0
            Top = 102
            Width = 64
            Height = 13
            Caption = 'Desc. Decim.'
          end
          object LBLVentas: TLFLabel
            Left = 31
            Top = 144
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ventas'
          end
          object LBLCompras: TLFLabel
            Left = 23
            Top = 166
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Compras'
          end
          object LBLCli: TLFLabel
            Left = 27
            Top = 188
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clientes'
          end
          object LBLProv: TLFLabel
            Left = 4
            Top = 210
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedores'
          end
          object DBEMoneda: TLFDbedit
            Left = 68
            Top = 10
            Width = 43
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MONEDA'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 68
            Top = 32
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 1
          end
          object DBEClave: TLFDbedit
            Left = 68
            Top = 54
            Width = 45
            Height = 21
            DataField = 'SIGNO_MONEDA'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 2
          end
          object DBSEDecVer: TDBSpinEdit
            Left = 306
            Top = 76
            Width = 45
            Height = 22
            MaxLength = 1
            MaxValue = 6
            MinValue = 0
            TabOrder = 6
            Value = 2
            DataField = 'DEC_VER'
            DataSource = DMMonedas.DSQMMonedas
          end
          object DBCHKDefecto: TLFDBCheckBox
            Left = 56
            Top = 121
            Width = 97
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMMonedas.DSQMMonedas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBSEDecCal: TDBSpinEdit
            Left = 306
            Top = 99
            Width = 45
            Height = 22
            MaxLength = 1
            MaxValue = 6
            MinValue = 0
            TabOrder = 7
            Value = 3
            DataField = 'DEC_CALCULOS'
            DataSource = DMMonedas.DSQMMonedas
          end
          object DBCBVGenero: TDBComboBoxValue
            Left = 68
            Top = 76
            Width = 145
            Height = 21
            Style = csDropDownList
            DataField = 'GENERO_MASCULINO'
            DataSource = DMMonedas.DSQMMonedas
            ItemHeight = 13
            Items.Strings = (
              'Masculino'
              'Femenino')
            Values.Strings = (
              '1'
              '0')
            TabOrder = 3
          end
          object LFDescDecimales: TLFDbedit
            Left = 68
            Top = 98
            Width = 145
            Height = 21
            DataField = 'DESC_DECIMALES'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 4
          end
          object DBEVentas: TLFDBEditFind2000
            Left = 68
            Top = 140
            Width = 98
            Height = 21
            DataField = 'CUENTA_PRI_VENTAS'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 8
            OnChange = DBEVentasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECompras: TLFDBEditFind2000
            Left = 68
            Top = 162
            Width = 98
            Height = 21
            DataField = 'CUENTA_PRI_COMPRAS'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 9
            OnChange = DBEComprasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBECli: TLFDBEditFind2000
            Left = 68
            Top = 184
            Width = 98
            Height = 21
            DataField = 'CUENTA_CLIENTE'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 10
            OnChange = LFDBECliChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBEPro: TLFDBEditFind2000
            Left = 68
            Top = 206
            Width = 98
            Height = 21
            DataField = 'CUENTA_PROVEEDOR'
            DataSource = DMMonedas.DSQMMonedas
            TabOrder = 11
            OnChange = LFDBEProChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCuentaVentas: TLFEdit
            Left = 167
            Top = 140
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 12
          end
          object ETituloCuentaCompras: TLFEdit
            Left = 167
            Top = 162
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 13
          end
          object ETituloCuentaClientes: TLFEdit
            Left = 167
            Top = 184
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 14
          end
          object ETituloCuentaProveedores: TLFEdit
            Left = 167
            Top = 206
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
          end
        end
      end
      object TSIdiomas: TTabSheet [1]
        Caption = '&Idioma'
        ImageIndex = 2
        OnShow = TSIdiomasShow
        object PNIdioma: TLFPanel
          Left = 0
          Top = 0
          Width = 454
          Height = 248
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFToolBar1: TLFToolBar
            Left = 0
            Top = 0
            Width = 454
            Height = 26
            ButtonHeight = 21
            EdgeInner = esNone
            EdgeOuter = esNone
            TabOrder = 0
            Separators = True
            object NavIdiomas: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 21
              DataSource = DMMonedas.DSQMIdiomas
              Flat = True
              ParentShowHint = False
              PopupMenu = CEIdiomasPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CEIdiomas
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton1: TToolButton
              Left = 240
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object DBEMonea: TLFDbedit
              Left = 248
              Top = 2
              Width = 153
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMMonedas.DSQMMonedas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object PNIdiomas: TLFPanel
            Left = 0
            Top = 26
            Width = 454
            Height = 222
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGFIdiomas: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 454
              Height = 222
              Align = alClient
              DataSource = DMMonedas.DSQMIdiomas
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
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
                'IDIOMA')
              CamposAMostrar.Strings = (
                'IDIOMA'
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
                'IDIOMA')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'SYS_IDIOMAS')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGFIdiomasBusqueda
              Planes.Strings = (
                '')
              OrdenMultiple = True
              Filtros = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'IDIOMA'
                  Width = 41
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 261
                  Visible = True
                end>
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 454
          Height = 248
          DataSource = DMMonedas.DSQMMonedas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'DEC_CALCULOS'
            'DEC_VER'
            'MONEDA'
            'SIGNO_MONEDA'
            'TITULO')
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'MONEDA'
              Title.Alignment = taCenter
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 241
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SIGNO_MONEDA'
              Title.Alignment = taCenter
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEC_VER'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEC_CALCULOS'
              Width = 42
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 306
    Width = 466
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEIdiomas
    Left = 226
    Top = 46
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 260
    Top = 46
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 294
    Top = 46
  end
  inherited FSMain: TLFFibFormStorage
    Left = 328
    Top = 46
  end
  object CEIdiomas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSIdiomas
    FichaExclusiva = TSIdiomas
    PopUpMenu = CEIdiomasPMEdit
    Teclas = DMMain.Teclas
    Left = 226
    Top = 80
  end
  object CEIdiomasPMEdit: TPopUpTeclas
    Left = 260
    Top = 80
    object CEIdiomasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEIdiomasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEIdiomasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEIdiomasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEIdiomasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEIdiomasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEIdiomasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEIdiomasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEIdiomasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEIdiomasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
