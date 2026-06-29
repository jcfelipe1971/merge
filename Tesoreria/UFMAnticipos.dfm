inherited FMAnticipos: TFMAnticipos
  Left = 404
  Top = 315
  Height = 316
  HelpContext = 271
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Anticipos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMAnticipos.DSQMAnticipos
        Hints.Strings = ()
        EditaControl = DBCAntidad
        InsertaControl = DBEFCliente
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
        Hint = 'Contabilizar/Descontabilizar el Anticipo'
        ImageIndex = 19
      end
      object ToolButton1: TToolButton
        Left = 299
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBTipo: TLFComboBox
        Left = 307
        Top = 0
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBTipoChange
        Items.Strings = (
          'De Cliente'
          'A Proveedores'
          'A Acreedores')
      end
    end
    inherited PCMain: TLFPageControl
      Height = 233
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        object SBVerAsientos: TSpeedButton [0]
          Left = 315
          Top = 115
          Width = 80
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          Down = True
          OnDblClick = SBVerAsientosDblClick
        end
        inherited PEdit: TLFPanel
          Height = 205
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'CANTIDAD'
              'CUENTA_CLI_PRO')
            DataSource = DMAnticipos.DSQMAnticipos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_CARTERA_ANTICIPOS'
            CampoNum = 'ANTICIPO'
            CampoStr = 'FECHA'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object CtaContrapartida: TLFLabel
            Left = 4
            Top = 74
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. de Pago'
          end
          object LBLCliente: TLFLabel
            Left = 34
            Top = 53
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LBLFecha: TLFLabel
            Left = 36
            Top = 96
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLAnticipo: TLFLabel
            Left = 28
            Top = 30
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Anticipo'
          end
          object LCantidadAnticipo: TLFLabel
            Left = 24
            Top = 117
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
          end
          object LBLAsiento: TLFLabel
            Left = 268
            Top = 119
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LBLSaldo: TLFLabel
            Left = 360
            Top = 141
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LTipoAsientoKri: TLFLabel
            Left = 335
            Top = 11
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Asiento'
          end
          object DBCAntidad: TLFDbedit
            Left = 70
            Top = 114
            Width = 90
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = DMAnticipos.DSQMAnticipos
            TabOrder = 6
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 70
            Top = 48
            Width = 90
            Height = 21
            DataField = 'COD_CLI_PRO'
            DataSource = DMAnticipos.DSQMAnticipos
            TabOrder = 1
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
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCta: TLFDBEditFind2000
            Left = 70
            Top = 70
            Width = 90
            Height = 21
            DataField = 'C_CONTRAPARTIDA'
            DataSource = DMAnticipos.DSQMAnticipos
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFCtaVerificacion
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescCta: TLFDbedit
            Left = 161
            Top = 70
            Width = 327
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAnticipos.DSxCuenta
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
          object DBEDescCliente: TLFDbedit
            Left = 161
            Top = 48
            Width = 327
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAnticipos.DSxClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEAnticipo: TLFDbedit
            Left = 70
            Top = 26
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'ANTICIPO'
            DataSource = DMAnticipos.DSQMAnticipos
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
          object DBDTPFecha: TLFDBDateEdit
            Left = 70
            Top = 92
            Width = 90
            Height = 21
            DataField = 'FECHA'
            DataSource = DMAnticipos.DSQMAnticipos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBEAsiento: TLFDbedit
            Left = 307
            Top = 115
            Width = 90
            Height = 21
            Color = clAqua
            DataField = 'ASIENTO_VISIBLE'
            DataSource = DMAnticipos.DSQMAnticipos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBCBEstado: TDBComboBoxValue
            Left = 398
            Top = 115
            Width = 90
            Height = 21
            Style = csSimple
            Color = 13553407
            DataField = 'CONTABILIZAR'
            DataSource = DMAnticipos.DSQMAnticipos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'No contabilizado'
              'Contabilizado')
            Values.Strings = (
              '0'
              '1')
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            TabStop = False
          end
          object DBEFTipoAsientoKri: TLFDBEditFind2000
            Left = 398
            Top = 8
            Width = 90
            Height = 21
            DataField = 'TIPO_ASIENTO'
            DataSource = DMAnticipos.DSQMAnticipos
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'VISIBLE = 1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = DBEFTipoAsientoKriExiste
            Filtros = []
          end
          object DBESaldo: TLFDbedit
            Left = 398
            Top = 137
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMAnticipos.DSQSaldo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBCBCreaCarteraNegativa: TLFDBCheckBox
            Left = 72
            Top = 144
            Width = 233
            Height = 17
            Caption = 'Crea Cartera Negativa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CREA_CARTERA_NEGATIVA'
            DataSource = DMAnticipos.DSQMAnticipos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 205
          DataSource = DMAnticipos.DSQMAnticipos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'CONTABILIZAR')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ANTICIPO'
            'CANTIDAD'
            'COD_CLI_PRO'
            'CONTABILIZAR'
            'CUENTA_CLI_PRO'
            'FECHA')
          Columns = <
            item
              Expanded = False
              FieldName = 'ANTICIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CLI_PRO'
              Title.Alignment = taRightJustify
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_CLI_PRO'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Title.Alignment = taRightJustify
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTABILIZAR'
              Width = 67
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 263
  end
  inherited CEMain: TControlEdit
    Left = 248
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 296
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AContabAnticipo: TAction
      Category = 'Procesos'
      Caption = 'Contabilizar/Descontabilizar el Anticipo'
      Hint = 'Contabilizar/Descontabilizar el Anticipo'
      ImageIndex = 19
      OnExecute = AContabAnticipoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
end
