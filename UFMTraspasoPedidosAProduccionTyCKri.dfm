object FMTraspasoPedidosAProduccionTyCKri: TFMTraspasoPedidosAProduccionTyCKri
  Left = 191
  Top = 132
  Width = 696
  Height = 432
  ActiveControl = EProd01
  Caption = 'Traspaso Pedidos A Producci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TLFPanel
    Left = 0
    Top = 49
    Width = 688
    Height = 231
    Align = alClient
    TabOrder = 0
    object HYTDBGModeloColor: THYTDBGrid
      Left = 1
      Top = 1
      Width = 686
      Height = 229
      Align = alClient
      Color = clInfoBk
      DataSource = DMTraspasoPedidosAProduccionTyCKri.DSxStocksAlmacenesModeloColor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoDeseleccionar = True
      PermutaPaneles = False
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_COLOR'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T01'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T02'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T03'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T04'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T05'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T06'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T07'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T08'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T09'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T10'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T11'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T12'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T13'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T14'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T15'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T16'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T17'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T18'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T19'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T20'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T21'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T22'
          Width = 40
          Visible = True
        end>
    end
  end
  object Panel2: TLFPanel
    Left = 0
    Top = 280
    Width = 688
    Height = 125
    Align = alBottom
    TabOrder = 1
    object Label1: TLFLabel
      Left = 32
      Top = 32
      Width = 28
      Height = 13
      Caption = 'Stock'
    end
    object Label2: TLFLabel
      Left = 32
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Falta'
    end
    object Label3: TLFLabel
      Left = 32
      Top = 102
      Width = 39
      Height = 13
      Caption = 'Producir'
    end
    object Label4: TLFLabel
      Left = 32
      Top = 80
      Width = 70
      Height = 13
      Caption = 'En Producci'#243'n'
    end
    object Label5: TLFLabel
      Left = 32
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Pedido'
    end
    object EStock01: TLFEdit
      Left = 126
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 14
    end
    object EStock02: TLFEdit
      Left = 166
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 15
    end
    object EStock04: TLFEdit
      Left = 246
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 16
    end
    object EStock03: TLFEdit
      Left = 206
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 17
    end
    object EStock08: TLFEdit
      Left = 406
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 18
    end
    object EStock07: TLFEdit
      Left = 366
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 19
    end
    object EStock06: TLFEdit
      Left = 326
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 20
    end
    object EStock05: TLFEdit
      Left = 286
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 21
    end
    object EStock12: TLFEdit
      Left = 566
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 22
    end
    object EStock11: TLFEdit
      Left = 526
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 23
    end
    object EStock10: TLFEdit
      Left = 486
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 24
    end
    object EStock09: TLFEdit
      Left = 446
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 25
    end
    object EStock14: TLFEdit
      Left = 646
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 26
    end
    object EStock13: TLFEdit
      Left = 606
      Top = 27
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 27
    end
    object EFalta01: TLFEdit
      Left = 126
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 28
    end
    object EFalta02: TLFEdit
      Left = 166
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 29
    end
    object EFalta04: TLFEdit
      Left = 246
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 30
    end
    object EFalta03: TLFEdit
      Left = 206
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 31
    end
    object EFalta08: TLFEdit
      Left = 406
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 32
    end
    object EFalta07: TLFEdit
      Left = 366
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 33
    end
    object EFalta06: TLFEdit
      Left = 326
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 34
    end
    object EFalta05: TLFEdit
      Left = 286
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 35
    end
    object EFalta12: TLFEdit
      Left = 566
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 36
    end
    object EFalta11: TLFEdit
      Left = 526
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 37
    end
    object EFalta10: TLFEdit
      Left = 486
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 38
    end
    object EFalta09: TLFEdit
      Left = 446
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 39
    end
    object EFalta14: TLFEdit
      Left = 646
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 40
    end
    object EFalta13: TLFEdit
      Left = 606
      Top = 51
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 41
    end
    object EProd01: TLFEdit
      Left = 126
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 0
    end
    object EProd02: TLFEdit
      Left = 166
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 1
    end
    object EProd04: TLFEdit
      Left = 246
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 3
    end
    object EProd03: TLFEdit
      Left = 206
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 2
    end
    object EProd08: TLFEdit
      Left = 406
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 7
    end
    object EProd07: TLFEdit
      Left = 366
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 6
    end
    object EProd06: TLFEdit
      Left = 326
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 5
    end
    object EProd05: TLFEdit
      Left = 286
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 4
    end
    object EProd12: TLFEdit
      Left = 566
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 11
    end
    object EProd11: TLFEdit
      Left = 526
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 10
    end
    object EProd10: TLFEdit
      Left = 486
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 9
    end
    object EProd09: TLFEdit
      Left = 446
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 8
    end
    object EProd14: TLFEdit
      Left = 646
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 13
    end
    object EProd13: TLFEdit
      Left = 606
      Top = 99
      Width = 40
      Height = 21
      TabOrder = 12
    end
    object EEnProd01: TLFEdit
      Left = 126
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 42
    end
    object EEnProd02: TLFEdit
      Left = 166
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 43
    end
    object EEnProd04: TLFEdit
      Left = 246
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 44
    end
    object EEnProd03: TLFEdit
      Left = 206
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 45
    end
    object EEnProd08: TLFEdit
      Left = 406
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 46
    end
    object EEnProd07: TLFEdit
      Left = 366
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 47
    end
    object EEnProd06: TLFEdit
      Left = 326
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 48
    end
    object EEnProd05: TLFEdit
      Left = 286
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 49
    end
    object EEnProd12: TLFEdit
      Left = 566
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 50
    end
    object EEnProd11: TLFEdit
      Left = 526
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 51
    end
    object EEnProd10: TLFEdit
      Left = 486
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 52
    end
    object EEnProd09: TLFEdit
      Left = 446
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 53
    end
    object EEnProd14: TLFEdit
      Left = 646
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 54
    end
    object EEnProd13: TLFEdit
      Left = 606
      Top = 75
      Width = 40
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 55
    end
    object EPed01: TLFEdit
      Left = 126
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 56
    end
    object EPed02: TLFEdit
      Left = 166
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 57
    end
    object EPed04: TLFEdit
      Left = 246
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 58
    end
    object EPed03: TLFEdit
      Left = 206
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 59
    end
    object EPed08: TLFEdit
      Left = 406
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 60
    end
    object EPed07: TLFEdit
      Left = 366
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 61
    end
    object EPed06: TLFEdit
      Left = 326
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 62
    end
    object EPed05: TLFEdit
      Left = 286
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 63
    end
    object EPed12: TLFEdit
      Left = 566
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 64
    end
    object EPed11: TLFEdit
      Left = 526
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 65
    end
    object EPed10: TLFEdit
      Left = 486
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 66
    end
    object EPed09: TLFEdit
      Left = 446
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 67
    end
    object EPed14: TLFEdit
      Left = 646
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 68
    end
    object EPed13: TLFEdit
      Left = 606
      Top = 3
      Width = 40
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 69
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 49
    Align = alTop
    TabOrder = 2
    object Label6: TLFLabel
      Left = 224
      Top = 6
      Width = 24
      Height = 13
      Caption = 'Serie'
    end
    object Label7: TLFLabel
      Left = 224
      Top = 27
      Width = 20
      Height = 13
      Caption = 'Alm.'
    end
    object Label8: TLFLabel
      Left = 304
      Top = 6
      Width = 62
      Height = 13
      Caption = 'Fecha Orden'
    end
    object Label9: TLFLabel
      Left = 304
      Top = 27
      Width = 70
      Height = 13
      Caption = 'Fecha Entrega'
    end
    object Label10: TLFLabel
      Left = 486
      Top = 6
      Width = 40
      Height = 13
      Caption = 'Operario'
    end
    object Label11: TLFLabel
      Left = 486
      Top = 27
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object LEscandallo: TLFLabel
      Left = 588
      Top = 6
      Width = 39
      Height = 13
      Caption = 'Escand.'
    end
    object BProducir: TButton
      Left = 3
      Top = 2
      Width = 57
      Height = 45
      Caption = '&Producir'
      TabOrder = 0
      OnClick = BProducirClick
    end
    object RGModo: TRadioGroup
      Left = 64
      Top = 1
      Width = 153
      Height = 43
      Caption = 'Modo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Pedido'
        'Diferencia')
      TabOrder = 1
      OnClick = RGModoClick
    end
    object EFSerie: TEditFind2000
      Left = 250
      Top = 2
      Width = 49
      Height = 21
      TabOrder = 2
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
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFAlmacen: TEditFind2000
      Left = 250
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 3
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DEFechaOrden: TLFDateEdit
      Left = 376
      Top = 2
      Width = 105
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
    object DEFechaEntrega: TLFDateEdit
      Left = 376
      Top = 24
      Width = 105
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 5
    end
    object EFOperario: TEditFind2000
      Left = 528
      Top = 2
      Width = 49
      Height = 21
      TabOrder = 6
      Text = '1'
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
      Filtros = []
    end
    object EFMaterial: TEditFind2000
      Left = 528
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 7
      Text = '1'
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'TIPO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_TIPO_MATERIAL'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = []
    end
    object EFEscandalloProd: TEditFind2000
      Left = 632
      Top = 2
      Width = 49
      Height = 21
      TabOrder = 8
      Text = '1'
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'NUMERO'
      CampoStr = 'ARTICULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS_ESC_PRODUCCION'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = []
    end
  end
end
