inherited FMSincronizacionEginer: TFMSincronizacionEginer
  Left = 630
  Top = 267
  Width = 549
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion Eginer'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 539
    inherited TBMain: TLFToolBar
      Width = 535
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep4: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBSincronizarTodo: TToolButton
        Left = 33
        Top = 0
        Action = ASincronizarTodo
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 535
      Height = 302
      ActivePage = TSUsuarios
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSUsuarios: TTabSheet
        Caption = 'Usuarios'
        OnShow = TSUsuariosShow
        object PNLUsuarios: TLFPanel
          Left = 0
          Top = 0
          Width = 527
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBUsuarios: TLFToolBar
            Left = 0
            Top = 0
            Width = 527
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavUsuarios: THYMNavigator
              Left = 0
              Top = 0
              Width = 160
              Height = 25
              DataSource = DMSincronizacionEginer.DSxUsuarios
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
            object TBSep1: TToolButton
              Left = 160
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBSincronizarUsuarios: TToolButton
              Left = 168
              Top = 0
              Action = ASincronizarUsuarios
            end
            object PNLUsuariosUltimaSincronizacion: TLFPanel
              Left = 191
              Top = 0
              Width = 268
              Height = 25
              BevelOuter = bvNone
              TabOrder = 1
              object LUsuariosUltimaSincronizacion: TLFLabel
                Left = 14
                Top = 5
                Width = 93
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ultima Sincronizado'
              end
              object DEUsuariosUltimaSincronizacion: TLFDateEdit
                Left = 110
                Top = 1
                Width = 89
                Height = 21
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 0
                Text = '01/01/2000'
                OnChange = DEUsuariosUltimaSincronizacionChange
              end
              object DTPUsuariosUltimaSincronizacion: TDateTimePicker
                Left = 201
                Top = 1
                Width = 65
                Height = 21
                CalAlignment = dtaLeft
                Date = 44126
                Time = 44126
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 1
                OnChange = DEUsuariosUltimaSincronizacionChange
              end
            end
          end
          object DBGFUsuarios: TDBGridFind2000
            Left = 0
            Top = 25
            Width = 527
            Height = 143
            Align = alTop
            DataSource = DMSincronizacionEginer.DSxUsuarios
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
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'ACTIVO')
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
                Expanded = False
                FieldName = 'USUARIOID'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATE_UPD'
                Width = 90
                Visible = True
              end>
          end
          object MUsuariosLogSincronizacion: TLFMemo
            Left = 0
            Top = 168
            Width = 527
            Height = 106
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
      end
      object TSArticulos: TTabSheet
        Caption = 'Articulos'
        ImageIndex = 1
        object PNLArticulos: TLFPanel
          Left = 0
          Top = 0
          Width = 527
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBArticulos: TLFToolBar
            Left = 0
            Top = 0
            Width = 527
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object TBSincronizarArticulos: TToolButton
              Left = 0
              Top = 0
              Action = ASincronizaArticulos
            end
            object PNLArticulos2: TLFPanel
              Left = 23
              Top = 0
              Width = 268
              Height = 25
              BevelOuter = bvNone
              TabOrder = 0
              object LArticulosUltimaSincronizacion: TLFLabel
                Left = 14
                Top = 5
                Width = 93
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ultima Sincronizado'
              end
              object DEArticulosUltimaSincronizacion: TLFDateEdit
                Left = 110
                Top = 1
                Width = 89
                Height = 21
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 0
                Text = '01/01/2000'
                OnChange = DEUsuariosUltimaSincronizacionChange
              end
              object DTPArticulosUltimaSincronizacion: TDateTimePicker
                Left = 201
                Top = 1
                Width = 65
                Height = 21
                CalAlignment = dtaLeft
                Date = 44126
                Time = 44126
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 1
                OnChange = DEUsuariosUltimaSincronizacionChange
              end
            end
          end
          object MArticulosLogSincronizacion: TLFMemo
            Left = 0
            Top = 25
            Width = 527
            Height = 249
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
      object TSPedidos: TTabSheet
        Caption = 'Pedidos'
        ImageIndex = 2
        object PNLPedidos: TLFPanel
          Left = 0
          Top = 0
          Width = 527
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBPedidos: TLFToolBar
            Left = 0
            Top = 0
            Width = 527
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object TBSincronizaPedidos: TToolButton
              Left = 0
              Top = 0
              Action = ASincronizarPedidos
            end
            object TBSep2: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object PNLPedidosUltimaSincronizacion: TLFPanel
              Left = 31
              Top = 0
              Width = 180
              Height = 25
              BevelOuter = bvNone
              TabOrder = 0
              object LPedidosUltimaSincronizacion: TLFLabel
                Left = 3
                Top = 5
                Width = 105
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ult. Ped. Sincronizado'
              end
              object EPedidoUltimasincronizacion: TLFEdit
                Left = 111
                Top = 1
                Width = 65
                Height = 21
                TabOrder = 0
                Text = '0'
              end
            end
            object PNLPedidosFechaUltimaSincronizacion: TLFPanel
              Left = 211
              Top = 0
              Width = 268
              Height = 25
              BevelOuter = bvNone
              TabOrder = 1
              object LPedidosFechaUltimaSincronizacion: TLFLabel
                Left = 14
                Top = 5
                Width = 93
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ultima Sincronizado'
              end
              object DEPedidosFechaUltimaSincronizacion: TLFDateEdit
                Left = 110
                Top = 1
                Width = 89
                Height = 21
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 0
                Text = '01/01/2000'
              end
              object DTPPedidosFechaUltimaSincronizacion: TDateTimePicker
                Left = 201
                Top = 1
                Width = 65
                Height = 21
                CalAlignment = dtaLeft
                Date = 44126
                Time = 44126
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 1
              end
            end
          end
          object MPedidosLogSincronizacion: TLFMemo
            Left = 0
            Top = 25
            Width = 527
            Height = 249
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
      object TSStock: TTabSheet
        Caption = 'Stock'
        ImageIndex = 4
        object PNLStocks: TLFPanel
          Left = 0
          Top = 0
          Width = 527
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBArticulosStock: TLFToolBar
            Left = 0
            Top = 0
            Width = 527
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object TBsincronizaStock: TToolButton
              Left = 0
              Top = 0
              Action = ASincronizarStock
            end
            object PNLFechaSincStock: TLFPanel
              Left = 23
              Top = 0
              Width = 268
              Height = 25
              BevelOuter = bvNone
              TabOrder = 0
              object LUltSincronizacionStock: TLFLabel
                Left = 14
                Top = 5
                Width = 93
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ultima Sincronizado'
              end
              object DEStockUltimaSincronizacion: TLFDateEdit
                Left = 110
                Top = 1
                Width = 89
                Height = 21
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 0
                Text = '01/01/2000'
                OnChange = DEUsuariosUltimaSincronizacionChange
              end
              object DTPStockUltimaSincronizacion: TDateTimePicker
                Left = 201
                Top = 1
                Width = 65
                Height = 21
                CalAlignment = dtaLeft
                Date = 44126
                Time = 44126
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 1
                OnChange = DEUsuariosUltimaSincronizacionChange
              end
            end
          end
          object MStockLogSincronizacion: TLFMemo
            Left = 0
            Top = 25
            Width = 527
            Height = 249
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
      object TSConfiguracion: TTabSheet
        Caption = 'Configuracion'
        ImageIndex = 3
        object LURL: TLFLabel
          Left = 37
          Top = 27
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'URL'
        end
        object EURL: TLFEdit
          Left = 64
          Top = 24
          Width = 401
          Height = 21
          TabOrder = 0
          Text = 'https://speedlock.eginer.es/resources/rest/'
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 539
  end
  inherited CEMain: TControlEdit
    Left = 272
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 308
    Top = 4
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
    Left = 344
    Top = 0
    object ASincronizarTodo: TAction
      Category = 'Sincronizacion'
      Caption = 'Sincronizar Todo'
      Hint = 'Sincronizar Todo'
      ImageIndex = 98
      OnExecute = ASincronizarTodoExecute
    end
    object ASincronizarUsuarios: TAction
      Category = 'Sincronizacion'
      Caption = 'Sincronizar Usuarios'
      Hint = 'Sincronizar Usuarios'
      ImageIndex = 98
      OnExecute = ASincronizarUsuariosExecute
    end
    object ASincronizaArticulos: TAction
      Category = 'Sincronizacion'
      Caption = 'Sincroniza Articulos'
      Hint = 'Sincroniza Articulos'
      ImageIndex = 98
      OnExecute = ASincronizaArticulosExecute
    end
    object ASincronizarPedidos: TAction
      Category = 'Sincronizacion'
      Caption = 'Sincronizar Pedidos'
      Hint = 'Sincronizar Pedidos'
      ImageIndex = 98
      OnExecute = ASincronizarPedidosExecute
    end
    object ASincronizarStock: TAction
      Category = 'Sincronizacion'
      Caption = 'Sincronizar Stock'
      Hint = 'Sincronizar Stock'
      ImageIndex = 98
      OnExecute = ASincronizarStockExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Sincronizacion'
      Caption = 'Sincronizacion'
      ImageIndex = 98
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 384
    Top = 0
  end
end
