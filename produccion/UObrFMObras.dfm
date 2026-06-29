inherited ObrFMObras: TObrFMObras
  Left = 375
  Top = 234
  Width = 851
  Height = 623
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Gesti'#243'n de control de costes de obras'
  PopupMenu = CECostAlbProvPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 841
    Height = 570
    inherited TBMain: TLFToolBar
      Width = 837
      inherited NavMain: THYMNavigator
        DataSource = ObrDMObras.DSCabObras
        Hints.Strings = ()
        EditaControl = LFDBFechaIni
        InsertaControl = LFDBFechaIni
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object TBArbol: TToolButton
        Left = 319
        Top = 0
        Hint = 'Refresco del '#225'rbol'
        Caption = 'TBArbol'
        ImageIndex = 137
        OnClick = TBArbolClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 837
      Height = 540
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 829
          Height = 161
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 11
            Top = 13
            DataSource = ObrDMObras.DSCabObras
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'OBR_CAB_OBRAS'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION_OBRA'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LObra: TLFLabel
            Left = 51
            Top = 18
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Obra'
          end
          object LDescripcion: TLFLabel
            Left = 18
            Top = 41
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LCliente: TLFLabel
            Left = 42
            Top = 62
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LDireccion: TLFLabel
            Left = 29
            Top = 84
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LFechaInicio: TLFLabel
            Left = 151
            Top = 18
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inicio'
          end
          object LFechaPrevCierre: TLFLabel
            Left = 324
            Top = 18
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Prev. Cierre'
          end
          object LFechaCierre: TLFLabel
            Left = 526
            Top = 18
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cierre'
          end
          object LFEchaUltimaImp: TLFLabel
            Left = 553
            Top = 131
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha '#218'lt. Imp.:'
          end
          object LControlPartida: TLFLabel
            Left = 0
            Top = 107
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Control Partidas'
          end
          object LFDBObra: TLFDbedit
            Left = 77
            Top = 15
            Width = 67
            Height = 21
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = ObrDMObras.DSCabObras
            ReadOnly = True
            TabOrder = 0
          end
          object LFDBDescrip: TLFDbedit
            Left = 77
            Top = 37
            Width = 517
            Height = 21
            DataField = 'DESCRIPCION_OBRA'
            DataSource = ObrDMObras.DSCabObras
            TabOrder = 5
          end
          object LFDBCliente: TLFDBEditFind2000
            Left = 77
            Top = 59
            Width = 54
            Height = 21
            DataField = 'CLIENTE'
            DataSource = ObrDMObras.DSCabObras
            TabOrder = 6
            OnChange = LFDBClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescCliente: TLFHYDBDescription
            Left = 132
            Top = 59
            Width = 300
            Height = 21
            Color = clInfoBk
            DataSource = ObrDMObras.DSCabObras
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
            Campo_Descripcion = 'NOMBRE_COMERCIAL'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CLIENTE'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'CLIENTE'
              'EMPRESA')
          end
          object LFDBDireccion: TLFDBEditFind2000
            Left = 77
            Top = 81
            Width = 54
            Height = 21
            DataField = 'DIRECCION'
            DataSource = ObrDMObras.DSCabObras
            TabOrder = 8
            OnChange = LFDBDireccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = LFDBDireccionBusqueda
            Filtros = []
          end
          object DescDireccion: TLFHYDBDescription
            Left = 132
            Top = 81
            Width = 300
            Height = 21
            Color = clInfoBk
            DataSource = ObrDMObras.DSCabObras
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'DIRECCION'
              'TERCERO')
            CamposWhereTabla.Strings = (
              'DIRECCION'
              'TERCERO')
          end
          object LFDBFechaIni: TLFDBDateEdit
            Left = 214
            Top = 15
            Width = 100
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = ObrDMObras.DSCabObras
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object LFDBFechaPrevCierre: TLFDBDateEdit
            Left = 416
            Top = 15
            Width = 100
            Height = 21
            DataField = 'FECHA_PREVISTA_CIERRE'
            DataSource = ObrDMObras.DSCabObras
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object LFDBFechaCierre: TLFDBDateEdit
            Left = 591
            Top = 15
            Width = 100
            Height = 21
            DataField = 'FECHA_CIERRE'
            DataSource = ObrDMObras.DSCabObras
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object LFCBEstado: TLFDBCheckBox
            Left = 699
            Top = 18
            Width = 51
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = ObrDMObras.DSCabObras
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBFechaUltImp: TLFDBDateEdit
            Left = 631
            Top = 126
            Width = 100
            Height = 21
            DataField = 'FECHA_ULTIMA_IMPUTACION'
            DataSource = ObrDMObras.DSCabObras
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
          end
          object LFCBContAlmacen: TLFDBCheckBox
            Left = 76
            Top = 127
            Width = 102
            Height = 17
            Caption = 'Controla Almac'#233'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            OnChange = LFCBContAlmacenChange
            DataField = 'CONTROL_ALMACEN'
            DataSource = ObrDMObras.DSCabObras
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBAlmacen: TLFDBEditFind2000
            Left = 181
            Top = 125
            Width = 54
            Height = 21
            DataField = 'ALMACEN'
            DataSource = ObrDMObras.DSCabObras
            TabOrder = 12
            OnChange = LFDBAlmacenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescAlmacen: TLFHYDBDescription
            Left = 236
            Top = 125
            Width = 300
            Height = 21
            Color = clInfoBk
            DataSource = ObrDMObras.DSCabObras
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            Tabla_a_buscar = 'VER_ALMACENES'
            Campo_Descripcion = 'AL_TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'ALMACEN'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'ALMACEN'
              'EMPRESA')
          end
          object DBCBControlPartidas: TDBComboBoxValue
            Left = 77
            Top = 103
            Width = 120
            Height = 21
            Style = csDropDownList
            DataField = 'CONTROL_PARTIDAS'
            DataSource = ObrDMObras.DSCabObras
            Enabled = False
            ItemHeight = 13
            Items.Strings = (
              'Por Partidas'
              'Por Imputaci'#243'n')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 10
          end
        end
        object PCCostes: TLFPageControl
          Left = 0
          Top = 161
          Width = 829
          Height = 351
          ActivePage = TScostes
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          OnChange = PCCostesChange
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TScostes: TTabSheet
            Caption = 'Costes'
            object PNLCostes: TLFPanel
              Left = 0
              Top = 0
              Width = 821
              Height = 323
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LCostePrevisto: TLFLabel
                Left = 31
                Top = 56
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Previsto'
              end
              object LMargenPrevisto: TLFLabel
                Left = 22
                Top = 79
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen Previsto'
              end
              object LCosteMaterial: TLFLabel
                Left = 209
                Top = 56
                Width = 75
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Fab. Mat.'
              end
              object LCosteHoras: TLFLabel
                Left = 202
                Top = 79
                Width = 82
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Fab. Horas'
              end
              object LCosteTarea: TLFLabel
                Left = 197
                Top = 101
                Width = 87
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Fab. Tareas'
              end
              object LCosteFabricacion: TLFLabel
                Left = 381
                Top = 56
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Fabricaci'#243'n'
              end
              object LCosteAlbaran: TLFLabel
                Left = 389
                Top = 79
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Albaranes'
              end
              object LCosteAlbaranProv: TLFLabel
                Left = 390
                Top = 101
                Width = 76
                Height = 13
                Alignment = taRightJustify
                Caption = 'Coste Alb. Prov.'
              end
              object LTotalCostes: TLFLabel
                Left = 407
                Top = 124
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Costes'
              end
              object LTotalOIferta: TLFLabel
                Left = 600
                Top = 56
                Width = 56
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Oferta'
              end
              object LPendienteFacturar: TLFLabel
                Left = 562
                Top = 124
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Pdte. Facturar'
              end
              object LTotalFacturado: TLFLabel
                Left = 581
                Top = 101
                Width = 75
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Facturado'
              end
              object LMargenBeneficion: TLFLabel
                Left = 573
                Top = 79
                Width = 83
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen Beneficio'
              end
              object LMargenPrevistoPorc: TLFLabel
                Left = 11
                Top = 101
                Width = 88
                Height = 13
                Alignment = taRightJustify
                Caption = 'Margen Previsto %'
              end
              object LFDBCostAlb: TLFDbedit
                Left = 472
                Top = 76
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COSTES_ALB'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 2
              end
              object LFDBCostPrev: TLFDbedit
                Left = 104
                Top = 54
                Width = 84
                Height = 21
                DataField = 'COSTE_PREV'
                DataSource = ObrDMObras.DSCabObras
                TabOrder = 0
              end
              object LFDBMargenPrev: TLFDbedit
                Left = 104
                Top = 76
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'MARGEN_PREV'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 3
              end
              object LFDBCostMat: TLFDbedit
                Left = 288
                Top = 54
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COSTES_MAT'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 4
              end
              object LFDBCostHoras: TLFDbedit
                Left = 288
                Top = 76
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COSTES_HORAS'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 5
              end
              object LFDBCostTarea: TLFDbedit
                Left = 288
                Top = 98
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COSTES_TAREAS'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 6
              end
              object LFDBCostFab: TLFDbedit
                Left = 472
                Top = 54
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COSTES_FAB'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 7
              end
              object LFDBCostAlbProv: TLFDbedit
                Left = 472
                Top = 98
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COSTES_ALB_PROV'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 8
              end
              object LFDBTotCostes: TLFDbedit
                Left = 472
                Top = 120
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_COSTES'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 9
              end
              object LFDBTotalOferta: TLFDbedit
                Left = 664
                Top = 54
                Width = 84
                Height = 21
                DataField = 'TOTAL_OFERTA_PRES_PED'
                DataSource = ObrDMObras.DSCabObras
                TabOrder = 1
              end
              object LFDBMargen: TLFDbedit
                Left = 664
                Top = 76
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'MARGEN_BENEFICIO'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 10
              end
              object LFDBTotFacturado: TLFDbedit
                Left = 664
                Top = 98
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_FACTURADO'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 11
              end
              object LFDBTotPdteFac: TLFDbedit
                Left = 664
                Top = 120
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL_PDTE_FACTURAR'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 12
              end
              object LFDBMargenPrev100: TLFDbedit
                Left = 104
                Top = 98
                Width = 84
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'MARGEN_BENEFICIO_PREV_100'
                DataSource = ObrDMObras.DSCabObras
                ReadOnly = True
                TabOrder = 13
              end
            end
          end
          object TSArbol: TTabSheet
            Caption = #193'rbol'
            ImageIndex = 1
            object Arbol: TTreeView
              Left = 0
              Top = 0
              Width = 821
              Height = 323
              Align = alClient
              AutoExpand = True
              BevelInner = bvNone
              BevelOuter = bvNone
              Color = clInfoBk
              Indent = 19
              TabOrder = 0
            end
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = -1
        object PNLNotas: TLFPanel
          Left = 0
          Top = 21
          Width = 829
          Height = 491
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LFDBNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 829
            Height = 491
            Align = alClient
            DataField = 'NOTAS'
            DataSource = ObrDMObras.DSCabObras
            TabOrder = 0
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 829
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object LFDBObraNotas: TLFDbedit
            Left = 0
            Top = 0
            Width = 67
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = ObrDMObras.DSCabObras
            ReadOnly = True
            TabOrder = 1
          end
          object LFDBDescNotas: TLFDbedit
            Left = 67
            Top = 0
            Width = 330
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION_OBRA'
            DataSource = ObrDMObras.DSCabObras
            ReadOnly = True
            TabOrder = 2
          end
          object ToolButton1: TToolButton
            Left = 397
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 405
            Top = 0
            Width = 80
            Height = 21
            DataSource = ObrDMObras.DSCabObras
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = LFDBNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSDibujo: TTabSheet [2]
        Caption = '&Im'#225'genes'
        ImageIndex = 3
        object PNLImagen: TLFPanel
          Left = 0
          Top = 21
          Width = 829
          Height = 491
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Imagen: TImage
            Left = 376
            Top = 0
            Width = 453
            Height = 491
            Align = alClient
            Stretch = True
          end
          object DBGImagenes: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 376
            Height = 491
            Align = alLeft
            DataSource = ObrDMObras.DSImagenObras
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
            Campos.Strings = (
              'ID_IMAGEN')
            CamposAMostrar.Strings = (
              'ID_IMAGEN'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            Numericos.Strings = (
              'CODIGO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_IMAGENES')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'NOMBRE')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              '')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_IMAGEN'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Nombre'
                ReadOnly = True
                Width = 266
                Visible = True
              end>
          end
        end
        object TBDibujo: TLFToolBar
          Left = 0
          Top = 0
          Width = 829
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object LFDBObraImagen: TLFDbedit
            Left = 0
            Top = 0
            Width = 67
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = ObrDMObras.DSCabObras
            ReadOnly = True
            TabOrder = 2
          end
          object LFDBDescImagen: TLFDbedit
            Left = 67
            Top = 0
            Width = 330
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION_OBRA'
            DataSource = ObrDMObras.DSCabObras
            ReadOnly = True
            TabOrder = 1
          end
          object ToolButton2: TToolButton
            Left = 397
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavDibujo: THYMNavigator
            Left = 405
            Top = 0
            Width = 200
            Height = 21
            DataSource = ObrDMObras.DSImagenObras
            Flat = True
            ParentShowHint = False
            PopupMenu = CEImagenPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGImagenes
            InsertaControl = DBGImagenes
            Exclusivo = True
            ControlEdit = CEImagen
            OrdenAscendente = True
            InsertaUltimo = True
          end
        end
      end
      object TSDetObra: TTabSheet [3]
        Caption = '&Detalle Obra'
        object LFPanelDetPartida: TLFPanel
          Left = 0
          Top = 0
          Width = 829
          Height = 201
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PCDetallePartida: TLFPageControl
            Left = 0
            Top = 0
            Width = 829
            Height = 201
            ActivePage = TSPartida
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSPartida: TTabSheet
              Caption = 'Partida'
              object TBPartida: TLFToolBar
                Left = 0
                Top = 0
                Width = 821
                Height = 21
                AutoSize = True
                ButtonHeight = 21
                EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object NavPartidas: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 21
                  DataSource = ObrDMObras.DSDetObras
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEPartidasPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGPartida
                  InsertaControl = DBGPartida
                  Exclusivo = True
                  ControlEdit = CEPartidas
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
                object ToolButton3: TToolButton
                  Left = 200
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object LFDBInfoPartida: TLFDbedit
                  Left = 208
                  Top = 0
                  Width = 67
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'CODIGO'
                  DataSource = ObrDMObras.DSCabObras
                  ReadOnly = True
                  TabOrder = 1
                end
                object LFDBInfoDescPartida: TLFDbedit
                  Left = 275
                  Top = 0
                  Width = 330
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'DESCRIPCION_OBRA'
                  DataSource = ObrDMObras.DSCabObras
                  ReadOnly = True
                  TabOrder = 2
                end
              end
              object PNLPartidas: TLFPanel
                Left = 0
                Top = 21
                Width = 821
                Height = 152
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBGPartida: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 821
                  Height = 152
                  Align = alClient
                  DataSource = ObrDMObras.DSDetObras
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  Insercion = False
                  ColumnaInicial = 2
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
                  Campos.Strings = (
                    'PARTIDA')
                  CamposAMostrar.Strings = (
                    'PARTIDA'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '0')
                  CamposADevolver.Strings = (
                    '')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CamposNoAccesibles.Strings = (
                    '')
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'PARTIDA')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'OBR_SYS_PARTIDA')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'DESCRIPCION')
                  Posicion = tpCentrado
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    '')
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA'
                      ReadOnly = True
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ORDEN'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PARTIDA'
                      Width = 39
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCRIPCION'
                      Width = 250
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TOTAL_OFERTA_PRES_PED'
                      Width = 75
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTES'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'MARGEN_BENEFICIO'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COSTE_PREV'
                      Width = 75
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'MARGEN_PREV'
                      ReadOnly = True
                      Width = 75
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_FACTURADO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_PDTE_FACTURAR'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_ALB'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_ALB_PROV'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_VARIOS'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_MO_OF'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_MAT_OF'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_MAQ_OF'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_TEXT_OF'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_VARIOS_OF'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_FIJO_OF'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL_COSTE_FAB'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end>
                end
              end
            end
            object TSNotasPartida: TTabSheet
              Caption = 'Notas'
              ImageIndex = 1
              object TBNotasPartida: TLFToolBar
                Left = 0
                Top = 0
                Width = 821
                Height = 26
                ButtonHeight = 21
                EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object LFDBInfoNotasPartida: TLFDbedit
                  Left = 0
                  Top = 0
                  Width = 67
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'CODIGO'
                  DataSource = ObrDMObras.DSCabObras
                  ReadOnly = True
                  TabOrder = 1
                end
                object LFDBInfoPartidaDesc: TLFDbedit
                  Left = 67
                  Top = 0
                  Width = 330
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  DataField = 'DESCRIPCION_OBRA'
                  DataSource = ObrDMObras.DSCabObras
                  ReadOnly = True
                  TabOrder = 2
                end
                object ToolButton4: TToolButton
                  Left = 397
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object NavPartidaNotas: THYMNavigator
                  Left = 405
                  Top = 0
                  Width = 80
                  Height = 21
                  DataSource = ObrDMObras.DSDetObras
                  VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CENotasPartidaPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = LFDbNotasPartidas
                  Exclusivo = True
                  ControlEdit = CENotasPartida
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
              object PNLNotasPartida: TLFPanel
                Left = 0
                Top = 26
                Width = 821
                Height = 147
                Align = alClient
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 1
                object LFDbNotasPartidas: TLFDBMemo
                  Left = 0
                  Top = 0
                  Width = 821
                  Height = 147
                  Align = alClient
                  DataField = 'COMENTARIO'
                  DataSource = ObrDMObras.DSDetObras
                  TabOrder = 0
                end
              end
            end
          end
        end
        object PNLDetalle: TLFPanel
          Left = 0
          Top = 201
          Width = 829
          Height = 311
          Align = alClient
          TabOrder = 1
          object PCSubDetalle: TLFPageControl
            Left = 1
            Top = 1
            Width = 827
            Height = 309
            ActivePage = TSDetIngre
            Align = alClient
            OwnerDraw = True
            TabIndex = 4
            TabOrder = 0
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSDetCostAlbCli: TTabSheet
              Caption = 'Costes Albaranes Clientes'
              object TBCostaAlbCli: TLFToolBar
                Left = 0
                Top = 0
                Width = 819
                Height = 22
                AutoSize = True
                EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object NavCostaAlbCli: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ObrDMObras.DSDetCostAlbCli
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CECostAlbCliPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGCostAlbCli
                  InsertaControl = DBGCostAlbCli
                  Exclusivo = True
                  ControlEdit = CECostAlbCli
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
              object PNLCostAlbCli: TLFPanel
                Left = 0
                Top = 22
                Width = 819
                Height = 259
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBGCostAlbCli: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 819
                  Height = 259
                  Align = alClient
                  DataSource = ObrDMObras.DSDetCostAlbCli
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = DBGCostAlbCliDblClick
                  Insercion = False
                  ColumnaInicial = 1
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
                  Campos.Strings = (
                    'RIG'
                    'SERIE')
                  CamposAMostrar.Strings = (
                    'RIG'
                    '0'
                    'SERIE'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '0'
                    '0')
                  CamposADevolver.Strings = (
                    ''
                    '')
                  CamposDesplegar.Strings = (
                    '1'
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'RIG'
                    'SERIE')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'VER_CABECERAS_ALBARAN'
                    'VER_CANALES_SERIES')
                  Acciones.Strings = (
                    ''
                    '')
                  Titulos.Strings = (
                    'TITULO'
                    'TITULO')
                  Posicion = tpCentrado
                  OnBusqueda = DBGCostAlbCliBusqueda
                  Planes.Strings = (
                    ''
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    ''
                    '')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA_DET'
                      ReadOnly = True
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SERIE'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'RIG'
                      Width = 60
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'FECHA'
                      ReadOnly = True
                      Width = 80
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_IMPUTADO'
                      ReadOnly = True
                      Visible = True
                    end>
                end
              end
            end
            object TSDetCostProd: TTabSheet
              Caption = 'Costes Producci'#243'n'
              ImageIndex = 1
              object TBCostProd: TLFToolBar
                Left = 0
                Top = 0
                Width = 819
                Height = 22
                AutoSize = True
                EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object NavCostProd: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ObrDMObras.DSDetCostProd
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CECostesProdPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGCostProd
                  InsertaControl = DBGCostProd
                  Exclusivo = True
                  ControlEdit = CECostesProd
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
              object PNLCostProd: TLFPanel
                Left = 0
                Top = 22
                Width = 819
                Height = 259
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBGCostProd: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 819
                  Height = 259
                  Align = alClient
                  DataSource = ObrDMObras.DSDetCostProd
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = DBGCostProdDblClick
                  Insercion = False
                  ColumnaInicial = 1
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
                  Campos.Strings = (
                    'RIG')
                  CamposAMostrar.Strings = (
                    'RIG'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '0')
                  CamposADevolver.Strings = (
                    '')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'RIG_OF')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'PRO_ORD')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'COMPUESTO')
                  Posicion = tpCentrado
                  OnBusqueda = DBGCostProdBusqueda
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    '')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA_DET'
                      ReadOnly = True
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'RIG'
                      Width = 60
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FECHA'
                      Width = 80
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_MO_IMPUTADO'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_MAT_IMPUTADO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_FIJO_IMPUTADO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_VARIOS_IMPUTADO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_MAQ_IMPUTADO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_TEXT_IMPUTADO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end>
                end
              end
            end
            object TSDetCostVar: TTabSheet
              Caption = 'Costes Varios'
              ImageIndex = 119
              object TBCostesVarios: TLFToolBar
                Left = 0
                Top = 0
                Width = 819
                Height = 22
                AutoSize = True
                EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object NavCostesVarios: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ObrDMObras.DSDetCostVar
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CECostVariosPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGCostVarios
                  InsertaControl = DBGCostVarios
                  Exclusivo = True
                  ControlEdit = CECostVarios
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
              object PNLCostVar: TLFPanel
                Left = 0
                Top = 22
                Width = 819
                Height = 259
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBGCostVarios: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 819
                  Height = 259
                  Align = alClient
                  DataSource = ObrDMObras.DSDetCostVar
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  Insercion = False
                  ColumnaInicial = 1
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
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA_DET'
                      ReadOnly = True
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COMENTARIO'
                      Width = 200
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FECHA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'IMPORTE_IMPUTADO'
                      Width = 64
                      Visible = True
                    end>
                end
              end
            end
            object TSDetCostAlbProv: TTabSheet
              Caption = 'Costes Albaranes Proveedores'
              object TBCostProv: TLFToolBar
                Left = 0
                Top = 0
                Width = 819
                Height = 22
                AutoSize = True
                EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object NavCostProv: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ObrDMObras.DSDetostAlbProv
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CECostAlbProvPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGCostAlbaranProv
                  InsertaControl = DBGCostAlbaranProv
                  Exclusivo = True
                  ControlEdit = CECostAlbProv
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
              object PNLCostAlbProv: TLFPanel
                Left = 0
                Top = 22
                Width = 819
                Height = 259
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBGCostAlbaranProv: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 819
                  Height = 259
                  Align = alClient
                  DataSource = ObrDMObras.DSDetostAlbProv
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = DBGCostAlbaranProvDblClick
                  Insercion = False
                  ColumnaInicial = 1
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
                  Campos.Strings = (
                    'LINEA_COSTE_IMPUTADO'
                    'SERIE'
                    'RIG')
                  CamposAMostrar.Strings = (
                    'LINEA_COSTE_IMPUTADO'
                    '0'
                    'SERIE'
                    '0'
                    'RIG'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '0'
                    '0'
                    '0')
                  CamposADevolver.Strings = (
                    ''
                    ''
                    '')
                  CamposDesplegar.Strings = (
                    '1'
                    '1'
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'LINEA'
                    'SERIE'
                    'RIG')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'VER_DETALLE_ALBARAN_PROV'
                    'VER_CANALES_SERIES'
                    'VER_CABECERAS_ALBARAN_PROV')
                  Acciones.Strings = (
                    ''
                    ''
                    '')
                  Titulos.Strings = (
                    'TITULO'
                    'TITULO'
                    'TITULO')
                  Posicion = tpCentrado
                  OnBusqueda = DBGCostAlbaranProvBusqueda
                  Planes.Strings = (
                    ''
                    ''
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    ''
                    ''
                    '')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA_DET'
                      ReadOnly = True
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SERIE'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'RIG'
                      Width = 60
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LINEA_COSTE_IMPUTADO'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'FECHA'
                      ReadOnly = True
                      Width = 80
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'ARTICULO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DESCRIPCION'
                      ReadOnly = True
                      Width = 200
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_IMPUTADO'
                      ReadOnly = True
                      Width = 64
                      Visible = True
                    end>
                end
              end
            end
            object TSDetIngre: TTabSheet
              Caption = 'Facturaci'#243'n'
              ImageIndex = 3
              object TBIngresos: TLFToolBar
                Left = 0
                Top = 0
                Width = 819
                Height = 22
                AutoSize = True
                EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                TabOrder = 0
                Separators = True
                object NavIngresos: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 22
                  DataSource = ObrDMObras.DSDetIngr
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEIngresosPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGIngresos
                  InsertaControl = DBGIngresos
                  Exclusivo = True
                  ControlEdit = CEIngresos
                  OrdenAscendente = True
                  InsertaUltimo = True
                end
              end
              object PNLIngresos: TLFPanel
                Left = 0
                Top = 22
                Width = 819
                Height = 259
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBGIngresos: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 819
                  Height = 259
                  Align = alClient
                  DataSource = ObrDMObras.DSDetIngr
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = DBGIngresosDblClick
                  Insercion = False
                  ColumnaInicial = 1
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
                  Campos.Strings = (
                    'SERIE'
                    'RIG')
                  CamposAMostrar.Strings = (
                    'SERIE'
                    '0'
                    'RIG'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '0'
                    '0')
                  CamposADevolver.Strings = (
                    ''
                    '')
                  CamposDesplegar.Strings = (
                    '1'
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'SERIE'
                    'RIG')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'VER_CANALES_SERIES'
                    'VER_CABECERAS_FACTURA')
                  Acciones.Strings = (
                    ''
                    '')
                  Titulos.Strings = (
                    'TITULO'
                    'TITULO')
                  Posicion = tpCentrado
                  OnBusqueda = DBGIngresosBusqueda
                  Planes.Strings = (
                    ''
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    ''
                    '')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA_DET'
                      ReadOnly = True
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SERIE'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'RIG'
                      Width = 60
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'FECHA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_FAC'
                      ReadOnly = True
                      Visible = True
                    end>
                end
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 829
          Height = 512
          DataSource = ObrDMObras.DSCabObras
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_OBRA'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PREVISTA_CIERRE'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Width = 90
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 570
    Width = 841
  end
  inherited CEMain: TControlEdit
    Left = 672
    Top = 84
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 708
    Top = 84
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 0
    object AListado: TAction
      Category = 'Listado'
      Caption = 'Listado Obras'
      ImageIndex = 14
      OnExecute = AListadoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object AProConfig: TAction
      Category = 'Listado'
      Caption = 'Configuraci'#243'n'
      ImageIndex = 77
      OnExecute = AProConfigExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 416
    Top = 0
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLNotas
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 120
  end
  object CENotasPMEdit: TPopUpTeclas
    Left = 712
    Top = 120
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENotasPartida: TControlEdit
    EnlazadoA = CEPartidas
    FichaEdicion = TSNotasPartida
    FichaExclusiva = TSNotasPartida
    PanelEdicion = PNLNotasPartida
    PopUpMenu = CENotasPartidaPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 216
  end
  object CENotasPartidaPMEdit: TPopUpTeclas
    Left = 712
    Top = 216
    object CENotasPartidaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasPartidaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasPartidaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasPartidaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasPartidaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasPartidaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasPartidaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasPartidaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasPartidaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasPartidaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEPartidas: TControlEdit
    FichaEdicion = TSPartida
    FichaExclusiva = TSPartida
    PopUpMenu = CEPartidasPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 184
  end
  object CEPartidasPMEdit: TPopUpTeclas
    Left = 712
    Top = 184
    object CEPartidasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPartidasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPartidasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPartidasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPartidasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPartidasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPartidasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPartidasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPartidasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPartidasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEImagen: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSDibujo
    FichaExclusiva = TSDibujo
    PanelEdicion = PNLImagen
    PopUpMenu = CEImagenPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 152
  end
  object CEImagenPMEdit: TPopUpTeclas
    Left = 712
    Top = 152
    object CEImagenMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEImagenMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEImagenMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEImagenMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEImagenMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEImagenMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEImagenMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECostAlbCli: TControlEdit
    EnlazadoA = CEPartidas
    FichaEdicion = TSDetCostAlbCli
    FichaExclusiva = TSDetCostAlbCli
    PopUpMenu = CECostAlbCliPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 248
  end
  object CECostAlbCliPMEdit: TPopUpTeclas
    Left = 712
    Top = 248
    object CECostAlbCliMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECostAlbCliMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECostAlbCliMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECostAlbCliMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECostAlbCliMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECostAlbCliMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECostAlbCliMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECostAlbCliMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECostAlbCliMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECostAlbCliMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECostesProd: TControlEdit
    EnlazadoA = CECostAlbCli
    FichaEdicion = TSDetCostProd
    FichaExclusiva = TSDetCostProd
    PopUpMenu = CECostesProdPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 280
  end
  object CECostesProdPMEdit: TPopUpTeclas
    Left = 712
    Top = 280
    object CECostesProdMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECostesProdMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECostesProdMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECostesProdMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECostesProdMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECostesProdMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECostesProdMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECostesProdMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECostesProdMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECostesProdMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECostVarios: TControlEdit
    EnlazadoA = CECostesProd
    FichaEdicion = TSDetCostVar
    FichaExclusiva = TSDetCostVar
    PopUpMenu = CECostVariosPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 312
  end
  object CECostVariosPMEdit: TPopUpTeclas
    Left = 712
    Top = 312
    object CECostVariosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECostVariosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECostVariosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECostVariosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECostVariosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECostVariosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECostVariosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECostVariosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECostVariosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECostVariosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEIngresos: TControlEdit
    EnlazadoA = CECostVarios
    FichaEdicion = TSDetIngre
    FichaExclusiva = TSDetIngre
    PopUpMenu = CEIngresosPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 344
  end
  object CEIngresosPMEdit: TPopUpTeclas
    Left = 712
    Top = 344
    object CEIngresosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEIngresosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEIngresosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEIngresosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEIngresosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEIngresosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEIngresosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEIngresosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEIngresosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEIngresosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECostAlbProv: TControlEdit
    EnlazadoA = CEIngresos
    FichaEdicion = TSDetCostAlbProv
    FichaExclusiva = TSDetCostAlbProv
    PopUpMenu = CECostAlbProvPMEdit
    Teclas = DMMain.Teclas
    Left = 672
    Top = 376
  end
  object CECostAlbProvPMEdit: TPopUpTeclas
    Left = 712
    Top = 376
    object CECostAlbProvMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECostAlbProvMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECostAlbProvMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECostAlbProvMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECostAlbProvMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECostAlbProvMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECostAlbProvMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECostAlbProvMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECostAlbProvMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECostAlbProvMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
