inherited ProFMLstInformeMarcajes: TProFMLstInformeMarcajes
  Left = 421
  Top = 324
  Caption = 'Listado Informes'
  ClientHeight = 274
  ClientWidth = 458
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 458
    Height = 192
    inherited TBMain: TLFToolBar
      Width = 458
    end
    inherited PCMain: TLFPageControl
      Width = 458
      Height = 156
      ActivePage = TabSheet1
      TabIndex = 0
      object TabSheet1: TTabSheet
        Caption = '&Ficha'
        object LDesdeFecha: TLFLabel
          Left = 37
          Top = 19
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LHastaFecha: TLFLabel
          Left = 216
          Top = 19
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LDesdeMaquina: TLFLabel
          Left = 26
          Top = 48
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Maquina'
        end
        object LHastaMaquina: TLFLabel
          Left = 29
          Top = 72
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Maquina'
        end
        object DeFechaDesde: TLFDateEdit
          Left = 105
          Top = 14
          Width = 97
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DeFechaHasta: TLFDateEdit
          Left = 281
          Top = 14
          Width = 97
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
        object LFDBMaquinaDesde: TLFEditFind2000
          Left = 104
          Top = 45
          Width = 66
          Height = 21
          TabOrder = 2
          OnChange = LFDBMaquinaDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CODMAQ'
          CampoStr = 'DESCRIPCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'PRO_MAQUINAS_C'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
        end
        object LFDBMaquinaHasta: TLFEditFind2000
          Left = 104
          Top = 67
          Width = 66
          Height = 21
          TabOrder = 3
          OnChange = LFDBMaquinaHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CODMAQ'
          CampoStr = 'DESCRIPCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'PRO_MAQUINAS_C'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
        end
        object EMaquinaD: TLFEdit
          Left = 171
          Top = 45
          Width = 206
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 4
        end
        object EMaquinaH: TLFEdit
          Left = 171
          Top = 67
          Width = 206
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 5
        end
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 192
    Width = 458
    Height = 82
    inherited LComentario: TLFLabel
      Left = 37
      Top = 39
    end
    inherited LOrden: TLFLabel
      Left = 244
      Top = 18
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 11
      Top = 18
    end
    inherited EComentario: TLFEdit
      Left = 99
      Top = 36
      Width = 346
    end
    inherited CBOrden: TLFComboBox
      Left = 312
      Top = 14
      Width = 134
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 99
      Top = 14
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfigLst: TAction
      Caption = 'Configuraci'#243'n R'#225'pida'
    end
  end
end
