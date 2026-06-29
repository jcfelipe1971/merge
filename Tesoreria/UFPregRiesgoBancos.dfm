inherited FPregRiesgoBancos: TFPregRiesgoBancos
  Left = 329
  Top = 498
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Riesgos de Bancos'
  ClientHeight = 274
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 274
    inherited TBMain: TLFToolBar
      Width = 392
      object TButtDisenar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object GBFechas: TGroupBox
      Left = 0
      Top = 114
      Width = 392
      Height = 82
      Align = alClient
      Caption = ' Fechas Valor '
      TabOrder = 1
      object LBLFechaD: TLFLabel
        Left = 39
        Top = 36
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLFechaH: TLFLabel
        Left = 180
        Top = 36
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPFechaD: TLFDateEdit
        Left = 76
        Top = 32
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFechaH: TLFDateEdit
        Left = 215
        Top = 32
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GBDatos: TGroupBox
      Left = 0
      Top = 196
      Width = 392
      Height = 78
      Align = alBottom
      TabOrder = 3
      object Comentario: TLFLabel
        Left = 17
        Top = 48
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LBLFechaListado: TLFLabel
        Left = 7
        Top = 27
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha listado'
      end
      object Moneda: TLFLabel
        Left = 195
        Top = 26
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object EComentario: TLFEdit
        Left = 77
        Top = 45
        Width = 285
        Height = 21
        MaxLength = 28
        TabOrder = 2
      end
      object DTPFechaListado: TLFDateEdit
        Left = 77
        Top = 23
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 240
        Top = 22
        Width = 122
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = DMLstRiesgoBancos.DSxMonedas
        TabOrder = 1
      end
    end
    object GBBancos: TGroupBox
      Left = 0
      Top = 36
      Width = 392
      Height = 78
      Align = alTop
      Caption = ' Bancos '
      TabOrder = 2
      object LBLBancosD: TLFLabel
        Left = 39
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLHasta: TLFLabel
        Left = 42
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFBancosD: TLFEditFind2000
        Left = 76
        Top = 17
        Width = 42
        Height = 21
        TabOrder = 0
        OnChange = EFBancosDChange
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
        Tabla_a_buscar = 'EMP_BANCOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'BANCO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFBancosH: TLFEditFind2000
        Left = 76
        Top = 39
        Width = 42
        Height = 21
        TabOrder = 1
        OnChange = EFBancosHChange
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
        Tabla_a_buscar = 'EMP_BANCOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'BANCO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloBancoDesde: TLFEdit
        Left = 119
        Top = 17
        Width = 243
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 2
      end
      object ETituloBancoHasta: TLFEdit
        Left = 119
        Top = 39
        Width = 243
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 324
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
