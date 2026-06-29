object FMAsistenteImpAsientos: TFMAsistenteImpAsientos
  Left = 444
  Top = 241
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Importar Asientos'
  ClientHeight = 415
  ClientWidth = 728
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
    Width = 599
    Height = 374
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
        Width = 591
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
        Caption = 'Seleccione el archivo del que se importar'#225'n los asientos:'
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
        Width = 591
        Height = 332
        Align = alClient
        Caption = 'Asociar los datos a importar con Merge'
        TabOrder = 0
        object SGDatosImp: TStringGrid
          Left = 2
          Top = 15
          Width = 587
          Height = 218
          Align = alClient
          Color = clInfoBk
          ColCount = 7
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
            64
            64
            64
            64
            64
            64
            64)
          RowHeights = (
            17
            17
            17
            17
            17)
        end
        object PNLSeleccionarColumnas: TLFPanel
          Left = 2
          Top = 233
          Width = 587
          Height = 97
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LFLTextoAsiento: TLFLabel
            Left = 27
            Top = 52
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Texto de asiento'
          end
          object LBLAsientos: TLFLabel
            Left = 27
            Top = 10
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Asiento'
          end
          object LBLCuentas: TLFLabel
            Left = 265
            Top = 10
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Cuenta'
          end
          object LBLFecha: TLFLabel
            Left = 385
            Top = 10
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fecha'
          end
          object LBLImporte: TLFLabel
            Left = 385
            Top = 52
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Importe'
          end
          object LBLLinea: TLFLabel
            Left = 147
            Top = 10
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'L'#237'nea'
          end
          object LBLTipoAsiento: TLFLabel
            Left = 265
            Top = 52
            Width = 105
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Tipo (D/H)'
          end
          object CBAsientos: TLFComboBox
            Left = 27
            Top = 25
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
          object CBCuentas: TLFComboBox
            Left = 265
            Top = 25
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
          object CBFecha: TLFComboBox
            Left = 385
            Top = 25
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
          object CBImporte: TLFComboBox
            Left = 385
            Top = 67
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
          object CBLineas: TLFComboBox
            Left = 147
            Top = 25
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
          object CBTextoAsiento: TLFComboBox
            Left = 27
            Top = 67
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
          object CBTipoAsiento: TLFComboBox
            Left = 265
            Top = 67
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
          object LFCBDebeYHaber: TLFCheckBox
            Left = 148
            Top = 69
            Width = 109
            Height = 17
            Caption = 'Por debe y haber'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            OnChange = LFCBDebeYHaberChange
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
      object GBSeleccionarAsientosImp: TGroupBox
        Left = 0
        Top = 32
        Width = 591
        Height = 332
        Align = alClient
        Caption = 'Seleccione los asientos a importar'
        TabOrder = 0
        object DBGAsientosImp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 587
          Height = 293
          Align = alClient
          DataSource = DMAsistenteImpAsientos.DSQMAsientosImp
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
            'ASIENTO'
            'CUENTA'
            'IMPORTE'
            'LINEA'
            'TEXTO')
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
              FieldName = 'ASIENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 36
              Visible = True
            end
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
              Width = 86
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TEXTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 285
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IMPORTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 55
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
              Width = 55
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
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARCADO'
              Width = 22
              Visible = True
            end>
        end
        object TBSeleccionarDatos: TLFToolBar
          Left = 2
          Top = 15
          Width = 587
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
            Hint = 'Importar todos los apuntes'
            Caption = 'Seleccionar Todos'
            ImageIndex = 146
            OnClick = TButtSelTodasClick
          end
          object TButtQuitarSel: TToolButton
            Left = 23
            Top = 0
            Hint = 'Desmarcar todos los apuntes'
            Caption = 'Quitar Selecci'#243'n'
            ImageIndex = 147
            OnClick = TButtQuitarSelClick
          end
        end
      end
    end
    object TSImportar: TTabSheet
      ImageIndex = 3
      TabVisible = False
      object LBLImportarAsientos: TLFLabel
        Left = 0
        Top = 0
        Width = 591
        Height = 32
        Hint = 'LBLImportar'
        Align = alTop
        Alignment = taCenter
        Caption = 'Importar asientos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MEMInfo: TLFMemo
        Left = 16
        Top = 48
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
            'ra importar los asientos.'
          ''
          
            '[] Si desea modificar alguno, acceda a la pesta'#241'a correspondient' +
            'e para su modificaci'#243'n.'
          ''
          
            '[] Si por el contrario los datos son correctos, pulse el siguien' +
            'te bot'#243'n para comenzar el proceso.')
        ParentFont = False
        TabOrder = 0
      end
      object ButtImportar: TButton
        Left = 256
        Top = 151
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = ButtImportarClick
      end
      object GBInfo: TGroupBox
        Left = 0
        Top = 181
        Width = 591
        Height = 183
        Align = alBottom
        Caption = 'Informaci'#243'n del proceso'
        TabOrder = 2
        object MEMInfoProc: TLFMemo
          Left = 2
          Top = 15
          Width = 587
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
    Height = 374
    Align = alLeft
    AutoExpand = True
    BevelInner = bvNone
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
      010000002A0000000000000000000000FFFFFFFFFFFFFFFF0000000004000000
      11496D706F7274617220417369656E746F732C0000000000000000000000FFFF
      FFFFFFFFFFFF00000000000000001353656C656363696F6E6172206172636869
      766F290000000000000000000000FFFFFFFFFFFFFFFF00000000000000001041
      736F6369617220636F6C756D6E61732A0000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000001153656C656363696F6E6172206461746F73210000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000008496D706F7274
      6172}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 374
    Width = 728
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
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
end
