inherited FPregIntrastatCV: TFPregIntrastatCV
  Left = 502
  Top = 246
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Compras de Intrastat'
  ClientHeight = 216
  ClientWidth = 445
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 445
    Height = 216
    inherited TBMain: TLFToolBar
      Width = 445
      object TButtConf: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object TBExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
    end
    object GBDatos2: TGroupBox
      Left = 0
      Top = 36
      Width = 445
      Height = 98
      Align = alClient
      TabOrder = 1
      object LBlSerie: TLFLabel
        Left = 45
        Top = 20
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object LBLPeriodo: TLFLabel
        Left = 33
        Top = 42
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object EFSerie: TLFEditFind2000
        Left = 76
        Top = 17
        Width = 42
        Height = 21
        TabOrder = 0
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFPeriodo: TLFEditFind2000
        Left = 76
        Top = 39
        Width = 42
        Height = 21
        TabOrder = 1
        OnChange = EFPeriodoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'DESDE'
          'HASTA')
        CampoNum = 'PERIODO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'periodo between '#39'01'#39' and '#39'16'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_PERIODOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PERIODO')
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloSerie: TLFEdit
        Left = 119
        Top = 17
        Width = 243
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
      object DBETituloPeriodo: TLFDbedit
        Left = 119
        Top = 39
        Width = 243
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstIntrastatCV.DSxPeriodo
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
      object DBDEDesde: TLFDBDateEdit
        Left = 119
        Top = 61
        Width = 87
        Height = 21
        DataField = 'DESDE'
        DataSource = DMLstIntrastatCV.DSxPeriodo
        ReadOnly = True
        CheckOnExit = True
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
      end
      object DBDEHasta: TLFDBDateEdit
        Left = 275
        Top = 61
        Width = 87
        Height = 21
        DataField = 'HASTA'
        DataSource = DMLstIntrastatCV.DSxPeriodo
        ReadOnly = True
        CheckOnExit = True
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 5
      end
    end
    object GBDatos: TGroupBox
      Left = 0
      Top = 134
      Width = 445
      Height = 82
      Align = alBottom
      TabOrder = 2
      object Comentario: TLFLabel
        Left = 19
        Top = 47
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LBLFechaListado: TLFLabel
        Left = 9
        Top = 26
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha listado'
      end
      object EComentario: TLFEdit
        Left = 78
        Top = 44
        Width = 284
        Height = 21
        MaxLength = 28
        TabOrder = 1
      end
      object DTPFechaListado: TLFDateEdit
        Left = 78
        Top = 22
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 289
    Top = 30
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
