inherited ZFMTarifasModelos: TZFMTarifasModelos
  Left = 442
  Top = 182
  Width = 961
  Height = 639
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Tarifas Modelos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 951
    Height = 177
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 947
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = ZDMTarifasModelos.DSPreciosCab
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEModelo
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
      object ToolButton1: TToolButton
        Left = 299
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBBloquear: TToolButton
        Left = 307
        Top = 0
        Action = ABloquearTodos
        Caption = 'Bloquear Todos'
        ImageIndex = 19
      end
      object TBDesbloquear: TToolButton
        Left = 330
        Top = 0
        Action = ADesbloquearTodos
        ImageIndex = 27
      end
      object TBCambiaMargen: TToolButton
        Left = 353
        Top = 0
        Hint = 
          'Incremento del precio nuevo a partir de un m'#225'rgen para los art'#237'c' +
          'ulos desbloqueados.'
        Caption = 'Cambia Margen'
        ImageIndex = 110
        OnClick = TBCambiaMargenClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 947
      Height = 147
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 939
          Height = 119
          inherited G2KTableLoc: TG2KTBLoc
            Left = 5
            Top = 13
            Tabla_a_buscar = 'Z_MODELOS_PRECIOS_CAB'
            CampoNum = 'MODELO'
            CampoStr = 'DESCRIPCIO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LModelo: TLFLabel
            Left = 44
            Top = 4
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LTipoLona: TLFLabel
            Left = 31
            Top = 25
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Lona'
          end
          object LTarifa: TLFLabel
            Left = 52
            Top = 48
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LDescripcion: TLFLabel
            Left = 23
            Top = 70
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFechaCreacion: TLFLabel
            Left = 5
            Top = 92
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha creaci'#243'n'
          end
          object DBEModelo: TDBEditFind2000
            Left = 83
            Top = 0
            Width = 64
            Height = 21
            DataField = 'MODELO'
            DataSource = ZDMTarifasModelos.DSPreciosCab
            TabOrder = 0
            OnChange = DBEModeloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_MODELOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBELona: TDBEditFind2000
            Left = 83
            Top = 22
            Width = 64
            Height = 21
            DataField = 'TIPO_LONA'
            DataSource = ZDMTarifasModelos.DSPreciosCab
            TabOrder = 1
            OnChange = DBELonaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_LONAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBELonaBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBETarifa: TDBEditFind2000
            Left = 83
            Top = 44
            Width = 64
            Height = 21
            DataField = 'TARIFA'
            DataSource = ZDMTarifasModelos.DSPreciosCab
            TabOrder = 3
            OnChange = DBETarifaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescripcion: TLFDbedit
            Left = 83
            Top = 66
            Width = 400
            Height = 21
            DataField = 'DESCRIPCIO'
            DataSource = ZDMTarifasModelos.DSPreciosCab
            TabOrder = 5
          end
          object DescTipoLona: TLFHYDBDescription
            Left = 148
            Top = 22
            Width = 335
            Height = 21
            Color = clInfoBk
            DataSource = ZDMTarifasModelos.DSPreciosCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Tabla_a_buscar = 'Z_SYS_LONAS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_LONA')
            CamposWhereTabla.Strings = (
              'CODIGO')
          end
          object DescTarifa: TLFHYDBDescription
            Left = 148
            Top = 44
            Width = 335
            Height = 21
            Color = clInfoBk
            DataSource = ZDMTarifasModelos.DSPreciosCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'TARIFA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'TARIFA')
          end
          object DEFecha: TLFDBDateEdit
            Left = 83
            Top = 88
            Width = 98
            Height = 21
            DataField = 'FECHA_CREACION'
            DataSource = ZDMTarifasModelos.DSPreciosCab
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBCBTarfiaDefecto: TLFDBCheckBox
            Left = 208
            Top = 91
            Width = 273
            Height = 17
            Caption = 'Tarifa por defecto para este modelo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TARIFA_DEFECTO'
            DataSource = ZDMTarifasModelos.DSPreciosCab
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 939
          Height = 119
          DataSource = ZDMTarifasModelos.DSPreciosCab
          CamposAMarcar.Strings = (
            'TARIFA_DEFECTO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          Columns = <
            item
              Expanded = False
              FieldName = 'MODELO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_LONA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CREACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCIO'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA_DEFECTO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 586
    Width = 951
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 177
    Width = 951
    Height = 409
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 0
      Width = 951
      Height = 409
      ActivePage = TSNormal
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSNormal: TTabSheet
        Caption = 'Normal'
        object PNLDetalle_No_Color: TLFPanel
          Left = 0
          Top = 22
          Width = 943
          Height = 359
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGDetalle_No_Color: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 943
            Height = 359
            Align = alClient
            DataSource = ZDMTarifasModelos.DSPreciosDet
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGDetalle_No_ColorDrawColumnCell
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
            Transaction = DMMain.TLocal
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'BLOQUEO_PVENTA')
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
                FieldName = 'ARTICULO'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE_ARMAZON'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE_LONA'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE_FABRICACION'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA_ARMAZON'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA_LONA'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA_FABRICACION'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MARGEN'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEN_ARMAZON'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SALIDA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MULTIPLO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_SALIDA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_M2_LONA'
                ReadOnly = True
                Width = 75
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LONA'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'margen_armazon_cent'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'margen_cent'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_VENTA_ARMAZON_MODIFICADO'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_VENTA_MODIFICADO'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BLOQUEO_PVENTA'
                Visible = True
              end>
          end
        end
        object TBDetalle_No_Color: TLFToolBar
          Left = 0
          Top = 0
          Width = 943
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Wrapable = False
          Separators = True
          object NavDetalle_No_Color: THYMNavigator
            Left = 0
            Top = 0
            Width = 180
            Height = 22
            DataSource = ZDMTarifasModelos.DSPreciosDet
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGDetalle_No_Color
            InsertaControl = DBGDetalle_No_Color
            Exclusivo = False
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSColor: TTabSheet
        Caption = 'Color'
        ImageIndex = 1
        object PNLDetalle_Color: TLFPanel
          Left = 0
          Top = 22
          Width = 943
          Height = 359
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGDetalle_Color: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 943
            Height = 359
            Align = alClient
            DataSource = ZDMTarifasModelos.DSPreciosDetColor
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGDetalle_ColorDrawColumnCell
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
              'BLOQUEO_PVENTA')
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
                FieldName = 'ARTICULO'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE_ARMAZON'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE_LONA'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE_FABRICACION'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA_ARMAZON'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA_LONA'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA_FABRICACION'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_COSTE'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'P_VENTA'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MARGEN'
                ReadOnly = True
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SALIDA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'MULTIPLO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_SALIDA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TOTAL_M2_LONA'
                ReadOnly = True
                Width = 75
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LONA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'margen_cent'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_VENTA_ARMAZON_MODIFICADO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_VENTA_MODIFICADO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BLOQUEO_PVENTA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'margen_armazon_cent'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEN_ARMAZON'
                Visible = True
              end>
          end
        end
        object TBDetalle_Color: TLFToolBar
          Left = 0
          Top = 0
          Width = 943
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Wrapable = False
          Separators = True
          object NavDetalle_Color: THYMNavigator
            Left = 0
            Top = 0
            Width = 180
            Height = 22
            DataSource = ZDMTarifasModelos.DSPreciosDetColor
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGDetalle_Color
            InsertaControl = DBGDetalle_Color
            Exclusivo = False
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 592
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 628
    Top = 8
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 100
    Top = 100
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ADamePrecios: TAction
      Category = 'Procesos'
      Caption = 'Generar precios modelo'
      Hint = 'Generar precios modelo'
      ImageIndex = 56
      OnExecute = ADamePreciosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 448
    Top = 16
  end
  object ALTarifas: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 132
    Top = 100
    object ABloquearTodos: TAction
      Hint = 'Bloquear todas lineas'
      OnExecute = ABloquearTodosExecute
    end
    object ADesbloquearTodos: TAction
      Caption = 'ADesbloquearTodos'
      Hint = 'Desbloquear todas las lineas'
      OnExecute = ADesbloquearTodosExecute
    end
  end
end
