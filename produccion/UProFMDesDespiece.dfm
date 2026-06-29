inherited ProFMDesDespiece: TProFMDesDespiece
  Left = 385
  Top = 152
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Despiece'
  ClientWidth = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 584
    Height = 223
    inherited TBMain: TLFToolBar
      Width = 580
      inherited NavMain: THYMNavigator
        DataSource = ProDMDesDespiece.DSCabDespiece
        Hints.Strings = ()
        EditaControl = LFDBEFEscandallo
        InsertaControl = LFDBEFEscandallo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TBFormula: TToolButton
        Left = 319
        Top = 0
        Action = ACalculaformulas
      end
    end
    inherited PCMain: TLFPageControl
      Width = 580
      Height = 193
      inherited TSFicha: TTabSheet
        object SBAEscandallo: TSpeedButton [0]
          Left = 137
          Top = 26
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+E para ver los datos del Escandallo'
          GroupIndex = -1
          ParentShowHint = False
          ShowHint = True
          OnDblClick = SBAEscandalloDblClick
        end
        object SBAOF: TSpeedButton [1]
          Left = 352
          Top = 8
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAOFDblClick
        end
        inherited PEdit: TLFPanel
          Width = 572
          Height = 165
          inherited G2KTableLoc: TG2KTBLoc
            Left = 63
            DataSource = ProDMDesDespiece.DSCabDespiece
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_DES_CAB_DESPIECE'
            CampoNum = 'ID_DESPIECE'
            CampoStr = 'FECHA_CREACION'
            Filtros = [obEmpresa, obEjercicio, obSerie]
            Entorno = DMMain.EntornoBusqueda
          end
          object LPedido: TLFLabel
            Left = 465
            Top = 50
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
            Visible = False
          end
          object LLineaPedido: TLFLabel
            Left = 436
            Top = 71
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea Pedido'
            Visible = False
          end
          object LFechaCreacion: TLFLabel
            Left = 214
            Top = 5
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Creaci'#243'n'
          end
          object LEscandallo: TLFLabel
            Left = 15
            Top = 28
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LCantidad: TLFLabel
            Left = 25
            Top = 50
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
          end
          object LTipoMaterial: TLFLabel
            Left = 6
            Top = 72
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Material'
          end
          object LArticulo: TLFLabel
            Left = 30
            Top = 92
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LComentario: TLFLabel
            Left = 14
            Top = 115
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LAlto: TLFLabel
            Left = 49
            Top = 137
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alto'
          end
          object LAncho: TLFLabel
            Left = 130
            Top = 137
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho'
          end
          object LProfundidad: TLFLabel
            Left = 222
            Top = 137
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Profundidad'
          end
          object LGrueso: TLFLabel
            Left = 340
            Top = 137
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grueso'
          end
          object LDescripcion: TLFLabel
            Left = 22
            Top = 6
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Despiece'
          end
          object LNumeroOrdenProduccion: TLFLabel
            Left = 456
            Top = 6
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. OF'
          end
          object LNumeroSuborden: TLFLabel
            Left = 424
            Top = 28
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. Suborden'
          end
          object DBDEFechaCreacion: TLFDBDateEdit
            Left = 293
            Top = 2
            Width = 100
            Height = 21
            DataField = 'FECHA_CREACION'
            DataSource = ProDMDesDespiece.DSCabDespiece
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object LFDBCantidad: TLFDbedit
            Left = 71
            Top = 46
            Width = 63
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 3
          end
          object DescArticulo: TLFHYDBDescription
            Left = 135
            Top = 89
            Width = 258
            Height = 21
            Color = clInfoBk
            DataSource = ProDMDesDespiece.DSCabDespiece
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'ARTICULO_MAT_PRIMA'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'ARTICULO'
              'EMPRESA')
          end
          object LFDBComentario: TLFDbedit
            Left = 71
            Top = 111
            Width = 398
            Height = 21
            DataField = 'COMENTARIO'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 8
          end
          object LFDBAlto: TLFDbedit
            Left = 71
            Top = 133
            Width = 50
            Height = 21
            DataField = 'ALTO'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 9
          end
          object LFDBAncho: TLFDbedit
            Left = 165
            Top = 133
            Width = 50
            Height = 21
            DataField = 'ANCHO'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 10
          end
          object LFDBProfundidad: TLFDbedit
            Left = 283
            Top = 133
            Width = 50
            Height = 21
            DataField = 'PROFUNDIDAD'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 11
          end
          object LFPedido: TLFEditFind2000
            Left = 503
            Top = 46
            Width = 63
            Height = 21
            TabStop = False
            TabOrder = 13
            Visible = False
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'RIG'
            CampoStr = 'FECHA'
            CondicionBusqueda = 'tipo='#39'PEC'#39
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = []
          end
          object LFLineaPed: TLFEditFind2000
            Left = 503
            Top = 68
            Width = 63
            Height = 21
            TabStop = False
            TabOrder = 14
            Visible = False
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'LINEA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo='#39'PEC'#39
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GES_DETALLES_S'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = []
          end
          object DescTipoMaterial: TLFHYDBDescription
            Left = 135
            Top = 68
            Width = 258
            Height = 21
            Color = clInfoBk
            DataSource = ProDMDesDespiece.DSCabDespiece
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Tabla_a_buscar = 'PRO_DES_CAB_MATERIAL'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_MATERIAL')
            CamposWhereTabla.Strings = (
              'TIPO')
          end
          object LFDBTMaterial: TLFDBEditFind2000
            Left = 71
            Top = 68
            Width = 63
            Height = 21
            DataField = 'TIPO_MATERIAL'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 4
            OnChange = LFDBTMaterialChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_DES_CAB_MATERIAL'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBEArticulos: TLFDBEditFind2000
            Left = 71
            Top = 89
            Width = 63
            Height = 21
            DataField = 'ARTICULO_MAT_PRIMA'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 6
            OnChange = LFDBEArticulosChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBGrueso: TLFDbedit
            Left = 378
            Top = 133
            Width = 50
            Height = 21
            DataField = 'GRUESO_PRINCIPAL'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 12
          end
          object LFDBEFEscandallo: TLFDBEditFind2000
            Left = 71
            Top = 24
            Width = 63
            Height = 21
            DataField = 'Escandallo'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 2
            OnChange = LFDBEFEscandalloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ESCANDALLO'
            CampoStr = 'COMPUESTO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBDespiece: TLFDbedit
            Left = 71
            Top = 2
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_DESPIECE'
            DataSource = ProDMDesDespiece.DSCabDespiece
            ReadOnly = True
            TabOrder = 0
          end
          object LFDBOF: TLFDbedit
            Left = 503
            Top = 2
            Width = 63
            Height = 21
            Color = clAqua
            DataField = 'ID_ORDEN'
            DataSource = ProDMDesDespiece.DSCabDespiece
            ReadOnly = True
            TabOrder = 15
            OnDblClick = SBAOFDblClick
          end
          object LFDBSuborden: TLFDbedit
            Left = 503
            Top = 24
            Width = 63
            Height = 21
            Color = clAqua
            DataField = 'ID_SUBORDEN'
            DataSource = ProDMDesDespiece.DSCabDespiece
            ReadOnly = True
            TabOrder = 16
          end
          object DescEscandallo: TLFHYDBDescription
            Left = 135
            Top = 24
            Width = 258
            Height = 21
            Color = clInfoBk
            DataSource = ProDMDesDespiece.DSCabDespiece
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            OnDblClick = SBAEscandalloDblClick
            Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'ID_ESCANDALLO')
            CamposWhereTabla.Strings = (
              'ID_ESC')
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        object PNLNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 572
          Height = 165
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFDBNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 572
            Height = 165
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'NOTAS'
            DataSource = ProDMDesDespiece.DSCabDespiece
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 572
          Height = 165
          DataSource = ProDMDesDespiece.DSCabDespiece
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_DESPIECE'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CREACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ESCANDALLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_MATERIAL'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO_MAT_PRIMA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 223
    Width = 584
    Height = 185
    inherited TBDetalle: TLFToolBar
      Width = 584
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
        InsertaUltimo = True
      end
      object ToolButton1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 584
      Height = 163
      DataSource = ProDMDesDespiece.DSDetDespiece
      Campos.Strings = (
        'FASE'
        'ID_TIPO_PIEZA'
        'COMPONENTE'
        'ID_TIPO_MATERIAL')
      CamposAMostrar.Strings = (
        'FASE'
        '0'
        'ID_TIPO_PIEZA'
        '0'
        'COMPONENTE'
        '0'
        'ID_TIPO_MATERIAL'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1')
      Numericos.Strings = (
        'FASE'
        'CODIGO'
        'ARTICULO'
        'TIPO')
      Tablas.Strings = (
        'PRO_SYS_FASES'
        'PRO_DES_TIPO_PIEZA'
        'ART_ARTICULOS'
        'PRO_DES_CAB_MATERIAL')
      Acciones.Strings = (
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'DESCRIPCION'
        'TITULO'
        'DESCRIPCION')
      Planes.Strings = (
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        '')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FASE'
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescFase'
          ReadOnly = True
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TIPO_PIEZA'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescTipoPieza'
          ReadOnly = True
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPONENTE'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescComponente'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TIPO_MATERIAL'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescTMaterial'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMULA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMULA_CALC_ALTURA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FORMULA_CALC_ANCHURA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FORMULA_CALC_PROF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FORMULA_CALC_GRUESO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ALTO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANCHO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUESO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROFUNDIDAD'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'METROS_DESCONTAR'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 584
  end
  inherited CEMain: TControlEdit
    Left = 312
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 348
    Top = 44
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 32
    object AAImportarEsc: TAction
      Category = 'Procesos'
      Caption = 'Importar escandallo'
      ImageIndex = 49
      OnExecute = AAImportarEscExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AACalculoFormulas: TAction
      Category = 'Procesos'
      Caption = 'C'#225'lculo de f'#243'rmulas'
      Hint = 'C'#225'lculo de f'#243'rmulas'
      ImageIndex = 3
    end
    object AACrearOF: TAction
      Category = 'Procesos'
      Caption = 'Crear Orden Fabricaci'#243'n'
      Hint = 'Crear Orden Fabricaci'#243'n'
      ImageIndex = 92
      OnExecute = AACrearOFExecute
    end
    object AACrearSuborden: TAction
      Category = 'Procesos'
      Caption = 'Crear Suborden de Fabricaci'#243'n'
      Hint = 'Crear Suborden de Fabricaci'#243'n'
      ImageIndex = 92
      OnExecute = AACrearSubordenExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 432
    Top = 32
  end
  inherited CEDetalle: TControlEdit
    Left = 486
    Top = 192
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 546
    Top = 186
  end
  object ALDespiece: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 480
    Top = 24
    object AAEscandallo: TAction
      Caption = 'AAEscandallo'
      Hint = 'Doble Click o Ctrl + E para ver el escandallo'
      ShortCut = 49221
      OnExecute = AAEscandalloExecute
    end
    object AImportarEscandallo: TAction
      Caption = 'AImportarEscandallo'
      ImageIndex = 52
      OnExecute = AImportarEscandalloExecute
    end
    object AAOrden: TAction
      Caption = 'AAOrden'
      OnExecute = AAOrdenExecute
    end
    object ACalculaformulas: TAction
      Caption = 'ACalculaformulas'
      Hint = 'C'#225'lcula F'#243'rmulas'
      ImageIndex = 3
      OnExecute = ACalculaformulasExecute
    end
  end
end
