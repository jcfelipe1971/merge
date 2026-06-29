inherited FMPresenciaEdicionMarcajes: TFMPresenciaEdicionMarcajes
  ActiveControl = DBDEFechaMarcaje
  Caption = 'Edicion de Marcaje'
  ClientHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 427
    object LIdEmpleado: TLFLabel [0]
      Left = 39
      Top = 133
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empleado'
    end
    object LFechaMarcaje: TLFLabel [1]
      Left = 55
      Top = 52
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LTipoMarcaje: TLFLabel [2]
      Left = 24
      Top = 74
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Marcaje'
    end
    object LIncidencia: TLFLabel [3]
      Left = 37
      Top = 155
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Incidencia'
    end
    object LDispositivo: TLFLabel [4]
      Left = 35
      Top = 177
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dispositivo'
    end
    object LEstado: TLFLabel [5]
      Left = 53
      Top = 103
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Estado'
    end
    object LMotivo: TLFLabel [6]
      Left = 54
      Top = 205
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motivo'
    end
    object LValoresOriginales: TLFLabel [7]
      Left = 2
      Top = 231
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valores Originales'
    end
    inherited TBMain: TLFToolBar
      TabOrder = 13
      inherited NavMain: THYMNavigator
        Width = 128
        DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 128
      end
      inherited EPMain: THYMEditPanel
        Left = 136
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 177
      end
      inherited TbuttComp: TToolButton
        Left = 185
      end
    end
    object DBEFIdEmpleado: TLFDBEditFind2000
      Left = 90
      Top = 129
      Width = 54
      Height = 21
      DataField = 'ID_EMPLEADO'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      TabOrder = 6
      OnChange = DBEFIdEmpleadoChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_EMPLEADOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ID_EMPLEADO'
      CampoStr = 'TITULO'
      CampoADevolver = 'ID_EMPLEADO'
      CondicionBusqueda = 'ACTIVO = 1'
      ReemplazarCaracter = True
      SalirSiNoExiste = True
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'EMPLEADO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EEmpelado: TLFEdit
      Left = 145
      Top = 129
      Width = 328
      Height = 21
      Color = clInfoBk
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
    object DBDEFechaMarcaje: TLFDBDateEdit
      Left = 90
      Top = 48
      Width = 121
      Height = 21
      DataField = 'FECHA_MARCAJE'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object DBDTPFechaMarcaje: TDBDateTimePicker
      Left = 213
      Top = 48
      Width = 72
      Height = 21
      CalAlignment = dtaLeft
      Date = 46191.3871174653
      Time = 46191.3871174653
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 1
      DataField = 'FECHA_MARCAJE'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
    end
    object DBEFTipoMarcaje: TLFDBEditFind2000
      Left = 90
      Top = 70
      Width = 54
      Height = 21
      DataField = 'TIPO_MARCAJE'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      TabOrder = 2
      OnChange = DBEFTipoMarcajeChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'PRO_SYS_TIPO_PRESENCIA'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'TIPO'
      CampoStr = 'DESCRIPCION'
      CampoADevolver = 'TIPO'
      ReemplazarCaracter = True
      SalirSiNoExiste = True
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'TIPO')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object ETipoMarcaje: TLFEdit
      Left = 145
      Top = 70
      Width = 328
      Height = 21
      Color = clInfoBk
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
    object DBEFIncidencia: TLFDBEditFind2000
      Left = 90
      Top = 151
      Width = 54
      Height = 21
      DataField = 'ID_INCIDENCIA'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      TabOrder = 8
      OnChange = DBEFIncidenciaChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'PRO_SYS_TIPO_INCIDENCIA'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ID_INCIDENCIA'
      CampoStr = 'DESCRIPCION'
      CampoADevolver = 'ID_INCIDENCIA'
      ReemplazarCaracter = True
      SalirSiNoExiste = True
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'ID_INCIDENCIA')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EIncidencia: TLFEdit
      Left = 145
      Top = 151
      Width = 328
      Height = 21
      Color = clInfoBk
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
    object DBEFDispositivo: TLFDBEditFind2000
      Left = 90
      Top = 173
      Width = 54
      Height = 21
      DataField = 'ID_DISPOSITIVO'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      TabOrder = 10
      OnChange = DBEFDispositivoChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'PRO_SYS_DISP_PRESENCIA'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ID'
      CampoStr = 'DESCRIPCION'
      CampoADevolver = 'ID'
      ReemplazarCaracter = True
      SalirSiNoExiste = True
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'ID')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EDispositivo: TLFEdit
      Left = 145
      Top = 173
      Width = 328
      Height = 21
      Color = clInfoBk
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
    object DBEFEstado: TLFDBEditFind2000
      Left = 90
      Top = 99
      Width = 54
      Height = 21
      DataField = 'ESTADO'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      TabOrder = 4
      OnChange = DBEFEstadoChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = True
      Tabla_a_buscar = 'SYS_GES_ESTADOS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ESTADO'
      CampoStr = 'TITULO'
      CampoADevolver = 'ESTADO'
      CondicionBusqueda = 'ESTADO IN (0, 2)'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'ESTADO')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EEstado: TLFEdit
      Left = 145
      Top = 99
      Width = 328
      Height = 21
      Color = clInfoBk
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
    object DBEMotivo: TLFDbedit
      Left = 90
      Top = 202
      Width = 383
      Height = 21
      DataField = 'MOTIVO_MODIFICACION'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      TabOrder = 12
    end
    object DBMValoresOriginales: TLFDBMemo
      Left = 88
      Top = 232
      Width = 385
      Height = 192
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clInfoBk
      DataField = 'VALORES_ORIGINALES'
      DataSource = DMPresenciaEdicionMarcajes.DSQMDetalle
      Enabled = False
      ReadOnly = True
      TabOrder = 14
    end
  end
  inherited TBActions: TLFToolBar
    Top = 427
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
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
end
