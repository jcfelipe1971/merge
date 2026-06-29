object FMMovStockUbicaciones: TFMMovStockUbicaciones
  Left = 961
  Top = 429
  Width = 640
  Height = 400
  Caption = 'Distribucion de los art'#237'culos en el almac'#233'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CELotesPMEdit
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLotes: TLFPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 373
    Align = alClient
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 630
      Height = 22
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object LBArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 57
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DBEArticulo: TLFDbedit
        Left = 57
        Top = 0
        Width = 89
        Height = 22
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = DMMovStockUbicaciones.DSxArticulos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEDescripcion: TLFDbedit
        Left = 146
        Top = 0
        Width = 239
        Height = 22
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMMovStockUbicaciones.DSxArticulos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object TBSeparador: TToolButton
        Left = 385
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object EFDistribucion: THYMEditPanel
        Left = 393
        Top = 0
        Width = 22
        Height = 22
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 2
        Flat = True
        Exclusivo = True
      end
      object TButtAceptar: TToolButton
        Left = 415
        Top = 0
        Hint = 'Aceptar Distribuci'#243'n'
        Caption = 'Aceptar Distribuci'#243'n'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
    end
    object PCMain: TLFPageControl
      Left = 1
      Top = 23
      Width = 630
      Height = 349
      ActivePage = TSUbicacion
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSUbicacion: TTabSheet
        Caption = 'Ubicacion'
        object TBNav: TLFToolBar
          Left = 0
          Top = 0
          Width = 622
          Height = 22
          Flat = True
          TabOrder = 0
          Separators = True
          object NavMain: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMMovStockUbicaciones.DSQMDistribucion
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEMain
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFDistribuye: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 622
          Height = 299
          Align = alClient
          DataSource = DMMovStockUbicaciones.DSQMDistribucion
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
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
          BuscarNums = False
          Campos.Strings = (
            'UBICACION')
          CamposAMostrar.Strings = (
            'UBICACION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CamposNoAccesibles.Strings = (
            'ID_A'
            'ID_DETALLES'
            'LINEA'
            'ARTICULO'
            'TIPO')
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
          OnBusqueda = DBGFDistribuyeBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'COMPOSICION')
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_UBICACION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UBICACION'
              Width = 145
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
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VOLUMEN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DIAMETRO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 65
              Visible = True
            end>
        end
      end
      object TSLotes: TTabSheet
        Caption = 'Lotes'
        ImageIndex = 2
        object LFToolBar1: TLFToolBar
          Left = 0
          Top = 0
          Width = 622
          Height = 22
          Flat = True
          TabOrder = 0
          Separators = True
          object HYMNavigator1: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMMovStockUbicaciones.DSQMLotes
            Flat = True
            ParentShowHint = False
            PopupMenu = CELotesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CELotes
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGLotes: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 622
          Height = 299
          Align = alClient
          DataSource = DMMovStockUbicaciones.DSQMLotes
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
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
          BuscarNums = False
          Campos.Strings = (
            'UBICACION')
          CamposAMostrar.Strings = (
            'UBICACION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CamposNoAccesibles.Strings = (
            'ID_A'
            'ID_DETALLES'
            'LINEA'
            'ARTICULO'
            'TIPO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'COMPOSICION')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_UBICACIONES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO_DESCRIPCION')
          Posicion = tpCentrado
          OnBusqueda = DBGFDistribuyeBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CADUCIDAD'
              Visible = True
            end>
        end
      end
      object TSNroSerie: TTabSheet
        Caption = 'Nro. Serie'
        ImageIndex = 3
      end
      object TSLotesUbicacion: TTabSheet
        Caption = 'Lotes/Ubic.'
        ImageIndex = 1
        object DBGLotesUbicaciones: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 622
          Height = 299
          Align = alClient
          DataSource = DMMovStockUbicaciones.DSQMLoteUbicacion
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
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          Transaction = DMMovStockUbicaciones.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ID_UBICACION')
          CamposAMostrar.Strings = (
            'ID_UBICACION'
            '1'
            'COMPOSICION')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          Numericos.Strings = (
            'ID_UBICACION')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_ALMACENES_UBICACIONES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGLotesUbicacionesBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ID_UBICACION')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CADUCIDAD'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_UBICACION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CALLE'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTANTERIA'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REPISA'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'POSICION'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Visible = True
            end>
        end
        object TBLotesUbicacion: TLFToolBar
          Left = 0
          Top = 0
          Width = 622
          Height = 22
          Flat = True
          TabOrder = 1
          Separators = True
          object NavLotesUbicacion: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMMovStockUbicaciones.DSQMLoteUbicacion
            Flat = True
            ParentShowHint = False
            PopupMenu = CELotesUbicacionPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CELotesUbicacion
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSNroSerieUbicacion: TTabSheet
        Caption = 'Nro. Serie/Ubicacion'
      end
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 328
    Top = 72
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 80
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
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
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
    Left = 284
    Top = 74
  end
  object CELotesUbicacion: TControlEdit
    PopUpMenu = CELotesUbicacionPMEdit
    Teclas = DMMain.Teclas
    Left = 328
    Top = 104
  end
  object CELotesUbicacionPMEdit: TPopUpTeclas
    Left = 424
    Top = 112
    object CELotesUbicacionMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesUbicacionMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesUbicacionMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesUbicacionMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesUbicacionMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CELotesUbicacionMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CELotesUbicacionMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELotesUbicacionMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELotesUbicacionMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELotesUbicacionMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CELotes: TControlEdit
    PopUpMenu = CELotesPMEdit
    Teclas = DMMain.Teclas
    Left = 328
    Top = 136
  end
  object CELotesPMEdit: TPopUpTeclas
    Left = 424
    Top = 144
    object CELotesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CELotesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CELotesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELotesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELotesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELotesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
