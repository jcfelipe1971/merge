inherited FMControl_Lote: TFMControl_Lote
  Left = 185
  Top = 120
  Caption = 'Control de Lote'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBELote
        InsertaControl = DBELote
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Left = 40
            Top = 50
          end
          object LFLabel1: TLFLabel
            Left = 32
            Top = 66
            Width = 49
            Height = 13
            Caption = 'Proveedor'
          end
          object LFLabel2: TLFLabel
            Left = 60
            Top = 25
            Width = 21
            Height = 13
            Caption = 'Lote'
            FocusControl = DBELote
          end
          object LBLAlmacen: TLFLabel
            Left = 40
            Top = 87
            Width = 41
            Height = 13
            Caption = 'Almac'#233'n'
          end
          object LBLSerie: TLFLabel
            Left = 57
            Top = 109
            Width = 24
            Height = 13
            Caption = 'Serie'
            FocusControl = DBESerie
          end
          object LBLClasificacion: TLFLabel
            Left = 22
            Top = 130
            Width = 59
            Height = 13
            Caption = 'Clasificaci'#243'n'
            FocusControl = DBEClasificacion
          end
          object LBLFFAbricacion: TLFLabel
            Left = 14
            Top = 152
            Width = 67
            Height = 13
            Caption = 'F. Fabricaci'#243'n'
          end
          object LBLFENvasado: TLFLabel
            Left = 21
            Top = 173
            Width = 60
            Height = 13
            Caption = 'F. Envasado'
          end
          object LBLFCaducidad: TLFLabel
            Left = 18
            Top = 195
            Width = 63
            Height = 13
            Caption = 'F. Caducidad'
          end
          object LBLStock: TLFLabel
            Left = 53
            Top = 217
            Width = 28
            Height = 13
            Caption = 'Stock'
            FocusControl = DBEStock
          end
          object LBLArticulo: TLFLabel
            Left = 44
            Top = 41
            Width = 40
            Height = 21
            AutoSize = False
            Caption = 'Art'#237'culo'
            Layout = tlCenter
          end
          object LFLabel3: TLFLabel
            Left = 175
            Top = 154
            Width = 37
            Height = 13
            Caption = 'Observ.'
          end
          object DBELote: TLFDbedit
            Left = 84
            Top = 21
            Width = 121
            Height = 21
            DataField = 'LOTE'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            TabOrder = 0
          end
          object DBEClasificacion: TLFDbedit
            Left = 84
            Top = 129
            Width = 381
            Height = 21
            DataField = 'CLASIFICACION'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            TabOrder = 6
          end
          object DTPFFAbricacion: TLFDBDateEdit
            Left = 84
            Top = 151
            Width = 87
            Height = 21
            DataField = 'F_FABRICACION'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBESerie: TLFDbedit
            Left = 84
            Top = 107
            Width = 134
            Height = 21
            DataField = 'SERIE'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            TabOrder = 4
          end
          object DBEStock: TLFDbedit
            Left = 84
            Top = 216
            Width = 87
            Height = 21
            Color = clInfoBk
            DataField = 'STOCK'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DTPFENvasado: TLFDBDateEdit
            Left = 84
            Top = 173
            Width = 87
            Height = 21
            DataField = 'F_ENVASADO'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            NumGlyphs = 2
            TabOrder = 8
          end
          object DTPFCaducidad: TLFDBDateEdit
            Left = 84
            Top = 195
            Width = 87
            Height = 21
            DataField = 'F_CADUCIDAD'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            NumGlyphs = 2
            TabOrder = 10
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 84
            Top = 85
            Width = 73
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            TabOrder = 3
            OnChange = DBEFAlmacenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitulo_Alm: TLFEdit
            Left = 157
            Top = 85
            Width = 310
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
            TabOrder = 9
          end
          object DBEFProveedor: TLFDBEditFind2000
            Left = 84
            Top = 63
            Width = 73
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            TabOrder = 2
            OnChange = DBEFProveedorChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFArticulos: TLFDBEditFind2000
            Left = 84
            Top = 41
            Width = 121
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            TabOrder = 1
            OnChange = DBEFArticulosChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBMemo1: TLFDBMemo
            Left = 224
            Top = 152
            Width = 241
            Height = 84
            DataField = 'COMENTARIO'
            DataSource = DMControl_Lote.DSQMArticulos_Lotes
            TabOrder = 11
          end
          object ETitulo_Prov: TLFEdit
            Left = 157
            Top = 63
            Width = 310
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
            TabOrder = 12
          end
          object ETitulo_Art: TLFEdit
            Left = 205
            Top = 41
            Width = 262
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
            TabOrder = 13
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'LOTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASIFICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_FABRICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_ENVASADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_CADUCIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AImprimeEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Etiquetas'
      OnExecute = AImprimeEtiquetasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
end
