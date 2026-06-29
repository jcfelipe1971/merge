inherited ZFMLstFechaPrevProv: TZFMLstFechaPrevProv
  Left = 427
  Top = 219
  Caption = 'Listado de Pedidos Proveedor por Fecha Prevista'
  ClientHeight = 353
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 276
    inherited TBMain: TLFToolBar
      inherited TButtImprimir: TToolButton
        Visible = False
      end
    end
    inherited PBListado: TProgressBar
      Top = 260
      TabOrder = 4
    end
    inherited PCMain: TLFPageControl
      Top = 77
      Height = 183
    end
    object PnLst: TLFPanel
      Left = 0
      Top = 77
      Width = 592
      Height = 183
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LProveedorD: TLFLabel
        Left = 32
        Top = 40
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Proveedor'
      end
      object LProveedorH: TLFLabel
        Left = 35
        Top = 61
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Proveedor'
      end
      object LblFechaD: TLFLabel
        Left = 107
        Top = 109
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LblFechaPrevD: TLFLabel
        Left = 39
        Top = 131
        Width = 132
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha Prev. Entrega'
      end
      object LblFechaH: TLFLabel
        Left = 353
        Top = 109
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LblFechaPrevH: TLFLabel
        Left = 285
        Top = 131
        Width = 129
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha Prev. Entrega'
      end
      object EProveedorD: TLFEdit
        Left = 175
        Top = 36
        Width = 329
        Height = 21
        TabStop = False
        Color = clInfoBk
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
      object EProveedorH: TLFEdit
        Left = 175
        Top = 58
        Width = 329
        Height = 21
        TabStop = False
        Color = clInfoBk
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
      object DateEFechaD: TLFDateEdit
        Left = 176
        Top = 105
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object DateEFechaPrevD: TLFDateEdit
        Left = 176
        Top = 127
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object DateEFechaH: TLFDateEdit
        Left = 418
        Top = 105
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DateEFechaPrevH: TLFDateEdit
        Left = 418
        Top = 127
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
      object EFProveedorD: TLFEditFind2000
        Left = 120
        Top = 36
        Width = 54
        Height = 21
        TabOrder = 6
        OnChange = EFProveedorDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'PROVEEDOR'
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
      object EFProveedorH: TLFEditFind2000
        Left = 120
        Top = 58
        Width = 54
        Height = 21
        TabOrder = 7
        OnChange = EFProveedorHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'PROVEEDOR'
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
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object RBResumido: TRadioButton
        Left = 136
        Top = 13
        Width = 113
        Height = 17
        Caption = 'Resumido'
        TabOrder = 0
        OnClick = RBResumidoClick
      end
      object RBDetallado: TRadioButton
        Left = 280
        Top = 13
        Width = 113
        Height = 17
        Caption = 'Detallado'
        TabOrder = 1
        OnClick = RBDetalladoClick
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 276
    Height = 77
    inherited CBOrden: TLFComboBox
      Items.Strings = (
        'Agrupado por Proveedor '
        'Ordenado por Fecha Prevista')
    end
  end
  inherited ALMain: TLFActionList
    Left = 392
    Top = 82
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
