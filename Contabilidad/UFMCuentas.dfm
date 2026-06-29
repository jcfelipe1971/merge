inherited FMCuentas: TFMCuentas
  Left = 266
  Top = 207
  Width = 1127
  Height = 474
  HelpContext = 245
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cuentas contables'
  PopupMenu = CECCPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1117
    Height = 421
    inherited TBMain: TLFToolBar
      Width = 1113
      inherited NavMain: THYMNavigator
        DataSource = DMCuentas.DSQMCuentas
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBECuenta
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TButtSeparador2: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
        Visible = False
      end
      object LBLNivel: TLFLabel
        Left = 347
        Top = 0
        Width = 37
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '&Nivel'
        FocusControl = CBFiltra
        Layout = tlCenter
      end
      object CBFiltra: TLFComboBox
        Left = 384
        Top = 0
        Width = 101
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBFiltraChange
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1113
      Height = 391
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1105
          Height = 161
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 24
            DataSource = DMCuentas.DSQMCuentas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CON_CUENTAS'
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'cuenta')
          end
          object LBLCuenta: TLFLabel
            Left = 30
            Top = 12
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
            FocusControl = DBECuenta
          end
          object LBLTitulo: TLFLabel
            Left = 36
            Top = 33
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LBLGestion: TLFLabel
            Left = 488
            Top = 33
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gesti'#243'n'
          end
          object LConcepto: TLFLabel
            Left = 18
            Top = 55
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Concepto'
            FocusControl = DBEConcepto
          end
          object LTipo: TLFLabel
            Left = 43
            Top = 77
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBETipo
          end
          object DBECuenta: TLFDbedit
            Left = 68
            Top = 8
            Width = 131
            Height = 21
            DataField = 'CUENTA'
            DataSource = DMCuentas.DSQMCuentas
            TabOrder = 0
            OnExit = DBECuentaExit
          end
          object DBETitulo: TLFDbedit
            Left = 68
            Top = 30
            Width = 403
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TITULO'
            DataSource = DMCuentas.DSQMCuentas
            TabOrder = 1
          end
          object PTitSub: TLFPanel
            Left = 0
            Top = 142
            Width = 1105
            Height = 19
            Align = alBottom
            BevelOuter = bvNone
            Color = clAppWorkSpace
            TabOrder = 11
            object LBLTitCuenta: TLFLabel
              Left = 6
              Top = 2
              Width = 109
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Cuenta'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LBLtitTitulo: TLFLabel
              Left = 118
              Top = 2
              Width = 551
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'T'#237'tulo'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LBLTitNivel: TLFLabel
              Left = 672
              Top = 2
              Width = 29
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Nivel'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
          end
          object DBRGRegCierre: TDBRadioGroup
            Left = 68
            Top = 96
            Width = 505
            Height = 41
            Caption = 'Registro Cierre'
            Columns = 3
            DataField = 'REG_CIERRE'
            DataSource = DMCuentas.DSQMCuentas
            Items.Strings = (
              'Cierre'
              'Perdidas'
              'Ganancias')
            TabOrder = 5
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBCBCentroDeCoste: TLFDBCheckBox
            Left = 600
            Top = 8
            Width = 150
            Height = 17
            Caption = 'Centro de Coste'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CENTRO_COSTE'
            DataSource = DMCuentas.DSQMCuentas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEEFGestion: TLFDBEditFind2000
            Left = 528
            Top = 30
            Width = 45
            Height = 21
            DataField = 'GESTION'
            DataSource = DMCuentas.DSQMCuentas
            TabOrder = 2
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
            OnBusqueda = DBEEFGestionBusqueda
            OrdenadoPor.Strings = (
              'GESTION')
            Filtros = [obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCBRestriccion: TLFDBCheckBox
            Left = 600
            Top = 26
            Width = 150
            Height = 17
            Caption = 'Restringida'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RESTRICCION'
            DataSource = DMCuentas.DSQMCuentas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBBloqueada: TLFDBCheckBox
            Left = 600
            Top = 44
            Width = 150
            Height = 17
            Caption = 'Bloqueada'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'BLOQUEADA'
            DataSource = DMCuentas.DSQMCuentas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPresupuestar: TLFDBCheckBox
            Left = 600
            Top = 62
            Width = 150
            Height = 17
            Caption = 'Presupuestar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PRESUPUESTAR'
            DataSource = DMCuentas.DSQMCuentas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCuadroDeMandos: TLFDBCheckBox
            Left = 600
            Top = 80
            Width = 150
            Height = 17
            Caption = 'Cuadro de Mandos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CUADRO_DE_MANDOS'
            DataSource = DMCuentas.DSQMCuentas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEConcepto: TLFDbedit
            Left = 68
            Top = 52
            Width = 403
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CONCEPTO_CUENTA'
            DataSource = DMCuentas.DSQMCuentas
            TabOrder = 3
          end
          object DBETipo: TLFDbedit
            Left = 68
            Top = 74
            Width = 403
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO_CUENTA'
            DataSource = DMCuentas.DSQMCuentas
            TabOrder = 4
          end
        end
        object DBCGNiveles: TLFDBCtrlGrid
          Left = 0
          Top = 161
          Width = 1105
          Height = 202
          Align = alClient
          ColCount = 1
          Color = clBtnFace
          DataSource = DMCuentas.DSxNiveles
          Enabled = False
          PanelHeight = 20
          PanelWidth = 1089
          ParentColor = False
          TabOrder = 1
          RowCount = 10
          object DBExSuperior: TLFDbedit
            Left = 6
            Top = 2
            Width = 109
            Height = 19
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clInactiveCaption
            DataField = 'SUPERIOR'
            DataSource = DMCuentas.DSxNiveles
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBExTitulo: TLFDbedit
            Left = 118
            Top = 2
            Width = 551
            Height = 19
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clInactiveCaption
            DataField = 'TITULO'
            DataSource = DMCuentas.DSxNiveles
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBExNivel: TLFDbedit
            Left = 672
            Top = 2
            Width = 29
            Height = 19
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clInactiveCaption
            DataField = 'NIVEL'
            DataSource = DMCuentas.DSxNiveles
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TSCC: TTabSheet [1]
        Caption = '&Centro de Coste'
        ImageIndex = 1
        object TBCentroCoste: TLFToolBar
          Left = 0
          Top = 0
          Width = 1105
          Height = 22
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavCuentas: THYMNavigator
            Left = 0
            Top = 0
            Width = 110
            Height = 22
            DataSource = DMCuentas.DSCC
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CECCPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCuentas
            InsertaControl = DBGFCuentas
            Exclusivo = True
            ControlEdit = CECC
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 110
            Top = 0
            Width = 8
            ParentShowHint = False
            ShowHint = True
            Style = tbsSeparator
          end
          object LBDBCuenta: TLFDbedit
            Left = 118
            Top = 0
            Width = 225
            Height = 22
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMCuentas.DSQMCuentas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object ToolButton2: TToolButton
            Left = 343
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
        end
        object DBGFCuentas: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1105
          Height = 341
          Align = alClient
          DataSource = DMCuentas.DSCC
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
          AutoCambiarColumna = True
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMCuentas.TLocal
          BuscarNums = False
          CamposAMostrarAnchos.Strings = (
            '0')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'PORCENTAJE'
            'PLANTILLA'
            'PLAN_CONTABLE'
            'PL_TITULO'
            'LINEA'
            'ID_PL'
            'ID_CC'
            'ID_P'
            'CUENTA'
            'CENTRO_COSTE'
            'CC_TITULO'
            'CANAL')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLANTILLA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 39
              Visible = True
            end
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
              Width = 31
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PL_TITULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 232
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PORCENTAJE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 39
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CENTRO_COSTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CC_TITULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 299
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1105
          Height = 363
          DataSource = DMCuentas.DSQMCuentas
          CamposAMarcar.Strings = (
            'BLOQUEADA'
            'CENTRO_COSTE'
            'CUADRO_DE_MANDOS'
            'PRESUPUESTAR'
            'RESTRICCION')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'BLOQUEADA'
            'CENTRO_COSTE'
            'CUADRO_DE_MANDOS'
            'CUENTA'
            'GESTION'
            'NIVEL'
            'PRESUPUESTAR'
            'REG_CIERRE'
            'RESTRICCION'
            'SUPERIOR'
            'TIPO'
            'TIPO_TERCERO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 528
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BLOQUEADA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESTRICCION'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CENTRO_COSTE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUADRO_DE_MANDOS'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRESUPUESTAR'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 421
    Width = 1117
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CECC
    Left = 657
    Top = 96
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 691
    Top = 96
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 656
    Top = 16
  end
  inherited FSMain: TLFFibFormStorage
    Left = 624
    Top = 16
  end
  object CECC: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CECCPMEdit
    Teclas = DMMain.Teclas
    Left = 659
    Top = 132
  end
  object CECCPMEdit: TPopUpTeclas
    Left = 693
    Top = 132
    object CECCMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECCMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECCMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECCMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECCMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CECCMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CECCMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CECCMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CECCMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CECCMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
