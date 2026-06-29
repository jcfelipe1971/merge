object CrmFMAsistenteImpContactos: TCrmFMAsistenteImpContactos
  Left = 398
  Top = 130
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Importar Contactos'
  ClientHeight = 522
  ClientWidth = 733
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
    Width = 604
    Height = 481
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
      DesignSize = (
        596
        471)
      object LBLSeleccionarArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 596
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
        Width = 576
        Height = 113
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Seleccione el archivo del que se importar'#225'n los contactos: '
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
        Width = 596
        Height = 439
        Align = alClient
        Caption = ' Asociar los datos a importar '
        TabOrder = 0
        object SGDatosImp: TStringGrid
          Left = 2
          Top = 15
          Width = 592
          Height = 225
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
        object PNLSeleccionColumnas: TLFPanel
          Left = 2
          Top = 240
          Width = 592
          Height = 197
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LNIF: TLFLabel
            Left = 462
            Top = 56
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'NIF'
          end
          object LObservaciones: TLFLabel
            Left = 10
            Top = 56
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Observaciones'
          end
          object LOrigenCliPro: TLFLabel
            Left = 236
            Top = 152
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Origen Cli/Prov'
          end
          object LWeb: TLFLabel
            Left = 349
            Top = 56
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Web'
          end
          object LZona: TLFLabel
            Left = 10
            Top = 152
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Zona'
          end
          object LFormaPago: TLFLabel
            Left = 236
            Top = 56
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Forma de Pago'
          end
          object LAgente: TLFLabel
            Left = 462
            Top = 8
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Agente'
          end
          object LBLArticulos: TLFLabel
            Left = 349
            Top = 104
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'P. Contacto'
          end
          object LBLMargenes: TLFLabel
            Left = 123
            Top = 56
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'CP'
          end
          object LBLPrecio: TLFLabel
            Left = 349
            Top = 8
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Direcci'#243'n'
          end
          object LBTipoIva: TLFLabel
            Left = 236
            Top = 104
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'E-Mail'
          end
          object LBTitFamilia: TLFLabel
            Left = 123
            Top = 104
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Telefono 2'
          end
          object LBTituloArt: TLFLabel
            Left = 10
            Top = 8
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Nombre Comercial'
          end
          object LCliPro: TLFLabel
            Left = 123
            Top = 152
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Cliente/Prov'
          end
          object LFFax: TLFLabel
            Left = 462
            Top = 104
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fax'
          end
          object LFLFamilia: TLFLabel
            Left = 10
            Top = 104
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Telefono'
          end
          object LBLRSocial: TLFLabel
            Left = 123
            Top = 8
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Raz'#243'n Social'
          end
          object LBLNombreCorto: TLFLabel
            Left = 236
            Top = 8
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Nombre Corto'
          end
          object LBLNotas: TLFLabel
            Left = 349
            Top = 152
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Notas'
          end
          object CB_CP: TLFComboBox
            Left = 123
            Top = 72
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
          object CBAgente: TLFComboBox
            Left = 462
            Top = 24
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
          object CBCliente: TLFComboBox
            Left = 123
            Top = 168
            Width = 105
            Height = 21
            ItemHeight = 0
            TabOrder = 16
          end
          object CBDireccion: TLFComboBox
            Left = 349
            Top = 24
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
          object CBEMail: TLFComboBox
            Left = 236
            Top = 120
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
            TabOrder = 12
          end
          object CBFax: TLFComboBox
            Left = 462
            Top = 120
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
            TabOrder = 14
          end
          object CBFormaPago: TLFComboBox
            Left = 236
            Top = 72
            Width = 105
            Height = 21
            ItemHeight = 0
            TabOrder = 7
          end
          object CBNif: TLFComboBox
            Left = 462
            Top = 72
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
            TabOrder = 9
          end
          object CBNombreCom: TLFComboBox
            Left = 10
            Top = 24
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
          object CBObservaciones: TLFComboBox
            Left = 10
            Top = 72
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
          object CBOrigen: TLFComboBox
            Left = 236
            Top = 168
            Width = 105
            Height = 21
            ItemHeight = 0
            TabOrder = 17
          end
          object CBPContacto: TLFComboBox
            Left = 349
            Top = 120
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
            TabOrder = 13
          end
          object CBTelefono1: TLFComboBox
            Left = 10
            Top = 120
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
            TabOrder = 10
          end
          object CBTelefono2: TLFComboBox
            Left = 123
            Top = 120
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
            TabOrder = 11
          end
          object CBWeb: TLFComboBox
            Left = 349
            Top = 72
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
            TabOrder = 8
          end
          object CBZona: TLFComboBox
            Left = 10
            Top = 168
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
            TabOrder = 15
          end
          object CBRSocial: TLFComboBox
            Left = 123
            Top = 24
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
          object CBNotas: TLFComboBox
            Left = 349
            Top = 168
            Width = 105
            Height = 21
            ItemHeight = 0
            TabOrder = 18
          end
          object CBNombreCorto: TLFComboBox
            Left = 236
            Top = 24
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
        Width = 596
        Height = 439
        Align = alClient
        Caption = ' Seleccione los contactos a importar '
        TabOrder = 0
        object DBGTarifasImp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 592
          Height = 400
          Align = alClient
          DataSource = CrmDMAsistenteImpContactos.DSQMContactosImp
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
              FieldName = 'NOMBRE_CONTACTO'
              ReadOnly = True
              Width = 194
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DIRECCION'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TELEFONO1'
              ReadOnly = True
              Width = 75
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
          Width = 592
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
            Hint = 'Importar todos los contactos'
            Caption = 'Seleccionar Todos'
            ImageIndex = 146
            OnClick = TButtSelTodasClick
          end
          object TButtQuitarSel: TToolButton
            Left = 23
            Top = 0
            Hint = 'Desmarcar todos los contactos'
            Caption = 'Quitar Selecci'#243'n'
            ImageIndex = 147
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
        Width = 596
        Height = 32
        Hint = 'LBLImportar'
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Importar contactos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MEMInfo: TLFMemo
        Left = 16
        Top = 64
        Width = 563
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
        Left = 264
        Top = 183
        Width = 75
        Height = 25
        Caption = 'Crear'
        TabOrder = 1
        OnClick = ButtCrearClick
      end
      object GBInfo: TGroupBox
        Left = 8
        Top = 224
        Width = 577
        Height = 183
        Caption = ' Informaci'#243'n del proceso '
        TabOrder = 2
        object MEMInfoProc: TLFMemo
          Left = 2
          Top = 15
          Width = 573
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
    Height = 481
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
      010000002B0000000000000000000000FFFFFFFFFFFFFFFF0000000004000000
      12496D706F7274617220436F6E746163746F732C0000000000000000000000FF
      FFFFFFFFFFFFFF00000000000000001353656C656363696F6E61722061726368
      69766F290000000000000000000000FFFFFFFFFFFFFFFF000000000000000010
      41736F6369617220636F6C756D6E61732A0000000000000000000000FFFFFFFF
      FFFFFFFF00000000000000001153656C656363696F6E6172206461746F732100
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000008496D706F72
      746172}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 481
    Width = 733
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
