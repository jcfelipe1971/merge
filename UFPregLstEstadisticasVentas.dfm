inherited FPregLstEstadisticasVentas: TFPregLstEstadisticasVentas
  Left = 318
  Top = 393
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Estad'#237'sticas de Ventas por Art'#237'culo'
  ClientHeight = 345
  ClientWidth = 592
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 345
    inherited TBMain: TLFToolBar
      Width = 592
      object ToolButton1: TToolButton
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
    inherited PBListado: TProgressBar
      Top = 143
      Width = 592
      TabOrder = 3
    end
    inherited PCMain: TLFPageControl
      Width = 592
      Height = 107
      ActivePage = TSClientes
      TabIndex = 1
      object TSAgentes: TTabSheet
        Caption = '&Agentes'
        OnShow = TSAgentesShow
        object LBLAgenteD: TLFLabel
          Left = 15
          Top = 6
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agente Desde'
        end
        object LBLAgenteH: TLFLabel
          Left = 18
          Top = 28
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agente Hasta'
        end
        object EFAgenteH: TLFEditFind2000
          Left = 90
          Top = 24
          Width = 64
          Height = 21
          TabOrder = 2
          OnChange = EFAgenteHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAgenteD: TLFEditFind2000
          Left = 90
          Top = 2
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFAgenteDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEAgenteH: TLFEdit
          Left = 155
          Top = 24
          Width = 416
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
        object DBEAgenteD: TLFEdit
          Left = 155
          Top = 2
          Width = 416
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
      object TSClientes: TTabSheet
        Caption = '&Clientes'
        ImageIndex = 1
        OnShow = TSClientesShow
        object LBLClienteD: TLFLabel
          Left = 17
          Top = 6
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente Desde'
        end
        object LBLClienteH: TLFLabel
          Left = 20
          Top = 28
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente Hasta'
        end
        object LClienteAgenteD: TLFLabel
          Left = 15
          Top = 50
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agente Desde'
        end
        object LClienteAgenteH: TLFLabel
          Left = 18
          Top = 72
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agente Hasta'
        end
        object EFClienteD: TLFEditFind2000
          Left = 90
          Top = 2
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFClienteDChange
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
        object DBEClienteD: TLFEdit
          Left = 155
          Top = 2
          Width = 416
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
        object DBEClienteH: TLFEdit
          Left = 155
          Top = 24
          Width = 416
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
        object EFClienteH: TLFEditFind2000
          Left = 90
          Top = 24
          Width = 64
          Height = 21
          TabOrder = 2
          OnChange = EFClienteHChange
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
        object EFClienteAgenteH: TLFEditFind2000
          Left = 90
          Top = 68
          Width = 64
          Height = 21
          TabOrder = 6
          OnChange = EFClienteAgenteHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFClienteAgenteD: TLFEditFind2000
          Left = 90
          Top = 46
          Width = 64
          Height = 21
          TabOrder = 4
          OnChange = EFClienteAgenteDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEClienteAgenteTituloD: TLFEdit
          Left = 155
          Top = 46
          Width = 416
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
          TabOrder = 5
        end
        object DBEClienteAgenteTituloH: TLFEdit
          Left = 155
          Top = 68
          Width = 416
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
      end
      object TSProveedores: TTabSheet
        Caption = '&Proveedores'
        ImageIndex = 2
        OnShow = TSProveedoresShow
        object LBLProveedorD: TLFLabel
          Left = 24
          Top = 6
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prov. Desde'
        end
        object LBLProveedorH: TLFLabel
          Left = 27
          Top = 28
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prov. Hasta'
        end
        object EFProvD: TLFEditFind2000
          Left = 90
          Top = 2
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFProvDChange
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
        object DBEProveedorD: TLFEdit
          Left = 155
          Top = 2
          Width = 416
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
        object DBEProveedorH: TLFEdit
          Left = 155
          Top = 24
          Width = 416
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
        object EFProvH: TLFEditFind2000
          Left = 90
          Top = 24
          Width = 64
          Height = 21
          TabOrder = 2
          OnChange = EFProvHChange
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
        object CBProrratearPortes: TLFCheckBox
          Left = 90
          Top = 48
          Width = 121
          Height = 17
          Caption = 'Prorratear Portes'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    object LFPMain: TLFPanel
      Left = 0
      Top = 159
      Width = 592
      Height = 186
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Canal: TLFLabel
        Left = 55
        Top = 149
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Canal'
      end
      object Serie: TLFLabel
        Left = 259
        Top = 149
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object LFechaD: TLFLabel
        Left = 19
        Top = 106
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Desde'
      end
      object LArticuloD: TLFLabel
        Left = 12
        Top = 18
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo Desde'
      end
      object LArticuloH: TLFLabel
        Left = 15
        Top = 40
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo Hasta'
      end
      object LFamiliaD: TLFLabel
        Left = 17
        Top = 62
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Familia Desde'
      end
      object LFamiliaH: TLFLabel
        Left = 20
        Top = 84
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Familia Hasta'
      end
      object LFechaH: TLFLabel
        Left = 222
        Top = 106
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Hasta'
      end
      object LBLComentario: TLFLabel
        Left = 30
        Top = 128
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object CBCanales: TLFComboBox
        Left = 90
        Top = 145
        Width = 132
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 11
        OnChange = CBCanalesChange
      end
      object CBSeries: TLFComboBox
        Left = 290
        Top = 145
        Width = 132
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 12
        OnChange = CBSeriesChange
      end
      object EFArticuloD: TLFEditFind2000
        Left = 90
        Top = 14
        Width = 90
        Height = 21
        TabOrder = 0
        OnChange = EFArticuloDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
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
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloD: TLFEdit
        Left = 181
        Top = 14
        Width = 390
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
      object EFArticuloH: TLFEditFind2000
        Left = 90
        Top = 36
        Width = 90
        Height = 21
        TabOrder = 2
        OnChange = EFArticuloHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
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
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloH: TLFEdit
        Left = 181
        Top = 36
        Width = 390
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
      object EFFamiliaD: TLFEditFind2000
        Left = 90
        Top = 58
        Width = 90
        Height = 21
        TabOrder = 4
        OnChange = EFFamiliaDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
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
      object EFamiliaH: TLFEdit
        Left = 181
        Top = 58
        Width = 390
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
        TabOrder = 5
      end
      object EFFamiliaH: TLFEditFind2000
        Left = 90
        Top = 80
        Width = 90
        Height = 21
        TabOrder = 6
        OnChange = EFFamiliaHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
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
      object EFamiliaD: TLFEdit
        Left = 181
        Top = 80
        Width = 390
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
      object DEFechaD: TLFDateEdit
        Left = 90
        Top = 102
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 8
      end
      object DEFechaH: TLFDateEdit
        Left = 290
        Top = 102
        Width = 87
        Height = 21
        CheckOnExit = True
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 9
      end
      object EComentario: TLFEdit
        Left = 90
        Top = 124
        Width = 481
        Height = 21
        MaxLength = 30
        TabOrder = 10
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 448
    Top = 8
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 480
    Top = 8
  end
end
