inherited FPregOrdenesDePago: TFPregOrdenesDePago
  Left = 462
  Top = 347
  Caption = 'Listados de Ordenes de Pago'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    object LBLOrden: TLFLabel [0]
      Left = 39
      Top = 67
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Orden'
    end
    inherited TBMain: TLFToolBar
      Width = 392
      inherited TButtRecargar: TToolButton
        OnClick = TButtRecargarClick
      end
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object EFOrden: TLFEditFind2000
      Left = 71
      Top = 64
      Width = 65
      Height = 21
      TabOrder = 1
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'NUM_ORDEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'EMP_CARTERA_ORD_PAGO'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'NUM_ORDEN')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  inherited ALMain: TLFActionList
    Left = 268
    Top = 66
  end
end
