inherited ZFPregPedEntrega: TZFPregPedEntrega
  Left = 638
  Top = 106
  Caption = 'Listado de Pedidos Pendientes por tipo de Entrega'
  ClientHeight = 467
  ClientWidth = 611
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 611
    Height = 348
    inherited TBMain: TLFToolBar
      Width = 611
    end
    inherited PCMain: TLFPageControl
      Top = 77
      Width = 611
      Height = 271
      ActivePage = TSListado
      TabIndex = 0
      object TSListado: TTabSheet
        Caption = 'Listado'
        object LClienteD: TLFLabel
          Left = 44
          Top = 67
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Cliente'
        end
        object LClienteH: TLFLabel
          Left = 47
          Top = 89
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Cliente'
        end
        object LblFechaD: TLFLabel
          Left = 108
          Top = 111
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LblFechaH: TLFLabel
          Left = 351
          Top = 111
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LblTransportistaD: TLFLabel
          Left = 16
          Top = 23
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Transportista'
          Visible = False
        end
        object LblTransportistaH: TLFLabel
          Left = 18
          Top = 45
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Transportista'
          Visible = False
        end
        object LblDiaD: TLFLabel
          Left = 7
          Top = 23
          Width = 105
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Dia de Entrega'
          Visible = False
        end
        object LblDiaH: TLFLabel
          Left = 9
          Top = 44
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Dia de Entrega'
          Visible = False
        end
        object LblFechaPrevD: TLFLabel
          Left = 40
          Top = 133
          Width = 132
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha Prev. Entrega'
        end
        object LblFechaPrevH: TLFLabel
          Left = 284
          Top = 133
          Width = 129
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha Prev. Entrega'
        end
        object LFLabel1: TLFLabel
          Left = 50
          Top = 185
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Canal'
        end
        object LFLabel2: TLFLabel
          Left = 53
          Top = 207
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Canal'
        end
        object LFLabel3: TLFLabel
          Left = 346
          Top = 185
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Agrupacion'
        end
        object LFLabel4: TLFLabel
          Left = 349
          Top = 206
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Agrupacion'
        end
        object DateEFechaD: TLFDateEdit
          Left = 176
          Top = 107
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 6
        end
        object DateEFechaH: TLFDateEdit
          Left = 418
          Top = 107
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 7
        end
        object EFClienteD: TLFEditFind2000
          Left = 116
          Top = 63
          Width = 59
          Height = 21
          TabOrder = 4
          OnChange = EFClienteDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEClienteD: TLFDbedit
          Left = 176
          Top = 63
          Width = 329
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMLstPedEntrega.DSClienteD
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
        object DBEClienteH: TLFDbedit
          Left = 176
          Top = 85
          Width = 329
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMLstPedEntrega.DSclienteH
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
        object EFClienteH: TLFEditFind2000
          Left = 116
          Top = 85
          Width = 59
          Height = 21
          TabOrder = 5
          OnChange = EFClienteHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFTransportistaD: TLFEditFind2000
          Left = 116
          Top = 19
          Width = 59
          Height = 21
          TabOrder = 0
          Visible = False
          OnChange = EFTransportistaDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TRANSPORTISTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_TRANSPORTISTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TRANSPORTISTA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETransportistaD: TLFDbedit
          Left = 176
          Top = 19
          Width = 329
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMLstPedEntrega.DSTransportistaD
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Visible = False
        end
        object DBETransportistaH: TLFDbedit
          Left = 176
          Top = 41
          Width = 329
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMLstPedEntrega.DSTransportistaH
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          Visible = False
        end
        object EFTransportistaH: TLFEditFind2000
          Left = 116
          Top = 41
          Width = 59
          Height = 21
          TabOrder = 1
          Visible = False
          OnChange = EFTransportistaHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TRANSPORTISTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_TRANSPORTISTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TRANSPORTISTA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDiaD: TLFEditFind2000
          Left = 116
          Top = 19
          Width = 59
          Height = 21
          TabOrder = 2
          Visible = False
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'DIAS_ENTREGA'
          CampoStr = 'DIAS_ENTREGA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'Z_VER_DIAS_ENTREGA_CLI'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
        end
        object EFDiaH: TLFEditFind2000
          Left = 116
          Top = 41
          Width = 59
          Height = 21
          TabOrder = 3
          Visible = False
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'DIAS_ENTREGA'
          CampoStr = 'DIAS_ENTREGA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'Z_VER_DIAS_ENTREGA_CLI'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
        end
        object DateEFechaPrevD: TLFDateEdit
          Left = 176
          Top = 129
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 8
        end
        object DateEFechaPrevH: TLFDateEdit
          Left = 418
          Top = 129
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 9
        end
        object ChkBValorado: TLFCheckBox
          Left = 8
          Top = 157
          Width = 121
          Height = 17
          Caption = 'Valorado'
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 14
          TabStop = True
          Alignment = taLeftJustify
        end
        object LFDAgrupacion: TLFEditFind2000
          Left = 438
          Top = 181
          Width = 48
          Height = 21
          MaxLength = 3
          TabOrder = 15
          OnChange = LFDAgrupacionChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGRUPACION'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object LFHAgrupacion: TLFEditFind2000
          Left = 438
          Top = 203
          Width = 48
          Height = 21
          MaxLength = 3
          TabOrder = 16
          OnChange = LFHAgrupacionChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGRUPACION'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 611
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object RBCamion: TRadioButton
        Left = 215
        Top = 10
        Width = 84
        Height = 17
        Caption = 'Cami'#243'n'
        TabOrder = 0
        OnClick = RBChange
      end
      object RBRecoge: TRadioButton
        Left = 60
        Top = 10
        Width = 96
        Height = 17
        Caption = 'Recoge'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = RBChange
      end
      object RBEnvio: TRadioButton
        Left = 370
        Top = 10
        Width = 85
        Height = 17
        Caption = 'Envio'
        TabOrder = 2
        OnClick = RBChange
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 348
    Width = 611
    Height = 119
    inherited LComentario: TLFLabel
      Top = 71
    end
    inherited LOrden: TLFLabel
      Top = 49
    end
    inherited LFechaListado: TLFLabel
      Top = 49
    end
    inherited EComentario: TLFEdit
      Top = 67
    end
    inherited CBOrden: TLFComboBox
      Top = 45
      OnChange = CBOrdenChange
    end
    inherited TDPFechaListado: TLFDateEdit
      Top = 45
    end
    object CBSeries: TLFComboBox
      Left = 108
      Top = 23
      Width = 124
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Todas las series')
    end
  end
  object EFCanalD: TLFEditFind2000 [2]
    Left = 120
    Top = 282
    Width = 48
    Height = 21
    TabOrder = 2
    OnChange = EFCanalDChange
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
    BuscarNums = True
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'CANAL'
    CampoStr = 'TITULO'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = False
    SalirSiNoExiste = False
    Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
    Tabla_asociada.DesplegarBusqueda = False
    Filtros = [obEmpresa, obEjercicio]
    Entorno = DMMain.EntornoBusqueda
  end
  object EFCanalH: TLFEditFind2000 [3]
    Left = 120
    Top = 304
    Width = 48
    Height = 21
    TabOrder = 3
    OnChange = EFCanalHChange
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
    BuscarNums = True
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'CANAL'
    CampoStr = 'TITULO'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = False
    SalirSiNoExiste = False
    Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
    Tabla_asociada.DesplegarBusqueda = False
    Filtros = [obEmpresa, obEjercicio]
    Entorno = DMMain.EntornoBusqueda
  end
  object DBECanalH: TLFDbedit [4]
    Left = 169
    Top = 304
    Width = 173
    Height = 21
    Color = clInfoBk
    DataField = 'TITULO'
    DataSource = ZDMLstPedEntrega.DSxCanalHasta
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object DBECanadD: TLFDbedit [5]
    Left = 169
    Top = 282
    Width = 173
    Height = 21
    Color = clInfoBk
    DataField = 'TITULO'
    DataSource = ZDMLstPedEntrega.DSxCanalDesde
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object DescAgrupaD: TLFDbedit [6]
    Left = 491
    Top = 282
    Width = 109
    Height = 21
    Color = clInfoBk
    DataField = 'TITULO'
    DataSource = ZDMLstPedEntrega.DSAgrupacionD
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object DescAgrupaH: TLFDbedit [7]
    Left = 491
    Top = 304
    Width = 109
    Height = 21
    Color = clInfoBk
    DataField = 'TITULO'
    DataSource = ZDMLstPedEntrega.DSAgrupacionH
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
