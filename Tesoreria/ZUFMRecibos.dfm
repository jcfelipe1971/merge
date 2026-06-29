inherited ZFMRecibos: TZFMRecibos
  Left = 477
  Top = 102
  Width = 682
  Height = 537
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recibos por Clientes'
  PopupMenu = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 672
    Height = 241
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 668
      inherited NavMain: THYMNavigator
        Width = 216
        DataSource = ZDMRecibos.DSCabecera
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBERecibo
        InsertaControl = DBERecibo
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        Width = 56
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
        Hint = 'Marcar como servidas todas las l'#237'neas'
        Caption = 'Bloquear'
        ImageIndex = 68
      end
      object PNLTitSerie: TLFPanel
        Left = 311
        Top = 0
        Width = 218
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        DesignSize = (
          218
          22)
        object LSerie: TLFLabel
          Left = 11
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object ETitSerie: TLFEdit
          Left = 74
          Top = 0
          Width = 142
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Color = clInfoBk
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
        object EFSerie: TLFEditFind2000
          Left = 39
          Top = 0
          Width = 34
          Height = 21
          TabStop = False
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
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 668
      Height = 211
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 660
          Height = 183
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = ZDMRecibos.DSCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_RECIBOS_CAB'
            CampoNum = 'ID'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object LId: TLFLabel
            Left = 55
            Top = 8
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LEstado: TLFLabel
            Left = 175
            Top = 7
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LCliente: TLFLabel
            Left = 34
            Top = 52
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LDescripcion: TLFLabel
            Left = 2
            Top = 117
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conc. Recibo'
          end
          object LFecha: TLFLabel
            Left = 36
            Top = 139
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LLugar: TLFLabel
            Left = 176
            Top = 139
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar'
          end
          object LCuenta: TLFLabel
            Left = 32
            Top = 73
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LCuentaCaja: TLFLabel
            Left = 8
            Top = 95
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Caja'
          end
          object LDocumento: TLFLabel
            Left = 11
            Top = 30
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Documento'
          end
          object LMontoPendiente: TLFLabel
            Left = 69
            Top = 162
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Monto Pendiente'
          end
          object LMontoAplicado: TLFLabel
            Left = 301
            Top = 162
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Monto Aplicado'
          end
          object LMontoEfectivo: TLFLabel
            Left = 531
            Top = 13
            Width = 30
            Height = 13
            Caption = 'Monto'
            Layout = tlCenter
          end
          object LMontoTarjeta: TLFLabel
            Left = 529
            Top = 50
            Width = 66
            Height = 13
            Caption = 'Monto Tarjeta'
            Layout = tlCenter
            Visible = False
          end
          object LMontoCheque: TLFLabel
            Left = 529
            Top = 86
            Width = 110
            Height = 13
            Caption = 'Monto Cheque o Tranf.'
            Layout = tlCenter
            Visible = False
          end
          object LComisionADistribuir: TLFLabel
            Left = 529
            Top = 122
            Width = 94
            Height = 13
            Caption = 'Comisi'#243'n a Distribuir'
            Layout = tlCenter
            Visible = False
          end
          object LEfecto: TLFLabel
            Left = 176
            Top = 29
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Efecto'
          end
          object DBEID: TLFDbedit
            Left = 70
            Top = 4
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = ZDMRecibos.DSCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 70
            Top = 114
            Width = 451
            Height = 21
            Color = clInfoBk
            DataField = 'TEXTO'
            DataSource = ZDMRecibos.DSxDescripcion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 70
            Top = 136
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = ZDMRecibos.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 11
          end
          object DBELugar: TLFDbedit
            Left = 207
            Top = 136
            Width = 314
            Height = 21
            DataField = 'LUGAR'
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 12
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 70
            Top = 48
            Width = 97
            Height = 21
            DataField = 'CLIENTE'
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            CampoADevolver = 'CLIENTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloCliente: TLFDbedit
            Left = 168
            Top = 48
            Width = 353
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMRecibos.DSCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEFCuentaCobro: TLFDBEditFind2000
            Left = 70
            Top = 92
            Width = 97
            Height = 21
            DataField = 'CUENTA_COBRO'
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 8
            OnChange = DBEFCuentaCobroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBERecibo: TLFDbedit
            Left = 70
            Top = 26
            Width = 97
            Height = 21
            DataField = 'RECIBO'
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 2
          end
          object DBETituloEstado: TLFDbedit
            Left = 212
            Top = 4
            Width = 309
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = ZDMRecibos.DSCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBECobros: TLFDbedit
            Left = 161
            Top = 158
            Width = 136
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'LIQUIDO'
            DataSource = ZDMRecibos.DSxTotales
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBECuenta: TLFDbedit
            Left = 70
            Top = 70
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CUENTA'
            DataSource = ZDMRecibos.DSCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            OnChange = DBECuentaChange
          end
          object DBEMontoRecibido: TLFDbedit
            Left = 380
            Top = 158
            Width = 141
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MONTO_RECIBO'
            DataSource = ZDMRecibos.DSCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBEMontoEfectivo: TLFDbedit
            Left = 529
            Top = 26
            Width = 128
            Height = 21
            TabStop = False
            DataField = 'MONTO_EFECTIVO'
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 15
            OnKeyUp = ActSumaRecibo
          end
          object DBEMontoTarjeta: TLFDbedit
            Left = 530
            Top = 63
            Width = 128
            Height = 21
            TabStop = False
            DataField = 'MONTO_TARJETA'
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 16
            Visible = False
            OnKeyUp = ActSumaRecibo
          end
          object DBEMontoCheque: TLFDbedit
            Left = 530
            Top = 99
            Width = 128
            Height = 21
            TabStop = False
            DataField = 'MONTO_CHEQUE'
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 17
            Visible = False
            OnKeyUp = ActSumaRecibo
          end
          object DBEComisionADistribuir: TLFDbedit
            Left = 529
            Top = 135
            Width = 128
            Height = 21
            TabStop = False
            DataSource = ZDMRecibos.DSCabecera
            TabOrder = 18
            Visible = False
            OnKeyUp = ActSumaRecibo
          end
          object DBCBTipoEfecto: TLFDBComboBoxValue
            Left = 212
            Top = 26
            Width = 309
            Height = 21
            DataField = 'TIPO_EFECTO'
            DataSource = ZDMRecibos.DSCabecera
            ItemHeight = 13
            Items.Strings = (
              'Efectivo'
              'Tarjeta'
              'Transferencia')
            Values.Strings = (
              'CON'
              'CRE'
              'TRN')
            TabOrder = 3
          end
          object ECuentaCobro: TLFEdit
            Left = 168
            Top = 92
            Width = 353
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object ECuenta: TLFEdit
            Left = 168
            Top = 70
            Width = 353
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 660
          Height = 183
          DataSource = ZDMRecibos.DSCabecera
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'ID'
            'RECIBO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_RECIBO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECIBO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LUGAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_COBRO'
              Width = 80
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 484
    Width = 672
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 241
    Width = 672
    Height = 243
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 0
      Width = 672
      Height = 243
      ActivePage = TSCobros
      Align = alClient
      MultiLine = True
      OwnerDraw = True
      ParentShowHint = False
      ScrollOpposite = True
      ShowHint = True
      TabIndex = 0
      TabOrder = 0
      TabPosition = tpBottom
      TabActiveColor = clWindow
      TabInactiveColor = 14936298
      object TSCobros: TTabSheet
        Caption = 'Cobros'
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 664
          Height = 26
          Anchors = [akTop, akRight]
          AutoSize = True
          BorderWidth = 1
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          Separators = True
          object NavCobros: THYMNavigator
            Left = 0
            Top = 0
            Width = 160
            Height = 22
            DataSource = ZDMRecibos.DsCobros
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 160
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtCobrar: TToolButton
            Left = 168
            Top = 0
            Action = ACobrarRecibosMarcados
          end
          object TButtDescobrarRecibo: TToolButton
            Left = 191
            Top = 0
            Action = ADescobrarRecibo
          end
          object TBettCobrarMarcadosHastaImporte: TToolButton
            Left = 214
            Top = 0
            Action = ACobrarMarcadosHastaImporte
          end
          object PNLMontoTotal: TLFPanel
            Left = 237
            Top = 0
            Width = 169
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              169
              22)
            object LMontoTotal: TLFLabel
              Left = 13
              Top = 4
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Anchors = []
              Caption = 'Monto total'
              Layout = tlCenter
            end
            object EMontoRecibo: TLFEdit
              Left = 69
              Top = 0
              Width = 97
              Height = 21
              Anchors = []
              AutoSize = False
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 664
          Height = 191
          Align = alClient
          Color = clInfoBk
          DataSource = ZDMRecibos.DsCobros
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalleCellClick
          OnDrawColumnCell = DBGFDetalleDrawColumnCell
          OnDblClick = DBGFDetalleDblClick
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'MARCADO'
            'Abrir Cartera')
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
          CamposCalcAOrdenar.Strings = (
            'LIQUIDO_MONEDA')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clWindow
              Expanded = False
              FieldName = 'MARCADO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCIMIENTO'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_PAGO'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Z_MONTO_APLICAR'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Z_PENDIENTE'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_CAB_Z_RECIBOS'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Abrir Cartera'
              ReadOnly = True
              Width = 50
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 380
    Top = 116
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 392
    Top = 140
    inherited CEMainMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 16460
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 16499
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
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      ShortCut = 0
      Visible = False
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
    Left = 440
    Top = 180
    object AListadoRecibo: TAction
      Tag = 9010
      Category = 'Listados'
      Caption = 'Listado Impresora Recibo Ingreso'
      GroupIndex = 21
      ImageIndex = 14
      OnExecute = AreciboExecute
    end
    object ACobrarMarcadosHastaImporte: TAction
      Category = 'Procesos'
      Caption = 'Cobrar recibos marcados hasta importe indicado'
      Hint = 'Cobrar recibos marcados hasta importe indicado'
      ImageIndex = 141
      OnExecute = ACobrarMarcadosHastaImporteExecute
    end
    object ACobrarTodosHastaImporte: TAction
      Category = 'Procesos'
      Caption = 'Cobrar TODOS los recibos hasta importe indicado'
      Hint = 'Cobrar TODOS los recibos hasta importe indicado'
      ImageIndex = 141
      OnExecute = ACobrarTodosHastaImporteExecute
    end
    object ACobrarRecibosMarcados: TAction
      Category = 'Procesos'
      Caption = 'Cobrar Recibos Marcados'
      Hint = 'Cobrar los recibos Marcados'
      ImageIndex = 56
      OnExecute = ACobrarRecibosMarcadosExecute
    end
    object ADescobrarRecibo: TAction
      Category = 'Procesos'
      Caption = 'Anular Cobro Recibo'
      Hint = 'Anular Cobro'
      ImageIndex = 27
      OnExecute = ADescobrarRecibosExecute
    end
    object APrevisualizacion: TAction
      Tag = 9012
      Category = 'Listados'
      Caption = 'Previsualizar Listado Recibo Ingreso'
      ImageIndex = 14
      OnExecute = APrevisualizacionExecute
    end
    object AListadoLimites: TAction
      Tag = 9011
      Category = 'Listados'
      Caption = 'Listado Detallado'
      ImageIndex = 14
      OnExecute = AListadoLimitesExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAbrirReciboIngreso: TAction
      Category = 'Procesos'
      Caption = 'Abrir Recibo Ingreso'
      Enabled = False
      Hint = 'Abrir Recibo Ingreso'
      ImageIndex = 67
      Visible = False
      OnExecute = AAbrirReciboIngresoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfListadoRecibo: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Impresora Recibo Ingreso'
      ImageIndex = 77
      OnExecute = AConfListadoReciboExecute
    end
    object AConfListadoLimites: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Detallado'
      ImageIndex = 77
      OnExecute = AConfListadoLimitesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 336
    Top = 120
  end
end
