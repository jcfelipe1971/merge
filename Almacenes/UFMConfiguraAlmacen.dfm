object FMConfiguraAlmacen: TFMConfiguraAlmacen
  Left = 411
  Top = 319
  Width = 700
  Height = 451
  Caption = 'Configuraci'#243'n de las ubicaciones en el Almac'#233'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 424
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PNL_Busca_Articulo: TLFPanel
      Left = 0
      Top = 28
      Width = 692
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      DesignSize = (
        692
        31)
      object LBAlmacenOrigen: TLFLabel
        Left = 13
        Top = 8
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Almac'#233'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBETitAlmacenOrig: TLFDbedit
        Left = 162
        Top = 5
        Width = 517
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMConfiguraAlmacen.DSxAlmacen
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEAlmacenOrig: TLFDbedit
        Left = 66
        Top = 5
        Width = 95
        Height = 21
        Color = clInfoBk
        DataField = 'ALMACEN'
        DataSource = DMConfiguraAlmacen.DSxAlmacen
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
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 692
      Height = 28
      ButtonHeight = 24
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 1
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 88
        Height = 24
        DataSource = DMConfiguraAlmacen.DSxAlmacen
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        OnClick = NavMainClick
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object EPMain: THYMEditPanel
        Left = 88
        Top = 0
        Width = 23
        Height = 24
        DataSource = DMConfiguraAlmacen.DSxAlmacen
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 1
        Flat = True
        Exclusivo = True
        OnClickRango = EPMainClickRango
      end
    end
    object PCMain: TLFPageControl
      Left = 0
      Top = 59
      Width = 692
      Height = 365
      ActivePage = TSFicha
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = 'Ficha'
        object PNFicha: TLFPanel
          Left = 0
          Top = 0
          Width = 684
          Height = 337
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 684
            Height = 26
            ButtonHeight = 24
            EdgeBorders = [ebLeft, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 0
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 24
              DataSource = DMConfiguraAlmacen.DSQMUbicacionAlmacen
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
          end
          object PNDetalle: TLFPanel
            Left = 0
            Top = 26
            Width = 684
            Height = 311
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGFMain: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 684
              Height = 311
              Align = alClient
              DataSource = DMConfiguraAlmacen.DSQMUbicacionAlmacen
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColEnter = DBGFMainColEnter
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              AutoCambiarColumna = False
              AutoPostEnCheckBox = True
              AutoStartDrag = False
              AutoStartDragInterval = 0
              IndiceBitmapOrdenable = 0
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'CALLE'
                'ESTANTERIA'
                'REPISA'
                'POSICION'
                'TIPO'
                'SECTOR')
              CamposAMostrar.Strings = (
                'CALLE'
                '0'
                'ESTANTERIA'
                '0'
                'REPISA'
                '0'
                'POSICION'
                '0'
                'TIPO'
                '0'
                'SECTOR'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0'
                '0'
                '0'
                '0'
                '0'
                '0')
              CamposADevolver.Strings = (
                ''
                ''
                ''
                ''
                'TIPO'
                'SECTOR')
              CamposDesplegar.Strings = (
                '1'
                '1'
                '1'
                '1'
                '1'
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'ALMACEN'
                'CALLE'
                'ESTANTERIA'
                'REPISA'
                'POSICION'
                'SECTOR'
                'TIPO')
              CamposNoAccesibles.Strings = (
                'DIAMETRO_ACC'
                'PESO_ACC'
                'VOLUMEN_ACC'
                'COMPOSICION')
              ColumnasCheckBoxes.Strings = (
                'DISPONIBLE')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'CALLE'
                'ESTANTERIA'
                'REPISA'
                'POSICION'
                'TIPO'
                'SECTOR')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_CALLES'
                'ART_ESTANTERIAS'
                'ART_REPISAS'
                'ART_POSICION'
                'SYS_TIPO_UBICACIONES'
                'SYS_SECTORES')
              Acciones.Strings = (
                ''
                ''
                ''
                ''
                ''
                '')
              Titulos.Strings = (
                'DESCRIPCION'
                'DESCRIPCION'
                'DESCRIPCION'
                'DESCRIPCION'
                'TITULO'
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGFMainBusqueda
              Planes.Strings = (
                ''
                ''
                ''
                ''
                ''
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'CALLE'
                'ESTANTERIA'
                'REPISA'
                'POSICION'
                'TIPO'
                'SECTOR')
              Filtros = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CALLE'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTANTERIA'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REPISA'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'POSICION'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 190
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VOLUMEN_MAX'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIAMETRO_MAX'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESO_MAX'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SECTOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DISPONIBLE'
                  Width = 35
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'COMPOSICION'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBtnText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 64
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VOLUMEN_ACC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DIAMETRO_ACC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Width = 70
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PESO_ACC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Width = 70
                  Visible = True
                end>
            end
          end
        end
      end
      object TSMapa: TTabSheet
        Caption = 'Mapa'
        ImageIndex = 1
        OnShow = TSMapaShow
        object PNArbol: TLFPanel
          Left = 0
          Top = 0
          Width = 684
          Height = 337
          Align = alClient
          TabOrder = 0
          object TWMapa: TTreeView
            Left = 1
            Top = 1
            Width = 682
            Height = 335
            Align = alClient
            Images = DMMain.ILMain_Ac
            Indent = 19
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object CEMain: TControlEdit
    DataSource = DMConfiguraAlmacen.DSxAlmacen
    PanelEdicion = PNMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 312
    Top = 8
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 392
    Top = 8
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 312
    Top = 64
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 392
    Top = 64
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
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 440
    Top = 8
  end
end
