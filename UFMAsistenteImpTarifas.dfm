object FMAsistenteImpTarifas: TFMAsistenteImpTarifas
  Left = 250
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asistente para Importar Tarifas'
  ClientHeight = 591
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PCMain: TLFPageControl
    Left = 129
    Top = 0
    Width = 730
    Height = 550
    ActivePage = TSAsociarColumnas
    Align = alClient
    OwnerDraw = True
    Style = tsFlatButtons
    TabOrder = 0
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSSeleccionArchivo: TTabSheet
      TabVisible = False
      OnShow = TSSeleccionArchivoShow
      DesignSize = (
        722
        540)
      object LBLSeleccionarArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 722
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecci'#243'n de Archivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBArchivo: TGroupBox
        Left = 8
        Top = 98
        Width = 704
        Height = 175
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Seleccione el archivo del que se importar'#225'n las tarifas: '
        TabOrder = 0
        DesignSize = (
          704
          175)
        object LInformacionHoja: TLFLabel
          Left = 60
          Top = 100
          Width = 96
          Height = 13
          Caption = 'Informacion Fichero:'
        end
        object EdArchivoImp: TLFEdit
          Left = 12
          Top = 48
          Width = 651
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = EdArchivoImpChange
        end
        object ButtSelArchivo: TButton
          Left = 670
          Top = 48
          Width = 23
          Height = 21
          Hint = 'Seleccionar el archivo con las tarifas a importar'
          Anchors = [akTop, akRight]
          Caption = '...'
          TabOrder = 1
          OnClick = ButtSelArchivoClick
        end
        object CBHojaAImportar: TLFComboBox
          Left = 12
          Top = 70
          Width = 663
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 2
          OnChange = CBHojaAImportarChange
        end
        object BInformacionHoja: TButton
          Left = 26
          Top = 96
          Width = 23
          Height = 21
          Hint = 'Informacion de hoja a importar'
          Caption = 'i'
          TabOrder = 3
        end
      end
    end
    object TSAsociarColumnas: TTabSheet
      ImageIndex = 1
      TabVisible = False
      OnShow = TSAsociarColumnasShow
      object LBLAsociarColumnas: TLFLabel
        Left = 0
        Top = 0
        Width = 722
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Asociar Columnas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBAsociarColumnas: TGroupBox
        Left = 0
        Top = 32
        Width = 722
        Height = 508
        Align = alClient
        Caption = ' Asociar los datos a importar con la aplicacion '
        TabOrder = 0
        object SGDatosImp: TStringGrid
          Left = 2
          Top = 15
          Width = 718
          Height = 305
          Align = alClient
          Color = clInfoBk
          ColCount = 7
          DefaultColWidth = 75
          DefaultRowHeight = 17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
          ParentFont = False
          TabOrder = 0
          OnDrawCell = SGDatosImpDrawCell
          RowHeights = (
            17
            17
            17
            17
            17)
        end
        object PNLAsosciarColumnas: TLFPanel
          Left = 2
          Top = 320
          Width = 718
          Height = 186
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object PNLArticulo: TLFPanel
            Left = 0
            Top = 25
            Width = 718
            Height = 121
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LPrecioCoste: TLFLabel
              Left = 212
              Top = 81
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Precio de Coste'
            end
            object LTipoArticulo: TLFLabel
              Left = 11
              Top = 1
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Tipo Art'#237'culo'
            end
            object LBLArticulos: TLFLabel
              Left = 11
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Art'#237'culo'
            end
            object LBLMargenes: TLFLabel
              Left = 111
              Top = 81
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Margen'
            end
            object LBLPrecio: TLFLabel
              Left = 11
              Top = 81
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Precio'
            end
            object LBTipoIva: TLFLabel
              Left = 512
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Tipo IVA'
            end
            object LBTitFamilia: TLFLabel
              Left = 411
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Titulo Familia'
            end
            object LBTituloArt: TLFLabel
              Left = 111
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Titulo Articulo'
            end
            object LFLFamilia: TLFLabel
              Left = 311
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Familia'
            end
            object LTituloCorto: TLFLabel
              Left = 212
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Titulo Corto'
            end
            object LNotas: TLFLabel
              Left = 512
              Top = 81
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Notas'
            end
            object LPrecioCompra: TLFLabel
              Left = 311
              Top = 81
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Precio de Compra'
            end
            object LDtoCompra: TLFLabel
              Left = 411
              Top = 81
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Dto. de Compra'
            end
            object LUnidadesMinimas: TLFLabel
              Left = 613
              Top = 41
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Unidades Minimas'
            end
            object LLUnidadesMaximas: TLFLabel
              Left = 613
              Top = 81
              Width = 95
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Unidades Maximas'
            end
            object CBArticulo: TLFComboBox
              Left = 11
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 1
            end
            object CBFamilia: TLFComboBox
              Left = 311
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 4
              OnChange = CBFamiliaChange
            end
            object CBMargen: TLFComboBox
              Left = 111
              Top = 96
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 9
            end
            object CBPrecio: TLFComboBox
              Left = 11
              Top = 96
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 8
            end
            object CBPrecioCoste: TLFComboBox
              Left = 212
              Top = 96
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 10
            end
            object CBTipoIva: TLFComboBox
              Left = 512
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 6
            end
            object CBTitArticulo: TLFComboBox
              Left = 111
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
            end
            object CBTitFamilia: TLFComboBox
              Left = 411
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 5
            end
            object CBTitCorto: TLFComboBox
              Left = 212
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 3
            end
            object CBNotas: TLFComboBox
              Left = 512
              Top = 96
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 13
            end
            object CBPrecioCompra: TLFComboBox
              Left = 311
              Top = 96
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 11
            end
            object CBDtoCompra: TLFComboBox
              Left = 411
              Top = 96
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 12
            end
            object CBUnidadesMinimas: TLFComboBox
              Left = 613
              Top = 56
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 7
            end
            object CBUnidadesMaximas: TLFComboBox
              Left = 613
              Top = 96
              Width = 95
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 14
            end
            object LFCBTArticulo: TLFComboBox
              Left = 11
              Top = 17
              Width = 95
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Text = 'Varios'
              OnChange = LFCBTArticuloChange
            end
          end
          object PNLToldosYCortinas: TLFPanel
            Left = 0
            Top = 146
            Width = 718
            Height = 40
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LFPanelLona: TLFPanel
              Left = 510
              Top = 0
              Width = 208
              Height = 40
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              Visible = False
              object LBLConfeccionLona: TLFLabel
                Left = 103
                Top = 1
                Width = 95
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Confecci'#243'n Lona'
              end
              object LBLTipoLona: TLFLabel
                Left = 2
                Top = 1
                Width = 95
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Tipo Lona'
              end
              object CBConfeccionLona: TLFComboBox
                Left = 103
                Top = 16
                Width = 95
                Height = 21
                ItemHeight = 13
                TabOrder = 1
              end
              object CBTipoLona: TLFComboBox
                Left = 2
                Top = 16
                Width = 95
                Height = 21
                ItemHeight = 13
                TabOrder = 0
              end
            end
            object LFPanelComponente: TLFPanel
              Left = 0
              Top = 0
              Width = 510
              Height = 40
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              Visible = False
              object LBLTipoLacado: TLFLabel
                Left = 315
                Top = 1
                Width = 95
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Tipo Lacado'
              end
              object LBLCorte: TLFLabel
                Left = 212
                Top = 1
                Width = 95
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Corte'
              end
              object LBLForma: TLFLabel
                Left = 111
                Top = 1
                Width = 95
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Forma'
              end
              object LBLlacado: TLFLabel
                Left = 11
                Top = 1
                Width = 95
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Lacado'
              end
              object LBLModelo: TLFLabel
                Left = 411
                Top = 1
                Width = 95
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Modelo'
              end
              object CBTipoLacado: TLFComboBox
                Left = 311
                Top = 16
                Width = 95
                Height = 21
                ItemHeight = 13
                TabOrder = 3
              end
              object CBModelo: TLFComboBox
                Left = 411
                Top = 16
                Width = 95
                Height = 21
                ItemHeight = 13
                TabOrder = 4
              end
              object CBLacado: TLFComboBox
                Left = 11
                Top = 16
                Width = 95
                Height = 21
                ItemHeight = 13
                TabOrder = 0
              end
              object CBForma: TLFComboBox
                Left = 111
                Top = 16
                Width = 95
                Height = 21
                ItemHeight = 13
                TabOrder = 1
              end
              object CBCorte: TLFComboBox
                Left = 212
                Top = 16
                Width = 95
                Height = 21
                ItemHeight = 13
                TabOrder = 2
              end
            end
          end
          object PNLTitulos: TLFPanel
            Left = 0
            Top = 0
            Width = 718
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object LSeparadorDecimal: TLFLabel
              Left = 248
              Top = 6
              Width = 90
              Height = 13
              Caption = 'Separador Decimal'
            end
            object LFCBPrimeraFilaTitulos: TLFCheckBox
              Left = 4
              Top = 4
              Width = 200
              Height = 17
              Caption = 'Primera Fila contiene Titulos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = LFCBPrimeraFilaTitulosChange
            end
            object ESeparadorDecimal: TLFEdit
              Left = 344
              Top = 1
              Width = 49
              Height = 21
              TabOrder = 1
              OnChange = ESeparadorDecimalChange
            end
          end
        end
      end
    end
    object TSSeleccionarTarifa: TTabSheet
      ImageIndex = 2
      TabVisible = False
      object LBLSeleccionarTarifa: TLFLabel
        Left = 0
        Top = 0
        Width = 722
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecci'#243'n de Tarifa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBSeleccionTarifa: TGroupBox
        Left = 0
        Top = 32
        Width = 722
        Height = 508
        Align = alClient
        Caption = ' Seleccione una tarifa '
        TabOrder = 0
        DesignSize = (
          722
          508)
        object RBTarifaExistente: TRadioButton
          Left = 40
          Top = 27
          Width = 69
          Height = 17
          Caption = 'Existente'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RBTarifaExistenteClick
        end
        object RBTarifaNueva: TRadioButton
          Left = 40
          Top = 155
          Width = 81
          Height = 17
          Caption = 'Nueva'
          TabOrder = 1
          OnClick = RBTarifaNuevaClick
        end
        object PTarifaExistente: TLFPanel
          Left = 171
          Top = 46
          Width = 540
          Height = 81
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 2
          object LBLTarifaEx: TLFLabel
            Left = 78
            Top = 12
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LBLTipoCalculoEx: TLFLabel
            Left = 31
            Top = 33
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de C'#225'lculo'
          end
          object EFTarifaEx: TLFEditFind2000
            Left = 110
            Top = 8
            Width = 49
            Height = 21
            TabOrder = 0
            OnChange = EFTarifaExChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVA=1'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloTarifaEx: TLFEdit
            Left = 160
            Top = 8
            Width = 265
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBETituloTipoCalculo: TLFEdit
            Left = 160
            Top = 30
            Width = 265
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object EFTipoCalculoEx: TLFEditFind2000
            Left = 110
            Top = 30
            Width = 49
            Height = 21
            TabOrder = 2
            OnChange = EFTipoCalculoExChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CALCULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_TARIFAS_CALCULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFTipoCalculoExBusqueda
            OrdenadoPor.Strings = (
              'CALCULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object CHKPrecioBloqueadoEx: TLFCheckBox
            Left = 110
            Top = 56
            Width = 163
            Height = 17
            Caption = 'Actualizar precios bloqueados'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
        end
        object PTarifaNueva: TLFPanel
          Left = 171
          Top = 172
          Width = 540
          Height = 115
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 3
          object LBLNombreNu: TLFLabel
            Left = 68
            Top = 28
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LBLTipoCalculoNu: TLFLabel
            Left = 31
            Top = 72
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de C'#225'lculo'
          end
          object LBLMonedaNu: TLFLabel
            Left = 66
            Top = 49
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLTarifaNu: TLFLabel
            Left = 78
            Top = 6
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object EFMonedaNu: TLFEditFind2000
            Left = 110
            Top = 46
            Width = 49
            Height = 21
            TabOrder = 2
            OnChange = EFMonedaNuChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
          end
          object DBETituloMonedaNu: TLFEdit
            Left = 160
            Top = 46
            Width = 265
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBETituloTipoCalculoNu: TLFEdit
            Left = 160
            Top = 68
            Width = 265
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object EFTipoCalculoNu: TLFEditFind2000
            Left = 110
            Top = 68
            Width = 49
            Height = 21
            TabOrder = 4
            OnChange = EFTipoCalculoNuChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CALCULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_TARIFAS_CALCULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CALCULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object CHKIVAIncluidoNu: TLFCheckBox
            Left = 110
            Top = 93
            Width = 121
            Height = 17
            Caption = 'IVA Incluido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
          end
          object EdNombreNu: TLFEdit
            Left = 110
            Top = 24
            Width = 315
            Height = 21
            TabOrder = 1
          end
          object EdTarifaNu: TLFEdit
            Left = 110
            Top = 2
            Width = 49
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 3
            TabOrder = 0
          end
        end
      end
    end
    object TSSeleccionarDatos: TTabSheet
      TabVisible = False
      object LBLSeleccionarDatos: TLFLabel
        Left = 0
        Top = 0
        Width = 238
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Seleccionar Datos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBSeleccionarTarifasImp: TGroupBox
        Left = 0
        Top = 32
        Width = 722
        Height = 508
        Align = alClient
        Caption = ' Seleccione las tarifas a importar '
        TabOrder = 0
        object DBGTarifasImp: TDBGridFind2000
          Left = 2
          Top = 37
          Width = 718
          Height = 469
          Align = alClient
          DataSource = DMAsistenteImpTarifas.DSQMTarifasImp
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
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposNoAccesibles.Strings = (
            'ARTICULO'
            'MARGEN'
            'PRECIO')
          ColumnasCheckBoxes.Strings = (
            'IMPORTAR')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 82
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 204
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_CORTO'
              ReadOnly = True
              Width = 110
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FAMILIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 38
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MARGEN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTAR'
              Width = 21
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Visible = True
            end>
        end
        object TBSeleccionarDatos: TLFToolBar
          Left = 2
          Top = 15
          Width = 718
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object TButtSelTodas: TToolButton
            Left = 0
            Top = 0
            Hint = 'Importar todas las tarifas'
            Caption = 'Seleccionar Todas'
            ImageIndex = 19
            OnClick = TButtSelTodasClick
          end
          object TButtQuitarSel: TToolButton
            Left = 23
            Top = 0
            Hint = 'No importar ninguna tarifa'
            Caption = 'Quitar Seleccion'
            ImageIndex = 27
            OnClick = TButtQuitarSelClick
          end
        end
      end
    end
    object TSImportar: TTabSheet
      ImageIndex = 3
      TabVisible = False
      object LBLImportarTarifas: TLFLabel
        Left = 0
        Top = 0
        Width = 722
        Height = 32
        Hint = 'LBLImportar'
        Align = alTop
        Alignment = taCenter
        Caption = 'Importar tarifas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBInfo: TGroupBox
        Left = 0
        Top = 181
        Width = 722
        Height = 359
        Align = alClient
        Caption = ' Informaci'#243'n del proceso '
        TabOrder = 0
        object MEMInfoProc: TLFMemo
          Left = 2
          Top = 15
          Width = 718
          Height = 342
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object PNLImportar: TLFPanel
        Left = 0
        Top = 32
        Width = 722
        Height = 149
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          722
          149)
        object MEMInfo: TLFMemo
          Left = 0
          Top = 0
          Width = 722
          Height = 113
          Align = alTop
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            
              '[] Ha rellenado correctamente todos los par'#225'metros necesarios pa' +
              'ra la creaci'#243'n de una nuevo '
            'ejercicio.'
            ''
            
              '[] Si desea modificar alguno, acceda a la pesta'#241'a correspondient' +
              'e para su modificaci'#243'n.'
            ''
            
              '[] Si por el contrario los datos son correctos, pulse el siguien' +
              'te bot'#243'n para comenzar el proceso.')
          ParentFont = False
          TabOrder = 0
        end
        object ButtCrear: TButton
          Left = 320
          Top = 115
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Crear'
          TabOrder = 1
          OnClick = ButtCrearClick
        end
      end
    end
  end
  object TVMain: TTreeView
    Left = 0
    Top = 0
    Width = 129
    Height = 550
    Align = alLeft
    AutoExpand = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HideSelection = False
    Indent = 19
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    ShowRoot = False
    TabOrder = 1
    OnChange = TVMainChange
    OnCollapsed = TVMainCollapsed
    Items.Data = {
      01000000290000000000000000000000FFFFFFFFFFFFFFFF0000000005000000
      10496D706F7274617220546172696661732C0000000000000000000000FFFFFF
      FFFFFFFFFF00000000000000001353656C656363696F6E617220617263686976
      6F290000000000000000000000FFFFFFFFFFFFFFFF0000000000000000104173
      6F6369617220636F6C756D6E61732B0000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000001253656C656363696F6E6172207461726966612A0000
      000000000000000000FFFFFFFFFFFFFFFF00000000000000001153656C656363
      696F6E6172206461746F73210000000000000000000000FFFFFFFFFFFFFFFF00
      0000000000000008496D706F72746172}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 550
    Width = 859
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object ButtNext: TButton
      Left = 638
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 0
      OnClick = ButtNextClick
    end
    object ButtAnt: TButton
      Left = 470
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 1
      OnClick = ButtAntClick
    end
    object ButtCancel: TButton
      Left = 28
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtCancelClick
    end
    object ButtCerrar: TButton
      Left = 638
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 3
      Visible = False
      OnClick = ButtCerrarClick
    end
  end
end
