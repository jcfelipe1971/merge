inherited FPregMovManStock: TFPregMovManStock
  Left = 348
  Top = 326
  Caption = 'Listado de Movimientos Manuales de Stock'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    object LDesdeFamilia: TLFLabel [0]
      Left = 16
      Top = 65
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Familia'
    end
    object LDesdeArticulo: TLFLabel [1]
      Left = 11
      Top = 109
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Art'#237'culo'
    end
    object LHastaFamilia: TLFLabel [2]
      Left = 19
      Top = 87
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Familia'
    end
    object LHastaArticulo: TLFLabel [3]
      Left = 14
      Top = 131
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Art'#237'culo'
    end
    object LDesdeCanalOrigen: TLFLabel [4]
      Left = 45
      Top = 153
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Canal Orig.'
    end
    object LDesdeCanalDestino: TLFLabel [5]
      Left = 304
      Top = 153
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Canal Dest.'
    end
    object LHastaCanalOrigen: TLFLabel [6]
      Left = 48
      Top = 175
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Canal Orig.'
    end
    object LHastaCanalDestino: TLFLabel [7]
      Left = 307
      Top = 175
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Canal Dest.'
    end
    object LDesdeAlmacenOrigen: TLFLabel [8]
      Left = 31
      Top = 197
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Almac'#233'n Orig.'
    end
    object LDesdeAlmacenDestino: TLFLabel [9]
      Left = 290
      Top = 197
      Width = 103
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Almac'#233'n Dest.'
    end
    object LHastaAlmacenOrigen: TLFLabel [10]
      Left = 34
      Top = 219
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Almac'#233'n Orig.'
    end
    object LHastaAlmacenDestino: TLFLabel [11]
      Left = 294
      Top = 219
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Almac'#233'n Dest.'
    end
    inherited TBMain: TLFToolBar
      Width = 592
      TabOrder = 18
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object EFArticuloD: TLFEditFind2000
      Left = 87
      Top = 105
      Width = 90
      Height = 21
      TabOrder = 2
      OnChange = EFArticuloDChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloDBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArticuloH: TLFEditFind2000
      Left = 87
      Top = 127
      Width = 90
      Height = 21
      TabOrder = 3
      OnChange = EFArticuloHChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloHBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEArticuloD: TLFDbedit
      Left = 178
      Top = 105
      Width = 400
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLSTMovManStock.DSxArticuloD
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object DBEArticuloH: TLFDbedit
      Left = 178
      Top = 127
      Width = 400
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLSTMovManStock.DSxArticuloH
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object EFFamiliaD: TLFEditFind2000
      Left = 87
      Top = 61
      Width = 90
      Height = 21
      TabOrder = 0
      OnChange = EFFamiliaDChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'FAMILIA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_FAMILIAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFFamiliaDBusqueda
      OrdenadoPor.Strings = (
        'FAMILIA')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFFamiliaH: TLFEditFind2000
      Left = 87
      Top = 83
      Width = 90
      Height = 21
      TabOrder = 1
      OnChange = EFFamiliaHChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'FAMILIA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_FAMILIAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFFamiliaHBusqueda
      OrdenadoPor.Strings = (
        'FAMILIA')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEFamiliaD: TLFDbedit
      Left = 178
      Top = 61
      Width = 400
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLSTMovManStock.DSxFamiliaD
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object DBEFamiliaH: TLFDbedit
      Left = 178
      Top = 83
      Width = 400
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLSTMovManStock.DSxFamiliaH
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object CBCanalOrigenD: TLFComboBox
      Left = 135
      Top = 149
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
    object CBCanalOrigenH: TLFComboBox
      Left = 135
      Top = 171
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
    end
    object CBCanalDestinoD: TLFComboBox
      Left = 396
      Top = 149
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
    end
    object CBCanalDestinoH: TLFComboBox
      Left = 396
      Top = 171
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
    end
    object CBAlmacenOrigenD: TLFComboBox
      Left = 135
      Top = 193
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
    end
    object CBAlmacenOrigenH: TLFComboBox
      Left = 135
      Top = 215
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
    end
    object CBAlmacenDestinoD: TLFComboBox
      Left = 396
      Top = 193
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 10
    end
    object CBAlmacenDestinoH: TLFComboBox
      Left = 396
      Top = 215
      Width = 145
      Height = 21
      AutoDropDown = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 11
    end
    object RGTipos: TRadioGroup
      Left = 89
      Top = 244
      Width = 200
      Height = 75
      Caption = 'Mostrar movimientos de tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Entrada'
        'Salida'
        'Traspaso')
      TabOrder = 12
    end
    object RGOrden: TRadioGroup
      Left = 295
      Top = 244
      Width = 200
      Height = 75
      Caption = 'Ordenar por'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Fecha'
        'Serie'
        'Fecha y Serie')
      TabOrder = 13
    end
  end
  inherited ALMain: TLFActionList
    Left = 410
    Top = 12
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
