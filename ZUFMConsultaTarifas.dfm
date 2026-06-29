inherited ZFMConsultaTarifas: TZFMConsultaTarifas
  Left = 220
  Top = 224
  Width = 961
  Height = 639
  ActiveControl = LFCBColor
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Consulta Tarifas'
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 951
    Height = 151
    Align = alTop
    object LModelo: TLFLabel [0]
      Left = 21
      Top = 46
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    object LTipoLona: TLFLabel [1]
      Left = 8
      Top = 68
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Lona'
    end
    object LTarifa: TLFLabel [2]
      Left = 29
      Top = 90
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tarifa'
    end
    inherited TBMain: TLFToolBar
      Width = 947
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCargarDatos: TToolButton
        Left = 33
        Top = 0
        Action = ACargarDatos
      end
    end
    object LFModelos: TLFEditFind2000
      Left = 60
      Top = 42
      Width = 63
      Height = 21
      TabOrder = 1
      OnChange = LFModelosChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CODIGO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_SYS_MODELOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODIGO')
      Filtros = []
    end
    object LFTipoLona: TLFEditFind2000
      Left = 60
      Top = 64
      Width = 63
      Height = 21
      TabOrder = 2
      OnChange = LFTipoLonaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CODIGO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_SYS_LONAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODIGO')
      Filtros = []
    end
    object LFTarifas: TLFEditFind2000
      Left = 60
      Top = 86
      Width = 63
      Height = 21
      TabOrder = 3
      OnChange = LFTarifasChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TARIFA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'ACTIVA=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_TARIFAS_C'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TARIFA')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DescTipoLona: TLFEdit
      Left = 124
      Top = 64
      Width = 214
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
    object DescTarifa: TLFEdit
      Left = 124
      Top = 86
      Width = 214
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 8
    end
    object DescModelo: TLFEdit
      Left = 124
      Top = 42
      Width = 214
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object LFCBColor: TLFCheckBox
      Left = 460
      Top = 44
      Width = 49
      Height = 17
      Caption = 'Color'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      OnClick = LFCBColorClick
      Alignment = taLeftJustify
    end
    object RGPrecio: TRadioGroup
      Left = 347
      Top = 36
      Width = 101
      Height = 74
      Caption = 'Precio a mostrar'
      ItemIndex = 0
      Items.Strings = (
        'Toldo'
        'Armazon')
      TabOrder = 4
      OnClick = RGPrecioClick
    end
  end
  inherited TBActions: TLFToolBar
    Top = 586
    Width = 951
  end
  object PNLPrecios: TLFPanel [2]
    Left = 0
    Top = 151
    Width = 951
    Height = 435
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object StringGridTarifas: TStringGrid
      Left = 0
      Top = 0
      Width = 951
      Height = 435
      Align = alClient
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 0
      OnDrawCell = StringGridTarifasDrawCell
    end
  end
  inherited CEMain: TControlEdit
    Left = 792
    Top = 64
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 828
    Top = 64
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
    Left = 728
    Top = 44
    object ACargarDatos: TAction
      Category = 'Procesos'
      Caption = 'Cargar Datos'
      Hint = 'Cargar Datos'
      ImageIndex = 25
      OnExecute = ACargarDatosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AExportar: TAction
      Category = 'Procesos'
      Caption = 'Exportar Excel'
      OnExecute = AExportarExecute
    end
    object AExportarExcelLineal: TAction
      Category = 'Procesos'
      Caption = 'Exportar Excel Lineal'
      OnExecute = AExportarExcelLinealExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 804
    Top = 28
  end
end
