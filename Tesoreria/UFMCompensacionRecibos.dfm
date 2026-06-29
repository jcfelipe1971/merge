inherited FMCompensacionRecibos: TFMCompensacionRecibos
  Left = 395
  Top = 222
  Width = 1090
  Height = 601
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Compensacion Automatica de Recibos'
  Constraints.MinWidth = 800
  Position = poDefault
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1080
    Height = 548
    inherited TBMain: TLFToolBar
      Width = 1076
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      object ToolButton3: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLFecha: TLFPanel
        Left = 347
        Top = 0
        Width = 172
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFecha: TLFLabel
          Left = 13
          Top = 4
          Width = 30
          Height = 13
          Caption = 'Fecha'
        end
        object DEFecha: TLFDateEdit
          Left = 48
          Top = 0
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DEFechaChange
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1076
      Height = 518
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1068
          Height = 490
          Enabled = True
          object Splitter1: TSplitter
            Left = 385
            Top = 26
            Width = 8
            Height = 464
            Cursor = crHSplit
          end
          object PNLRecibosProveedor: TLFPanel
            Left = 0
            Top = 26
            Width = 385
            Height = 464
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object LRecibosProveedor: TLFLabel
              Left = 0
              Top = 0
              Width = 385
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Recibos de Proveedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object TBRecibosProveedor: TLFToolBar
              Left = 0
              Top = 13
              Width = 385
              Height = 27
              EdgeInner = esNone
              EdgeOuter = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavRecibosProveedor: THYMNavigator
                Left = 0
                Top = 2
                Width = 232
                Height = 22
                DataSource = DMCompensacionRecibos.DSxRecibosProveedor
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
            end
            object DBGRecibosProveedor: TDBGridFind2000
              Left = 0
              Top = 40
              Width = 385
              Height = 397
              Align = alClient
              BorderStyle = bsNone
              DataSource = DMCompensacionRecibos.DSxRecibosProveedor
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGRecibosCellClick
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
              Transaction = DMMain.TLocal
              BuscarNums = False
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              ColumnasCheckBoxes.Strings = (
                'ENTRADA')
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
                  FieldName = 'ENTRADA'
                  Width = 25
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'REGISTRO'
                  ReadOnly = True
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA'
                  ReadOnly = True
                  Width = 31
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VENCIMIENTO'
                  ReadOnly = True
                  Width = 72
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LIQUIDO'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_NUMERO'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_SERIE'
                  ReadOnly = True
                  Width = 53
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_FECHA'
                  ReadOnly = True
                  Width = 72
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_TIPO'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LIQUIDO_CANAL'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'MONEDA'
                  ReadOnly = True
                  Width = 65
                  Visible = True
                end>
            end
            object PNLSeleccionProveedorAcreedor: TLFPanel
              Left = 0
              Top = 437
              Width = 385
              Height = 27
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object LProveedor: TLFLabel
                Left = 19
                Top = 7
                Width = 49
                Height = 13
                Hint = 'Presione para cambiar'
                Alignment = taRightJustify
                Caption = 'Proveedor'
                Color = clBtnFace
                ParentColor = False
                ParentShowHint = False
                ShowHint = True
                OnClick = LProveedorClick
              end
              object EFProveedor: TLFEditFind2000
                Left = 72
                Top = 3
                Width = 73
                Height = 21
                TabOrder = 0
                OnChange = EFProveedorChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
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
                OnBusqueda = EFProveedorBusqueda
                OrdenadoPor.Strings = (
                  'PROVEEDOR')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EProveedor: TLFEdit
                Left = 146
                Top = 3
                Width = 231
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 1
              end
            end
          end
          object PNLRecibosCliente: TLFPanel
            Left = 393
            Top = 26
            Width = 675
            Height = 464
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LRecibosCliente: TLFLabel
              Left = 0
              Top = 0
              Width = 675
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Recibos de Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object TBRecibosCliente: TLFToolBar
              Left = 0
              Top = 13
              Width = 675
              Height = 27
              EdgeInner = esNone
              EdgeOuter = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavRecibosCliente: THYMNavigator
                Left = 0
                Top = 2
                Width = 232
                Height = 22
                DataSource = DMCompensacionRecibos.DSxRecibosCliente
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
            end
            object DBGRecibosCliente: TDBGridFind2000
              Left = 0
              Top = 40
              Width = 675
              Height = 397
              Align = alClient
              BorderStyle = bsNone
              DataSource = DMCompensacionRecibos.DSxRecibosCliente
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGRecibosCellClick
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
              Transaction = DMMain.TLocal
              BuscarNums = False
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              ColumnasCheckBoxes.Strings = (
                'ENTRADA')
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
                  FieldName = 'ENTRADA'
                  Width = 25
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'REGISTRO'
                  ReadOnly = True
                  Width = 50
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA'
                  ReadOnly = True
                  Width = 31
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VENCIMIENTO'
                  ReadOnly = True
                  Width = 72
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LIQUIDO'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_NUMERO'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_SERIE'
                  ReadOnly = True
                  Width = 53
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_FECHA'
                  ReadOnly = True
                  Width = 72
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOC_TIPO'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LIQUIDO_CANAL'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'MONEDA'
                  ReadOnly = True
                  Width = 65
                  Visible = True
                end>
            end
            object PNLSeleccionCliente: TLFPanel
              Left = 0
              Top = 437
              Width = 675
              Height = 27
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object LCliente: TLFLabel
                Left = 36
                Top = 7
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente'
              end
              object EFCliente: TLFEditFind2000
                Left = 72
                Top = 3
                Width = 73
                Height = 21
                TabOrder = 0
                OnChange = EFClienteChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'CLIENTE'
                CampoStr = 'TITULO'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'VER_CLIENTES'
                Tabla_asociada.DesplegarBusqueda = False
                OnBusqueda = EFClienteBusqueda
                OrdenadoPor.Strings = (
                  'CLIENTE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object ECliente: TLFEdit
                Left = 146
                Top = 3
                Width = 231
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 1
              end
            end
          end
          object TBTercero: TLFToolBar
            Left = 0
            Top = 0
            Width = 1068
            Height = 26
            AutoSize = True
            ButtonHeight = 24
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 2
            Separators = True
            object PNLSaldo: TLFPanel
              Left = 0
              Top = 2
              Width = 354
              Height = 24
              BevelOuter = bvNone
              TabOrder = 1
              object LSaldo: TLFLabel
                Left = 249
                Top = 3
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'Saldo'
              end
              object LPagos: TLFLabel
                Left = 7
                Top = 3
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pagos'
              end
              object LCobros: TLFLabel
                Left = 125
                Top = 3
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cobros'
              end
              object DBEPagos: TLFDbedit
                Left = 40
                Top = 0
                Width = 72
                Height = 21
                Color = clInfoBk
                DataField = 'PAGOS'
                DataSource = DMCompensacionRecibos.DSxTotales
                Enabled = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBECobros: TLFDbedit
                Left = 161
                Top = 0
                Width = 72
                Height = 21
                Color = clInfoBk
                DataField = 'COBROS'
                DataSource = DMCompensacionRecibos.DSxTotales
                Enabled = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBESaldo: TLFDbedit
                Left = 280
                Top = 0
                Width = 72
                Height = 21
                Color = clInfoBk
                DataField = 'SALDO'
                DataSource = DMCompensacionRecibos.DSxTotales
                Enabled = False
                ReadOnly = True
                TabOrder = 2
              end
            end
            object PNLTercero: TLFPanel
              Left = 354
              Top = 2
              Width = 361
              Height = 24
              BevelOuter = bvNone
              TabOrder = 0
              object LTercero: TLFLabel
                Left = 12
                Top = 5
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tercero'
              end
              object EFTercero: TLFEditFind2000
                Left = 56
                Top = 1
                Width = 73
                Height = 21
                TabOrder = 0
                OnChange = EFTerceroChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = True
                BuscarChars = True
                AutoCambiarFoco = False
                Campos_Desplegar.Strings = (
                  'NIF')
                CampoNum = 'TERCERO'
                CampoStr = 'NOMBRE_R_SOCIAL'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'VER_TERCEROS'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'TERCERO')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
              object ETercero: TLFEdit
                Left = 130
                Top = 1
                Width = 229
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 1
              end
            end
            object PNLSerieAgrupacion: TLFPanel
              Left = 715
              Top = 2
              Width = 303
              Height = 24
              BevelOuter = bvNone
              TabOrder = 2
              object LSerieAgrupacion: TLFLabel
                Left = 22
                Top = 4
                Width = 61
                Height = 13
                Hint = 'Serie del recibo generado'
                Alignment = taRightJustify
                Caption = 'Serie Recibo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Layout = tlCenter
              end
              object EFSerieAgrupacion: TLFEditFind2000
                Left = 87
                Top = 0
                Width = 43
                Height = 21
                TabOrder = 0
                OnChange = EFSerieAgrupacionChange
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
                SalirSiNoExiste = True
                Tabla_a_buscar = 'VER_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object ESerieAgrupacion: TLFEdit
                Left = 131
                Top = 0
                Width = 171
                Height = 21
                Color = clInfoBk
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
            object TButtRefrescar: TToolButton
              Left = 1018
              Top = 2
              Action = ARefrescar
            end
            object TButtAgrupar: TToolButton
              Left = 1041
              Top = 2
              Action = AAgrupar
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1068
          Height = 490
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 548
    Width = 1080
  end
  inherited CEMain: TControlEdit
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 28
  end
  inherited ALMain: TLFActionList
    Top = 24
    object AAgrupar: TAction
      Caption = 'Agrupar'
      Hint = 'Agrupa los recibos seleccionados'
      ImageIndex = 4
      OnExecute = AAgruparExecute
    end
    object ARefrescar: TAction
      Caption = 'Refrescar'
      Hint = 'Refresca los datos del tercero'
      ImageIndex = 26
      OnExecute = ARefrescarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Top = 24
  end
end
