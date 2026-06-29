inherited FPregTalonesBancos: TFPregTalonesBancos
  Left = 477
  Top = 308
  Caption = 'Talones Bancos'
  ClientHeight = 252
  ClientWidth = 442
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBMain: TLFToolBar
    Width = 442
    object TBConfigurar: TToolButton
      Left = 288
      Top = 0
      Action = AConfigurar
    end
  end
  inherited PCMain: TLFPageControl
    Width = 442
    Height = 216
    ActivePage = TabSheet1
    TabIndex = 0
    object TabSheet1: TTabSheet
      Caption = 'Ficha'
      object Fecha_Desde: TLFLabel
        Left = 50
        Top = 112
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object Fecha_Hasta: TLFLabel
        Left = 213
        Top = 113
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LBLBancosD: TLFLabel
        Left = 52
        Top = 33
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLHasta: TLFLabel
        Left = 55
        Top = 55
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFBancosD: TLFEditFind2000
        Left = 89
        Top = 30
        Width = 42
        Height = 21
        TabOrder = 0
        OnChange = EFBancosDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'BANCO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_BANCOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFBancosH: TLFEditFind2000
        Left = 89
        Top = 52
        Width = 42
        Height = 21
        TabOrder = 1
        OnChange = EFBancosHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'BANCO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_BANCOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETituloH: TLFDbedit
        Left = 132
        Top = 52
        Width = 243
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTalonesBancos.DSxBancoH
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
      object DBETituloD: TLFDbedit
        Left = 132
        Top = 30
        Width = 243
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstTalonesBancos.DSxBancoD
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
      object DTPFechaD: TLFDateEdit
        Left = 121
        Top = 108
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DTPFechaH: TLFDateEdit
        Left = 281
        Top = 108
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
    end
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
