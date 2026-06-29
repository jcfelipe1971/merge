inherited FMEmpCanales: TFMEmpCanales
  Left = 452
  Top = 235
  Height = 510
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Informaci'#243'n Empresa, Ejercicio, Canal'
  HelpFile = '26'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 457
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMEmpCanales.DSQMEmpCanales
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEFMoneda
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 230
      end
      inherited TbuttComp: TToolButton
        Left = 238
      end
    end
    inherited PCMain: TLFPageControl
      Height = 427
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 399
          object LCanal: TLFLabel
            Left = 88
            Top = 7
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LEjercicio: TLFLabel
            Left = 75
            Top = 28
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LFechaApertura: TLFLabel
            Left = 253
            Top = 28
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Apertura'
          end
          object LFechaCierre: TLFLabel
            Left = 79
            Top = 50
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'F.Cierre'
          end
          object LFechaActivacion: TLFLabel
            Left = 243
            Top = 50
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Activaci'#243'n'
          end
          object LPais: TLFLabel
            Left = 93
            Top = 72
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LTipoIVA: TLFLabel
            Left = 74
            Top = 95
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo IVA'
          end
          object LModoIVA: TLFLabel
            Left = 68
            Top = 116
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object LMoneda: TLFLabel
            Left = 76
            Top = 138
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LFLCierrePeriodo: TLFLabel
            Left = 47
            Top = 181
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cierre Per'#237'odo'
          end
          object LPGC: TLFLabel
            Left = 84
            Top = 160
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'P.G.C.'
          end
          object LCierreFacturacionCompras: TLFLabel
            Left = 17
            Top = 203
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cierre Fact. Compras'
          end
          object LCierreFacturacionVentas: TLFLabel
            Left = 25
            Top = 225
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cierre Fact. Ventas'
          end
          object DBEEjercicio: TLFDbedit
            Left = 120
            Top = 24
            Width = 115
            Height = 21
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBECanal: TLFDbedit
            Left = 120
            Top = 2
            Width = 41
            Height = 21
            Color = clInfoBk
            DataField = 'CANAL'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBECanalChange
          end
          object ETitCanal: TLFEdit
            Left = 162
            Top = 2
            Width = 262
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEApertura: TLFDbedit
            Left = 309
            Top = 24
            Width = 115
            Height = 21
            Color = clInfoBk
            DataField = 'APERTURA'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBECierre: TLFDbedit
            Left = 120
            Top = 46
            Width = 115
            Height = 21
            Color = clInfoBk
            DataField = 'CIERRE'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEActivacion: TLFDbedit
            Left = 309
            Top = 46
            Width = 115
            Height = 21
            Color = clInfoBk
            DataField = 'ACTIVACION'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEPais: TLFDbedit
            Left = 120
            Top = 68
            Width = 41
            Height = 21
            Color = clInfoBk
            DataField = 'PAIS'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 6
            OnChange = DBEPaisChange
          end
          object DBETipoIva: TLFDbedit
            Left = 120
            Top = 90
            Width = 41
            Height = 21
            Color = clInfoBk
            DataField = 'TIPO_IVA'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBEModoIva: TLFDbedit
            Left = 120
            Top = 112
            Width = 41
            Height = 21
            Color = clInfoBk
            DataField = 'MODO_IVA'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 10
            OnChange = DBEModoIvaChange
          end
          object ETitPais: TLFEdit
            Left = 162
            Top = 68
            Width = 262
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBETitTipoIVA: TLFDbedit
            Left = 162
            Top = 90
            Width = 262
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMEmpCanales.DSxTipoIVA
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object ETitModoIVA: TLFEdit
            Left = 162
            Top = 112
            Width = 262
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object GBAsientos: TGroupBox
            Left = 120
            Top = 265
            Width = 304
            Height = 67
            Caption = 'Asientos'
            Enabled = False
            TabOrder = 20
            object DBCBAApertura: TLFDBCheckBox
              Left = 31
              Top = 14
              Width = 250
              Height = 17
              Caption = 'Asiento de Apertura '
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ATO_APERTURA'
              DataSource = DMEmpCanales.DSQMEmpCanales
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBACierre: TLFDBCheckBox
              Left = 31
              Top = 29
              Width = 250
              Height = 17
              Caption = 'Asiento de Cierre'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ATO_CIERRE'
              DataSource = DMEmpCanales.DSQMEmpCanales
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBARegularizacion: TLFDBCheckBox
              Left = 31
              Top = 45
              Width = 250
              Height = 17
              Caption = 'Asiento de Regularizaci'#243'n'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ATO_REGULARIZACION'
              DataSource = DMEmpCanales.DSQMEmpCanales
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object ETitMoneda: TLFEdit
            Left = 162
            Top = 134
            Width = 262
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 120
            Top = 134
            Width = 41
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMEmpCanales.DSQMEmpCanales
            TabOrder = 12
            OnChange = DBEFMonedaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
          end
          object DBCBLiquidarIVAModelo303: TLFDBCheckBox
            Left = 120
            Top = 248
            Width = 304
            Height = 17
            Caption = 'Liquidar Iva este ejercicio en los modelos 300/330'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 19
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'LIQUIDAR_IVA_MODELO_300'
            DataSource = DMEmpCanales.DSQMEmpCanales
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBECierrePeriodo: TLFDBDateEdit
            Left = 120
            Top = 178
            Width = 121
            Height = 21
            DataField = 'CIERRE_PERIODO'
            DataSource = DMEmpCanales.DSQMEmpCanales
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 16
          end
          object EBEFindPGC: TLFDBEditFind2000
            Left = 120
            Top = 156
            Width = 41
            Height = 21
            Color = clInfoBk
            DataField = 'PGC'
            DataSource = DMEmpCanales.DSQMEmpCanales
            Enabled = False
            ReadOnly = True
            TabOrder = 14
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PLANES_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PGC'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = EBEFindPGCBusqueda
            Filtros = []
          end
          object DBEPGC: TLFDbedit
            Left = 162
            Top = 156
            Width = 262
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMEmpCanales.DSxPGC
            Enabled = False
            ReadOnly = True
            TabOrder = 15
          end
          object DBDECierreFacturacionCompras: TLFDBDateEdit
            Left = 120
            Top = 200
            Width = 121
            Height = 21
            DataField = 'CIERRE_FACTURACION_COMPRAS'
            DataSource = DMEmpCanales.DSQMEmpCanales
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 17
          end
          object PNLPeriodosRenumerados: TLFPanel
            Left = 0
            Top = 334
            Width = 489
            Height = 49
            BevelOuter = bvNone
            TabOrder = 21
            object LUltimoPeriodoRepercutido: TLFLabel
              Left = 243
              Top = 7
              Width = 116
              Height = 13
              Alignment = taRightJustify
              Caption = #218'lt. Periodo Repercutido'
            end
            object LUltimoRegistroRepercutido: TLFLabel
              Left = 12
              Top = 7
              Width = 103
              Height = 13
              Alignment = taRightJustify
              Caption = #218'lt. Reg. Repercutido'
            end
            object LUltimoRegistroSoportado: TLFLabel
              Left = 21
              Top = 29
              Width = 94
              Height = 13
              Alignment = taRightJustify
              Caption = #218'lt. Reg. Soportado'
            end
            object LUltimoPeriodoSoportado: TLFLabel
              Left = 252
              Top = 29
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = #218'lt. Periodo Soportado'
            end
            object DBELUltimoRegistroRepercutido: TLFDbedit
              Left = 120
              Top = 2
              Width = 60
              Height = 21
              Color = clInfoBk
              DataField = 'ULTIMO_REGISTRO_REPERCUTIDO'
              DataSource = DMEmpCanales.DSQMEmpCanales
              Enabled = False
              TabOrder = 0
            end
            object DBEUltimoRegistroSoportado: TLFDbedit
              Left = 120
              Top = 24
              Width = 60
              Height = 21
              Color = clInfoBk
              DataField = 'ULTIMO_REGISTRO_SOPORTADO'
              DataSource = DMEmpCanales.DSQMEmpCanales
              Enabled = False
              TabOrder = 1
            end
            object DBEUltimoPeriodoSoportado: TLFDbedit
              Left = 364
              Top = 24
              Width = 60
              Height = 21
              Color = clInfoBk
              DataField = 'ULTIMO_PERIODO_SOPORTADO'
              DataSource = DMEmpCanales.DSQMEmpCanales
              Enabled = False
              TabOrder = 3
            end
            object DBEUltimoPeriodoRepercutido: TLFDbedit
              Left = 364
              Top = 2
              Width = 60
              Height = 21
              Color = clInfoBk
              DataField = 'ULTIMO_PERIODO_REPERCUTIDO'
              DataSource = DMEmpCanales.DSQMEmpCanales
              Enabled = False
              TabOrder = 2
            end
          end
          object DBDECierreFacturacionVentas: TLFDBDateEdit
            Left = 120
            Top = 222
            Width = 121
            Height = 21
            DataField = 'CIERRE_FACTURACION_VENTAS'
            DataSource = DMEmpCanales.DSQMEmpCanales
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 18
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 399
          DataSource = DMEmpCanales.DSQMEmpCanales
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APERTURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIERRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEDA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 457
  end
  inherited CEMain: TControlEdit
    Left = 340
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 380
    Top = 8
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    Top = 44
    object ARepasaAsientos: TAction
      Category = 'Procesos'
      Caption = 'Repasa Asientos'
      Hint = 'Repasa Asientos'
      ImageIndex = 83
      OnExecute = ARepasaAsientosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 390
    Top = 46
  end
end
