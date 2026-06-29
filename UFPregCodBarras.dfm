inherited FPregCodBarras: TFPregCodBarras
  Left = 604
  Top = 258
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de C'#243'digo de Barras'
  ClientHeight = 269
  ClientWidth = 368
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 368
    Height = 269
    object LTexto3: TLFLabel [0]
      Left = 99
      Top = 148
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Texto 3 (fecha)'
    end
    object LTexto2: TLFLabel [1]
      Left = 135
      Top = 126
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Texto 2'
    end
    object LTexto1: TLFLabel [2]
      Left = 135
      Top = 103
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Texto 1'
    end
    object LIdioma: TLFLabel [3]
      Left = 140
      Top = 170
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Idioma'
    end
    object LEtiqutasVacias: TLFLabel [4]
      Left = 35
      Top = 59
      Width = 136
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#250'mero de C'#243'digo de Barras'
    end
    object LEtiquetasEnBlanco: TLFLabel [5]
      Left = 22
      Top = 81
      Width = 149
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#250'mero de Espacios en Blanco'
    end
    inherited TBMain: TLFToolBar
      Width = 368
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLValoracion: TLFPanel
      Left = 0
      Top = 208
      Width = 368
      Height = 61
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object CBValorado: TLFCheckBox
        Left = 8
        Top = 8
        Width = 75
        Height = 17
        Caption = 'Valorado'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBValoradoChange
      end
      object EFTarifa: TLFEditFind2000
        Left = 86
        Top = 6
        Width = 47
        Height = 21
        TabOrder = 1
        Text = 'NOR'
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TARIFA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_TARIFAS_C'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TARIFA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object CBUnidadesBultos: TLFCheckBox
        Left = 8
        Top = 29
        Width = 161
        Height = 17
        Caption = 'Usar bultos como unidades'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object ETexto2: TLFEdit
      Left = 175
      Top = 122
      Width = 119
      Height = 21
      TabOrder = 2
    end
    object ETexto1: TLFEdit
      Left = 175
      Top = 100
      Width = 119
      Height = 21
      TabOrder = 3
    end
    object EIdioma: TLFEditFind2000
      Left = 175
      Top = 166
      Width = 47
      Height = 21
      MaxLength = 3
      TabOrder = 4
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'IDIOMA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_IDIOMAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'DEFECTO DESC, IDIOMA')
      Filtros = []
    end
    object ECantidadEtiquetsEnBlanco: TLFEdit
      Left = 175
      Top = 78
      Width = 68
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 5
      Text = '0'
    end
    object ECantidadEtiquetas: TLFEdit
      Left = 175
      Top = 56
      Width = 68
      Height = 21
      TabOrder = 6
    end
    object DEFecha: TLFDateEdit
      Left = 175
      Top = 144
      Width = 119
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 7
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBValorado.Checked')
  end
end
