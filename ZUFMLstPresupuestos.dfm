inherited ZFMLstPresupuestos: TZFMLstPresupuestos
  Left = 475
  Top = 202
  AutoSize = True
  Caption = 'Listados de presupuestos'
  ClientHeight = 300
  ClientWidth = 364
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 364
    Height = 300
    inherited TBMain: TLFToolBar
      Width = 364
      Height = 39
      AutoSize = False
      object TButtDisenyar: TToolButton
        Left = 288
        Top = 0
        Action = ADisenyar
      end
    end
    object GBSituacion: TGroupBox
      Left = 0
      Top = 174
      Width = 364
      Height = 70
      Align = alTop
      Caption = 'Situaci'#243'n:'
      TabOrder = 1
      Visible = False
      object EFSituacion: TLFEditFind2000
        Left = 19
        Top = 27
        Width = 50
        Height = 21
        TabOrder = 0
        OnChange = EFSituacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CODIGO'
        CampoStr = 'DESCRIPCION'
        CondicionBusqueda = 'tipo_aux='#39'SPR'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CODIGO')
        Filtros = []
      end
      object DBEDescSituacion: TLFDbedit
        Left = 70
        Top = 27
        Width = 263
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ZDMLstPresupuestos.DSxDescSit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GBFiltros: TGroupBox
      Left = 0
      Top = 244
      Width = 364
      Height = 55
      Align = alTop
      Caption = 'Filtrar por:'
      TabOrder = 2
      object CHKAgente: TLFCheckBox
        Left = 59
        Top = 20
        Width = 73
        Height = 17
        Caption = 'Agente'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CHKAgenteClick
        Alignment = taLeftJustify
      end
      object CHKSituacion: TLFCheckBox
        Left = 232
        Top = 20
        Width = 82
        Height = 17
        Caption = 'Situaci'#243'n'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        OnClick = CHKSituacionClick
        Alignment = taLeftJustify
      end
    end
    object GBFecha: TGroupBox
      Left = 0
      Top = 111
      Width = 364
      Height = 63
      Align = alTop
      Caption = 'Fecha:'
      TabOrder = 4
      object LDesde: TLFLabel
        Left = 20
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHasta: TLFLabel
        Left = 196
        Top = 24
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPDesde: TLFDateEdit
        Left = 57
        Top = 20
        Width = 85
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPHasta: TLFDateEdit
        Left = 230
        Top = 19
        Width = 85
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GBAgente: TGroupBox
      Left = 0
      Top = 39
      Width = 364
      Height = 72
      Align = alTop
      Caption = 'Agente:'
      TabOrder = 3
      Visible = False
      object EFAgente: TLFEditFind2000
        Left = 20
        Top = 28
        Width = 50
        Height = 21
        TabOrder = 0
        OnChange = EFAgenteChange
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEDescAgente: TLFDbedit
        Left = 71
        Top = 28
        Width = 262
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMLstPresupuestos.DSxDescAgente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 228
    Top = 150
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object ADisenyar: TAction
      Caption = 'Dise'#241'ar'
      Hint = 'Dise'#241'ar Listado'
      ImageIndex = 2
      OnExecute = ADisenyarExecute
    end
  end
end
