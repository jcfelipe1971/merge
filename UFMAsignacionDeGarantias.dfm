inherited FMAsignacionDeGarantias: TFMAsignacionDeGarantias
  Left = 281
  Top = 108
  Width = 590
  Height = 550
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Asignacion de Garantias'
  Constraints.MinHeight = 550
  Constraints.MinWidth = 550
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Top = 27
    Width = 580
    Height = 470
    TabOrder = 2
    inherited TBMain: TLFToolBar
      Width = 576
      TabOrder = 1
      inherited NavMain: THYMNavigator
        DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
        Hints.Strings = ()
        EditaControl = DBEFArticulo
        InsertaControl = DBEFArticulo
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 576
      Height = 440
      TabOrder = 0
      TabStop = False
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 568
          Height = 257
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'ART_ARTICULOS_GARANTIAS'
            CampoNum = 'ID'
            CampoStr = 'ARTICULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object PNLCabeceraFicha: TLFPanel
            Left = 0
            Top = 0
            Width = 568
            Height = 256
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              568
              256)
            object LUsuario: TLFLabel
              Left = 0
              Top = 88
              Width = 36
              Height = 13
              Caption = 'Usuario'
              FocusControl = DBEUsuario
            end
            object LOrdenDeTrabajo: TLFLabel
              Left = 344
              Top = 88
              Width = 83
              Height = 13
              Caption = 'Orden de Trabajo'
              FocusControl = DBEOrdenDeTrabajo
            end
            object LObservaciones: TLFLabel
              Left = 0
              Top = 167
              Width = 71
              Height = 13
              Caption = 'Observaciones'
            end
            object LFechaVenta: TLFLabel
              Left = 224
              Top = 88
              Width = 52
              Height = 13
              Caption = 'Fec. Venta'
              FocusControl = DBEFechaVenta
            end
            object LFechaEmpalaje: TLFLabel
              Left = 104
              Top = 88
              Width = 67
              Height = 13
              Caption = 'Fec. Embalaje'
              FocusControl = DBEFechaEmpalaje
            end
            object LCliente: TLFLabel
              Left = 0
              Top = 48
              Width = 32
              Height = 13
              Caption = 'Cliente'
            end
            object LArticulo: TLFLabel
              Left = 0
              Top = 8
              Width = 35
              Height = 13
              Caption = 'Articulo'
            end
            object LAlbaran: TLFLabel
              Left = 0
              Top = 128
              Width = 36
              Height = 13
              Caption = 'Albaran'
            end
            object ETituloCliente: TEdit
              Left = 98
              Top = 64
              Width = 470
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Enabled = False
              TabOrder = 0
            end
            object ETituloArticulo: TEdit
              Left = 98
              Top = 24
              Width = 470
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
            end
            object DBMemoObservaciones: TDBMemo
              Left = 0
              Top = 183
              Width = 569
              Height = 73
              Anchors = [akLeft, akTop, akRight]
              DataField = 'OBSERVACIONES'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              TabOrder = 2
            end
            object DBEUsuario: TLFDbedit
              Left = 0
              Top = 104
              Width = 97
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'USUARIO'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEOrdenDeTrabajo: TLFDbedit
              Left = 344
              Top = 104
              Width = 112
              Height = 21
              DataField = 'ORDEN_TRABAJO'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              TabOrder = 4
            end
            object DBEFechaVenta: TLFDbedit
              Left = 224
              Top = 104
              Width = 112
              Height = 21
              DataField = 'FECHA_VENTA'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              TabOrder = 5
            end
            object DBEFechaEmpalaje: TLFDbedit
              Left = 104
              Top = 104
              Width = 112
              Height = 21
              DataField = 'FECHA_EMBALAJE'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              TabOrder = 6
            end
            object DBEFCliente: TLFDBEditFind2000
              Left = 0
              Top = 64
              Width = 97
              Height = 21
              DataField = 'CLIENTE'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              TabOrder = 7
              OnChange = DBEFClienteChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CLIENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'CLIENTE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFArticulo: TLFDBEditFind2000
              Left = 0
              Top = 24
              Width = 97
              Height = 21
              DataField = 'ARTICULO'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              TabOrder = 8
              OnChange = DBEFArticuloChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ART_ARTICULOS_ESC_GARANTIA'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ARTICULO'
              CampoStr = 'DESCRIPCION'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'ARTICULO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEAlbaran: TLFDbedit
              Left = 0
              Top = 144
              Width = 569
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'ALBARAN'
              DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
              Enabled = False
              ReadOnly = True
              TabOrder = 9
            end
          end
        end
        object PNLDetalleFicha: TLFPanel
          Left = 0
          Top = 257
          Width = 568
          Height = 155
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGDetalle: TDBGrid
            Left = 0
            Top = 45
            Width = 568
            Height = 110
            Align = alClient
            DataSource = DMAsignacionDeGarantias.DSxGarantiaDetalle
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DETALLE'
                ReadOnly = True
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REFERENCIA'
                Width = 185
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN_TRABAJO'
                Width = 185
                Visible = True
              end>
          end
          object PNLCabDetalle: TLFPanel
            Left = 0
            Top = 0
            Width = 568
            Height = 45
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              568
              45)
            object NavDetalle: THYMNavigator
              Left = 8
              Top = 13
              Width = 232
              Height = 25
              DataSource = DMAsignacionDeGarantias.DSxGarantiaDetalle
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGDetalle
              InsertaControl = DBGDetalle
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object BuscarReferencia: TEdit
              Left = 377
              Top = 1
              Width = 190
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              OnKeyPress = BuscarReferenciaKeyPress
            end
            object BBuscarReferencia: TButton
              Left = 421
              Top = 23
              Width = 67
              Height = 23
              Anchors = [akTop, akRight]
              Caption = '&Buscar Ref.'
              TabOrder = 2
              OnClick = BBuscarReferenciaClick
            end
            object BDuplicar: TButton
              Left = 264
              Top = 13
              Width = 75
              Height = 25
              Caption = '&Duplicar'
              TabOrder = 3
              OnClick = BDuplicarClick
            end
            object BLimpiarReferencia: TButton
              Left = 500
              Top = 23
              Width = 67
              Height = 23
              Anchors = [akTop, akRight]
              Caption = '&Limpiar Ref.'
              TabOrder = 4
              OnClick = BLimpiarReferenciaClick
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 568
          Height = 412
          DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'CLIENTE'
            'FECHA_EMBALAJE'
            'FECHA_VENTA'
            'ID'
            'IMPRESO'
            'ORDEN_TRABAJO'
            'USUARIO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_EMBALAJE'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_VENTA'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPRESO'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALBARAN'
              ReadOnly = True
              Width = 125
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 497
    Width = 580
  end
  object PNLImpresion: TLFPanel [2]
    Left = 0
    Top = 0
    Width = 580
    Height = 27
    Align = alTop
    Constraints.MinWidth = 580
    TabOrder = 0
    object BImprimir1: TButton
      Tag = 1
      Left = 8
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Imprimir &1'
      TabOrder = 0
      OnClick = BImprimirClick
    end
    object BDisenar1: TButton
      Tag = 1
      Left = 336
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Dise'#241'ar 1'
      TabOrder = 3
      OnClick = BDisenarClick
    end
    object CHBPrevisualizar: TCheckBox
      Left = 246
      Top = 5
      Width = 81
      Height = 17
      Caption = '&Previsualizar'
      TabOrder = 6
    end
    object BImprimir2: TButton
      Tag = 2
      Left = 88
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Imprimir &2'
      TabOrder = 1
      OnClick = BImprimirClick
    end
    object BDisenar2: TButton
      Tag = 2
      Left = 416
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Dise'#241'ar 2'
      TabOrder = 4
      OnClick = BDisenarClick
    end
    object BImprimir3: TButton
      Tag = 3
      Left = 168
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Imprimir &3'
      TabOrder = 2
      OnClick = BImprimirClick
    end
    object BDisenar3: TButton
      Tag = 3
      Left = 496
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Dise'#241'ar 3'
      TabOrder = 5
      OnClick = BDisenarClick
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMAsignacionDeGarantias.DSxGarantiaCabecera
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
