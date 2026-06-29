inherited FMParametrizacionLotes: TFMParametrizacionLotes
  Left = 421
  Top = 228
  Caption = 'Parametrizaci'#243'n de lotes'
  ClientHeight = 175
  ClientWidth = 446
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 446
    Height = 151
    object LCantidadLotes: TLFLabel [0]
      Left = 24
      Top = 48
      Width = 71
      Height = 13
      Caption = 'Cantidad Lotes'
    end
    object LUnidadesPorLote: TLFLabel [1]
      Left = 160
      Top = 48
      Width = 88
      Height = 13
      Caption = 'Unidades Por Lote'
    end
    object LUnidades: TLFLabel [2]
      Left = 296
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Unidades'
    end
    object LClasificacion: TLFLabel [3]
      Left = 24
      Top = 104
      Width = 59
      Height = 13
      Caption = 'Clasificacion'
    end
    inherited TBMain: TLFToolBar
      Width = 442
      object ButtAceptar: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Crear lotes'
        Caption = 'ButtAceptar'
        ImageIndex = 19
        OnClick = ButtAceptarClick
      end
      inherited EPMain: THYMEditPanel
        Left = 23
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object ECantidadLotes: TLFEdit
      Left = 24
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = ECantidadLotesChange
      OnKeyPress = VerificcionSoloNumeros
    end
    object EUnidadesPorLote: TLFEdit
      Left = 160
      Top = 64
      Width = 121
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = VerificcionSoloNumeros
    end
    object EUnidades: TLFEdit
      Left = 288
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = EUnidadesChange
      OnKeyPress = VerificcionSoloNumeros
    end
    object EFClasificacion: TLFEditFind2000
      Left = 24
      Top = 120
      Width = 393
      Height = 21
      TabOrder = 4
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = False
      AutoCambiarFoco = False
      CampoNum = 'CLASIFICACION'
      CampoStr = 'CLASIFICACION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_LOTES_CLASIFICACOION_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFClasificacionBusqueda
      OrdenadoPor.Strings = (
        'CLASIFICACION')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  inherited TBActions: TLFToolBar
    Top = 151
    Width = 446
  end
  inherited CEMain: TControlEdit
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 12
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
    Top = 24
  end
  inherited FSMain: TLFFibFormStorage
    Top = 16
  end
end
