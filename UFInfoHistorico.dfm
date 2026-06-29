inherited FInfoHistorico: TFInfoHistorico
  Left = 491
  Top = 219
  Width = 896
  Height = 476
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Hist'#243'rico de Precios'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Top = 28
    Width = 886
    Height = 395
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 882
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = DMInfoHistorico.DSQHist_Precios
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 121
      end
      inherited TbuttComp: TToolButton
        Left = 129
      end
      object PNLFiltros: TLFPanel
        Left = 152
        Top = 0
        Width = 557
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LTipoDocumento: TLFLabel
          Left = 371
          Top = 3
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo'
        end
        object CBSoloEjercicio: TLFCheckBox
          Left = 8
          Top = 2
          Width = 121
          Height = 22
          Caption = 'Solo este Ejercicio'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBChange
        end
        object CBSoloSerie: TLFCheckBox
          Left = 128
          Top = 2
          Width = 121
          Height = 22
          Caption = 'Solo esta Serie'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBChange
        end
        object CBSoloCanal: TLFCheckBox
          Left = 248
          Top = 2
          Width = 121
          Height = 22
          Caption = 'Solo este Canal'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBChange
        end
        object CBTipoDocumento: TLFComboBox
          Left = 396
          Top = 0
          Width = 161
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = 'Todos'
          OnChange = CBChange
          Items.Strings = (
            'Todos'
            'OFC'
            'PEC'
            'ALB'
            'FAC')
        end
      end
    end
    object DBGInfo: THYTDBGrid
      Left = 2
      Top = 28
      Width = 882
      Height = 365
      Align = alClient
      BorderStyle = bsNone
      Color = clInfoBk
      DataSource = DMInfoHistorico.DSQHist_Precios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGInfoDrawColumnCell
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = False
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAMarcar.Strings = (
        'APLICA_UNIDADES_SECUNDARIAS')
      CamposChecked.Strings = (
        '1')
      CamposNoChecked.Strings = (
        '0')
      CamposAOrdenar.Strings = (
        'CANAL'
        'DESCUENTO'
        'DESCUENTO_2'
        'DESCUENTO_3'
        'FECHA'
        'MONEDA'
        'NOMBRE'
        'P_COSTE'
        'PRECIO'
        'RIG'
        'SERIE'
        'TIPO'
        'TITULO'
        'UNIDADES')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_2'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_3'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 300
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 423
    Width = 886
    TabOrder = 2
  end
  object PNLDatos: TLFPanel [2]
    Left = 0
    Top = 0
    Width = 886
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LBLCodigo: TLFLabel
      Left = 11
      Top = 6
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LBLArticulo: TLFLabel
      Left = 379
      Top = 6
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEArticulo: TLFDbedit
      Left = 432
      Top = 2
      Width = 310
      Height = 21
      Color = clInfoBk
      DataField = 'NARTICULO'
      DataSource = DMInfoHistorico.DSQHist_Precios
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBECliente: TLFDbedit
      Left = 58
      Top = 2
      Width = 310
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE'
      DataSource = DMInfoHistorico.DSQHist_Precios
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited CEMain: TControlEdit
    Left = 456
    Top = 136
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 488
    Top = 136
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBSoloCanal.Checked'
      'CBSoloEjercicio.Checked'
      'CBSoloSerie.Checked'
      'CBTipoDocumento.ItemIndex')
  end
end
