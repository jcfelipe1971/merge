inherited FPregCuotasCliente: TFPregCuotasCliente
  Left = 402
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ' Listado de cuotas a clientes'
  ClientHeight = 289
  ClientWidth = 504
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 289
    inherited TBMain: TLFToolBar
      Width = 504
      ParentShowHint = False
      ShowHint = True
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLListArt: TLFPanel
      Left = 0
      Top = 36
      Width = 504
      Height = 253
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBCli: TGroupBox
        Left = 0
        Top = 0
        Width = 504
        Height = 145
        Align = alTop
        Caption = ' Cliente '
        TabOrder = 0
        object LHastaCliente: TLFLabel
          Left = 25
          Top = 60
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LDesdeCliente: TLFLabel
          Left = 22
          Top = 38
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LDesdeFecha: TLFLabel
          Left = 22
          Top = 81
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 25
          Top = 103
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesdeCliente: TLFEditFind2000
          Left = 58
          Top = 34
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFDesdeClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHastaCliente: TLFEditFind2000
          Left = 58
          Top = 56
          Width = 64
          Height = 21
          TabOrder = 1
          OnChange = EFHastaClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EClienteD: TLFEdit
          Left = 123
          Top = 34
          Width = 356
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 2
        end
        object EClienteH: TLFEdit
          Left = 123
          Top = 56
          Width = 356
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
        object DEDesdeFecha: TLFDateEdit
          Left = 58
          Top = 78
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 4
        end
        object DEHastaFecha: TLFDateEdit
          Left = 58
          Top = 100
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 5
        end
      end
      object RGOpciones: TRadioGroup
        Left = 0
        Top = 145
        Width = 504
        Height = 108
        Align = alClient
        ItemIndex = 1
        Items.Strings = (
          'Facturadas'
          'No facturadas'
          'Todas')
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 406
    Top = 30
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
