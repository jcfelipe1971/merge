inherited FMDivideFacturas: TFMDivideFacturas
  Left = 285
  Top = 191
  Width = 802
  Height = 495
  HelpContext = 207
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Divisi'#243'n de Facturas'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 788
      TabOrder = 2
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMDivideFacturas.DSQMFacturas
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
        DataSource = DMDivideFacturas.DSQMFacturas
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
      object TSep1: TToolButton
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
      object TSep2: TToolButton
        Left = 249
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtDividir: TToolButton
        Left = 257
        Top = 0
        Hint = 'Dividir'
        Caption = 'Dividir'
        ImageIndex = 37
        OnClick = TButtDividirClick
      end
      object TSep3: TToolButton
        Left = 280
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescarKri: TToolButton
        Left = 288
        Top = 0
        Hint = 'Refrescar'
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = TButtRefrescarKriClick
      end
    end
    object DBGFacturas: THYTDBGrid
      Left = 2
      Top = 191
      Width = 788
      Height = 249
      Align = alClient
      Color = clInfoBk
      DataSource = DMDivideFacturas.DSQMFacturas
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
      OnCellClick = DBGFacturasCellClick
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
        end>
    end
    object PnlPedidos: TLFPanel
      Left = 2
      Top = 28
      Width = 788
      Height = 163
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeFecha: TLFLabel
        Left = 36
        Top = 73
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LHastaFecha: TLFLabel
        Left = 39
        Top = 93
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeCliente: TLFLabel
        Left = 34
        Top = 6
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Cliente'
      end
      object LHastaCliente: TLFLabel
        Left = 37
        Top = 29
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Cliente'
      end
      object LPorcentaje: TLFLabel
        Left = 49
        Top = 139
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Porcentaje'
      end
      object LProyecto: TLFLabel
        Left = 58
        Top = 51
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Proyecto'
      end
      object LCanalDestino: TLFLabel
        Left = 34
        Top = 116
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Canal Destino'
      end
      object BFiltrar: TButton
        Left = 620
        Top = 47
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 7
        OnClick = BFiltrarClick
      end
      object BLimpiar: TButton
        Left = 696
        Top = 47
        Width = 75
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 8
        OnClick = BLimpiarClick
      end
      object DEDesdeFecha: TLFDateEdit
        Left = 104
        Top = 69
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object DEHastaFecha: TLFDateEdit
        Left = 104
        Top = 91
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object EDesdeCliente: TLFEdit
        Left = 226
        Top = 3
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 9
      end
      object EHastaCliente: TLFEdit
        Left = 226
        Top = 25
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 10
      end
      object EPorcentaje: TLFEdit
        Left = 104
        Top = 135
        Width = 121
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 6
        Text = '100'
      end
      object EFDesdeCliente: TLFEditFind2000
        Left = 104
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = EFDesdeClienteChange
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
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCliente: TLFEditFind2000
        Left = 104
        Top = 25
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = EFHastaClienteChange
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
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFProyecto: TLFEditFind2000
        Left = 104
        Top = 47
        Width = 121
        Height = 21
        TabOrder = 2
        OnChange = EFProyectoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROYECTO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_PROYECTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROYECTO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EProyecto: TLFEdit
        Left = 226
        Top = 47
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 11
      end
      object EFCanalDestino: TLFEditFind2000
        Left = 104
        Top = 113
        Width = 121
        Height = 21
        TabOrder = 5
        OnChange = EFCanalDestinoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CANAL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CANAL')
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object ECanalDestino: TLFEdit
        Left = 226
        Top = 113
        Width = 350
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 12
      end
      object CBSeries: TLFComboBox
        Left = 620
        Top = 4
        Width = 149
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 13
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 792
  end
  inherited CEMain: TControlEdit
    DataSource = DMDivideFacturas.DSQMFacturas
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
end
