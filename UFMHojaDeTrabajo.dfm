inherited FMHojaDeTrabajo: TFMHojaDeTrabajo
  Left = 500
  Top = 175
  Width = 878
  Height = 617
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Hoja De Trabajo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 868
    Height = 564
    inherited TBMain: TLFToolBar
      Width = 864
      inherited NavMain: THYMNavigator
        DataSource = DMHojaDeTrabajo.DSxDisponible
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      object TBSep6: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLSeccion: TLFPanel
        Left = 347
        Top = 0
        Width = 286
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSeccion: TLFLabel
          Left = 17
          Top = 4
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Seccion'
        end
        object EFSeccion: TEditFind2000
          Left = 59
          Top = 0
          Width = 89
          Height = 21
          TabOrder = 0
          OnChange = EFSeccionChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SECCION'
          CampoStr = 'DESCRIPCION'
          CondicionBusqueda = 'MOSTRAR_EN_MAQUINAS = 1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'OPE_SECCIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SECCION')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESeccion: TLFEdit
          Left = 149
          Top = 0
          Width = 134
          Height = 21
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object ToolButton5: TToolButton
        Left = 633
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescar: TToolButton
        Left = 641
        Top = 0
        Action = ARefrescar
      end
    end
    object PNLDisponible: TLFPanel
      Left = 2
      Top = 28
      Width = 864
      Height = 189
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object DBGDisponible: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 864
        Height = 189
        Align = alClient
        Color = clInfoBk
        DataSource = DMHojaDeTrabajo.DSxDisponible
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGDisponibleDblClick
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
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDENTIFICADOR'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ORDEN'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG_OF'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_FASE'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_TAREA'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAREA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_TAREA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_TAREA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_FASE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_FASE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECURSO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_RECURSO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_RECURSO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACION'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNI_PENDIENTES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPUESTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_COMPUESTO'
            Width = 400
            Visible = True
          end>
      end
    end
    object PNLAsignado: TLFPanel
      Left = 2
      Top = 217
      Width = 864
      Height = 345
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGAsignado: TDBGridFind2000
        Left = 0
        Top = 29
        Width = 864
        Height = 179
        Align = alClient
        DataSource = DMHojaDeTrabajo.DSxAsignado
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGAsignadoCellClick
        OnDrawColumnCell = DBGAsignadoDrawColumnCell
        OnDblClick = DBGAsignadoDblClick
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
        Campos.Strings = (
          'ID_IMAGEN'
          'EMPLEADO'
          'TIPO'
          'SECCION'
          'CLIENTE'
          'ARTICULO'
          'TIPOTAREA')
        CamposAMostrar.Strings = (
          'ID_IMAGEN'
          '0'
          'EMPLEADO'
          '0'
          'TIPO'
          '0'
          'SECCION'
          '0'
          'CLIENTE'
          '0'
          'ARTICULO'
          '0'
          'TIPOTAREA'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0'
          '0'
          '0'
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          ''
          ''
          ''
          ''
          ''
          ''
          '')
        CamposDesplegar.Strings = (
          '1'
          '1'
          '1'
          '1'
          '1'
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'CANTIDAD'
          'CLIENTE'
          'CANTIDAD_REALIZADA'
          'COMPUESTO'
          'EMPLEADO'
          'FECHA_FIN'
          'FECHA_INI'
          'FECHA_TRABAJO'
          'FINALIZADO'
          'ID_HOJA_TRABAJO'
          'ID_ORDEN'
          'LINEA_FASE'
          'LINEA_TAREA'
          'NOMBRE_R_SOCIAL'
          'PEDIDO'
          'PRIORIDAD'
          'SECCION'
          'TITULO_COMPUESTO'
          'VISIBLE')
        ColumnasCheckBoxes.Strings = (
          'FINALIZADO'
          'VISIBLE')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'CODIGO'
          'EMPLEADO'
          'TIPO'
          'SECCION'
          'CLIENTE'
          'ARTICULO'
          'TAREA')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'SYS_IMAGENES'
          'VER_EMPLEADOS_CUENTAS'
          'SYS_TIPO_HOJA_TRABAJO'
          'OPE_SECCIONES'
          'VER_CLIENTES_EF'
          'VER_ARTICULOS_EF'
          'PRO_SYS_TAREAS')
        Acciones.Strings = (
          ''
          ''
          ''
          ''
          ''
          ''
          '')
        Titulos.Strings = (
          'NOMBRE'
          'TITULO'
          'TITULO'
          'DESCRIPCION'
          'TITULO'
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGAsignadoBusqueda
        Planes.Strings = (
          ''
          ''
          ''
          ''
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'CODIGO'
          'EMPLEADO'
          'TIPO'
          'SECCION'
          'CLIENTE'
          'ARTICULO'
          'TAREA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID_HOJA_TRABAJO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECCION'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPLEADO'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAQUINA'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ORDEN'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_DOC'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_FASE'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_TAREA'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_TRABAJO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIORIDAD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VISIBLE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FINALIZADO'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_IMAGEN'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_INI'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_FIN'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD_REALIZADA'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            ReadOnly = False
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_ARTICULO'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOTAREA'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_TAREA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'TIEMPO_PREVISTO'
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'TIEMPO_REAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_FAB'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_DEFECTUOSAS'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_UNIDADES_FAB'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_UNIDADES_DEFECTUOSAS'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_UNIDADES_ORDEN'
            Width = 80
            Visible = True
          end>
      end
      object TBAsignado: TLFToolBar
        Left = 0
        Top = 0
        Width = 864
        Height = 29
        EdgeBorders = []
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 240
          Height = 22
          DataSource = DMHojaDeTrabajo.DSxAsignado
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
        object TBSep3: TToolButton
          Left = 240
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtSubirPrioridad: TToolButton
          Left = 248
          Top = 2
          Action = ASubirPrioridad
        end
        object TButtBajarPrioridad: TToolButton
          Left = 271
          Top = 2
          Action = ABajarPrioridad
        end
        object TBSep4: TToolButton
          Left = 294
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtNotas: TToolButton
          Left = 302
          Top = 2
          Action = AEditaNotas
        end
        object TBSep1: TToolButton
          Left = 325
          Top = 2
          Width = 8
          ImageIndex = 19
          Style = tbsSeparator
        end
        object TButtTodoVisible: TToolButton
          Left = 333
          Top = 2
          Action = APonVisiblesSI
        end
        object TButtTodoInvisible: TToolButton
          Left = 356
          Top = 2
          Action = APonVisiblesNO
        end
        object TBSep2: TToolButton
          Left = 379
          Top = 2
          Width = 8
          ImageIndex = 23
          Style = tbsSeparator
        end
        object TBIniciar: TToolButton
          Left = 387
          Top = 2
          Action = AIniciar
        end
        object TBFinalizar: TToolButton
          Left = 410
          Top = 2
          Action = AFinalizar
        end
        object TBSep5: TToolButton
          Left = 433
          Top = 2
          Width = 8
          ImageIndex = 7
          Style = tbsSeparator
        end
        object TBPausaReanuda: TToolButton
          Left = 441
          Top = 2
          Action = APausarReanudar
        end
      end
      object PNLPausas: TLFPanel
        Left = 0
        Top = 208
        Width = 864
        Height = 137
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PNLPausas'
        TabOrder = 2
        object TBPausas: TLFToolBar
          Left = 0
          Top = 0
          Width = 864
          Height = 29
          EdgeBorders = []
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object LTituloPausa: TLFLabel
            Left = 0
            Top = 2
            Width = 53
            Height = 22
            Caption = 'Pausas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
        end
        object PNLPausaDesc: TLFPanel
          Left = 494
          Top = 29
          Width = 370
          Height = 108
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object PNLIncidencia: TLFPanel
            Left = 0
            Top = 0
            Width = 370
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              370
              22)
            object DBECodIncidencia: TLFDbedit
              Left = 1
              Top = 1
              Width = 56
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO_INCIDENCIA'
              DataSource = DMHojaDeTrabajo.DSxPausas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = DBECodIncidenciaChange
            end
            object ETituloIncidencia: TLFEdit
              Left = 58
              Top = 1
              Width = 312
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object DBMComentarioPausa: TLFDBMemo
            Left = 0
            Top = 22
            Width = 370
            Height = 86
            Align = alClient
            Color = clInfoBk
            DataField = 'COMENTARIO'
            DataSource = DMHojaDeTrabajo.DSxPausas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object DBGPausas: TDBGridFind2000
          Left = 0
          Top = 29
          Width = 494
          Height = 108
          Align = alClient
          DataSource = DMHojaDeTrabajo.DSxPausas
          TabOrder = 2
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
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PAUSA_TRABAJO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_HOJA_TRABAJO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tipo Incidencia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INICIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FINAL'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 564
    Width = 868
  end
  inherited CEMain: TControlEdit
    Left = 624
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 660
    Top = 8
  end
  inherited ALMain: TLFActionList
    Left = 696
    Top = 8
    object ARefrescar: TAction
      Category = 'Otros'
      Caption = 'Refrescar'
      Hint = 'Refresca los datos'
      ImageIndex = 26
      OnExecute = ARefrescarExecute
    end
    object ASubirPrioridad: TAction
      Category = 'Orden'
      Caption = 'Subir Prioridad'
      Hint = 'Subir Prioridad'
      ImageIndex = 53
      OnExecute = ASubirPrioridadExecute
    end
    object ABajarPrioridad: TAction
      Category = 'Orden'
      Caption = 'Bajar Prioridad'
      Hint = 'Bajar Prioridad'
      ImageIndex = 52
      OnExecute = ABajarPrioridadExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Orden'
      Caption = 'Orden'
      ImageIndex = 122
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Filtro'
      Caption = 'Filtro'
      ImageIndex = 5
    end
    object ATodos: TAction
      Category = 'Filtro'
      Caption = 'Todos'
      Hint = 'Todos'
      ImageIndex = 5
      OnExecute = AFiltroExecute
    end
    object AVisibles: TAction
      Tag = 1
      Category = 'Filtro'
      Caption = 'Visibles'
      Hint = 'Visibles'
      ImageIndex = 5
      OnExecute = AFiltroExecute
    end
    object ANoVisibles: TAction
      Tag = 2
      Category = 'Filtro'
      Caption = 'No Visibles'
      Hint = 'No Visibles'
      ImageIndex = 5
      OnExecute = AFiltroExecute
    end
    object AIniciados: TAction
      Tag = 3
      Category = 'Filtro'
      Caption = 'Iniciados'
      Hint = 'Iniciados'
      ImageIndex = 5
      OnExecute = AFiltroExecute
    end
    object ACerrados: TAction
      Tag = 4
      Category = 'Filtro'
      Caption = 'Cerrados'
      Hint = 'Cerrados'
      ImageIndex = 5
      OnExecute = AFiltroExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AEditaNotas: TAction
      Category = 'Otros'
      Caption = 'Edita Notas'
      Hint = 'Edita Notas'
      ImageIndex = 18
      OnExecute = AEditaNotasExecute
    end
    object APonVisiblesSI: TAction
      Category = 'Otros'
      Caption = 'Hacer Visibles'
      Hint = 'Hacer Visibles todas las Hojas'
      ImageIndex = 23
      OnExecute = APonVisiblesSIExecute
    end
    object APonVisiblesNO: TAction
      Category = 'Otros'
      Caption = 'Hacer Invisibles'
      Hint = 'Hacer Invisibles todas las Hojas'
      ImageIndex = 22
      OnExecute = APonVisiblesNOExecute
    end
    object ALimpiaYOrdena: TAction
      Category = 'Orden'
      Caption = 'Elimina hojas antiguas'
      Hint = 'Elimina hojas antiguas y reordena todas las prioridades'
      ImageIndex = 39
      OnExecute = ALimpiaYOrdenaExecute
    end
    object AIniciar: TAction
      Category = 'Otros'
      Caption = 'Iniciar Hoja'
      Hint = 'Iniciar Hoja'
      ImageIndex = 7
      OnExecute = AIniciarExecute
    end
    object AFinalizar: TAction
      Category = 'Otros'
      Caption = 'Finalizar Hoja'
      Hint = 'Finalizar Hoja'
      ImageIndex = 6
      OnExecute = AFinalizarExecute
    end
    object APausarReanudar: TAction
      Category = 'Otros'
      Caption = 'Se pausa o se reanuda una trarea'
      Hint = 'Se pausa o se reanuda una trarea'
      ImageIndex = 8
      OnExecute = APausarReanudarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 730
    Top = 8
  end
end
