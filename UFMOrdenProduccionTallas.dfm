inherited FMOrdenProduccionTallas: TFMOrdenProduccionTallas
  Left = 298
  Top = 175
  Caption = 'Orden de Producci'#243'n Tallas'
  ClientHeight = 517
  ClientWidth = 779
  OldCreateOrder = True
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 779
    Height = 493
    inherited TBMain: TLFToolBar
      Width = 775
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClick = NavMainClick
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
        Action = ATraspasoAProduccion
      end
    end
    inherited PCMain: TLFPageControl
      Width = 775
      Height = 463
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 767
          Height = 145
          Align = alTop
          object LBLPrioridad: TLFLabel
            Left = 23
            Top = 97
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prioridad'
          end
          object LBLMerma: TLFLabel
            Left = 197
            Top = 97
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = '% Merma'
          end
          object LBLMaterial: TLFLabel
            Left = 27
            Top = 118
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Material'
          end
          object LBLAlmacen: TLFLabel
            Left = 23
            Top = 74
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLSerie: TLFLabel
            Left = 40
            Top = 52
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object Label1: TLFLabel
            Left = 2
            Top = 9
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Orden'
          end
          object LBLOperario: TLFLabel
            Left = 24
            Top = 30
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object GBPedido: TGroupBox
            Left = 508
            Top = 1
            Width = 149
            Height = 78
            Caption = 'Pedido Asociado'
            TabOrder = 0
            object LBLPedido: TLFLabel
              Left = 15
              Top = 30
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pedido'
            end
            object LBLLinea: TLFLabel
              Left = 20
              Top = 52
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'nea'
            end
            object DBEFPedido: TDBEditFind2000
              Left = 52
              Top = 26
              Width = 85
              Height = 21
              DataField = 'PEDIDO'
              DataSource = DMOrdenProduccionTallas.DSQMCabecera
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_DETALLE_PEDIDO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'RIG'
              CampoStr = 'RIG'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFLinea: TDBEditFind2000
              Left = 52
              Top = 48
              Width = 85
              Height = 21
              DataField = 'LINEA'
              DataSource = DMOrdenProduccionTallas.DSQMCabecera
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_DETALLE_PEDIDO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LINEA'
              CampoStr = 'LINEA'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object GBFechas: TGroupBox
            Left = 508
            Top = 79
            Width = 150
            Height = 57
            Caption = 'Fechas'
            TabOrder = 1
            object LBLFechaEntrega: TLFLabel
              Left = 11
              Top = 27
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Entrega'
            end
            object DBDTPFEntrega: TLFDBDateEdit
              Left = 52
              Top = 23
              Width = 85
              Height = 21
              DataField = 'FECHA_ENTREGA'
              DataSource = DMOrdenProduccionTallas.DSQMCabecera
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
          end
          object DBEPrioridad: TLFDbedit
            Left = 68
            Top = 93
            Width = 121
            Height = 21
            DataField = 'PRIORIDAD'
            DataSource = DMOrdenProduccionTallas.DSQMCabecera
            TabOrder = 2
          end
          object DBEMerma: TLFDbedit
            Left = 244
            Top = 93
            Width = 121
            Height = 21
            DataField = 'PRIORIDAD'
            DataSource = DMOrdenProduccionTallas.DSQMCabecera
            TabOrder = 3
          end
          object DBEFMaterial: TDBEditFind2000
            Left = 68
            Top = 115
            Width = 121
            Height = 21
            DataField = 'MATERIAL'
            DataSource = DMOrdenProduccionTallas.DSQMCabecera
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_MATERIAL'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBETitMaterial: TLFDbedit
            Left = 190
            Top = 115
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxMaterial
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
          object DBEFAlmacen: TDBEditFind2000
            Left = 68
            Top = 71
            Width = 121
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMOrdenProduccionTallas.DSQMCabecera
            TabOrder = 6
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
          object DBETitAlmacen: TLFDbedit
            Left = 190
            Top = 71
            Width = 307
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxAlmacenes
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
          object DBEFSerie: TDBEditFind2000
            Left = 68
            Top = 49
            Width = 121
            Height = 21
            DataField = 'SERIE'
            DataSource = DMOrdenProduccionTallas.DSQMCabecera
            TabOrder = 8
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'GEN_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitSerie: TLFDbedit
            Left = 190
            Top = 49
            Width = 307
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxSeries
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
          object DBDTPFecha_orden: TLFDBDateEdit
            Left = 68
            Top = 5
            Width = 122
            Height = 21
            DataField = 'FECHA_ORDEN'
            DataSource = DMOrdenProduccionTallas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
          object DBETercero: TDBEditFind2000
            Left = 68
            Top = 27
            Width = 121
            Height = 21
            DataField = 'TERCERO_OPERARIO'
            DataSource = DMOrdenProduccionTallas.DSQMCabecera
            TabOrder = 11
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_COMERCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDBDOperario: THYDBDescripcion
            Left = 190
            Top = 27
            Width = 307
            Height = 21
            Color = clInfoBk
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            Tabla_a_buscar = 'SYS_TERCEROS'
            Campo_Descripcion = 'NOMBRE_COMERCIAL'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TERCERO_OPERARIO')
            CamposWhereTabla.Strings = (
              'TERCERO')
          end
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 145
          Width = 767
          Height = 290
          Align = alClient
          TabOrder = 1
          object TBDetalle: TLFToolBar
            Left = 1
            Top = 1
            Width = 765
            Height = 29
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMOrdenProduccionTallas.DSQMDetalle
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
            object ToolButton3: TToolButton
              Left = 240
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
          end
          object DBGFDetalle: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 765
            Height = 198
            Align = alClient
            DataSource = DMOrdenProduccionTallas.DSQMDetalle
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
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            Transaction = DMOrdenProduccionTallas.TLocal
            BuscarNums = False
            Campos.Strings = (
              'REF_PROVEEDOR'
              'S_COLOR')
            CamposAMostrar.Strings = (
              'REF_PROVEEDOR'
              '0'
              'S_COLOR'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            Numericos.Strings = (
              'REF_PROVEEDOR'
              'S_COLOR')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'ART_ARTICULOS_MODELOS'
              'VER_ART_MOD_COLOR_PROV')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnRowChange = DBGFDetalleRowChange
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'REF_PROVEEDOR'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESCANDALLO'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'S_COLOR'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITMC'
                Width = 129
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T01'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T02'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T03'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T04'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T05'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T06'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T07'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T08'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T09'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T10'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T11'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T12'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T13'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T14'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T15'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T16'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T17'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T18'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T19'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T20'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T21'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'T22'
                Width = 30
                Visible = True
              end>
          end
          object SGDatos: TStringGrid
            Left = 1
            Top = 228
            Width = 765
            Height = 61
            Align = alBottom
            ColCount = 22
            DefaultColWidth = 30
            DefaultRowHeight = 18
            Enabled = False
            RowCount = 3
            FixedRows = 0
            ScrollBars = ssNone
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 767
          Height = 435
          DataSource = DMOrdenProduccionTallas.DSQMCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NORDEN'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIORIDAD'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_MERMA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATERIAL'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO_OPERARIO'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ORDEN'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 493
    Width = 779
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Complementario = TBDetalle
    Left = 368
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 404
    Top = 4
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
    Left = 456
    Top = 6
    object ATraspasoAProduccion: TAction
      Category = 'Procesos'
      Caption = 'Traspaso A Produccion'
      Hint = 'Traspasa a producci'#243'n'
      OnExecute = ATraspasoAProduccionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGMain.Columns')
    Left = 496
    Top = 6
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = PEdit
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 196
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 440
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
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
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
  end
end
