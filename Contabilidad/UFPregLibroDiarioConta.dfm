inherited FPregLibroDiarioConta: TFPregLibroDiarioConta
  Left = 298
  Top = 235
  HelpContext = 1807
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Libro Diario'
  ClientHeight = 356
  ClientWidth = 588
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 588
    Height = 356
    inherited TBMain: TLFToolBar
      Width = 588
      ButtonWidth = 79
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtImprimir: TToolButton
        Left = 79
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 158
      end
      inherited TButtSalir: TToolButton
        Left = 237
      end
      object TButtDisenar: TToolButton
        Left = 316
        Top = 0
        Action = AConfigurar
      end
      object TButtExportar: TToolButton
        Left = 395
        Top = 0
        Hint = 'Exporta los datos a un libro'
        HelpType = htKeyword
        Action = AExportar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtLegalizar: TToolButton
        Left = 474
        Top = 0
        Action = ALegalizar
        Caption = '&Preparar Libro'
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 340
      Width = 588
      TabOrder = 2
    end
    object PNLLibroDiario: TLFPanel
      Left = 0
      Top = 36
      Width = 588
      Height = 304
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLLibroDiarioTop: TLFPanel
        Left = 0
        Top = 0
        Width = 588
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object RGOpciones: TRadioGroup
          Left = 0
          Top = 0
          Width = 288
          Height = 81
          Align = alLeft
          Caption = 'Opciones'
          Columns = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Libro Diario'
            'Partido'
            'Resumido')
          ParentFont = False
          TabOrder = 0
          OnClick = RGOpcionesClick
        end
        object GBTitulo: TGroupBox
          Left = 288
          Top = 0
          Width = 300
          Height = 81
          Align = alClient
          Caption = 'Titulo del listado'
          TabOrder = 1
          object ETituloListado: TLFEdit
            Left = 14
            Top = 29
            Width = 260
            Height = 21
            TabOrder = 0
            Text = 'Libro diario'
          end
        end
      end
      object PNLLibroDiarioMid: TLFPanel
        Left = 0
        Top = 81
        Width = 588
        Height = 121
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object PNPeriodos: TLFPanel
          Left = 0
          Top = 0
          Width = 288
          Height = 121
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object GBPeriodos: TFlatGroupBox
            Left = 0
            Top = 0
            Width = 288
            Height = 121
            Align = alClient
            Caption = 'Periodos'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 0
            ColorBorder = clSilver
            object LBLDesde: TLFLabel
              Left = 37
              Top = 39
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LBLNivel: TLFLabel
              Left = 44
              Top = 61
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nivel'
            end
            object LBLTotal: TLFLabel
              Left = 124
              Top = 61
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Digitos'
            end
            object LBLHasta: TLFLabel
              Left = 155
              Top = 39
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object EFPeriodoDesde: TLFEditFind2000
              Left = 73
              Top = 36
              Width = 33
              Height = 21
              TabOrder = 0
              Text = '01'
              Base_de_datos = DMMain.DataBase
              Transaction = DMRLibroDiarioConta.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'PERIODO'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'EMP_PERIODOS'
              Tabla_asociada.DesplegarBusqueda = False
              OnBusqueda = EFPeriodoDesdeBusqueda
              OrdenadoPor.Strings = (
                'PERIODO')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFNivel: TLFEditFind2000
              Left = 73
              Top = 58
              Width = 33
              Height = 21
              TabOrder = 1
              Text = '1'
              OnChange = EFNivelChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMRLibroDiarioConta.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'NIVEL'
              CampoStr = 'TOTAL_DIGITOS'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'CON_CUENTAS_NIVELES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'NIVEL')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
            object CBApertura: TLFCheckBox
              Left = 32
              Top = 83
              Width = 66
              Height = 17
              Caption = 'Apertura'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBCierre: TLFCheckBox
              Left = 110
              Top = 83
              Width = 57
              Height = 17
              Caption = 'Cierre'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBRegula: TLFCheckBox
              Left = 177
              Top = 83
              Width = 89
              Height = 17
              Caption = 'Regularizaci'#243'n'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
            end
            object ETotalDigitos: TLFEdit
              Left = 188
              Top = 58
              Width = 33
              Height = 21
              AutoSelect = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 5
            end
            object EFPeriodoHasta: TLFEditFind2000
              Left = 188
              Top = 36
              Width = 33
              Height = 21
              TabOrder = 6
              Text = '01'
              Base_de_datos = DMMain.DataBase
              Transaction = DMRLibroDiarioConta.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'PERIODO'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'EMP_PERIODOS'
              Tabla_asociada.DesplegarBusqueda = False
              OnBusqueda = EFPeriodoHastaBusqueda
              OrdenadoPor.Strings = (
                'PERIODO')
              Filtros = [obEmpresa, obEjercicio]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
        object GBFechas: TFlatGroupBox
          Left = 288
          Top = 0
          Width = 300
          Height = 121
          Align = alClient
          Caption = 'Fechas'
          TabOrder = 1
          ColorBorder = clSilver
          object LDesdeFecha: TLFLabel
            Left = 17
            Top = 40
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LHastaFecha: TLFLabel
            Left = 20
            Top = 62
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object LBLTipo: TLFLabel
            Left = 27
            Top = 84
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LAsientoHasta: TLFLabel
            Left = 148
            Top = 60
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento Hasta'
          end
          object LAsientoDesde: TLFLabel
            Left = 145
            Top = 38
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento Desde'
          end
          object DTPDesde: TLFDateEdit
            Left = 53
            Top = 36
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPHasta: TLFDateEdit
            Left = 53
            Top = 58
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object CBTipoAsiento: TLFComboBox
            Left = 53
            Top = 80
            Width = 219
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
          end
          object SEAsientoHasta: TSpinEdit
            Left = 219
            Top = 57
            Width = 53
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
          object SEAsientoDesde: TSpinEdit
            Left = 219
            Top = 34
            Width = 53
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 4
            Value = 1
          end
        end
      end
      object PNLLibroDiarioRest: TLFPanel
        Left = 0
        Top = 202
        Width = 588
        Height = 102
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object PNDatosIniciales: TLFPanel
          Left = 0
          Top = 0
          Width = 288
          Height = 102
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object GBDatosIniciales: TFlatGroupBox
            Left = 0
            Top = 0
            Width = 288
            Height = 102
            Align = alClient
            Caption = 'Datos Iniciales'
            TabOrder = 0
            ColorBorder = clSilver
            object LBPagina: TLFLabel
              Left = 28
              Top = 31
              Width = 33
              Height = 13
              Caption = 'Pagina'
            end
            object LBDebe: TLFLabel
              Left = 92
              Top = 31
              Width = 26
              Height = 13
              Caption = 'Debe'
            end
            object LBHaber: TLFLabel
              Left = 175
              Top = 31
              Width = 29
              Height = 13
              Caption = 'Haber'
            end
            object EPagina: TLFEdit
              Left = 27
              Top = 46
              Width = 63
              Height = 21
              TabOrder = 0
              Text = '1'
            end
            object EDebe: TLFEdit
              Left = 91
              Top = 46
              Width = 82
              Height = 21
              TabOrder = 1
              Text = '0'
            end
            object EHaber: TLFEdit
              Left = 174
              Top = 46
              Width = 82
              Height = 21
              TabOrder = 2
              Text = '0'
            end
          end
        end
        object PMonedas: TLFPanel
          Left = 288
          Top = 0
          Width = 300
          Height = 102
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LMoneda: TLFLabel
            Left = 79
            Top = 45
            Width = 39
            Height = 21
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Moneda'
            Layout = tlCenter
          end
          object LFechaListado: TLFLabel
            Left = 38
            Top = 28
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha del listado'
            Layout = tlCenter
          end
          object DBLCBMoneda: TDBLookupComboBox
            Left = 124
            Top = 46
            Width = 122
            Height = 21
            KeyField = 'MONEDA'
            ListField = 'TITULO'
            ListSource = DMRLibroDiarioConta.DSxMonedas
            TabOrder = 1
            OnClick = DBLCBMonedaClick
          end
          object DTPFecha: TLFDateEdit
            Left = 124
            Top = 24
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 498
    Top = 40
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AComprobar: TAction
      Caption = 'AComprobar'
      ImageIndex = 21
    end
    object ALegalizar: TAction
      Caption = 'ALegalizar'
      ImageIndex = 22
      OnExecute = ALegalizarExecute
    end
  end
end
