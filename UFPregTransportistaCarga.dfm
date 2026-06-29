inherited FPregTransportistaCarga: TFPregTransportistaCarga
  Left = 377
  Top = 239
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Carga de Transportistas'
  ClientHeight = 289
  ClientWidth = 504
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 289
    inherited TBMain: TLFToolBar
      Width = 504
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
    inherited PBListado: TProgressBar
      Top = 273
      Width = 504
      TabOrder = 2
    end
    object PNLAgrupacion: TLFPanel
      Left = 0
      Top = 36
      Width = 504
      Height = 237
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LCanal: TLFLabel
        Left = 217
        Top = 175
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Canal'
      end
      object LSerie: TLFLabel
        Left = 220
        Top = 196
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object GBClientes: TGroupBox
        Left = 0
        Top = 77
        Width = 504
        Height = 77
        Align = alTop
        Caption = 'Cliente'
        TabOrder = 1
        object LDesdeCliente: TLFLabel
          Left = 7
          Top = 25
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaCliente: TLFLabel
          Left = 10
          Top = 47
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFCliHasta: TLFEditFind2000
          Left = 43
          Top = 43
          Width = 66
          Height = 21
          TabOrder = 1
          OnChange = EFCliHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCliDesde: TLFEditFind2000
          Left = 43
          Top = 21
          Width = 66
          Height = 21
          TabOrder = 0
          OnChange = EFCliDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ECliHasta: TLFEdit
          Left = 110
          Top = 43
          Width = 381
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
        object ECliDesde: TLFEdit
          Left = 110
          Top = 21
          Width = 381
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
          TabOrder = 3
        end
      end
      object GBAcreedores: TGroupBox
        Left = 0
        Top = 0
        Width = 504
        Height = 77
        Align = alTop
        Caption = 'Transportista'
        TabOrder = 0
        object LDesdeTransportista: TLFLabel
          Left = 7
          Top = 25
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaTransportista: TLFLabel
          Left = 10
          Top = 47
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFAcrDesde: TLFEditFind2000
          Left = 43
          Top = 21
          Width = 66
          Height = 21
          TabOrder = 0
          OnChange = EFAcrDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ACREEDOR'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'tipo=7'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ACREEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAcrHasta: TLFEditFind2000
          Left = 43
          Top = 43
          Width = 66
          Height = 21
          TabOrder = 1
          OnChange = EFAcrHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ACREEDOR'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'tipo=7'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ACREEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETransDesde: TLFEdit
          Left = 110
          Top = 21
          Width = 381
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
        object ETransHasta: TLFEdit
          Left = 110
          Top = 43
          Width = 381
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
          TabOrder = 3
        end
      end
      object GBFechas: TGroupBox
        Left = 0
        Top = 154
        Width = 198
        Height = 83
        Align = alLeft
        Caption = 'Fechas'
        TabOrder = 2
        object LDesdeFecha: TLFLabel
          Left = 27
          Top = 31
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 30
          Top = 53
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 63
          Top = 27
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHasta: TLFDateEdit
          Left = 63
          Top = 49
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object CBCanal: TLFComboBox
        Left = 250
        Top = 171
        Width = 185
        Height = 21
        ItemHeight = 13
        TabOrder = 3
      end
      object CBSerie: TLFComboBox
        Left = 250
        Top = 193
        Width = 185
        Height = 21
        ItemHeight = 13
        TabOrder = 4
      end
      object CBFacturados: TLFCheckBox
        Left = 220
        Top = 222
        Width = 161
        Height = 17
        Caption = 'Admitir Albaranes Facturados'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBResumido: TLFCheckBox
        Left = 388
        Top = 222
        Width = 74
        Height = 17
        Caption = 'Resumido'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 403
    Top = 16
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
