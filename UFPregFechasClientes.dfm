inherited FPregFechasClientes: TFPregFechasClientes
  Left = 373
  Top = 353
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Fechas/Clientes'
  ClientHeight = 289
  ClientWidth = 504
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 289
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 504
      inherited TButtRecargar: TToolButton
        ImageIndex = 39
      end
      inherited TButtPrevisualizar: TToolButton
        ImageIndex = 19
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Hint = 'Configuraci'#243'n R'#225'pida de Listados'
        Caption = 'Conf. R'#225'pida'
        ImageIndex = 77
        ParentShowHint = False
        ShowHint = True
      end
    end
    object GBTitulo: TGroupBox
      Left = 0
      Top = 146
      Width = 504
      Height = 143
      Align = alClient
      Caption = 'Clientes'
      TabOrder = 1
      object LDesdeCliente: TLFLabel
        Left = 11
        Top = 48
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaCliente: TLFLabel
        Left = 14
        Top = 69
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFCliDesde: TLFEditFind2000
        Left = 47
        Top = 44
        Width = 66
        Height = 21
        TabOrder = 0
        OnChange = EFCliDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCliHasta: TLFEditFind2000
        Left = 47
        Top = 66
        Width = 66
        Height = 21
        TabOrder = 1
        OnChange = EFCliHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ECliDesde: TLFEdit
        Left = 114
        Top = 44
        Width = 378
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
        TabOrder = 2
      end
      object ECliHasta: TLFEdit
        Left = 114
        Top = 66
        Width = 378
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
        TabOrder = 3
      end
    end
    object GBFechas: TGroupBox
      Left = 0
      Top = 36
      Width = 504
      Height = 110
      Align = alTop
      Caption = 'Fechas'
      TabOrder = 2
      object LDesdeFecha: TLFLabel
        Left = 84
        Top = 77
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFecha: TLFLabel
        Left = 238
        Top = 77
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeRemesa: TLFLabel
        Left = 74
        Top = 19
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Remesa'
      end
      object LHastaRemesa: TLFLabel
        Left = 77
        Top = 44
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Remesa'
      end
      object LDesdeFormaPago: TLFLabel
        Left = 246
        Top = 21
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde F.Pago'
      end
      object LHastaFormaPago: TLFLabel
        Left = 249
        Top = 44
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta F.Pago'
      end
      object DTPDesde: TLFDateEdit
        Left = 122
        Top = 73
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPHasta: TLFDateEdit
        Left = 273
        Top = 73
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object EDesdeRemesa: TLFEdit
        Left = 151
        Top = 16
        Width = 57
        Height = 21
        TabOrder = 2
        Text = '0'
      end
      object EHastaRemesa: TLFEdit
        Left = 151
        Top = 40
        Width = 57
        Height = 21
        TabOrder = 3
        Text = '99999'
      end
      object EDesdeFPago: TLFEdit
        Left = 318
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 4
        Text = '0'
      end
      object EHastaFPago: TLFEdit
        Left = 318
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 5
        Text = 'zzz'
      end
    end
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
