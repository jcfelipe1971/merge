inherited FMUbicaArticulo: TFMUbicaArticulo
  Left = 384
  Top = 386
  Width = 609
  Height = 453
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Distribuci'#243'n del art'#237'culo en el almac'#233'n'
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 599
    Height = 400
    inherited TBMain: TLFToolBar
      Width = 595
      Height = 28
      ButtonHeight = 24
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 88
        Height = 24
        DataSource = DMUbicaArticulo.DSxArticulos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 23
        Height = 24
        DataSource = DMConfiguraAlmacen.DSxAlmacen
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 119
      end
      inherited TbuttComp: TToolButton
        Left = 127
      end
    end
    object PNL_Busca_Articulo: TLFPanel
      Left = 2
      Top = 30
      Width = 595
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object LBAlmacenOrigen: TLFLabel
        Left = 15
        Top = 8
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBETitArticuloOrig: TLFDbedit
        Left = 162
        Top = 5
        Width = 388
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMUbicaArticulo.DSxArticulos
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
      object DBEArticuloOrig: TLFDbedit
        Left = 66
        Top = 5
        Width = 95
        Height = 21
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = DMUbicaArticulo.DSxArticulos
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
    object PNFicha: TLFPanel
      Left = 2
      Top = 61
      Width = 595
      Height = 337
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 595
        Height = 24
        AutoSize = True
        ButtonHeight = 24
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 240
          Height = 24
          DataSource = DMUbicaArticulo.DSQMArticuloUbicacion
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
      object DBGFMain: TDBGridFind2000
        Left = 0
        Top = 24
        Width = 595
        Height = 313
        Hint = 'El control de prioridades es de mayor a menor'
        Align = alClient
        DataSource = DMUbicaArticulo.DSQMArticuloUbicacion
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFMainColEnter
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 1
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
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        Campos.Strings = (
          'COMPOSICION')
        CamposAMostrar.Strings = (
          'COMPOSICION'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0')
        CamposADevolver.Strings = (
          '')
        CamposDesplegar.Strings = (
          '1')
        CampoAOrdenarColor = clInfoBk
        CamposAOrdernar.Strings = (
          'PRIORIDAD')
        CamposNoAccesibles.Strings = (
          'ARTICULO'
          'EMPRESA'
          'ID_A'
          'ID_UBICACION'
          'LINEA'
          'TITULO_DESCRIPCION')
        MensajeNoExiste = False
        Numericos.Strings = (
          'COMPOSICION')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'ART_ALMACENES_UBICACIONES')
        Acciones.Strings = (
          '')
        Titulos.Strings = (
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGFMainBusqueda
        Planes.Strings = (
          '')
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPOSICION'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_DESCRIPCION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 314
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIORIDAD'
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 400
    Width = 599
  end
  inherited CEMain: TControlEdit
    DataSource = DMConfiguraAlmacen.DSxAlmacen
    PanelEdicion = PMain
    Left = 312
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 392
    Top = 8
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
  inherited FSMain: TLFFibFormStorage
    Left = 234
    Top = 16
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 488
    Top = 16
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 560
    Top = 16
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
