inherited FMAsignaLotes: TFMAsignaLotes
  Left = 422
  Top = 161
  Width = 682
  Height = 503
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Asigna Lotes'
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 672
    Height = 450
    inherited TBMain: TLFToolBar
      Width = 668
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PNLInfoDocumento: TLFPanel
      Left = 2
      Top = 28
      Width = 668
      Height = 85
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LArticulo: TLFLabel
        Left = 25
        Top = 12
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo'
      end
      object LDocumento: TLFLabel
        Left = 7
        Top = 34
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Documento'
      end
      object LCodCliPro: TLFLabel
        Left = 13
        Top = 56
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Proveedor'
      end
      object LUnidadesNecesarias: TLFLabel
        Left = 492
        Top = 12
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Uds. Necesarias'
      end
      object LUnidadesAsignadas: TLFLabel
        Left = 496
        Top = 34
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Uds. Asignadas'
      end
      object DBEEjercicio: TLFDbedit
        Left = 140
        Top = 30
        Width = 71
        Height = 21
        Color = clInfoBk
        DataField = 'EJERCICIO'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 0
      end
      object DBEArticulo: TLFDbedit
        Left = 67
        Top = 8
        Width = 102
        Height = 21
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 1
        OnChange = DBEArticuloChange
      end
      object ETituloAticulo: TLFEdit
        Left = 170
        Top = 8
        Width = 308
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 2
      end
      object DBETipo: TLFDbedit
        Left = 67
        Top = 30
        Width = 72
        Height = 21
        Color = clInfoBk
        DataField = 'TIPO'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 3
      end
      object DBESerie: TLFDbedit
        Left = 212
        Top = 30
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'SERIE'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 4
      end
      object DBERIG: TLFDbedit
        Left = 301
        Top = 30
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'RIG'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 5
      end
      object DBELinea: TLFDbedit
        Left = 390
        Top = 30
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'LINEA'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 6
      end
      object DBECodCliPro: TLFDbedit
        Left = 67
        Top = 52
        Width = 102
        Height = 21
        Color = clInfoBk
        DataField = 'COD_CLI_PRO'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 7
        OnChange = DBECodCliProChange
      end
      object ETituloCodCliPro: TLFEdit
        Left = 170
        Top = 52
        Width = 308
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 8
      end
      object DBEUnidadesNecesarias: TLFDbedit
        Left = 575
        Top = 8
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'UNIDADES'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 9
      end
      object DBELUnidadesAsignadas: TLFDbedit
        Left = 575
        Top = 30
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'UNIDADES_ASIGNADAS'
        DataSource = DMAsignaLotes.DSxDocumento
        Enabled = False
        TabOrder = 10
      end
    end
    object PNLSeleccionLotes: TLFPanel
      Left = 2
      Top = 113
      Width = 668
      Height = 335
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PNLSeleccionLotes'
      TabOrder = 2
      object Splitter: TSplitter
        Left = 0
        Top = 191
        Width = 668
        Height = 8
        Cursor = crVSplit
        Align = alBottom
      end
      object PNLLotesDisponibles: TLFPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 191
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PNLLotesDisponibles'
        Constraints.MinHeight = 191
        TabOrder = 0
        object PCLotesDisponibles: TLFPageControl
          Left = 0
          Top = 0
          Width = 668
          Height = 191
          ActivePage = TSLotesDisponibles
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSLotesDisponibles: TTabSheet
            Caption = 'Lotes Disponibles'
            object DBGLotesDisponibles: TDBGridFind2000
              Left = 0
              Top = 25
              Width = 660
              Height = 138
              Align = alClient
              Color = clInfoBk
              DataSource = DMAsignaLotes.DSxLoteDisponible
              DefaultDrawing = False
              Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGLotesDisponiblesDrawColumnCell
              OnDblClick = DBGLotesDisponiblesDblClick
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
              Transaction = DMAsignaLotes.TLocal
              BuscarNums = False
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'ID_LOTE'
                'LOTE'
                'CLASIFICACION'
                'F_CADUCIDAD'
                'F_ENVASADO'
                'F_FABRICACION')
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
                  FieldName = 'ID_LOTE'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANAL'
                  Width = 32
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STOCK'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STOCK_VIRTUAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_ENVASADO'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_CADUCIDAD'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_FABRICACION'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_UBICACION'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA1'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA2'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA3'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA4'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASIFICACION'
                  Width = 216
                  Visible = True
                end>
            end
            object PNLCabLotesDisponibles: TLFPanel
              Left = 0
              Top = 0
              Width = 660
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LLotesDisponibles: TLFLabel
                Left = 1
                Top = 1
                Width = 101
                Height = 13
                Caption = 'Lotes Disponibles'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LFiltroClasificacion: TLFLabel
                Left = 185
                Top = 6
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Clasificacion'
              end
              object EFiltroClasificacion: TLFEdit
                Left = 248
                Top = 2
                Width = 121
                Height = 21
                TabOrder = 0
                OnChange = EFiltroClasificacionChange
              end
            end
          end
          object TSLoteNuevo: TTabSheet
            Caption = 'Lote Nuevo'
            ImageIndex = 1
            OnShow = TSLoteNuevoShow
            object LProveedor: TLFLabel
              Left = 40
              Top = 29
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Proveedor'
            end
            object LBLFFAbricacion: TLFLabel
              Left = 22
              Top = 51
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Fabricaci'#243'n'
            end
            object LBLFENvasado: TLFLabel
              Left = 192
              Top = 50
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Envasado'
            end
            object LBLFCaducidad: TLFLabel
              Left = 365
              Top = 50
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Caducidad'
            end
            object LBLClasificacion: TLFLabel
              Left = 30
              Top = 73
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clasificaci'#243'n'
            end
            object LNotas: TLFLabel
              Left = 61
              Top = 94
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Notas'
            end
            object LFMedida1: TLFLabel
              Left = 45
              Top = 143
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Medida 1'
            end
            object LFMedida2: TLFLabel
              Left = 166
              Top = 142
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Medida 2'
            end
            object LFMedida3: TLFLabel
              Left = 286
              Top = 142
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Medida 3'
            end
            object LFMedida4: TLFLabel
              Left = 410
              Top = 142
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Medida 4'
            end
            object LLote: TLFLabel
              Left = 68
              Top = 7
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lote'
            end
            object BCrearLote: TBitBtn
              Left = 546
              Top = 132
              Width = 88
              Height = 25
              Caption = '&Crear Lote'
              TabOrder = 12
              OnClick = BCrearLoteClick
            end
            object EFProveedor: TLFEditFind2000
              Left = 93
              Top = 25
              Width = 87
              Height = 21
              TabOrder = 1
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
              Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'PROVEEDOR')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EDescProveedor: TLFEdit
              Left = 181
              Top = 25
              Width = 338
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 20
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DTPFFabricacion: TLFDateEdit
              Left = 93
              Top = 47
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 3
            end
            object DTPFEnvasado: TLFDateEdit
              Left = 256
              Top = 47
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 4
            end
            object DTPFCaducidad: TLFDateEdit
              Left = 432
              Top = 47
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 5
            end
            object EClasificacion: TLFEdit
              Left = 93
              Top = 69
              Width = 426
              Height = 21
              MaxLength = 100
              TabOrder = 6
            end
            object MNotas: TLFMemo
              Left = 93
              Top = 91
              Width = 426
              Height = 47
              TabOrder = 7
            end
            object LFEMedida1: TLFEdit
              Left = 93
              Top = 139
              Width = 61
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              Text = '0'
            end
            object LFEMedida2: TLFEdit
              Left = 214
              Top = 139
              Width = 61
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              Text = '0'
            end
            object LFEMedida3: TLFEdit
              Left = 334
              Top = 139
              Width = 61
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              Text = '0'
            end
            object LFEMedida4: TLFEdit
              Left = 458
              Top = 139
              Width = 61
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              Text = '0'
            end
            object ELote: TLFEdit
              Left = 93
              Top = 3
              Width = 87
              Height = 21
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
        object BNuevoLoteIgualClasificacion: TBitBtn
          Left = 561
          Top = 0
          Width = 107
          Height = 20
          Hint = 'Crea un nuevo lote con la misma clasificacion.'
          Caption = 'Nuevo Lote'
          TabOrder = 1
          OnClick = BNuevoLoteIgualClasificacionClick
        end
      end
      object PNLLotesAsignados: TLFPanel
        Left = 0
        Top = 199
        Width = 668
        Height = 136
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PNLLotesAsignados'
        TabOrder = 1
        object DBGLotesAsignados: TDBGridFind2000
          Left = 0
          Top = 34
          Width = 668
          Height = 102
          Align = alClient
          Color = clInfoBk
          DataSource = DMAsignaLotes.DSxLoteAsignado
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGLotesAsignadosDblClick
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
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_FABRICACION'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_ENVASADO'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_CADUCIDAD'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_A_UBICACION'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASIFICACION'
              Width = 70
              Visible = True
            end>
        end
        object PNLMoverLote: TLFPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 34
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LLotesAsignados: TLFLabel
            Left = 1
            Top = 1
            Width = 94
            Height = 13
            Caption = 'Lotes Asignados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LCantidad: TLFLabel
            Left = 217
            Top = 11
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
          end
          object BAsignar: TBitBtn
            Left = 336
            Top = 5
            Width = 75
            Height = 25
            Caption = '&Asignar'
            TabOrder = 0
            OnClick = BAsignarClick
          end
          object EUnidades: TLFEdit
            Left = 264
            Top = 7
            Width = 65
            Height = 21
            TabOrder = 1
            Text = '0'
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 450
    Width = 672
  end
  inherited CEMain: TControlEdit
    Left = 296
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 332
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
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Top = 0
  end
end
