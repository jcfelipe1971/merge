inherited FPregLSTAgentes: TFPregLSTAgentes
  Left = 387
  Top = 209
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Agentes y Clientes'
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
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLAgrupacion: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 307
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label7: TLFLabel
        Left = 270
        Top = 167
        Width = 27
        Height = 13
        Caption = 'Canal'
      end
      object Label8: TLFLabel
        Left = 273
        Top = 188
        Width = 24
        Height = 13
        Caption = 'Serie'
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 100
        Width = 592
        Height = 101
        Align = alTop
        Caption = 'Clientes'
        TabOrder = 0
        object Label3: TLFLabel
          Left = 41
          Top = 36
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Label4: TLFLabel
          Left = 44
          Top = 58
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFCliHasta: TLFEditFind2000
          Left = 77
          Top = 54
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
          Left = 77
          Top = 32
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
        object DBECliHasta: TLFDbedit
          Left = 144
          Top = 54
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLSTAgente.DSxClienteH
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
        object DBECliDesde: TLFDbedit
          Left = 144
          Top = 32
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLSTAgente.DSxCliente
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
        Width = 592
        Height = 100
        Align = alTop
        Caption = 'Agente'
        TabOrder = 1
        object Label5: TLFLabel
          Left = 41
          Top = 34
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Label6: TLFLabel
          Left = 44
          Top = 56
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFAgeDesde: TLFEditFind2000
          Left = 77
          Top = 30
          Width = 66
          Height = 21
          TabOrder = 0
          OnChange = EFAgeDesdeChange
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
          Tabla_a_buscar = 'VER_AGENTES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAgeHasta: TLFEditFind2000
          Left = 77
          Top = 52
          Width = 66
          Height = 21
          TabOrder = 1
          OnChange = EFAgeHastaChange
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
          Tabla_a_buscar = 'VER_AGENTES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEAgeDesde: TLFDbedit
          Left = 144
          Top = 30
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLSTAgente.DSxAgente
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
        object DBEAgeHasta: TLFDbedit
          Left = 144
          Top = 52
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLSTAgente.DSxAgenteH
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
        Top = 201
        Width = 250
        Height = 106
        Align = alLeft
        Caption = 'Fechas'
        TabOrder = 2
        object Label1: TLFLabel
          Left = 41
          Top = 27
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object Label2: TLFLabel
          Left = 44
          Top = 49
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 77
          Top = 23
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHasta: TLFDateEdit
          Left = 77
          Top = 45
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object CBCanal: TLFComboBox
        Left = 308
        Top = 221
        Width = 210
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
      object CBSerie: TLFComboBox
        Left = 308
        Top = 243
        Width = 210
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
      end
      object CBFacturados: TLFCheckBox
        Left = 308
        Top = 268
        Width = 183
        Height = 17
        Caption = 'Admitir Albaranes Facturados'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 525
    Top = 24
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
  end
end
