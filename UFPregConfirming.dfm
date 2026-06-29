inherited FPregConfirming: TFPregConfirming
  Left = 462
  Top = 347
  Caption = 'Listados de Confirmings'
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
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 122
      Width = 392
      TabOrder = 5
    end
    object RGTipo: TRadioGroup
      Left = 0
      Top = 36
      Width = 392
      Height = 86
      Align = alClient
      Caption = 'Listado'
      ItemIndex = 0
      Items.Strings = (
        'Banco'
        'Todos los Bancos')
      TabOrder = 1
      OnClick = RGTipoClick
    end
    object PNVencimiento: TLFPanel
      Left = 0
      Top = 138
      Width = 392
      Height = 82
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LBLVencimiento: TLFLabel
        Left = 53
        Top = 30
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Vencimiento'
      end
      object DTPVencimiento: TLFDateEdit
        Left = 150
        Top = 27
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
    end
    object EFBanco: TLFEditFind2000
      Left = 71
      Top = 64
      Width = 65
      Height = 21
      TabOrder = 3
      OnChange = EFBancoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'BANCO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EBanco: TLFEdit
      Left = 137
      Top = 64
      Width = 246
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited ALMain: TLFActionList
    Left = 268
    Top = 66
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
