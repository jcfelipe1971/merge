inherited FMPortes: TFMPortes
  Left = 329
  HelpContext = 288
  ActiveControl = NavMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Portes'
  ClientHeight = 345
  ClientWidth = 590
  PopupMenu = CESeriesPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 321
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMPortes.DSQMPortes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBETituloPorte
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 244
      end
      inherited TbuttComp: TToolButton
        Left = 252
        Hint = 'Regenera las Formas de Pago'
        ImageIndex = 39
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 291
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 263
          inherited G2KTableLoc: TG2KTBLoc
            Left = 96
            Top = 64
            DataSource = DMPortes.DSQMPortes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CON_CUENTAS_GES_PORTES'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LBTipoPorte: TLFLabel
            Left = 71
            Top = 56
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Porte'
          end
          object LBIVA: TLFLabel
            Left = 73
            Top = 78
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.V.A'
          end
          object LBCtaCompras: TLFLabel
            Left = 33
            Top = 100
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Compras'
          end
          object LBCtaVentas: TLFLabel
            Left = 41
            Top = 122
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Ventas'
          end
          object LBCtaDevCompras: TLFLabel
            Left = 7
            Top = 143
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Dev. Compras'
          end
          object LBCtaDevVentas: TLFLabel
            Left = 15
            Top = 167
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Dev. Ventas'
          end
          object DBETipo: TLFDbedit
            Left = 101
            Top = 52
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMPortes.DSQMPortes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETituloPorte: TLFDbedit
            Left = 159
            Top = 52
            Width = 270
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPortes.DSQMPortes
            TabOrder = 1
          end
          object DBETitIva: TLFDbedit
            Left = 271
            Top = 74
            Width = 289
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPortes.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBERecIva: TLFDbedit
            Left = 209
            Top = 74
            Width = 61
            Height = 21
            Color = clInfoBk
            DataField = 'P_RECARGO'
            DataSource = DMPortes.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBETipIva: TLFDbedit
            Left = 141
            Top = 74
            Width = 67
            Height = 21
            Color = clInfoBk
            DataField = 'P_IVA'
            DataSource = DMPortes.DSxTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEFIva: TLFDBEditFind2000
            Left = 101
            Top = 74
            Width = 39
            Height = 21
            DataField = 'TIPO_IVA'
            DataSource = DMPortes.DSQMPortes
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_TIPO_IVA                   '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'P_IVA'
              'P_RECARGO')
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCompras: TLFDBEditFind2000
            Left = 101
            Top = 96
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_COMPRAS'
            DataSource = DMPortes.DSQMPortes
            TabOrder = 6
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFCuentasVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFVENTAS: TLFDBEditFind2000
            Left = 101
            Top = 118
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_VENTAS'
            DataSource = DMPortes.DSQMPortes
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFCuentasVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFDEVCOMPRAS: TLFDBEditFind2000
            Left = 101
            Top = 140
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_DEV_COMPRAS'
            DataSource = DMPortes.DSQMPortes
            TabOrder = 8
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFCuentasVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFDEVVENTAS: TLFDBEditFind2000
            Left = 101
            Top = 162
            Width = 107
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CTA_DEV_VENTAS'
            DataSource = DMPortes.DSQMPortes
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFCuentasVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitCompras: TLFDbedit
            Left = 209
            Top = 96
            Width = 351
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPortes.DSxCta_Comp
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBETitVentas: TLFDbedit
            Left = 209
            Top = 118
            Width = 351
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPortes.DSxCta_Vent
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object DBETitDevCompras: TLFDbedit
            Left = 209
            Top = 140
            Width = 351
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPortes.DSxCta_Dev_Comp
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBETitDevVentas: TLFDbedit
            Left = 209
            Top = 162
            Width = 351
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPortes.DSxCta_Dev_Vent
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
        end
      end
      object TSIdiomas: TTabSheet [1]
        Caption = '&Idiomas'
        ImageIndex = 1
        OnShow = TSIdiomasShow
        object TBIdiomas: TLFToolBar
          Left = 0
          Top = 0
          Width = 578
          Height = 25
          ButtonHeight = 21
          EdgeBorders = []
          TabOrder = 0
          Separators = True
          object NavIdiomas: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 21
            DataSource = DMPortes.DSQMPortesIdiomas
            Flat = True
            ParentShowHint = False
            PopupMenu = CEIdiomasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFIdiomas
            InsertaControl = DBGFIdiomas
            Exclusivo = True
            ControlEdit = CEIdiomas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNTitulo: TLFPanel
            Left = 240
            Top = 2
            Width = 313
            Height = 21
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBETITPortes: TLFDbedit
              Left = 10
              Top = 0
              Width = 239
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPortes.DSQMPortes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        object PNIdiomas: TLFPanel
          Left = 0
          Top = 25
          Width = 578
          Height = 238
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFIdiomas: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 578
            Height = 238
            Align = alClient
            DataSource = DMPortes.DSQMPortesIdiomas
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
            OrdenadosPor.Strings = (
              'IDIOMA')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'IDIOMA'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Visible = True
              end>
          end
        end
      end
      object TSSeries: TTabSheet [2]
        Caption = '&Series'
        ImageIndex = 3
        OnShow = TSSeriesShow
        object PNSeries: TLFPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 263
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PCSeries: TLFPageControl
            Left = 0
            Top = 0
            Width = 578
            Height = 263
            ActivePage = TSFichaSerie
            Align = alClient
            MultiLine = True
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            TabPosition = tpBottom
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSFichaSerie: TTabSheet
              Caption = 'Ficha'
              object PNSerie: TLFPanel
                Left = 0
                Top = 0
                Width = 570
                Height = 215
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Label21: TLFLabel
                  Left = 32
                  Top = 84
                  Width = 63
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cta. Compras'
                end
                object Label22: TLFLabel
                  Left = 40
                  Top = 107
                  Width = 55
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cta. Ventas'
                end
                object LBCtaDevlC: TLFLabel
                  Left = 12
                  Top = 128
                  Width = 83
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cta.Dev.Compras'
                end
                object LbCtaDvnV: TLFLabel
                  Left = 19
                  Top = 151
                  Width = 75
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cta.Dev.Ventas'
                end
                object Label27: TLFLabel
                  Left = 71
                  Top = 62
                  Width = 24
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Serie'
                end
                object DBEFCtaCompras: TLFDBEditFind2000
                  Left = 99
                  Top = 80
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CTA_COMPRAS'
                  DataSource = DMPortes.DSQMSeries
                  TabOrder = 1
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnVerificacion = DBEFCuentasVerificacion
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DBETitCtaCompras: TLFDbedit
                  Left = 207
                  Top = 80
                  Width = 351
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMPortes.DSxCta_Comp
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                end
                object DBETitCtaVentas: TLFDbedit
                  Left = 207
                  Top = 102
                  Width = 351
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMPortes.DSxCta_Vent
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
                object DBETitCtaDevCompras: TLFDbedit
                  Left = 207
                  Top = 124
                  Width = 351
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMPortes.DSxCta_Dev_Comp
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                end
                object DBETitCtaDevVentas: TLFDbedit
                  Left = 207
                  Top = 146
                  Width = 351
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMPortes.DSxCta_Dev_Vent
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 8
                end
                object DBEFCtaDevVentas: TLFDBEditFind2000
                  Left = 99
                  Top = 146
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CTA_DEV_VENTAS'
                  DataSource = DMPortes.DSQMSeries
                  TabOrder = 4
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnVerificacion = DBEFCuentasVerificacion
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DBEFCtaDevCompras: TLFDBEditFind2000
                  Left = 99
                  Top = 124
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CTA_DEV_COMPRAS'
                  DataSource = DMPortes.DSQMSeries
                  TabOrder = 3
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnVerificacion = DBEFCuentasVerificacion
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DBEFCtaVentas: TLFDBEditFind2000
                  Left = 99
                  Top = 102
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CTA_VENTAS'
                  DataSource = DMPortes.DSQMSeries
                  TabOrder = 2
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnVerificacion = DBEFCuentasVerificacion
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DBETitSerie: TLFDbedit
                  Left = 207
                  Top = 58
                  Width = 351
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMPortes.DSxSeries
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 9
                end
                object DBEFSerie: TLFDBEditFind2000
                  Left = 99
                  Top = 58
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'SERIE'
                  DataSource = DMPortes.DSQMSeries
                  TabOrder = 0
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'VER_SERIES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'SERIE'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OrdenadoPor.Strings = (
                    'SERIE')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object TBTipoPortes: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 570
                  Height = 26
                  ButtonHeight = 24
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Flat = True
                  TabOrder = 10
                  Separators = True
                  object PNTipoPortes: TLFPanel
                    Left = 0
                    Top = 0
                    Width = 313
                    Height = 24
                    Align = alClient
                    BevelOuter = bvNone
                    Enabled = False
                    TabOrder = 0
                    object DBETitPorte: TLFDbedit
                      Left = 66
                      Top = 1
                      Width = 243
                      Height = 21
                      Color = clInfoBk
                      DataField = 'TITULO'
                      DataSource = DMPortes.DSQMPortes
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clGrayText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBETipoPorte: TLFDbedit
                      Left = 2
                      Top = 1
                      Width = 63
                      Height = 21
                      Color = clInfoBk
                      DataField = 'TIPO'
                      DataSource = DMPortes.DSQMPortes
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
              object TBSeries: TLFToolBar
                Left = 0
                Top = 215
                Width = 570
                Height = 22
                Align = alBottom
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 1
                Separators = True
                object NavSeries: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 220
                  Height = 22
                  DataSource = DMPortes.DSQMSeries
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CESeriesPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBEFCtaCompras
                  InsertaControl = DBEFSerie
                  Exclusivo = True
                  ControlEdit = CESeries
                  OrdenAscendente = True
                  InsertaUltimo = False
                  OnClickAfterAdjust = NavSeriesClickAfterAdjust
                end
              end
            end
            object TSSerieTabla: TTabSheet
              Caption = 'Tabla'
              ImageIndex = 1
              object DBGSeries: THYTDBGrid
                Left = 0
                Top = 0
                Width = 570
                Height = 237
                Align = alClient
                Color = clInfoBk
                DataSource = DMPortes.DSQMSeries
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = False
                Changed = False
                Idioma = 'CAS'
                AutoDeseleccionar = True
                TabFicha = TSFichaSerie
                PermutaPaneles = True
                CamposAOrdenar.Strings = (
                  'DIR_LOCALIDAD')
                CamposAOrdenarImgs = DMMain.ILOrdGrid
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CTA_COMPRAS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CTA_DEV_COMPRAS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CTA_VENTAS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CTA_DEV_VENTAS'
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 263
          DataSource = DMPortes.DSQMPortes
          CamposAOrdenar.Strings = (
            'DIAS_1_PLAZO'
            'DIAS_E_PLAZOS'
            'FORMA'
            'PLAZOS'
            'REMESAR'
            'TIPO_EFECTO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 212
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_DEV_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_VENTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_DEV_VENTAS'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 321
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEIdiomas
    Left = 348
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 378
    Top = 4
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 426
    Top = 6
  end
  inherited FSMain: TLFFibFormStorage
    Left = 466
    Top = 6
  end
  object CEIdiomas: TControlEdit
    EnlazadoA = CESeries
    FichaEdicion = TSIdiomas
    FichaExclusiva = TSIdiomas
    PopUpMenu = CEIdiomasPMEdit
    Teclas = DMMain.Teclas
    Left = 280
    Top = 8
  end
  object CEIdiomasPMEdit: TPopUpTeclas
    Left = 536
    Top = 16
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
  object CESeries: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFichaSerie
    FichaExclusiva = TSFichaSerie
    PanelEdicion = PNSerie
    PopUpMenu = CESeriesPMEdit
    Teclas = DMMain.Teclas
    Left = 344
    Top = 80
  end
  object CESeriesPMEdit: TPopUpTeclas
    Left = 408
    Top = 80
    object CESeriesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CESeriesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CESeriesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CESeriesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CESeriesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CESeriesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CESeriesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CESeriesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CESeriesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CESeriesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
