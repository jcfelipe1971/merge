inherited FMArtEscandallo: TFMArtEscandallo
  Left = 283
  Top = 207
  Width = 600
  Height = 410
  HelpContext = 90
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Escandallo de Art'#237'culos'
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 193
    inherited TBMain: TLFToolBar
      Width = 586
      ButtonWidth = 24
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      HotImages = DMMain.ILMain_In
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = DMArtEscandallo.DSxArticulo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 80
        VisibleButtons = [neBuscar, neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 176
        Style = tbsDivider
      end
      inherited TbuttComp: TToolButton
        Left = 184
      end
      object TButt_Escandallar: TToolButton
        Left = 208
        Top = 0
        Hint = 'Permitir Escandallar [Ctrl+Alt+E]'
        Caption = 'Escandallar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = TButt_EscandallarClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 163
      ActivePage = TSTabla
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 135
          inherited G2KTableLoc: TG2KTBLoc
            Top = 72
            DataSource = DMArtEscandallo.DSxArticulo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object LBLCosteArt: TLFLabel
            Left = 109
            Top = 66
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste del Art'#237'culo'
          end
          object DBCBAbierto: TLFDBCheckBox
            Left = 12
            Top = 65
            Width = 77
            Height = 17
            Caption = 'Abierto'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ABIERTO'
            DataSource = DMArtEscandallo.DSxArticulo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEArticulos: TLFDbedit
            Left = 12
            Top = 40
            Width = 120
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = DMArtEscandallo.DSxArticulo
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
          object DBEArt_Descrip: TLFDbedit
            Left = 133
            Top = 40
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArtEscandallo.DSxArticulo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEArt_Coste: TLFDbedit
            Left = 198
            Top = 62
            Width = 93
            Height = 21
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = DMArtEscandallo.DSxArticulo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 135
          DataSource = DMArtEscandallo.DSxArticulo
          CamposAMarcar.Strings = (
            'ABIERTO'
            'ANTICIPO'
            'BAJA'
            'BLOQUEO_COMPRAS'
            'BLOQUEO_VENTAS'
            'CONTROL_STOCK'
            'DEFECTO_UD_SECUNDARIA'
            'EXPORTAR'
            'GARANTIA'
            'GENERAR_PEDIDO_COMPRA_SIEMPRE'
            'IVA_ESCANDALLO'
            'NO_CALCULA_STOCKMINMAX'
            'PREPARABLE'
            'PRODUCCION'
            'PVP_POR_UD_SECUNDARIA'
            'SERIALIZADO'
            'SERIALIZADO_KRI'
            'UBICABLE'
            'VIRTUAL'
            'WEB')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ALFA_1'
            'ALFA_2'
            'ALFA_3'
            'ALFA_4'
            'ALFA_5'
            'ALFA_6'
            'ALFA_7'
            'ALFA_8'
            'ARTICULO'
            'FAMILIA'
            'MARCA'
            'P_COSTE'
            'SUBFAMILIA'
            'TITULO'
            'TITULO_CORTO'
            'TITULO_MARCA')
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBFAMILIA'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COSTE'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABIERTO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIRTUAL'
              Width = 50
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 193
    Width = 590
    Height = 164
    TabOrder = 1
    inherited TBDetalle: TLFToolBar
      Width = 590
      PopupMenu = CEDetallePMEdit
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        DataSource = DMArtEscandallo.DSxDetalle
        Hints.Strings = ()
        OnClick = NavDetalleClick
        Exclusivo = True
      end
      object LBLescandallable: TLFLabel
        Left = 220
        Top = 0
        Width = 285
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'ARTICULO NO ESCANDALLABLE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 142
      DataSource = DMArtEscandallo.DSxDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      PopupMenu = nil
      TabOrder = 0
      OnColEnter = DBGFDetalleColEnter
      OnDblClick = TButtSubEscandalloClick
      OnKeyUp = DBGFDetalleKeyUp
      AutoCambiarColumna = True
      BuscarNums = True
      BuscarChars = False
      Campos.Strings = (
        'DETALLE'
        'DETALLE')
      CamposAMostrar.Strings = (
        'DETALLE'
        '0'
        'DETALLE'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        'ARTICULO'
        'ARTICULO')
      CamposDesplegar.Strings = (
        '1'
        '0'
        '0'
        '0'
        '1')
      CamposNoAccesibles.Strings = (
        'ARTICULO'
        'EMPRESA'
        'P_COSTE'
        'TITULO')
      CamposNoAccMenosAlIns.Strings = (
        'DETALLE')
      Numericos.Strings = (
        'ARTICULO'
        'BARRAS')
      Tablas.Strings = (
        'VER_ARTICULOS_CUENTAS'
        'ART_ARTICULOS_BARRAS')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenadosPor.Strings = (
        'ARTICULO'
        'BARRAS')
      Columns = <
        item
          Expanded = False
          FieldName = 'DETALLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 99
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BARRAS'
          Width = 91
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 238
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Title.Alignment = taRightJustify
          Width = 49
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EMPRESA'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 357
    Width = 590
    EdgeBorders = []
    TabOrder = 2
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PMain
    Left = 496
    Top = 14
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Images = DMMain.ILMain_Ac
    Left = 532
    Top = 14
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
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = True
    end
    object TSep2: TMenuItem
      Caption = '-'
    end
    object MIEscandallar2: TMenuItem
      Action = AEscandallar
      Enabled = False
    end
    object MISubescandallo2: TMenuItem
      Action = ASubescandallo
    end
  end
  inherited ALMain: TLFActionList
    Left = 244
    Top = 160
    object AVisualizarListado: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado'
      ImageIndex = 14
      OnExecute = AVisualizarListadoExecute
    end
    object AVisualizarListadoFiltrados: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Filtrado'
      ImageIndex = 14
      OnExecute = MIVisualizarListadoClick
    end
    object ADuplicaEsc: TAction
      Category = 'Procesos'
      Caption = 'Duplica Escandallo'
      ImageIndex = 37
      OnExecute = ADuplicaEscandalloExecute
    end
    object ASubEscandallo2: TAction
      Category = 'Procesos'
      Caption = 'Muestra SubEscandallo [Ctrl+Alt+S]'
      ImageIndex = 10
      OnExecute = TButtSubEscandalloClick
    end
    object AImprimirLstFiltrado: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado Filtrado'
      ImageIndex = 14
      OnExecute = MIImprimirListadoClick
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AConfigList: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida del Listado de Escandallo'
      ImageIndex = 77
      OnExecute = MIListConfigClick
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
  end
  inherited FSMain: TLFFibFormStorage
    Left = 288
    Top = 162
  end
  inherited CEDetalle: TControlEdit
    Left = 498
    Top = 46
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Images = DMMain.ILMain_Ac
    Left = 534
    Top = 44
    object TSep1: TMenuItem
      Caption = '-'
    end
    object MIEscandallar1: TMenuItem
      Action = AEscandallar
      Enabled = False
    end
    object MISubescandallo1: TMenuItem
      Action = ASubescandallo
    end
  end
  object ALMacrosList: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 246
    Top = 196
    object AEscandallar: TAction
      Category = 'macros'
      Caption = 'Escandallar'
      Hint = 'Permitir Escandallar'
      ImageIndex = 19
      ShortCut = 49221
      OnExecute = macro_Butt_EscandallarClick
    end
    object AActualizar_costes: TAction
      Category = 'macros'
      Caption = 'Actualizar_costes'
      Hint = 'Actualiza el Coste del Articulo'
      ImageIndex = 94
      ShortCut = 49217
    end
    object ASubescandallo: TAction
      Category = 'macros'
      Caption = 'Subescandallo'
      Hint = 'Mostrar Subescandallo'
      ImageIndex = 10
      ShortCut = 49235
      OnExecute = TButtSubEscandalloClick
    end
    object ADuplicaEscandallo: TAction
      Category = 'macros'
      Caption = 'Duplica Escandallo'
      ImageIndex = 37
      OnExecute = ADuplicaEscandalloExecute
    end
  end
end
