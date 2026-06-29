inherited FPregMovEntreUbicaciones: TFPregMovEntreUbicaciones
  Left = 356
  Top = 193
  Caption = 'Listado de Movimientos entre Ubicaciones'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    inherited TBMain: TLFToolBar
      Width = 392
      object TButtConfiguracionRapida: TToolButton
        Left = 288
        Top = 0
        Caption = '&Configurar'
        ImageIndex = 77
        OnClick = TButtConfiguracionRapidaClick
      end
    end
    object LFPanel1: TLFPanel
      Left = 0
      Top = 36
      Width = 392
      Height = 184
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBFechasProv: TGroupBox
        Left = 0
        Top = 0
        Width = 392
        Height = 68
        Align = alTop
        Caption = 'Fechas'
        TabOrder = 0
        object LBLDesdeProv: TLFLabel
          Left = 11
          Top = 30
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object LBLHastaProv: TLFLabel
          Left = 207
          Top = 30
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object DTPFechaD: TLFDateEdit
          Left = 46
          Top = 26
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPFechaH: TLFDateEdit
          Left = 241
          Top = 26
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GBArticulos: TGroupBox
        Left = 0
        Top = 77
        Width = 392
        Height = 107
        Align = alBottom
        Caption = 'Art'#237'culos'
        TabOrder = 1
        object LFLabel1: TLFLabel
          Left = 9
          Top = 35
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object LFLabel2: TLFLabel
          Left = 12
          Top = 57
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object EFArticuloD: TLFEditFind2000
          Left = 46
          Top = 30
          Width = 82
          Height = 21
          TabOrder = 0
          OnChange = EFArticuloDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticuloDBusqueda
          Filtros = []
        end
        object EFArticuloH: TLFEditFind2000
          Left = 46
          Top = 53
          Width = 82
          Height = 21
          TabOrder = 1
          OnChange = EFArticuloHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFArticuloHBusqueda
          Filtros = []
        end
        object DBETitArticuloD: TLFDbedit
          Left = 131
          Top = 30
          Width = 254
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstMovEntreUbicaciones.DSxArticuloD
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBETitArticuloH: TLFDbedit
          Left = 131
          Top = 53
          Width = 254
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstMovEntreUbicaciones.DSxArticuloH
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
