inherited FMDatosFactRectificacion: TFMDatosFactRectificacion
  Left = 527
  Top = 250
  Caption = 'Datos Factura de Rectificaci'#243'n'
  ClientHeight = 274
  ClientWidth = 392
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 250
    object LEjercicio: TLFLabel [0]
      Left = 25
      Top = 39
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ejercicio'
    end
    object LSerie: TLFLabel [1]
      Left = 41
      Top = 59
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    object LRig: TLFLabel [2]
      Left = 49
      Top = 82
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rig'
    end
    inherited TBMain: TLFToolBar
      Width = 388
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 5
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
      object TButtAceptar: TToolButton
        Left = 25
        Top = 0
        Hint = 'Aceptar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtAceptarClick
      end
    end
    object LFEFEjercicio: TLFEditFind2000
      Left = 70
      Top = 35
      Width = 57
      Height = 21
      TabOrder = 0
      OnChange = LFEFEjercicioChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'EJERCICIO'
      CampoStr = 'EJERCICIO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'EMP_CANALES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'EJERCICIO DESC')
      Filtros = [obEmpresa, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFEFSerie: TLFEditFind2000
      Left = 70
      Top = 57
      Width = 57
      Height = 21
      TabOrder = 1
      OnChange = LFEFSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'SERIE'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'activo=1 and rect = 0'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'GEN_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFEFRig: TLFEditFind2000
      Left = 70
      Top = 79
      Width = 57
      Height = 21
      TabOrder = 2
      OnChange = LFEFRigChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'RIG'
      CampoStr = 'NOMBRE_COMERCIAL'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_DOCUMENTOS_CLIENTE'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = LFEFRigBusqueda
      OrdenadoPor.Strings = (
        'RIG')
      Filtros = []
    end
    object GBMain: TGroupBox
      Left = 8
      Top = 119
      Width = 377
      Height = 124
      Caption = 'Datos de la Factura'
      Enabled = False
      TabOrder = 3
      object LFMaestro: TLFLabel
        Left = 21
        Top = 27
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'Acr.'
      end
      object LBaseImponible: TLFLabel
        Left = 7
        Top = 50
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Base I.'
      end
      object LIVA: TLFLabel
        Left = 142
        Top = 50
        Width = 17
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA'
      end
      object LRecargo: TLFLabel
        Left = 260
        Top = 50
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'Rec.'
      end
      object LLiquido: TLFLabel
        Left = 4
        Top = 72
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'L'#237'quido'
      end
      object LTotal: TLFLabel
        Left = 16
        Top = 93
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object LMoneda: TLFLabel
        Left = 150
        Top = 93
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object LFEDCliente: TLFDbedit
        Left = 44
        Top = 24
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'COD_CLI_PRO'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object LFEDTitCliente: TLFDbedit
        Left = 133
        Top = 24
        Width = 239
        Height = 21
        Color = clInfoBk
        DataField = 'NOMBRE_R_SOCIAL'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object LFEDBase: TLFDbedit
        Left = 44
        Top = 46
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'BASE'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
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
      object LFEDIVA: TLFDbedit
        Left = 161
        Top = 46
        Width = 89
        Height = 21
        Color = clInfoBk
        DataField = 'IVA'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
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
      object LFEDRecargo: TLFDbedit
        Left = 286
        Top = 46
        Width = 86
        Height = 21
        Color = clInfoBk
        DataField = 'RECARGO'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
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
      object LFEDLiquido: TLFDbedit
        Left = 44
        Top = 68
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'LIQUIDO'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
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
      object LFEDTotal: TLFDbedit
        Left = 44
        Top = 90
        Width = 88
        Height = 21
        Color = clInfoBk
        DataField = 'TOTAL'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
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
      object LFEDMoneda: TLFDbedit
        Left = 193
        Top = 89
        Width = 35
        Height = 21
        Color = clInfoBk
        DataField = 'MONEDA'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
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
      object LFEDTitMoneda: TLFDbedit
        Left = 229
        Top = 89
        Width = 142
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO_MONEDA'
        DataSource = DMDatosFactRectificacion.DSxDatosFac
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
    end
    object ETituloSerie: TLFEdit
      Left = 128
      Top = 57
      Width = 252
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
  end
  inherited TBActions: TLFToolBar
    Top = 250
    Width = 392
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
