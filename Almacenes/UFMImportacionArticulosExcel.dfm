inherited FMImportacionArticulosExcel: TFMImportacionArticulosExcel
  Left = 202
  Top = 133
  Width = 812
  Height = 605
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Articulos Importados'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 802
    Height = 552
    inherited TBMain: TLFToolBar
      Width = 798
      Height = 29
      ButtonHeight = 25
      inherited NavMain: THYMNavigator
        Width = 180
        Height = 25
        DataSource = DMImportacionArticulosExcel.DSArtImportados
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEArticulo
        InsertaUltimo = True
      end
      inherited TSepNav: TToolButton
        Left = 180
      end
      inherited EPMain: THYMEditPanel
        Left = 188
        Width = 60
        Height = 25
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 248
      end
      inherited TbuttComp: TToolButton
        Left = 256
        Caption = '-'
      end
      object ToolButton3: TToolButton
        Left = 279
        Top = 0
        Width = 8
        Style = tbsSeparator
        Visible = False
      end
      object TBPrincipal: TToolButton
        Left = 287
        Top = 0
        Action = APrincipal
      end
      object ToolButton5: TToolButton
        Left = 310
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LFActivos: TLFComboBox
        Left = 318
        Top = 2
        Width = 123
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'Solo principales'
        OnChange = LFActivosChange
        Items.Strings = (
          'Solo principales'
          'Todos')
      end
    end
    inherited PCMain: TLFPageControl
      Top = 31
      Width = 798
      Height = 519
      inherited TSFicha: TTabSheet
        object SBAArtRel: TSpeedButton [0]
          Left = 242
          Top = 8
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAArtRelDblClick
        end
        inherited PEdit: TLFPanel
          Width = 790
          Height = 257
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 26
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_ARTICULOS_IMPORTADOS'
            CampoNum = 'ID_ARTICULO'
            CampoStr = 'ARTICULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object LBLArticuloFicha: TLFLabel
            Left = 76
            Top = 3
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LBLNombreFicha: TLFLabel
            Left = 76
            Top = 24
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LBLFamilia: TLFLabel
            Left = 81
            Top = 47
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LBCtaDevC: TLFLabel
            Left = 31
            Top = 92
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor Delfos'
          end
          object LBCtaDevV: TLFLabel
            Left = 41
            Top = 114
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ref. Proveedor'
          end
          object LPrecioVenta1: TLFLabel
            Left = 210
            Top = 114
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta 1'
          end
          object LBLUnidades: TLFLabel
            Left = 21
            Top = 136
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Piezas/Uds.'
          end
          object LDescuento1: TLFLabel
            Left = 341
            Top = 114
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Comp.1'
          end
          object LPCompra1: TLFLabel
            Left = 636
            Top = 114
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Compra 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LPCoste1: TLFLabel
            Left = 498
            Top = 114
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste 1'
          end
          object LPrecioVenta2: TLFLabel
            Left = 210
            Top = 136
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta 2'
          end
          object LDescuento2: TLFLabel
            Left = 341
            Top = 136
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Comp.2'
          end
          object LPCompra2: TLFLabel
            Left = 636
            Top = 136
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Compra 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LPCoste2: TLFLabel
            Left = 498
            Top = 136
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste 2'
          end
          object LTarifa: TLFLabel
            Left = 86
            Top = 70
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LArtRelacionado: TLFLabel
            Left = 612
            Top = 3
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. Relacionado'
            Visible = False
          end
          object LFNotas: TLFLabel
            Left = 549
            Top = 3
            Width = 28
            Height = 13
            Caption = 'Notas'
          end
          object LEquivalencias: TLFLabel
            Left = 0
            Top = 244
            Width = 790
            Height = 13
            Align = alBottom
            Caption = 'EQUIVALENCIAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LAlfa1: TLFLabel
            Left = 86
            Top = 180
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alfa 1'
          end
          object LAlfa2: TLFLabel
            Left = 373
            Top = 180
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alfa 2'
          end
          object LAlfa3: TLFLabel
            Left = 86
            Top = 202
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alfa 3'
          end
          object LAlfa4: TLFLabel
            Left = 373
            Top = 202
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alfa 4'
          end
          object LAlfa5: TLFLabel
            Left = 86
            Top = 224
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alfa 5'
          end
          object LAlfa6: TLFLabel
            Left = 373
            Top = 224
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alfa 6'
          end
          object LCodigoBarra: TLFLabel
            Left = 339
            Top = 158
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Barra'
          end
          object LPVentaRecomendado: TLFLabel
            Left = 13
            Top = 158
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta Recomend.'
          end
          object DBEArticulo: TLFDbedit
            Left = 117
            Top = 0
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ARTICULO'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 0
            OnChange = DBEArticuloChange
            OnDblClick = SBAArtRelDblClick
          end
          object DBETitulo: TLFDbedit
            Left = 117
            Top = 22
            Width = 433
            Height = 21
            DataField = 'TITULO'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 1
          end
          object DBEFFamilia: TLFDBEditFind2000
            Left = 117
            Top = 44
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FAMILIA'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 2
            OnChange = DBEFFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_FAMILIAS                   '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitFamilias: TLFEdit
            Left = 177
            Top = 44
            Width = 373
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
          object DBEPVenta1: TLFDbedit
            Left = 264
            Top = 110
            Width = 75
            Height = 21
            DataField = 'PVENTA1'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 10
          end
          object DBEDescuento1: TLFDbedit
            Left = 404
            Top = 110
            Width = 75
            Height = 21
            DataField = 'DESCUENTO1'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 11
          end
          object DBEPCompra1: TLFDbedit
            Left = 698
            Top = 110
            Width = 75
            Height = 21
            DataField = 'PCOMPRA1'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 13
          end
          object DBEPCoste1: TLFDbedit
            Left = 551
            Top = 110
            Width = 75
            Height = 21
            DataField = 'PCOSTE1'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 12
          end
          object DBEPVenta2: TLFDbedit
            Left = 264
            Top = 132
            Width = 75
            Height = 21
            DataField = 'PVENTA2'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 15
          end
          object DBEDescuento2: TLFDbedit
            Left = 404
            Top = 132
            Width = 75
            Height = 21
            DataField = 'DESCUENTO2'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 16
          end
          object DBEPCompra2: TLFDbedit
            Left = 698
            Top = 132
            Width = 75
            Height = 21
            DataField = 'PCOMPRA2'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 18
          end
          object DBEPCoste2: TLFDbedit
            Left = 551
            Top = 132
            Width = 75
            Height = 21
            DataField = 'PCOSTE2'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 17
          end
          object DBERefProveedor: TLFDbedit
            Left = 117
            Top = 110
            Width = 75
            Height = 21
            DataField = 'REF_PROVEEDOR'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 9
          end
          object DBEPiezas: TLFDbedit
            Left = 117
            Top = 132
            Width = 75
            Height = 21
            DataField = 'PIEZAS'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 14
            OnChange = DBEPiezasChange
          end
          object DBEProveedor: TLFDbedit
            Left = 117
            Top = 88
            Width = 59
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 6
            OnChange = DBEProveedorChange
          end
          object EFTarifa: TLFDBEditFind2000
            Left = 117
            Top = 66
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TARIFA'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 4
            OnChange = EFTarifaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_TARIFAS_ARTICULO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFCBPrincipal: TLFDBCheckBox
            Left = 266
            Top = 1
            Width = 95
            Height = 17
            Caption = 'Principal'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            TabOrder = 27
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ART_PRINCIPAL'
            DataSource = DMImportacionArticulosExcel.DSxInfoPrincipal
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBArtRelacionado: TLFDbedit
            Left = 696
            Top = 0
            Width = 77
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_ART_ARTICULOS'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            ReadOnly = True
            TabOrder = 28
            Visible = False
            OnDblClick = SBAArtRelDblClick
          end
          object LFDBNotas: TLFDBMemo
            Left = 551
            Top = 22
            Width = 225
            Height = 87
            DataField = 'NOTAS'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            ScrollBars = ssVertical
            TabOrder = 8
          end
          object ETituloTarifa: TLFEdit
            Left = 177
            Top = 66
            Width = 373
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 5
          end
          object EDescProveedor: TLFEdit
            Left = 177
            Top = 88
            Width = 373
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBEAlfa1: TLFDbedit
            Left = 117
            Top = 176
            Width = 222
            Height = 21
            DataField = 'ALFA_1'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 21
          end
          object DBEAlfa2: TLFDbedit
            Left = 404
            Top = 176
            Width = 222
            Height = 21
            DataField = 'ALFA_2'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 22
          end
          object DBEAlfa3: TLFDbedit
            Left = 117
            Top = 198
            Width = 222
            Height = 21
            DataField = 'ALFA_3'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 23
          end
          object DBEAlfa4: TLFDbedit
            Left = 404
            Top = 198
            Width = 222
            Height = 21
            DataField = 'ALFA_4'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 24
          end
          object DBEAlfa5: TLFDbedit
            Left = 117
            Top = 220
            Width = 222
            Height = 21
            DataField = 'ALFA_5'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 25
          end
          object DBEAlfa6: TLFDbedit
            Left = 404
            Top = 220
            Width = 222
            Height = 21
            DataField = 'ALFA_6'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 26
          end
          object DBECodigoBarra: TLFDbedit
            Left = 404
            Top = 154
            Width = 222
            Height = 21
            DataField = 'EAN13'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 20
          end
          object DBEPVentaRecomendado: TLFDbedit
            Left = 117
            Top = 154
            Width = 75
            Height = 21
            DataField = 'P_VENTA_RECOMENDADO'
            DataSource = DMImportacionArticulosExcel.DSArtImportados
            TabOrder = 19
          end
        end
        object PNLEquivalentes: TLFPanel
          Left = 0
          Top = 257
          Width = 790
          Height = 234
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGEquivalencias: TDBGridFind2000
            Left = 0
            Top = 26
            Width = 790
            Height = 208
            Align = alClient
            DataSource = DMImportacionArticulosExcel.DSxEquivalencias
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PVENTA1'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PIEZAS'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PVENTA2'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PCOMPRA1'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO1'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PCOSTE1'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PCOMPRA2'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO2'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PCOSTE2'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROVEEDOR'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_PROVEEDOR'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REF_PROVEEDOR'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FAMILIA'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_IMPORTACION'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TARIFA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ART_PRINCIPAL'
                Visible = True
              end>
          end
          object TBEquivalentes: TLFToolBar
            Left = 0
            Top = 0
            Width = 790
            Height = 26
            Caption = 'TBEquivalentes'
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavEquivalentes: THYMNavigator
              Left = 0
              Top = 0
              Width = 100
              Height = 22
              DataSource = DMImportacionArticulosExcel.DSxEquivalencias
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton1: TToolButton
              Left = 100
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBPrincipalEq: TToolButton
              Left = 108
              Top = 0
              Action = APrincipalEq
              ParentShowHint = False
              ShowHint = True
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 790
          Height = 491
          DataSource = DMImportacionArticulosExcel.DSArtImportados
          ReadOnly = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVENTA1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PIEZAS'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PCOMPRA1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PCOSTE1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_PROVEEDOR'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REF_PROVEEDOR'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_IMPORTACION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ART_PRINCIPAL'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_1'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_2'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_3'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_4'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_5'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_6'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EAN13'
              Width = 100
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 552
    Width = 802
  end
  inherited CEMain: TControlEdit
    Left = 592
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 540
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 576
    Top = 40
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Proceso'
      Caption = 'Proceso'
      ImageIndex = 16
    end
    object AExcel: TAction
      Category = 'Proceso'
      Caption = 'Importar datos Excel'
      Hint = 'Importar datos Excel'
      ImageIndex = 25
      OnExecute = AExcelExecute
    end
    object AActualizar: TAction
      Category = 'Proceso'
      Caption = 'Actualizar articulos principales'
      Hint = 'Actualizar articulos principales'
      ImageIndex = 94
      OnExecute = AActualizarExecute
    end
    object AProcMasivoPral: TAction
      Category = 'Proceso'
      Caption = 'Asignaci'#243'n masiva a principal'
      Hint = 'Asignaci'#243'n masiva a principal'
      ImageIndex = 94
      OnExecute = AProcMasivoPralExecute
    end
    object AEliminarBDD: TAction
      Category = 'Proceso'
      Caption = 'Eliminar datos importaciones'
      Hint = 'Eliminar datos importaciones'
      ImageIndex = 27
      OnExecute = AEliminarBDDExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 496
    Top = 32
  end
  object ALImportados: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 664
    Top = 16
    object AArtRel: TAction
      Caption = 'Articulo'
      Hint = 'Abrir ficha de Art'#237'culo'
      OnExecute = AArtRelExecute
    end
    object APrincipal: TAction
      Caption = 'APrincipal'
      Hint = 'Asignar art'#237'culo como principal'
      ImageIndex = 25
      OnExecute = APrincipalExecute
    end
    object APrincipalEq: TAction
      Caption = 'APrincipalEq'
      Hint = 'Asignar art'#237'culo como principal'
      ImageIndex = 25
      OnExecute = APrincipalEqExecute
    end
  end
end
