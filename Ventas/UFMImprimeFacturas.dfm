inherited FMImprimeFacturas: TFMImprimeFacturas
  Left = 241
  Top = 191
  Width = 1205
  Height = 495
  HelpContext = 207
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Impresi'#243'n autom'#225'tica de Facturas'
  Constraints.MinHeight = 495
  Constraints.MinWidth = 1060
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1195
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 1191
      TabOrder = 2
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMImprimeFacturas.DSQMFacturas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
      object TButtSeparador2: TToolButton
        Left = 195
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TbuttMarcar: TToolButton
        Left = 203
        Top = 0
        Hint = 'Marcar todas las facturas'
        Caption = 'Marcar'
        ImageIndex = 146
        OnClick = TbuttMarcarClick
      end
      object TButtCancelar: TToolButton
        Left = 226
        Top = 0
        Hint = 'Desmarcar todas las facturas'
        Caption = 'Cancelar'
        ImageIndex = 147
        OnClick = TButtCancelarClick
      end
      object TButtSeparador1: TToolButton
        Left = 249
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimir: TToolButton
        Left = 257
        Top = 0
        Hint = 'Listados'
        Caption = 'Imprimir'
        DropdownMenu = PMImprime
        ImageIndex = 14
        Style = tbsDropDown
      end
      object TButtSeparador3: TToolButton
        Left = 293
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescarKri: TToolButton
        Left = 301
        Top = 0
        Hint = 'Refrescar'
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = TButtRefrescarKriClick
      end
      object PNLSeries: TLFPanel
        Left = 324
        Top = 0
        Width = 157
        Height = 22
        BevelOuter = bvNone
        TabOrder = 4
        object LSerie: TLFLabel
          Left = 9
          Top = 3
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object CBSeries: TLFComboBox
          Left = 37
          Top = 0
          Width = 117
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSeriesChange
        end
      end
      object PNLSoloPendientes: TLFPanel
        Left = 481
        Top = 0
        Width = 176
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          176
          22)
        object CBDocsPendientes: TLFCheckBox
          Left = 2
          Top = 2
          Width = 171
          Height = 17
          Caption = 'Solo documentos pendientes'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Anchors = [akLeft, akTop, akRight, akBottom]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Alignment = taLeftJustify
          OnChange = CBDocsPendientesChange
        end
      end
      object PNLForzarCopias: TLFPanel
        Left = 657
        Top = 0
        Width = 163
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object CBForzarCopias: TLFCheckBox
          Left = 8
          Top = 2
          Width = 97
          Height = 17
          Caption = 'Forzar Copias'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBForzarCopiasChange
        end
        object ECopias: TLFEdit
          Left = 112
          Top = 0
          Width = 49
          Height = 21
          TabOrder = 1
          Text = '1'
        end
      end
      object PNLFechaCon: TLFPanel
        Left = 820
        Top = 0
        Width = 150
        Height = 22
        BevelOuter = bvNone
        TabOrder = 5
        object LFechaCon: TLFLabel
          Left = 11
          Top = 3
          Width = 46
          Height = 13
          Hint = 'Fecha de contabilizacion al cerrar factura.'
          Alignment = taRightJustify
          Caption = 'Fec. Cont'
        end
        object DEFechaCon: TLFDateEdit
          Left = 62
          Top = 1
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DEFechaConChange
        end
      end
      object PNLMarcarImpreso: TLFPanel
        Left = 970
        Top = 0
        Width = 103
        Height = 22
        BevelOuter = bvNone
        TabOrder = 6
        DesignSize = (
          103
          22)
        object CBMarcarImpreso: TLFCheckBox
          Left = 2
          Top = 2
          Width = 97
          Height = 16
          Caption = 'Marcar Impreso'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Anchors = [akLeft, akTop, akRight, akBottom]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Alignment = taLeftJustify
          OnChange = CBDocsPendientesChange
        end
      end
    end
    object DBGFacturas: THYTDBGrid
      Left = 2
      Top = 58
      Width = 1191
      Height = 382
      Align = alClient
      Color = clInfoBk
      DataSource = DMImprimeFacturas.DSQMFacturas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGFacturasCellClick
      OnDrawColumnCell = DBGFacturasDrawColumnCell
      OnDblClick = DBGFacturasDblClick
      OnKeyDown = DBGFacturasKeyDown
      OnKeyUp = DBGFacturasKeyUp
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'AGENTE'
        'CANAL'
        'CLIENTE'
        'ESTADO'
        'FECHA'
        'FORMA_PAGO'
        'MONEDA'
        'RIG'
        'SERIE'
        'SU_REFERENCIA'
        'TITULO'
        'TOTAL_A_COBRAR'
        'Z_OBSERVACION'
        'PEDIDO_CLIENTE')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGO'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_A_COBRAR'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_ESTADO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO_CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FOLIO'
          Width = 90
          Visible = True
        end>
    end
    object PnlPedidos: TLFPanel
      Left = 2
      Top = 28
      Width = 1191
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LDesde: TLFLabel
        Left = 35
        Top = 7
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHasta: TLFLabel
        Left = 147
        Top = 7
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object BtnFiltrar: TSpeedButton
        Left = 248
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Filtrar'
        Flat = True
        NumGlyphs = 2
        OnClick = BtnFiltrarClick
      end
      object BtnLimpiar: TSpeedButton
        Left = 6
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Limpiar'
        Flat = True
        NumGlyphs = 2
        OnClick = BtnLimpiarClick
      end
      object EDesdeDocumento: TLFEdit
        Left = 71
        Top = 4
        Width = 60
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object EHastaDocumento: TLFEdit
        Left = 180
        Top = 4
        Width = 60
        Height = 21
        TabOrder = 1
        Text = '0'
      end
      object PNLCopiasAgente: TLFPanel
        Left = 288
        Top = 0
        Width = 481
        Height = 30
        BevelOuter = bvNone
        TabOrder = 2
        object LCarpetaCopiasAgente: TLFLabel
          Left = 8
          Top = 8
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Carpeta'
        end
        object ECarpetaCopiasAgente: TLFEdit
          Left = 48
          Top = 4
          Width = 401
          Height = 21
          TabOrder = 0
        end
        object BBuscarCarpeta: TButton
          Left = 450
          Top = 2
          Width = 27
          Height = 25
          Caption = '...'
          TabOrder = 1
          OnClick = BBuscarCarpetaClick
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 1195
  end
  inherited CEMain: TControlEdit
    Left = 608
    Top = 269
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 648
    Top = 234
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
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 608
    Top = 200
  end
  inherited FSMain: TLFFibFormStorage
    Left = 648
    Top = 200
  end
  object PMImprime: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 608
    Top = 234
    object MIImprimirEnivarFacturas: TMenuItem
      Caption = 'Imprimir/Envio e-mail PDF segun conf. Cliente'
      Hint = 
        'Imprimir Facturas. Envia por correo en formato PDF si el cliente' +
        ' tiene marcada la opci'#243'n en Datos Facturaci'#243'n.'
      ImageIndex = 14
      OnClick = MIImprimirEnivarFacturasClick
    end
    object MIEnvioPDF: TMenuItem
      Caption = 'Env'#237'o por e-mail en pdf'
      Hint = 'Envia correo con PDF de la factura adjunto'
      ImageIndex = 34
      OnClick = MIEnvioPDFClick
    end
    object MIImprimirFacturas: TMenuItem
      Caption = 'Imprimir Facturas'
      Hint = 'Imprime Factura'
      ImageIndex = 14
      OnClick = MIImprimirFacturasClick
    end
    object MIMandarporEmail: TMenuItem
      Caption = 'Env'#237'o por e-mail'
      Hint = 'Envia factura como texto de correo.'
      ImageIndex = 34
      OnClick = MIMandarporEmailClick
    end
    object MIGuardaCopiaPDF: TMenuItem
      Caption = 'Guardar como PDF'
      Hint = 'Guarda una copia en formato PDF de las factuas en Mis Documentos'
      ImageIndex = 125
      OnClick = MIGuardaCopiaPDFClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MIConfiguracionRapida: TMenuItem
      Caption = 'Configuraci'#243'n R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida'
      ImageIndex = 77
      OnClick = MIConfiguracionRapidaClick
    end
  end
end
