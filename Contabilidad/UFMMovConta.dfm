inherited FMMovConta: TFMMovConta
  Left = 466
  Top = 225
  Width = 768
  Height = 474
  HelpContext = 240
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Movimientos Contables'
  FormStyle = fsNormal
  PopupMenu = CEDetallePMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 421
    inherited TBMain: TLFToolBar
      Width = 754
      inherited NavMain: THYMNavigator
        Width = 110
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
      object TButtRefresca: TToolButton
        Left = 195
        Top = 0
        Action = ARefresca
      end
      object TSep1: TToolButton
        Left = 218
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtOrdenarSigno: TToolButton
        Left = 226
        Top = 0
        Action = AOrdenarSigno
      end
      object TButtOrdenarLinea: TToolButton
        Left = 249
        Top = 0
        Action = AOrdenarLinea
      end
      object ToolButton2: TToolButton
        Left = 272
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtAnalitica: TToolButton
        Left = 280
        Top = 0
        Action = AAnalitica
      end
      object TBNotas: TToolButton
        Left = 303
        Top = 0
        Action = ANotas
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 754
      Height = 391
      ParentFont = False
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 746
          Height = 363
          Enabled = True
          object PEdAsientos: TLFPanel
            Left = 0
            Top = 0
            Width = 746
            Height = 59
            Align = alTop
            BevelOuter = bvNone
            BorderWidth = 2
            Enabled = False
            TabOrder = 0
            object PNLPROAsientos: TLFPanel
              Left = 105
              Top = 27
              Width = 639
              Height = 30
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LTipoAsientoKri: TLFLabel
                Left = 454
                Top = 5
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Diario'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBETitTipo: TLFDbedit
                Left = 1
                Top = 1
                Width = 205
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMMovConta.DSxTipos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEDebe: TLFDbedit
                Left = 207
                Top = 1
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'DEBE'
                DataSource = DMMovConta.DSQMAsientos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEHaber: TLFDbedit
                Left = 329
                Top = 1
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'HABER'
                DataSource = DMMovConta.DSQMAsientos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBETipoAsientoKri: TLFDbedit
                Left = 508
                Top = 1
                Width = 57
                Height = 21
                Color = clInfoBk
                DataField = 'TIPO_ASIENTO_KRI'
                DataSource = DMMovConta.DSQMAsientos
                TabOrder = 3
              end
            end
            object PNLPRwAsientos: TLFPanel
              Left = 2
              Top = 2
              Width = 742
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 1
              object LBLRIC: TLFLabel
                Left = 112
                Top = 8
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'R.I.C.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LBAsiento: TLFLabel
                Left = 6
                Top = 8
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Asiento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBERic: TLFDbedit
                Left = 143
                Top = 4
                Width = 58
                Height = 21
                Color = clInfoBk
                DataField = 'RIC'
                DataSource = DMMovConta.DSQMAsientos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBETitulo: TLFDbedit
                Left = 271
                Top = 4
                Width = 397
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMMovConta.DSQMAsientos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBCHKFirme: TLFDBCheckBox
                Left = 675
                Top = 7
                Width = 51
                Height = 17
                Caption = 'Firme'
                ClicksDisabled = False
                ColorCheck = 57088
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'FIRME'
                DataSource = DMMovConta.DSQMAsientos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEFecha: TLFDbedit
                Left = 202
                Top = 4
                Width = 68
                Height = 21
                Color = clInfoBk
                DataField = 'FECHA'
                DataSource = DMMovConta.DSQMAsientos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBEAsiento: TLFDbedit
                Left = 45
                Top = 4
                Width = 58
                Height = 21
                Color = clInfoBk
                DataField = 'ASIENTO'
                DataSource = DMMovConta.DSQMAsientos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
            end
            object PNLPRwATipo: TLFPanel
              Left = 2
              Top = 27
              Width = 103
              Height = 30
              Align = alLeft
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 2
              object LBLTipo: TLFLabel
                Left = 20
                Top = 5
                Width = 21
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Tipo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBETipo: TLFDbedit
                Left = 45
                Top = 1
                Width = 58
                Height = 21
                Color = clInfoBk
                DataField = 'TIPO'
                DataSource = DMMovConta.DSQMAsientos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
            end
          end
          object PNLDetalle: TLFPanel
            Left = 0
            Top = 59
            Width = 746
            Height = 304
            Align = alClient
            BevelOuter = bvNone
            Caption = 'PNLDetalle'
            TabOrder = 1
            object TBDetalle: TLFToolBar
              Left = 0
              Top = 0
              Width = 746
              Height = 24
              ButtonHeight = 23
              EdgeBorders = []
              Flat = True
              TabOrder = 0
              Separators = True
              object NavApuntes: THYMNavigator
                Left = 0
                Top = 0
                Width = 110
                Height = 23
                DataSource = DMMovConta.DSQMApuntes
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
                Flat = True
                ParentShowHint = False
                PopupMenu = CEDetallePMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                Exclusivo = True
                ControlEdit = CEDetalle
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton1: TToolButton
                Left = 110
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object PNLApuntes: TLFPanel
                Left = 118
                Top = 0
                Width = 436
                Height = 23
                Align = alRight
                AutoSize = True
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 1
                object DBETitCta: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 436
                  Height = 21
                  Hint = 'T'#237'tulo de la cuenta visible'
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMMovConta.DSxCuentas
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
            object DBGApuntes: TDBGridFind2000
              Left = 0
              Top = 24
              Width = 746
              Height = 280
              Align = alClient
              Color = clInfoBk
              DataSource = DMMovConta.DSQMApuntes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGApuntesCellClick
              OnDrawColumnCell = DBGApuntesDrawColumnCell
              OnDblClick = DBGApuntesDblClick
              IniStorage = FSMain
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
              CampoAOrdenarColor = clWindow
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              ColumnasCheckBoxes.Strings = (
                'PUNTEO')
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
                  Expanded = False
                  FieldName = 'Cargo'
                  Width = 92
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Abono'
                  Width = 91
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TEXTO'
                  Width = 277
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
                  Title.Alignment = taRightJustify
                  Width = 92
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOC_SERIE'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOC_NUMERO'
                  Title.Alignment = taRightJustify
                  Width = 63
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOC_FECHA'
                  Width = 61
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PROYECTO'
                  Width = 58
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_PROYECTO'
                  Width = 182
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PUNTEO'
                  Width = 38
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_PUNTEO'
                  Visible = True
                end>
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 746
          Height = 363
          DataSource = DMMovConta.DSQMAsientos
          OnKeyUp = DBGMainKeyUp
          OnMouseUp = DBGMainMouseUp
          CamposAOrdenar.Strings = (
            'ASIENTO'
            'DEBE'
            'FECHA'
            'FIRME'
            'HABER'
            'RIC'
            'SALDO'
            'TIPO'
            'TIPO_ASIENTO_KRI'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ASIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEBE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HABER'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 339
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 421
    Width = 758
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 396
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 428
    Top = 8
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 336
    Top = 190
    object ALstLibroDiario: TAction
      Category = 'Listados'
      Caption = 'Listado Libro Diario'
      Hint = 'Listado Libro Diario'
      ImageIndex = 14
      OnExecute = ALstLibroDiarioExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ARefresca: TAction
      Category = 'Procesos'
      Caption = 'Refresca Diario'
      Hint = 'Refresca Diario'
      ImageIndex = 26
      OnExecute = ARefrescaExecute
    end
    object ATraspasaBorrador: TAction
      Category = 'Procesos'
      Caption = 'Traspasa a Borrador para que pueda modificarse'
      Hint = 'Traspasa a Borrador para que pueda modificarse'
      ImageIndex = 36
      OnExecute = ATraspasaBorradorExecute
    end
    object AEliminaAsiento: TAction
      Category = 'Procesos'
      Caption = 'Elimina este Asiento Contable'
      Hint = 'Elimina este Asiento Contable'
      ImageIndex = 27
      OnExecute = AEliminaAsientoExecute
    end
    object ASep: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AOrdenarSigno: TAction
      Category = 'Procesos'
      Caption = 'Ordenar por signo (debe, haber)'
      Hint = 'Ordenar por signo (debe, haber)'
      ImageIndex = 122
      OnExecute = AOrdenarSignoExecute
    end
    object AOrdenarLinea: TAction
      Category = 'Procesos'
      Caption = 'Ordenar los apuntes por l'#237'nea'
      Hint = 'Ordenar los apuntes por l'#237'nea'
      ImageIndex = 122
      OnExecute = AOrdenarLineaExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AInfoExtendido: TAction
      Category = 'Otros'
      Caption = 'Informaci'#243'n Extendida'
      Hint = 'Informaci'#243'n Extendida'
      ImageIndex = 1
      ShortCut = 49225
      OnExecute = AInfoExtendidoExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object ABuscaPorImportes: TAction
      Category = 'Procesos'
      Caption = 'Buscar Asientos por Importe'
      Hint = 'Buscar Asientos por Importe'
      ImageIndex = 83
      OnExecute = ABuscaPorImportesExecute
    end
    object AAnalitica: TAction
      Category = 'Otros'
      Caption = 'Apunte anal'#237'tico'
      Hint = 'Apunte anal'#237'tico'
      ImageIndex = 21
      OnExecute = AAnaliticaExecute
    end
    object AModificarCuenta: TAction
      Category = 'Otros'
      Caption = 'Modificar Cuenta'
      Hint = 'Modificar Cuenta de Perdida o Ganancia'
      ImageIndex = 18
      ShortCut = 16461
      OnExecute = AModificarCuentaExecute
    end
    object ANotas: TAction
      Caption = 'Notas del Asiento'
      Hint = 'Notas del Asiento'
      ImageIndex = 18
      OnExecute = ANotasExecute
    end
    object AAdjuntosAsiento: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Asiento'
      Hint = 'Visualiza los adjuntos del Asiento'
      ImageIndex = 59
      OnExecute = AAdjuntosAsientoExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 376
    Top = 190
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 516
    Top = 10
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 550
    Top = 10
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
      Visible = False
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
