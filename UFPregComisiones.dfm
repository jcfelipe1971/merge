inherited FPregComisiones: TFPregComisiones
  Left = 433
  Top = 259
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listados de Agentes'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  OnShow = FormShow
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
      object TButtConfiguracionRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object TBMulticanal: TToolButton
        Left = 360
        Top = 0
        Action = AMulticanal
      end
      object TBExportar: TToolButton
        Left = 432
        Top = 0
        Action = AExportar
      end
      object PBProgreso: TProgressBar
        Left = 504
        Top = 0
        Width = 81
        Height = 36
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object PNLMain: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 307
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBFechas: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 100
        Align = alTop
        Caption = 'Fechas'
        TabOrder = 0
        object LFechaDesde: TLFLabel
          Left = 97
          Top = 43
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LFechaHasta: TLFLabel
          Left = 265
          Top = 44
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
          Visible = False
        end
        object LMesDesde: TLFLabel
          Left = 162
          Top = 21
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mes'
        end
        object LAnyo: TLFLabel
          Left = 273
          Top = 21
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = 'A'#241'o'
        end
        object DTPDesde: TLFDateEdit
          Left = 133
          Top = 40
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          Visible = False
          OnChange = DTPDesdeChange
        end
        object DTPHasta: TLFDateEdit
          Left = 297
          Top = 40
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          Visible = False
        end
        object EmesDesde: TLFEdit
          Left = 186
          Top = 18
          Width = 33
          Height = 21
          MaxLength = 2
          TabOrder = 2
          OnChange = EmesDesdeChange
        end
        object EAnioDesde: TLFEdit
          Left = 297
          Top = 18
          Width = 57
          Height = 21
          MaxLength = 4
          TabOrder = 3
          OnChange = EAnioDesdeChange
        end
      end
      object GBTitulo: TGroupBox
        Left = 0
        Top = 100
        Width = 592
        Height = 101
        Align = alTop
        Caption = 'Agentes'
        TabOrder = 1
        object LAgenteDesde: TLFLabel
          Left = 47
          Top = 36
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LAgenteHasta: TLFLabel
          Left = 50
          Top = 57
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFAgenteDesde: TLFEditFind2000
          Left = 83
          Top = 32
          Width = 66
          Height = 21
          TabOrder = 0
          OnChange = EFAgenteDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAgenteHasta: TLFEditFind2000
          Left = 83
          Top = 54
          Width = 66
          Height = 21
          TabOrder = 1
          OnChange = EFAgenteHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EDesdeAgente: TLFEdit
          Left = 150
          Top = 32
          Width = 402
          Height = 21
          Color = clInfoBk
          TabOrder = 2
        end
        object EHastaAgente: TLFEdit
          Left = 150
          Top = 54
          Width = 402
          Height = 21
          Color = clInfoBk
          TabOrder = 3
        end
      end
      object RGTipo: TRadioGroup
        Left = 0
        Top = 201
        Width = 126
        Height = 106
        Align = alLeft
        Caption = 'Tipo Listado'
        ItemIndex = 0
        Items.Strings = (
          'Agentes'
          'Comisiones')
        TabOrder = 2
        OnClick = RGTipoClick
      end
      object RGOpciones: TRadioGroup
        Left = 133
        Top = 201
        Width = 459
        Height = 106
        Align = alRight
        Caption = 'Opciones'
        ItemIndex = 0
        Items.Strings = (
          'Comisiones Detalladas de Agentes'
          'Comisiones Agrupadas de Agentes'
          'Total Comisiones de Agentes'
          'Comisiones por Agente y Familia')
        TabOrder = 4
        OnClick = RGOpcionesClick
      end
      object ChkMostrarImporteCero: TLFCheckBox
        Left = 372
        Top = 221
        Width = 193
        Height = 17
        Caption = 'Mostrar comisi'#243'n con importes cero'
        ClicksDisabled = False
        ColorCheck = 57088
        Enabled = False
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMulticanal: TAction
      Caption = 'Multi-Canal'
      ImageIndex = 132
      OnExecute = AMulticanalExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'ChkMostrarImporteCero.Checked')
  end
end
