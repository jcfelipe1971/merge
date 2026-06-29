object FMAsistenteImpArtIdiomas: TFMAsistenteImpArtIdiomas
  Left = 158
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Importar Idiomas Articulos'
  ClientHeight = 455
  ClientWidth = 731
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
    Width = 602
    Height = 414
    ActivePage = TSSeleccionArchivo
    Align = alClient
    OwnerDraw = True
    Style = tsFlatButtons
    TabOrder = 0
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSSeleccionArchivo: TTabSheet
      TabVisible = False
      OnShow = TSSeleccionArchivoShow
      object LBLSeleccionarArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 594
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
        Top = 106
        Width = 576
        Height = 113
        Caption = ' Seleccione el archivo del que se importar'#225'n los idiomas: '
        TabOrder = 0
        object EdArchivoImp: TLFEdit
          Left = 12
          Top = 48
          Width = 523
          Height = 21
          TabOrder = 0
        end
        object ButtSelArchivo: TButton
          Left = 542
          Top = 48
          Width = 23
          Height = 21
          Hint = 'Seleccionar el archivo con las tarifas a importar'
          Caption = '...'
          TabOrder = 1
          OnClick = ButtSelArchivoClick
        end
      end
    end
    object TSAsociarColumnas: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object LBLAsociarColumnas: TLFLabel
        Left = 0
        Top = 0
        Width = 243
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
        Width = 594
        Height = 372
        Align = alClient
        Caption = ' Asociar los datos a importar '
        TabOrder = 0
        object SGDatosImp: TStringGrid
          Left = 2
          Top = 15
          Width = 590
          Height = 267
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
        object PNLAsociarColumnasIdioma: TLFPanel
          Left = 2
          Top = 282
          Width = 590
          Height = 88
          Align = alBottom
          TabOrder = 1
          object LBLTitulo: TLFLabel
            Left = 228
            Top = 13
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object LBArticulo: TLFLabel
            Left = 10
            Top = 13
            Width = 37
            Height = 13
            Caption = 'Art'#237'culo'
          end
          object LBLIdioma: TLFLabel
            Left = 119
            Top = 13
            Width = 31
            Height = 13
            Caption = 'Idioma'
          end
          object LBLUnicode: TLFLabel
            Left = 336
            Top = 13
            Width = 40
            Height = 13
            Caption = 'Unicode'
          end
          object CBArticulo: TLFComboBox
            Left = 10
            Top = 28
            Width = 105
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            TabOrder = 0
          end
          object CBFuerzaIdioma: TLFCheckBox
            Left = 16
            Top = 58
            Width = 97
            Height = 17
            Caption = 'Fuerza Idioma'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBFuerzaIdiomaChange
          end
          object CBIdioma: TLFComboBox
            Left = 119
            Top = 28
            Width = 105
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            TabOrder = 2
          end
          object CBTitulo: TLFComboBox
            Left = 228
            Top = 28
            Width = 105
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            TabOrder = 3
          end
          object EFIdioma: TLFEditFind2000
            Left = 119
            Top = 56
            Width = 105
            Height = 21
            TabOrder = 4
            OnChange = EFIdiomaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'IDIOMA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'SYS_IDIOMAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'IDIOMA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EIdioma: TLFEdit
            Left = 225
            Top = 56
            Width = 344
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object CBUnicode: TLFComboBox
            Left = 336
            Top = 28
            Width = 105
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            TabOrder = 6
          end
        end
      end
    end
    object TSSeleccionarDatos: TTabSheet
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
      object GBSeleccionarImp: TGroupBox
        Left = 0
        Top = 32
        Width = 594
        Height = 372
        Align = alClient
        Caption = ' Seleccione los idiomas a importar '
        TabOrder = 0
        object DBGImp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 590
          Height = 333
          Align = alClient
          DataSource = DMAsistenteImpArtIdiomas.DSQMImpArtIdiomas
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
        end
        object TBSeleccionarDatos: TLFToolBar
          Left = 2
          Top = 15
          Width = 590
          Height = 22
          AutoSize = True
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
            Hint = 'Importar todos los registros'
            Caption = 'Seleccionar Todos'
            ImageIndex = 19
            OnClick = TButtSelTodasClick
          end
          object TButtQuitarSel: TToolButton
            Left = 23
            Top = 0
            Hint = 'Desmarcar todos los registros'
            Caption = 'Quitar Selecci'#243'n'
            ImageIndex = 27
            OnClick = TButtQuitarSelClick
          end
        end
      end
    end
    object TSImportar: TTabSheet
      ImageIndex = 3
      TabVisible = False
      object LBLImportarTarifas: TLFLabel
        Left = 0
        Top = 0
        Width = 594
        Height = 32
        Hint = 'LBLImportar'
        Align = alTop
        Alignment = taCenter
        Caption = 'Importar contactos'
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
        Width = 577
        Height = 113
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
            'ra la creaci'#243'n de un nuevo '
          'contacto.'
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
        Left = 256
        Top = 183
        Width = 75
        Height = 25
        Caption = 'Crear'
        TabOrder = 1
        OnClick = ButtCrearClick
      end
      object GBInfo: TGroupBox
        Left = 0
        Top = 221
        Width = 594
        Height = 183
        Align = alBottom
        Caption = ' Informaci'#243'n del proceso '
        TabOrder = 2
        object MEMInfoProc: TLFMemo
          Left = 2
          Top = 15
          Width = 590
          Height = 166
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object TVMain: TTreeView
    Left = 0
    Top = 0
    Width = 129
    Height = 414
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
      01000000290000000000000000000000FFFFFFFFFFFFFFFF0000000004000000
      10496D706F72746172204964696F6D61732C0000000000000000000000FFFFFF
      FFFFFFFFFF00000000000000001353656C656363696F6E617220617263686976
      6F290000000000000000000000FFFFFFFFFFFFFFFF0000000000000000104173
      6F6369617220636F6C756D6E61732A0000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000001153656C656363696F6E6172206461746F7321000000
      0000000000000000FFFFFFFFFFFFFFFF000000000000000008496D706F727461
      72}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 414
    Width = 731
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object ButtNext: TButton
      Left = 587
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 0
      OnClick = ButtNextClick
    end
    object ButtCerrar: TButton
      Left = 587
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      Visible = False
      OnClick = ButtCerrarClick
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
    object ButtAnt: TButton
      Left = 481
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 3
      OnClick = ButtAntClick
    end
  end
end
