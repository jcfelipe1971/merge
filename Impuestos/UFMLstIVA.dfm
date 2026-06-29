inherited FMLSTIva: TFMLSTIva
  Left = 664
  Top = 293
  HelpContext = 257
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de IVA'
  ClientHeight = 305
  ClientWidth = 586
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 586
    Height = 305
    inherited TBMain: TLFToolBar
      Width = 586
      ButtonWidth = 83
      TabOrder = 1
      inherited TButtImprimir: TToolButton
        Left = 83
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 166
      end
      inherited TButtSalir: TToolButton
        Left = 249
      end
      object TButtConfigurar: TToolButton
        Left = 332
        Top = 0
        Action = AConfigurar
      end
      object ButtComprueba: TToolButton
        Left = 415
        Top = 0
        Action = ACompruebaIvaRep
      end
    end
    object PNLBottom: TLFPanel
      Left = 0
      Top = 230
      Width = 586
      Height = 75
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object RGOrden: TRadioGroup
        Left = 328
        Top = 0
        Width = 258
        Height = 75
        Align = alRight
        Caption = 'Orden'
        Columns = 2
        Items.Strings = (
          'Fechas'
          'Registro'
          'Nombre')
        TabOrder = 0
      end
      object GBOpciones: TGroupBox
        Left = 0
        Top = 0
        Width = 325
        Height = 75
        Align = alLeft
        Caption = 'Opciones'
        TabOrder = 1
        object ChkBMostrarTotal: TLFCheckBox
          Left = 35
          Top = 22
          Width = 251
          Height = 17
          Caption = 'Mostrar Total Factura'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBSepararNegativos: TLFCheckBox
          Left = 35
          Top = 40
          Width = 251
          Height = 17
          Caption = 'Separar Registros con importes negativos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 586
      Height = 194
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LDesdeRegistro: TLFLabel
        Left = 178
        Top = 139
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Factura'
      end
      object LHastaRegistro: TLFLabel
        Left = 181
        Top = 162
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Factura'
      end
      object LHastaFecha: TLFLabel
        Left = 187
        Top = 96
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeFecha: TLFLabel
        Left = 184
        Top = 74
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object BEjercicio: TSpeedButton
        Left = 368
        Top = 71
        Width = 22
        Height = 22
        Hint = 'Ejercicio actual'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioClick
      end
      object BMes: TSpeedButton
        Left = 368
        Top = 93
        Width = 22
        Height = 22
        Hint = 'Mes actual'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesClick
      end
      object BMesAnterior: TSpeedButton
        Left = 346
        Top = 93
        Width = 22
        Height = 22
        Hint = 'Mes anterior'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesAnteriorClick
      end
      object BMesSiguiente: TSpeedButton
        Left = 390
        Top = 93
        Width = 22
        Height = 22
        Hint = 'Mes siguiente'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesSiguienteClick
      end
      object BEjercicioAnterior: TSpeedButton
        Left = 346
        Top = 71
        Width = 22
        Height = 22
        Hint = 'Ejercicio anterior'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioAnteriorClick
      end
      object BEjercicioSiguiente: TSpeedButton
        Left = 390
        Top = 71
        Width = 22
        Height = 22
        Hint = 'Ejercicio siguiente'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioSiguienteClick
      end
      object BTrimestre1: TSpeedButton
        Left = 412
        Top = 71
        Width = 22
        Height = 22
        Hint = 'Primer trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre1Click
      end
      object BTrimestre2: TSpeedButton
        Left = 434
        Top = 71
        Width = 22
        Height = 22
        Hint = 'Segundo trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre2Click
      end
      object BTrimestre3: TSpeedButton
        Left = 412
        Top = 93
        Width = 22
        Height = 22
        Hint = 'Tercer trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre3Click
      end
      object BTrimestre4: TSpeedButton
        Left = 434
        Top = 93
        Width = 22
        Height = 22
        Hint = 'Cuarto trimestre'
        Flat = True
        NumGlyphs = 2
        OnClick = BTrimestre4Click
      end
      object RGSignoIVA: TRadioGroup
        Left = 0
        Top = 0
        Width = 586
        Height = 50
        Align = alTop
        Caption = 'Facturas/IVA'
        Columns = 2
        Items.Strings = (
          'Emitidas/Repercutido'
          'Recibidas/Soportado')
        TabOrder = 6
        OnClick = RGSignoIVAClick
      end
      object EDTRegDesde: TLFEdit
        Left = 252
        Top = 135
        Width = 87
        Height = 21
        TabOrder = 4
      end
      object EDTRegHasta: TLFEdit
        Left = 252
        Top = 158
        Width = 87
        Height = 21
        TabOrder = 5
      end
      object DTPHasta: TLFDateEdit
        Left = 252
        Top = 94
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object DTPDesde: TLFDateEdit
        Left = 252
        Top = 72
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object CBPorFechas: TLFCheckBox
        Left = 10
        Top = 57
        Width = 151
        Height = 15
        Caption = 'L'#237'mites por Fecha'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CBPorFechasClick
        Alignment = taLeftJustify
        OnChange = CBPorFechasChange
      end
      object CBPorNumeroFactura: TLFCheckBox
        Left = 10
        Top = 121
        Width = 175
        Height = 15
        Caption = 'L'#237'mites por Registro'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        OnClick = CBPorNumeroFacturaClick
        Alignment = taLeftJustify
        OnChange = CBPorNumeroFacturaChange
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 416
    Top = 56
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object ACompruebaIvaRep: TAction
      Caption = 'Comp. IVA Rep.'
      Hint = 'Comprueba el IVA Repercutido'
      ImageIndex = 118
      OnExecute = ACompruebaIvaRepExecute
    end
  end
end
