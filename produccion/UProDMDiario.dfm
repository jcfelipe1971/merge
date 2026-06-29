object ProDMDiario: TProDMDiario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 371
  Top = 181
  Height = 466
  Width = 463
  object QMProDetMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_VER_DIARIO_MARCAJES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_VER_DIARIO_MARCAJES'
      'Where Empresa=?Empresa and'
      '            Ejercicio=?Ejercicio and'
      '           Canal=?Canal and'
      '           Serie=?Serie and'
      '            Tipo=?Tipo and'
      '           Fecha_Prev>=?FechaD and'
      '           Fecha_Prev<=?FechaH '
      'order by fecha')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_VER_DIARIO_MARCAJES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 24
    object QMProDetMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDetMarcaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProDetMarcaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProDetMarcaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProDetMarcaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProDetMarcaRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMProDetMarcaOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMProDetMarcaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMProDetMarcaPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProDetMarcaVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 5
    end
    object QMProDetMarcaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProDetMarcaTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
    object QMProDetMarcaRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
    object QMProDetMarcaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDetMarcaRIG_OF: TIntegerField
      DisplayLabel = 'Rig_of'
      FieldName = 'RIG_OF'
    end
    object QMProDetMarcaSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProDetMarcaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProDetMarcaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMProDetMarcaFECHA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Prevista'
      FieldName = 'FECHA_PREV'
    end
    object QMProDetMarcaFECHA_REAL: TDateTimeField
      DisplayLabel = 'Fecha Real'
      FieldName = 'FECHA_REAL'
    end
    object QMProDetMarcaNUM_REF_SAL: TIntegerField
      DisplayLabel = 'Ref. Salida'
      FieldName = 'NUM_REF_SAL'
    end
    object QMProDetMarcaHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Inicio'
      FieldName = 'HORA_INICIO'
    end
    object QMProDetMarcaHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
    object QMProDetMarcaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMProDetMarcaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMProDetMarcaPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
    end
    object QMProDetMarcaTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Rec.'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object QMProDetMarcaUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fabricadas'
      FieldName = 'UNIDADES_FAB'
    end
    object QMProDetMarcaUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Unid. Defectuosas'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object QMProDetMarcaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProDetMarcaNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProDetMarcaTOTAL_RECURSO: TFloatField
      DisplayLabel = 'Total Recurso'
      FieldName = 'TOTAL_RECURSO'
    end
    object QMProDetMarcaIDTAREA: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'IDTAREA'
    end
    object QMProDetMarcaIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object QMProDetMarcaTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object QMProDetMarcaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMProDetMarcaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMProDetMarcaNUEVA_TAREA: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object QMProDetMarcaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProDetMarcaEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMProDetMarcaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMProDetMarcaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMProDetMarcaDescripFase: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripFase'
      OnGetText = QMProDetMarcaDescripFaseGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripTarea: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripTarea'
      OnGetText = QMProDetMarcaDescripTareaGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripRec: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripRec'
      OnGetText = QMProDetMarcaDescripRecGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDESC_MAQUINA: TFIBStringField
      DisplayLabel = 'Desc. Maquina'
      FieldName = 'DESC_MAQUINA'
      Size = 100
    end
    object QMProDetMarcaDESC_TE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_TE'
      Size = 60
    end
    object QMProDetMarcaDESC_VARIOS: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_VARIOS'
      Size = 40
    end
    object QMProDetMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object DSQMProDetMarca: TDataSource
    DataSet = QMProDetMarca
    Left = 136
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 232
    Top = 24
  end
  object DSxRecurso: TDataSource
    DataSet = xRecurso
    Left = 136
    Top = 192
  end
  object xRecurso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select RECURSO,TITULO'
      'From Pro_Sys_Recursos'
      'Where Recurso=?TipoRecurso')
    UniDirectional = False
    Left = 32
    Top = 192
    object xRecursoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xTituloFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select titulo'
      'From Pro_sys_fases'
      'Where (Fase=?TipoFase)')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 80
    object xTituloFaseTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select titulo'
      'From Pro_sys_tareas'
      'Where (tarea=?TipoTarea)')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 136
    object xTareaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 136
    Top = 136
  end
  object DSxTituloFase: TDataSource
    DataSet = xTituloFase
    Left = 136
    Top = 80
  end
  object QMProDetMarcaT: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_VER_DIARIO_MARCAJES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT Sum(Unidades_Fab) As TUnds, Sum(Total_Recurso) As TImport' +
        'e, Sum(Tiempo) As TTiempo'
      'FROM PRO_VER_DIARIO_MARCAJES'
      'Where Empresa=?Empresa and'
      '            Ejercicio=?Ejercicio and'
      '           Canal=?Canal and'
      '           Serie=?Serie and'
      '            Tipo=?Tipo and'
      '           Fecha_Prev>=?FechaD and'
      '           Fecha_Prev<=?FechaH '
      'Group by Empresa,Ejercicio,Canal, Serie')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_VER_DIARIO_MARCAJES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 248
    object QMProDetMarcaTTUNDS: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'TUNDS'
    end
    object QMProDetMarcaTTIMPORTE: TFloatField
      DisplayLabel = 'T. Importe'
      FieldName = 'TIMPORTE'
    end
    object QMProDetMarcaTTTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TTIEMPO'
      OnGetText = TransformaHoras
      OnSetText = EscribeHora
    end
  end
  object DSQMProDetMarcaT: TDataSource
    DataSet = QMProDetMarcaT
    Left = 136
    Top = 248
  end
  object xMaquina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Descripcion'
      'From Pro_maquinas_C'
      'Where Empresa=?empresa and codmaq=?maquina')
    UniDirectional = False
    Left = 256
    Top = 264
    object xMaquinaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxMaquina: TDataSource
    DataSet = xMaquina
    Left = 328
    Top = 264
  end
  object xTExt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Titulo'
      'From ver_proveedores'
      'Where Empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and proveedor=?proveedor')
    UniDirectional = False
    Left = 256
    Top = 314
    object xTExtTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSTExt: TDataSource
    DataSet = xTExt
    Left = 328
    Top = 314
  end
  object xVarios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Titulo'
      'From Pro_Recursos'
      'Where Empresa=?Empresa and Recurso=?Varios')
    UniDirectional = False
    Left = 256
    Top = 367
    object xVariosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxVarios: TDataSource
    DataSet = xVarios
    Left = 328
    Top = 367
  end
  object xOperario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Titulo'
      'From VER_EMPLEADOS_EF'
      'Where Empresa=?Empresa and empleado=?empleado')
    UniDirectional = False
    Left = 256
    Top = 223
    object xOperarioTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxOperario: TDataSource
    DataSet = xOperario
    Left = 328
    Top = 223
  end
  object xTituloCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select titulo'
      'From art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 232
    Top = 88
    object xTituloCompuestoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTituloCompuesto: TDataSource
    DataSet = xTituloCompuesto
    Left = 336
    Top = 88
  end
end
