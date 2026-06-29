inherited FMAgentes: TFMAgentes
  Left = 226
  Top = 143
  Width = 1037
  Height = 571
  HelpContext = 65
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Agentes'
  FormStyle = fsNormal
  PopupMenu = CECalculoComisionesPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1027
    Height = 518
    inherited TBMain: TLFToolBar
      Width = 1023
      inherited NavMain: THYMNavigator
        DataSource = DMAgentes.DSQMAgentes
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBEFTercero
        InsertaControl = DBEFTercero
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Listado de comisiones'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        Busca01 = DBEAgente
        Busca02 = DBEFTercero
        Busca03 = DBECuenta
        Busca04 = DBEComision
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 296
        Hint = 'Muestra la informaci'#243'n del tercero asociado al agente'
        Visible = True
        OnClick = TbuttCompClick
      end
      object ToolButton13: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimirNotas: TToolButton
        Left = 327
        Top = 0
        Action = AImprimirNotas
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1023
      Height = 488
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBATercero: TSpeedButton [0]
          Left = 110
          Top = 34
          Width = 153
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBATerceroDblClick
        end
        object SBAContaExtracto: TSpeedButton [1]
          Left = 110
          Top = 34
          Width = 153
          Height = 21
          Hint = 'Doble click para ver extracto contable'
          GroupIndex = -1
          OnDblClick = SBAContaExtractoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1015
          Height = 460
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'agente')
          end
          object LBLAgente: TLFLabel
            Left = 39
            Top = 26
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
            FocusControl = DBEAgente
          end
          object LBLTercero: TLFLabel
            Left = 36
            Top = 48
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLComision: TLFLabel
            Left = 31
            Top = 70
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comisi'#243'n'
            FocusControl = DBEComision
          end
          object LBLCuenta: TLFLabel
            Left = 334
            Top = 26
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LBLNotas: TLFLabel
            Left = 45
            Top = 114
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LFechaAlta: TLFLabel
            Left = 578
            Top = 26
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
          end
          object LBLCuentaPago: TLFLabel
            Left = 25
            Top = 91
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Pago'
          end
          object LCodigoNTV: TLFLabel
            Left = 571
            Top = 48
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo NTV'
            FocusControl = DBECodigoNTV
          end
          object DBEAgente: TLFDbedit
            Left = 78
            Top = 22
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'AGENTE'
            DataSource = DMAgentes.DSQMAgentes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 78
            Top = 44
            Width = 65
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMAgentes.DSQMAgentes
            TabOrder = 2
            Accion = ANewTercero
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS                   '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TERCERO'
              'NOMBRE_R_SOCIAL')
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEComision: TLFDbedit
            Left = 78
            Top = 66
            Width = 65
            Height = 21
            DataField = 'P_COMISION'
            DataSource = DMAgentes.DSQMAgentes
            TabOrder = 4
          end
          object DBECuenta: TLFDbedit
            Left = 374
            Top = 22
            Width = 142
            Height = 21
            Color = clAqua
            DataField = 'CUENTA'
            DataSource = DMAgentes.DSQMAgentes
            TabOrder = 1
            OnKeyDown = DBECuentaKeyDown
          end
          object DBENombreRSocial: TLFDbedit
            Left = 144
            Top = 44
            Width = 372
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMAgentes.DSxTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnDblClick = SBATerceroDblClick
            OnEnter = DBENombreRSocialEnter
          end
          object DBMMNotas: TLFDBMemo
            Left = 78
            Top = 110
            Width = 438
            Height = 238
            DataField = 'NOTAS'
            DataSource = DMAgentes.DSQMAgentes
            TabOrder = 7
          end
          object DBEMotivoBaja: TLFDbedit
            Left = 182
            Top = 349
            Width = 334
            Height = 21
            DataField = 'MOTIVO_BAJA'
            DataSource = DMAgentes.DSQMAgentes
            TabOrder = 10
          end
          object DBCHKBaja: TLFDBCheckBox
            Left = 28
            Top = 351
            Width = 63
            Height = 17
            Caption = 'Baja'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKBajaChange
            DataField = 'BAJA'
            DataSource = DMAgentes.DSQMAgentes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 94
            Top = 349
            Width = 87
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = DMAgentes.DSQMAgentes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBCBCopiaDeCorreoOfertaCliente: TLFDBCheckBox
            Left = 634
            Top = 73
            Width = 220
            Height = 17
            Caption = 'Enviar copia de oferta de cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ENVIAR_COPIA_OFC'
            DataSource = DMAgentes.DSQMAgentes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFechaAlta: TLFDbedit
            Left = 634
            Top = 22
            Width = 112
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMAgentes.DSQMAgentes
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
          object DBEFCuentaPago: TLFDBEditFind2000
            Left = 78
            Top = 88
            Width = 123
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CUENTA_PAGO'
            DataSource = DMAgentes.DSQMAgentes
            TabOrder = 5
            OnChange = DBEFCuentaPagoChange
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
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitCuentaPago: TLFEdit
            Left = 202
            Top = 88
            Width = 314
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBECodigoNTV: TLFDbedit
            Left = 634
            Top = 44
            Width = 112
            Height = 21
            DataField = 'CODIGO_NTV'
            DataSource = DMAgentes.DSQMAgentes
            TabOrder = 12
          end
          object DBCBCopiaDeCorreoPedidoCliente: TLFDBCheckBox
            Left = 634
            Top = 97
            Width = 220
            Height = 17
            Caption = 'Enviar copia de pedido de cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ENVIAR_COPIA_PEC'
            DataSource = DMAgentes.DSQMAgentes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCopiaDeCorreoAlbaranCliente: TLFDBCheckBox
            Left = 634
            Top = 121
            Width = 220
            Height = 17
            Caption = 'Enviar copia de albaran de cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ENVIAR_COPIA_ALB'
            DataSource = DMAgentes.DSQMAgentes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCopiaDeCorreoFacturaCliente: TLFDBCheckBox
            Left = 634
            Top = 145
            Width = 220
            Height = 17
            Caption = 'Enviar copia de factura de cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 16
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ENVIAR_COPIA_FAC'
            DataSource = DMAgentes.DSQMAgentes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSAgrupaciones: TTabSheet [1]
        Caption = 'A&grupaciones'
        ImageIndex = 2
        OnResize = TSAgrupacionesResize
        OnShow = TSAgrupacionesShow
        object DBCGDisponibles: TLFDBCtrlGrid
          Left = 0
          Top = 205
          Width = 1015
          Height = 255
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMAgentes.DSxAgrupDisp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 36
          PanelWidth = 999
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          RowCount = 7
          SelectedColor = clHighlight
          OnDblClick = DBCGDisponiblesDblClick
          object DBEAgCodDisp: TLFDbedit
            Left = 10
            Top = 1
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMAgentes.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDisp: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAgentes.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PDisponibles: TLFPanel
          Left = 0
          Top = 186
          Width = 1015
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones disponibles'
          Color = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object EFiltroAgrupacion: TLFEdit
            Left = 0
            Top = -2
            Width = 300
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = EFiltroAgrupacionChange
          end
        end
        object TBProv: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 23
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 2
          Separators = True
          object PNLCabProveedores: TLFPanel
            Left = 0
            Top = 0
            Width = 336
            Height = 21
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBAGeTit: TLFDbedit
              Left = 50
              Top = 1
              Width = 286
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEAGe: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 336
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAgrupSon: THYMNavigator
            Left = 344
            Top = 0
            Width = 88
            Height = 21
            DataSource = DMAgentes.DSxAgrupSon
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBCGPertenece
            Exclusivo = False
            ControlEdit = CEAgrupaciones
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton3: TToolButton
            Left = 432
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAgrupSonDisp: THYMNavigator
            Left = 440
            Top = 0
            Width = 88
            Height = 21
            DataSource = DMAgentes.DSxAgrupDisp
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesDispPMEdit
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBCGDisponibles
            Exclusivo = False
            ControlEdit = CEAgrupacionesDisp
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PPertenece: TLFPanel
          Left = 0
          Top = 23
          Width = 1015
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones a las que pertenece'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBCGPertenece: TLFDBCtrlGrid
          Left = 0
          Top = 42
          Width = 1015
          Height = 144
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMAgentes.DSxAgrupSon
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 24
          PanelWidth = 999
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          RowCount = 6
          SelectedColor = clHighlight
          OnDblClick = DBCGPerteneceDblClick
          object DBEAgDentro: TLFDbedit
            Left = 10
            Top = 2
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMAgentes.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDentro: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAgentes.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TSComisiones: TTabSheet [2]
        Caption = '&Comisiones'
        ImageIndex = 3
        OnResize = TSComisionesResize
        OnShow = TSComisionesShow
        object TBAgeCom: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 23
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLCabCom: TLFPanel
            Left = 0
            Top = 0
            Width = 320
            Height = 21
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBAgeTitCom: TLFDbedit
              Left = 50
              Top = 1
              Width = 270
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEAgeCom: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton2: TToolButton
            Left = 320
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavComisiones: THYMNavigator
            Left = 328
            Top = 0
            Width = 154
            Height = 21
            DataSource = DMAgentes.DSQMAgrupSonCom
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesComPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBCGPerteneceCom
            Exclusivo = False
            ControlEdit = CEAgrupacionesCom
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton4: TToolButton
            Left = 482
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavComisionesDisp: THYMNavigator
            Left = 490
            Top = 0
            Width = 88
            Height = 21
            DataSource = DMAgentes.DSxAgrupDispCom
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesDispComPMEdit
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBCGDisponiblesCom
            Exclusivo = False
            ControlEdit = CEAgrupacionesDispCom
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLPerteneceCom: TLFPanel
          Left = 0
          Top = 23
          Width = 1015
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Comisi'#243'n por agrupaciones de clientes'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBCGPerteneceCom: TLFDBCtrlGrid
          Left = 0
          Top = 42
          Width = 1015
          Height = 156
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMAgentes.DSQMAgrupSonCom
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 39
          PanelWidth = 999
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          RowCount = 4
          SelectedColor = clHighlight
          OnDblClick = DBCGPerteneceComDblClick
          object DBEAgDentroCom: TLFDbedit
            Left = 10
            Top = 2
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMAgentes.DSQMAgrupSonCom
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDentroCom: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAgentes.DSQMAgrupSonCom
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBAgComision: TLFDbedit
            Left = 478
            Top = 1
            Width = 65
            Height = 21
            DataField = 'COMISION'
            DataSource = DMAgentes.DSQMAgrupSonCom
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object PNLDisponiblesCom: TLFPanel
          Left = 0
          Top = 198
          Width = 1015
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones de clientes disponibles'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBCGDisponiblesCom: TLFDBCtrlGrid
          Left = 0
          Top = 217
          Width = 1015
          Height = 243
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMAgentes.DSxAgrupDispCom
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 34
          PanelWidth = 999
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          RowCount = 7
          SelectedColor = clHighlight
          OnDblClick = DBCGDisponiblesComDblClick
          object DBEAgCodDispCom: TLFDbedit
            Left = 10
            Top = 1
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMAgentes.DSxAgrupDispCom
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDispCom: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAgentes.DSxAgrupDispCom
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TSComisionesArt: TTabSheet [3]
        Caption = 'Comisiones Art.'
        OnResize = TSComisionesArtResize
        OnShow = TSComisionesArtShow
        object DBCGDisponiblesComArt: TLFDBCtrlGrid
          Left = 0
          Top = 217
          Width = 1015
          Height = 243
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMAgentes.DSxAgrupDispComArt
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 34
          PanelWidth = 999
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          RowCount = 7
          SelectedColor = clHighlight
          OnDblClick = DBCGDisponiblesComArtDblClick
          object DBEAgCodDispComArt: TLFDbedit
            Left = 10
            Top = 1
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMAgentes.DSxAgrupDispComArt
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDispComArt: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAgentes.DSxAgrupDispComArt
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PNLDisponiblesComArt: TLFPanel
          Left = 0
          Top = 198
          Width = 1015
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones de art'#237'culos disponibles'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBCGPerteneceComArt: TLFDBCtrlGrid
          Left = 0
          Top = 42
          Width = 1015
          Height = 156
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMAgentes.DSQMAgrupSonComArt
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 39
          PanelWidth = 999
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          RowCount = 4
          SelectedColor = clHighlight
          OnDblClick = DBCGPerteneceComArtDblClick
          object DBEAgDentroComArt: TLFDbedit
            Left = 10
            Top = 2
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMAgentes.DSQMAgrupSonComArt
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDentroComArt: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAgentes.DSQMAgrupSonComArt
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBAgComisionArt: TLFDbedit
            Left = 478
            Top = 1
            Width = 65
            Height = 21
            DataField = 'COMISION'
            DataSource = DMAgentes.DSQMAgrupSonComArt
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object PNLPerteneceComArt: TLFPanel
          Left = 0
          Top = 23
          Width = 1015
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Comisi'#243'n por agrupaciones de art'#237'culos'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object TBAgeComArt: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 23
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 4
          Separators = True
          object PNLCabComArt: TLFPanel
            Left = 0
            Top = 0
            Width = 320
            Height = 21
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBAgeTitComAArt: TLFDbedit
              Left = 50
              Top = 1
              Width = 270
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEAgeComArt: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton11: TToolButton
            Left = 320
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavComisionesArt: THYMNavigator
            Left = 328
            Top = 0
            Width = 154
            Height = 21
            DataSource = DMAgentes.DSQMAgrupSonComArt
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionsComArtPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBCGPerteneceComArt
            Exclusivo = False
            ControlEdit = CEAgrupacionsComArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton12: TToolButton
            Left = 482
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavComisionesDispArt: THYMNavigator
            Left = 490
            Top = 0
            Width = 88
            Height = 21
            DataSource = DMAgentes.DSxAgrupDispComArt
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesDispComArtPMEdit
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBCGDisponiblesComArt
            Exclusivo = False
            ControlEdit = CEAgrupacionesDispComArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSCalculoComisiones: TTabSheet [4]
        Caption = 'C'#225'lculo Comisiones'
        ImageIndex = 8
        OnHide = TSCalculoComisionesHide
        OnShow = TSCalculoComisionesShow
        object TBCalculoComisiones: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object PNLCabCalculoComisiones: TLFPanel
            Left = 0
            Top = 0
            Width = 336
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBECalculoComisionesTituloAgente: TLFDbedit
              Left = 50
              Top = 1
              Width = 286
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBECalculoComisionesAgente: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object NavCalculoComisiones: THYMNavigator
            Left = 336
            Top = 0
            Width = 234
            Height = 22
            DataSource = DMAgentes.DSCalculoComisiones
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            ParentShowHint = False
            PopupMenu = CECalculoComisionesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CECalculoComisiones
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton5: TToolButton
            Left = 570
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtRefrescarCalculoComisiones: TToolButton
            Left = 578
            Top = 0
            Action = ARefrescarComisiones
          end
          object TButtRecalculoCalculoComisiones: TToolButton
            Left = 601
            Top = 0
            Action = ARecalcularComisiones
            DropdownMenu = PMCalculoComisiones
            Style = tbsDropDown
          end
          object TBSep1: TToolButton
            Left = 637
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBBloqueaComisiones: TToolButton
            Left = 645
            Top = 0
            Action = ABloqueaComisiones
          end
          object TBDesbloqueaComisiones: TToolButton
            Left = 668
            Top = 0
            Action = ADesbloqueaComisiones
          end
          object ToolButton7: TToolButton
            Left = 691
            Top = 0
            Width = 8
            ImageIndex = 68
            Style = tbsSeparator
          end
          object TBPagarComisiones: TToolButton
            Left = 699
            Top = 0
            Hint = 'Marcar Lineas como Pagado'
            Caption = 'Pagar Comisiones'
            ImageIndex = 143
            OnClick = TBPagarComisionesClick
          end
          object TBDesPagarComisiones: TToolButton
            Left = 722
            Top = 0
            Hint = 'Desmarcar Lineas como Pagado'
            Caption = 'Despagar Comisiones'
            ImageIndex = 118
            OnClick = TBDesPagarComisionesClick
          end
        end
        object PNLCalculoComisionFiltroFecha: TLFPanel
          Left = 0
          Top = 22
          Width = 1015
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LDFechaCalculoComisiones: TLFLabel
            Left = 5
            Top = 6
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object LHFechaCalculoComisiones: TLFLabel
            Left = 176
            Top = 6
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object DEDFechaCalculoComisiones: TLFDateEdit
            Left = 72
            Top = 2
            Width = 89
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
            OnChange = DEDFechaCalculoComisionesChange
          end
          object DEHFechaCalculoComisiones: TLFDateEdit
            Left = 240
            Top = 2
            Width = 88
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
            OnChange = DEHFechaCalculoComisionesChange
          end
          object chLinea: TRadioButton
            Left = 408
            Top = 4
            Width = 112
            Height = 17
            Caption = 'Por l'#237'nea'
            Checked = True
            TabOrder = 4
            TabStop = True
            OnClick = chLineaClick
          end
          object chFactura: TRadioButton
            Left = 524
            Top = 4
            Width = 112
            Height = 17
            Caption = 'Por factura'
            TabOrder = 5
            OnClick = chFacturaClick
          end
          object BDecrementeMes: TButton
            Left = 328
            Top = 2
            Width = 21
            Height = 21
            Hint = 'Mes anterior'
            Caption = '<'
            TabOrder = 2
            OnClick = BDecrementeMesClick
          end
          object BIncrementaMes: TButton
            Left = 350
            Top = 2
            Width = 19
            Height = 21
            Hint = 'MesSiguiente'
            Caption = '>'
            TabOrder = 3
            OnClick = BIncrementaMesClick
          end
        end
        object DBGCalculoComisiones: TDBGridFind2000
          Left = 0
          Top = 48
          Width = 1015
          Height = 227
          Align = alTop
          DataSource = DMAgentes.DSCalculoComisiones
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCalculoComisionesCellClick
          OnDrawColumnCell = DBGCalculoComisionesDrawColumnCell
          OnDblClick = DBGCalculoComisionesDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMAgentes.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'B_IMPONIBLE'
            'LINEA_FAC'
            'LIQUIDO'
            'RIG_FAC'
            'SERIE_FAC')
          ColumnasCheckBoxes.Strings = (
            'BLOQUEADO'
            'PAGADO')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO_FAC'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE_FAC'
              ReadOnly = True
              Width = 32
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG_FAC'
              ReadOnly = True
              Width = 58
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_FAC'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ART'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              ReadOnly = True
              Width = 48
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              ReadOnly = True
              Width = 53
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO'
              ReadOnly = True
              Width = 39
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO_2'
              ReadOnly = True
              Width = 39
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO_3'
              ReadOnly = True
              Width = 39
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COSTE'
              ReadOnly = True
              Width = 57
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COMISION_AGENTE'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COMISION_ESCALADO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BLOQUEADO'
              Width = 26
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ZONA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COMISION_ZONA'
              ReadOnly = True
              Width = 59
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COMISION'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMISION'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Width = 68
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_CLI'
              ReadOnly = True
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PAGO'
              Width = 72
              Visible = True
            end>
        end
        object DBGCalculoComisionesAgrupado: TDBGridFind2000
          Left = 0
          Top = 275
          Width = 1015
          Height = 185
          Align = alClient
          DataSource = DMAgentes.DSCalculoComisionesAgrupado
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          OnCellClick = DBGCalculoComisionesAgrupadoCellClick
          OnDrawColumnCell = DBGCalculoComisionesAgrupadoDrawColumnCell
          OnDblClick = DBGCalculoComisionesAgrupadoDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMAgentes.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'B_IMPONIBLE'
            'LINEA_FAC'
            'LIQUIDO'
            'RIG_FAC'
            'SERIE_FAC')
          ColumnasCheckBoxes.Strings = (
            'BLOQUEADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO_FAC'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE_FAC'
              ReadOnly = True
              Width = 32
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG_FAC'
              ReadOnly = True
              Width = 58
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COMISION_AGENTE'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COMISION_ESCALADO'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ZONA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COMISION_ZONA'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'BLOQUEADO'
              ReadOnly = True
              Width = 26
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COMISION'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMISION'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Width = 68
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_CLI'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              ReadOnly = True
              Width = 26
              Visible = True
            end>
        end
      end
      object TSMargenes: TTabSheet [5]
        Caption = '&M'#225'rgenes'
        OnShow = TSMargenesShow
        object PMargenes: TLFPanel
          Left = 0
          Top = 22
          Width = 1015
          Height = 179
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBGDetalle: THYTDBGrid
            Left = 0
            Top = 0
            Width = 1015
            Height = 179
            Align = alClient
            DataSource = DMAgentes.DSQMMargenes
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
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
            AutoDeseleccionar = True
            ControlEdit = CEMargenes
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'MARGEN')
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MARGEN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taRightJustify
                Width = 148
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PORCENTAJE'
                Title.Alignment = taRightJustify
                Width = 167
                Visible = True
              end>
          end
        end
        object TBMargenes: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 22
          ButtonWidth = 27
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavMargenes: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            Hint = 'Navegador de los Margenes'
            DataSource = DMAgentes.DSQMMargenes
            Align = alLeft
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMargenPMEdit
            ShowHint = True
            TabOrder = 1
            OnClick = NavMargenesClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGDetalle
            InsertaControl = DBGDetalle
            Exclusivo = True
            ControlEdit = CEMargenes
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLMargenes: TLFPanel
            Left = 220
            Top = 0
            Width = 125
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LFLMargenAplicar: TLFLabel
              Left = 8
              Top = 4
              Width = 90
              Height = 13
              Caption = 'M'#225'rgenes a aplicar'
            end
          end
          object LFTAcciones: TLFToolBar
            Left = 345
            Top = 0
            Width = 63
            Height = 22
            Align = alRight
            EdgeBorders = []
            Flat = True
            Images = DMMain.ILMain_Ac
            TabOrder = 2
            Separators = True
            object TBSepMarg: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBTraspasarPrevMarg: TToolButton
              Left = 8
              Top = 0
              Action = ATraspasoMargenes
              ParentShowHint = False
              ShowHint = True
            end
          end
        end
        object PPrevision: TLFPanel
          Left = 0
          Top = 230
          Width = 1015
          Height = 230
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object DBGPrevision: THYTDBGrid
            Left = 0
            Top = 0
            Width = 1015
            Height = 230
            Align = alClient
            DataSource = DMAgentes.DSQMPrevision
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
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
            AutoDeseleccionar = True
            ControlEdit = CEPrevision
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'MARGEN')
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MARGEN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taRightJustify
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PORCENTAJE'
                Title.Alignment = taRightJustify
                Width = 167
                Visible = True
              end>
          end
        end
        object TBPrevision: TLFToolBar
          Left = 0
          Top = 205
          Width = 1015
          Height = 25
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 3
          Separators = True
          object NavPrevision: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMAgentes.DSQMPrevision
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPrevisionPMEdit
            ShowHint = True
            TabOrder = 0
            OnClick = NavPrevisionClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGPrevision
            InsertaControl = DBGPrevision
            Exclusivo = True
            ControlEdit = CEPrevision
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object LFPPrevision: TLFPanel
            Left = 220
            Top = 0
            Width = 283
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LFLPrevisionMargen: TLFLabel
              Left = 8
              Top = 4
              Width = 107
              Height = 13
              Caption = 'Previsi'#243'n de m'#225'rgenes'
            end
          end
        end
        object LFPSeparador: TLFPanel
          Left = 0
          Top = 201
          Width = 1015
          Height = 4
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
        end
      end
      object TSIncidencias: TTabSheet [6]
        Caption = '&Incidencias'
        object Splitter1: TSplitter
          Left = 0
          Top = 352
          Width = 1015
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object DBGIncidencias: THYTDBGrid
          Left = 0
          Top = 21
          Width = 1015
          Height = 331
          Align = alClient
          Color = clInfoBk
          DataSource = DMAgentes.DSxIncidencias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGIncidenciasDrawColumnCell
          OnDblClick = DBGIncidenciasDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAMarcar.Strings = (
            'FINALIZADO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'CONTACTO'
            'CONTACTO2'
            'CONTACTO3'
            'DIR_NOMBRE'
            'DIRECCION'
            'DOC_EJERCICIO'
            'DOC_RIG'
            'DOC_SERIE'
            'DOC_TIPO'
            'FECHA'
            'FECHA_RECEPCION'
            'FECHA_RESPUESTA'
            'FINALIZADO'
            'HORAS'
            'INCIDENCIA'
            'NOMBRE_USUARIO'
            'TIPO_INCIDENCIA_KRI'
            'TIT_AGENTE'
            'TIT_CONTACTO'
            'TIT_CONTACTO2'
            'TIT_CONTACTO3'
            'TIT_TIPO_INCIDENCIA_KRI'
            'TITULO_TERCERO'
            'USUARIO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_INCIDENCIA_KRI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_INCIDENCIA'
              Width = 345
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
              FieldName = 'FECHA_RECEPCION'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RESPUESTA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FINALIZADO'
              Width = 50
              Visible = True
            end>
        end
        object TBIncidencias: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLCabIncidencias: TLFPanel
            Left = 0
            Top = 0
            Width = 336
            Height = 21
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBTitAgeIn: TLFDbedit
              Left = 50
              Top = 1
              Width = 286
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBAgeIn: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object DBMMDatosIncidencia: TLFDBMemo
          Left = 0
          Top = 360
          Width = 1015
          Height = 100
          Align = alBottom
          BevelInner = bvNone
          Color = clInfoBk
          Constraints.MinHeight = 21
          DataField = 'DATOS_INCIDENCIA'
          DataSource = DMAgentes.DSxIncidencias
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object TSComunicaciones: TTabSheet [7]
        Caption = 'C&omunicaciones'
        OnHide = TSComunicacionesHide
        OnShow = TSComunicacionesShow
        object DBGComunicaciones: TDBGridFind2000
          Left = 0
          Top = 23
          Width = 1015
          Height = 437
          Align = alClient
          DataSource = DMAgentes.DSxComunicaciones
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGComunicacionesCellClick
          OnDrawColumnCell = DBGComunicacionesDrawColumnCell
          OnDblClick = DBGComunicacionesDblClick
          Insercion = False
          ColumnaInicial = 2
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
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ID'
            'FECHA_MODIFICACION'
            'FECHA_CREACION'
            'DESCRIPCION'
            'ARCHIVO')
          CamposNoAccesibles.Strings = (
            'FECHA_CREACION'
            'FECHA_MODIFICACION'
            'ID')
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
              FieldName = 'FECHA_CREACION'
              ReadOnly = True
              Width = 110
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_MODIFICACION'
              ReadOnly = True
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 345
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARCHIVO'
              Width = 145
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Width = 30
              Visible = True
            end>
        end
        object TBComunicaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 23
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLCabComunicaciones: TLFPanel
            Left = 0
            Top = 0
            Width = 337
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEComunicacionesCod: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
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
            object DBEComunicacionesTitulo: TLFDbedit
              Left = 50
              Top = 1
              Width = 287
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMAgentes.DSxTerceros
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
          object ToolButton9: TToolButton
            Left = 337
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavComunicaciones: THYMNavigator
            Left = 345
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMAgentes.DSxComunicaciones
            Flat = True
            ParentShowHint = False
            PopupMenu = CEComunicacionesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGComunicaciones
            InsertaControl = DBGComunicaciones
            Exclusivo = False
            ControlEdit = CEComunicaciones
            OrdenAscendente = True
            OnChangeState = NavComunicacionesChangeState
            InsertaUltimo = False
          end
          object ToolButton10: TToolButton
            Left = 545
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtEnviarComunicacionXMail: TToolButton
            Left = 553
            Top = 0
            Action = AEnviarComunicacionXMail
          end
          object TButtImportarArchivoComunicacion: TToolButton
            Left = 576
            Top = 0
            Action = AImportarArchivoComunicacion
          end
          object TButtPlantillaComunicacion: TToolButton
            Left = 599
            Top = 0
            Hint = 'Plantillas para nueva comunicaci'#243'n'
            Caption = 'Plantilla Comunicacion'
            ImageIndex = 32
            Style = tbsDropDown
          end
          object LComunicacionesBusqueda: TLFLabel
            Left = 635
            Top = 0
            Width = 67
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'B'#250'squeda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFComunicacionesBusqueda: TLFEditFind2000
            Left = 702
            Top = 0
            Width = 67
            Height = 22
            TabOrder = 2
            OnChange = EFComunicacionesBusquedaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'ARCHIVO')
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_COMUNICACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFComunicacionesBusquedaBusqueda
            OrdenadoPor.Strings = (
              'DESCRIPCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSZonas: TTabSheet [8]
        Caption = 'Zonas'
        ImageIndex = 7
        OnHide = TSZonasHide
        OnShow = TSZonasShow
        object TBZonas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 23
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLCabZonas: TLFPanel
            Left = 0
            Top = 0
            Width = 336
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEZonasTitulo: TLFDbedit
              Left = 50
              Top = 1
              Width = 286
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEZonasCod: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton6: TToolButton
            Left = 336
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavZonas: THYMNavigator
            Left = 344
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMAgentes.DSQMZonas
            Flat = True
            ParentShowHint = False
            PopupMenu = CEZonasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFZonas
            InsertaControl = DBGFZonas
            Exclusivo = False
            ControlEdit = CEZonas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFZonas: TDBGridFind2000
          Left = 0
          Top = 23
          Width = 1015
          Height = 437
          Align = alClient
          DataSource = DMAgentes.DSQMZonas
          TabOrder = 1
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMAgentes.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ZONA')
          CamposAMostrar.Strings = (
            'ZONA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            'ZONA')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ZONA')
          CamposNoAccesibles.Strings = (
            'TITULO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ZONA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_ZONAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ZONA')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ZONA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 491
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COMISION'
              Visible = True
            end>
        end
      end
      object TSAgentesSub: TTabSheet [9]
        Caption = 'Agentes Sub'
        object TBAgentesSubordinados: TLFToolBar
          Left = 0
          Top = 0
          Width = 1015
          Height = 23
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLCabAgentesSubordinados: TLFPanel
            Left = 0
            Top = 0
            Width = 336
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEAgentesSubTitulo: TLFDbedit
              Left = 50
              Top = 1
              Width = 286
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEAgentesSubCod: TLFDbedit
              Left = 1
              Top = 1
              Width = 48
              Height = 21
              Color = clInfoBk
              DataField = 'AGENTE'
              DataSource = DMAgentes.DSQMAgentes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton8: TToolButton
            Left = 336
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAgentesSub: THYMNavigator
            Left = 344
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMAgentes.DSQMAgentesSub
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGAgenteSub
            InsertaControl = DBGAgenteSub
            Exclusivo = False
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGAgenteSub: TDBGridFind2000
          Left = 0
          Top = 23
          Width = 1015
          Height = 437
          Align = alClient
          DataSource = DMAgentes.DSQMAgentesSub
          TabOrder = 1
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'AGENTE_SUB')
          CamposAMostrar.Strings = (
            'AGENTE_SUB'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            'AGENTE')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          Numericos.Strings = (
            'AGENTE')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_AGENTES_CUENTAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'AGENTE_SUB'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 385
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COMISION'
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1015
          Height = 460
          DataSource = DMAgentes.DSQMAgentes
          CamposAMarcar.Strings = (
            'BAJA'
            'ENVIAR_COPIA_ALB'
            'ENVIAR_COPIA_FAC'
            'ENVIAR_COPIA_OFC'
            'ENVIAR_COPIA_PEC')
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
            'AGENTE'
            'BAJA'
            'CODIGO_NTV'
            'CODIGO_POSTAL'
            'CUENTA'
            'FECHA_ALTA'
            'FECHA_BAJA'
            'P_COMISION'
            'TERCERO'
            'TIT_LOCALIDAD'
            'TITULO'
            'TITULO_CODIGO_POSTAL'
            'TITULO_POBLACION'
            'TITULO_PROVINCIA'
            'TITULO_REGION')
          Columns = <
            item
              Expanded = False
              FieldName = 'AGENTE'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 365
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COMISION'
              Width = 58
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 518
    Width = 1027
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEAgrupaciones
    Left = 510
    Top = 10
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 550
    Top = 10
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosTercero: TMenuItem
      Action = AATercero
    end
  end
  inherited ALMain: TLFActionList
    Left = 394
    Top = 2
    object AVisualizarListadoAgentes: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Agentes'
      Hint = 'Visualizar Listado Agentes'
      ImageIndex = 125
      OnExecute = AVisualizarListadoAgentesExecute
    end
    object AImprimirListadoAgentes: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado Agentes'
      Hint = 'Imprimir Listado Agentes'
      ImageIndex = 14
      OnExecute = AImprimirListadoAgentesExecute
    end
    object AListadoAlbaranesAgente: TAction
      Category = 'Listados'
      Caption = 'Listado de Albaranes por Agente/Cliente'
      Hint = 'Listado de Albaranes por Agente/Cliente'
      ImageIndex = 14
      OnExecute = AListadoAlbaranesAgenteExecute
    end
    object AListadoComisionesAgente: TAction
      Category = 'Listados'
      Caption = 'Listado de Comisiones de Agente'
      Hint = 'Listado de Comisiones de Agente'
      ImageIndex = 14
      OnExecute = AListadoComisionesAgenteExecute
    end
    object ALstComisionesDetalladas: TAction
      Category = 'Listados'
      Caption = 'Listado de Comisiones por Margen'
      Hint = 'Listado Comisiones Detalladas'
      ImageIndex = 14
      OnExecute = ALstComisionesDetalladasExecute
    end
    object ALstComisionesResumen: TAction
      Category = 'Listados'
      Caption = 'Comisiones Resumen'
      Hint = 'Listado Resumen de Comisiones'
      ImageIndex = 14
      OnExecute = ALstComisionesResumenExecute
    end
    object ALstPrevisionComisiones: TAction
      Category = 'Listados'
      Caption = 'Listado de Previsi'#243'n de Comisiones por Margen'
      Hint = 'Listado de Previsi'#243'n de Comisiones por margen'
      ImageIndex = 14
      OnExecute = ALstPrevisionComisionesExecute
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
    object AConfAgentes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Agentes'
      Hint = 'Listados de Agentes'
      ImageIndex = 77
      OnExecute = AConfAgentesExecute
    end
    object AConfComisionesAgentes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Comisiones de Agentes'
      Hint = 'Listados de Comisiones de Agentes'
      ImageIndex = 77
      OnExecute = AConfComisionesAgentesExecute
    end
    object AConfAlbaranesAgentes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Albaranes por Agente/Cliente'
      Hint = 'Listados de Albaranes por Agente/Cliente'
      ImageIndex = 77
      OnExecute = AConfAlbaranesAgentesExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'G2K'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AIncidencias: TAction
      Category = 'G2K'
      Caption = 'Incidencias'
      ImageIndex = 6
      OnExecute = AIncidenciasExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'CalculoComision'
      Caption = 'C'#225'lculo Comisi'#243'n'
      ImageIndex = 3
    end
    object ARecalcularComisiones: TAction
      Category = 'CalculoComision'
      Caption = 'Recalcular C'#225'lculo de Comisiones'
      Hint = 'Recalcular C'#225'lculo de Comisiones'
      ImageIndex = 3
      OnExecute = ARecalcularComisionesExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosAgente: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Agente'
      ImageIndex = 59
      OnExecute = AAdjuntosAgenteExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AImprimirNotas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Notas'
      Hint = 'Imprimir Notas'
      ImageIndex = 14
      OnExecute = AImprimirNotasExecute
    end
    object ARecalcularComisionesTodos: TAction
      Category = 'CalculoComision'
      Caption = 'Recalcular C'#225'lculo de Comisiones de TODOS los agentes'
      Hint = 'Recalcular C'#225'lculo de Comisiones de TODOS los agentes'
      ImageIndex = 3
      OnExecute = ARecalcularComisionesTodosExecute
    end
    object ARefrescarComisiones: TAction
      Category = 'CalculoComision'
      Caption = 'Refrescar'
      Hint = 'Refrescar datos'
      ImageIndex = 26
      OnExecute = ARefrescarComisionesExecute
    end
    object ABloqueaComisiones: TAction
      Category = 'CalculoComision'
      Caption = 'Bloquea Comisiones'
      Hint = 'Bloquea Comisiones de la seleccion actual'
      ImageIndex = 68
      OnExecute = ABloqueaComisionesExecute
    end
    object ADesbloqueaComisiones: TAction
      Category = 'CalculoComision'
      Caption = 'Desbloquea Comisiones'
      Hint = 'Desbloquea Comisiones de la seleccion actual'
      ImageIndex = 67
      OnExecute = ADesbloqueaComisionesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 448
    Top = 65534
  end
  object CEAgrupaciones: TControlEdit
    EnlazadoA = CEAgrupacionesDisp
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 588
    Top = 78
  end
  object CEAgrupacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 552
    Top = 78
    object CEAgrupacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object ALAgentes: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 287
    Top = 133
    object ANewTercero: TAction
      Caption = 'ANewTercero'
      OnExecute = ANewTerceroExecute
    end
    object AATercero: TAction
      Caption = 'Ver Datos Tercero'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
      ShortCut = 49236
      OnExecute = AATerceroExecute
    end
    object ATraspasoMargenes: TAction
      Caption = 'Traspasar Previsiones'
      Hint = 'Traspasar Previsiones'
      ImageIndex = 86
      OnExecute = ATraspasoMargenesExecute
    end
    object AEnviarComunicacionXMail: TAction
      Caption = 'Enviar Comunicacion por e-mail'
      Hint = 'Enviar Comunicacion por e-mail'
      ImageIndex = 34
      OnExecute = AEnviarComunicacionXMailExecute
    end
    object AImportarArchivoComunicacion: TAction
      Caption = 'Importar Archivo a Comunicaciones'
      Hint = 'Importar Archivo a Comunicaciones'
      ImageIndex = 49
      OnExecute = AImportarArchivoComunicacionExecute
    end
    object AContaExtracto: TAction
      Caption = 'AContaExtracto'
      Hint = 'Doble click para ver extracto contable'
      ImageIndex = 30
      OnExecute = AContaExtractoExecute
    end
  end
  object CEAgrupacionesDisp: TControlEdit
    EnlazadoA = CEAgrupacionesCom
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesDispPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 128
  end
  object CEAgrupacionesDispPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 552
    Top = 128
    object CEAgrupacionesDispMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesDispMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesDispMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesDispMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesDispMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesDispMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesDispMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesDispMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesDispMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesDispMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEAgrupacionesCom: TControlEdit
    EnlazadoA = CEAgrupacionesDispCom
    FichaEdicion = TSComisiones
    FichaExclusiva = TSComisiones
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesComPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 178
  end
  object CEAgrupacionesDispCom: TControlEdit
    EnlazadoA = CEAgrupacionsComArt
    FichaEdicion = TSComisiones
    FichaExclusiva = TSComisiones
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesDispComPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 226
  end
  object CEAgrupacionesComPMEdit: TPopUpTeclas
    Left = 554
    Top = 176
    object CEAgrupacionesComMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesComMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesComMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesComMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesComMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesComMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesComMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAgrupacionesComMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAgrupacionesComMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAgrupacionesComMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEAgrupacionesDispComPMEdit: TPopUpTeclas
    Left = 556
    Top = 224
    object CEAgrupacionesDispComMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesDispComMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesDispComMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesDispComMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesDispComMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesDispComMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesDispComMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesDispComMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesDispComMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesDispComMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEMargenes: TControlEdit
    EnlazadoA = CEPrevision
    FichaEdicion = TSMargenes
    FichaExclusiva = TSMargenes
    SubComplementario = ALMain
    PopUpMenu = CEMargenPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 268
  end
  object CEMargenPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 556
    Top = 266
    object CEMargenesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMargenesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMargenesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMargenesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMargenesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMargenesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMargenesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMargenesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMargenesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMargenesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEPrevision: TControlEdit
    EnlazadoA = CEComunicaciones
    FichaEdicion = TSMargenes
    FichaExclusiva = TSMargenes
    SubComplementario = ALMain
    PopUpMenu = CEPrevisionPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 312
  end
  object CEPrevisionPMEdit: TPopUpTeclas
    Left = 552
    Top = 312
    object CEPrevisionMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
    end
    object CEPrevisionMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
    end
    object CEPrevisionMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
    end
    object CEPrevisionMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
    end
    object CEPrevisionMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
    end
    object CEPrevisionMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
    end
    object CEPrevisionMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
    end
    object CEPrevisionMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
    end
    object CEPrevisionMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
    end
    object CEPrevisionMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
    end
  end
  object CEComunicaciones: TControlEdit
    EnlazadoA = CEZonas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEComunicacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 352
  end
  object CEComunicacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 552
    Top = 352
    object CEComunicacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEComunicacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEComunicacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEComunicacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEComunicacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEComunicacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEComunicacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEComunicacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEComunicacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEComunicacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object PMPlantillasComunicaciones: TPopupMenu
    AutoHotkeys = maManual
    Left = 592
    Top = 144
  end
  object CEZonas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSZonas
    FichaExclusiva = TSZonas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEZonasPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 392
  end
  object CEZonasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 552
    Top = 392
    object CEZonasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEZonasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEZonasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEZonasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEZonasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEZonasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEZonasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEZonasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEZonasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEZonasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEAgrupacionsComArt: TControlEdit
    EnlazadoA = CEAgrupacionesDispComArt
    FichaEdicion = TSComisionesArt
    FichaExclusiva = TSComisionesArt
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionsComArtPMEdit
    Teclas = DMMain.Teclas
    Left = 604
    Top = 180
  end
  object CEAgrupacionsComArtPMEdit: TPopUpTeclas
    Left = 644
    Top = 180
    object CEAgrupacionsComArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionsComArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionsComArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionsComArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionsComArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionsComArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionsComArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAgrupacionsComArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAgrupacionsComArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAgrupacionsComArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEAgrupacionesDispComArt: TControlEdit
    EnlazadoA = CEMargenes
    FichaEdicion = TSComisionesArt
    FichaExclusiva = TSComisionesArt
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesDispComArtPMEdit
    Teclas = DMMain.Teclas
    Left = 600
    Top = 216
  end
  object CEAgrupacionesDispComArtPMEdit: TPopUpTeclas
    Left = 648
    Top = 216
    object CEAgrupacionesDispComArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesDispComArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesDispComArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesDispComArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesDispComArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesDispComArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesDispComArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesDispComArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesDispComArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesDispComArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CECalculoComisiones: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CECalculoComisionesPMEdit
    Teclas = DMMain.Teclas
    Left = 600
    Top = 248
  end
  object CECalculoComisionesPMEdit: TPopUpTeclas
    Left = 648
    Top = 248
    object CECalculoComisionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECalculoComisionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECalculoComisionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECalculoComisionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECalculoComisionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CECalculoComisionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECalculoComisionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECalculoComisionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECalculoComisionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECalculoComisionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object PMCalculoComisiones: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 648
    Top = 16
    object MIPPRecalcularComisiones: TMenuItem
      Action = ARecalcularComisiones
    end
    object MIPPRecalcularComisionesTodos: TMenuItem
      Action = ARecalcularComisionesTodos
    end
  end
end
