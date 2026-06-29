inherited FMEstadisticasSimples: TFMEstadisticasSimples
  Left = 425
  Top = 235
  Width = 1228
  Height = 435
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Estadisticas Simples'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1218
    Height = 382
    inherited TBMain: TLFToolBar
      Width = 1214
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep6: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBRefrescar: TToolButton
        Left = 41
        Top = 0
        Action = ARefrescarTodas
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 161
      Width = 1214
      Height = 219
      ActivePage = TSFamilia
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFamilia: TTabSheet
        Caption = 'Familia'
        object DBGFamilias: THYTDBGrid
          Left = 0
          Top = 22
          Width = 1206
          Height = 138
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasSimples.DSxEstadisticaFamilias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCellClick
          OnColEnter = DBGFamiliasColEnter
          OnDrawColumnCell = DBGDrawColumnCell
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'FAMILIA'
            'INCREMENTO'
            'INCREMENTO_TOTAL'
            'PERIODO'
            'PERIODO_ANTERIOR'
            'TITULO'
            'TOTAL'
            'TOTAL_ANTERIOR'
            'UNID_INCREMENTO'
            'UNID_INCREMENTO_TOTAL'
            'UNID_PERIODO'
            'UNID_PERIODO_ANTERIOR'
            'UNID_TOTAL'
            'UNID_TOTAL_ANTERIOR')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 90
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
              FieldName = 'B_DTO_LINEA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 100
              Visible = True
            end>
        end
        object TBFamilia: TLFToolBar
          Left = 0
          Top = 0
          Width = 1206
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavFamilias: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMEstadisticasSimples.DSxEstadisticaFamilias
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
          object TBSep1: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescarFamilia: TToolButton
            Left = 248
            Top = 0
            Action = ARefrescarEstadisicaFamilia
          end
        end
        object PNLTotalesFamilia: TLFPanel
          Left = 0
          Top = 160
          Width = 1206
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object TSArticulo: TTabSheet
        Caption = 'Articulo'
        ImageIndex = 1
        object DBGArticulos: THYTDBGrid
          Left = 0
          Top = 22
          Width = 1206
          Height = 138
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasSimples.DSxEstadisticaArticulos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCellClick
          OnColEnter = DBGArticulosColEnter
          OnDrawColumnCell = DBGDrawColumnCell
          OnDblClick = DBGArticulosDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'INCREMENTO'
            'INCREMENTO_TOTAL'
            'PERIODO'
            'PERIODO_ANTERIOR'
            'TITULO'
            'TOTAL'
            'TOTAL_ANTERIOR'
            'UNID_INCREMENTO'
            'UNID_INCREMENTO_TOTAL'
            'UNID_PERIODO'
            'UNID_PERIODO_ANTERIOR'
            'UNID_TOTAL'
            'UNID_TOTAL_ANTERIOR')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clAqua
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_LARGO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_DTO_LINEA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 100
              Visible = True
            end>
        end
        object TBArticulos: TLFToolBar
          Left = 0
          Top = 0
          Width = 1206
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavArticulos: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
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
          object TBSep2: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescarArticulos: TToolButton
            Left = 248
            Top = 0
            Action = ARefrescarEstadisicaArticulo
          end
        end
        object PNLTotalesArticulo: TLFPanel
          Left = 0
          Top = 160
          Width = 1206
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object TSCliente: TTabSheet
        Caption = 'Cliente'
        ImageIndex = 2
        object DBGClientes: THYTDBGrid
          Left = 0
          Top = 22
          Width = 1206
          Height = 138
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasSimples.DSxEstadisticaClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCellClick
          OnColEnter = DBGClientesColEnter
          OnDrawColumnCell = DBGDrawColumnCell
          OnDblClick = DBGClientesDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'INCREMENTO'
            'INCREMENTO_TOTAL'
            'PERIODO'
            'PERIODO_ANTERIOR'
            'TITULO'
            'TOTAL'
            'TOTAL_ANTERIOR')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clAqua
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_DTO_LINEA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 300
              Visible = True
            end>
        end
        object TBClientes: TLFToolBar
          Left = 0
          Top = 0
          Width = 1206
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavClientes: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMEstadisticasSimples.DSxEstadisticaClientes
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
          object TBSep3: TToolButton
            Left = 240
            Top = 0
            Width = 9
            Style = tbsSeparator
          end
          object TBRefrescarClientes: TToolButton
            Left = 249
            Top = 0
            Action = ARefrescarEstadisicaCliente
          end
        end
        object PNLTotalesCliente: TLFPanel
          Left = 0
          Top = 160
          Width = 1206
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object TSClienteFamilia: TTabSheet
        Caption = 'Cliente-Familia'
        ImageIndex = 3
        object TBClientesFamilia: TLFToolBar
          Left = 0
          Top = 0
          Width = 1206
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavClientesFamilia: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMEstadisticasSimples.DSxEstadisticaClientesFamilia
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
          object TBSep4: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescarClientesFamilia: TToolButton
            Left = 248
            Top = 0
            Action = ARefrescarEstadisicaClienteFamilia
          end
        end
        object DBGClientesFamilia: THYTDBGrid
          Left = 0
          Top = 22
          Width = 1206
          Height = 138
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasSimples.DSxEstadisticaClientesFamilia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCellClick
          OnColEnter = DBGClientesFamiliaColEnter
          OnDrawColumnCell = DBGDrawColumnCell
          OnDblClick = DBGClientesFamiliaDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'INCREMENTO'
            'INCREMENTO_TOTAL'
            'PERIODO'
            'PERIODO_ANTERIOR'
            'TITULO'
            'TOTAL'
            'TOTAL_ANTERIOR')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clAqua
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 90
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
              FieldName = 'B_DTO_LINEA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 300
              Visible = True
            end>
        end
        object PNLTotalesClienteFamilia: TLFPanel
          Left = 0
          Top = 160
          Width = 1206
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object TSClienteArticulo: TTabSheet
        Caption = 'Cliente-Articulo'
        ImageIndex = 4
        object TBClientesArticulo: TLFToolBar
          Left = 0
          Top = 0
          Width = 1206
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavClientesArticulo: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMEstadisticasSimples.DSxEstadisticaClientesArticulo
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
          object TBSep5: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescarClientesArticulo: TToolButton
            Left = 248
            Top = 0
            Action = ARefrescarEstadisicaClienteArticulo
          end
        end
        object DBGClientesArticulo: THYTDBGrid
          Left = 0
          Top = 22
          Width = 1206
          Height = 138
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasSimples.DSxEstadisticaClientesArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCellClick
          OnColEnter = DBGClientesArticuloColEnter
          OnDrawColumnCell = DBGDrawColumnCell
          OnDblClick = DBGClientesArticuloDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'INCREMENTO'
            'INCREMENTO_TOTAL'
            'PERIODO'
            'PERIODO_ANTERIOR'
            'TITULO'
            'TOTAL'
            'TOTAL_ANTERIOR')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Color = clAqua
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              Width = 300
              Visible = True
            end
            item
              Color = clAqua
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_LARGO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_DTO_LINEA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 300
              Visible = True
            end>
        end
        object PNLTotalesClienteArticulo: TLFPanel
          Left = 0
          Top = 160
          Width = 1206
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 28
      Width = 1214
      Height = 133
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LFechaDesde: TLFLabel
        Left = 12
        Top = 3
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LFechaHasta: TLFLabel
        Left = 15
        Top = 25
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object BEjercicio: TSpeedButton
        Left = 240
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Ejercicio actual'
        Flat = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BEjercicioClick
      end
      object BMes: TSpeedButton
        Left = 240
        Top = 22
        Width = 22
        Height = 22
        Hint = 'Mes actual'
        Flat = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BMesClick
      end
      object BMesAnterior: TSpeedButton
        Left = 218
        Top = 22
        Width = 22
        Height = 22
        Hint = 'Mes anterior'
        Flat = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BMesAnteriorClick
      end
      object BMesSiguiente: TSpeedButton
        Left = 262
        Top = 22
        Width = 22
        Height = 22
        Hint = 'Mes siguiente'
        Flat = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BMesSiguienteClick
      end
      object BEjercicioAnterior: TSpeedButton
        Left = 218
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Ejercicio anterior'
        Flat = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BEjercicioAnteriorClick
      end
      object BEjercicioSiguiente: TSpeedButton
        Left = 262
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Ejercicio siguiente'
        Flat = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BEjercicioSiguienteClick
      end
      object LClienteDesde: TLFLabel
        Left = 10
        Top = 47
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Cliente'
      end
      object LClienteHasta: TLFLabel
        Left = 13
        Top = 68
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Cliente'
      end
      object LArticuloDesde: TLFLabel
        Left = 7
        Top = 92
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Articulo'
      end
      object LArticuloHasta: TLFLabel
        Left = 10
        Top = 113
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Articulo'
      end
      object LDesdeFamilia: TLFLabel
        Left = 554
        Top = 92
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Familia'
      end
      object LHastaFamilia: TLFLabel
        Left = 557
        Top = 113
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Familia'
      end
      object LSerie1: TLFLabel
        Left = 587
        Top = 47
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie 1'
      end
      object LSerie2: TLFLabel
        Left = 587
        Top = 68
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie 2'
      end
      object DEFechaDesde: TLFDateEdit
        Left = 80
        Top = 0
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DEFechaHasta: TLFDateEdit
        Left = 80
        Top = 22
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object EFClienteDesde: TLFEditFind2000
        Left = 80
        Top = 44
        Width = 64
        Height = 21
        TabOrder = 3
        OnChange = EFClienteDesdeChange
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
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EClienteDesde: TLFEdit
        Left = 145
        Top = 44
        Width = 400
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object EFClienteHasta: TLFEditFind2000
        Left = 80
        Top = 66
        Width = 64
        Height = 21
        TabOrder = 5
        OnChange = EFClienteHastaChange
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
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EClienteHasta: TLFEdit
        Left = 145
        Top = 66
        Width = 400
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object EFArticuloDesde: TLFEditFind2000
        Left = 80
        Top = 88
        Width = 90
        Height = 21
        TabOrder = 7
        OnChange = EFArticuloDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloDesde: TLFEdit
        Left = 171
        Top = 88
        Width = 374
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object EFArticuloHasta: TLFEditFind2000
        Left = 80
        Top = 110
        Width = 90
        Height = 21
        TabOrder = 9
        OnChange = EFArticuloHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloHasta: TLFEdit
        Left = 171
        Top = 110
        Width = 374
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object RGTipoDocumento: TRadioGroup
        Left = 296
        Top = 0
        Width = 249
        Height = 41
        Caption = 'Tipo Documento'
        Columns = 4
        ItemIndex = 3
        Items.Strings = (
          'Oferta'
          'Pedido'
          'Albaran'
          'Factura')
        TabOrder = 2
      end
      object EFFamiliaDesde: TLFEditFind2000
        Left = 624
        Top = 88
        Width = 49
        Height = 21
        TabOrder = 15
        OnChange = EFFamiliaDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFamiliaDesde: TLFEdit
        Left = 675
        Top = 88
        Width = 374
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object EFFamiliaHasta: TLFEditFind2000
        Left = 624
        Top = 110
        Width = 49
        Height = 21
        TabOrder = 17
        OnChange = EFFamiliaHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFamiliaHasta: TLFEdit
        Left = 675
        Top = 110
        Width = 374
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object EFSerie1: TLFEditFind2000
        Left = 624
        Top = 44
        Width = 64
        Height = 21
        TabOrder = 11
        OnChange = EFSerie1Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ESerie1: TLFEdit
        Left = 689
        Top = 44
        Width = 360
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object EFSerie2: TLFEditFind2000
        Left = 624
        Top = 66
        Width = 64
        Height = 21
        TabOrder = 13
        OnChange = EFSerie2Change
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = False
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ESerie2: TLFEdit
        Left = 689
        Top = 66
        Width = 360
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 382
    Width = 1218
  end
  inherited CEMain: TControlEdit
    Left = 656
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 688
    Top = 0
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
  inherited ALMain: TLFActionList
    Left = 736
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARefrescarEstadisicaFamilia: TAction
      Category = 'Procesos'
      Caption = 'Refrescar Estadisica Familia'
      Hint = 'Refrescar Estadisica Familia'
      ImageIndex = 26
      OnExecute = ARefrescarEstadisicaFamiliaExecute
    end
    object ARefrescarEstadisicaArticulo: TAction
      Category = 'Procesos'
      Caption = 'Refrescar Estadisica Articulo'
      Hint = 'Refrescar Estadisica Articulo'
      ImageIndex = 26
      OnExecute = ARefrescarEstadisicaArticuloExecute
    end
    object ARefrescarEstadisicaCliente: TAction
      Category = 'Procesos'
      Caption = 'Refrescar Estadisica Cliente'
      Hint = 'Refrescar Estadisica Cliente'
      ImageIndex = 26
      OnExecute = ARefrescarEstadisicaClienteExecute
    end
    object ARefrescarEstadisicaClienteFamilia: TAction
      Category = 'Procesos'
      Caption = 'Refrescar Estadisica Cliente Familia'
      Hint = 'Refrescar Estadisica Cliente Familia'
      ImageIndex = 26
      OnExecute = ARefrescarEstadisicaClienteFamiliaExecute
    end
    object ARefrescarEstadisicaClienteArticulo: TAction
      Category = 'Procesos'
      Caption = 'Refrescar Estadisica Cliente Articulo'
      Hint = 'Refrescar Estadisica Cliente Articulo'
      ImageIndex = 26
      OnExecute = ARefrescarEstadisicaClienteArticuloExecute
    end
    object ARefrescarTodas: TAction
      Category = 'Procesos'
      Caption = 'Refrescar Todas las Estadisticas'
      Hint = 'Refrescar Todas las Estadisticas'
      ImageIndex = 26
      OnExecute = ARefrescarTodasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 768
    Top = 0
  end
end
