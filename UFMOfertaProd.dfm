inherited FMOfertaProd: TFMOfertaProd
  Left = 413
  Top = 167
  Caption = 'Mantenimiento de Ofertas de Producci'#243'n'
  ClientHeight = 568
  ClientWidth = 792
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 544
    inherited TBMain: TLFToolBar
      Width = 788
      inherited NavMain: THYMNavigator
        DataSource = DMOfertaProd.DSQMOfertaProd
        Hints.Strings = ()
        EditaControl = DBEFCliente
        InsertaControl = DBEFCliente
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 788
      Height = 514
      inherited TSFicha: TTabSheet
        object SBADestino: TSpeedButton [0]
          Left = 508
          Top = 22
          Width = 59
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+D para ver los datos del Destino'
          GroupIndex = -1
          OnDblClick = SBADestinoDblClick
        end
        object SBACliente: TSpeedButton [1]
          Left = 380
          Top = 48
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        object SBACompuesto: TSpeedButton [2]
          Left = 308
          Top = 72
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Compuesto'
          GroupIndex = -1
          OnDblClick = SBACompuestoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 780
          Height = 486
          inherited G2KTableLoc: TG2KTBLoc
            Left = 24
            Top = 24
            CamposADesplegar.Strings = (
              'RIG_OF')
            DataSource = DMOfertaProd.DSQMOfertaProd
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_OFERTA'
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO_ART'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'COMPUESTO')
          end
          object LFLabel1: TLFLabel
            Left = 61
            Top = 20
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Oferta'
          end
          object LFLabel2: TLFLabel
            Left = 197
            Top = 21
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Creaci'#243'n'
          end
          object LFLabel3: TLFLabel
            Left = 58
            Top = 45
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LFLabel4: TLFLabel
            Left = 37
            Top = 65
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Compuesto'
          end
          object LFLabel5: TLFLabel
            Left = 618
            Top = 42
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso Pieza'
          end
          object LFLabel6: TLFLabel
            Left = 611
            Top = 63
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso Colada'
          end
          object LFLabel7: TLFLabel
            Left = 26
            Top = 119
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Materia Prima'
          end
          object LFLabel8: TLFLabel
            Left = 60
            Top = 141
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LFLabel9: TLFLabel
            Left = 241
            Top = 140
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LFLabel10: TLFLabel
            Left = 65
            Top = 195
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Color'
          end
          object LFLabel11: TLFLabel
            Left = 59
            Top = 218
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LFLabel12: TLFLabel
            Left = 240
            Top = 217
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LFLabel13: TLFLabel
            Left = 450
            Top = 117
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'MP 3'
          end
          object LFLabel14: TLFLabel
            Left = 445
            Top = 141
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LFLabel15: TLFLabel
            Left = 626
            Top = 141
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LFLabel16: TLFLabel
            Left = 450
            Top = 195
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'MP 4'
          end
          object LFLabel17: TLFLabel
            Left = 445
            Top = 217
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LFLabel18: TLFLabel
            Left = 626
            Top = 217
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LFLabel19: TLFLabel
            Left = 43
            Top = 398
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Caja'
          end
          object LFLabel20: TLFLabel
            Left = 41
            Top = 420
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades '
          end
          object LFLabel21: TLFLabel
            Left = 24
            Top = 256
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo M'#225'quina'
          end
          object LFLabel22: TLFLabel
            Left = 43
            Top = 300
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ciclo(seg)'
          end
          object LFLabel23: TLFLabel
            Left = 17
            Top = 323
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uni. Cavidades'
          end
          object LFLabel24: TLFLabel
            Left = 393
            Top = 256
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tiempo Manipula.'
          end
          object LFLabel25: TLFLabel
            Left = 583
            Top = 256
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas Prep. Molde'
          end
          object LFLabel26: TLFLabel
            Left = 403
            Top = 277
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Puesta Marcha'
          end
          object LFLabel27: TLFLabel
            Left = 413
            Top = 301
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen M'#225'q.'
          end
          object LFLabel28: TLFLabel
            Left = 420
            Top = 324
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen MP'
          end
          object LFLabel29: TLFLabel
            Left = 432
            Top = 398
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido 1'
          end
          object LFLabel30: TLFLabel
            Left = 432
            Top = 420
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido 2'
          end
          object LFLabel31: TLFLabel
            Left = 432
            Top = 442
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido 3'
          end
          object LFLabel32: TLFLabel
            Left = 630
            Top = 398
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido 4'
          end
          object LFLabel33: TLFLabel
            Left = 630
            Top = 420
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido 5'
          end
          object LFLabel34: TLFLabel
            Left = 630
            Top = 442
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido 6'
          end
          object LFLabel35: TLFLabel
            Left = 59
            Top = 278
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Molde'
          end
          object LFLabel36: TLFLabel
            Left = 58
            Top = 442
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LblDestino: TLFLabel
            Left = 439
            Top = 20
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Destino'
          end
          object LFLabel37: TLFLabel
            Left = 610
            Top = 301
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen Ope.'
          end
          object LFLabel38: TLFLabel
            Left = 614
            Top = 322
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen Var.'
          end
          object LFLabel39: TLFLabel
            Left = 609
            Top = 344
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen Trab.'
          end
          object LFDBOferta: TLFDbedit
            Left = 94
            Top = 17
            Width = 88
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG_OF'
            DataSource = DMOfertaProd.DSQMOfertaProd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBDate: TDBDateEdit
            Left = 276
            Top = 17
            Width = 105
            Height = 21
            DataField = 'FECHA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBDescripCliente: TLFHYDBDescription
            Left = 183
            Top = 39
            Width = 384
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 44
            OnDblClick = SBAClienteDblClick
            Tabla_a_buscar = 'CON_CUENTAS_GES_CLI'
            Campo_Descripcion = 'NOMBRE_R_SOCIAL'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CLIENTE'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'CLIENTE'
              'EMPRESA')
          end
          object DBDescripCompuesto: TLFDbedit
            Left = 183
            Top = 61
            Width = 384
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_ART'
            DataSource = DMOfertaProd.DSQMOfertaProd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 42
            OnDblClick = SBACompuestoDblClick
          end
          object DBEFCliente: TDBEditFind2000
            Left = 94
            Top = 39
            Width = 88
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 2
            OnChange = DBEFClienteChange
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
          object DBEFCompuesto: TDBEditFind2000
            Left = 94
            Top = 61
            Width = 88
            Height = 21
            DataField = 'COMPUESTO'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBPesoPieza: TLFDbedit
            Left = 675
            Top = 38
            Width = 88
            Height = 21
            DataField = 'PESO_PIEZA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 4
          end
          object LFDBPesoColada: TLFDbedit
            Left = 675
            Top = 60
            Width = 88
            Height = 21
            DataField = 'PESO_COLADA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 5
          end
          object LFDBPrecioMatPrima: TLFDbedit
            Left = 94
            Top = 137
            Width = 88
            Height = 21
            DataField = 'PRECIO_COMPONENTE1'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 8
          end
          object LFDBUnidadesMatPrima: TLFDbedit
            Left = 290
            Top = 137
            Width = 88
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNI_COMPONENTE1'
            DataSource = DMOfertaProd.DSQMOfertaProd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 43
          end
          object LFDBPrecioColor: TLFDbedit
            Left = 93
            Top = 213
            Width = 88
            Height = 21
            DataField = 'PRECIO_COMPONENTE2'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 11
          end
          object LFDBUnidadesColor: TLFDbedit
            Left = 289
            Top = 213
            Width = 88
            Height = 21
            DataField = 'UNI_COMPONENTE2'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 12
          end
          object LFDBPrecioComp3: TLFDbedit
            Left = 479
            Top = 137
            Width = 88
            Height = 21
            DataField = 'PRECIO_COMPONENTE3'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 15
          end
          object LFDBUnidadesComp3: TLFDbedit
            Left = 675
            Top = 137
            Width = 88
            Height = 21
            DataField = 'UNI_COMPONENTE3'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 16
          end
          object LFDBPrecioComp4: TLFDbedit
            Left = 479
            Top = 213
            Width = 88
            Height = 21
            DataField = 'PRECIO_COMPONENTE4'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 19
          end
          object LFDBUnidadesComp4: TLFDbedit
            Left = 675
            Top = 213
            Width = 88
            Height = 21
            DataField = 'UNI_COMPONENTE4'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 20
          end
          object DBEFMatPrima: TDBEditFind2000
            Left = 94
            Top = 115
            Width = 88
            Height = 21
            DataField = 'COMPONENTE1'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 7
            OnChange = DBEFMatPrimaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDescripMatprima: TLFHYDBDescription
            Left = 183
            Top = 115
            Width = 195
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 45
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COMPONENTE1'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'ARTICULO'
              'EMPRESA')
          end
          object DBDescripColor: TLFHYDBDescription
            Left = 182
            Top = 191
            Width = 195
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 46
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COMPONENTE2'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'ARTICULO'
              'EMPRESA')
          end
          object DBDescripCompuesto3: TLFHYDBDescription
            Left = 568
            Top = 115
            Width = 195
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 47
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COMPONENTE3'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'ARTICULO'
              'EMPRESA')
          end
          object DBDescripCompuesto4: TLFHYDBDescription
            Left = 568
            Top = 191
            Width = 195
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 48
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COMPONENTE4'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'ARTICULO'
              'EMPRESA')
          end
          object DBEFColor: TDBEditFind2000
            Left = 93
            Top = 191
            Width = 88
            Height = 21
            DataField = 'COMPONENTE2'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 10
            OnChange = DBEFColorChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCompuesto3: TDBEditFind2000
            Left = 479
            Top = 115
            Width = 88
            Height = 21
            DataField = 'COMPONENTE3'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 14
            OnChange = DBEFCompuesto3Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCompuesto4: TDBEditFind2000
            Left = 479
            Top = 191
            Width = 88
            Height = 21
            DataField = 'COMPONENTE4'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 18
            OnChange = DBEFCompuesto4Change
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBUniCaja: TLFDbedit
            Left = 93
            Top = 416
            Width = 88
            Height = 21
            DataField = 'UNI_CAJA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 34
          end
          object LFDBCiclo: TLFDbedit
            Left = 93
            Top = 297
            Width = 88
            Height = 21
            DataField = 'TIEMPO_CICLO'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 23
          end
          object LFDBCavidades: TLFDbedit
            Left = 93
            Top = 319
            Width = 88
            Height = 21
            DataField = 'UNI_CAVIDADES'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 24
          end
          object LFDBTiempoManipula: TLFDbedit
            Left = 479
            Top = 253
            Width = 88
            Height = 21
            DataField = 'TIEMPO_MANIPUACION'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 25
          end
          object LFDBHorasPrepMolde: TLFDbedit
            Left = 675
            Top = 253
            Width = 88
            Height = 21
            DataField = 'HORAS_PREP_MOLDE'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 26
          end
          object LFDBPuestaMarcha: TLFDbedit
            Left = 479
            Top = 275
            Width = 88
            Height = 21
            DataField = 'PUESTA_MARCHA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 27
          end
          object LFDBMargenMaq: TLFDbedit
            Left = 479
            Top = 297
            Width = 88
            Height = 21
            DataField = 'MARGEN_MAQ'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 28
          end
          object LFDBMargenMatPrima: TLFDbedit
            Left = 479
            Top = 319
            Width = 88
            Height = 21
            DataField = 'MARGEN_MAT_PRIMA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 30
          end
          object LFDBPedido1: TLFDbedit
            Left = 479
            Top = 394
            Width = 88
            Height = 21
            DataField = 'PEDIDO1'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 36
          end
          object LFDBPedido2: TLFDbedit
            Left = 479
            Top = 416
            Width = 88
            Height = 21
            DataField = 'PEDIDO2'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 37
          end
          object LFDBPedido3: TLFDbedit
            Left = 479
            Top = 438
            Width = 88
            Height = 21
            DataField = 'PEDIDO3'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 38
          end
          object LFDBPedido4: TLFDbedit
            Left = 675
            Top = 394
            Width = 88
            Height = 21
            DataField = 'PEDIDO4'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 39
          end
          object LFDBPedido5: TLFDbedit
            Left = 675
            Top = 416
            Width = 88
            Height = 21
            DataField = 'PEDIDO5'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 40
          end
          object LFDBPedido6: TLFDbedit
            Left = 675
            Top = 438
            Width = 88
            Height = 21
            DataField = 'PEDIDO6'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 41
          end
          object DBEFMaquina: TDBEditFind2000
            Left = 93
            Top = 253
            Width = 88
            Height = 21
            DataField = 'TIPO_MAQUINA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 21
            OnChange = DBEFMaquinaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODMAQ')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDescripTMaquina: TLFHYDBDescription
            Left = 182
            Top = 253
            Width = 195
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 49
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'TIPO_MAQUINA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'CODMAQ')
          end
          object DBEFMolde: TDBEditFind2000
            Left = 93
            Top = 275
            Width = 88
            Height = 21
            DataField = 'MOLDE'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 22
            OnChange = DBEFMoldeChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_MOLDES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'NUM_MOLDE'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'NUM_MOLDE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDescripMolde: TLFHYDBDescription
            Left = 182
            Top = 275
            Width = 195
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 50
            Tabla_a_buscar = 'EMP_MOLDES'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'MOLDE')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'NUM_MOLDE')
          end
          object DBTipoCaja: TDBEditFind2000
            Left = 93
            Top = 394
            Width = 88
            Height = 21
            DataField = 'TIPO_CAJA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 33
            OnChange = DBTipoCajaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'familia='#39'60201'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDescripCaja: TLFHYDBDescription
            Left = 182
            Top = 394
            Width = 195
            Height = 21
            Color = clInfoBk
            DataSource = DMOfertaProd.DSQMOfertaProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 51
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'TIPO_CAJA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'ARTICULO')
          end
          object LFDBPrecioCaja: TLFDbedit
            Left = 93
            Top = 438
            Width = 88
            Height = 21
            DataField = 'PRECIO_CAJA'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 35
          end
          object DBEDestino: TLFDbedit
            Left = 479
            Top = 17
            Width = 88
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ESCANDALLO'
            DataSource = DMOfertaProd.DSxDestino
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 52
            OnDblClick = SBADestinoDblClick
          end
          object DBChkBEquival1: TLFDBCheckBox
            Left = 17
            Top = 97
            Width = 90
            Height = 17
            Caption = 'Usar Equival.'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 6
            TabStop = True
            OnClick = DBChkBEquivalClick
            Alignment = taLeftJustify
            DataField = 'USAR_EQUIVAL1'
            DataSource = DMOfertaProd.DSQMOfertaProd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBChkBEquival2: TLFDBCheckBox
            Left = 17
            Top = 173
            Width = 90
            Height = 17
            Caption = 'Usar Equival.'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 9
            TabStop = True
            OnClick = DBChkBEquivalClick
            Alignment = taLeftJustify
            DataField = 'USAR_EQUIVAL2'
            DataSource = DMOfertaProd.DSQMOfertaProd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBChkBEquival3: TLFDBCheckBox
            Left = 402
            Top = 97
            Width = 90
            Height = 17
            Caption = 'Usar Equival.'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 13
            TabStop = True
            OnClick = DBChkBEquivalClick
            Alignment = taLeftJustify
            DataField = 'USAR_EQUIVAL3'
            DataSource = DMOfertaProd.DSQMOfertaProd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBChkBEquival4: TLFDBCheckBox
            Left = 402
            Top = 173
            Width = 90
            Height = 17
            Caption = 'Usar Equival.'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 17
            TabStop = True
            OnClick = DBChkBEquivalClick
            Alignment = taLeftJustify
            DataField = 'USAR_EQUIVAL4'
            DataSource = DMOfertaProd.DSQMOfertaProd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBMargenOpe: TLFDbedit
            Left = 675
            Top = 297
            Width = 88
            Height = 21
            DataField = 'MARGEN_OPE'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 29
          end
          object LFDBMargenVar: TLFDbedit
            Left = 675
            Top = 319
            Width = 88
            Height = 21
            DataField = 'MARGEN_VAR'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 31
          end
          object LFDBMargenTrab: TLFDbedit
            Left = 675
            Top = 341
            Width = 88
            Height = 21
            DataField = 'MARGEN_TRAB'
            DataSource = DMOfertaProd.DSQMOfertaProd
            TabOrder = 32
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 780
          Height = 486
          DataSource = DMOfertaProd.DSQMOfertaProd
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'COMPONENTE1'
            'COMPONENTE2'
            'COMPUESTO'
            'FECHA'
            'MOLDE'
            'RIG_OF')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG_OF'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPUESTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ART'
              Title.Caption = 'Titulo'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_PIEZA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_COLADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPONENTE1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_COMPONENTE1'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_COMPONENTE1'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPONENTE2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_COMPONENTE2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_COMPONENTE2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_CAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_CAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_CAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_MAQUINA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_CICLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOLDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNI_CAVIDADES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_MANIPUACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAS_PREP_MOLDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUESTA_MARCHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO1'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 544
    Width = 792
  end
  inherited CEMain: TControlEdit
    Left = 640
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 676
    Top = 8
  end
  inherited ALMain: TLFActionList
    Left = 416
    Top = 16
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      Hint = 'Procesos'
      ImageIndex = 16
    end
    object ACrearOfertaEsc: TAction
      Category = 'Procesos'
      Caption = 'Crear Oferta Esc.'
      Hint = 'Crear Oferta Esc.'
      OnExecute = ACrearOfertaEscExecute
    end
    object ACrearEscandallo: TAction
      Category = 'Procesos'
      Caption = 'Crear Escandallo'
      Hint = 'Crear Escandallo'
      OnExecute = ACrearEscandalloExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 452
    Top = 16
  end
  object ALOfertas: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 528
    Top = 16
    object ADestino: TAction
      Caption = 'Ver datos destino'
      Hint = 'Doble click o Ctrl+Alt+D para ver los datos del Destino'
      ShortCut = 49220
      OnExecute = ADestinoExecute
    end
    object ACliente: TAction
      Caption = 'Ver datos cliente'
      Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
      ShortCut = 49219
      OnExecute = AClienteExecute
    end
    object ACompuesto: TAction
      Caption = 'Ver datos compuesto'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Compuesto'
      ShortCut = 49217
      OnExecute = ACompuestoExecute
    end
  end
end
