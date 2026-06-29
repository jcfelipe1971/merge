inherited FMTalones: TFMTalones
  Top = 236
  Width = 612
  Height = 453
  HelpContext = 273
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Talones'
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 602
    Height = 400
    Caption = 'PMain'
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 598
      ButtonWidth = 25
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      inherited NavMain: THYMNavigator
        DataSource = DMTalones.DSQMTalones
        Hints.Strings = ()
        EditaControl = DBEFProv_Acr
        InsertaControl = DBEFProv_Acr
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object PNLSerieParaSaldosKri: TLFPanel
        Left = 321
        Top = 0
        Width = 121
        Height = 22
        TabOrder = 2
        object LSerieParaSaldoKri: TLFLabel
          Left = 6
          Top = 5
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie Talones'
        end
        object CBSerieParaSaldo: TLFComboBox
          Left = 73
          Top = 1
          Width = 47
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'BC'
          Items.Strings = (
            'A'
            'BC'
            'IR'
            'SE'
            'GJ'
            'MAR'
            'ST')
        end
      end
      object PNLVerSaldos: TLFPanel
        Left = 442
        Top = 0
        Width = 96
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
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
      Width = 598
      Height = 370
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        object SBVerAsientos: TSpeedButton [0]
          Left = 208
          Top = 112
          Width = 65
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          Down = True
          OnDblClick = SBVerAsientosDblClick
        end
        inherited PEdit: TLFPanel
          Width = 590
          Height = 222
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'FECHA_LIBRAMIENTO')
            DataSource = DMTalones.DSQMTalones
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_TALONES'
            CampoNum = 'TALON'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TALON')
          end
          object LBLTalon: TLFLabel
            Left = 107
            Top = 32
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tal'#243'n'
          end
          object LBanco: TLFLabel
            Left = 103
            Top = 76
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LBLFecha: TLFLabel
            Left = 104
            Top = 98
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LImporte: TLFLabel
            Left = 460
            Top = 177
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LBLDescripcion: TLFLabel
            Left = 78
            Top = 54
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LLugar: TLFLabel
            Left = 261
            Top = 97
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar'
          end
          object SPBPermuta: TSpeedButton
            Left = 2
            Top = 5
            Width = 71
            Height = 23
            Caption = 'Permuta'
            Flat = True
            OnClick = SPBPermutaClick
          end
          object LBLPro_Acr: TLFLabel
            Left = 74
            Top = 6
            Width = 60
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Proveedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LTipo_asiento: TLFLabel
            Left = 325
            Top = 177
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Asiento'
          end
          object LSaldoAcreedor: TLFLabel
            Left = 291
            Top = 199
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo Acr.'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object LSaldoDeudor: TLFLabel
            Left = 141
            Top = 199
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo Deu.'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object LSaldo: TLFLabel
            Left = 458
            Top = 199
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo'
            Color = clBtnFace
            ParentColor = False
            Layout = tlCenter
          end
          object LContador: TLFLabel
            Left = 209
            Top = 176
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador'
          end
          object LComentario: TLFLabel
            Left = 81
            Top = 119
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object DBEFBanco: TLFDBEditFind2000
            Left = 139
            Top = 72
            Width = 50
            Height = 21
            DataField = 'BANCO'
            DataSource = DMTalones.DSQMTalones
            TabOrder = 6
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
            Left = 190
            Top = 72
            Width = 383
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
            ReadOnly = True
            TabOrder = 7
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 139
            Top = 94
            Width = 87
            Height = 21
            DataField = 'FECHA_LIBRAMIENTO'
            DataSource = DMTalones.DSQMTalones
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DBEImporte: TLFDbedit
            Left = 499
            Top = 173
            Width = 74
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'IMPORTE'
            DataSource = DMTalones.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
          end
          object DBETalon: TLFDbedit
            Left = 139
            Top = 28
            Width = 144
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TALON'
            DataSource = DMTalones.DSQMTalones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBCHKCerrada: TLFDBCheckBox
            Left = 27
            Top = 175
            Width = 108
            Height = 17
            Caption = '&Contabilizado'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKCerradaChange
            DataField = 'PAGADO'
            DataSource = DMTalones.DSxInfoActualizada
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDescripcion: TLFDbedit
            Left = 139
            Top = 50
            Width = 434
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMTalones.DSQMTalones
            TabOrder = 5
          end
          object DBELugar: TLFDbedit
            Left = 291
            Top = 94
            Width = 282
            Height = 21
            DataField = 'LUGAR_LIBRAMIENTO'
            DataSource = DMTalones.DSQMTalones
            TabOrder = 9
          end
          object EPro_Acre: TLFEdit
            Left = 194
            Top = 6
            Width = 379
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
            ReadOnly = True
            TabOrder = 1
          end
          object DBEFProv_Acr: TLFDBEditFind2000
            Left = 139
            Top = 6
            Width = 54
            Height = 21
            DataField = 'COD_CLI_PRO'
            DataSource = DMTalones.DSQMTalones
            TabOrder = 0
            OnChange = DBEFProv_AcrChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFTipo_asiento: TLFDBEditFind2000
            Left = 402
            Top = 173
            Width = 55
            Height = 21
            DataField = 'TIPO_ASIENTO_KRI'
            DataSource = DMTalones.DSQMTalones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
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
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEImporteKri: TLFDbedit
            Left = 429
            Top = 28
            Width = 144
            Height = 21
            AutoSize = False
            DataField = 'IMPORTE'
            DataSource = DMTalones.DSQMTalones
            TabOrder = 4
          end
          object DBETalonPapel: TLFDbedit
            Left = 284
            Top = 28
            Width = 144
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TALON_PAPEL'
            DataSource = DMTalones.DSQMTalones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEAsiento: TLFDbedit
            Left = 139
            Top = 173
            Width = 65
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'ASIENTO'
            DataSource = DMTalones.DSQMTalones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBEContador: TLFDbedit
            Left = 255
            Top = 173
            Width = 65
            Height = 21
            DataField = 'Z_CONTADOR'
            DataSource = DMTalones.DSQMTalones
            TabOrder = 13
          end
          object LFDBComentario: TLFDBMemo
            Left = 139
            Top = 116
            Width = 434
            Height = 56
            DataField = 'Z_NOTASTALON'
            DataSource = DMTalones.DSQMTalones
            TabOrder = 10
          end
          object DBESaldoDeudor: TLFDbedit
            Left = 198
            Top = 195
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO_DEUDOR'
            DataSource = DMTalones.DSQMTalones
            Enabled = False
            TabOrder = 16
          end
          object DBESaldoAcreedor: TLFDbedit
            Left = 344
            Top = 195
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO_ACREEDOR'
            DataSource = DMTalones.DSQMTalones
            Enabled = False
            TabOrder = 17
          end
          object DBESaldo: TLFDbedit
            Left = 489
            Top = 195
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMTalones.DSQMTalones
            Enabled = False
            TabOrder = 18
          end
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 222
          Width = 590
          Height = 120
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 590
            Height = 98
            Align = alClient
            DataSource = DMTalones.DSQMDetalle
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGFDetalleCellClick
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
            Campos.Strings = (
              'TIPO_RETENCION')
            CamposAMostrar.Strings = (
              'TIPO_RETENCION'
              '2'
              'POR_ITBIS'
              'POR_ISR')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'TALON'
              'LIQUIDO'
              'DOC_TIPO'
              'COD_CLI_PRO'
              'CTA_PAGO'
              'TIPO_EFECTO'
              'VENCIMIENTO'
              'PAGADO'
              'MONEDA'
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
              'TALON'
              'RETENCION')
            ColumnasChecked.Strings = (
              '1'
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              ''
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'ID')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'DOM_TIPO_RETENCION')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'DESCRIPCION')
            Posicion = tpCentrado
            OnBusqueda = DBGFDetalleBusqueda
            CamposCalcAOrdenar.Strings = (
              'LIQUIDO_MONEDA')
            CamposCalcReferencia.Strings = (
              'LIQUIDO')
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ID')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
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
                Width = 55
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
                Width = 41
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NUM_FACTURA_PROV'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NUM_FACTURA_ACR'
                ReadOnly = True
                Width = 65
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
                Width = 63
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
                Width = 95
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO_MONEDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
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
                Width = 65
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
                Width = 44
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
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TALON'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RETENCION'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_RETENCION'
                Width = 50
                Visible = True
              end>
          end
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 590
            Height = 22
            AutoSize = True
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 0
              Width = 176
              Height = 22
              DataSource = DMTalones.DSQMDetalle
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ConfirmDelete = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFDetalle
              InsertaControl = DBGFDetalle
              Exclusivo = False
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = False
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
              Hint = 'Mostrar todos los Recibos disponibles'
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
                'Filtrar los Recibos disponibles'
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
            object TButtCerrarTalon: TToolButton
              Left = 261
              Top = 0
              Hint = 'Contabilizar Tal'#243'n'
              ImageIndex = 68
              ParentShowHint = False
              ShowHint = True
              OnClick = TButtCerrarTalonClick
            end
            object TButtAbrirTalon: TToolButton
              Left = 284
              Top = 0
              Hint = 'Descontabilizar Tal'#243'n'
              ImageIndex = 67
              ParentShowHint = False
              ShowHint = True
              OnClick = TButtAbrirTalonClick
            end
            object ToolButton3: TToolButton
              Left = 307
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBModificaRet: TToolButton
              Left = 315
              Top = 0
              Hint = 'Modificaci'#243'n Manual de la Retenci'#243'n'
              Caption = 'Modifica Retenci'#243'n'
              ImageIndex = 3
              OnClick = TBModificaRetClick
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 590
          Height = 342
          DataSource = DMTalones.DSQMTalones
          ReadOnly = True
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'CERRADO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'BANCO'
            'COD_CLI_PRO'
            'DESCRIPCION'
            'FECHA_LIBRAMIENTO'
            'IMPORTE'
            'PAGADO'
            'TALON')
          Columns = <
            item
              Expanded = False
              FieldName = 'TALON'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 41
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
              FieldName = 'FECHA_LIBRAMIENTO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 272
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 42
              Visible = True
            end>
        end
      end
      object TSGeneracionAutomatica: TTabSheet
        Caption = 'Generacion Automatica'
        ImageIndex = 2
        object PNLGeneracionAutomatica: TLFPanel
          Left = 0
          Top = 76
          Width = 590
          Height = 266
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGTalones: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 590
            Height = 186
            Align = alClient
            DataSource = DMTalones.DSxTalonesPendientes
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
            CamposAOrdernar.Strings = (
              'TALON'
              'COD_CLI_PRO'
              'TIPO_TERCERO'
              'IMPORTE'
              'BANCO')
            ColumnasCheckBoxes.Strings = (
              'MARCA_CONT')
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
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TALON'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COD_CLI_PRO'
                ReadOnly = True
                Width = 57
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO_TERCERO'
                ReadOnly = True
                Width = 36
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESCRIPCION'
                ReadOnly = True
                Width = 288
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'IMPORTE'
                ReadOnly = True
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARCA_CONT'
                Width = 35
                Visible = True
              end>
          end
          object DBGIncidencias: TNsDBGrid
            Left = 0
            Top = 186
            Width = 590
            Height = 80
            Align = alBottom
            Color = clInfoBk
            DataSource = DMTalones.DSxIncidencias
            ReadOnly = True
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
            Columns = <
              item
                Expanded = False
                FieldName = 'INCIDENCIA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_INCIDENCIA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 109
                Visible = True
              end>
          end
        end
        object PNLCaberceraAutomatico: TLFPanel
          Left = 0
          Top = 0
          Width = 590
          Height = 76
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LFechaDesde: TLFLabel
            Left = 5
            Top = 33
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LFechaHasta: TLFLabel
            Left = 144
            Top = 33
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LBancoTalon: TLFLabel
            Left = 278
            Top = 33
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LSerieTalon: TLFLabel
            Left = 503
            Top = 33
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
          object LGenAutoLugar: TLFLabel
            Left = 9
            Top = 55
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TBGeneracionAutomatica: TLFToolBar
            Left = 0
            Top = 0
            Width = 590
            Height = 26
            ButtonHeight = 23
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavGeneracionAutomatica: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 23
              DataSource = DMTalones.DSxTalonesPendientes
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
            object ToolButton1: TToolButton
              Left = 240
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object TButtGeneraTalones: TToolButton
              Left = 248
              Top = 2
              Action = AGeneraTalones
            end
            object TButtBorraTalonesMarcados: TToolButton
              Left = 271
              Top = 2
              Action = ABorraTalonesMarcados
            end
            object ToolButton4: TToolButton
              Left = 294
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
          end
          object DEFechaDesdeTalon: TLFDateEdit
            Left = 45
            Top = 30
            Width = 92
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
            Text = '01/01/2009'
          end
          object DEFechaHastaTalon: TLFDateEdit
            Left = 180
            Top = 30
            Width = 92
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
            Text = '01/01/2009'
          end
          object EFBancoTalon: TLFEditFind2000
            Left = 317
            Top = 30
            Width = 41
            Height = 21
            TabOrder = 3
            OnChange = EFBancoTalonChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloBancoTalon: TLFEdit
            Left = 359
            Top = 30
            Width = 138
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object EFSerieTalon: TLFEditFind2000
            Left = 537
            Top = 30
            Width = 41
            Height = 21
            TabOrder = 5
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
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ELugar: TLFEdit
            Left = 45
            Top = 52
            Width = 533
            Height = 21
            TabOrder = 6
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 400
    Width = 602
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 306
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 334
    Top = 28
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 404
    Top = 58
    object AImprimeTalones: TAction
      Category = 'Listados'
      Caption = 'Impresi'#243'n de Talones'
      Hint = 'Impresi'#243'n de Talones'
      ImageIndex = 14
      OnExecute = AImprimeTalonesExecute
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
      Caption = 'Imprimir Carta Pago'
      Hint = 'Imprimir Carta Pago'
      ImageIndex = 14
      OnExecute = AImprimirCartaPagoExecute
    end
    object AVerCartaPagoNoContabilizado: TAction
      Category = 'Listados'
      Caption = 'Ver Carta de Pago no Contabilizadas'
      Hint = 'Ver Carta Pago no contabilizada'
      ImageIndex = 14
      OnExecute = AVerCartaPagoNoContabilizadoExecute
    end
    object AVerCartaPagoNoContabilizadoPorSerie: TAction
      Category = 'Listados'
      Caption = 'Ver Carta de Pago No Contabilizado por Serie'
      ImageIndex = 14
      OnExecute = AVerCartaPagoNoContabilizadoPorSerieExecute
    end
    object ACierraTodoKri: TAction
      Category = 'Procesos'
      Caption = 'Cierra Todo'
      Hint = 'Cierra todos los Talones'
      ImageIndex = 68
      OnExecute = ACierraTodoKriExecute
    end
    object AImprimirCartaPagoNoContabilizado: TAction
      Category = 'Listados'
      Caption = 'Imprimir Carta de Pago no Contabilizadas'
      Hint = 'Imprimir Carta de Pago no contabilizadas'
      ImageIndex = 14
      OnExecute = AImprimirCartaPagoNoContabilizadoExecute
    end
    object AVerListadoTalones: TAction
      Category = 'Listados'
      Caption = 'Ver Listado Talones'
      ImageIndex = 14
      OnExecute = AVerListadoTalonesExecute
    end
    object AVerListadoTalonesNoContabilizados: TAction
      Category = 'Listados'
      Caption = 'Ver Listado Talones no Contabilizados'
      ImageIndex = 14
      OnExecute = AVerListadoTalonesNoContabilizadosExecute
    end
    object AVerListadoTalonesNoContabilizadosPorSerie: TAction
      Category = 'Listados'
      Caption = 'Listado Talones no Contabilizados por Serie'
      ImageIndex = 14
      OnExecute = AVerListadoTalonesNoContabilizadosPorSerieExecute
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
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n r'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n r'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfigurarCartaDePago: TAction
      Category = 'Listados;"Configuraci'#243'n r'#225'pida de Listados"'
      Caption = 'Configurar Carta de Pago'
      ImageIndex = 77
      OnExecute = AConfigurarCartaDePagoExecute
    end
    object AConfigurarListadoTalones: TAction
      Category = 'Listados;"Configuraci'#243'n r'#225'pida de Listados"'
      Caption = 'Configurar Listado de Talones'
      ImageIndex = 77
      OnExecute = AConfigurarListadoTalonesExecute
    end
    object ADesgloseDeSaldoKri: TAction
      Category = 'Procesos'
      Caption = 'Desglose de SaldoKri'
      Hint = 
        'Muestra las cuentas y saldos que componene el saldo del cliente/' +
        'proveedor/acreedor'
      ImageIndex = 78
      OnExecute = ADesgloseDeSaldoKriExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'GeneracionAutomatica'
      Caption = 'Generaci'#243'n Autom'#225'tica'
      ImageIndex = 94
    end
    object AGeneraTalones: TAction
      Category = 'GeneracionAutomatica'
      Caption = 'Generar Talones'
      Hint = 'Genera talones a partir de recibos de proveedor y acreedor'
      ImageIndex = 118
      OnExecute = AGeneraTalonesExecute
    end
    object ABorraTalonesMarcados: TAction
      Category = 'GeneracionAutomatica'
      Caption = 'Borrar Talones NO Marcados'
      Hint = 'Borra los talones NO marcados'
      ImageIndex = 117
      OnExecute = ABorraTalonesMarcadosExecute
    end
    object AAsientoTalon: TAction
      Category = 'Procesos'
      Caption = 'Ver asiento generado'
      Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
      ShortCut = 49235
      OnExecute = AAsientoTalonExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Exportaciones'
      Caption = 'Exportaciones'
      ImageIndex = 36
    end
    object ANormaSabadell: TAction
      Category = 'Exportaciones'
      Caption = 'Norma Sabadell'
      ImageIndex = 36
      OnExecute = ANormaSabadellExecute
    end
    object ARespuestaANormaSabadell: TAction
      Category = 'Exportaciones'
      Caption = 'Leer Respuesta Norma Sabadell'
      Hint = 'Lee la respuesta Norma Sabadell y asigna el numero de talon.'
      ImageIndex = 36
      OnExecute = ARespuestaANormaSabadellExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 462
    Top = 56
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 406
    Top = 29
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 435
    Top = 29
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
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
end
