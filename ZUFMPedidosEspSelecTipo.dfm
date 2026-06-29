object ZFMPedidosEspSelecTipo: TZFMPedidosEspSelecTipo
  Left = 417
  Top = 437
  Width = 474
  Height = 254
  Caption = 'Seleccionar Tipo de la nueva Pesta'#241'a'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlAnyadirTipo: TLFPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 227
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LblTipoArt: TLFLabel
      Left = 11
      Top = 50
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Art'#237'culo'
    end
    object LblModelo: TLFLabel
      Left = 240
      Top = 49
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
      Visible = False
    end
    object LblLacado: TLFLabel
      Left = 35
      Top = 72
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lacado'
    end
    object LblCantidad: TLFLabel
      Left = 232
      Top = 72
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object LblSubtipo: TLFLabel
      Left = 239
      Top = 93
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Subtipo'
    end
    object LblTipo: TLFLabel
      Left = 50
      Top = 93
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    object EFTipoArt: TLFEditFind2000
      Left = 75
      Top = 46
      Width = 33
      Height = 21
      TabOrder = 0
      OnChange = EFTipoArtChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TIPO_ARTICULO_TYC'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_TIPOS_ARTICULO_TYC'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TIPO_ARTICULO_TYC')
      Filtros = []
    end
    object EFModelo: TLFEditFind2000
      Left = 278
      Top = 46
      Width = 55
      Height = 21
      TabOrder = 1
      Visible = False
      OnChange = EFModeloChange
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
    object EFLacado: TLFEditFind2000
      Left = 75
      Top = 68
      Width = 33
      Height = 21
      TabOrder = 2
      OnChange = EFLacadoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CODIGO'
      CampoStr = 'DESCRIPCION'
      CondicionBusqueda = 'ACTIVO=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_SYS_COLORES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODIGO')
      Filtros = []
    end
    object DBEDescTipoArt: TLFEdit
      Left = 109
      Top = 46
      Width = 95
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEDescModelo: TLFEdit
      Left = 334
      Top = 46
      Width = 111
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
    object DBEDescLacado: TLFEdit
      Left = 109
      Top = 68
      Width = 95
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object CECantidad: TCurrencyEdit
      Left = 278
      Top = 68
      Width = 39
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0'
      TabOrder = 3
      Value = 1
      ZeroEmpty = False
    end
    object BBOK: TBitBtn
      Left = 129
      Top = 158
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      TabOrder = 9
      OnClick = BBOKClick
    end
    object BBCancel: TBitBtn
      Left = 250
      Top = 158
      Width = 80
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 10
      OnClick = BBCancelClick
    end
    object EFSubtipo: TLFEditFind2000
      Left = 278
      Top = 90
      Width = 38
      Height = 21
      TabOrder = 5
      OnChange = EFSubtipoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'SUBTIPO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_SYS_TIPOS_CONFIG_DET'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFSubtipoBusqueda
      OrdenadoPor.Strings = (
        'SUBTIPO')
      Filtros = []
    end
    object DBEDescSubtipo: TLFEdit
      Left = 317
      Top = 90
      Width = 128
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object EFTipo: TLFEditFind2000
      Left = 75
      Top = 90
      Width = 33
      Height = 21
      TabOrder = 4
      OnChange = EFTipoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TIPO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_SYS_TIPOS_CONFIG'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TIPO')
      Filtros = []
    end
    object DBEDescTipo: TLFEdit
      Left = 109
      Top = 90
      Width = 95
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
  end
end
