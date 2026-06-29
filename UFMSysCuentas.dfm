inherited FMSysCuentas: TFMSysCuentas
  Left = 355
  Top = 208
  HelpContext = 286
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Definici'#243'n de Cuentas'
  ClientHeight = 369
  ClientWidth = 758
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 345
    inherited TBMain: TLFToolBar
      Width = 754
      inherited NavMain: THYMNavigator
        DataSource = DMSysCuentas.DSCuentas
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
      end
      object PNLPaises: TLFPanel
        Left = 305
        Top = 0
        Width = 278
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LPGC: TLFLabel
          Left = 10
          Top = 4
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'PGC'
        end
        object DBLBPGC: TDBLookupComboBox
          Left = 36
          Top = 0
          Width = 237
          Height = 21
          KeyField = 'PGC'
          ListField = 'TITULO'
          ListSource = DMSysCuentas.DSxPgC
          TabOrder = 0
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 754
      Height = 315
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 746
          Height = 287
          object PNLCabecera: TLFPanel
            Left = 0
            Top = 0
            Width = 746
            Height = 141
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LCuenta: TLFLabel
              Left = 42
              Top = 13
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cuenta'
              FocusControl = DBECuenta
            end
            object LTitulo: TLFLabel
              Left = 48
              Top = 34
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'T'#237'tulo'
              FocusControl = DBETitulo
            end
            object LGestion: TLFLabel
              Left = 40
              Top = 57
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Gesti'#243'n'
            end
            object LTipoTercero: TLFLabel
              Left = 392
              Top = 57
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Tercero'
            end
            object LFLSuperior: TLFLabel
              Left = 162
              Top = 13
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Padre'
              FocusControl = DBECuenta
            end
            object LFLNivel: TLFLabel
              Left = 272
              Top = 13
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nivel'
              FocusControl = DBECuenta
            end
            object LFLTipo: TLFLabel
              Left = 382
              Top = 13
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo'
              FocusControl = DBECuenta
            end
            object LPais: TLFLabel
              Left = 635
              Top = 13
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pa'#237's'
              FocusControl = DBECuenta
            end
            object DBECuenta: TLFDbedit
              Left = 79
              Top = 9
              Width = 71
              Height = 21
              Color = clInfoBk
              DataField = 'CUENTA'
              DataSource = DMSysCuentas.DSCuentas
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBETitulo: TLFDbedit
              Left = 79
              Top = 31
              Width = 644
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TITULO'
              DataSource = DMSysCuentas.DSCuentas
              TabOrder = 4
            end
            object PTitSub: TLFPanel
              Left = 0
              Top = 125
              Width = 746
              Height = 16
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 10
              object LCabCuenta: TLFLabel
                Left = 6
                Top = 3
                Width = 83
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Cuenta'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LCabTitulo: TLFLabel
                Left = 102
                Top = 3
                Width = 35
                Height = 13
                Caption = 'T'#237'tulo'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LCabNivel: TLFLabel
                Left = 691
                Top = 3
                Width = 34
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Nivel'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
            end
            object DBETituloGestion: TLFDbedit
              Left = 119
              Top = 53
              Width = 257
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSysCuentas.DSxCuentasGestion
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object EFGestion: TLFDBEditFind2000
              Left = 79
              Top = 53
              Width = 39
              Height = 21
              DataField = 'GESTION'
              DataSource = DMSysCuentas.DSCuentas
              TabOrder = 5
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_CUENTAS_GESTION'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'GESTION'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = EFGestionBusqueda
              Filtros = []
            end
            object DBEFTipo: TLFDBEditFind2000
              Left = 456
              Top = 53
              Width = 39
              Height = 21
              DataField = 'TIPO_TERCERO'
              DataSource = DMSysCuentas.DSCuentas
              TabOrder = 6
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TIPOS_TERCERO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'TIPO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = EFGestionBusqueda
              Filtros = []
            end
            object DBETipoTercero: TLFDbedit
              Left = 496
              Top = 53
              Width = 227
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSysCuentas.DSxTipoTercero
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object LFDBESuperior: TLFDbedit
              Left = 193
              Top = 9
              Width = 62
              Height = 21
              DataField = 'SUPERIOR'
              DataSource = DMSysCuentas.DSCuentas
              TabOrder = 1
            end
            object LFDBENIvel: TLFDbedit
              Left = 299
              Top = 9
              Width = 62
              Height = 21
              DataField = 'NIVEL'
              DataSource = DMSysCuentas.DSCuentas
              TabOrder = 2
            end
            object LFDBETipo: TLFDbedit
              Left = 407
              Top = 9
              Width = 62
              Height = 21
              DataField = 'TIPO'
              DataSource = DMSysCuentas.DSCuentas
              TabOrder = 3
            end
            object DBRGRegCierre: TDBRadioGroup
              Left = 79
              Top = 83
              Width = 647
              Height = 41
              Caption = 'Registro Cierre'
              Columns = 3
              DataField = 'REG_CIERRE'
              DataSource = DMSysCuentas.DSCuentas
              Items.Strings = (
                'Cierre'
                'Perdidas'
                'Ganancias')
              TabOrder = 7
              Values.Strings = (
                '0'
                '1'
                '2')
            end
            object LFDBEPais: TLFDbedit
              Left = 661
              Top = 9
              Width = 62
              Height = 21
              Color = clInfoBk
              DataField = 'PAIS'
              DataSource = DMSysCuentas.DSCuentas
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
          end
          object NoScrollLFDBCtrlGrid1: TNoScrollLFDBCtrlGrid
            Left = 0
            Top = 141
            Width = 746
            Height = 146
            Align = alClient
            ColCount = 1
            DataSource = DMSysCuentas.DSxCuentasPadres
            PanelBorder = gbNone
            PanelHeight = 29
            PanelWidth = 730
            TabOrder = 1
            RowCount = 5
            object DBExSuperior: TLFDbedit
              Left = 4
              Top = 5
              Width = 85
              Height = 21
              Color = clInfoBk
              DataField = 'CUENTA'
              DataSource = DMSysCuentas.DSxCuentasPadres
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBExTitulo: TLFDbedit
              Left = 90
              Top = 5
              Width = 600
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSysCuentas.DSxCuentasPadres
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBExNivel: TLFDbedit
              Left = 691
              Top = 5
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'NIVEL'
              DataSource = DMSysCuentas.DSxCuentasPadres
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Top = 287
          Width = 746
          Height = 0
          Align = alBottom
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CUENTA'
            'NIVEL'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 331
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIVEL'
              Width = 63
              Visible = True
            end>
        end
        object DBGFCuentas: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 746
          Height = 287
          Align = alClient
          DataSource = DMSysCuentas.DSCuentas
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGFCuentasDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = True
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMSysCuentas.TLocal
          BuscarNums = False
          Campos.Strings = (
            'GESTION'
            'TIPO_TERCERO')
          CamposAMostrar.Strings = (
            'GESTION'
            '0'
            'TIPO_TERCERO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            'GESTION'
            'TIPO')
          CamposDesplegar.Strings = (
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CUENTA'
            'GESTION'
            'NIVEL'
            'REG_CIERRE'
            'SUPERIOR'
            'TIPO_TERCERO'
            'TITULO'
            'TIPO')
          CamposNoAccesibles.Strings = (
            'PGC'
            'PAIS'
            'CUENTA')
          CamposNoAccMenosAlIns.Strings = (
            'CUENTA')
          MensajeNoExiste = False
          Numericos.Strings = (
            'GESTION'
            'TIPO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_CUENTAS_GESTION'
            'SYS_TIPOS_TERCERO')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCuentasBusqueda
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            '')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CUENTA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 400
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NIVEL'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SUPERIOR'
              ReadOnly = True
              Width = 66
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'GESTION'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_TERCERO'
              ReadOnly = True
              Width = 56
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REG_CIERRE'
              ReadOnly = True
              Width = 59
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PGC'
              ReadOnly = True
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGrayText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 25
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PAIS'
              ReadOnly = True
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGrayText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 25
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 345
    Width = 758
  end
  inherited CEMain: TControlEdit
    FichaEdicion = nil
    FichaExclusiva = nil
    Left = 424
    Top = 16
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 384
    Top = 16
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 462
    Top = 34
    object ALstGestion: TAction
      Category = 'Listados'
      Caption = 'Listado Gesti'#243'n PGC'
      Hint = 'Listado Gesti'#243'n PGC'
      ImageIndex = 14
      OnExecute = ALstGestionExecute
    end
    object AConfGestion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Configuraci'#243'n Gesti'#243'n'
      Hint = 'Listado Configuraci'#243'n Gesti'#243'n'
      ImageIndex = 77
      OnExecute = AConfGestionExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 498
    Top = 38
  end
end
