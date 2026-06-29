object ProDMReloj: TProDMReloj
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 347
  Top = 103
  Height = 519
  Width = 454
  object xDescRecurso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Titulo,importe'
      'From Pro_Recursos'
      'Where Recurso=?Recurso and Empresa=?Empresa')
    UniDirectional = False
    Left = 32
    Top = 132
    object xDescRecursoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xDescRecursoIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object DSxDescRecurso: TDataSource
    DataSet = xDescRecurso
    Left = 116
    Top = 132
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 236
    Top = 16
  end
  object DSxRecursos: TDataSource
    DataSet = xRecursos
    Left = 117
    Top = 80
  end
  object QMProDetMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_DET_MARCA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,RIG_OF,SUBORDEN,' +
        'LINEA_FASE,LINEA_TAREA,FECHA_PREV,FECHA_REAL,NUM_REF_SAL,HORA_IN' +
        'ICIO,HORA_FIN,TIEMPO,RECURSO,PRECIO_RECURSO,TIPO_RECURSO,UNIDADE' +
        'S_FAB,UNIDADES_DEFECTUOSAS,ESTADO,NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?RIG_OF,?' +
        'SUBORDEN,?LINEA_FASE,?LINEA_TAREA,?FECHA_PREV,?FECHA_REAL,?NUM_R' +
        'EF_SAL,?HORA_INICIO,?HORA_FIN,?TIEMPO,?RECURSO,?PRECIO_RECURSO,?' +
        'TIPO_RECURSO,?UNIDADES_FAB,?UNIDADES_DEFECTUOSAS,?ESTADO,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA'
      'Where empresa=?empresa and'
      '            ejercicio=?ejercicio and'
      '            canal=?canal and'
      '            serie=?serie and'
      '            tipo=?tipo and'
      '            rig=?rig'
      '            ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_DET_MARCA'
      'SET'
      '  RIG_OF=?RIG_OF '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,FECHA_PREV=?FECHA_PREV '
      '  ,FECHA_REAL=?FECHA_REAL '
      '  ,NUM_REF_SAL=?NUM_REF_SAL '
      '  ,HORA_INICIO=?HORA_INICIO '
      '  ,HORA_FIN=?HORA_FIN '
      '  ,TIEMPO=?TIEMPO '
      '  ,RECURSO=?RECURSO '
      '  ,PRECIO_RECURSO=?PRECIO_RECURSO '
      '  ,TIPO_RECURSO=?TIPO_RECURSO '
      '  ,UNIDADES_FAB=?UNIDADES_FAB '
      '  ,UNIDADES_DEFECTUOSAS=?UNIDADES_DEFECTUOSAS '
      '  ,ESTADO=?ESTADO '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
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
    TableName = 'PRO_ORD_DET_MARCA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 19
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
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
    object QMProDetMarcaPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
    end
    object QMProDetMarcaTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Rec.'
      FieldName = 'TIPO_RECURSO'
      Size = 3
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
    object QMProDetMarcaDescripFase: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripFase'
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripTarea: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripTarea'
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripRec: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripRec'
      Size = 60
      Calculated = True
    end
  end
  object DSQMProDetMarca: TDataSource
    DataSet = QMProDetMarca
    Left = 128
    Top = 19
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 268
    Top = 96
  end
  object xConfigDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_config_det_marca'
      'where empresa=?empresa and rig=?rig'
      'order by orden')
    UniDirectional = False
    DataSource = DSxConfigCab
    Left = 32
    Top = 346
    object xConfigDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xConfigDetRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xConfigDetLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xConfigDetORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xConfigDetCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 60
    end
    object xConfigDetLONG_INI: TIntegerField
      DisplayLabel = 'Long. Ini.'
      FieldName = 'LONG_INI'
    end
    object xConfigDetLONG_FIN: TIntegerField
      DisplayLabel = 'Long. Fin.'
      FieldName = 'LONG_FIN'
    end
    object xConfigDetTABLA_FISICA: TFIBStringField
      DisplayLabel = 'Tabla Fisica'
      FieldName = 'TABLA_FISICA'
      Size = 40
    end
    object xConfigDetCAMPO_FISICO: TFIBStringField
      DisplayLabel = 'Campo Fisico'
      FieldName = 'CAMPO_FISICO'
      Size = 40
    end
    object xConfigDetTIPOMARC: TFIBStringField
      DisplayLabel = 'Tipo Arc.'
      FieldName = 'TIPOMARC'
      Size = 15
    end
  end
  object QMGeneral: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 52
    Top = 204
  end
  object QRecogerIdTarea: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select id_orden,rig_of,suborden,linea_fase,linea_tarea,recurso,'
      '    pre_cos_uni_pre,estado,identificador'
      '  from pro_ord_tarea'
      '  where identificador=:IDTarea')
    Transaction = TLocal
    AutoTrans = True
    Left = 268
    Top = 149
  end
  object QComprobarDatos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 368
    Top = 95
  end
  object xUltimoJornada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*Select dinamica*/'
      'select cab.fecha,det.rig,det.linea,det.hora_inicio,det.hora_fin'
      'from pro_ord_cab_marca cab '
      'join pro_ord_det_marca det on'
      '(cab.empresa=det.empresa and cab.ejercicio=det.ejercicio and '
      ' cab.canal=det.canal and cab.serie=det.serie'
      ' and cab.tipo=det.tipo and cab.rig=det.rig)'
      'where cab.empresa=?empresa and cab.operario=?operario'
      'order by det.rig,det.linea')
    UniDirectional = False
    Left = 136
    Top = 396
    object xUltimoJornadaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xUltimoJornadaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xUltimoJornadaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xUltimoJornadaHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INICIO'
    end
    object xUltimoJornadaHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
  end
  object xHorario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select horario, linea, titulo, hora_ini, hora_fin, hora_producti' +
        'va '
      '  from ope_horarios_det'
      
        '  where empresa=?empresa and horario=?horario and hora_productiv' +
        'a=1'
      '  order by linea')
    UniDirectional = False
    Left = 224
    Top = 396
    object xHorarioHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object xHorarioLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xHorarioTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xHorarioHORA_INI: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INI'
    end
    object xHorarioHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
    object xHorarioHORA_PRODUCTIVA: TIntegerField
      DisplayLabel = 'Hora Productiva'
      FieldName = 'HORA_PRODUCTIVA'
    end
  end
  object xOperario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ope_empleado'
      'where empresa=?empresa and empleado=?empleado')
    UniDirectional = False
    Left = 136
    Top = 340
    object xOperarioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xOperarioEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xOperarioTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xOperarioCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object xOperarioCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object xOperarioDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object xOperarioSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xOperarioCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object xOperarioN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'Nro. Seg. Social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object xOperarioTIPO_CONTRATO: TFIBStringField
      DisplayLabel = 'Tipo Contrato'
      FieldName = 'TIPO_CONTRATO'
      Size = 3
    end
    object xOperarioINI_CONTRATO: TDateTimeField
      DisplayLabel = 'Ini. Contrato'
      FieldName = 'INI_CONTRATO'
    end
    object xOperarioFIN_CONTRATO: TDateTimeField
      DisplayLabel = 'Fin Contrato'
      FieldName = 'FIN_CONTRATO'
    end
    object xOperarioFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
    end
    object xOperarioESTADO_CIVIL: TFIBStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 15
    end
    object xOperarioNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xOperarioIMAGEN: TMemoField
      FieldName = 'IMAGEN'
      BlobType = ftMemo
      Size = 8
    end
    object xOperarioCODIGO_TARJETA: TFIBStringField
      DisplayLabel = 'Tarjeta'
      FieldName = 'CODIGO_TARJETA'
      Size = 25
    end
    object xOperarioUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xOperarioRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
    object xOperarioIMPUTACION: TIntegerField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
    end
    object xOperarioTIPOIMPUTACION: TIntegerField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPOIMPUTACION'
    end
    object xOperarioHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
  end
  object xNumLinea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Max(LINEA) As NLinea From PRO_ORD_DET_MARCA '
      'Where (EMPRESA=?EMPRESA and EJERCICIO=?Ejercicio and'
      'CANAL=?Canal and SERIE=?Serie and Tipo=?Tipo and RIG=?Rig)')
    UniDirectional = False
    Left = 128
    Top = 204
    object xNumLineaNLINEA: TIntegerField
      DisplayLabel = 'Nro. Linea'
      FieldName = 'NLINEA'
    end
  end
  object xConfigCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_config_cab_marca'
      'where empresa=?empresa and rig=?rig')
    UniDirectional = False
    AfterOpen = xConfigCabAfterOpen
    Left = 32
    Top = 294
    object xConfigCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xConfigCabRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xConfigCabDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xConfigCabNOTES: TMemoField
      FieldName = 'NOTES'
      BlobType = ftMemo
      Size = 8
    end
    object xConfigCabFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xConfigCabRUTA: TFIBStringField
      DisplayLabel = 'Carpeta'
      FieldName = 'RUTA'
      Size = 200
    end
    object xConfigCabRUTAINC: TFIBStringField
      DisplayLabel = 'Ruta Inc.'
      FieldName = 'RUTAINC'
      Size = 200
    end
    object xConfigCabRUTADEST: TFIBStringField
      DisplayLabel = 'Ruta Dest.'
      FieldName = 'RUTADEST'
      Size = 200
    end
    object xConfigCabTIPOMARCAJE: TIntegerField
      DisplayLabel = 'Tipo Marcaje'
      FieldName = 'TIPOMARCAJE'
    end
    object xConfigCabRUTACONFIG: TFIBStringField
      DisplayLabel = 'Ruta Conf.'
      FieldName = 'RUTACONFIG'
      Size = 200
    end
    object xConfigCabTIPORECURSO: TFIBStringField
      DisplayLabel = 'Tipo Curso'
      FieldName = 'TIPORECURSO'
      Size = 3
    end
  end
  object xRecursos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_RECURSOS'
      'Where Empresa=?Empresa')
    UniDirectional = False
    Left = 32
    Top = 80
    object xRecursosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecursosRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xRecursosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xRecursosUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object xRecursosTIPORECURSO: TFIBStringField
      DisplayLabel = 'Tipo Curso'
      FieldName = 'TIPORECURSO'
      Size = 3
    end
    object xRecursosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object xHorarioDia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*Select DINAMICA: por operario o maquina*/'
      
        'select * from ope_dame_horario_empleado (?empresa, ?empleado, ?f' +
        'echa)')
    UniDirectional = False
    Left = 224
    Top = 344
    object xHorarioDiaHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
  end
  object DSxConfigCab: TDataSource
    DataSet = xConfigCab
    Left = 104
    Top = 293
  end
end
