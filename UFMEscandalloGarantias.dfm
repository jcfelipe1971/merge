inherited FMEscandalloGarantias: TFMEscandalloGarantias
  Left = 301
  Top = 155
  Width = 600
  Height = 350
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Escandallo de Garantias'
  Constraints.MinHeight = 350
  Constraints.MinWidth = 600
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 297
    Caption = 'PMain'
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 586
      TabOrder = 1
      inherited NavMain: THYMNavigator
        DataSource = DMEscandalloGarantias.DSxEscandalloGarantia
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
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
      object PNLFiltro: TLFPanel
        Left = 337
        Top = 0
        Width = 198
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LEscandallo: TLFLabel
          Left = 17
          Top = 5
          Width = 52
          Height = 13
          Caption = 'Escandallo'
        end
        object EFArticulo: TEditFind2000
          Left = 74
          Top = 1
          Width = 121
          Height = 21
          TabOrder = 0
          OnChange = EFArticuloChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'DESCRIPCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS_ESC_GARANTIA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 267
      TabOrder = 0
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 65
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'ART_ARTICULOS_ESC_GARANTIA'
            CampoNum = 'ARTICULO'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object PNLEscandallo: TPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 65
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LArticulo: TLabel
              Left = 10
              Top = 11
              Width = 35
              Height = 13
              Caption = 'Articulo'
            end
            object LDescripcion: TLabel
              Left = 106
              Top = 12
              Width = 56
              Height = 13
              Caption = 'Descripcion'
              FocusControl = DBEDescripcion
            end
            object LNroEtiquetas: TLabel
              Left = 469
              Top = 13
              Width = 67
              Height = 13
              Caption = 'Nro. Etiquetas'
              FocusControl = DBENroEtiquetas
            end
            object DBEFArticulo: TDBEditFind2000
              Left = 8
              Top = 26
              Width = 94
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMEscandalloGarantias.DSxEscandalloGarantia
              TabOrder = 0
              AutoCambiarFoco = True
              BuscarNums = False
              Tabla_a_buscar = 'VER_ARTICULOS_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ARTICULO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnExiste = DBEFArticuloExiste
              Filtros = [obEmpresa, obEjercicio, obCanal]
            end
            object DBEDescripcion: TDBEdit
              Left = 104
              Top = 26
              Width = 364
              Height = 21
              DataField = 'DESCRIPCION'
              DataSource = DMEscandalloGarantias.DSxEscandalloGarantia
              TabOrder = 1
            end
            object DBENroEtiquetas: TDBEdit
              Left = 469
              Top = 26
              Width = 68
              Height = 21
              DataField = 'NRO_ETIQUETAS'
              DataSource = DMEscandalloGarantias.DSxEscandalloGarantia
              TabOrder = 2
            end
          end
        end
        object PNLDetalle: TPanel
          Left = 0
          Top = 65
          Width = 578
          Height = 174
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGDetalle: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 578
            Height = 150
            Align = alClient
            DataSource = DMEscandalloGarantias.DSxEscandalloGarantiaDetalle
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
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = DMEscandalloGarantias.TLocal
            BuscarNums = False
            Campos.Strings = (
              'DETALLE')
            CamposAMostrar.Strings = (
              'DETALLE'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'CON_CUENTAS_GES_ART')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Columns = <
              item
                Expanded = False
                FieldName = 'DETALLE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Width = 406
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN'
                Width = 37
                Visible = True
              end>
          end
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 578
            Height = 24
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMEscandalloGarantias.DSxEscandalloGarantiaDetalle
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
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 239
          DataSource = DMEscandalloGarantias.DSxEscandalloGarantia
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'DESCRIPCION'
            'NRO_ETIQUETAS')
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 328
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_ETIQUETAS'
              Width = 80
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 297
    Width = 590
    TabOrder = 0
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
