inherited FMLstEntreFechas: TFMLstEntreFechas
  Left = 520
  Top = 257
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listados'
  ClientHeight = 329
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 520
    Height = 329
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 520
      EdgeBorders = []
      inherited TButtImprimir: TToolButton
        Hint = 'Imprimir'
      end
      inherited TButtPrevisualizar: TToolButton
        Hint = 'Previsualizar'
        ImageIndex = 19
      end
      inherited TButtSalir: TToolButton
        Hint = 'Salir'
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TBExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
    end
    inherited PBListado: TProgressBar
      Top = 208
      Width = 520
      TabOrder = 4
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 90
      Width = 520
      Height = 134
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBLHastaFecha: TLFLabel
        Left = 267
        Top = 38
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LBLDesdeFecha: TLFLabel
        Left = 64
        Top = 38
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LBLDesdeProveedor: TLFLabel
        Left = 31
        Top = 83
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLHastaProveedor: TLFLabel
        Left = 34
        Top = 105
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LBLSerie: TLFLabel
        Left = 104
        Top = 16
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Layout = tlCenter
      end
      object LBLSDesdeFechaCon: TLFLabel
        Left = 39
        Top = 58
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha Cont.'
        Enabled = False
      end
      object LBLSHastaFechaCon: TLFLabel
        Left = 243
        Top = 59
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha Cont'
        Enabled = False
      end
      object DTPHasta: TLFDateEdit
        Left = 335
        Top = 34
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object DTPDesde: TLFDateEdit
        Left = 135
        Top = 34
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object EFProvHasta: TLFEditFind2000
        Left = 67
        Top = 101
        Width = 66
        Height = 21
        TabOrder = 6
        OnChange = EFProvHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROVEEDOR'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PROVEEDORES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFProvDesde: TLFEditFind2000
        Left = 67
        Top = 79
        Width = 66
        Height = 21
        TabOrder = 5
        OnChange = EFProvDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROVEEDOR'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PROVEEDORES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EProvHasta: TLFEdit
        Left = 134
        Top = 101
        Width = 380
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
        TabOrder = 8
      end
      object EProvDesde: TLFEdit
        Left = 134
        Top = 79
        Width = 380
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
        TabOrder = 7
      end
      object CBSeries: TLFComboBox
        Left = 135
        Top = 12
        Width = 287
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBSeriesChange
      end
      object DTPDesdeCon: TLFDateEdit
        Left = 135
        Top = 56
        Width = 87
        Height = 21
        CheckOnExit = True
        Enabled = False
        NumGlyphs = 2
        TabOrder = 3
      end
      object DTPHastaCon: TLFDateEdit
        Left = 335
        Top = 56
        Width = 87
        Height = 21
        CheckOnExit = True
        Enabled = False
        NumGlyphs = 2
        TabOrder = 4
      end
    end
    object GBOrden: TGroupBox
      Left = 0
      Top = 224
      Width = 520
      Height = 105
      Align = alBottom
      Caption = 'Opciones'
      TabOrder = 2
      object LBLMoneda: TLFLabel
        Left = 50
        Top = 39
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object LComentario: TLFLabel
        Left = 38
        Top = 61
        Width = 53
        Height = 13
        Caption = 'Comentario'
      end
      object LFechaListado: TLFLabel
        Left = 15
        Top = 83
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object ChkBOrden: TLFCheckBox
        Left = 9
        Top = 14
        Width = 155
        Height = 17
        Caption = 'Ordenado por Documento'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
      end
      object ChkBMostrarBImponible: TLFCheckBox
        Left = 184
        Top = 14
        Width = 140
        Height = 17
        Caption = 'Mostrar Base Imponible'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object DBEMoneda: TLFDbedit
        Left = 167
        Top = 35
        Width = 339
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstEntrefechas.DSxMonedas
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
      object EFMoneda: TLFEditFind2000
        Left = 100
        Top = 35
        Width = 66
        Height = 21
        TabOrder = 3
        OnChange = EFMonedaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'MONEDA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, MONEDA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ChkBAgruparPorProveedor: TLFCheckBox
        Left = 359
        Top = 14
        Width = 155
        Height = 17
        Caption = 'Agrupado por Proveedor'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object EComentario: TLFEdit
        Left = 100
        Top = 57
        Width = 406
        Height = 21
        TabOrder = 5
      end
      object TDPFechaListado: TLFDateEdit
        Left = 100
        Top = 79
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 6
      end
    end
    object RGEstado: TRadioGroup
      Left = 0
      Top = 36
      Width = 520
      Height = 54
      Align = alTop
      Caption = 'Estado'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Todos'
        'Documentos Abiertos'
        'Documentos Cerrados'
        'Documentos Abiertos a Fecha de Fin Listado')
      TabOrder = 3
      OnClick = RGEstadoClick
    end
  end
end
