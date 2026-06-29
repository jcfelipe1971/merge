inherited FMDashboard: TFMDashboard
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Dashboard'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLFiltros: TLFPanel
        Left = 41
        Top = 0
        Width = 80
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LEjercicio: TLFLabel
          Left = 7
          Top = 5
          Width = 21
          Height = 13
          Caption = 'Ejer.'
        end
        object EFEjercicio: TLFEditFind2000
          Left = 32
          Top = 0
          Width = 41
          Height = 21
          TabOrder = 0
          OnChange = EFEjercicioChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'CIERRE')
          CampoNum = 'EJERCICIO'
          CampoStr = 'APERTURA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_EJERCICIOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EJERCICIO DESC')
          Filtros = [obEmpresa]
          Entorno = EntornoDash
        end
      end
      object TBRefrescar: TToolButton
        Left = 121
        Top = 0
        Action = ARefrescar
      end
    end
    object PNLMetricas: TLFPanel
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PCMetricas: TLFPageControl
        Left = 0
        Top = 0
        Width = 498
        Height = 302
        Align = alClient
        OwnerDraw = True
        TabOrder = 0
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 272
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 312
    Top = 0
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 376
    Top = 0
  end
  object ALDashboard: TActionList
    Left = 408
    object ARefrescar: TAction
      Caption = 'Refrescar'
      ImageIndex = 26
      OnExecute = ARefrescarExecute
    end
  end
  object EntornoDash: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 440
  end
end
