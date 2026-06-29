inherited FMInsercionArticuloDesdeTexto: TFMInsercionArticuloDesdeTexto
  Left = 425
  Top = 262
  Width = 743
  Height = 455
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Inserci'#243'n / Edici'#243'n Art'#237'culo'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 733
    Height = 402
    OnResize = PMainResize
    object Split: TSplitter [0]
      Left = 2
      Top = 272
      Width = 729
      Height = 8
      Cursor = crVSplit
      Align = alBottom
      Color = clMedGray
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 729
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object TButtInserta: TToolButton
        Left = 25
        Top = 0
        Hint = 'Inserta o Edita el Art'#237'culo'
        Caption = 'Insertar'
        ImageIndex = 49
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtInsertaClick
      end
      object TButtSep1: TToolButton
        Left = 48
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPrevisualizar: TToolButton
        Left = 56
        Top = 0
        Hint = 'Previsualizar los 100 primeros registros'
        Caption = 'Previsualizar'
        ImageIndex = 21
        OnClick = TButtPrevisualizarClick
      end
      object TSep2: TToolButton
        Left = 79
        Top = 0
        Width = 8
        ImageIndex = 0
        Style = tbsSeparator
      end
      object chModifica: TLFCheckBox
        Left = 87
        Top = 0
        Width = 74
        Height = 22
        Caption = 'Modifica'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Visible = False
        Alignment = taLeftJustify
      end
      object PNLProgreso: TLFPanel
        Left = 161
        Top = 0
        Width = 185
        Height = 22
        TabOrder = 2
        object LProgreso: TLFLabel
          Left = 1
          Top = 1
          Width = 55
          Height = 20
          Align = alLeft
          Alignment = taRightJustify
          Caption = 'Importacion'
          Layout = tlCenter
        end
        object PBProgreso: TProgressBar
          Left = 56
          Top = 1
          Width = 128
          Height = 20
          Align = alClient
          Min = 0
          Max = 100
          TabOrder = 0
        end
      end
    end
    object MemListaArticulos: TLFMemo
      Left = 2
      Top = 112
      Width = 729
      Height = 160
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
    object PNLConfiguracion: TLFPanel
      Left = 2
      Top = 28
      Width = 729
      Height = 84
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LCampo2: TLFLabel
        Left = 91
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 2'
      end
      object LCampo1: TLFLabel
        Left = 0
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 1'
      end
      object LCampo4: TLFLabel
        Left = 273
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 4'
      end
      object LCampo3: TLFLabel
        Left = 182
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 3'
      end
      object LCampo6: TLFLabel
        Left = 455
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 6'
      end
      object LCampo5: TLFLabel
        Left = 364
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 5'
      end
      object LSeparador: TLFLabel
        Left = 3
        Top = 42
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Separador'
      end
      object LCampo7: TLFLabel
        Left = 546
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 7'
      end
      object LCampo8: TLFLabel
        Left = 637
        Top = 2
        Width = 89
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Campo 8'
      end
      object LCodigosIgnorar: TLFLabel
        Left = 393
        Top = 42
        Width = 58
        Height = 13
        Hint = 'Ignorar articulos que contengan estos textos en su codigo'
        Alignment = taRightJustify
        Caption = 'Ignorar Cod.'
        ParentShowHint = False
        ShowHint = True
      end
      object LNoCrearEscandallo: TLFLabel
        Left = 329
        Top = 63
        Width = 122
        Height = 13
        Hint = 'Ignorar articulos que contengan estos textos en su codigo'
        Alignment = taRightJustify
        Caption = 'No crear Esc. Produccion'
        ParentShowHint = False
        ShowHint = True
      end
      object CBCampo1: TLFComboBox
        Left = 0
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 0
        Text = 'Articulo'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor'
          'P. Coste'
          'Descuento 1'
          'Descuento 2'
          'Descuento 3'
          'Fec. Prevista')
      end
      object CBCampo2: TLFComboBox
        Left = 91
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 1
        Text = 'Unidades'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor')
      end
      object CBCampo3: TLFComboBox
        Left = 182
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 2
        Text = 'Lote'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor')
      end
      object CBCampo4: TLFComboBox
        Left = 273
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 3
        Text = 'Id Ubicacion'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor')
      end
      object CBCampo5: TLFComboBox
        Left = 364
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 4
        Text = 'Precio'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor')
      end
      object CBCampo6: TLFComboBox
        Left = 455
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 5
        Text = 'No importar'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor')
      end
      object ESeparador: TLFEdit
        Left = 55
        Top = 39
        Width = 33
        Height = 21
        TabOrder = 8
        Text = ';'
      end
      object DBCBTabulador: TLFDBCheckBox
        Left = 90
        Top = 42
        Width = 81
        Height = 17
        Caption = 'Tabulador'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 9
        TabStop = True
        Alignment = taLeftJustify
        OnChange = DBCBTabuladorChange
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object CBIgnorarPrimeraLinea: TLFCheckBox
        Left = 176
        Top = 42
        Width = 145
        Height = 17
        Caption = 'Ignorar Primera Linea'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 10
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBCampo7: TLFComboBox
        Left = 546
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 6
        Text = 'No importar'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor')
      end
      object CBCampo8: TLFComboBox
        Left = 637
        Top = 17
        Width = 89
        Height = 21
        DropDownCount = 16
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 7
        Text = 'No importar'
        Items.Strings = (
          'No importar'
          'Articulo'
          'Unidades'
          'Lote'
          'Id Ubicacion'
          'Precio'
          'Descripcion'
          'Familia'
          'Subfamilia'
          'Proveedor'
          'Ref. Proveedor')
      end
      object ECodIgnorar1: TLFEdit
        Left = 455
        Top = 39
        Width = 53
        Height = 21
        TabOrder = 12
      end
      object ECodIgnorar2: TLFEdit
        Left = 509
        Top = 39
        Width = 53
        Height = 21
        TabOrder = 13
      end
      object ECodIgnorar3: TLFEdit
        Left = 563
        Top = 39
        Width = 53
        Height = 21
        TabOrder = 14
      end
      object ECodIgnorar4: TLFEdit
        Left = 617
        Top = 39
        Width = 53
        Height = 21
        TabOrder = 15
      end
      object ECodIgnorar5: TLFEdit
        Left = 671
        Top = 39
        Width = 53
        Height = 21
        TabOrder = 16
      end
      object ENoCrearEscandallo1: TLFEdit
        Left = 455
        Top = 61
        Width = 53
        Height = 21
        TabOrder = 17
      end
      object ENoCrearEscandallo2: TLFEdit
        Left = 509
        Top = 61
        Width = 53
        Height = 21
        TabOrder = 18
      end
      object ENoCrearEscandallo3: TLFEdit
        Left = 563
        Top = 61
        Width = 53
        Height = 21
        TabOrder = 19
      end
      object ENoCrearEscandallo4: TLFEdit
        Left = 617
        Top = 61
        Width = 53
        Height = 21
        TabOrder = 20
      end
      object ENoCrearEscandallo5: TLFEdit
        Left = 671
        Top = 61
        Width = 53
        Height = 21
        TabOrder = 21
      end
      object CBIgnorarUnidadesCero: TLFCheckBox
        Left = 176
        Top = 61
        Width = 145
        Height = 17
        Hint = 'Ignorar Lineas sin unidades'
        Caption = 'Ignorar Lineas sin uds.'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 11
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object SGPrevisualizacion: TStringGrid
      Left = 2
      Top = 280
      Width = 729
      Height = 120
      Align = alBottom
      ColCount = 11
      DefaultColWidth = 63
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 10
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 3
    end
  end
  inherited TBActions: TLFToolBar
    Top = 402
    Width = 733
  end
  inherited CEMain: TControlEdit
    Left = 304
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 336
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
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 400
    Top = 0
  end
end
