inherited FPregAgrupaciones: TFPregAgrupaciones
  Left = 536
  Top = 296
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Recibos por Agrupaci'#243'n Clientes'
  ClientHeight = 274
  ClientWidth = 392
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 274
    inherited TBMain: TLFToolBar
      Width = 392
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLAgrupacion: TLFPanel
      Left = 0
      Top = 36
      Width = 392
      Height = 238
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBLAgrupacion: TLFLabel
        Left = 10
        Top = 31
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupaci'#243'n'
      end
      object LBLMoneda: TLFLabel
        Left = 25
        Top = 51
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object Vencimiento: TGroupBox
        Left = 1
        Top = 83
        Width = 390
        Height = 75
        Caption = 'Vencimiento'
        TabOrder = 2
        object Desde: TLFLabel
          Left = 81
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Hasta: TLFLabel
          Left = 84
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 117
          Top = 14
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DTPDesdeChange
        end
        object DTPHasta: TLFDateEdit
          Left = 117
          Top = 36
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = DTPHastaChange
        end
      end
      object EFAgrupacion: TLFEditFind2000
        Left = 70
        Top = 27
        Width = 46
        Height = 21
        TabOrder = 0
        OnChange = EFAgrupacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'AGRUPACION'
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'tipo='#39'C'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitulo: TLFDbedit
        Left = 117
        Top = 27
        Width = 270
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLSTAgrupaciones.DSxAgrupacionTit
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object GBEstado: TGroupBox
        Left = 0
        Top = 163
        Width = 392
        Height = 75
        Align = alBottom
        Caption = 'Estado'
        TabOrder = 3
        object LFCBCobrado: TLFCheckBox
          Left = 28
          Top = 22
          Width = 73
          Height = 17
          Caption = 'Cobrado'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object LFCBNormal: TLFCheckBox
          Left = 132
          Top = 22
          Width = 81
          Height = 17
          Caption = 'Normal'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object LFCBImpagado: TLFCheckBox
          Left = 28
          Top = 40
          Width = 73
          Height = 17
          Caption = 'Impagado'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object LFCBRemesado: TLFCheckBox
          Left = 132
          Top = 40
          Width = 81
          Height = 17
          Caption = 'Remesado'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object EFMoneda: TLFEditFind2000
        Left = 70
        Top = 49
        Width = 46
        Height = 21
        TabOrder = 1
        OnChange = EFMonedaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'MONEDA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEMoneda: TLFDbedit
        Left = 117
        Top = 49
        Width = 270
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLSTAgrupaciones.DSxMonedas
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
    end
  end
  inherited ALMain: TLFActionList
    Left = 351
    Top = 174
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
