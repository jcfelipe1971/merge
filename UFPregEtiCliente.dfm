inherited FPregEtiCliente: TFPregEtiCliente
  Left = 406
  Top = 410
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Etiquetas de Clientes'
  ClientHeight = 171
  ClientWidth = 375
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 375
    Height = 171
    object LBLEtiVacias: TLFLabel [0]
      Left = 50
      Top = 39
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Etiquetas Vac'#237'as'
    end
    object LBLEtiquetas: TLFLabel [1]
      Left = 72
      Top = 61
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' de Etiquetas'
    end
    object LBLDireccion: TLFLabel [2]
      Left = 71
      Top = 83
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' de Direcci'#243'n'
    end
    inherited TBMain: TLFToolBar
      Width = 375
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      inherited TButtRecargar: TToolButton
        Visible = False
      end
      inherited TButtImprimir: TToolButton
        Hint = 'Imprimir'
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object EEtiVacias: TLFEdit
      Left = 152
      Top = 35
      Width = 85
      Height = 21
      TabOrder = 0
    end
    object EEtiquetas: TLFEdit
      Left = 152
      Top = 57
      Width = 85
      Height = 21
      TabOrder = 1
    end
    object EFDireccion: TLFEditFind2000
      Left = 152
      Top = 79
      Width = 85
      Height = 21
      TabOrder = 2
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'DIRECCION'
      CampoStr = 'DIR_COMPLETA_N'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFDireccionBusqueda
      Filtros = []
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
    end
  end
end
