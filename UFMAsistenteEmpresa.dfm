object FMAsistenteEmpresa: TFMAsistenteEmpresa
  Left = 406
  Top = 274
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Asistente de Creaci'#243'n de Nueva Empresa'
  ClientHeight = 424
  ClientWidth = 592
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
  object TVMain: TTreeView
    Left = 0
    Top = 0
    Width = 121
    Height = 383
    Align = alLeft
    AutoExpand = True
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HideSelection = False
    Indent = 19
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    ShowRoot = False
    TabOrder = 0
    OnChange = TVMainChange
    OnCollapsed = TVMainCollapsed
    Items.Data = {
      01000000260000000000000000000000FFFFFFFFFFFFFFFF0000000006000000
      0D4E7565766120456D70726573611D0000000000000000000000FFFFFFFFFFFF
      FFFF0000000000000000045469706F290000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000001053656C65636369F36E204D6F64656C6F28000000
      0000000000000000FFFFFFFFFFFFFFFF00000000000000000F4461746F732047
      656EE97269636F73260000000000000000000000FFFFFFFFFFFFFFFF00000000
      000000000D436F6E6669677572616369F36E2C0000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000134573747275637475726120436F6E746162
      6C65210000000000000000000000FFFFFFFFFFFFFFFF00000000000000000843
      7265616369F36E}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 383
    Width = 592
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ButtAnt: TButton
      Left = 430
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 0
      OnClick = ButtAntClick
    end
    object ButtCancel: TButton
      Left = 22
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = ButtCancelClick
    end
    object ButtNext: TButton
      Left = 510
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 2
      OnClick = ButtNextClick
    end
  end
  object PCMain: TLFPageControl
    Left = 121
    Top = 0
    Width = 471
    Height = 383
    ActivePage = TSGenericos
    Align = alClient
    OwnerDraw = True
    Style = tsFlatButtons
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSTipo: TTabSheet
      TabVisible = False
      object LTipoCreacion: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Tipo de Creaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RGCreacion: TRadioGroup
        Left = 64
        Top = 112
        Width = 337
        Height = 97
        Caption = 'Seleccione el tipo de creaci'#243'n para su nueva empresa :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Nueva Empresa'
          'Nueva Empresa a partir de un modelo')
        ParentFont = False
        TabOrder = 0
      end
    end
    object TSSeleccionModelo: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object LSeleccionModelo: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecci'#243'n de Modelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBModelo: TGroupBox
        Left = 0
        Top = 32
        Width = 463
        Height = 341
        Align = alClient
        Caption = 'Seleccione la Empresa que servir'#225' de Modelo:'
        TabOrder = 0
        object TWMapa: TTreeView
          Left = 2
          Top = 15
          Width = 459
          Height = 324
          Align = alClient
          Images = DMMain.ILMain_Ac
          Indent = 19
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object TSGenericos: TTabSheet
      ImageIndex = 2
      TabVisible = False
      object LDatosGenericos: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Datos Gen'#233'ricos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBGenericos: TGroupBox
        Left = 0
        Top = 32
        Width = 463
        Height = 341
        Align = alClient
        Caption = 'Seleccione los Datos Gen'#233'ricos de su Nueva Empresa:'
        TabOrder = 0
        object LNombreEmpresa: TLFLabel
          Left = 9
          Top = 36
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre Empresa'
        end
        object LMoneda: TLFLabel
          Left = 51
          Top = 80
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moneda'
        end
        object LModoIVA: TLFLabel
          Left = 43
          Top = 102
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Modo IVA'
        end
        object LTercero: TLFLabel
          Left = 53
          Top = 58
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tercero'
        end
        object LFechaApertura: TLFLabel
          Left = 17
          Top = 233
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Apertura'
        end
        object LSerieAutofactura: TLFLabel
          Left = 35
          Top = 124
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie Autof.'
        end
        object LFLRegMerc: TLFLabel
          Left = 33
          Top = 166
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'R. Mercantil'
        end
        object LFLMail: TLFLabel
          Left = 43
          Top = 145
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dir. env'#237'o'
        end
        object LBLImagen: TLFLabel
          Left = 55
          Top = 213
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Imagen'
        end
        object LFEFTercero: TLFEditFind2000
          Left = 94
          Top = 54
          Width = 87
          Height = 21
          TabOrder = 1
          OnChange = LFEFTerceroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TERCERO'
          CampoStr = 'NOMBRE_R_SOCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_TERCEROS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TERCERO')
          Filtros = []
        end
        object DTEFechaApertura: TLFDateEdit
          Left = 94
          Top = 231
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 8
        end
        object LFEFModo: TLFEditFind2000
          Left = 94
          Top = 98
          Width = 87
          Height = 21
          TabOrder = 3
          OnChange = LFEFModoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'MODO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_MODO_IVA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'MODO')
          Filtros = []
        end
        object LFEFMoneda: TLFEditFind2000
          Left = 94
          Top = 76
          Width = 87
          Height = 21
          TabOrder = 2
          OnChange = LFEFMonedaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'MONEDA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_MONEDAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'MONEDA')
          Filtros = []
        end
        object LFEDTitEmpresa: TLFEdit
          Left = 94
          Top = 32
          Width = 357
          Height = 21
          TabOrder = 0
        end
        object LFDBEFTitTercero: TLFDbedit
          Left = 182
          Top = 54
          Width = 269
          Height = 21
          Color = clInfoBk
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMAsistenteEmpresa.DSxTerceros
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object LFDBETitMoneda: TLFDbedit
          Left = 182
          Top = 76
          Width = 269
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsistenteEmpresa.DSxMoneda
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object LFDBETitModoIVA: TLFDbedit
          Left = 182
          Top = 98
          Width = 269
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsistenteEmpresa.DSxModosIVA
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object ScrBImagen: TScrollBox
          Left = 351
          Top = 209
          Width = 100
          Height = 100
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          AutoScroll = False
          TabOrder = 12
          object Imagen: TImage
            Left = 0
            Top = 0
            Width = 96
            Height = 96
            Align = alClient
            AutoSize = True
            IncrementalDisplay = True
            Stretch = True
          end
        end
        object LFEFSerieAut: TLFEditFind2000
          Left = 94
          Top = 120
          Width = 87
          Height = 21
          TabOrder = 4
          OnChange = LFEFSerieAutChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object LFDTitSerieAut: TLFDbedit
          Left = 182
          Top = 120
          Width = 269
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsistenteEmpresa.DSxSeries
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object LFMRegMerc: TLFMemo
          Left = 94
          Top = 164
          Width = 357
          Height = 44
          TabOrder = 6
        end
        object LFEDirEnvio: TLFEdit
          Left = 94
          Top = 142
          Width = 357
          Height = 21
          TabOrder = 5
        end
        object DBEFImagen: TLFEditFind2000
          Left = 94
          Top = 209
          Width = 87
          Height = 21
          TabOrder = 7
          OnChange = DBEFImagenChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CODIGO'
          CampoStr = 'NOMBRE'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_IMAGENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CODIGO')
          Filtros = []
        end
        object ETituloImagen: TLFEdit
          Left = 182
          Top = 209
          Width = 167
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object BCargarImagen: TButton
          Left = 301
          Top = 211
          Width = 23
          Height = 18
          Caption = '...'
          TabOrder = 15
          OnClick = BCargarImagenClick
        end
        object BClipboard: TButton
          Left = 324
          Top = 211
          Width = 23
          Height = 18
          Hint = 'Cargar imagen desde porta papeles'
          Caption = 'P'
          TabOrder = 16
          Visible = False
          OnClick = BClipboardClick
        end
      end
    end
    object TSConfiguracion: TTabSheet
      ImageIndex = 3
      TabVisible = False
      object LConfiguracion: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Configuraci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBAvanzados: TGroupBox
        Left = 66
        Top = 48
        Width = 329
        Height = 305
        Caption = 'Seleccione los Datos Particulares de su Empresa :'
        TabOrder = 0
        object RGEjercicios: TRadioGroup
          Left = 23
          Top = 24
          Width = 290
          Height = 49
          Caption = 'Duraci'#243'n de los Ejercicios'
          Items.Strings = (
            '12 meses desde el 1 de enero de cada ejercicio'
            '12 meses desde la fecha de apertura')
          TabOrder = 0
        end
        object CBClienteAuto: TLFCheckBox
          Left = 23
          Top = 85
          Width = 290
          Height = 17
          Caption = 'Clientes Autom'#225'ticos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBPMP: TLFCheckBox
          Left = 23
          Top = 158
          Width = 290
          Height = 17
          Caption = 'Calcular PMPs con Stock Negativo'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBBloqueaEjercicio: TLFCheckBox
          Left = 23
          Top = 230
          Width = 290
          Height = 17
          Caption = 'Bloquea el Ejercicio una vez Regularizado'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 7
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBListarPedidos: TLFCheckBox
          Left = 23
          Top = 254
          Width = 290
          Height = 17
          Caption = 'Listar Pedidos de Compras'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBFecCompras: TLFCheckBox
          Left = 23
          Top = 206
          Width = 290
          Height = 17
          Caption = 'Activa la Comprobacion de Fechas en Compras'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 6
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBFecVentas: TLFCheckBox
          Left = 23
          Top = 182
          Width = 290
          Height = 17
          Caption = 'Activa la Comprobacion de Fechas en Ventas'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 5
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBCierreDoc: TLFCheckBox
          Left = 23
          Top = 278
          Width = 290
          Height = 17
          Caption = 'Cerrar documentos con Total 0'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 9
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBProveedorAuto: TLFCheckBox
          Left = 23
          Top = 109
          Width = 290
          Height = 17
          Caption = 'Proveedores Autom'#225'ticos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBAcreedorAuto: TLFCheckBox
          Left = 23
          Top = 133
          Width = 290
          Height = 17
          Caption = 'Acreedores Autom'#225'ticos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    object TSEstructura: TTabSheet
      TabVisible = False
      object LEstructuraContable: TLFLabel
        Left = 0
        Top = 0
        Width = 263
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Estructura Contable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBEstructura: TGroupBox
        Left = 130
        Top = 95
        Width = 239
        Height = 122
        Caption = 'Seleccione opciones de Estructura Contable :'
        TabOrder = 0
        object LNumeroDigitos: TLFLabel
          Left = 41
          Top = 32
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero de D'#237'gitos:'
        end
        object UPDigitos: TUpDown
          Left = 165
          Top = 28
          Width = 15
          Height = 21
          Associate = LFEDTDigitos
          Min = 5
          Max = 15
          Position = 5
          TabOrder = 0
          Wrap = False
        end
        object LFEDTDigitos: TLFEdit
          Left = 137
          Top = 28
          Width = 28
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '5'
        end
        object LFCBCreaEstructura: TLFCheckBox
          Left = 40
          Top = 72
          Width = 161
          Height = 17
          Caption = 'No crear estructura ahora.'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    object TSCreacion: TTabSheet
      TabVisible = False
      object LCreacionEmpresa: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Creaci'#243'n de la Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MEMInfo: TLFMemo
        Left = 48
        Top = 48
        Width = 385
        Height = 129
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            '[] Ha rellenado correctamente todos los par'#225'metros necesarios pa' +
            'ra '
          'la creaci'#243'n de una nueva empresa.'
          ''
          
            '[] Si desea modificar alguno, acceda a la pesta'#241'a correspondient' +
            'e '
          'para su modificaci'#243'n.'
          ''
          
            '[] Si por el contrario los datos son correctos, pulse el siguien' +
            'te '
          'bot'#243'n para comenzar el proceso.')
        ParentFont = False
        TabOrder = 0
      end
      object ButtCrear: TButton
        Left = 192
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Crear'
        TabOrder = 1
        OnClick = ButtCrearClick
      end
      object GBInformacion: TGroupBox
        Left = 0
        Top = 308
        Width = 463
        Height = 65
        Align = alBottom
        Caption = 'Informaci'#243'n del proceso:'
        TabOrder = 2
        object LBLInformacion: TLFLabel
          Left = 24
          Top = 29
          Width = 3
          Height = 13
        end
        object ANITempo: TAnimate
          Left = 323
          Top = 28
          Width = 16
          Height = 16
          Active = False
          CommonAVI = aviFindComputer
          StopFrame = 8
          Visible = False
        end
      end
    end
  end
  object OPDImagen: TOpenPictureDialog
    Filter = 'BitMap Images (*.bmp)|*.bmp'
    Title = 'Carga de logo de Empresa'
    Left = 112
    Top = 391
  end
end
