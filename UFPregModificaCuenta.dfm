inherited FPregModificaCuenta: TFPregModificaCuenta
  Left = 635
  Top = 411
  Caption = 'Modificar Cuenta'
  ClientHeight = 101
  ClientWidth = 443
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 443
    Height = 77
    object LCuenta: TLFLabel [0]
      Left = 12
      Top = 48
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuenta'
    end
    inherited TBMain: TLFToolBar
      Width = 439
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 2
      inherited EPMain: THYMEditPanel
        Width = 26
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtConfirmar: TToolButton
        Left = 26
        Top = 0
        Hint = 'Confirmar la Cuenta'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
    end
    object EFCuenta: TLFEditFind2000
      Left = 50
      Top = 44
      Width = 140
      Height = 21
      TabOrder = 0
      OnChange = EFCuentaChange
      OnKeyDown = EFCuentaKeyDown
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = '((REG_CIERRE <> 0) OR (GESTION IN ('#39'106'#39', '#39'107'#39'))) AND TIPO = 5'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CUENTA')
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloCuenta: TLFEdit
      Left = 192
      Top = 44
      Width = 248
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
      TabOrder = 1
    end
  end
  inherited TBActions: TLFToolBar
    Top = 77
    Width = 443
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
