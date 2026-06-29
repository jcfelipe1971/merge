inherited FMEstadisticasComparadas: TFMEstadisticasComparadas
  Left = 425
  Top = 237
  Width = 896
  Height = 433
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Estadisticas Comparadas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 886
    Height = 380
    inherited TBMain: TLFToolBar
      Width = 882
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object PNLFiltros: TLFPanel
        Left = 33
        Top = 0
        Width = 518
        Height = 22
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LDesdeFecha: TLFLabel
          Left = 13
          Top = 3
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 176
          Top = 3
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object BEjercicio: TSpeedButton
          Left = 368
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
          Left = 440
          Top = 0
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
          Left = 418
          Top = 0
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
          Left = 462
          Top = 0
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
          Left = 346
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
          Left = 390
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
        object SBRefrescaTodas: TSpeedButton
          Left = 490
          Top = 0
          Width = 22
          Height = 22
          Hint = 'Refrescar Todas las Estadisticas'
          Flat = True
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SBRefrescaTodasClick
        end
        object DEFechaDesde: TLFDateEdit
          Left = 48
          Top = 0
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DEFechaHasta: TLFDateEdit
          Left = 208
          Top = 0
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 882
      Height = 350
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
          Width = 874
          Height = 300
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasComparadas.DSxEstadisticaFamilias
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
              FieldName = 'PERIODO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end>
        end
        object TBFamilia: TLFToolBar
          Left = 0
          Top = 0
          Width = 874
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
            DataSource = DMEstadisticasComparadas.DSxEstadisticaFamilias
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
      end
      object TSArticulo: TTabSheet
        Caption = 'Articulo'
        ImageIndex = 1
        object DBGArticulos: THYTDBGrid
          Left = 0
          Top = 22
          Width = 874
          Height = 300
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasComparadas.DSxEstadisticaArticulos
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
              FieldName = 'TITULO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end>
        end
        object TBArticulos: TLFToolBar
          Left = 0
          Top = 0
          Width = 874
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
      end
      object TSCliente: TTabSheet
        Caption = 'Cliente'
        ImageIndex = 2
        object DBGClientes: THYTDBGrid
          Left = 0
          Top = 22
          Width = 874
          Height = 300
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasComparadas.DSxEstadisticaClientes
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
              FieldName = 'PERIODO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end>
        end
        object TBClientes: TLFToolBar
          Left = 0
          Top = 0
          Width = 874
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
            DataSource = DMEstadisticasComparadas.DSxEstadisticaClientes
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
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescarClientes: TToolButton
            Left = 248
            Top = 0
            Action = ARefrescarEstadisicaCliente
          end
        end
      end
      object TSClienteFamilia: TTabSheet
        Caption = 'Cliente-Familia'
        ImageIndex = 3
        object TBClientesFamilia: TLFToolBar
          Left = 0
          Top = 0
          Width = 874
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
            DataSource = DMEstadisticasComparadas.DSxEstadisticaClientesFamilia
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
          Width = 874
          Height = 300
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasComparadas.DSxEstadisticaClientesFamilia
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
              FieldName = 'TITULO_FAMILIA'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end>
        end
      end
      object TSClienteArticulo: TTabSheet
        Caption = 'Cliente-Articulo'
        ImageIndex = 4
        object TBClientesArticulo: TLFToolBar
          Left = 0
          Top = 0
          Width = 874
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
            DataSource = DMEstadisticasComparadas.DSxEstadisticaClientesArticulo
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
          Width = 874
          Height = 300
          Align = alClient
          Color = clInfoBk
          DataSource = DMEstadisticasComparadas.DSxEstadisticaClientesArticulo
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
              FieldName = 'TITULO_ARTICULO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_INCREMENTO_TOTAL'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_PERIODO_ANTERIOR'
              Width = 85
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'UNID_TOTAL_ANTERIOR'
              Width = 85
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 380
    Width = 886
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
