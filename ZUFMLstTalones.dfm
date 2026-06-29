inherited ZFMLstTalones: TZFMLstTalones
  Left = 401
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Tesorer'#237'a'
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
      inherited TButtImprimir: TToolButton
        Tag = 1
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLComentarios: TLFPanel
      Left = 0
      Top = 176
      Width = 392
      Height = 98
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Comentario: TLFLabel
        Left = 43
        Top = 70
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LBLComP: TLFLabel
        Left = 10
        Top = 26
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario Pagos'
      end
      object LBLComC: TLFLabel
        Left = 7
        Top = 48
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario Cobros'
      end
      object EComentario: TLFEdit
        Left = 102
        Top = 66
        Width = 265
        Height = 21
        MaxLength = 28
        TabOrder = 0
      end
      object EComPagos: TLFEdit
        Left = 102
        Top = 22
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
      object EComCobros: TLFEdit
        Left = 102
        Top = 44
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 2
      end
      object CBTitCuen: TLFCheckBox
        Left = 239
        Top = 46
        Width = 130
        Height = 17
        Caption = 'Mostrar T'#237'tulo Cuenta'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBNumDoc: TLFCheckBox
        Left = 239
        Top = 24
        Width = 133
        Height = 17
        Caption = 'Mostrar N'#186' Documento'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object PNLTesoreria: TLFPanel
      Left = 0
      Top = 95
      Width = 392
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Fecha_del_listado: TLFLabel
        Left = 39
        Top = 35
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object Moneda: TLFLabel
        Left = 30
        Top = 57
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object LFLabel1: TLFLabel
        Left = 32
        Top = 14
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tercero'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 75
        Top = 31
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 75
        Top = 53
        Width = 166
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = ZDMLstTalones.DSxMonedas
        TabOrder = 1
      end
      object DBETituloTercero: TLFDbedit
        Left = 141
        Top = 10
        Width = 232
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMBRE_R_SOCIAL'
        DataSource = ZDMLstTalones.DSxTerceros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object LFTercero: TLFEditFind2000
        Left = 75
        Top = 9
        Width = 65
        Height = 21
        TabOrder = 3
        OnChange = LFTerceroChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TERCERO'
        CampoStr = 'NOMBRE_R_SOCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TERCEROS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TERCERO')
        Filtros = []
      end
    end
    object Vencimiento: TGroupBox
      Left = 0
      Top = 36
      Width = 392
      Height = 59
      Align = alTop
      Caption = 'Vencimiento'
      TabOrder = 2
      object Desde: TLFLabel
        Left = 40
        Top = 26
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Hasta: TLFLabel
        Left = 194
        Top = 26
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPHasta: TLFDateEdit
        Left = 228
        Top = 22
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object DTPDesde: TLFDateEdit
        Left = 77
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
    Left = 300
    Top = 58
    inherited AImprimir: TAction
      Tag = 1
      OnExecute = Imprimir
    end
    inherited APrev: TAction
      OnExecute = Imprimir
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
