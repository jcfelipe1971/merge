object ZFMArtLonas: TZFMArtLonas
  Left = 211
  Top = 208
  Width = 512
  Height = 316
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Datos especiales de Lonas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlDetalle: TLFPanel
    Left = 0
    Top = 31
    Width = 504
    Height = 258
    Align = alClient
    TabOrder = 0
    object DBGFDetalle: TDBGridFind2000
      Left = 1
      Top = 26
      Width = 502
      Height = 231
      Align = alClient
      DataSource = ZDMArtLonas.DSQMLonasDet
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'DETALLE'
        'ESCANDALLO_DEF')
      CamposAMostrar.Strings = (
        'DETALLE'
        '0'
        'ESCANDALLO_DEF'
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
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      MensajeNoExiste = False
      Numericos.Strings = (
        'ARTICULO'
        'ESCANDALLO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'ART_ARTICULOS'
        'PRO_ESCANDALLO')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'COMPUESTO')
      Posicion = tpCentrado
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        'ESCANDALLO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TipoArt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DETALLE'
          Width = 77
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescArt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 262
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESCANDALLO_DEF'
          Width = 60
          Visible = True
        end>
    end
    object TBDet: TLFToolBar
      Left = 1
      Top = 1
      Width = 502
      Height = 25
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = ZDMArtLonas.DSQMLonasDet
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFDetalle
        InsertaControl = DBGFDetalle
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TSepNav: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtClose: TToolButton
        Left = 248
        Top = 0
        Hint = 'Cerrar Ventana'
        Caption = 'Cerrar Ventana'
        ImageIndex = 0
        OnClick = TButtCloseClick
      end
    end
  end
  object PnlCab: TLFPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 31
    Align = alTop
    TabOrder = 1
    object LblLona: TLFLabel
      Left = 13
      Top = 8
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lona'
    end
    object EDescLona: TLFEdit
      Left = 127
      Top = 5
      Width = 242
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'EDescLona'
    end
    object ELona: TLFEdit
      Left = 41
      Top = 5
      Width = 85
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'ELona'
    end
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 336
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 336
    Top = 32
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
