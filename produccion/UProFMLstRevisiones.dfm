inherited ProFMLstRevisiones: TProFMLstRevisiones
  Left = 421
  Top = 324
  Caption = 'Listado Revisiones'
  ClientHeight = 344
  ClientWidth = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 444
    Height = 278
    inherited TBMain: TLFToolBar
      Width = 444
    end
    inherited PCMain: TLFPageControl
      Width = 444
      Height = 242
      ActivePage = TabSheet1
      TabIndex = 0
      object TabSheet1: TTabSheet
        Caption = '&Ficha'
        object LDesdeFecha: TLFLabel
          Left = 37
          Top = 18
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LHastaFecha: TLFLabel
          Left = 216
          Top = 18
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LHastaTipo: TLFLabel
          Left = 49
          Top = 78
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Tipo'
        end
        object LDesdeTipo: TLFLabel
          Left = 46
          Top = 56
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Tipo'
        end
        object LDesdeMaquina: TLFLabel
          Left = 26
          Top = 112
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Maquina'
        end
        object LHastaMaquina: TLFLabel
          Left = 29
          Top = 135
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
          Left = 105
          Top = 109
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
          OrdenadoPor.Strings = (
            'CODMAQ')
          Filtros = []
        end
        object LFDBMaquinaHasta: TLFEditFind2000
          Left = 105
          Top = 131
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
          OrdenadoPor.Strings = (
            'CODMAQ')
          Filtros = []
        end
        object LFETipoD: TLFEditFind2000
          Left = 105
          Top = 52
          Width = 66
          Height = 21
          TabOrder = 4
          OnChange = LFETipoDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO'
          CampoStr = 'DESCRIPCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'PRO_TIPO_MAQUINAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TIPO')
          Filtros = []
        end
        object DescTipoD: TLFDbedit
          Left = 172
          Top = 52
          Width = 206
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'DESCRIPCION'
          DataSource = ProDMLstRevisiones.DSxTipoD
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object DescTipoH: TLFDbedit
          Left = 172
          Top = 74
          Width = 206
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'DESCRIPCION'
          DataSource = ProDMLstRevisiones.DSxTipoH
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object LFETipoH: TLFEditFind2000
          Left = 105
          Top = 74
          Width = 66
          Height = 21
          TabOrder = 7
          OnChange = LFETipoHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO'
          CampoStr = 'DESCRIPCION'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'PRO_TIPO_MAQUINAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TIPO')
          Filtros = []
        end
        object CBRevisados: TLFCheckBox
          Left = 104
          Top = 156
          Width = 273
          Height = 17
          Caption = 'Revisados'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Alignment = taLeftJustify
        end
        object EDescMaquinaD: TLFEdit
          Left = 172
          Top = 109
          Width = 206
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 9
        end
        object EDescMaquinaH: TLFEdit
          Left = 172
          Top = 131
          Width = 206
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 10
        end
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 278
    Width = 444
    inherited LComentario: TLFLabel
      Visible = False
    end
    inherited LOrden: TLFLabel
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Visible = False
    end
    inherited EComentario: TLFEdit
      Visible = False
    end
    inherited CBOrden: TLFComboBox
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Visible = False
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
