inherited FpregEtiquetasLotes: TFpregEtiquetasLotes
  Left = 517
  Top = 382
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Etiquetas de Lotes'
  ClientHeight = 186
  ClientWidth = 366
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 366
    Height = 186
    inherited TBMain: TLFToolBar
      Width = 366
      ParentShowHint = False
      ShowHint = True
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 170
      Width = 366
      TabOrder = 2
    end
    object PNLCodBarras: TLFPanel
      Left = 0
      Top = 36
      Width = 366
      Height = 134
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBLEtiVacias: TLFLabel
        Left = 53
        Top = 18
        Width = 138
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#250'mero de Etiquetas de Lote'
      end
      object LIdioma: TLFLabel
        Left = 160
        Top = 40
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Idioma'
      end
      object LPastadas: TLFLabel
        Left = 147
        Top = 70
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pastadas'
      end
      object LPastadasCantEtiq: TLFLabel
        Left = 126
        Top = 92
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Etiq./Pastada'
      end
      object LSufijo: TLFLabel
        Left = 165
        Top = 114
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sufijo'
      end
      object EEtiquetas: TLFEdit
        Left = 197
        Top = 16
        Width = 68
        Height = 21
        TabOrder = 0
        OnKeyPress = EEtiquetasKeyPress
      end
      object EIdioma: TLFEditFind2000
        Left = 197
        Top = 38
        Width = 47
        Height = 21
        MaxLength = 3
        TabOrder = 1
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
      object EPastadas: TLFEdit
        Left = 197
        Top = 68
        Width = 68
        Height = 21
        TabOrder = 2
        OnKeyPress = EEtiquetasKeyPress
      end
      object EPastadasCantEtiq: TLFEdit
        Left = 197
        Top = 90
        Width = 68
        Height = 21
        TabOrder = 3
        OnKeyPress = EEtiquetasKeyPress
      end
      object ESufijo: TLFEdit
        Left = 197
        Top = 112
        Width = 68
        Height = 21
        TabOrder = 4
        Text = '.1'
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 322
    Top = 40
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 292
    Top = 40
  end
end
