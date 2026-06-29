object FMImportarPreciosTarProvKri: TFMImportarPreciosTarProvKri
  Left = 417
  Top = 266
  BorderStyle = bsSingle
  Caption = 'Importar Precios de Tarifa de Proveedor'
  ClientHeight = 292
  ClientWidth = 414
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
  object PNLTarifaVenta: TLFPanel
    Left = 0
    Top = 152
    Width = 414
    Height = 65
    Align = alTop
    TabOrder = 2
    object LTarifa: TLFLabel
      Left = 32
      Top = 15
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tarifa'
    end
    object LMoneda: TLFLabel
      Left = 20
      Top = 36
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda'
    end
    object EFTarifa: TLFEditFind2000
      Left = 64
      Top = 11
      Width = 65
      Height = 21
      TabOrder = 0
      OnChange = EFTarifaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TARIFA'
      CampoStr = 'TITULO'
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
    object ETituloTarifa: TLFEdit
      Left = 130
      Top = 11
      Width = 279
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object EMoneda: TLFEdit
      Left = 64
      Top = 33
      Width = 65
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
      OnChange = EMonedaChange
    end
    object ETituloMoneda: TLFEdit
      Left = 130
      Top = 33
      Width = 279
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
  end
  object PNLTarifaCompra: TLFPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 88
    Align = alTop
    TabOrder = 0
    object LTarifaProveedor: TLFLabel
      Left = 32
      Top = 36
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tarifa'
    end
    object LMonedaTarifaProveedor: TLFLabel
      Left = 20
      Top = 57
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda'
    end
    object LProveedor: TLFLabel
      Left = 10
      Top = 14
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
    end
    object EFTarifaProveedor: TLFEditFind2000
      Left = 64
      Top = 32
      Width = 65
      Height = 21
      TabOrder = 2
      OnChange = EFTarifaProveedorChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TARIFA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_TARIFAS_PROVEEDOR'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TARIFA')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloTarifaProveedor: TLFEdit
      Left = 130
      Top = 32
      Width = 279
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object EMonedaTarifaProveedor: TLFEdit
      Left = 64
      Top = 54
      Width = 65
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
      OnChange = EMonedaTarifaProveedorChange
    end
    object ETituloMonedaTarifaProveedor: TLFEdit
      Left = 130
      Top = 54
      Width = 279
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 5
    end
    object EFProveedor: TLFEditFind2000
      Left = 64
      Top = 10
      Width = 65
      Height = 21
      TabOrder = 0
      OnChange = EFProveedorChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PROVEEDOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PROVEEDORES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloProveedor: TLFEdit
      Left = 130
      Top = 10
      Width = 279
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
  end
  object PNLCalculo: TLFPanel
    Left = 0
    Top = 217
    Width = 414
    Height = 40
    Align = alTop
    TabOrder = 3
    object LPrecioVenta: TLFLabel
      Left = 8
      Top = 12
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio de Venta ='
    end
    object CBPrecioCoste: TLFComboBox
      Left = 96
      Top = 8
      Width = 129
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Precio Coste'
      Items.Strings = (
        'Precio Coste'
        'Precio Coste - desc')
    end
    object ECalculo: TLFEdit
      Left = 226
      Top = 8
      Width = 175
      Height = 21
      TabOrder = 1
      Text = '* 2.3'
    end
  end
  object PNLFamilias: TLFPanel
    Left = 0
    Top = 88
    Width = 414
    Height = 64
    Align = alTop
    TabOrder = 1
    object LDesdeFamilia: TLFLabel
      Left = 2
      Top = 14
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Fam.'
    end
    object LHastaFamilia: TLFLabel
      Left = 5
      Top = 36
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Fam.'
    end
    object EFDesdeFamilia: TLFEditFind2000
      Left = 64
      Top = 10
      Width = 65
      Height = 21
      TabOrder = 0
      OnChange = EFDesdeFamiliaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'FAMILIA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'FAMILIA')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloDesdeFamilia: TLFEdit
      Left = 130
      Top = 10
      Width = 279
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object EFHastaFamilia: TLFEditFind2000
      Left = 64
      Top = 32
      Width = 65
      Height = 21
      TabOrder = 2
      OnChange = EFHastaFamiliaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'FAMILIA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'FAMILIA')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloHastaFamilia: TLFEdit
      Left = 130
      Top = 32
      Width = 279
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
  end
  object PNLEjecutar: TLFPanel
    Left = 0
    Top = 257
    Width = 414
    Height = 35
    Align = alClient
    Alignment = taLeftJustify
    TabOrder = 4
    object BImportarPrecios: TButton
      Left = 144
      Top = 5
      Width = 121
      Height = 25
      Caption = 'Importar Precios'
      TabOrder = 0
      OnClick = BImportarPreciosClick
    end
  end
end
