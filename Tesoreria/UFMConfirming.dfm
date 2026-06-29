inherited FMConfirming: TFMConfirming
  Left = 419
  Top = 154
  Width = 1034
  Height = 500
  HelpContext = 272
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Confirming de Pagos'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1024
    Height = 177
    TabOrder = 2
    inherited TBMain: TLFToolBar
      Width = 1020
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      inherited NavMain: THYMNavigator
        DataSource = DMConfirming.DSQMConfirming
        Hints.Strings = ()
        EditaControl = DBETituloConfirming
        InsertaControl = DBETituloConfirming
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object PNLVerSaldos: TLFPanel
        Left = 319
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
      Width = 1020
      Height = 147
      inherited TSFicha: TTabSheet
        object SBAsientoCierre: TSpeedButton [0]
          Left = 504
          Top = 77
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAsientoCierreDblClick
        end
        object SBABanco: TSpeedButton [1]
          Left = 167
          Top = 59
          Width = 366
          Height = 19
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnClick = ABancosExecute
        end
        inherited PEdit: TLFPanel
          Width = 1012
          Height = 119
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMConfirming.DSQMConfirming
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_CARTERA_CONFIRMING'
            CampoNum = 'NUM_CONFIRMING'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'NUM_CONFIRMING')
          end
          object LBLConfirming: TLFLabel
            Left = 50
            Top = 9
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Confirming'
          end
          object LBanco: TLFLabel
            Left = 68
            Top = 31
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LFecha: TLFLabel
            Left = 69
            Top = 53
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LImporte: TLFLabel
            Left = 576
            Top = 9
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LAsientoCierre: TLFLabel
            Left = 576
            Top = 31
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LClasePago: TLFLabel
            Left = 44
            Top = 74
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clase Pago'
          end
          object LCodigoEstadistico: TLFLabel
            Left = 9
            Top = 97
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Estad'#237'stico'
          end
          object LTipoPagoConfirming: TLFLabel
            Left = 218
            Top = 98
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Pago'
          end
          object DBEConfirming: TLFDbedit
            Left = 103
            Top = 5
            Width = 50
            Height = 21
            Color = clInfoBk
            DataField = 'NUM_CONFIRMING'
            DataSource = DMConfirming.DSQMConfirming
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
          object DBEFBanco: TLFDBEditFind2000
            Left = 103
            Top = 27
            Width = 50
            Height = 21
            DataField = 'BANCO'
            DataSource = DMConfirming.DSQMConfirming
            TabOrder = 2
            OnChange = DBEFBancoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1 AND CUENTA_CONFIRMING > '#39#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloBanco: TLFDbedit
            Left = 154
            Top = 27
            Width = 353
            Height = 21
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMConfirming.DSxBancos
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
            Left = 103
            Top = 49
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMConfirming.DSQMConfirming
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DBEImporte: TLFDbedit
            Left = 615
            Top = 5
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'IMPORTE'
            DataSource = DMConfirming.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBETituloConfirming: TLFDbedit
            Left = 154
            Top = 5
            Width = 353
            Height = 21
            DataField = 'TITULO'
            DataSource = DMConfirming.DSQMConfirming
            TabOrder = 1
          end
          object DBCHKCerrada: TLFDBCheckBox
            Left = 615
            Top = 73
            Width = 74
            Height = 17
            Caption = '&Cerrada'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CERRADO'
            DataSource = DMConfirming.DSxInfoActualizada
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAsientoCierre: TLFDbedit
            Left = 615
            Top = 27
            Width = 100
            Height = 21
            Color = clAqua
            DataField = 'ASIENTO'
            DataSource = DMConfirming.DSQMConfirming
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
          object DBEClasePago: TLFDbedit
            Left = 102
            Top = 71
            Width = 67
            Height = 21
            Hint = 'S - Servicio'#13#10'M - Mercanc'#237'a'
            DataField = 'CLASE_PAGO'
            DataSource = DMConfirming.DSQMConfirming
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
          end
          object DBECodigoEstadistico: TLFDbedit
            Left = 102
            Top = 93
            Width = 67
            Height = 21
            DataField = 'CODIGO_ESTADISTICO'
            DataSource = DMConfirming.DSQMConfirming
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBRGTipoPago: TDBRadioGroup
            Left = 271
            Top = 86
            Width = 227
            Height = 31
            Columns = 2
            Ctl3D = True
            DataField = 'TIPO_PAGO'
            DataSource = DMConfirming.DSQMConfirming
            Items.Strings = (
              'Transferencia'
              'Cheque')
            ParentCtl3D = False
            TabOrder = 7
            TabStop = True
            Values.Strings = (
              'T'
              'C')
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1012
          Height = 119
          DataSource = DMConfirming.DSQMConfirming
          CamposAMarcar.Strings = (
            'CERRADO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'BANCO'
            'CERRADO'
            'FECHA'
            'IMPORTE'
            'NUM_CONFIRMING'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'NUM_CONFIRMING'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 203
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CERRADO'
              Width = 42
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 177
    Width = 1024
    Height = 270
    TabOrder = 1
    inherited TBDetalle: TLFToolBar
      Width = 1024
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        Width = 176
        DataSource = DMConfirming.DSQMDetalle
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
        ImageIndex = 30
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMostrarDisponiblesClick
      end
      object EPDetalle: THYMEditPanel
        Left = 207
        Top = 0
        Width = 23
        Height = 22
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
        Hint = 'Seleccionar todos los recibos'
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
      object TButtCerrarConfirming: TToolButton
        Left = 261
        Top = 0
        Hint = 'Cerrar el Confirming'
        ImageIndex = 68
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtCerrarConfirmingClick
      end
      object TButtAbrirConfirming: TToolButton
        Left = 284
        Top = 0
        Hint = 'Abrir el Confirming'
        ImageIndex = 67
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtAbrirConfirmingClick
      end
      object ToolButton1: TToolButton
        Left = 307
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtGeneraConfirming: TToolButton
        Left = 315
        Top = 0
        Hint = 'Generamos Formato Confirming'
        Caption = 'Genera Confirming'
        DropdownMenu = PPFormatos
        ImageIndex = 94
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton2: TToolButton
        Left = 351
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtDesvenceLineaConfirming: TToolButton
        Left = 359
        Top = 0
        Action = ADesvenceLineaConfirming
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1024
      Height = 219
      DataSource = DMConfirming.DSQMDetalle
      DefaultDrawing = False
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = nil
      TabOrder = 0
      OnCellClick = DBGFDetalleCellClick
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      IniStorage = FSMain
      AutoPostEnCheckBox = True
      Transaction = DMConfirming.TLocal
      CamposAOrdernar.Strings = (
        'COD_CLI_PRO'
        'CTA_PAGO'
        'DOC_NUMERO'
        'LIQUIDO'
        'MONEDA'
        'TIPO_EFECTO'
        'VENCIMIENTO'
        'PAGADO')
      ColumnasCheckBoxes.Strings = (
        'PAGADO'
        'CONFIRMING')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      CamposCalcAOrdenar.Strings = (
        'LIQUIDO_MONEDA')
      CamposCalcReferencia.Strings = (
        'LIQUIDO')
      Columns = <
        item
          Expanded = False
          FieldName = 'CONFIRMING'
          Width = 34
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REGISTRO'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_TIPO'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_SERIE'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_NUMERO'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COD_CLI_PRO'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Width = 218
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VENCIMIENTO'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CTA_PAGO'
          ReadOnly = True
          Width = 98
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO_MONEDA'
          ReadOnly = True
          Width = 74
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA'
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PAGADO'
          ReadOnly = True
          Width = 42
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_EFECTO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIC_DESCUENTO'
          ReadOnly = True
          Width = 54
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NUM_FACTURA'
          ReadOnly = True
          Width = 171
          Visible = True
        end>
    end
    object PNLSaldos: TLFPanel
      Left = 0
      Top = 241
      Width = 1024
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LSaldoDeudor: TLFLabel
        Left = 12
        Top = 8
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo Deu.'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
      end
      object LSaldoAcreedor: TLFLabel
        Left = 170
        Top = 8
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo Acr.'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
      end
      object LSaldo: TLFLabel
        Left = 337
        Top = 8
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
      end
      object DBESaldoDeudor: TLFDbedit
        Left = 69
        Top = 4
        Width = 84
        Height = 21
        Color = clInfoBk
        DataField = 'SALDO_DEUDOR'
        DataSource = DMConfirming.DSQMDetalle
        Enabled = False
        TabOrder = 0
      end
      object DBESaldoAcreedor: TLFDbedit
        Left = 223
        Top = 4
        Width = 84
        Height = 21
        Color = clInfoBk
        DataField = 'SALDO_ACREEDOR'
        DataSource = DMConfirming.DSQMDetalle
        Enabled = False
        TabOrder = 1
      end
      object DBESaldo: TLFDbedit
        Left = 368
        Top = 4
        Width = 84
        Height = 21
        Color = clInfoBk
        DataField = 'SALDO'
        DataSource = DMConfirming.DSQMDetalle
        Enabled = False
        TabOrder = 2
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 1024
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 492
    Top = 18
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 520
    Top = 18
  end
  inherited ALMain: TLFActionList
    Left = 412
    Top = 18
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AImpresion: TAction
      Category = 'Listados'
      Caption = 'Listados de Confirmings'
      Hint = 'Listados de Confirmings'
      ImageIndex = 14
      OnExecute = AImpresionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ADesvenceLineaConfirming: TAction
      Category = 'Procesos'
      Caption = 'Desvence Linea'
      Hint = 'Desvence Linea de Confirming'
      ImageIndex = 15
      OnExecute = ADesvenceLineaConfirmingExecute
    end
    object ADesvenceConfirming: TAction
      Category = 'Procesos'
      Caption = 'Desvence Confirming'
      Hint = 'Desvence el Confirming'
      ImageIndex = 15
      OnExecute = ADesvenceConfirmingExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 346
    Top = 20
  end
  inherited CEDetalle: TControlEdit
    SubComplementario = ALMain
    Left = 492
    Top = 57
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 521
    Top = 57
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
    end
    object CEDetalleMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEDetalleMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEDetalleMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEDetalleMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEDetalleMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEDetalleMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEDetalleMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEDetalleMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEDetalleMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEDetalleMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
      Visible = False
    end
  end
  object PPFormatos: TPopUpTeclas
    Left = 521
    Top = 89
    object MIBBV: TMenuItem
      Caption = 'B. Bilbao Vizcaya'
      Hint = 'Banco Bilbao Vizcaya'
      OnClick = MIBBVClick
    end
    object MIBSantarder: TMenuItem
      Caption = 'B. Santarder'
      Hint = 'Banco Santander'
      OnClick = MIBSantarderClick
    end
    object MIBSantarderRev53: TMenuItem
      Caption = 'B. Santarder Rev 5.3'
      Hint = 'Banco Santander Rev. 5.3'
      OnClick = MIBSantarderRev53Click
    end
    object MIBCentralHispano: TMenuItem
      Caption = 'B. Central Hispano'
      Hint = 'Banco Central Hispano'
      OnClick = MIBCentralHispanoClick
    end
    object MIBGuipuzcoano: TMenuItem
      Caption = 'B. Guipuzcoano'
      Hint = 'Banco Guipuzcoano'
      OnClick = MIBGuipuzcoanoClick
    end
    object MIBdeValencia: TMenuItem
      Caption = 'B. de Valencia'
      Hint = 'Banco de Valencia'
      OnClick = MIBdeValenciaClick
    end
    object MIBBanesto: TMenuItem
      Caption = 'B. Banesto'
      Hint = 'B. Banesto'
      OnClick = MIBBanestoClick
    end
    object MIBSabadell: TMenuItem
      Caption = 'B. Sabadell'
      Hint = 'B. Sabadell'
      OnClick = MIBSabadellClick
    end
    object MIBankinter: TMenuItem
      Caption = 'Bankinter'
      Hint = 'Bankinter'
      OnClick = MIBankinterClick
    end
    object MIBPopular: TMenuItem
      Caption = 'B. Popular'
      Hint = 'B. Popular'
      OnClick = MIBPopularClick
    end
    object MILaCaixa: TMenuItem
      Caption = 'La Caixa'
      Hint = 'La Caixa'
      OnClick = MILaCaixaClick
    end
  end
  object ALConfirming: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 412
    Top = 48
    object AAsientoCierre: TAction
      Caption = 'Asiento de Cierre'
      OnExecute = AAsientoCierreExecute
    end
    object ABancos: TAction
      Caption = 'Filtra Bancos'
      Hint = 'Muestra banco asociado a la remesa'
      ImageIndex = 30
      OnExecute = ABancosExecute
    end
  end
end
