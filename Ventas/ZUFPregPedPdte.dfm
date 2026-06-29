inherited ZFPregPedPdte: TZFPregPedPdte
  Left = 310
  Top = 199
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Pedidos de Venta Pendientes (TyC)'
  ClientHeight = 419
  ClientWidth = 593
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 593
    Height = 356
    inherited TBMain: TLFToolBar
      Width = 593
      object TButtMultiSerie: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSerie
        Caption = '&Multi-Serie'
      end
    end
    inherited PCMain: TLFPageControl
      Top = 80
      Width = 593
      ActivePage = TSCliente
      Align = alTop
      TabIndex = 0
      OnChange = PCMainChange
      object TSCliente: TTabSheet
        Caption = 'Cliente'
        object Panel5: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 133
          Align = alCustom
          BevelOuter = bvNone
          TabOrder = 0
          object LClienteD: TLFLabel
            Left = 44
            Top = 60
            Width = 66
            Height = 13
            Caption = 'Desde Cliente'
          end
          object LClienteH: TLFLabel
            Left = 47
            Top = 82
            Width = 63
            Height = 13
            Caption = 'Hasta Cliente'
          end
          object Label5: TLFLabel
            Left = 105
            Top = 104
            Width = 64
            Height = 13
            Caption = 'Desde Fecha'
          end
          object Label6: TLFLabel
            Left = 284
            Top = 104
            Width = 61
            Height = 13
            Caption = 'Hasta Fecha'
          end
          object EFClienteD: TLFEditFind2000
            Left = 116
            Top = 56
            Width = 59
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
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEClienteD: TLFDbedit
            Left = 176
            Top = 56
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSClienteD
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
          object DBEClienteH: TLFDbedit
            Left = 176
            Top = 78
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSclienteH
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
          object EFClienteH: TLFEditFind2000
            Left = 116
            Top = 78
            Width = 59
            Height = 21
            TabOrder = 1
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
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DTPFechaD: TDateEdit
            Left = 176
            Top = 100
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 2
          end
          object DTPFechaH: TDateEdit
            Left = 351
            Top = 100
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 3
          end
        end
      end
      object TSArticulo: TTabSheet
        Caption = 'Art'#237'culo'
        ImageIndex = 1
        object Panel4: TLFPanel
          Left = 0
          Top = 0
          Width = 585
          Height = 213
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LArtFechaD: TLFLabel
            Left = 109
            Top = 93
            Width = 64
            Height = 13
            Caption = 'Desde Fecha'
          end
          object LArtFechaH: TLFLabel
            Left = 288
            Top = 94
            Width = 61
            Height = 13
            Caption = 'Hasta Fecha'
          end
          object LBLFamDesde: TLFLabel
            Left = 12
            Top = 150
            Width = 69
            Height = 13
            Caption = ' Desde Familia'
          end
          object LBLFamHasta: TLFLabel
            Left = 18
            Top = 169
            Width = 63
            Height = 13
            Caption = 'Hasta Familia'
          end
          object LArticuloD: TLFLabel
            Left = 18
            Top = 44
            Width = 71
            Height = 13
            Caption = 'Desde Art'#237'culo'
          end
          object LArticuloH: TLFLabel
            Left = 17
            Top = 132
            Width = 68
            Height = 13
            Caption = 'Hasta Art'#237'culo'
          end
          object DTPFechaArtD: TDateEdit
            Left = 180
            Top = 89
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 4
          end
          object DTPFechaArtH: TDateEdit
            Left = 355
            Top = 89
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 5
          end
          object EFFamiliaD: TLFEditFind2000
            Left = 86
            Top = 145
            Width = 93
            Height = 21
            TabOrder = 0
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
            OnBusqueda = EFFamiliaDBusqueda
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFamiliaD: TLFDbedit
            Left = 179
            Top = 145
            Width = 378
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSxFamiliaD
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object EFFamiliaH: TLFEditFind2000
            Left = 86
            Top = 167
            Width = 93
            Height = 21
            TabOrder = 1
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
            OnBusqueda = EFFamiliaHBusqueda
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFamiliaH: TLFDbedit
            Left = 179
            Top = 167
            Width = 378
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSxFamiliaH
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
          object EFArticuloD: TLFEditFind2000
            Left = 94
            Top = 40
            Width = 93
            Height = 21
            TabOrder = 2
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
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEArticuloD: TLFDbedit
            Left = 188
            Top = 40
            Width = 378
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSArticuloD
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
          object EFArticuloH: TLFEditFind2000
            Left = 90
            Top = 129
            Width = 93
            Height = 21
            TabOrder = 3
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
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEArticuloH: TLFDbedit
            Left = 183
            Top = 129
            Width = 378
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSArticuloH
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
        end
      end
      object TSFechaE: TTabSheet
        Caption = 'Fecha Entrega'
        ImageIndex = 2
        object Panel3: TLFPanel
          Left = 0
          Top = 0
          Width = 585
          Height = 213
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFechaD: TLFLabel
            Left = 105
            Top = 73
            Width = 64
            Height = 13
            Caption = 'Desde Fecha'
          end
          object LFechaEH: TLFLabel
            Left = 284
            Top = 73
            Width = 61
            Height = 13
            Caption = 'Hasta Fecha'
          end
          object DTPFechaED: TDateEdit
            Left = 176
            Top = 69
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPFechaEH: TDateEdit
            Left = 351
            Top = 69
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
      object TSAgente: TTabSheet
        Caption = 'Agente'
        ImageIndex = 3
        object Panel6: TLFPanel
          Left = 0
          Top = 0
          Width = 585
          Height = 213
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LabelAgenteD: TLFLabel
            Left = 42
            Top = 60
            Width = 68
            Height = 13
            Caption = 'Desde Agente'
          end
          object LabelAgenteH: TLFLabel
            Left = 45
            Top = 82
            Width = 65
            Height = 13
            Caption = 'Hasta Agente'
          end
          object LabelFechaD: TLFLabel
            Left = 105
            Top = 104
            Width = 64
            Height = 13
            Caption = 'Desde Fecha'
          end
          object LabelFechaH: TLFLabel
            Left = 284
            Top = 104
            Width = 61
            Height = 13
            Caption = 'Hasta Fecha'
          end
          object DBEAgenteD: TLFDbedit
            Left = 176
            Top = 56
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSAgenteD
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
          object DBEAgenteH: TLFDbedit
            Left = 176
            Top = 78
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMLstPedPdte.DSAgenteH
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
          object EFAgenteD: TLFEditFind2000
            Left = 116
            Top = 56
            Width = 59
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
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFAgenteH: TLFEditFind2000
            Left = 116
            Top = 78
            Width = 59
            Height = 21
            TabOrder = 1
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
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DTPFechaAgenteD: TDateEdit
            Left = 176
            Top = 100
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 2
          end
          object DTPFechaAgenteH: TDateEdit
            Left = 351
            Top = 100
            Width = 87
            Height = 21
            NumGlyphs = 2
            TabOrder = 3
          end
        end
      end
    end
    object GBCanal: TGroupBox
      Left = 0
      Top = 321
      Width = 593
      Height = 35
      Align = alClient
      Caption = 'Canal'
      TabOrder = 2
      object LCanalD: TLFLabel
        Left = 94
        Top = 19
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LCanalH: TLFLabel
        Left = 97
        Top = 40
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFCanalD: TLFEditFind2000
        Left = 130
        Top = 15
        Width = 48
        Height = 21
        TabOrder = 0
        OnChange = EFCanalDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CANAL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCanalH: TLFEditFind2000
        Left = 130
        Top = 37
        Width = 48
        Height = 21
        TabOrder = 1
        OnChange = EFCanalHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CANAL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBECanadD: TLFDbedit
        Left = 179
        Top = 15
        Width = 173
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMLstPedPdte.DSxCanalDesde
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
      object DBECanalH: TLFDbedit
        Left = 179
        Top = 37
        Width = 173
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMLstPedPdte.DSxCanalHasta
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
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 593
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object RBServido: TRadioButton
        Left = 219
        Top = 13
        Width = 113
        Height = 17
        Hint = 'Art'#237'culo en OP Cerrada'
        Caption = 'Pdte. Servir (OP)'
        TabOrder = 0
      end
      object RBPdteServir: TRadioButton
        Left = 23
        Top = 13
        Width = 154
        Height = 17
        Hint = 'Art'#237'culo en Pedido Cerrado y en OP Cerrada'
        Caption = 'Pdte. Servir (OP+Pedidos)'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object RBTodos: TRadioButton
        Left = 399
        Top = 13
        Width = 166
        Height = 17
        Caption = 'Todos(Pendientes y Servidos)'
        TabOrder = 2
        Visible = False
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 356
    Width = 593
    Height = 63
    inherited EComentario: TLFEdit
      TabOrder = 1
    end
    inherited CBOrden: TLFComboBox
      Width = 203
      TabOrder = 0
      OnChange = CBOrdenChange
    end
  end
  inherited ALMain: TLFActionList
    Left = 424
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMultiSerie: TAction [4]
      Caption = 'Multi-Serie'
      Hint = 'Multi-Serie'
      ImageIndex = 115
      OnExecute = AMultiSerieExecute
    end
    inherited AConfigurar: TAction
      Hint = 'Configuraci'#243'n R'#225'pida del Listado'
    end
  end
end
