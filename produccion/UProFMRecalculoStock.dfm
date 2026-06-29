object ProFmRecalculoStock: TProFmRecalculoStock
  Left = 553
  Top = 192
  Width = 374
  Height = 156
  Caption = 'Rec'#225'lculo de Stocks Art'#237'culo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 24
    Width = 366
    Height = 105
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LArticulo: TLFLabel
      Left = 13
      Top = 3
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo'
    end
    object CBReservadas: TLFCheckBox
      Left = 15
      Top = 49
      Width = 292
      Height = 17
      Caption = 'Recalcula las unidades reservadas en producci'#243'n '
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBEnProceso: TLFCheckBox
      Left = 15
      Top = 69
      Width = 292
      Height = 17
      Caption = 'Recalcula las unidades en proceso de producci'#243'n '
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object DBEFArticulo: TLFEditFind2000
      Left = 15
      Top = 21
      Width = 94
      Height = 21
      TabOrder = 0
      OnChange = DBEFArticuloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'CONTROL_STOCK = 1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EArticulo: TLFEdit
      Left = 110
      Top = 21
      Width = 251
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
  end
  object TBOptions: TLFToolBar
    Left = 0
    Top = 0
    Width = 366
    Height = 24
    ButtonHeight = 21
    ButtonWidth = 51
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    List = True
    ParentColor = False
    ShowCaptions = True
    TabOrder = 1
    ActionList = ALMain
    Separators = True
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 152
    Top = 8
    object ASalir: TAction
      Caption = 'Cerrar'
      Hint = 'Cerrar esta ventana'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AProcesar: TAction
      Caption = 'Procesar'
      Hint = 'Procesar'
      ImageIndex = 16
      OnExecute = AProcesarExecute
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 104
    Top = 10
  end
end
