inherited FMCondicionesVenta: TFMCondicionesVenta
  Left = 438
  Top = 210
  Width = 768
  Height = 475
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Condiciones Venta'
  OldCreateOrder = True
  PopupMenu = CECondCliFamPMEdit
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 422
    inherited TBMain: TLFToolBar
      Width = 754
      object CBTipoCondicion: TLFComboBox [0]
        Left = 0
        Top = 0
        Width = 196
        Height = 21
        Style = csDropDownList
        DropDownCount = 11
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBTipoCondicionChange
        Items.Strings = (
          'Elija Tipo de Condici'#243'n Especial:'
          'Cond. Cliente'
          'Cond. Art'#237'culo'
          'Cond. Familia'
          'Cond. Perfil'
          'Cond. Agrupaci'#243'n Cli.'
          'Cond. Agrupaci'#243'n Art.'
          '')
      end
      object ToolButton1: TToolButton [1]
        Left = 196
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 204
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    object PCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 754
      Height = 107
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PCliente: TLFPanel
        Left = 0
        Top = 0
        Width = 754
        Height = 36
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LCliente: TLFLabel
          Left = 67
          Top = 11
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object SBACliente: TSpeedButton
          Left = 496
          Top = 7
          Width = 49
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
          DataField = 'NOMBRE_COMERCIAL'
          DataSource = DMCondicionesVenta.DSQMCondCli
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
      object PPerfil: TLFPanel
        Left = 0
        Top = 36
        Width = 754
        Height = 36
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LPerfil: TLFLabel
          Left = 75
          Top = 11
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'Perfil'
        end
        object G2kTableLoc: TG2KTBLoc
          Left = 32
          Top = 0
          Hint = 'Localizar'
          Caption = 'G2kTableLoc'
          ImageIndex = 81
          Base_de_datos = DMMain.DataBase
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFPerfil: TLFEditFind2000
          Left = 103
          Top = 7
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFPerfilChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PERFIL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_PERFILES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PERFIL')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitPerfil: TLFDbedit
          Left = 168
          Top = 7
          Width = 320
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMCondicionesVenta.DSPer
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
      object PAgrupaciones: TLFPanel
        Left = 0
        Top = 72
        Width = 754
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object LAgrupCliente: TLFLabel
          Left = 45
          Top = 11
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agrupacion'
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
          DataSource = DMCondicionesVenta.DSAgr
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
      Top = 135
      Width = 754
      Height = 285
      ActivePage = TSCondAgrArticulos
      Align = alClient
      OwnerDraw = True
      TabIndex = 10
      TabOrder = 2
      OnChange = PCDetalleChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCondCliArt: TTabSheet
        Caption = 'Art'#237'culo'
        OnShow = TSCondCliArtShow
        object TBCondCliArt: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondCliArt: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSQMCondArt
            Flat = True
            ParentShowHint = False
            PopupMenu = CECliArtPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondCliArt
            InsertaControl = DBGFCondCliArt
            OnClickBefore = NavCondCliArtClickBefore
            Exclusivo = True
            ControlEdit = CECondCliArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondCliArt: TDBGridFind2000
          Left = 0
          Top = 49
          Width = 746
          Height = 208
          Align = alClient
          DataSource = DMCondicionesVenta.DSQMCondCliArt
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
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondCliArtBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
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
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 80
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
        object PnlModeloArticulos: TLFPanel
          Left = 0
          Top = 24
          Width = 746
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LModelo: TLFLabel
            Left = 17
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LPrecio: TLFLabel
            Left = 151
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LDesc1: TLFLabel
            Left = 236
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 1'
          end
          object LDesc2: TLFLabel
            Left = 330
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 2'
          end
          object LDesc3: TLFLabel
            Left = 424
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 3'
          end
          object EFModelo: TLFEditFind2000
            Left = 56
            Top = 3
            Width = 89
            Height = 21
            TabOrder = 0
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoADevolver = 'REF_PROVEEDOR'
            CampoNum = 'REF_PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'REF_PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EPrecio: TLFEdit
            Left = 185
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 1
            Text = '0'
          end
          object EDesc1: TLFEdit
            Left = 276
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object EDesc2: TLFEdit
            Left = 371
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 3
            Text = '0'
          end
          object EDesc3: TLFEdit
            Left = 465
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 4
            Text = '0'
          end
          object btnAgregaCondicionesVenta: TButton
            Left = 528
            Top = 2
            Width = 105
            Height = 22
            Action = AAgregaCondicionesVenta
            TabOrder = 5
          end
          object btnEliminaCondicionesVenta: TButton
            Left = 640
            Top = 2
            Width = 105
            Height = 22
            Action = AEliminaCondicionesCliente
            TabOrder = 6
          end
        end
      end
      object TSCondCliFam: TTabSheet
        Caption = 'Familia'
        ImageIndex = 1
        OnShow = TSCondCliFamShow
        object TBCondCliFam: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondCliFam: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSQMCondCliFam
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondCliFamPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondCliFam
            InsertaControl = DBGFCondCliFam
            OnClickBefore = NavCondCliFamClickBefore
            Exclusivo = True
            ControlEdit = CECondCliFam
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondCliFam: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSQMCondCliFam
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
          BuscarNums = False
          Campos.Strings = (
            'FAMILIA')
          CamposAMostrar.Strings = (
            'FAMILIA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'FAMILIA'
            'TITULO_FAMILIA')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'FAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_FAMILIAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondCliFamBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
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
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
      object TSCondArt: TTabSheet
        Caption = 'Art'#237'culo'
        ImageIndex = 2
        OnShow = TSCondArtShow
        object TBCondArt: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondArt: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSQMCondArt
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondArtPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondArt
            InsertaControl = DBGFCondArt
            Exclusivo = True
            ControlEdit = CECondArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondArt: TDBGridFind2000
          Left = 0
          Top = 49
          Width = 746
          Height = 208
          Align = alClient
          DataSource = DMCondicionesVenta.DSQMCondArt
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
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondArtBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
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
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 80
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
        object PNLArticulosModelo: TLFPanel
          Left = 0
          Top = 24
          Width = 746
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LFArticuloModeloModelo: TLFLabel
            Left = 17
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LFArticuloModeloPrecio: TLFLabel
            Left = 151
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LFArticuloModeloDesc1: TLFLabel
            Left = 235
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 1'
          end
          object LFArticuloModeloDesc2: TLFLabel
            Left = 330
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 2'
          end
          object LFArticuloModeloDesc3: TLFLabel
            Left = 424
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 3'
          end
          object EFArticuloModeloModelo: TLFEditFind2000
            Left = 56
            Top = 3
            Width = 89
            Height = 21
            TabOrder = 0
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoADevolver = 'REF_PROVEEDOR'
            CampoNum = 'REF_PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'REF_PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFEArticuloModeloPrecio: TLFEdit
            Left = 185
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 1
            Text = '0'
          end
          object LFEArticuloModeloDesc1: TLFEdit
            Left = 276
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object LFEArticuloModeloDesc2: TLFEdit
            Left = 371
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 3
            Text = '0'
          end
          object LFEArticuloModeloDesc3: TLFEdit
            Left = 465
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 4
            Text = '0'
          end
          object BTNArticuloModeloAgrega: TButton
            Left = 528
            Top = 2
            Width = 105
            Height = 22
            Action = AAgregaCondionesArticuloModelo
            TabOrder = 5
          end
          object BTNArticuloModeloElimina: TButton
            Left = 640
            Top = 2
            Width = 105
            Height = 22
            Action = AEliminaCondicionesArticuloModelo
            TabOrder = 6
          end
        end
      end
      object TSCondFam: TTabSheet
        Caption = 'Familia'
        ImageIndex = 3
        OnShow = TSCondFamShow
        object TBCondFam: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondFam: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSQMCondFam
            Flat = True
            ParentShowHint = False
            PopupMenu = ControlEdit1PMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondFam
            InsertaControl = DBGFCondFam
            Exclusivo = True
            ControlEdit = CECondFam
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondFam: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSQMCondFam
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
          BuscarNums = False
          Campos.Strings = (
            'FAMILIA')
          CamposAMostrar.Strings = (
            'FAMILIA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'FAMILIA'
            'TITULO_FAMILIA')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'FAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_FAMILIAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondFamBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
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
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
      object TSCondPer: TTabSheet
        Caption = 'Perfil'
        OnShow = TSCondPerShow
        object TBCondPer: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondPer: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSQMCondPer
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondPerPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondPer
            InsertaControl = DBGFCondPer
            Exclusivo = True
            ControlEdit = CECondPer
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondPer: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSQMCondPer
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
          BuscarNums = False
          Campos.Strings = (
            'PERFIL')
          CamposAMostrar.Strings = (
            'PERFIL'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'PERFIL'
            'TITULO_PERFIL')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'PERFIL')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_PERFILES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'PERFIL'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_PERFIL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
      object TSCondPerArt: TTabSheet
        Caption = 'Art'#237'culo'
        OnShow = TSCondPerArtShow
        object TBCondPerArt: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondPerArt: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSCondPerArt
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondPerArtPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondPerArt
            InsertaControl = DBGFCondPerArt
            OnClickBefore = NavCondPerArtClickBefore
            Exclusivo = True
            ControlEdit = CECondPerArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondPerArt: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSCondPerArt
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
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondPerArtBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
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
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 80
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
      object TSCondPerFam: TTabSheet
        Caption = 'Familia'
        ImageIndex = 6
        OnShow = TSCondPerFamShow
        object TBCondPerFam: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondPerFam: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondPerFamPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondPerFam
            InsertaControl = DBGFCondPerFam
            OnClickBefore = NavCondPerFamClickBefore
            Exclusivo = True
            ControlEdit = CECondPerFam
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondPerFam: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSCondPerFam
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
          BuscarNums = False
          Campos.Strings = (
            'FAMILIA')
          CamposAMostrar.Strings = (
            'FAMILIA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'FAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_FAMILIAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondPerFamBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
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
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
      object TSCondAgr: TTabSheet
        Caption = 'Agrupaci'#243'n Clientes'
        ImageIndex = 7
        OnShow = TSCondAgrShow
        object TBCondAgr: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondAgr: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSCondAgr
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondAgrPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondAgr
            InsertaControl = DBGFCondAgr
            Exclusivo = True
            ControlEdit = CECondAgr
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondAgr: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSCondAgr
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
          BuscarNums = False
          Campos.Strings = (
            'AGRUPACION')
          CamposAMostrar.Strings = (
            'AGRUPACION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'AGRUPACION'
            'TITULO_AGRUPACION')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          CondicionBusqueda = 'Tipo = '#39'C'#39
          MensajeNoExiste = False
          Numericos.Strings = (
            'AGRUPACION')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_AGRUPACIONES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'AGRUPACION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_AGRUPACION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
      object TSCondAgrArt: TTabSheet
        Caption = 'Art'#237'culos'
        ImageIndex = 8
        OnShow = TSCondAgrArtShow
        object TBCondAgrArt: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondAgrArt: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSCondAgrArt
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondAgrArtPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondAgrArt
            InsertaControl = DBGFCondAgrArt
            OnClickBefore = NavCondAgrArtClickBefore
            Exclusivo = True
            ControlEdit = CECondAgrArt
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondAgrArt: TDBGridFind2000
          Left = 0
          Top = 49
          Width = 746
          Height = 208
          Align = alClient
          DataSource = DMCondicionesVenta.DSCondAgrArt
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
          BuscarNums = False
          Campos.Strings = (
            'ARTICULO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'TITULO_ARTICULO')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondAgrArtBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
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
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 80
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
        object PNLAgrArticulosModelo: TLFPanel
          Left = 0
          Top = 24
          Width = 746
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LAgrModelo: TLFLabel
            Left = 17
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LAgrPrecio: TLFLabel
            Left = 151
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LAgrDesc1: TLFLabel
            Left = 235
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 1'
          end
          object LAgrDesc2: TLFLabel
            Left = 330
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 2'
          end
          object LAgrDesc3: TLFLabel
            Left = 424
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc. 3'
          end
          object EFAgrArticuloModeloModelo: TLFEditFind2000
            Left = 56
            Top = 3
            Width = 89
            Height = 21
            TabOrder = 0
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoADevolver = 'REF_PROVEEDOR'
            CampoNum = 'REF_PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'REF_PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EAgrPrecio: TLFEdit
            Left = 185
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 1
            Text = '0'
          end
          object EAgrDesc1: TLFEdit
            Left = 276
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object EAgrDesc2: TLFEdit
            Left = 371
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 3
            Text = '0'
          end
          object EAgrDesc3: TLFEdit
            Left = 465
            Top = 3
            Width = 48
            Height = 21
            TabOrder = 4
            Text = '0'
          end
          object BTNAgrArticuloModeloAgrega: TButton
            Left = 528
            Top = 2
            Width = 105
            Height = 22
            Action = AAgregaCondionesArticuloModelo
            TabOrder = 5
            OnClick = BTNAgrArticuloModeloAgregaClick
          end
          object BTNAgrArticuloModeloElimina: TButton
            Left = 640
            Top = 2
            Width = 105
            Height = 22
            Action = AEliminaCondicionesArticuloModelo
            TabOrder = 6
            OnClick = BTNAgrArticuloModeloEliminaClick
          end
        end
      end
      object TSCondAgrFam: TTabSheet
        Caption = 'Familia'
        OnShow = TSCondAgrFamShow
        object TBCondAgrFam: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondAgrFam: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSCondAgrFam
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondAgrFamPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondAgrFam
            InsertaControl = DBGFCondAgrFam
            OnClickBefore = NavCondAgrFamClickBefore
            Exclusivo = True
            ControlEdit = CECondAgrFam
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFCondAgrFam: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSCondAgrFam
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
          BuscarNums = False
          Campos.Strings = (
            'FAMILIA')
          CamposAMostrar.Strings = (
            'FAMILIA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'FAMILIA'
            'TITULO_FAMILIA')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'FAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_FAMILIAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCondAgrFamBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
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
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
      object TSCondAgrArticulos: TTabSheet
        Caption = 'Agrupacion Articulos'
        ImageIndex = 10
        object TBCondAgrArticulos: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCondAgrArticulos: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesVenta.DSxCondAgrArticulos
            Flat = True
            ParentShowHint = False
            PopupMenu = CECondAgrArticulosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCondAgr
            InsertaControl = DBGFCondAgr
            Exclusivo = True
            ControlEdit = CECondAgrArticulos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGCondAgrArticulos: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 746
          Height = 233
          Align = alClient
          DataSource = DMCondicionesVenta.DSxCondAgrArticulos
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
          BuscarNums = False
          Campos.Strings = (
            'AGRUPACION')
          CamposAMostrar.Strings = (
            'AGRUPACION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'AGRUPACION'
            'TITULO_AGRUPACION')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO'
            'TRASPASAR')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          CondicionBusqueda = 'Tipo = '#39'T'#39
          MensajeNoExiste = False
          Numericos.Strings = (
            'AGRUPACION')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_AGRUPACIONES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'AGRUPACION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_AGRUPACION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESDE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HASTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
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
              FieldName = 'ALTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 35
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 422
    Width = 758
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 16460
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 16499
    end
  end
  inherited ALMain: TLFActionList
    Left = 566
    Top = 16
    object AEscalado: TAction
      Category = 'Otros'
      Caption = 'Ver Escalado Condici'#243'n'
      Hint = 'Ver Escalado Condici'#243'n'
      ImageIndex = 45
      OnExecute = AEscaladoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AImportarExcel: TAction
      Category = 'Otros'
      Caption = 'Importar desde Excel'
      ImageIndex = 49
      OnExecute = AImportarExcelExecute
    end
    object AActualizarPreciosTarifa: TAction
      Category = 'Otros'
      Caption = 'Actualizar Precios Tarifa'
      Hint = 
        'Actualizar Precios con Precio de Venta de Tarifa asociada a Clie' +
        'nte.'#13#10'Para TODOS los clientes.'
      ImageIndex = 143
      OnExecute = AActualizarPreciosTarifaExecute
    end
    object AActualizarPreciosTarifaCli: TAction
      Category = 'Otros'
      Caption = 'Actualizar Precios Tarifa al Cliente'
      Hint = 
        'Actualizar Precios con Precio de Venta de Tarifa asociada a Clie' +
        'nte.'#13#10'Solo para el cliente Actual.'
      ImageIndex = 143
      OnExecute = AActualizarPreciosTarifaCliExecute
    end
  end
  object AL: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 352
    Top = 2
    object ACliente: TAction
      Caption = 'Cliente'
      Hint = 'Para Abrir el Maestro de Cliente: Ctrl+ALT+T '
      ShortCut = 49236
      OnExecute = AClienteExecute
    end
    object AEliminaCondicionesCliente: TAction
      Caption = 'Elimina condiciones'
      OnExecute = AEliminaCondicionesClienteExecute
    end
    object AAgregaCondicionesVenta: TAction
      Caption = 'Agrega condiciones'
      OnExecute = AAgregaCondicionesVentaExecute
    end
    object AAgregaCondionesArticuloModelo: TAction
      Caption = 'Agrega condiciones'
      OnExecute = AAgregaCondionesArticuloModeloExecute
    end
    object AEliminaCondicionesArticuloModelo: TAction
      Caption = 'Elimina condiciones'
      OnExecute = AEliminaCondicionesArticuloModeloExecute
    end
  end
  object CECondCliArt: TControlEdit
    EnlazadoA = CECondCliFam
    SubComplementario = ALMain
    PopUpMenu = CECliArtPMEdit
    Teclas = DMMain.Teclas
    Left = 216
    Top = 264
  end
  object CECliArtPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 216
    Top = 296
    object CECondCliArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondCliArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondCliArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondCliArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondCliArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondCliArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondCliArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondCliArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondCliArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondCliArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondArt: TControlEdit
    SubComplementario = ALMain
    PopUpMenu = CECondArtPMEdit
    Teclas = DMMain.Teclas
    Left = 312
    Top = 264
  end
  object CECondArtPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 312
    Top = 296
    object CECondArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondFam: TControlEdit
    SubComplementario = ALMain
    PopUpMenu = ControlEdit1PMEdit
    Teclas = DMMain.Teclas
    Left = 344
    Top = 264
  end
  object ControlEdit1PMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 344
    Top = 296
    object CECondFamMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondFamMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondFamMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondFamMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondFamMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondFamMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondFamMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondFamMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondFamMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondFamMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondPer: TControlEdit
    EnlazadoA = CECondPerArt
    SubComplementario = ALMain
    PopUpMenu = CECondPerPMEdit
    Teclas = DMMain.Teclas
    Left = 376
    Top = 264
  end
  object CECondPerPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 376
    Top = 296
    object CECondPerMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondPerMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondPerMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondPerMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondPerMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondPerMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondPerMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondPerMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondPerMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondPerMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondPerArt: TControlEdit
    EnlazadoA = CECondPerFam
    SubComplementario = ALMain
    PopUpMenu = CECondPerArtPMEdit
    Teclas = DMMain.Teclas
    Left = 408
    Top = 266
  end
  object CECondPerArtPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 408
    Top = 296
    object CECondPerArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondPerArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondPerArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondPerArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondPerArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondPerArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondPerArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondPerArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondPerArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondPerArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondPerFam: TControlEdit
    EnlazadoA = CECondPer
    SubComplementario = ALMain
    PopUpMenu = CECondPerFamPMEdit
    Teclas = DMMain.Teclas
    Left = 440
    Top = 264
  end
  object CECondPerFamPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 440
    Top = 296
    object CECondPerFamMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondPerFamMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondPerFamMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondPerFamMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondPerFamMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondPerFamMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondPerFamMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondPerFamMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondPerFamMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondPerFamMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondAgr: TControlEdit
    EnlazadoA = CECondAgrArt
    SubComplementario = ALMain
    PopUpMenu = CECondAgrPMEdit
    Teclas = DMMain.Teclas
    Left = 472
    Top = 264
  end
  object CECondAgrPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 472
    Top = 296
    object CECondAgrMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondAgrMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondAgrMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondAgrMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondAgrMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondAgrMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondAgrMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondAgrMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondAgrMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondAgrMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondAgrArticulos: TControlEdit
    EnlazadoA = CECondAgrArt
    SubComplementario = ALMain
    PopUpMenu = CECondAgrArticulosPMEdit
    Teclas = DMMain.Teclas
    Left = 568
    Top = 264
  end
  object CECondAgrArticulosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 568
    Top = 296
    object CECondAgrArticulosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondAgrArticulosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondAgrArticulosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondAgrArticulosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondAgrArticulosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondAgrArticulosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondAgrArticulosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondAgrArticulosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondAgrArticulosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondAgrArticulosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondAgrArt: TControlEdit
    EnlazadoA = CECondAgrFam
    SubComplementario = ALMain
    PopUpMenu = CECondAgrArtPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 264
  end
  object CECondAgrArtPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 504
    Top = 296
    object CECondAgrArtMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondAgrArtMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondAgrArtMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondAgrArtMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondAgrArtMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondAgrArtMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondAgrArtMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondAgrArtMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondAgrArtMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondAgrArtMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondAgrFam: TControlEdit
    EnlazadoA = CECondAgr
    SubComplementario = ALMain
    PopUpMenu = CECondAgrFamPMEdit
    Teclas = DMMain.Teclas
    Left = 536
    Top = 264
  end
  object CECondAgrFamPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 536
    Top = 296
    object CECondAgrFamMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondAgrFamMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondAgrFamMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondAgrFamMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondAgrFamMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondAgrFamMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondAgrFamMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondAgrFamMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondAgrFamMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondAgrFamMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECondCliFam: TControlEdit
    EnlazadoA = CECondCliArt
    SubComplementario = ALMain
    PopUpMenu = CECondCliFamPMEdit
    Teclas = DMMain.Teclas
    Left = 280
    Top = 264
  end
  object CECondCliFamPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 280
    Top = 296
    object CECondCliFamMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECondCliFamMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECondCliFamMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECondCliFamMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECondCliFamMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECondCliFamMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECondCliFamMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECondCliFamMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECondCliFamMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECondCliFamMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
