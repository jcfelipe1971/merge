inherited FPregAmortizaciones: TFPregAmortizaciones
  Left = 369
  Top = 227
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listados'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
      inherited TButtRecargar: TToolButton
        ImageIndex = 39
      end
      inherited TButtImprimir: TToolButton
        Hint = 'Imprimir'
      end
      inherited TButtPrevisualizar: TToolButton
        Hint = 'Previsualizar'
        ImageIndex = 19
      end
      inherited TButtSalir: TToolButton
        Hint = 'Salir'
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 327
      Width = 592
      TabOrder = 3
    end
    object GBFechas: TGroupBox
      Left = 0
      Top = 36
      Width = 592
      Height = 134
      Align = alTop
      Caption = 'Fechas'
      TabOrder = 1
      object LDesdeFechaAmortizacion: TLFLabel
        Left = 22
        Top = 20
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Amortizacion'
      end
      object LHastaFechaAmortizacion: TLFLabel
        Left = 25
        Top = 42
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Amortizacion'
      end
      object LDesdeFechaCompra: TLFLabel
        Left = 13
        Top = 68
        Width = 103
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha Compra'
      end
      object LHastaFechaCompra: TLFLabel
        Left = 16
        Top = 90
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha Compra'
      end
      object DEDesdeFechaAmortizacion: TLFDateEdit
        Left = 123
        Top = 16
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DEHastaFechaAmortizacion: TLFDateEdit
        Left = 123
        Top = 38
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object CBListadoPorFichas: TLFCheckBox
        Left = 288
        Top = 48
        Width = 200
        Height = 17
        Caption = 'Listado por Fichas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBListadoPorFichasChange
      end
      object DEDesdeFechaCompra: TLFDateEdit
        Left = 123
        Top = 64
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object DEHastaFechaCompra: TLFDateEdit
        Left = 123
        Top = 86
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object CBMostrarBaja: TLFCheckBox
        Left = 288
        Top = 64
        Width = 200
        Height = 17
        Caption = 'Mostrar elementos de baja'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object GBArticulos: TGroupBox
      Left = 0
      Top = 170
      Width = 592
      Height = 157
      Align = alClient
      Caption = 'Art'#237'culos'
      TabOrder = 2
      object LDesdeArticulo: TLFLabel
        Left = 22
        Top = 66
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 25
        Top = 88
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArtDesde: TLFEditFind2000
        Left = 59
        Top = 62
        Width = 90
        Height = 21
        TabOrder = 0
        OnChange = EFArtDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_INMOVILIZADOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArtHasta: TLFEditFind2000
        Left = 59
        Top = 84
        Width = 90
        Height = 21
        TabOrder = 1
        OnChange = EFArtHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_INMOVILIZADOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArtDesde: TLFDbedit
        Left = 150
        Top = 62
        Width = 428
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstAmortizaciones.DSxArt_Desde
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
      object DBEArtHasta: TLFDbedit
        Left = 150
        Top = 84
        Width = 428
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstAmortizaciones.DSxArt_Hasta
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
    end
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
