inherited FPregLstProvArt: TFPregLstProvArt
  Left = 469
  Top = 328
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Estad'#237'sticas de compras de proveedores por art'#237'culo'
  ClientHeight = 293
  ClientWidth = 512
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBMain: TLFToolBar
    Width = 512
    object ToolButton1: TToolButton
      Left = 288
      Top = 0
      Action = AConfigurar
    end
  end
  inherited PCMain: TLFPageControl
    Width = 512
    Height = 253
    ActivePage = TSProveedores
    TabIndex = 0
    object TSProveedores: TTabSheet
      Caption = '&Proveedores'
      object Label5: TLFLabel
        Left = 45
        Top = 114
        Width = 40
        Height = 22
        AutoSize = False
        Caption = 'Fechas'
        Layout = tlCenter
      end
      object Label1: TLFLabel
        Left = 11
        Top = 64
        Width = 71
        Height = 13
        Caption = 'Art'#237'culo Desde'
      end
      object Label3: TLFLabel
        Left = 13
        Top = 86
        Width = 68
        Height = 13
        Caption = 'Art'#237'culo Hasta'
      end
      object Label4: TLFLabel
        Left = 23
        Top = 10
        Width = 59
        Height = 13
        Caption = 'Prov. Desde'
      end
      object Label6: TLFLabel
        Left = 25
        Top = 33
        Width = 56
        Height = 13
        Caption = 'Prov. Hasta'
      end
      object Label2: TLFLabel
        Left = 50
        Top = 151
        Width = 27
        Height = 13
        Caption = 'Canal'
      end
      object Label7: TLFLabel
        Left = 53
        Top = 173
        Width = 24
        Height = 13
        Caption = 'Serie'
      end
      object Label8: TLFLabel
        Left = 27
        Top = 204
        Width = 53
        Height = 13
        Caption = 'Comentario'
      end
      object EFArticuloH: TLFEditFind2000
        Left = 87
        Top = 83
        Width = 85
        Height = 21
        TabOrder = 0
        OnChange = EFArticuloHChange
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloHBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArticuloD: TLFEditFind2000
        Left = 87
        Top = 60
        Width = 85
        Height = 21
        TabOrder = 1
        OnChange = EFArticuloDChange
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticuloDBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DTPFechaH: TLFDateEdit
        Left = 182
        Top = 114
        Width = 88
        Height = 22
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 2
      end
      object DTPFechaD: TLFDateEdit
        Left = 87
        Top = 114
        Width = 88
        Height = 22
        NumGlyphs = 2
        TabOrder = 3
      end
      object DBEArticuloH: TLFDBEdit
        Left = 173
        Top = 83
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstProvArt.DSxArticuloH
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
      object DBEArticuloD: TLFDBEdit
        Left = 173
        Top = 60
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstProvArt.DSxArticuloD
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object CBCanales: TLFComboBox
        Left = 87
        Top = 147
        Width = 132
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 6
        OnChange = CBCanalesChange
        Items.Strings = (
          'Todos los canales')
      end
      object CBSeries: TLFComboBox
        Left = 87
        Top = 170
        Width = 132
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
        OnChange = CBSeriesChange
        Items.Strings = (
          'Todas las series')
      end
      object EFProvH: TLFEditFind2000
        Left = 87
        Top = 30
        Width = 86
        Height = 21
        TabOrder = 8
        OnChange = EFProvHChange
        Base_de_datos = DMMain.DataBase
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
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFProvD: TLFEditFind2000
        Left = 87
        Top = 7
        Width = 86
        Height = 21
        TabOrder = 9
        OnChange = EFProvDChange
        Base_de_datos = DMMain.DataBase
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
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEProveedorH: TLFDBEdit
        Left = 174
        Top = 30
        Width = 301
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstProvArt.DSxProvH
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBEProveedorD: TLFDBEdit
        Left = 174
        Top = 7
        Width = 301
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstProvArt.DSxProvD
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object EComentario: TLFEdit
        Left = 87
        Top = 200
        Width = 182
        Height = 21
        MaxLength = 30
        TabOrder = 12
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    Top = 10
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfigurar: TAction
      Caption = '&Configurar'
      Hint = 'Configurar el informe'
      ImageIndex = 77
      OnExecute = AConfigurarExecute
    end
  end
end
