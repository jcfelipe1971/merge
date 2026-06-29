inherited FMPagares: TFMPagares
  Left = 470
  Top = 224
  Width = 600
  Height = 450
  HelpContext = 274
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Pagar'#233's'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 600
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 249
    TabOrder = 2
    inherited TBMain: TLFToolBar
      Width = 586
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      inherited NavMain: THYMNavigator
        DataSource = DMPagares.DSQMPagares
        Hints.Strings = ()
        EditaControl = DBEFProv_Acr
        InsertaControl = DBEFProv_Acr
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMPagares.DSQMPagares
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TBSep1: TToolButton
        Left = 319
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TBListado: TToolButton
        Left = 327
        Top = 0
        Action = AImprimePagares
      end
      object TBCarta: TToolButton
        Left = 350
        Top = 0
        Action = AImprimirCartaPago
      end
      object PNLVerSaldos: TLFPanel
        Left = 373
        Top = 0
        Width = 96
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object CBVerSaldos: TLFCheckBox
          Left = 4
          Top = 3
          Width = 90
          Height = 17
          Caption = 'Ver Saldos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBVerSaldosChange
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 219
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 191
          inherited G2KTableLoc: TG2KTBLoc
            Left = 102
            DataSource = DMPagares.DSQMPagares
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_PAGARES'
            CampoNum = 'PAGARE'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LBLTalon: TLFLabel
            Left = 102
            Top = 80
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pagar'#233
          end
          object LBanco: TLFLabel
            Left = 105
            Top = 36
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LBLFecha: TLFLabel
            Left = 70
            Top = 101
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Libramiento'
          end
          object LImporte: TLFLabel
            Left = 435
            Top = 124
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LBLDescripcion: TLFLabel
            Left = 80
            Top = 58
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LBLLugar: TLFLabel
            Left = 109
            Top = 124
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar'
          end
          object SPBPermuta: TSpeedButton
            Left = 2
            Top = 10
            Width = 71
            Height = 23
            Caption = 'Permuta'
            Flat = True
            OnClick = SPBPermutaClick
          end
          object LBLPro_Acr: TLFLabel
            Left = 77
            Top = 14
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
          object LBLFVencimiento: TLFLabel
            Left = 257
            Top = 101
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Vencimiento'
          end
          object LBLTipo_asiento: TLFLabel
            Left = 441
            Top = 146
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Asiento'
          end
          object LSaldoDeudor: TLFLabel
            Left = 142
            Top = 168
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo Deu.'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object LSaldoAcreedor: TLFLabel
            Left = 292
            Top = 168
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo Acr.'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object LSaldo: TLFLabel
            Left = 459
            Top = 168
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object DBEFBanco: TLFDBEditFind2000
            Left = 140
            Top = 32
            Width = 54
            Height = 21
            DataField = 'BANCO'
            DataSource = DMPagares.DSQMPagares
            TabOrder = 2
            OnChange = DBEFBancoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO = 1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloBanco: TLFEdit
            Left = 195
            Top = 32
            Width = 379
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 140
            Top = 98
            Width = 87
            Height = 21
            DataField = 'FECHA_LIBRAMIENTO'
            DataSource = DMPagares.DSQMPagares
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBEImporte: TLFDbedit
            Left = 474
            Top = 120
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'IMPORTE'
            DataSource = DMPagares.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEPagare: TLFDbedit
            Left = 140
            Top = 76
            Width = 434
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'PAGARE'
            DataSource = DMPagares.DSQMPagares
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnChange = DBEPagareChange
          end
          object DBCBContabilizado: TLFDBCheckBox
            Left = 142
            Top = 144
            Width = 87
            Height = 17
            Caption = '&Contabilizado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTABILIZADO'
            DataSource = DMPagares.DSxInfoActualizada
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDescripcion: TLFDbedit
            Left = 140
            Top = 54
            Width = 434
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMPagares.DSQMPagares
            TabOrder = 4
          end
          object DBELugar: TLFDbedit
            Left = 140
            Top = 120
            Width = 282
            Height = 21
            DataField = 'LUGAR_LIBRAMIENTO'
            DataSource = DMPagares.DSQMPagares
            TabOrder = 8
          end
          object EPro_Acre: TLFEdit
            Left = 195
            Top = 10
            Width = 379
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEFProv_Acr: TLFDBEditFind2000
            Left = 140
            Top = 10
            Width = 54
            Height = 21
            DataField = 'COD_CLI_PRO'
            DataSource = DMPagares.DSQMPagares
            TabOrder = 0
            OnChange = DBEFProv_AcrChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
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
          object DBDTPFVencimiento: TLFDBDateEdit
            Left = 335
            Top = 98
            Width = 87
            Height = 21
            DataField = 'FECHA_VENCIMIENTO'
            DataSource = DMPagares.DSQMPagares
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBCBPagado: TLFDBCheckBox
            Left = 288
            Top = 144
            Width = 87
            Height = 17
            Caption = '&Pagado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PAGADO'
            DataSource = DMPagares.DSxInfoActualizada
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFTipo_asiento: TLFDBEditFind2000
            Left = 519
            Top = 142
            Width = 55
            Height = 21
            DataField = 'TIPO_ASIENTO_KRI'
            DataSource = DMPagares.DSQMPagares
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBESaldoDeudor: TLFDbedit
            Left = 199
            Top = 164
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO_DEUDOR'
            DataSource = DMPagares.DSQMPagares
            Enabled = False
            TabOrder = 13
          end
          object DBESaldoAcreedor: TLFDbedit
            Left = 345
            Top = 164
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO_ACREEDOR'
            DataSource = DMPagares.DSQMPagares
            Enabled = False
            TabOrder = 14
          end
          object DBESaldo: TLFDbedit
            Left = 490
            Top = 164
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMPagares.DSQMPagares
            Enabled = False
            TabOrder = 15
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 191
          DataSource = DMPagares.DSQMPagares
          CamposAMarcar.Strings = (
            'CONTABILIZADO'
            'PAGADO')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'BANCO'
            'COD_CLI_PRO'
            'CONTABILIZADO'
            'DESCRIPCION'
            'FECHA_LIBRAMIENTO'
            'FECHA_VENCIMIENTO'
            'IMPORTE'
            'LUGAR_LIBRAMIENTO'
            'PAGADO'
            'PAGARE'
            'TIPO_TERCERO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PAGARE'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_LIBRAMIENTO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_VENCIMIENTO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTABILIZADO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 40
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 249
    Width = 590
    Height = 148
    TabOrder = 1
    inherited TBDetalle: TLFToolBar
      Width = 590
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        Width = 176
        DataSource = DMPagares.DSQMDetalle
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        ConfirmDelete = False
      end
      object TButtSep2: TToolButton
        Left = 176
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMostrarDisponibles: TToolButton
        Left = 184
        Top = 0
        Hint = 'Mostrar todos los recibos disponibles'
        Caption = 'Mostrar Disponibles'
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMostrarDisponiblesClick
      end
      object EPDetalle: THYMEditPanel
        Left = 207
        Top = 0
        Width = 23
        Height = 22
        DataSource = DMPagares.DSQMDetalle
        VisibleButtons = [neRango]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtrar los recibos disponibles'
          'Imprime report'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 1
        Flat = True
        Exclusivo = True
        ControlEdit = CEDetalle
        OnClickRango = EPDetalleClickRango
      end
      object TButtSeleccionarTodas: TToolButton
        Left = 230
        Top = 0
        Hint = 'Seleccionar todos los Recibos'
        Caption = 'Seleccionar Todas'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtSeleccionarTodasClick
      end
      object TButtSep5: TToolButton
        Left = 253
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtContabilizaPagare: TToolButton
        Left = 261
        Top = 0
        Hint = 'Contabilizar Pagar'#233
        ImageIndex = 68
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtCerrarPagareClick
      end
      object TButtDescontabilizaPagare: TToolButton
        Left = 284
        Top = 0
        Hint = 'Descontabilizar Pagar'#233
        ImageIndex = 67
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtAbrirPagareClick
      end
      object TButtPagaPagare: TToolButton
        Left = 307
        Top = 0
        Hint = 'Paga el Pagar'#233
        Caption = 'Paga Pagare'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtPagaPagareClick
      end
      object TButtDespagaPagare: TToolButton
        Left = 330
        Top = 0
        Hint = 'Despaga el Pagar'#233
        Caption = 'Despaga Pagare'
        ImageIndex = 39
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDespagaPagareClick
      end
      object ToolButton1: TToolButton
        Left = 353
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBIrApuntes: TToolButton
        Left = 361
        Top = 0
        Hint = 'Ir a los Apuntes Contables'
        Caption = 'TBIrApuntes'
        DropdownMenu = PMIrApunte
        ImageIndex = 30
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 126
      DataSource = DMPagares.DSQMDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      AutoCambiarColumna = True
      AutoPostEnCheckBox = True
      CamposAOrdernar.Strings = (
        'LIQUIDO'
        'DOC_TIPO'
        'COD_CLI_PRO'
        'CTA_PAGO'
        'TIPO_EFECTO'
        'VENCIMIENTO'
        'PAGADO'
        'MONEDA'
        'PAGARE'
        'DOC_NUMERO')
      CamposNoAccesibles.Strings = (
        'LINEA'
        'VENCIMIENTO'
        'CTA_PAGO'
        'LIQUIDO'
        'PAGADO'
        'TIPO_EFECTO'
        'IMPAGADO'
        'COD_CLI_PRO'
        'DOC_NUMERO')
      ColumnasCheckBoxes.Strings = (
        'PAGADO'
        'PAGARE')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '')
      CamposCalcAOrdenar.Strings = (
        'LIQUIDO_MONEDA')
      CamposCalcReferencia.Strings = (
        'LIQUIDO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 53
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COD_CLI_PRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 42
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
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 72
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CTA_PAGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'liquido_moneda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 95
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PAGADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_EFECTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGARE'
          Width = 40
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 397
    Width = 590
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    DataSource = DMPagares.DSQMPagares
    Left = 340
    Top = 30
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 378
    Top = 40
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
      ShortCut = 0
    end
    inherited CEMainMiaprox: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiexacta: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiimprime: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirango: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMireport: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicopy: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicut: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipaste: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMisalir: TMenuItem
      ShortCut = 0
    end
  end
  inherited ALMain: TLFActionList
    Left = 458
    Top = 62
    object AImprimePagares: TAction
      Category = 'Listados'
      Caption = 'Impresi'#243'n de Pagar'#233's'
      Hint = 'Impresi'#243'n de Pagar'#233's'
      ImageIndex = 14
      OnExecute = AImprimePagaresExecute
    end
    object AVerCartaPago: TAction
      Category = 'Listados'
      Caption = 'Visualizar Carta de Pago'
      Hint = 'Visualizar Carta de Pago'
      ImageIndex = 14
      OnExecute = AVerCartaPagoExecute
    end
    object AImprimirCartaPago: TAction
      Category = 'Listados'
      Caption = 'Imprimir Carta de Pago'
      Hint = 'Imprimir Carta de Pago'
      ImageIndex = 125
      OnExecute = AImprimirCartaPagoExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AListConfig: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida de la Carta de Pago'
      Hint = 'Configuraci'#243'n R'#225'pida de la Carta de Pago'
      ImageIndex = 77
      OnExecute = AListConfigExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 77
    end
    object AContabilizaPagares: TAction
      Category = 'Procesos'
      Caption = 'Contabiliza todos los Pagar'#233's pendientes'
      Hint = 'Contabiliza todos los Pagar'#233's pendientes'
      ImageIndex = 68
      OnExecute = AContabilizaPagaresExecute
    end
    object APagapagares: TAction
      Category = 'Procesos'
      Caption = 'Paga todos los Pagar'#233's pendientes'
      Hint = 'Paga todos los Pagar'#233's pendientes'
      ImageIndex = 143
      OnExecute = APagapagaresExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 504
    Top = 64
  end
  inherited CEDetalle: TControlEdit
    DataSource = DMPagares.DSQMDetalle
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    Complementario = TBMain
    SubComplementario = ALMain
    Left = 340
    Top = 79
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 381
    Top = 83
    inherited CEDetalleMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEDetalleMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEDetalleMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEDetalleMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEDetalleMiinsert: TMenuItem
      ShortCut = 16454
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      ShortCut = 16460
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEDetalleMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEDetalleMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEDetalleMirefresh: TMenuItem
      ShortCut = 16499
    end
    object CEDetalleMiSep: TMenuItem
      Caption = '-'
      ShortCut = 16499
      Visible = False
    end
    object CEDetalleMibuscar: TMenuItem
      Caption = 'Buscar'
      Visible = False
    end
    object CEDetalleMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      Visible = False
    end
    object CEDetalleMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      Visible = False
    end
    object CEDetalleMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      Visible = False
    end
    object CEDetalleMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
    end
    object CEDetalleMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      Visible = False
    end
    object CEDetalleMicopy: TMenuItem
      Caption = 'Copiar'
      Visible = False
    end
    object CEDetalleMicut: TMenuItem
      Caption = 'Cortar'
      Visible = False
    end
    object CEDetalleMipaste: TMenuItem
      Caption = 'Pegar'
      Visible = False
    end
    object CEDetalleMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      Visible = False
    end
  end
  object PMIrApunte: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 416
    Top = 208
    object MIIrApunteContabilizado: TMenuItem
      Caption = 'Ir al Apunte de Contabilizado'
      Hint = 'Ir al Apunte de Contabilizado'
      ImageIndex = 42
      OnClick = MIIrApunteContabilizadoClick
    end
    object MIIrApuntePagado: TMenuItem
      Caption = 'Ir al Apunte de Pago'
      Hint = 'Ir al Apunte de Pago'
      ImageIndex = 30
      OnClick = MIIrApuntePagadoClick
    end
  end
end
