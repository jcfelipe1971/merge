object FMAsistenteExpAsientos: TFMAsistenteExpAsientos
  Left = 422
  Top = 216
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Exportar Asientos'
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
  object PNLBotones: TLFPanel
    Left = 0
    Top = 375
    Width = 789
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object ButtCerrar: TButton
      Left = 644
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 0
      Visible = False
      OnClick = ButtCerrarClick
    end
    object ButtAnt: TButton
      Left = 564
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 1
      OnClick = ButtAntClick
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
    object ButtNext: TButton
      Left = 644
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 3
      OnClick = ButtNextClick
    end
  end
  object TVMain: TTreeView
    Left = 0
    Top = 0
    Width = 126
    Height = 375
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
      010000002A0000000000000000000000FFFFFFFFFFFFFFFF0000000005000000
      114578706F7274617220417369656E746F732D0000000000000000000000FFFF
      FFFFFFFFFFFF00000000000000001446696C74726F732064652073656C656363
      69F36E2A0000000000000000000000FFFFFFFFFFFFFFFF000000000000000011
      53656C656363696F6E6172206461746F732C0000000000000000000000FFFFFF
      FFFFFFFFFF000000000000000013436F6C756D6E61732061206578706F727461
      722C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000135365
      6C656363696F6E6172206172636869766F210000000000000000000000FFFFFF
      FFFFFFFFFF0000000000000000084578706F72746172}
  end
  object PCMain: TLFPageControl
    Left = 126
    Top = 0
    Width = 663
    Height = 375
    ActivePage = TSSeleccionArchivo
    Align = alClient
    OwnerDraw = True
    Style = tsFlatButtons
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSFiltros: TTabSheet
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = False
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
      object GBFechas: TGroupBox
        Left = 0
        Top = 32
        Width = 655
        Height = 333
        Align = alClient
        Caption = 'Seleccione los filtros de selecci'#243'n'
        TabOrder = 0
        object LDesdeFecha: TLFLabel
          Left = 136
          Top = 80
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 139
          Top = 117
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Hasta'
        end
        object LBLTipo: TLFLabel
          Left = 126
          Top = 154
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Asiento'
        end
        object LAsientoDesde: TLFLabel
          Left = 327
          Top = 80
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Asiento Desde'
        end
        object LAsientoHasta: TLFLabel
          Left = 330
          Top = 117
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Asiento Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 205
          Top = 76
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHasta: TLFDateEdit
          Left = 205
          Top = 113
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
        object CBTipoAsiento: TLFComboBox
          Left = 205
          Top = 150
          Width = 260
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
        end
        object SEAsientoHasta: TSpinEdit
          Left = 400
          Top = 113
          Width = 64
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object SEAsientoDesde: TSpinEdit
          Left = 400
          Top = 76
          Width = 64
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 1
        end
      end
    end
    object TSSeleccionarDatos: TTabSheet
      TabVisible = False
      object LBLSeleccionarDatos: TLFLabel
        Left = 0
        Top = 0
        Width = 655
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
      object GBSeleccionarAsientosExp: TGroupBox
        Left = 0
        Top = 32
        Width = 655
        Height = 333
        Align = alClient
        Caption = ' Seleccione los asientos a exportar '
        TabOrder = 0
        object DBGSaldosExp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 651
          Height = 294
          Align = alClient
          DataSource = DMAsistenteExpAsientos.DSQMAsientosExp
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
            'TIPO'
            'TITULO'
            'DEBE'
            'HABER')
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
              Width = 42
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
              Width = 38
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
              Width = 85
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
              FieldName = 'TIPO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Visible = False
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
              Visible = False
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
              Width = 59
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
          Width = 651
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
      TabVisible = False
      object LBLColumnasExportar: TLFLabel
        Left = 0
        Top = 0
        Width = 655
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
        object TBSeleccionarColumnas: TLFToolBar
          Left = 2
          Top = 15
          Width = 651
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
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
            Width = 285
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
        object DBGColumnas: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 651
          Height = 294
          Align = alClient
          DataSource = DMAsistenteExpAsientos.DSQMColumnas
          TabOrder = 1
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
      end
    end
    object TSSeleccionArchivo: TTabSheet
      TabVisible = False
      OnShow = TSSeleccionArchivoShow
      object LBLSeleccionarArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 655
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
        Caption = ' Seleccione el archivo al cual se exportar'#225'n los asientos: '
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
      ImageIndex = 3
      TabVisible = False
      object LBLExportarAsientos: TLFLabel
        Left = 0
        Top = 0
        Width = 655
        Height = 32
        Hint = 'LBLImportar'
        Align = alTop
        Alignment = taCenter
        Caption = 'Exportar asientos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MEMInfo: TLFMemo
        Left = 24
        Top = 48
        Width = 631
        Height = 97
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
            'ra exportar los asientos.'
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
        Top = 151
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
end
