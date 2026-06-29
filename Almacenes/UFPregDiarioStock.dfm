inherited FPregDiarioStock: TFPregDiarioStock
  Top = 165
  HelpContext = 137
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Diario de Stocks'
  ClientHeight = 289
  ClientWidth = 482
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 482
    Height = 289
    inherited TBMain: TLFToolBar
      Width = 482
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfiguracionRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtMultiSeleccion: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSeleccion
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLFechaDoc: TLFPanel
      Left = 0
      Top = 36
      Width = 482
      Height = 253
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBPeriodo: TGroupBox
        Left = 0
        Top = 0
        Width = 482
        Height = 123
        Align = alTop
        Caption = 'Periodo'
        TabOrder = 0
        object LDesdePeriodo: TLFLabel
          Left = 72
          Top = 51
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaPeriodo: TLFLabel
          Left = 75
          Top = 72
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFPeriodo_D: TLFEditFind2000
          Left = 109
          Top = 46
          Width = 48
          Height = 21
          MaxLength = 2
          TabOrder = 0
          OnChange = EFPeriodo_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_PERIODOS                   '
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EFPeriodo_H: TLFEditFind2000
          Left = 109
          Top = 68
          Width = 48
          Height = 21
          MaxLength = 2
          TabOrder = 1
          OnChange = EFPeriodo_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_PERIODOS                   '
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEPeriodoDesde: TLFDbedit
          Left = 158
          Top = 46
          Width = 270
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDiarioStock.DSxPeriodo_Desde
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
        object DBEPeriodoHasta: TLFDbedit
          Left = 158
          Top = 68
          Width = 270
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRDiarioStock.DSxPeriodo_Hasta
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
      object GBFechaDoc: TGroupBox
        Left = 0
        Top = 123
        Width = 172
        Height = 130
        Align = alLeft
        Caption = 'Fecha Doc.'
        TabOrder = 1
        object LDesdeFechaDoc: TLFLabel
          Left = 15
          Top = 42
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFechaDoc: TLFLabel
          Left = 18
          Top = 63
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DBDTPFecha_D: TLFDateEdit
          Left = 52
          Top = 38
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DBDTPFecha_H: TLFDateEdit
          Left = 52
          Top = 60
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GBDatos: TGroupBox
        Left = 155
        Top = 123
        Width = 327
        Height = 130
        Align = alRight
        TabOrder = 2
        object LBLFechaListado: TLFLabel
          Left = 21
          Top = 42
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha listado'
        end
        object EComentario: TLFEdit
          Left = 21
          Top = 60
          Width = 285
          Height = 21
          MaxLength = 35
          TabOrder = 1
        end
        object DTPFechaListado: TLFDateEdit
          Left = 91
          Top = 38
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
    Left = 12
    Top = 100
    inherited ASalir: TAction
      Tag = 2
    end
    inherited ARecargar: TAction
      Tag = 2
      OnExecute = ARecargarExecute
    end
    object AMultiSeleccion: TAction
      Caption = '&Multi-Sel.'
      Hint = 'Multi-Selecci'#243'n'
      ImageIndex = 132
      OnExecute = AMultiSeleccionExecute
    end
  end
end
