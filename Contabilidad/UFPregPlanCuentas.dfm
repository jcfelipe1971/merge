inherited FPregPlanCuentas: TFPregPlanCuentas
  Left = 563
  Top = 328
  HelpContext = 253
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado del Plan de Cuentas'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 307
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBCuentas: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 150
        Align = alTop
        Caption = 'Cuentas'
        TabOrder = 0
        object LInferior: TLFLabel
          Left = 16
          Top = 64
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inferior'
        end
        object LSuperior: TLFLabel
          Left = 9
          Top = 86
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Superior'
        end
        object EFCuentaInf: TLFEditFind2000
          Left = 53
          Top = 60
          Width = 104
          Height = 21
          TabOrder = 0
          OnChange = EFCuentaInfChange
          OnExit = EFCuentaInfExit
          OnKeyDown = EFCuentaInfKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'CUENTA'
            'TITULO')
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CUENTAS                    '
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CUENTA')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCuentaSup: TLFEditFind2000
          Left = 53
          Top = 82
          Width = 104
          Height = 21
          TabOrder = 1
          OnChange = EFCuentaSupChange
          OnExit = EFCuentaSupExit
          OnKeyDown = EFCuentaSupKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'CUENTA'
            'TITULO')
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'CON_CUENTAS                    '
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CUENTA')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBECtaDesde: TLFDbedit
          Left = 158
          Top = 60
          Width = 422
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRPlanCuentas.DSxCta_Desde
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBECtaHasta: TLFDbedit
          Left = 158
          Top = 82
          Width = 422
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRPlanCuentas.DSxCta_Hasta
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GBOtros: TGroupBox
        Left = 0
        Top = 157
        Width = 592
        Height = 150
        Align = alBottom
        TabOrder = 1
        object LCaracterRelleno: TLFLabel
          Left = 278
          Top = 78
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Car'#225'cter Relleno'
        end
        object LTituloListado: TLFLabel
          Left = 63
          Top = 56
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Titulo del listado'
        end
        object LFechaListado: TLFLabel
          Left = 59
          Top = 78
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha del listado'
        end
        object ECharRelleno: TLFEdit
          Left = 364
          Top = 74
          Width = 19
          Height = 21
          AutoSize = False
          MaxLength = 1
          TabOrder = 2
          Text = '*'
        end
        object ETituloListado: TLFEdit
          Left = 145
          Top = 52
          Width = 238
          Height = 21
          TabOrder = 0
          Text = 'Plan de Cuentas'
        end
        object DTPFechaListado: TLFDateEdit
          Left = 145
          Top = 74
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 412
    Top = 6
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
