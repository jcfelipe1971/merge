inherited FMGenFacturaElec: TFMGenFacturaElec
  Left = 284
  Top = 206
  Width = 1241
  Height = 593
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Generaci'#243'n de Facturas electr'#243'nicas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1231
    Height = 540
    inherited TBMain: TLFToolBar
      Width = 1227
      Height = 29
      ButtonHeight = 25
      inherited NavMain: THYMNavigator
        Width = 190
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 190
      end
      inherited EPMain: THYMEditPanel
        Left = 198
        Width = 68
        Height = 25
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 266
      end
      inherited TbuttComp: TToolButton
        Left = 274
      end
      object TBSep1: TToolButton
        Left = 297
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object PNLCarpeta: TLFPanel
        Left = 305
        Top = 0
        Width = 477
        Height = 25
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          477
          25)
        object LCarpeta: TLFLabel
          Left = 8
          Top = 5
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Carpeta'
        end
        object SBBuscarCarpeta: TSpeedButton
          Left = 451
          Top = 3
          Width = 22
          Height = 20
          Hint = 'Filtrar'
          Anchors = [akTop, akRight]
          Caption = '...'
          Flat = True
          NumGlyphs = 2
          OnClick = SBBuscarCarpetaClick
        end
        object ECarpeta: TLFEdit
          Left = 48
          Top = 2
          Width = 402
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object TBMarcarTodas: TToolButton
        Left = 782
        Top = 0
        Hint = 'Marcar todos los registros'
        Caption = 'Marcar Todo'
        ImageIndex = 146
        OnClick = TBMarcarTodasClick
      end
      object TBDesmarcarTodas: TToolButton
        Left = 805
        Top = 0
        Hint = 'Desmarcar todas los registros'
        Caption = 'Desmarcar Todas'
        ImageIndex = 147
        OnClick = TBDesmarcarTodasClick
      end
      object TBSep2: TToolButton
        Left = 828
        Top = 0
        Width = 8
        ImageIndex = 34
        Style = tbsSeparator
      end
      object TBExportar: TToolButton
        Left = 836
        Top = 0
        Hint = 'Exportar registros seleccionados'
        Caption = 'Exportar'
        ImageIndex = 33
        OnClick = TBExportarClick
      end
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 31
      Width = 1227
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LDesde: TLFLabel
        Left = 258
        Top = 5
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHasta: TLFLabel
        Left = 370
        Top = 5
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object SBLimpiar: TSpeedButton
        Left = 6
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Limpiar'
        Flat = True
        NumGlyphs = 2
        OnClick = SBLimpiarClick
      end
      object EDesdeDocumento: TLFEdit
        Left = 294
        Top = 2
        Width = 60
        Height = 21
        TabOrder = 1
        Text = '0'
        OnChange = FiltrarClick
      end
      object EHastaDocumento: TLFEdit
        Left = 403
        Top = 2
        Width = 60
        Height = 21
        TabOrder = 2
        Text = '0'
        OnChange = FiltrarClick
      end
      object PNLCliente: TLFPanel
        Left = 465
        Top = 0
        Width = 456
        Height = 26
        BevelOuter = bvNone
        TabOrder = 3
        DesignSize = (
          456
          26)
        object LCliente: TLFLabel
          Left = 14
          Top = 5
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object ETitCliente: TLFEdit
          Left = 141
          Top = 2
          Width = 311
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object LFCliente: TLFEditFind2000
          Left = 51
          Top = 2
          Width = 89
          Height = 21
          TabOrder = 0
          OnChange = LFClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object PNLTitSerie: TLFPanel
        Left = 39
        Top = 0
        Width = 210
        Height = 25
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          210
          25)
        object LSerie: TLFLabel
          Left = 6
          Top = 6
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object CBSeries: TLFComboBox
          Left = 34
          Top = 2
          Width = 172
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          OnChange = FiltrarClick
        end
      end
    end
    object DBGFacturas: THYTDBGrid
      Left = 2
      Top = 60
      Width = 1227
      Height = 478
      Align = alClient
      Color = clInfoBk
      DataSource = DMGenFacturaElec.DSQMFacturas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 2
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
          Width = 80
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 540
    Width = 1231
  end
  inherited CEMain: TControlEdit
    Left = 304
    Top = 76
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 356
    Top = 92
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
end
