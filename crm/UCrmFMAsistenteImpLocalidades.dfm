object CrmFMAsistenteImpLocalidades: TCrmFMAsistenteImpLocalidades
  Left = 247
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Importar Localidades'
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
      Caption = 'TSSeleccionArchivo'
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
        Caption = 'Seleccione el archivo del que se importar'#225'n las localidades'
        TabOrder = 0
        DesignSize = (
          576
          113)
        object EdArchivoImp: TLFEdit
          Left = 12
          Top = 48
          Width = 523
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ButtSelArchivo: TButton
          Left = 542
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
    object TSAsociarColumnas: TTabSheet
      Caption = 'TSAsociarColumnas'
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
        Caption = 'Asociar los datos a importar'
        TabOrder = 0
        object SGDatosImp: TStringGrid
          Left = 2
          Top = 15
          Width = 590
          Height = 265
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
          ColWidths = (
            75
            75
            75
            75
            75
            75
            75)
          RowHeights = (
            17
            17
            17
            17
            17)
        end
        object PNLColumnas: TLFPanel
          Left = 2
          Top = 280
          Width = 590
          Height = 90
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            590
            90)
          object LBLTitulo: TLFLabel
            Left = 12
            Top = 4
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'T'#237'tulo'
          end
          object LBLProvincia: TLFLabel
            Left = 228
            Top = 4
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Provincia/Estado'
          end
          object LBLCP: TLFLabel
            Left = 120
            Top = 4
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'CP'
          end
          object LBLCodigo_Provincia: TLFLabel
            Left = 335
            Top = 4
            Width = 122
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'C'#243'digo Provincia/estado'
          end
          object LBLPais: TLFLabel
            Left = 336
            Top = 44
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Pa'#237's'
          end
          object LBLColonia: TLFLabel
            Left = 12
            Top = 44
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Colonia'
          end
          object LBLTipo_Colonia: TLFLabel
            Left = 120
            Top = 44
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Tipo Colonia'
          end
          object LBLCiudad: TLFLabel
            Left = 228
            Top = 44
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Ciudad'
          end
          object CBProvincia: TLFComboBox
            Left = 228
            Top = 20
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
          object CBCP: TLFComboBox
            Left = 120
            Top = 20
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
            TabOrder = 1
          end
          object CBTitulo: TLFComboBox
            Left = 12
            Top = 20
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
          object CBCodigo_Provincia: TLFComboBox
            Left = 336
            Top = 20
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
          object CBColonia: TLFComboBox
            Left = 12
            Top = 60
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
            TabOrder = 4
          end
          object CBTipo_Colonia: TLFComboBox
            Left = 120
            Top = 60
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
            TabOrder = 5
          end
          object CBCiudad: TLFComboBox
            Left = 228
            Top = 60
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
          object EFPais: TLFEditFind2000
            Left = 336
            Top = 60
            Width = 49
            Height = 21
            TabOrder = 7
            OnChange = EFPaisChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PAIS')
            Filtros = []
          end
          object ETituloPais: TLFEdit
            Left = 386
            Top = 60
            Width = 199
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 8
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
      object GBSeleccionarTarifasImp: TGroupBox
        Left = 0
        Top = 32
        Width = 594
        Height = 372
        Align = alClient
        Caption = 'Seleccione las localidades a importar'
        TabOrder = 0
        object DBGTarifasImp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 590
          Height = 333
          Align = alClient
          DataSource = CrmDMAsistenteImpLocalidades.DSQMLocalidadesImp
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
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 239
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTAR'
              Width = 44
              Visible = True
            end>
        end
        object TBSeleccionarDatos: TLFToolBar
          Left = 2
          Top = 15
          Width = 590
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
            Hint = 'Importar todas las localidades'
            Caption = 'Seleccionar Todas'
            ImageIndex = 19
            OnClick = TButtSelTodasClick
          end
          object TButtQuitarSel: TToolButton
            Left = 23
            Top = 0
            Hint = 'Desmarcar todas las localidades'
            Caption = 'Quitar Selecci'#243'n'
            ImageIndex = 27
            OnClick = TButtQuitarSelClick
          end
        end
      end
    end
    object TSImportar: TTabSheet
      Caption = 'TSImportar'
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
        AutoSize = False
        Caption = 'Importar localidades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MEMInfo: TLFMemo
        Left = 16
        Top = 40
        Width = 563
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
            'ra la creaci'#243'n de una nueva'
          'localidad.'
          ''
          
            '[] Si desea modificar alguna acceda a la pesta'#241'a correspondiente' +
            ' para su modificaci'#243'n.'
          ''
          
            '[] Si por el contrario los datos son correctos, pulse el siguien' +
            'te bot'#243'n para comenzar el proceso.')
        ParentFont = False
        TabOrder = 0
      end
      object ButtCrear: TButton
        Left = 256
        Top = 159
        Width = 75
        Height = 25
        Caption = 'Crear'
        TabOrder = 1
        OnClick = ButtCrearClick
      end
      object GBInfo: TGroupBox
        Left = 0
        Top = 200
        Width = 594
        Height = 204
        Align = alBottom
        Caption = 'Informaci'#243'n del proceso'
        TabOrder = 2
        object MEMInfoProc: TLFMemo
          Left = 2
          Top = 15
          Width = 590
          Height = 187
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
      010000002D0000000000000000000000FFFFFFFFFFFFFFFF0000000004000000
      14496D706F72746172204C6F63616C6964616465732C00000000000000000000
      00FFFFFFFFFFFFFFFF00000000000000001353656C656363696F6E6172206172
      636869766F290000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      001041736F6369617220636F6C756D6E61732A0000000000000000000000FFFF
      FFFFFFFFFFFF00000000000000001153656C656363696F6E6172206461746F73
      210000000000000000000000FFFFFFFFFFFFFFFF000000000000000008496D70
      6F72746172}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 414
    Width = 731
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object ButtCancel: TButton
      Left = 28
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = ButtCancelClick
    end
    object ButtAnt: TButton
      Left = 481
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 1
      OnClick = ButtAntClick
    end
    object ButtCerrar: TButton
      Left = 587
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 2
      Visible = False
      OnClick = ButtCerrarClick
    end
    object ButtNext: TButton
      Left = 587
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 3
      OnClick = ButtNextClick
    end
  end
end
