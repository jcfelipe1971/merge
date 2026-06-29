object ProDMTrabExt: TProDMTrabExt
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 630
  Top = 277
  Height = 295
  Width = 558
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 344
    Top = 16
  end
  object QMTrabExt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_TAREA_TEX'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  LINEA_TAREA=?old_LINEA_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_TAREA_TEX'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG_OF,SUBORDEN,LINEA_FASE,LINE' +
        'A_TAREA,ID_ORDEN,ID_E_PEDIDO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG_OF,?SUBORDEN,?LINEA_FA' +
        'SE,?LINEA_TAREA,?ID_ORDEN,?ID_E_PEDIDO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_TAREA_TEX'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_TAREA_TEX'
      'where id_orden=?id_orden and linea_fase=?linea_fase'
      '   and linea_tarea=?linea_tarea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_TAREA_TEX'
      'SET'
      '  SUBORDEN=?SUBORDEN '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_E_PEDIDO=?ID_E_PEDIDO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    AfterOpen = QMTrabExtAfterOpen
    BeforeClose = QMTrabExtBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG_OF '
      'LINEA_FASE '
      'LINEA_TAREA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA_TEX'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMTrabExtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTrabExtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTrabExtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTrabExtSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTrabExtRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMTrabExtSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMTrabExtLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMTrabExtLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMTrabExtID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMTrabExtID_E_PEDIDO: TIntegerField
      DisplayLabel = 'ID Ped.'
      FieldName = 'ID_E_PEDIDO'
    end
  end
  object DSQMTrabExt: TDataSource
    DataSet = QMTrabExt
    Left = 136
    Top = 16
  end
  object xTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ord_tarea'
      'where id_orden=?id_orden and linea_fase=?linea_fase'
      'and linea_tarea=?linea_tarea')
    UniDirectional = False
    DataSource = DSQMTrabExt
    Left = 48
    Top = 112
    object xTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTareaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTareaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTareaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTareaRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xTareaSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xTareaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xTareaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xTareaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xTareaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xTareaCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xTareaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xTareaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xTareaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xTareaPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Previsto'
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object xTareaTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Previsto'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object xTareaPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Previsto'
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object xTareaTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Previsto Horas'
      FieldName = 'TOTAL_PRE'
    end
    object xTareaPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Coste Unit. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object xTareaTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object xTareaPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object xTareaTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object xTareaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xTareaFECHA_FIN_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Fin Tarea'
      FieldName = 'FECHA_FIN_TAREA'
    end
    object xTareaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object xTareaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xTareaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xTareaCANTIDAD_UTIL: TFloatField
      DisplayLabel = 'Cant. Horas'
      FieldName = 'CANTIDAD_UTIL'
    end
    object xTareaID_UTILLAJE: TFIBStringField
      DisplayLabel = 'ID'
      FieldName = 'ID_UTILLAJE'
      Size = 3
    end
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 136
    Top = 112
  end
  object xFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ord_fases'
      'where id_orden=?id_orden and linea_fase=?linea_fase')
    UniDirectional = False
    DataSource = DSQMTrabExt
    Left = 48
    Top = 64
    object xFaseEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFaseEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFaseCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFaseSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object xFaseRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xFaseSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xFaseLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xFaseFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xFaseORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xFaseTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object xFaseNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xFaseDIBUJO: TFIBStringField
      DisplayLabel = 'Dibujo'
      FieldName = 'DIBUJO'
      Size = 100
    end
    object xFaseESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xFaseVALORCALIDAD: TIntegerField
      DisplayLabel = 'Valor Calidad'
      FieldName = 'VALORCALIDAD'
    end
    object xFaseFECHA_FIN_FASE: TDateTimeField
      DisplayLabel = 'Fec. Fin Fase'
      FieldName = 'FECHA_FIN_FASE'
    end
    object xFaseENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xFaseID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object DSxFase: TDataSource
    DataSet = xFase
    Left = 136
    Top = 64
  end
  object xPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_cabeceras_pedido_prov'
      'where id_e=?id_e_pedido')
    UniDirectional = False
    DataSource = DSQMTrabExt
    Left = 48
    Top = 160
    object xPedidoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedidoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedidoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedidoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedidoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedidoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPedidoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xPedidoMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xPedidoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPedidoPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xPedidoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xPedidoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPedidoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xPedidoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xPedidoBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xPedidoLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xPedidoBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xPedidoI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xPedidoS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xPedidoS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xPedidoS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xPedidoB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xPedidoDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xPedidoDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xPedidoI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xPedidoI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xPedidoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xPedidoENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xPedidoNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xPedidoPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xPedidoI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xPedidoFORMA_DE_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_DE_PAGO'
      Size = 3
    end
    object xPedidoSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xPedidoID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xPedidoFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PRE_CAB'
    end
    object xPedidoFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
    end
  end
  object DSxPedido: TDataSource
    DataSet = xPedido
    Left = 136
    Top = 160
  end
  object xAlbaranes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select pro.id_e_albaran,alb.rig, alb.fecha from pro_ord_tarea_te' +
        'x_alb pro'
      
        'join ver_cabeceras_albaran_prov alb on (pro.id_e_albaran=alb.id_' +
        'e)'
      'where id_e_pedido=?id_e_pedido'
      'order by alb.rig')
    UniDirectional = False
    DataSource = DSQMTrabExt
    Left = 48
    Top = 208
    object xAlbaranesRIG: TIntegerField
      DisplayLabel = 'N'#186' Albaran'
      FieldName = 'RIG'
    end
    object xAlbaranesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAlbaranesID_E_ALBARAN: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_E_ALBARAN'
    end
  end
  object DSxAlbaranes: TDataSource
    DataSet = xAlbaranes
    Left = 136
    Top = 208
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 344
    Top = 64
  end
end
