inherited FPregLstSerializacion: TFPregLstSerializacion
  Left = 313
  Top = 145
  Caption = 'Listado de Series'
  ClientHeight = 330
  ClientWidth = 377
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 377
    Height = 330
    inherited TBMain: TLFToolBar
      Width = 377
      object TButtConfiguracion: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
      end
    end
    object PNLDatosListado: TLFPanel
      Left = 0
      Top = 265
      Width = 377
      Height = 65
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object LComentario: TLFLabel
        Left = 31
        Top = 31
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LFechaListado: TLFLabel
        Left = 6
        Top = 10
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object EComentario: TLFEdit
        Left = 90
        Top = 28
        Width = 279
        Height = 21
        MaxLength = 60
        TabOrder = 1
      end
      object TDPFechaListado: TLFDateEdit
        Left = 90
        Top = 6
        Width = 97
        Height = 21
        CheckOnExit = True
        DefaultToday = True
        DialogTitle = 'Seleccione una fecha'
        NumGlyphs = 2
        TabOrder = 0
        Text = '20/11/2018'
      end
    end
    object RGMostrar: TRadioGroup
      Left = 74
      Top = 196
      Width = 228
      Height = 65
      Caption = 'Datos Mostrar'
      ItemIndex = 0
      Items.Strings = (
        'Mostrar series con entradas y salidas'
        'Mostrar series con stock dispobible')
      TabOrder = 2
    end
    object GBArticulo: TGroupBox
      Left = 14
      Top = 46
      Width = 348
      Height = 70
      Caption = 'Art'#237'culo'
      TabOrder = 3
      object LDesdeArticulo: TLFLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 9
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArticuloDesde: TLFEditFind2000
        Left = 43
        Top = 16
        Width = 110
        Height = 21
        TabOrder = 0
        OnChange = EFArticuloDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloDesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArticuloHasta: TLFEditFind2000
        Left = 43
        Top = 38
        Width = 110
        Height = 21
        TabOrder = 1
        OnChange = EFArticuloHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloDesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBTituloArticuloH: TLFDbedit
        Left = 154
        Top = 38
        Width = 187
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstSerializacion.DSxArtHasta
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBTituloArticuloD: TLFDbedit
        Left = 154
        Top = 16
        Width = 187
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstSerializacion.DSxArtDesde
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
    object DBSeries: TGroupBox
      Left = 14
      Top = 118
      Width = 348
      Height = 70
      Caption = 'Serie'
      TabOrder = 4
      object LDesdeSerie: TLFLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaSerie: TLFLabel
        Left = 9
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFSerieDesde: TLFEditFind2000
        Left = 43
        Top = 16
        Width = 110
        Height = 21
        TabOrder = 0
        OnChange = EFSerieDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NSERIE'
        CampoStr = 'ARTICULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_SERIALIZACION'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFSerieDesdeBusqueda
        OrdenadoPor.Strings = (
          'NSERIE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSerieHasta: TLFEditFind2000
        Left = 43
        Top = 38
        Width = 110
        Height = 21
        TabOrder = 1
        OnChange = EFSerieHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NSERIE'
        CampoStr = 'ARTICULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_SERIALIZACION'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFSerieHastaBusqueda
        OrdenadoPor.Strings = (
          'NSERIE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBTituloSerieH: TLFDbedit
        Left = 154
        Top = 38
        Width = 188
        Height = 21
        Color = clInfoBk
        DataField = 'NSERIE'
        DataSource = DMLstSerializacion.DSxSerieHasta
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBTituloSerieD: TLFDbedit
        Left = 154
        Top = 16
        Width = 188
        Height = 21
        Color = clInfoBk
        DataField = 'NSERIE'
        DataSource = DMLstSerializacion.DSxSerieDesde
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
  end
  inherited ALMain: TLFActionList
    Left = 420
    Top = 46
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
