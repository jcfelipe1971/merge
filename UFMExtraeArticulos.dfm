inherited FMExtraeArticulos: TFMExtraeArticulos
  Left = 541
  Top = 318
  Caption = 'Distribucion de los art'#237'culos en el almac'#233'n'
  ClientHeight = 373
  ClientWidth = 632
  PopupMenu = CELotesUbicacionDisponiblePMEdit
  Position = poDefault
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 632
    Height = 349
    inherited TBMain: TLFToolBar
      Width = 628
      TabOrder = 1
      object LBArticulo: TLFLabel [0]
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
      object DBEArticulo: TLFDbedit [1]
        Left = 57
        Top = 0
        Width = 89
        Height = 22
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = DMExtraeArticulos.DSxArticulos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object TBSeparador: TToolButton [2]
        Left = 146
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object DBEDescripcion: TLFDbedit [3]
        Left = 154
        Top = 0
        Width = 239
        Height = 22
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMExtraeArticulos.DSxArticulos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      inherited EPMain: THYMEditPanel
        Left = 393
        Width = 24
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      object TButtAceptar: TToolButton
        Left = 417
        Top = 0
        Hint = 'Aceptar Distribuci'#243'n'
        Caption = 'Aceptar Distribuci'#243'n'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 628
      Height = 319
      ActivePage = TSUbicacion
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSUbicacion: TTabSheet
        Caption = 'Ubicacion'
        object TBNav: TLFToolBar
          Left = 0
          Top = 0
          Width = 620
          Height = 22
          Flat = True
          TabOrder = 0
          Separators = True
          object NavMain: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMExtraeArticulos.DSQMDistribucion
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
          Width = 620
          Height = 269
          Align = alClient
          DataSource = DMExtraeArticulos.DSQMDistribucion
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
          Transaction = DMExtraeArticulos.TLocal
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
      object TSNroSerie: TTabSheet
        Caption = 'Nro. Serie'
        ImageIndex = 1
      end
      object TSLotes: TTabSheet
        Caption = 'Lotes'
        ImageIndex = 2
        object SplitterLotes: TSplitter
          Left = 0
          Top = 156
          Width = 620
          Height = 7
          Cursor = crVSplit
          Align = alTop
        end
        object PNLLotesDisponibles: TLFPanel
          Left = 0
          Top = 0
          Width = 620
          Height = 156
          Align = alTop
          TabOrder = 0
          object TBLotesDisponibles: TLFToolBar
            Left = 1
            Top = 1
            Width = 618
            Height = 29
            TabOrder = 0
            Separators = True
            object NavLotesDisponibles: THYMNavigator
              Left = 0
              Top = 2
              Width = 232
              Height = 22
              DataSource = DMExtraeArticulos.DSQMLotesDisponibles
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              ParentShowHint = False
              PopupMenu = CELotesPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CELotesDisponibles
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGLotesDisponibles: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 618
            Height = 125
            Align = alClient
            DataSource = DMExtraeArticulos.DSQMLotesDisponibles
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGLotesDisponiblesDblClick
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
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CANT_SELECCIONAR'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANTIDAD'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LOTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CADUCIDAD'
                ReadOnly = True
                Width = 95
                Visible = True
              end>
          end
        end
        object PNLLotesSeleccionados: TLFPanel
          Left = 0
          Top = 163
          Width = 620
          Height = 128
          Align = alClient
          TabOrder = 1
          object TBLotesSeleccionados: TLFToolBar
            Left = 1
            Top = 1
            Width = 618
            Height = 29
            TabOrder = 0
            Separators = True
            object NavLotesSeleccionados: THYMNavigator
              Left = 0
              Top = 2
              Width = 234
              Height = 22
              DataSource = DMExtraeArticulos.DSQMLotesSeleccionados
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
              ParentShowHint = False
              PopupMenu = CELotesSeleccionadosPMEdit
              ConfirmDelete = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CELotesSeleccionados
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGLotesSeleccionados: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 618
            Height = 97
            Align = alClient
            DataSource = DMExtraeArticulos.DSQMLotesSeleccionados
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGLotesSeleccionadosDblClick
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
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CANT_SELECCIONAR'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANTIDAD'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LOTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CADUCIDAD'
                ReadOnly = True
                Width = 95
                Visible = True
              end>
          end
        end
      end
      object TSLotesUbicacion: TTabSheet
        Caption = 'Lotes/Ubic.'
        ImageIndex = 3
        object SplitterLotesUbicacion: TSplitter
          Left = 0
          Top = 156
          Width = 620
          Height = 7
          Cursor = crVSplit
          Align = alTop
        end
        object PNLLotesUbicacionDisponibles: TLFPanel
          Left = 0
          Top = 0
          Width = 620
          Height = 156
          Align = alTop
          TabOrder = 0
          object DBGLotesUbicacionesDisponibles: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 618
            Height = 125
            Align = alClient
            DataSource = DMExtraeArticulos.DSQMLotesUbicacionDisponibles
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGLotesUbicacionesDisponiblesDblClick
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
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CANT_SELECCIONAR'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANTIDAD'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LOTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CADUCIDAD'
                ReadOnly = True
                Width = 95
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID_UBICACION'
                ReadOnly = True
                Width = 40
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
          object TBLotesUbicacionDisponibles: TLFToolBar
            Left = 1
            Top = 1
            Width = 618
            Height = 29
            TabOrder = 1
            Separators = True
            object NavLotesUbicacionDisponibles: THYMNavigator
              Left = 0
              Top = 2
              Width = 232
              Height = 22
              DataSource = DMExtraeArticulos.DSQMLotesUbicacionDisponibles
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              ParentShowHint = False
              PopupMenu = CELotesUbicacionDisponiblePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CELotesUbicacionDisponible
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
        end
        object PNLLotesUbicacionSeleccionados: TLFPanel
          Left = 0
          Top = 163
          Width = 620
          Height = 128
          Align = alClient
          TabOrder = 1
          object TBLotesUbicacionSeleccionados: TLFToolBar
            Left = 1
            Top = 1
            Width = 618
            Height = 29
            TabOrder = 0
            Separators = True
            object NavLotesUbicacionSeleccionados: THYMNavigator
              Left = 0
              Top = 2
              Width = 234
              Height = 22
              DataSource = DMExtraeArticulos.DSQMLotesUbicacionSeleccionados
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
              ParentShowHint = False
              PopupMenu = CELotesUbicacionSeleccionadosPMEdit
              ConfirmDelete = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CELotesUbicacionSeleccionados
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGLotesUbicacionesSeleccionados: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 618
            Height = 97
            Align = alClient
            DataSource = DMExtraeArticulos.DSQMLotesUbicacionSeleccionados
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGLotesUbicacionesSeleccionadosDblClick
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
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CANT_SELECCIONAR'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANTIDAD'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LOTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CADUCIDAD'
                ReadOnly = True
                Width = 95
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID_UBICACION'
                ReadOnly = True
                Width = 40
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
        end
      end
      object TSNroSerieUbicacion: TTabSheet
        Caption = 'Nro. Serie/Ubicacion'
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 349
    Width = 632
  end
  inherited CEMain: TControlEdit
    Left = 392
    Top = 104
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 104
  end
  inherited FSMain: TLFFibFormStorage
    Left = 356
    Top = 104
  end
  object CELotesDisponibles: TControlEdit
    PopUpMenu = CELotesPMEdit
    Teclas = DMMain.Teclas
    Left = 392
    Top = 136
  end
  object CELotesPMEdit: TPopUpTeclas
    Left = 424
    Top = 136
    object CELotesDisponiblesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesDisponiblesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesDisponiblesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesDisponiblesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesDisponiblesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CELotesDisponiblesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CELotesDisponiblesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELotesDisponiblesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELotesDisponiblesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELotesDisponiblesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CELotesSeleccionados: TControlEdit
    PopUpMenu = CELotesSeleccionadosPMEdit
    Teclas = DMMain.Teclas
    Left = 392
    Top = 168
  end
  object CELotesSeleccionadosPMEdit: TPopUpTeclas
    Left = 424
    Top = 168
    object CELotesSeleccionadosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesSeleccionadosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesSeleccionadosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesSeleccionadosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesSeleccionadosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CELotesSeleccionadosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CELotesSeleccionadosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELotesSeleccionadosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELotesSeleccionadosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELotesSeleccionadosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CELotesUbicacionSeleccionados: TControlEdit
    PopUpMenu = CELotesUbicacionSeleccionadosPMEdit
    Teclas = DMMain.Teclas
    Left = 392
    Top = 232
  end
  object CELotesUbicacionSeleccionadosPMEdit: TPopUpTeclas
    Left = 424
    Top = 232
    object CELotesUbicacionSeleccionadosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesUbicacionSeleccionadosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesUbicacionSeleccionadosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesUbicacionSeleccionadosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesUbicacionSeleccionadosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CELotesUbicacionSeleccionadosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CELotesUbicacionSeleccionadosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELotesUbicacionSeleccionadosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELotesUbicacionSeleccionadosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELotesUbicacionSeleccionadosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CELotesUbicacionDisponible: TControlEdit
    PopUpMenu = CELotesUbicacionDisponiblePMEdit
    Teclas = DMMain.Teclas
    Left = 392
    Top = 200
  end
  object CELotesUbicacionDisponiblePMEdit: TPopUpTeclas
    Left = 424
    Top = 200
    object CELotesUbicacionDisponibleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesUbicacionDisponibleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesUbicacionDisponibleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesUbicacionDisponibleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesUbicacionDisponibleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CELotesUbicacionDisponibleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CELotesUbicacionDisponibleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CELotesUbicacionDisponibleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CELotesUbicacionDisponibleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CELotesUbicacionDisponibleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
