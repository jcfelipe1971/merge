inherited FPregCosteVentasMP: TFPregCosteVentasMP
  Left = 541
  Top = 257
  Caption = 'Listado de Costes de Mercancia Vendida'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited PCMain: TLFPageControl
      Top = 269
      Height = 8
      Visible = False
    end
    object GBArticulo: TGroupBox
      Left = 0
      Top = 194
      Width = 592
      Height = 75
      Align = alTop
      Caption = 'Art'#237'culo'
      TabOrder = 2
      object LblArtD: TLFLabel
        Left = 56
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LblArtH: TLFLabel
        Left = 59
        Top = 45
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArticulo_H: TLFEditFind2000
        Left = 92
        Top = 42
        Width = 108
        Height = 21
        TabOrder = 1
        Text = 'EFArticulo_H'
        OnChange = EFArticulo_HChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArticulo_D: TLFEditFind2000
        Left = 92
        Top = 20
        Width = 108
        Height = 21
        TabOrder = 0
        Text = 'EFArticulo_D'
        OnChange = EFArticulo_DChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArt_Desde: TLFDbedit
        Left = 201
        Top = 20
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRCosteVentasMP.DSArticuloD
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEArt_Hasta: TLFDbedit
        Left = 201
        Top = 42
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRCosteVentasMP.DSArticuloH
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object GBFamilia: TGroupBox
      Left = 0
      Top = 115
      Width = 592
      Height = 79
      Align = alTop
      Caption = 'Familia'
      TabOrder = 3
      object LblFamD: TLFLabel
        Left = 56
        Top = 26
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LblFamH: TLFLabel
        Left = 59
        Top = 46
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFFamiliaD: TLFEditFind2000
        Left = 92
        Top = 22
        Width = 42
        Height = 21
        TabOrder = 0
        OnChange = EFFamiliaDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFamiliaH: TLFEditFind2000
        Left = 92
        Top = 44
        Width = 42
        Height = 21
        TabOrder = 1
        OnChange = EFFamiliaHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEFamiliaDesde: TLFDbedit
        Left = 135
        Top = 22
        Width = 176
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRCosteVentasMP.DSxFamiliaD
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
      object DBEFamiliaHasta: TLFDbedit
        Left = 135
        Top = 44
        Width = 176
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRCosteVentasMP.DSxFamiliaH
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
    object GBPeriodo: TGroupBox
      Left = 0
      Top = 36
      Width = 592
      Height = 79
      Align = alTop
      Caption = 'Rango de Fechas'
      TabOrder = 4
      object LblFechaD: TLFLabel
        Left = 57
        Top = 27
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LblFechaH: TLFLabel
        Left = 60
        Top = 50
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPFechaD: TDateEdit
        Left = 93
        Top = 24
        Width = 87
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFechaH: TDateEdit
        Left = 93
        Top = 47
        Width = 87
        Height = 21
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      Tag = 1
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
