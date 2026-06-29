inherited FMImportarEscProduccion: TFMImportarEscProduccion
  Left = 282
  Top = 227
  Width = 1028
  Height = 640
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importar Escandallo Produccion'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1018
    Height = 587
    inherited TBMain: TLFToolBar
      Width = 1014
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PNLFichero: TLFPanel
      Left = 2
      Top = 28
      Width = 1014
      Height = 89
      Align = alTop
      TabOrder = 1
      object LInformacionHoja: TLFLabel
        Left = 68
        Top = 52
        Width = 96
        Height = 13
        Caption = 'Informacion Fichero:'
      end
      object LSeparadorDecimal: TLFLabel
        Left = 768
        Top = 9
        Width = 90
        Height = 13
        Caption = 'Separador Decimal'
      end
      object LLog: TLabel
        Left = 1
        Top = 59
        Width = 1012
        Height = 13
        Align = alBottom
      end
      object EdArchivoImp: TLFEdit
        Left = 36
        Top = 4
        Width = 662
        Height = 21
        TabOrder = 0
        OnChange = EdArchivoImpChange
      end
      object CBHojaAImportar: TLFComboBox
        Left = 36
        Top = 26
        Width = 662
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBHojaAImportarChange
      end
      object ButtSelArchivo: TButton
        Left = 699
        Top = 4
        Width = 23
        Height = 21
        Hint = 'Seleccionar el archivo con las tarifas a importar'
        Caption = '...'
        TabOrder = 1
        OnClick = ButtSelArchivoClick
      end
      object BInformacionHoja: TButton
        Left = 36
        Top = 48
        Width = 23
        Height = 21
        Hint = 'Informacion de hoja a importar'
        Caption = 'i'
        TabOrder = 3
      end
      object PBProgresoImportacion: TProgressBar
        Left = 1
        Top = 72
        Width = 1012
        Height = 16
        Align = alBottom
        Min = 0
        Max = 100
        TabOrder = 6
      end
      object LFCBPrimeraFilaTitulos: TLFCheckBox
        Left = 764
        Top = 31
        Width = 200
        Height = 17
        Caption = 'Primera Fila contiene Titulos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
      object ESeparadorDecimal: TLFEdit
        Left = 864
        Top = 4
        Width = 49
        Height = 21
        TabOrder = 4
      end
      object BLeerExcel: TButton
        Left = 920
        Top = 4
        Width = 75
        Height = 49
        Caption = '&Leer Excel'
        TabOrder = 7
        OnClick = BLeerExcelClick
      end
    end
    object PNLDatos: TLFPanel
      Left = 2
      Top = 158
      Width = 1014
      Height = 427
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object spl1: TSplitter
        Left = 726
        Top = 0
        Width = 8
        Height = 427
        Cursor = crHSplit
        Color = clAppWorkSpace
        ParentColor = False
      end
      object SGDatosImp: TStringGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 427
        Align = alLeft
        BorderStyle = bsNone
        ColCount = 7
        DefaultColWidth = 75
        DefaultRowHeight = 17
        DefaultDrawing = False
        FixedCols = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
        TabOrder = 0
        OnClick = SGDatosImpClick
        OnDblClick = SGDatosImpDblClick
        OnDrawCell = SGDatosImpDrawCell
        OnSelectCell = SGDatosImpSelectCell
        RowHeights = (
          17
          17
          17
          17
          17)
      end
      object Arbol: TTreeView
        Left = 734
        Top = 0
        Width = 280
        Height = 427
        Align = alClient
        AutoExpand = True
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Indent = 19
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        RowSelect = True
        ShowHint = False
        TabOrder = 1
        TabStop = False
        OnClick = ArbolClick
        Items.Data = {
          01000000230000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          0A457363616E64616C6C6F}
      end
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 117
      Width = 1014
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object LArticulo: TLFLabel
        Left = 9
        Top = 4
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Articulo'
      end
      object EArticulo: TLFEdit
        Left = 48
        Top = 1
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = EArticuloChange
      end
      object BBusquedaAnterior: TButton
        Left = 170
        Top = 1
        Width = 21
        Height = 21
        Caption = '<'
        TabOrder = 1
        OnClick = BBusquedaAnteriorClick
      end
      object BBusquedaSiguiente: TButton
        Left = 194
        Top = 1
        Width = 21
        Height = 21
        Caption = '>'
        TabOrder = 2
        OnClick = BBusquedaSiguienteClick
      end
      object BRecrearMaterialesEscandallo: TButton
        Left = 224
        Top = 0
        Width = 161
        Height = 25
        Hint = 'Recrear Materiales Escandallo'
        Caption = 'Recrear Materiales Escandallo'
        TabOrder = 3
        OnClick = BRecrearMaterialesEscandalloClick
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 587
    Width = 1018
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'SGDatosImp.Width')
  end
end
