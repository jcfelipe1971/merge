inherited FPregTarifas: TFPregTarifas
  Left = 358
  Top = 383
  Caption = 'Tarifas'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    object LDesde: TLFLabel [0]
      Left = 27
      Top = 58
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LHAsta: TLFLabel [1]
      Left = 30
      Top = 77
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    inherited TBMain: TLFToolBar
      Width = 392
      EdgeBorders = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      object TButtConRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object EFTarifa_Desde: TLFEditFind2000
      Left = 64
      Top = 54
      Width = 42
      Height = 21
      TabOrder = 0
      OnChange = EFTarifa_DesdeChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = True
      CampoNum = 'TARIFA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_TARIFAS_C'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFTarifa_Hasta: TLFEditFind2000
      Left = 64
      Top = 76
      Width = 42
      Height = 21
      TabOrder = 1
      OnChange = EFTarifa_HastaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TARIFA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_TARIFAS_C'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBETarifaDesde: TLFDbedit
      Left = 107
      Top = 54
      Width = 270
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstTarifas.DSxTarifa_Desde
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
    object DBETarifaHasta: TLFDbedit
      Left = 107
      Top = 76
      Width = 270
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstTarifas.DSxTarifa_Hasta
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
    object ChkBOrden: TLFCheckBox
      Left = 64
      Top = 106
      Width = 300
      Height = 17
      Caption = 'Ordenar por T'#237'tulo de Art'#237'culo'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object ChkBVender: TLFCheckBox
      Left = 64
      Top = 129
      Width = 300
      Height = 17
      Caption = 'Mostrar Art'#237'culos sin Disponibilidad para Vender'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
    object ChkBIva: TLFCheckBox
      Left = 64
      Top = 152
      Width = 300
      Height = 17
      Caption = 'Mostrar Desglose de IVA'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
    object ChkBPrecioCero: TLFCheckBox
      Left = 64
      Top = 175
      Width = 300
      Height = 17
      Caption = 'Mostrar Art'#237'culos con Precio cero'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBArticulosBaja: TLFCheckBox
      Left = 64
      Top = 196
      Width = 300
      Height = 18
      Caption = 'Incluir Articulos de Baja'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 6
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited ALMain: TLFActionList
    Left = 338
    Top = 54
    inherited AImprimir: TAction
      Hint = 'Salir'
    end
    inherited APrev: TAction
      Hint = 'Visualizar'
      ImageIndex = 19
    end
    inherited ASalir: TAction
      Hint = 'Salir'
    end
    inherited ARecargar: TAction
      ImageIndex = 39
      OnExecute = ARecargarExecute
    end
  end
end
