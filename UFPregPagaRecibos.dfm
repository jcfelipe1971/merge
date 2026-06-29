inherited FPregPagaRecibos: TFPregPagaRecibos
  Left = 537
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pago Autom'#225'tico de Recibos'
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
      ButtonWidth = 79
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      inherited TButtImprimir: TToolButton
        Left = 79
        Visible = False
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 158
        Hint = 'Pago Automatico de Recibos'
        Caption = '&Realizar Pago'
      end
      inherited TButtSalir: TToolButton
        Left = 237
      end
    end
    inherited PBListado: TProgressBar
      Top = 204
      Width = 392
      TabOrder = 2
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 392
      Height = 168
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBLFormaPago: TLFLabel
        Left = 7
        Top = 59
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cuenta'
      end
      object LHint: TLFLabel
        Left = 0
        Top = 0
        Width = 392
        Height = 26
        Align = alTop
        Caption = 
          'Marca como pagado todos los recibos de cartera pendientes entre ' +
          'fechas de vencimiento.'#13#10'Previamente asigna la cuenta de pago a c' +
          'ada vencimiento.'
      end
      object LSigno: TLFLabel
        Left = 14
        Top = 36
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Signo'
      end
      object Vencimiento: TGroupBox
        Left = 0
        Top = 67
        Width = 392
        Height = 101
        Align = alBottom
        Caption = 'Vencimiento'
        TabOrder = 0
        object Desde: TLFLabel
          Left = 106
          Top = 27
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object Hasta: TLFLabel
          Left = 109
          Top = 50
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 144
          Top = 24
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHasta: TLFDateEdit
          Left = 144
          Top = 46
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object EFCuenta: TLFEditFind2000
        Left = 48
        Top = 55
        Width = 90
        Height = 21
        TabOrder = 1
        OnChange = EFCuentaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'CUENTA'
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        CondicionBusqueda = '(gestion=11 or gestion=27) and tipo = 5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETitulo: TLFEdit
        Left = 139
        Top = 55
        Width = 248
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object ESigno: TLFEdit
        Left = 48
        Top = 33
        Width = 339
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 263
    Top = 46
  end
end
