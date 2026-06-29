object FMAlarmasIberfluidKri: TFMAlarmasIberfluidKri
  Left = 242
  Top = 204
  Width = 750
  Height = 400
  Caption = 'Alarmas de Pedidos a Proveedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 373
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 742
      Height = 28
      EdgeInner = esNone
      EdgeOuter = esNone
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 2
        Width = 225
        Height = 22
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      object PNLFechaCalculo: TLFPanel
        Left = 225
        Top = 2
        Width = 185
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LFecha: TLFLabel
          Left = 7
          Top = 4
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DEFecha: TLFDateEdit
          Left = 93
          Top = 0
          Width = 89
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          Text = '01/01/2008'
          OnChange = DEFechaFiltroChange
        end
      end
      object ToolButton1: TToolButton
        Left = 410
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object BRefrescar: TToolButton
        Left = 418
        Top = 2
        Hint = 'Refresca los datos de todas las alarmas.'
        Caption = 'BRefrescar'
        ImageIndex = 39
        ParentShowHint = False
        ShowHint = True
        OnClick = BRefrescarClick
      end
      object PNLMostrarDesde: TLFPanel
        Left = 441
        Top = 2
        Width = 185
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LMostrarDesde: TLFLabel
          Left = 10
          Top = 4
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mostrar desde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DEMostrarDesdeFecha: TLFDateEdit
          Left = 94
          Top = 0
          Width = 89
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          Text = '01/01/2008'
          OnChange = DEFechaFiltroChange
        end
      end
    end
    object PCMain: TLFPageControl
      Left = 0
      Top = 56
      Width = 742
      Height = 317
      ActivePage = TSVerde
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      OwnerDraw = True
      ParentFont = False
      TabIndex = 0
      TabOrder = 1
      OnChange = PCMainChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSVerde: TTabSheet
        Caption = 'Verde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object DBGVerde: THYTDBGrid
          Left = 0
          Top = 41
          Width = 734
          Height = 248
          Align = alClient
          DataSource = DMAlarmasIberfluidKri.DSxAlarmaVerde
          FixedColor = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindow
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGridCellClick
          OnDblClick = DBGridDblClick
          OnTitleClick = DBGridTitleClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 32
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_PRE_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_REC_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_CONFIRMADA_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_INICIAL_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_CONFIRM_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              Width = 64
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_BASES'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 132
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 64
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'EJERCICIO_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'SERIE_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'RIG_PED'
              Width = 64
              Visible = True
            end>
        end
        object PNLDescAlarmaVerde: TLFPanel
          Left = 0
          Top = 0
          Width = 734
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LDescripcionAlarmaVerde: TLFLabel
            Left = 0
            Top = 0
            Width = 734
            Height = 41
            Align = alClient
            Caption = 
              'Falta Acuse Recibo'#13#10'- Hoy > (Fecha Pedido Proveedor + D'#237'as de Co' +
              'nfirmaci'#243'n) y (Fecha confirmada del detalle est'#225' vac'#237'a)'
            Color = clGreen
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
      end
      object TSAmarilla: TTabSheet
        Caption = 'Amarilla'
        ImageIndex = 1
        object DBGAmarilla: THYTDBGrid
          Left = 0
          Top = 41
          Width = 734
          Height = 248
          Align = alClient
          DataSource = DMAlarmasIberfluidKri.DSxAlarmaAmarilla
          FixedColor = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGridCellClick
          OnDblClick = DBGridDblClick
          OnTitleClick = DBGridTitleClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 32
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_PRE_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_REC_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_CONFIRMADA_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_INICIAL_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_CONFIRM_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              Width = 64
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_BASES'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 132
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 64
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'EJERCICIO_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'SERIE_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'RIG_PED'
              Width = 64
              Visible = True
            end>
        end
        object PNLDescAlarmaAmarilla: TLFPanel
          Left = 0
          Top = 0
          Width = 734
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LDescripcionAlarmaAmarilla: TLFLabel
            Left = 0
            Top = 0
            Width = 318
            Height = 39
            Align = alClient
            Caption = 
              'Material debe estar en tr'#225'nsito'#13#10'- 1. (Hoy > Fecha Requerida) y ' +
              '(Hoy > Fecha Confirmada)'#13#10'- 2. (Hoy > Fecha Requerida - 7) y (Fe' +
              'cha Confirmada = est'#225' vac'#237'a)'
            Color = clYellow
            ParentColor = False
          end
        end
      end
      object TSRoja: TTabSheet
        Caption = 'Roja'
        ImageIndex = 2
        object DBGRoja: THYTDBGrid
          Left = 0
          Top = 41
          Width = 734
          Height = 248
          Align = alClient
          DataSource = DMAlarmasIberfluidKri.DSxAlarmaRoja
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindow
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGridCellClick
          OnDblClick = DBGridDblClick
          OnTitleClick = DBGridTitleClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 32
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_PRE_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_REC_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_CONFIRMADA_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_INICIAL_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_CONFIRM_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              Width = 64
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_BASES'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 132
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 64
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'EJERCICIO_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'SERIE_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'RIG_PED'
              Width = 64
              Visible = True
            end>
        end
        object PNLDescAlarmaRoja: TLFPanel
          Left = 0
          Top = 0
          Width = 734
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LDescripcionAlarmaRoja: TLFLabel
            Left = 0
            Top = 0
            Width = 418
            Height = 39
            Align = alClient
            Caption = 
              'Plazo nuestro vencido'#13#10'- 1. (Hoy > Plazo inicial) y (Hoy > Plazo' +
              ' confirmado)'#13#10'- 2. (Fecha Recepci'#243'n est'#225' vac'#237'a) o (Fecha Confirm' +
              'aci'#243'n > Plazo de entrega del cliente)'
            Color = clRed
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
      end
      object TSVioleta: TTabSheet
        Caption = 'Violeta'
        ImageIndex = 3
        object DBGVioleta: THYTDBGrid
          Left = 0
          Top = 41
          Width = 734
          Height = 248
          Align = alClient
          DataSource = DMAlarmasIberfluidKri.DSxAlarmaVioleta
          FixedColor = clPurple
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindow
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGridCellClick
          OnDblClick = DBGridDblClick
          OnTitleClick = DBGridTitleClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 32
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_PRE_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_REC_CAB'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_CONFIRMADA_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_INICIAL_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLAZO_CONFIRM_KRI'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MONEDA'
              Width = 64
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_BASES'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 132
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 64
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'EJERCICIO_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'SERIE_PED'
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'RIG_PED'
              Width = 64
              Visible = True
            end>
        end
        object PNLDescAlarmaVioleta: TLFPanel
          Left = 0
          Top = 0
          Width = 734
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LDescripcionAlarmaVioleta: TLFLabel
            Left = 0
            Top = 0
            Width = 310
            Height = 26
            Align = alClient
            Caption = 
              'Plazo cliente vencido'#13#10'- (Hoy > Plazo de Entrega Cliente) y (Fec' +
              'ha recepci'#243'n est'#225' vac'#237'a)'
            Color = clPurple
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
      end
    end
    object PFiltro: TLFPanel
      Left = 0
      Top = 28
      Width = 742
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LProveedor: TLFLabel
        Left = 294
        Top = 6
        Width = 59
        Height = 13
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
      object LSerie: TLFLabel
        Left = 11
        Top = 7
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFProveedor: TLFEditFind2000
        Left = 357
        Top = 3
        Width = 65
        Height = 21
        TabOrder = 0
        OnChange = EFProveedorChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
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
      object EFSerie: TLFEditFind2000
        Left = 45
        Top = 3
        Width = 41
        Height = 21
        TabOrder = 1
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ESerieTitulo: TLFEdit
        Left = 87
        Top = 3
        Width = 199
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object EProveedorTitulo: TLFEdit
        Left = 423
        Top = 3
        Width = 199
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'DBGAmarilla.Columns'
      'DBGRoja.Columns'
      'DBGVerde.Columns'
      'DBGVioleta.Columns')
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 696
    Top = 8
  end
end
