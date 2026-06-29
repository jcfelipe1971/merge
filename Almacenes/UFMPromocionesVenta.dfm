inherited FMPromocionesVenta: TFMPromocionesVenta
  Left = 370
  Top = 298
  Width = 798
  Height = 473
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Promociones Venta'
  OldCreateOrder = True
  PopupMenu = CEArticuloPMEdit
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 788
    Height = 420
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 784
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      inherited EPMain: THYMEditPanel
        Width = 56
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object TSep1: TToolButton
        Left = 56
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBTipoPromocion: TLFComboBox
        Left = 64
        Top = 0
        Width = 196
        Height = 21
        Style = csDropDownList
        DropDownCount = 11
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBTipoPromocionChange
        Items.Strings = (
          'Elija Tipo de Promoci'#243'n:'
          'Promoci'#243'n Familia'
          'Promoci'#243'n Cliente'
          'Promoci'#243'n Agrupaci'#243'n'
          'Promoci'#243'n Art'#237'culo')
      end
    end
    object PCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 784
      Height = 79
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PCliente: TLFPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 36
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LCliente: TLFLabel
          Left = 65
          Top = 11
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object SBACliente: TSpeedButton
          Left = 496
          Top = 7
          Width = 23
          Height = 22
          Hint = 'Ctrl+Alt+T'
          Action = ACliente
          AllowAllUp = True
          ParentShowHint = False
          ShowHint = False
          OnDblClick = AClienteExecute
        end
        object EFCliente: TLFEditFind2000
          Left = 103
          Top = 7
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitCliente: TLFDbedit
          Left = 168
          Top = 7
          Width = 320
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMPromocionesVenta.DSxCliente
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnDblClick = AClienteExecute
        end
      end
      object PAgrupaciones: TLFPanel
        Left = 0
        Top = 36
        Width = 784
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LAgrupacion: TLFLabel
          Left = 26
          Top = 11
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agrup. Clientes'
        end
        object EFAgrupacion: TLFEditFind2000
          Left = 103
          Top = 7
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFAgrupacionChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGRUPACION'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'tipo='#39'C'#39
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGRUPACIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGRUPACION')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitAgrupaciones: TLFDbedit
          Left = 168
          Top = 7
          Width = 320
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMPromocionesVenta.DSxAgrupacion
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
    end
    object PCDetalle: TLFPageControl
      Left = 2
      Top = 107
      Width = 784
      Height = 311
      ActivePage = TSFamilia
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
      OnChange = PCDetalleChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFamilia: TTabSheet
        Caption = 'TSFamilia'
        OnShow = TSFamiliaShow
        object TBFamilia: TLFToolBar
          Left = 0
          Top = 0
          Width = 776
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavFamilia: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMPromocionesVenta.DSQMFamilia
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFamiliaPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFFamilia
            InsertaControl = DBGFFamilia
            Exclusivo = True
            ControlEdit = CEFamilia
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFFamilia: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 776
          Height = 259
          Align = alClient
          DataSource = DMPromocionesVenta.DSQMFamilia
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFColEnter
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
          Transaction = DMPromocionesVenta.TLocal
          BuscarNums = False
          Campos.Strings = (
            'TARIFA'
            'PROMOCION'
            'FAMILIA')
          CamposAMostrar.Strings = (
            'TARIFA'
            '0'
            'PROMOCION'
            '0'
            'FAMILIA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          CamposNoAccesibles.Strings = (
            'TITULO_ARTICULO'
            'TITULO_PROMOCION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'TARIFA'
            'ARTICULO'
            'FAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_TARIFAS_ARTICULO'
            'VER_ARTICULOS_EF'
            'ART_FAMILIAS')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_FAMILIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROMOCION'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_PROMOCION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UDS_PROMOCION'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_BAJA'
              Visible = True
            end>
        end
      end
      object TSCliFam: TTabSheet
        Caption = 'Familia'
        ImageIndex = 1
        OnShow = TSCliFamShow
        object DBGFCliFam: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 776
          Height = 259
          Align = alClient
          DataSource = DMPromocionesVenta.DSQMCliFam
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFColEnter
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
          Transaction = DMPromocionesVenta.TLocal
          BuscarNums = False
          Campos.Strings = (
            'TARIFA'
            'PROMOCION'
            'FAMILIA')
          CamposAMostrar.Strings = (
            'TARIFA'
            '0'
            'PROMOCION'
            '0'
            'FAMILIA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          CamposNoAccesibles.Strings = (
            'TITULO_ARTICULO'
            'TITULO_PROMOCION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'TARIFA'
            'ARTICULO'
            'FAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_TARIFAS_ARTICULO'
            'VER_ARTICULOS_EF'
            'ART_FAMILIAS')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 44
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_FAMILIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 234
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROMOCION'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_PROMOCION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UDS_PROMOCION'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_BAJA'
              Visible = True
            end>
        end
        object TBCliFam: TLFToolBar
          Left = 0
          Top = 0
          Width = 776
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object NavCliFam: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMPromocionesVenta.DSQMCliFam
            Flat = True
            ParentShowHint = False
            PopupMenu = CECliFamPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCliFam
            InsertaControl = DBGFCliFam
            OnClickBefore = NavCliClickBefore
            Exclusivo = True
            ControlEdit = CECliFam
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSCliArt: TTabSheet
        Caption = 'Art'#237'culo'
        ImageIndex = 2
        OnShow = TSCliArtShow
        object TBCliArt: TLFToolBar
          Left = 0
          Top = 0
          Width = 776
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCliArt: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMPromocionesVenta.DSQMCliArt
            Flat = True
            ParentShowHint = False
            PopupMenu = CECliArtPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCliArt
            InsertaControl = DBGFCliArt
            OnClickBefore = NavCliClickBefore
            Exclusivo = True
            ControlEdit = CECliArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCliArt: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 776
          Height = 259
          Align = alClient
          DataSource = DMPromocionesVenta.DSQMCliArt
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFColEnter
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
          Transaction = DMPromocionesVenta.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO'
            'TARIFA'
            'PROMOCION')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0'
            'TARIFA'
            '0'
            'PROMOCION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          CamposNoAccesibles.Strings = (
            'TITULO_ARTICULO'
            'TITULO_PROMOCION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO'
            'TARIFA'
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF'
            'VER_TARIFAS_ARTICULO'
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 270
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROMOCION'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_PROMOCION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UDS_PROMOCION'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_BAJA'
              Visible = True
            end>
        end
      end
      object TSAgrFam: TTabSheet
        Caption = 'Familia'
        ImageIndex = 3
        OnShow = TSAgrFamShow
        object DBGFAgrFam: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 776
          Height = 259
          Align = alClient
          DataSource = DMPromocionesVenta.DSQMAgrFam
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFColEnter
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
          Transaction = DMPromocionesVenta.TLocal
          BuscarNums = False
          Campos.Strings = (
            'TARIFA'
            'PROMOCION'
            'FAMILIA')
          CamposAMostrar.Strings = (
            'TARIFA'
            '0'
            'PROMOCION'
            '0'
            'FAMILIA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          CamposNoAccesibles.Strings = (
            'TITULO_ARTICULO'
            'TITULO_PROMOCION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'TARIFA'
            'ARTICULO'
            'FAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_TARIFAS_ARTICULO'
            'VER_ARTICULOS_EF'
            'ART_FAMILIAS')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 43
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_FAMILIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROMOCION'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_PROMOCION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UDS_PROMOCION'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_PROMO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_BAJA'
              Visible = True
            end>
        end
        object TBAgrFam: TLFToolBar
          Left = 0
          Top = 0
          Width = 776
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object NavAgrFam: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMPromocionesVenta.DSQMAgrFam
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrFamPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFAgrFam
            InsertaControl = DBGFAgrFam
            OnClickBefore = NavAgrClickBefore
            Exclusivo = True
            ControlEdit = CEAgrFam
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSAgrArt: TTabSheet
        Caption = 'Art'#237'culo'
        OnShow = TSAgrArtShow
        object DBGFAgrArt: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 776
          Height = 259
          Align = alClient
          DataSource = DMPromocionesVenta.DSQMAgrArt
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFColEnter
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
          Transaction = DMPromocionesVenta.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO'
            'TARIFA'
            'PROMOCION')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0'
            'TARIFA'
            '0'
            'PROMOCION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          CamposNoAccesibles.Strings = (
            'TITULO_ARTICULO'
            'TITULO_PROMOCION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO'
            'TARIFA'
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF'
            'VER_TARIFAS_ARTICULO'
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 270
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROMOCION'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_PROMOCION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UDS_PROMOCION'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_BAJA'
              Visible = True
            end>
        end
        object TBAgrArt: TLFToolBar
          Left = 0
          Top = 0
          Width = 776
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object NavAgrArt: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMPromocionesVenta.DSQMAgrArt
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrArtPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFAgrArt
            InsertaControl = DBGFAgrArt
            OnClickBefore = NavAgrClickBefore
            Exclusivo = True
            ControlEdit = CEAgrArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSArticulo: TTabSheet
        Caption = 'TSArticulo'
        OnShow = TSArticuloShow
        object DBGFArticulo: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 776
          Height = 259
          Align = alClient
          DataSource = DMPromocionesVenta.DSQMArticulo
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFColEnter
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
          Transaction = DMPromocionesVenta.TLocal
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO'
            'TARIFA'
            'PROMOCION')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0'
            'TARIFA'
            '0'
            'PROMOCION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          CamposNoAccesibles.Strings = (
            'TITULO_ARTICULO'
            'TITULO_PROMOCION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO'
            'TARIFA'
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tablas.Strings = (
            'VER_ARTICULOS_EF'
            'VER_TARIFAS_ARTICULO'
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 270
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROMOCION'
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_PROMOCION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UDS_PROMOCION'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO1_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO2_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO3_PROMO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_BAJA'
              Visible = True
            end>
        end
        object TBArticulo: TLFToolBar
          Left = 0
          Top = 0
          Width = 776
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object NavArticulo: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMPromocionesVenta.DSQMArticulo
            Flat = True
            ParentShowHint = False
            PopupMenu = CEArticuloPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFArticulo
            InsertaControl = DBGFArticulo
            Exclusivo = True
            ControlEdit = CEArticulo
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 420
    Width = 788
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 160
    Top = 272
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 160
    Top = 304
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 566
    Top = 16
    object ADetPromo: TAction
      Category = 'Otros'
      Caption = 'Detalle de Promociones'
      Hint = 'Detalles de Promociones'
      ImageIndex = 97
      OnExecute = ADetPromoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 390
    Top = 2
  end
  object AL: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 352
    Top = 2
    object ACliente: TAction
      Caption = 'ACliente'
      Hint = 'Para Abrir el Maestro de Cliente: Ctrl+ALT+T '
      ShortCut = 49236
      OnExecute = AClienteExecute
    end
  end
  object CEFamilia: TControlEdit
    SubComplementario = ALMain
    PopUpMenu = CEFamiliaPMEdit
    Teclas = DMMain.Teclas
    Left = 259
    Top = 277
  end
  object CEFamiliaPMEdit: TPopUpTeclas
    Left = 259
    Top = 306
    object CEFamiliaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEFamiliaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFamiliaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFamiliaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEFamiliaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEFamiliaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEFamiliaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFamiliaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFamiliaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFamiliaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECliFam: TControlEdit
    PopUpMenu = CECliFamPMEdit
    Teclas = DMMain.Teclas
    Left = 295
    Top = 277
  end
  object CECliFamPMEdit: TPopUpTeclas
    Left = 295
    Top = 307
    object CECliFamMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECliFamMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECliFamMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECliFamMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECliFamMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECliFamMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECliFamMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECliFamMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECliFamMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECliFamMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECliArt: TControlEdit
    PopUpMenu = CECliArtPMEdit
    Teclas = DMMain.Teclas
    Left = 338
    Top = 278
  end
  object CECliArtPMEdit: TPopUpTeclas
    Left = 338
    Top = 307
    object CECliArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECliArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECliArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECliArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECliArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECliArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECliArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECliArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECliArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECliArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEAgrFam: TControlEdit
    PopUpMenu = CEAgrFamPMEdit
    Teclas = DMMain.Teclas
    Left = 376
    Top = 278
  end
  object CEAgrFamPMEdit: TPopUpTeclas
    Left = 376
    Top = 308
    object CEAgrFamMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrFamMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrFamMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrFamMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrFamMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEAgrFamMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEAgrFamMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAgrFamMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAgrFamMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAgrFamMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEAgrArt: TControlEdit
    PopUpMenu = CEAgrArtPMEdit
    Teclas = DMMain.Teclas
    Left = 416
    Top = 279
  end
  object CEAgrArtPMEdit: TPopUpTeclas
    Left = 416
    Top = 310
    object CEAgrArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEAgrArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEAgrArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAgrArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAgrArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAgrArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEArticulo: TControlEdit
    PopUpMenu = CEArticuloPMEdit
    Teclas = DMMain.Teclas
    Left = 456
    Top = 280
  end
  object CEArticuloPMEdit: TPopUpTeclas
    Left = 456
    Top = 312
    object CEArticuloMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEArticuloMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEArticuloMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEArticuloMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEArticuloMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEArticuloMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEArticuloMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEArticuloMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEArticuloMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEArticuloMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
