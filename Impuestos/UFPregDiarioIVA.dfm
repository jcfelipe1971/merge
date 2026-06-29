inherited FPregDiarioIVA: TFPregDiarioIVA
  Left = 728
  Top = 198
  HelpContext = 258
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Diario IVA (Listado)'
  ClientHeight = 410
  ClientWidth = 586
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 586
    Height = 410
    object PNLLimites: TLFPanel [0]
      Left = 0
      Top = 36
      Width = 586
      Height = 213
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LHastaFactura: TLFLabel
        Left = 181
        Top = 192
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Factura'
      end
      object LDesdeFactura: TLFLabel
        Left = 178
        Top = 169
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Factura'
      end
      object LHastaFecha: TLFLabel
        Left = 187
        Top = 127
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeFecha: TLFLabel
        Left = 184
        Top = 104
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LTipoOperacion: TLFLabel
        Left = 177
        Top = 65
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo operaci'#243'n'
      end
      object BEjercicio: TSpeedButton
        Left = 368
        Top = 101
        Width = 22
        Height = 22
        Hint = 'Ejercicio actual'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioClick
      end
      object BMes: TSpeedButton
        Left = 368
        Top = 123
        Width = 22
        Height = 22
        Hint = 'Mes actual'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesClick
      end
      object BMesAnterior: TSpeedButton
        Left = 346
        Top = 123
        Width = 22
        Height = 22
        Hint = 'Mes anterior'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesAnteriorClick
      end
      object BMesSiguiente: TSpeedButton
        Left = 390
        Top = 123
        Width = 22
        Height = 22
        Hint = 'Mes siguiente'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesSiguienteClick
      end
      object BEjercicioAnterior: TSpeedButton
        Left = 346
        Top = 101
        Width = 22
        Height = 22
        Hint = 'Ejercicio anterior'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioAnteriorClick
      end
      object BEjercicioSiguiente: TSpeedButton
        Left = 390
        Top = 101
        Width = 22
        Height = 22
        Hint = 'Ejercicio siguiente'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioSiguienteClick
      end
      object BTrimestre1: TSpeedButton
        Left = 412
        Top = 101
        Width = 22
        Height = 22
        Hint = 'Primer trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre1Click
      end
      object BTrimestre2: TSpeedButton
        Left = 434
        Top = 101
        Width = 22
        Height = 22
        Hint = 'Segundo trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre2Click
      end
      object BTrimestre3: TSpeedButton
        Left = 412
        Top = 123
        Width = 22
        Height = 22
        Hint = 'Tercer trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre3Click
      end
      object BTrimestre4: TSpeedButton
        Left = 434
        Top = 123
        Width = 22
        Height = 22
        Hint = 'Cuarto trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre4Click
      end
      object EFFras_Desde: TLFEditFind2000
        Left = 252
        Top = 166
        Width = 87
        Height = 21
        TabOrder = 5
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'DOC_NUMERO'
        CampoStr = 'DOC_SERIE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_REGISTRO_IVA'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFras_DesdeBusqueda
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFras_Hasta: TLFEditFind2000
        Left = 252
        Top = 188
        Width = 87
        Height = 21
        TabOrder = 6
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'DOC_NUMERO'
        CampoStr = 'DOC_SERIE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_REGISTRO_IVA'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFras_HastaBusqueda
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DTPFecha_Hasta: TLFDateEdit
        Left = 252
        Top = 124
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DTPFecha_Desde: TLFDateEdit
        Left = 252
        Top = 102
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object RGFacturas: TRadioGroup
        Left = 0
        Top = 0
        Width = 586
        Height = 50
        Align = alTop
        Caption = 'Facturas/IVA'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Emitidas/Repercutido'
          'Recibidas/Soportado')
        TabOrder = 0
      end
      object CBTipoOperacion: TLFComboBox
        Left = 252
        Top = 61
        Width = 163
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'Nacionales'
          'Intracomunitarias'
          'Extranjeras'
          'Todas')
      end
      object CBPorFechas: TLFCheckBox
        Left = 10
        Top = 87
        Width = 151
        Height = 15
        Caption = 'L'#237'mites por Fecha'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        OnClick = CBPorFechasClick
        Alignment = taLeftJustify
        OnChange = CBPorFechasChange
      end
      object CBPorNumeroFactura: TLFCheckBox
        Left = 10
        Top = 151
        Width = 175
        Height = 15
        Caption = 'L'#237'mites por N'#250'mero de Factura'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 7
        TabStop = True
        OnClick = CBPorNumeroFacturaClick
        Alignment = taLeftJustify
        OnChange = CBPorNumeroFacturaChange
      end
    end
    inherited TBMain: TLFToolBar
      Width = 586
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLOtros: TLFPanel
      Left = 0
      Top = 249
      Width = 586
      Height = 161
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object RGOrden: TRadioGroup
        Left = 328
        Top = 85
        Width = 258
        Height = 75
        Caption = 'Orden'
        Columns = 2
        Items.Strings = (
          'Fecha'
          'Registro'
          'Nombre'
          'Nro. Documento')
        TabOrder = 2
      end
      object GBFiltros: TGroupBox
        Left = 0
        Top = 0
        Width = 586
        Height = 81
        Align = alTop
        Caption = 'Filtros'
        TabOrder = 0
        object LSerie: TLFLabel
          Left = 97
          Top = 20
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object CBPorSeries: TLFCheckBox
          Left = 9
          Top = 19
          Width = 79
          Height = 15
          Caption = 'Por Serie'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          OnClick = CBPorSeriesClick
          Alignment = taLeftJustify
        end
        object EFSerie: TLFEditFind2000
          Left = 125
          Top = 16
          Width = 90
          Height = 21
          TabOrder = 1
          OnChange = EFSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'SERIE'
            'TITULO')
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloSerie: TLFEdit
          Left = 216
          Top = 16
          Width = 246
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
          TabOrder = 2
        end
        object CBTodasSeries: TLFCheckBox
          Left = 469
          Top = 18
          Width = 100
          Height = 17
          Caption = 'Todas las Series'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          OnClick = CBTodasSeriesClick
          Alignment = taLeftJustify
        end
        object CBPorTipoIVA: TLFCheckBox
          Left = 9
          Top = 48
          Width = 79
          Height = 15
          Caption = 'Por IVA'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBPorTipoIVAChange
        end
      end
      object GBListado: TGroupBox
        Left = 0
        Top = 85
        Width = 325
        Height = 75
        Caption = 'Datos del listado'
        TabOrder = 1
        object LFechaListado: TLFLabel
          Left = 18
          Top = 23
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha'
        end
        object LTituloListado: TLFLabel
          Left = 20
          Top = 45
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'T'#237'tulo'
        end
        object ETituloListado: TLFEdit
          Left = 53
          Top = 41
          Width = 259
          Height = 21
          TabOrder = 1
          Text = 'Libro Registro de Facturas'
        end
        object DTPFechaListado: TLFDateEdit
          Left = 53
          Top = 19
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 390
    Top = 6
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
