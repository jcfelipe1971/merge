inherited FPregIncidencias: TFPregIncidencias
  Top = 320
  Caption = ' Listado de incidencias'
  ClientHeight = 358
  ClientWidth = 504
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 358
    object LBLFechas: TLFLabel [0]
      Left = 28
      Top = 299
      Width = 94
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fechas de c'#225'lculo'
      Layout = tlCenter
    end
    object LUsuarioH: TLFLabel [1]
      Left = 28
      Top = 256
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Usuario'
    end
    object LUsuarioD: TLFLabel [2]
      Left = 25
      Top = 235
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Usuario'
    end
    object LTipoIncidencia: TLFLabel [3]
      Left = 74
      Top = 212
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    object LTipoAMostrar: TLFLabel [4]
      Left = 28
      Top = 59
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo a mostrar'
    end
    object LDireccionH: TLFLabel [5]
      Left = 19
      Top = 191
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Direcci'#243'n'
    end
    object LDireccionD: TLFLabel [6]
      Left = 16
      Top = 170
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Direcci'#243'n'
    end
    object LBLMaestroH: TLFLabel [7]
      Left = 67
      Top = 104
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LBLMaestroD: TLFLabel [8]
      Left = 64
      Top = 83
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LAgenteH: TLFLabel [9]
      Left = 30
      Top = 148
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Agente'
    end
    object LAgenteD: TLFLabel [10]
      Left = 27
      Top = 127
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Agente'
    end
    object LFinalizada: TLFLabel [11]
      Left = 48
      Top = 278
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Finalizada'
    end
    inherited TBMain: TLFToolBar
      Width = 504
      TabOrder = 14
      object TBConfig: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object CBDesglosado: TLFCheckBox
      Left = 129
      Top = 324
      Width = 200
      Height = 17
      Caption = ' Mostrar informaci'#243'n extendida'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 13
      TabStop = True
      OnClick = CBDesglosadoClick
      Alignment = taLeftJustify
    end
    object EUsuarioH: TLFEdit
      Left = 166
      Top = 252
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 15
    end
    object EUsuarioD: TLFEdit
      Left = 166
      Top = 230
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 16
    end
    object ETituloAgenteH: TLFEdit
      Left = 166
      Top = 144
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 17
    end
    object ETituloAgenteD: TLFEdit
      Left = 166
      Top = 122
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 18
    end
    object EFUsuarioH: TLFEditFind2000
      Left = 101
      Top = 252
      Width = 64
      Height = 21
      TabOrder = 9
      OnChange = EFUsuarioHChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'USUARIO'
      CampoStr = 'NOMBRE'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'SYS_USUARIOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'USUARIO')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EFUsuarioD: TLFEditFind2000
      Left = 101
      Top = 230
      Width = 64
      Height = 21
      TabOrder = 8
      OnChange = EFUsuarioDChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'USUARIO'
      CampoStr = 'NOMBRE'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'SYS_USUARIOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'USUARIO')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EFMaestroH: TLFEditFind2000
      Left = 101
      Top = 100
      Width = 64
      Height = 21
      TabOrder = 2
      OnChange = EFMaestroHChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFMaestroD: TLFEditFind2000
      Left = 101
      Top = 78
      Width = 64
      Height = 21
      TabOrder = 1
      OnChange = EFMaestroDChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFAgenteH: TLFEditFind2000
      Left = 101
      Top = 144
      Width = 64
      Height = 21
      TabOrder = 4
      OnChange = EFAgenteHChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'AGENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'AGENTE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFAgenteD: TLFEditFind2000
      Left = 101
      Top = 122
      Width = 64
      Height = 21
      TabOrder = 3
      OnChange = EFAgenteDChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'AGENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'AGENTE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EDireccionH: TLFEdit
      Left = 101
      Top = 187
      Width = 64
      Height = 21
      TabOrder = 6
    end
    object EDireccionD: TLFEdit
      Left = 101
      Top = 165
      Width = 64
      Height = 21
      TabOrder = 5
    end
    object DBETitMaestroH: TLFDbedit
      Left = 166
      Top = 100
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstIncidencias.DSxMaestroH
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
    end
    object DBETitMaestroD: TLFDbedit
      Left = 166
      Top = 78
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstIncidencias.DSxMaestroD
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 20
    end
    object DBETipoIncidencia: TLFDbedit
      Left = 166
      Top = 208
      Width = 319
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstIncidencias.DSxTipoIncidencia
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 21
    end
    object CBTipoIncidencia: TLFComboBox
      Left = 101
      Top = 208
      Width = 64
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = 'Todas'
      OnChange = CBTipoIncidenciaChange
      Items.Strings = (
        'Todas')
    end
    object CBTipo: TLFComboBox
      Left = 101
      Top = 56
      Width = 82
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = CBTipoChange
      Items.Strings = (
        'Cliente'
        'Proveedor'
        'Acreedor'
        'Agente')
    end
    object DTPFechaH: TLFDateEdit
      Left = 217
      Top = 299
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 12
    end
    object DTPFechaD: TLFDateEdit
      Left = 128
      Top = 299
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 11
    end
    object CBFinalizada: TLFComboBox
      Left = 101
      Top = 274
      Width = 384
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 10
      Text = 'Todas'
      OnChange = CBTipoIncidenciaChange
      Items.Strings = (
        'Todas'
        'Finalizadas'
        'Pendientes')
    end
  end
  inherited ALMain: TLFActionList
    Left = 412
    Top = 30
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBDesglosado.Checked')
  end
end
