object FPregTalones: TFPregTalones
  Left = 415
  Top = 284
  Width = 568
  Height = 430
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Talones'
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 560
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 61
    Flat = True
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Separators = True
    object TButtImprimir: TToolButton
      Left = 0
      Top = 0
      Action = AImprimir
    end
    object TButtVisualizar: TToolButton
      Left = 61
      Top = 0
      Action = AVisualizar
      Caption = '&Visualizar'
    end
    object TButtSalir: TToolButton
      Left = 122
      Top = 0
      Action = ASalir
    end
    object TButtConfigurar: TToolButton
      Left = 183
      Top = 0
      Caption = '&Configurar'
      ImageIndex = 77
      OnClick = TButtConfigurarClick
    end
  end
  object PNLListArt: TLFPanel
    Left = 0
    Top = 41
    Width = 560
    Height = 362
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PNLSeleccionTalones: TLFPanel
      Left = 0
      Top = 0
      Width = 560
      Height = 72
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LBLTalonHasta: TLFLabel
        Left = 28
        Top = 48
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LblTalonDesde: TLFLabel
        Left = 25
        Top = 26
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFTalon_Hasta: TLFEditFind2000
        Left = 62
        Top = 44
        Width = 108
        Height = 21
        TabOrder = 0
        OnChange = EFTalon_HastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TALON'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_TALONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TALON')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTalon_Desde: TLFEditFind2000
        Left = 62
        Top = 22
        Width = 108
        Height = 21
        TabOrder = 1
        OnChange = EFTalon_DesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = True
        CampoNum = 'TALON'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_TALONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TALON')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETalonHasta: TLFDbedit
        Left = 171
        Top = 44
        Width = 366
        Height = 21
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = DMLstTalones.DSxTalonHasta
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBETalonDesde: TLFDbedit
        Left = 171
        Top = 22
        Width = 366
        Height = 21
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = DMLstTalones.DSxTalonDesde
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object CBMostrarNoContabilizadosKri: TLFCheckBox
        Left = 89
        Top = 3
        Width = 168
        Height = 17
        Caption = 'Solo los NO Contabilizados'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        TabOrder = 4
        TabStop = True
        OnClick = CBMostrarNoContabilizadosKriClick
        Alignment = taLeftJustify
      end
    end
    object PNLRenumeracion: TLFPanel
      Left = 0
      Top = 72
      Width = 560
      Height = 290
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGRenumeracionTalones: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 560
        Height = 290
        Align = alClient
        DataSource = DMLstTalones.DSxTalonesList
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
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
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
        CamposAOrdernar.Strings = (
          'TALON')
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
            FieldName = 'TALON'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TALON_PAPEL'
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIPO_TERCERO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COD_CLI_PRO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DESCRIPCION'
            ReadOnly = True
            Width = 240
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE'
            ReadOnly = True
            Width = 62
            Visible = True
          end>
      end
    end
  end
  object ActionList1: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 328
    Top = 50
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AVisualizar: TAction
      Caption = '&Visualizar'
      Hint = 'Visualizar'
      ImageIndex = 19
      OnExecute = AVisualizarExecute
    end
    object AImprimir: TAction
      Caption = '&Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
  end
end
