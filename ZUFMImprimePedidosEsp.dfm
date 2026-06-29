inherited ZFMImprimePedidosEsp: TZFMImprimePedidosEsp
  Left = 222
  Top = 244
  HelpContext = 208
  Caption = 'Impresi'#243'n autom'#225'tica de Pedidos Especiales'
  ClientHeight = 466
  ClientWidth = 792
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 788
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = ZDMImprimePedidosEsp.DSQMPedidosEsp
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 110
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepNav: TToolButton [2]
        Left = 156
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
        Hint = 'Marcar todos los Pedidos Pendientes'
        Caption = 'Marcar'
        ImageIndex = 146
        OnClick = TbuttMarcarClick
      end
      object TButtCancelar: TToolButton
        Left = 226
        Top = 0
        Hint = 'Desmarcar todos los Pedidos Pendientes'
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
      object ToolButton1: TToolButton
        Left = 293
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object Z_PnlCopias: TLFPanel
        Left = 301
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object Z_LblNumCopias: TLFLabel
          Left = 23
          Top = 4
          Width = 47
          Height = 13
          Caption = 'N'#186' Copias'
        end
        object Z_CENumCopias: TCurrencyEdit
          Left = 75
          Top = 0
          Width = 23
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          MaxLength = 1
          MaxValue = 9
          TabOrder = 0
        end
      end
    end
    object HYTDBGPedidosEsp: THYTDBGrid
      Left = 2
      Top = 28
      Width = 788
      Height = 412
      Align = alClient
      Color = clInfoBk
      DataSource = ZDMImprimePedidosEsp.DSQMPedidosEsp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = HYTDBGPedidosEspCellClick
      OnKeyDown = HYTDBGPedidosEspKeyDown
      OnKeyUp = HYTDBGPedidosEspKeyUp
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
        'FECHA_ENTREGA_PREV'
        'FORMA_PAGO'
        'MONEDA'
        'NOMBRE_COMERCIAL'
        'RIG'
        'SERIE'
        'SU_REFERENCIA'
        'TITULO'
        'Z_COD_BARRAS_PED')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'Z_COD_BARRAS_PED'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 273
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          Width = 207
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 792
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
    object MIImprimirAlbaranes: TMenuItem
      Caption = 'Imprimir Pedidos Pendientes'
      ImageIndex = 14
      OnClick = MIImprimirAlbaranesClick
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
