inherited FMimprimePedidos: TFMimprimePedidos
  Left = 285
  Top = 311
  Width = 1060
  Height = 495
  HelpContext = 208
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Impresi'#243'n autom'#225'tica de Pedidos'
  Constraints.MinHeight = 495
  Constraints.MinWidth = 1060
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1050
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 1046
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 2
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMImprimePedidos.DSQMPedidos
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
        Hint = 'Marcar todos los Pedidos'
        Caption = 'Marcar'
        ImageIndex = 146
        OnClick = TbuttMarcarClick
      end
      object TButtCancelar: TToolButton
        Left = 226
        Top = 0
        Hint = 'Desmarcar todos los Pedidos'
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
        OnClick = MIImprimirPedidosClick
      end
      object ToolButton1: TToolButton
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
        TabOrder = 3
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
        Width = 205
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          205
          22)
        object CBDocsPendientes: TLFCheckBox
          Left = 2
          Top = 3
          Width = 184
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
    end
    object DBGPedidos: THYTDBGrid
      Left = 2
      Top = 58
      Width = 1046
      Height = 382
      Align = alClient
      Color = clInfoBk
      DataSource = DMImprimePedidos.DSQMPedidos
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
      OnCellClick = DBGPedidosCellClick
      OnDrawColumnCell = DBGPedidosDrawColumnCell
      OnDblClick = DBGPedidosDblClick
      OnKeyDown = DBGPedidosKeyDown
      OnKeyUp = DBGPedidosKeyUp
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'CANAL'
        'CLIENTE'
        'FECHA'
        'FORMA_PAGO'
        'MONEDA'
        'RIG'
        'SERIE'
        'SU_REFERENCIA'
        'TITULO'
        'TOTAL_A_COBRAR')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          Width = 80
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
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGO'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Width = 250
          Visible = True
        end>
    end
    object PnlPedidos: TLFPanel
      Left = 2
      Top = 28
      Width = 1046
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
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 1050
  end
  inherited CEMain: TControlEdit
    Left = 368
    Top = 165
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 408
    Top = 176
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
  object PMImprime: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 376
    Top = 90
    object MIImprimirPedidos: TMenuItem
      Caption = 'Imprimir Pedidos'
      ImageIndex = 14
      OnClick = MIImprimirPedidosClick
    end
    object MIEnvioPDF: TMenuItem
      Caption = 'Env'#237'o por e-mail en pdf'
      ImageIndex = 34
      OnClick = MIEnvioPDFClick
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
