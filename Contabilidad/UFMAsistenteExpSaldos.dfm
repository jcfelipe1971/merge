object FMAsistenteExpSaldos: TFMAsistenteExpSaldos
  Left = 305
  Top = 236
  ActiveControl = EFDesde
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Exportar Saldos'
  ClientHeight = 416
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PCMain: TLFPageControl
    Left = 126
    Top = 0
    Width = 663
    Height = 375
    ActivePage = TSFiltros
    Align = alClient
    OwnerDraw = True
    Style = tsFlatButtons
    TabOrder = 0
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSFiltros: TTabSheet
      Caption = 'TSFiltros'
      ImageIndex = 3
      TabVisible = False
      object LFiltroSeleccion: TLFLabel
        Left = 0
        Top = 0
        Width = 655
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Filtros de selecci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBCuentas: TGroupBox
        Left = 0
        Top = 32
        Width = 655
        Height = 66
        Align = alTop
        Caption = 'Cuentas'
        TabOrder = 0
        object LDesdeCuenta: TLFLabel
          Left = 13
          Top = 21
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaCuenta: TLFLabel
          Left = 16
          Top = 43
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesde: TLFEditFind2000
          Left = 48
          Top = 17
          Width = 121
          Height = 21
          TabOrder = 0
          OnChange = EFDesdeChange
          OnExit = EFDesdeExit
          OnKeyDown = EFDesdeKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_SUBCUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CUENTA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHasta: TLFEditFind2000
          Left = 48
          Top = 39
          Width = 121
          Height = 21
          TabOrder = 1
          OnChange = EFHastaChange
          OnExit = EFHastaExit
          OnKeyDown = EFHastaKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_SUBCUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CUENTA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBECtaDesde: TLFDbedit
          Left = 170
          Top = 17
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsistenteExpSaldos.DSxCta_Desde
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBECtaHasta: TLFDbedit
          Left = 170
          Top = 39
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsistenteExpSaldos.DSxCta_Hasta
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GBSeccion: TGroupBox
        Left = 0
        Top = 98
        Width = 655
        Height = 66
        Align = alTop
        Caption = 'Filtros'
        TabOrder = 1
        object LHastaSeccion: TLFLabel
          Left = 163
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LDesdeSeccion: TLFLabel
          Left = 160
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LBNivel: TLFLabel
          Left = 24
          Top = 28
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nivel'
        end
        object ESeccionD: TLFEdit
          Left = 195
          Top = 14
          Width = 81
          Height = 21
          MaxLength = 11
          TabOrder = 1
        end
        object ESeccionH: TLFEdit
          Left = 195
          Top = 36
          Width = 81
          Height = 21
          MaxLength = 11
          TabOrder = 2
        end
        object CBNivelFiltro: TLFComboBox
          Left = 52
          Top = 24
          Width = 77
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBNivelFiltroChange
        end
      end
      object PNivFecha: TLFPanel
        Left = 0
        Top = 164
        Width = 655
        Height = 66
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object GBNiveles: TGroupBox
          Left = 0
          Top = 0
          Width = 193
          Height = 66
          Align = alLeft
          Caption = 'Niveles'
          TabOrder = 0
          object LDesdeNivel: TLFLabel
            Left = 29
            Top = 18
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaNivel: TLFLabel
            Left = 32
            Top = 39
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object CBDesde: TLFComboBox
            Left = 64
            Top = 14
            Width = 77
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBDesdeChange
          end
          object CBHasta: TLFComboBox
            Left = 64
            Top = 36
            Width = 77
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnChange = CBDesdeChange
          end
        end
        object GBFechas: TGroupBox
          Left = 193
          Top = 0
          Width = 193
          Height = 66
          Align = alLeft
          Caption = 'Fechas'
          TabOrder = 1
          object LDesdeFecha: TLFLabel
            Left = 26
            Top = 18
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaFecha: TLFLabel
            Left = 29
            Top = 40
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object DTPDesde: TLFDateEdit
            Left = 62
            Top = 14
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPHasta: TLFDateEdit
            Left = 62
            Top = 36
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
        end
        object ChkAsientoApertura: TLFCheckBox
          Left = 411
          Top = 5
          Width = 147
          Height = 17
          Caption = 'Asiento de Apertura'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object ChkAsientoCierre: TLFCheckBox
          Left = 411
          Top = 24
          Width = 147
          Height = 17
          Caption = 'Asiento de Cierre'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
        object ChkAsientoReg: TLFCheckBox
          Left = 411
          Top = 45
          Width = 146
          Height = 17
          Caption = 'Asiento de Regularizaci'#243'n'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object GBCanales: TGroupBox
        Left = 0
        Top = 230
        Width = 655
        Height = 135
        Align = alClient
        Caption = 'Canales'
        TabOrder = 3
        object DBGFCanales: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 651
          Height = 96
          Align = alClient
          DataSource = DMAsistenteExpSaldos.DSxMultiSeleccion
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'MARCADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CANAL'
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
              FieldName = 'TITULO_CANAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 252
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARCADO'
              Width = 24
              Visible = True
            end>
        end
        object TBMultiCanal: TLFToolBar
          Left = 2
          Top = 15
          Width = 651
          Height = 22
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object TButtSelTodosCanales: TToolButton
            Left = 0
            Top = 0
            Hint = 'Todos los canales'
            Caption = 'Seleccinar Todas'
            ImageIndex = 146
            OnClick = TButtSelTodosCanalesClick
          end
          object TButtQuitarTodosCanales: TToolButton
            Left = 23
            Top = 0
            Hint = 'Solo el canal actual'
            Caption = 'Quitar Seleccion'
            ImageIndex = 147
            OnClick = TButtQuitarTodosCanalesClick
          end
        end
      end
    end
    object TSSeleccionarDatos: TTabSheet
      Caption = 'TSSeleccionarDatos'
      TabVisible = False
      object LBLSeleccionarDatos: TLFLabel
        Left = 0
        Top = 0
        Width = 238
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Seleccionar Datos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBSeleccionarSaldosExp: TGroupBox
        Left = 0
        Top = 32
        Width = 655
        Height = 333
        Align = alClient
        Caption = ' Seleccione los saldos a exportar '
        TabOrder = 0
        object DBGSaldosExp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 651
          Height = 294
          Align = alClient
          DataSource = DMAsistenteExpSaldos.DSQMSaldosExp
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposNoAccesibles.Strings = (
            'ARTICULO'
            'MARGEN'
            'PRECIO')
          ColumnasCheckBoxes.Strings = (
            'MARCADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CUENTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 88
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
              Width = 294
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DEBE'
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
              FieldName = 'HABER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SALDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARCADO'
              Width = 23
              Visible = True
            end>
        end
        object TBSeleccionarDatos: TLFToolBar
          Left = 2
          Top = 15
          Width = 651
          Height = 22
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object TButtSelTodas: TToolButton
            Left = 0
            Top = 0
            Hint = 'Seleccionar todos los saldos'
            Caption = 'Seleccinar Todas'
            ImageIndex = 146
            OnClick = TButtSelTodasClick
          end
          object TButtQuitarSel: TToolButton
            Left = 23
            Top = 0
            Hint = 'No seleccionar ning'#250'n saldo'
            Caption = 'Quitar Seleccion'
            ImageIndex = 147
            OnClick = TButtQuitarSelClick
          end
        end
      end
    end
    object TSColumnasExp: TTabSheet
      Caption = 'TSColumnasExp'
      TabVisible = False
      object LBLColumnasExportar: TLFLabel
        Left = 0
        Top = 0
        Width = 276
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Columnas a exportar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBColumnasExportar: TGroupBox
        Left = 0
        Top = 32
        Width = 655
        Height = 333
        Align = alClient
        Caption = 'Seleccione las columnas a exportar'
        TabOrder = 0
        object DBGColumnas: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 651
          Height = 294
          Align = alClient
          DataSource = DMAsistenteExpSaldos.DSQMColumnas
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnExit = DBGColumnasExit
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
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
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposNoAccesibles.Strings = (
            'NOMBRE_CAMPO')
          ColumnasCheckBoxes.Strings = (
            'MARCADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_CAMPO'
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
              FieldName = 'NOMBRE_ENCAB'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARCADO'
              Visible = True
            end>
        end
        object TBSeleccionarColumnas: TLFToolBar
          Left = 2
          Top = 15
          Width = 651
          Height = 22
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object TBSelecColTodas: TToolButton
            Left = 0
            Top = 0
            Hint = 'Seleccionar todas las columnas'
            Caption = 'Seleccinar Todas'
            ImageIndex = 146
            OnClick = TBSelecColTodasClick
          end
          object TBQuitarColTodas: TToolButton
            Left = 23
            Top = 0
            Hint = 'No seleccionar ninguna columna'
            Caption = 'Quitar Seleccion'
            ImageIndex = 147
            OnClick = TBQuitarColTodasClick
          end
          object ToolButton1: TToolButton
            Left = 46
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object ChkEncabezamiento: TLFDBCheckBox
            Left = 54
            Top = 0
            Width = 241
            Height = 22
            Caption = 'Entrada de encabezamiento de la exportaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
    end
    object TSSeleccionArchivo: TTabSheet
      Caption = 'TSSeleccionArchivo'
      TabVisible = False
      OnShow = TSSeleccionArchivoShow
      object LBLSeleccionarArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 278
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecci'#243'n de Archivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBArchivo: TGroupBox
        Left = 6
        Top = 98
        Width = 643
        Height = 113
        Caption = ' Seleccione el archivo al cual se exportar'#225'n los saldos: '
        TabOrder = 0
        DesignSize = (
          643
          113)
        object EdArchivoExp: TLFEdit
          Left = 12
          Top = 48
          Width = 590
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ButtSelArchivo: TButton
          Left = 609
          Top = 48
          Width = 23
          Height = 21
          Hint = 'Seleccionar el archivo con las tarifas a importar'
          Anchors = [akTop, akRight]
          Caption = '...'
          TabOrder = 1
          OnClick = ButtSelArchivoClick
        end
      end
    end
    object TSExportar: TTabSheet
      Caption = 'TSExportar'
      ImageIndex = 3
      TabVisible = False
      object LBLExportarSaldos: TLFLabel
        Left = 0
        Top = 0
        Width = 655
        Height = 32
        Hint = 'LBLImportar'
        Align = alTop
        Alignment = taCenter
        Caption = 'Exportar saldos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MEMInfo: TLFMemo
        Left = 8
        Top = 48
        Width = 641
        Height = 92
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            '[] Ha rellenado correctamente todos los par'#225'metros necesarios pa' +
            'ra exportar los saldos.'
          ''
          
            '[] Si desea modificar alguno, acceda a la pesta'#241'a correspondient' +
            'e para su modificaci'#243'n.'
          ''
          
            '[] Si por el contrario los datos son correctos, pulse el siguien' +
            'te bot'#243'n para comenzar el proceso.')
        ParentFont = False
        TabOrder = 0
      end
      object ButtExportar: TButton
        Left = 288
        Top = 143
        Width = 75
        Height = 25
        Caption = 'Exportar'
        TabOrder = 1
        OnClick = ButtExportarClick
      end
      object GBInfo: TGroupBox
        Left = 0
        Top = 182
        Width = 655
        Height = 183
        Align = alBottom
        Caption = 'Informaci'#243'n del proceso'
        TabOrder = 2
        object MEMInfoProc: TLFMemo
          Left = 2
          Top = 15
          Width = 651
          Height = 166
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 375
    Width = 789
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ButtNext: TButton
      Left = 644
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 0
      OnClick = ButtNextClick
    end
    object ButtCerrar: TButton
      Left = 644
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      Visible = False
      OnClick = ButtCerrarClick
    end
    object ButtCancel: TButton
      Left = 20
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtCancelClick
    end
    object ButtAnt: TButton
      Left = 564
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 3
      OnClick = ButtAntClick
    end
  end
  object TVMain: TTreeView
    Left = 0
    Top = 0
    Width = 126
    Height = 375
    Align = alLeft
    AutoExpand = True
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HideSelection = False
    Indent = 19
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    ShowRoot = False
    TabOrder = 2
    OnChange = TVMainChange
    OnCollapsed = TVMainCollapsed
    Items.Data = {
      01000000280000000000000000000000FFFFFFFFFFFFFFFF0000000005000000
      0F4578706F727461722053616C646F732D0000000000000000000000FFFFFFFF
      FFFFFFFF00000000000000001446696C74726F732064652073656C65636369F3
      6E2A0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000115365
      6C656363696F6E6172206461746F732C0000000000000000000000FFFFFFFFFF
      FFFFFF000000000000000013436F6C756D6E61732061206578706F727461722C
      0000000000000000000000FFFFFFFFFFFFFFFF00000000000000001353656C65
      6363696F6E6172206172636869766F210000000000000000000000FFFFFFFFFF
      FFFFFF0000000000000000084578706F72746172}
  end
  object SDArchivoExp: TSaveDialog
    DefaultExt = 'xls'
    Filter = 
      'Libro de Microsoft Excel (*.xls)|*.xls|Texto delimitado por coma' +
      's (*.cvs)|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofPathMustExist, ofEnableSizing]
    Title = 'Seleccionar archivo donde se exportar'#225'n los saldos'
    Left = 136
    Top = 384
  end
end
