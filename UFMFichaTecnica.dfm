inherited FMFichaTecnica: TFMFichaTecnica
  Left = 264
  Top = 112
  Width = 957
  Height = 621
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ficha T'#233'cnica'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 947
    Height = 568
    OnResize = PMainResize
    object SPHistoricoReparaciones: TSplitter [0]
      Left = 2
      Top = 478
      Width = 943
      Height = 8
      Cursor = crVSplit
      Align = alBottom
      Color = clAppWorkSpace
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 943
      inherited NavMain: THYMNavigator
        DataSource = DMFichaTecnica.DSQMFichaTecnica
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBEMatricula
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMFichaTecnica.DSQMFichaTecnica
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 943
      Height = 450
      Constraints.MinHeight = 450
      inherited TSFicha: TTabSheet
        object SBAGaleria: TSpeedButton [0]
          Left = 180
          Top = 147
          Width = 380
          Height = 17
          GroupIndex = -1
          OnDblClick = SBAGaleriaDblClick
        end
        object SBACliente: TSpeedButton [1]
          Left = 544
          Top = 16
          Width = 233
          Height = 17
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        inherited PEdit: TLFPanel
          Width = 935
          Height = 422
          inherited G2KTableLoc: TG2KTBLoc
            Top = 62
            Plan.Strings = (
              
                'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
                'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
            DataSource = DMFichaTecnica.DSQMFichaTecnica
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_FICHA_TECNICA'
            CampoNum = 'MATRICULA'
            CampoStr = 'NOMBRE_R_SOCIAL'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'MATRICULA')
          end
          object PNLFicha: TLFPanel
            Left = 0
            Top = 0
            Width = 569
            Height = 422
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              569
              422)
            object LTitulo: TLFLabel
              Left = 82
              Top = 38
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Titulo'
            end
            object LRenting: TLFLabel
              Left = 71
              Top = 258
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Renting'
            end
            object LNotas: TLFLabel
              Left = 80
              Top = 368
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Notas'
            end
            object LMotor: TLFLabel
              Left = 81
              Top = 127
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Motor'
            end
            object LModelo: TLFLabel
              Left = 73
              Top = 83
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Modelo'
            end
            object LMedidasNeumatico: TLFLabel
              Left = 14
              Top = 193
              Width = 94
              Height = 13
              Alignment = taRightJustify
              Caption = 'Medidas Neumatico'
            end
            object LMatricula: TLFLabel
              Left = 65
              Top = 16
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Matricula'
            end
            object LMarca: TLFLabel
              Left = 78
              Top = 60
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Marca'
            end
            object LImagen: TLFLabel
              Left = 72
              Top = 325
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imagen'
            end
            object LGaleria: TLFLabel
              Left = 75
              Top = 347
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Galeria'
            end
            object LFechaUltimaITV: TLFLabel
              Left = 27
              Top = 215
              Width = 82
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Ultima ITV'
            end
            object LFechaProximaITV: TLFLabel
              Left = 245
              Top = 215
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Prox. ITV'
            end
            object LFechaCompra: TLFLabel
              Left = 39
              Top = 279
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Compra'
            end
            object LColor: TLFLabel
              Left = 84
              Top = 149
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Color'
            end
            object LCliente: TLFLabel
              Left = 77
              Top = 236
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
            end
            object LBastidor: TLFLabel
              Left = 70
              Top = 105
              Width = 38
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bastidor'
            end
            object LAnyoFabricacion: TLFLabel
              Left = 31
              Top = 171
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'A'#241'o Fabricacion'
            end
            object LKilomentraje: TLFLabel
              Left = 51
              Top = 303
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'Kilomentraje'
            end
            object LIdFichaTecnica: TLFLabel
              Left = 467
              Top = 16
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object ETituloImagen: TLFEdit
              Left = 180
              Top = 321
              Width = 381
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 19
            end
            object BCargarImagen: TButton
              Left = 513
              Top = 323
              Width = 23
              Height = 18
              Caption = '...'
              TabOrder = 20
              Visible = False
              OnClick = BCargarImagenClick
            end
            object BClipboard: TButton
              Left = 536
              Top = 323
              Width = 23
              Height = 18
              Hint = 'Cargar imagen desde porta papeles'
              Caption = 'P'
              TabOrder = 21
              Visible = False
              OnClick = BClipboardClick
            end
            object DBDEFechaCompra: TLFDBDateEdit
              Left = 113
              Top = 277
              Width = 121
              Height = 21
              DataField = 'FECHA_COMPRA'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 16
            end
            object DBDEFechaProximaITV: TLFDBDateEdit
              Left = 326
              Top = 211
              Width = 121
              Height = 21
              DataField = 'FECHA_PROXIMA_ITV'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 12
            end
            object DBDEFecUltimaITV: TLFDBDateEdit
              Left = 113
              Top = 211
              Width = 121
              Height = 21
              DataField = 'FECHA_ULTIMA_ITV'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 11
            end
            object DBEAnyoFabricacion: TLFDbedit
              Left = 113
              Top = 167
              Width = 66
              Height = 21
              DataField = 'ANYO_FABRICACION'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 9
            end
            object DBEBastidor: TLFDbedit
              Left = 113
              Top = 101
              Width = 448
              Height = 21
              DataField = 'BASTIDOR'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 6
            end
            object DBECliente: TLFDBEditFind2000
              Left = 113
              Top = 233
              Width = 97
              Height = 21
              DataField = 'CLIENTE'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 13
              OnChange = DBEClienteChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CLIENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'CLIENTE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEColor: TLFDbedit
              Left = 113
              Top = 145
              Width = 448
              Height = 21
              DataField = 'COLOR'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 8
            end
            object DBEFGaleria: TLFDBEditFind2000
              Left = 113
              Top = 343
              Width = 66
              Height = 21
              DataField = 'ID_GALERIA'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 22
              OnChange = DBEFGaleriaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_GALERIA'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ID'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'ID')
              Filtros = []
            end
            object DBEFImagen: TLFDBEditFind2000
              Left = 113
              Top = 321
              Width = 66
              Height = 21
              DataField = 'ID_IMAGEN'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 18
              OnChange = DBEFImagenChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_IMAGENES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO'
              CampoStr = 'NOMBRE'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'CODIGO')
              Filtros = []
            end
            object DBEMarca: TLFDBEditFind2000
              Left = 113
              Top = 57
              Width = 66
              Height = 21
              DataField = 'MARCA'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 3
              OnChange = DBEMarcaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_MARCA'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'MARCA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'MARCA')
              Filtros = []
            end
            object DBEMatricula: TLFDbedit
              Left = 113
              Top = 13
              Width = 224
              Height = 21
              DataField = 'MATRICULA'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 0
              OnChange = DBEMatriculaChange
            end
            object DBEMedidasNeumatico: TLFDbedit
              Left = 113
              Top = 189
              Width = 448
              Height = 21
              DataField = 'MEDIDA_NEUMATICO'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 10
            end
            object DBEModelo: TLFDbedit
              Left = 113
              Top = 79
              Width = 448
              Height = 21
              DataField = 'MODELO'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 5
            end
            object DBEMotor: TLFDbedit
              Left = 113
              Top = 123
              Width = 448
              Height = 21
              DataField = 'MOTOR'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 7
            end
            object DBERenting: TLFDbedit
              Left = 113
              Top = 255
              Width = 448
              Height = 21
              DataField = 'RENTING'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 15
            end
            object DBETitulo: TLFDbedit
              Left = 113
              Top = 35
              Width = 448
              Height = 21
              DataField = 'TITULO'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 2
            end
            object DBMNotas: TLFDBMemo
              Left = 113
              Top = 365
              Width = 448
              Height = 49
              Anchors = [akLeft, akTop, akBottom]
              DataField = 'NOTAS'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 24
            end
            object ECliente: TLFEdit
              Left = 211
              Top = 233
              Width = 350
              Height = 21
              Color = clAqua
              Enabled = False
              TabOrder = 14
              OnDblClick = EClienteDblClick
            end
            object EMarca: TLFEdit
              Left = 180
              Top = 57
              Width = 381
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 4
            end
            object ETituloGaleria: TLFEdit
              Left = 180
              Top = 343
              Width = 381
              Height = 21
              Color = clAqua
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 23
            end
            object DBEKilomentraje: TLFDbedit
              Left = 113
              Top = 299
              Width = 97
              Height = 21
              DataField = 'KILOMETRAJE'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              TabOrder = 17
            end
            object DBEIdFicheTecnica: TLFDbedit
              Left = 480
              Top = 13
              Width = 81
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ID_FICHA_TECNICA'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              OnChange = DBEMatriculaChange
            end
          end
          object PNLImagen: TLFPanel
            Left = 569
            Top = 0
            Width = 366
            Height = 422
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 366
              Height = 422
              Align = alClient
              AutoSize = True
              Center = True
              IncrementalDisplay = True
              Proportional = True
              Stretch = True
            end
          end
        end
      end
      object TSGaleria: TTabSheet [1]
        Caption = 'Galeria'
        ImageIndex = 2
        OnShow = TSGaleriaShow
        object TBGaleria: TLFToolBar
          Left = 0
          Top = 0
          Width = 935
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object PNLTBGaleria: TLFPanel
            Left = 0
            Top = 0
            Width = 521
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object LGaleriaMatricula: TLFLabel
              Left = 5
              Top = 5
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Matricula'
            end
            object DBEGaleriaMatricula: TLFDbedit
              Left = 53
              Top = 1
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'MATRICULA'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              Enabled = False
              TabOrder = 0
            end
            object DBEGaleriaTitulo: TLFDbedit
              Left = 175
              Top = 1
              Width = 344
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMFichaTecnica.DSQMFichaTecnica
              Enabled = False
              TabOrder = 1
              OnDblClick = DBEGaleriaTituloDblClick
            end
          end
        end
        object LVGaleria: TListView
          Left = 0
          Top = 22
          Width = 935
          Height = 400
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = <>
          TabOrder = 1
          OnDblClick = LVGaleriaDblClick
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 935
          Height = 422
          DataSource = DMFichaTecnica.DSQMFichaTecnica
          CamposAOrdenar.Strings = (
            'ANYO_FABRICACION'
            'BASTIDOR'
            'CLIENTE'
            'COLOR'
            'FECHA_COMPRA'
            'FECHA_PROXIMA_ITV'
            'FECHA_ULTIMA_ITV'
            'ID_FICHA_TECNICA'
            'ID_MARCA'
            'KILOMETRAJE'
            'MARCA'
            'MATRICULA'
            'MEDIDA_NEUMATICO'
            'MODELO'
            'MOTOR'
            'NOMBRE_R_SOCIAL'
            'RENTING'
            'TITULO'
            'TITULO_MARCA')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_FICHA_TECNICA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATRICULA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARCA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODELO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASTIDOR'
              Width = 222
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_COMPRA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PROXIMA_ITV'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RENTING'
              Width = 189
              Visible = True
            end>
        end
      end
    end
    object PNLHistoricoReparaciones: TLFPanel
      Left = 2
      Top = 486
      Width = 943
      Height = 80
      Align = alBottom
      BevelOuter = bvNone
      Constraints.MinHeight = 80
      TabOrder = 2
      object DBGHistoricoReparaciones: THYTDBGrid
        Left = 0
        Top = 0
        Width = 943
        Height = 80
        Align = alClient
        Color = clInfoBk
        DataSource = DMFichaTecnica.DSQMCabReparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGHistoricoReparacionesCellClick
        OnDrawColumnCell = DBGMainDrawColumnCell
        OnDblClick = DBGHistoricoReparacionesDblClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        TabFicha = TSFicha
        PermutaPaneles = True
        CamposAOrdenar.Strings = (
          'ANYO_FABRICACION'
          'BASTIDOR'
          'CLIENTE'
          'COLOR'
          'FECHA_COMPRA'
          'FECHA_PROXIMA_ITV'
          'FECHA_ULTIMA_ITV'
          'ID_FICHA_TECNICA'
          'ID_MARCA'
          'KILOMETRAJE'
          'MARCA'
          'MATRICULA'
          'MEDIDA_NEUMATICO'
          'MODELO'
          'MOTOR'
          'NOMBRE_R_SOCIAL'
          'RENTING'
          'TITULO'
          'TITULO_MARCA')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'IDCABREPARAR'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EJERCICIO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ENTRADA'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_SALIDA'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_TIPO_REPARACION'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ACTUACION'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_TIPO_ACTUACION'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACION'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_SITUACION'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_ESTADO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO_REPAR'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_REP_RECEPCION'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROYECTO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_PROYECTO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EJERCICIO_ORIGEN'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE_ORIGEN'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ORIGEN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG_ORIGEN'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EJERCICIO_DESTINO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE_DESTINO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DESTINO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG_DESTINO'
            Width = 50
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 568
    Width = 947
  end
  inherited CEMain: TControlEdit
    Left = 448
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 484
    Top = 4
  end
  inherited ALMain: TLFActionList
    Left = 376
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
    end
    object AGaleria: TAction
      Category = 'Otros'
      Caption = 'Galeria'
      OnExecute = AGaleriaExecute
    end
    object ACliente: TAction
      Category = 'Otros'
      Caption = 'Cliente'
      OnExecute = AClienteExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 121
    end
    object AAdjuntoFicha: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos Ficha'
      ImageIndex = 59
      OnExecute = AAdjuntoFichaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'PNLHistoricoReparaciones.Height')
    Left = 416
    Top = 0
  end
end
