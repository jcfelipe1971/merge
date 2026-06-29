object FMAsistenteImpStockMinMax: TFMAsistenteImpStockMinMax
  Left = 250
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Importar Stocks'
  ClientHeight = 591
  ClientWidth = 859
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
    Left = 129
    Top = 0
    Width = 730
    Height = 550
    ActivePage = TSSeleccionarDatos
    Align = alClient
    OwnerDraw = True
    Style = tsFlatButtons
    TabOrder = 0
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSSeleccionArchivo: TTabSheet
      TabVisible = False
      OnShow = TSSeleccionArchivoShow
      DesignSize = (
        722
        540)
      object LBLSeleccionarArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 722
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
        Left = 8
        Top = 98
        Width = 704
        Height = 175
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Seleccione el archivo del que se importar'#225'n los Stocks : '
        TabOrder = 0
        DesignSize = (
          704
          175)
        object LInformacionHoja: TLFLabel
          Left = 47
          Top = 100
          Width = 96
          Height = 13
          Caption = 'Informacion Fichero:'
        end
        object EdArchivoImp: TLFEdit
          Left = 12
          Top = 48
          Width = 651
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = EdArchivoImpChange
        end
        object ButtSelArchivo: TButton
          Left = 664
          Top = 48
          Width = 23
          Height = 21
          Hint = 'Seleccionar el archivo con las Stocks a importar'
          Anchors = [akTop, akRight]
          Caption = '...'
          TabOrder = 1
          OnClick = ButtSelArchivoClick
        end
        object CBHojaAImportar: TLFComboBox
          Left = 12
          Top = 70
          Width = 676
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 2
          OnChange = CBHojaAImportarChange
        end
        object BInformacionHoja: TButton
          Left = 13
          Top = 96
          Width = 23
          Height = 21
          Hint = 'Informacion de hoja a importar'
          Caption = 'i'
          TabOrder = 3
        end
      end
    end
    object TSAsociarColumnas: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object LBLAsociarColumnas: TLFLabel
        Left = 0
        Top = 0
        Width = 722
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Asociar Columnas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBAsociarColumnas: TGroupBox
        Left = 0
        Top = 32
        Width = 722
        Height = 508
        Align = alClient
        Caption = ' Asociar los datos a importar con la aplicacion '
        TabOrder = 0
        object SGDatosImp: TStringGrid
          Left = 2
          Top = 15
          Width = 718
          Height = 305
          Align = alClient
          Color = clInfoBk
          ColCount = 7
          DefaultColWidth = 75
          DefaultRowHeight = 17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
          ParentFont = False
          TabOrder = 0
          OnDrawCell = SGDatosImpDrawCell
          RowHeights = (
            17
            17
            17
            17
            17)
        end
        object PNLAsosciarColumnas: TLFPanel
          Left = 2
          Top = 320
          Width = 718
          Height = 186
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object PNLArticulo: TLFPanel
            Left = 0
            Top = 25
            Width = 718
            Height = 121
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LBLArticulos: TLFLabel
              Left = 11
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Art'#237'culo'
            end
            object LBTituloArt: TLFLabel
              Left = 111
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Stock Minimo'
            end
            object LTituloCorto: TLFLabel
              Left = 212
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Stock M'#225'ximo'
            end
            object CBArticulo: TLFComboBox
              Left = 11
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
            end
            object CBMinimo: TLFComboBox
              Left = 111
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 1
            end
            object CBMaximo: TLFComboBox
              Left = 212
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
            end
          end
          object PNLToldosYCortinas: TLFPanel
            Left = 0
            Top = 146
            Width = 718
            Height = 40
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LFPanelLona: TLFPanel
              Left = 510
              Top = 0
              Width = 208
              Height = 40
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              Visible = False
            end
            object LFPanelComponente: TLFPanel
              Left = 0
              Top = 0
              Width = 510
              Height = 40
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              Visible = False
            end
          end
          object PNLTitulos: TLFPanel
            Left = 0
            Top = 0
            Width = 718
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object LSeparadorDecimal: TLFLabel
              Left = 248
              Top = 6
              Width = 90
              Height = 13
              Caption = 'Separador Decimal'
            end
            object LFCBPrimeraFilaTitulos: TLFCheckBox
              Left = 4
              Top = 4
              Width = 200
              Height = 17
              Caption = 'Primera Fila contiene Titulos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = LFCBPrimeraFilaTitulosChange
            end
            object ESeparadorDecimal: TLFEdit
              Left = 344
              Top = 1
              Width = 49
              Height = 24
              TabOrder = 1
              OnChange = ESeparadorDecimalChange
            end
          end
        end
      end
    end
    object TSSeleccionarAlmacen: TTabSheet
      ImageIndex = 2
      TabVisible = False
      object LBLSeleccionarAlmacen: TLFLabel
        Left = 0
        Top = 0
        Width = 251
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecci'#243'n Almacen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBSeleccionAlmacen: TGroupBox
        Left = 0
        Top = 32
        Width = 722
        Height = 508
        Align = alClient
        Caption = ' Seleccione Almacen'
        TabOrder = 0
        object LAlmacen: TLFLabel
          Left = 57
          Top = 49
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almacen'
        end
        object EFAlmacen: TLFEditFind2000
          Left = 104
          Top = 45
          Width = 121
          Height = 21
          TabOrder = 0
          OnChange = EFAlmacenChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacen: TLFEdit
          Left = 226
          Top = 45
          Width = 455
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
    end
    object TSSeleccionarDatos: TTabSheet
      TabVisible = False
      object LBLSeleccionarDatos: TLFLabel
        Left = 0
        Top = 0
        Width = 722
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
      object GBSeleccionarStocksImp: TGroupBox
        Left = 0
        Top = 32
        Width = 722
        Height = 508
        Align = alClient
        Caption = ' Seleccione los Stocks a importar '
        TabOrder = 0
        object DBGStocksImp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 718
          Height = 469
          Align = alClient
          DataSource = DMAsistenteImpStockMinMax.DSQMStocksImp
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
            'IMPORTAR')
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
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK_MINIMO'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK_MAXIMO'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTAR'
              Width = 50
              Visible = True
            end>
        end
        object TBSeleccionarDatos: TLFToolBar
          Left = 2
          Top = 15
          Width = 718
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object TButtSelTodas: TToolButton
            Left = 0
            Top = 0
            Hint = 'Importar todos los Stocks'
            Caption = 'Seleccionar Todas'
            ImageIndex = 19
            OnClick = TButtSelTodasClick
          end
          object TButtQuitarSel: TToolButton
            Left = 23
            Top = 0
            Hint = 'No importar ninguna tarifa'
            Caption = 'Quitar Seleccion'
            ImageIndex = 27
            OnClick = TButtQuitarSelClick
          end
        end
      end
    end
    object TSImportar: TTabSheet
      ImageIndex = 3
      TabVisible = False
      object LBLImportarStocks: TLFLabel
        Left = 0
        Top = 0
        Width = 722
        Height = 32
        Hint = 'LBLImportar'
        Align = alTop
        Alignment = taCenter
        Caption = 'Importar Stocks'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBInfo: TGroupBox
        Left = 0
        Top = 181
        Width = 722
        Height = 359
        Align = alClient
        Caption = ' Informaci'#243'n del proceso '
        TabOrder = 0
        object MEMInfoProc: TLFMemo
          Left = 2
          Top = 15
          Width = 718
          Height = 342
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object PNLImportar: TLFPanel
        Left = 0
        Top = 32
        Width = 722
        Height = 149
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          722
          149)
        object MEMInfo: TLFMemo
          Left = 0
          Top = 0
          Width = 722
          Height = 113
          Align = alTop
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
              'ra la creaci'#243'n de una nuevo '
            'ejercicio.'
            ''
            
              '[] Si desea modificar alguno, acceda a la pesta'#241'a correspondient' +
              'e para su modificaci'#243'n.'
            ''
            
              '[] Si por el contrario los datos son correctos, pulse el siguien' +
              'te bot'#243'n para comenzar el proceso.')
          ParentFont = False
          TabOrder = 0
        end
        object ButtCrear: TButton
          Left = 320
          Top = 115
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Crear'
          TabOrder = 1
          OnClick = ButtCrearClick
        end
      end
    end
  end
  object TVMain: TTreeView
    Left = 0
    Top = 0
    Width = 129
    Height = 550
    Align = alLeft
    AutoExpand = True
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
    TabOrder = 1
    OnChange = TVMainChange
    OnCollapsed = TVMainCollapsed
    Items.Data = {
      01000000280000000000000000000000FFFFFFFFFFFFFFFF0000000005000000
      0F496D706F727461722053746F636B732C0000000000000000000000FFFFFFFF
      FFFFFFFF00000000000000001353656C656363696F6E6172206172636869766F
      290000000000000000000000FFFFFFFFFFFFFFFF00000000000000001041736F
      6369617220636F6C756D6E61732B0000000000000000000000FFFFFFFFFFFFFF
      FF00000000000000001253656C656363696F6E6172207461726966612A000000
      0000000000000000FFFFFFFFFFFFFFFF00000000000000001153656C65636369
      6F6E6172206461746F73210000000000000000000000FFFFFFFFFFFFFFFF0000
      00000000000008496D706F72746172}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 550
    Width = 859
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object ButtNext: TButton
      Left = 638
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 0
      OnClick = ButtNextClick
    end
    object ButtAnt: TButton
      Left = 470
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 1
      OnClick = ButtAntClick
    end
    object ButtCancel: TButton
      Left = 28
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtCancelClick
    end
    object ButtCerrar: TButton
      Left = 638
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 3
      Visible = False
      OnClick = ButtCerrarClick
    end
  end
end
