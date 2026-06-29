object DMNomConceptosCHL: TDMNomConceptosCHL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 281
  Top = 376
  Height = 418
  Width = 599
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 472
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 408
    Top = 8
  end
  object DSQMParametro: TDataSource
    DataSet = QMParametro
    Left = 192
    Top = 8
  end
  object QMParametro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONCEPTO_PARAMETROS'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONCEPTO_PARAMETROS'
      
        '  (EMPRESA,EJERCICIO,CANAL,CODIGO,GLOSA,CALCULABLE,TIPO_DATO,ES_' +
        'TOTAL,VISIBLE_EN_EMPLEADO,CUENTA,SIGNO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?CODIGO,?GLOSA,?CALCULABLE,?TIPO_D' +
        'ATO,?ES_TOTAL,?VISIBLE_EN_EMPLEADO,?CUENTA,?SIGNO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONCEPTO_PARAMETROS'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONCEPTO_PARAMETROS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONCEPTO_PARAMETROS'
      'SET'
      '  GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,TIPO_DATO=?TIPO_DATO '
      '  ,ES_TOTAL=?ES_TOTAL '
      '  ,VISIBLE_EN_EMPLEADO=?VISIBLE_EN_EMPLEADO '
      ' ,CUENTA=?CUENTA '
      ' ,SIGNO=?SIGNO '
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMParametroNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONCEPTO_PARAMETROS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMParametroEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMParametroEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMParametroCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMParametroCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMParametroGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMParametroCALCULABLE: TIntegerField
      DisplayLabel = 'Calculable'
      FieldName = 'CALCULABLE'
    end
    object QMParametroTIPO_DATO: TFIBStringField
      DisplayLabel = 'Tipo de Dato'
      FieldName = 'TIPO_DATO'
      Size = 15
    end
    object QMParametroES_TOTAL: TIntegerField
      DisplayLabel = 'Es Total'
      FieldName = 'ES_TOTAL'
    end
    object QMParametroVISIBLE_EN_EMPLEADO: TIntegerField
      DisplayLabel = 'Visible Empleado'
      FieldName = 'VISIBLE_EN_EMPLEADO'
    end
    object QMParametroORDEN_IMPRESION: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN_IMPRESION'
    end
    object QMParametroCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      OnChange = QMParametroCUENTAChange
      Size = 15
    end
    object QMParametroSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMParametroTIPO_PARAMETRO: TFIBStringField
      DisplayLabel = 'Tipo Parametro'
      FieldName = 'TIPO_PARAMETRO'
      Size = 3
    end
  end
  object QMHaber: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONCEPTO_HABERES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONCEPTO_HABERES'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,CODIGO,GLOSA,CALCULABLE,ES_IMPONIBL' +
        'E,MOSTRAR_IMPRESION,ORDEN_IMPRESION,ES_TOTAL,VISIBLE_EN_EMPLEADO' +
        ','#13#10'CUENTA,SIGNO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?CODIGO,?GLOSA,?CALCULABLE,?ES_I' +
        'MPONIBLE,?MOSTRAR_IMPRESION,?ORDEN_IMPRESION,?ES_TOTAL,?VISIBLE_' +
        'EN_EMPLEADO,'#13#10'?CUENTA,?SIGNO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONCEPTO_HABERES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONCEPTO_HABERES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONCEPTO_HABERES'
      'SET'
      '  GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,ES_IMPONIBLE=?ES_IMPONIBLE '
      '  ,MOSTRAR_IMPRESION=?MOSTRAR_IMPRESION '
      '  ,ORDEN_IMPRESION=?ORDEN_IMPRESION '
      '  ,ES_TOTAL=?ES_TOTAL '
      '  ,VISIBLE_EN_EMPLEADO=?VISIBLE_EN_EMPLEADO '
      '  ,CUENTA=?CUENTA '
      '  ,SIGNO=?SIGNO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO ')
    OnNewRecord = QMHaberNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONCEPTO_HABERES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMHaberEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMHaberEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMHaberCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMHaberCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMHaberGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMHaberCALCULABLE: TIntegerField
      DisplayLabel = 'Calculable'
      FieldName = 'CALCULABLE'
    end
    object QMHaberES_IMPONIBLE: TIntegerField
      DisplayLabel = 'Imponible'
      FieldName = 'ES_IMPONIBLE'
    end
    object QMHaberMOSTRAR_IMPRESION: TIntegerField
      DisplayLabel = 'Impresi'#243'n'
      FieldName = 'MOSTRAR_IMPRESION'
    end
    object QMHaberORDEN_IMPRESION: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN_IMPRESION'
    end
    object QMHaberES_TOTAL: TIntegerField
      DisplayLabel = 'Es Total'
      FieldName = 'ES_TOTAL'
    end
    object QMHaberVISIBLE_EN_EMPLEADO: TIntegerField
      DisplayLabel = 'Visible Empleado'
      FieldName = 'VISIBLE_EN_EMPLEADO'
    end
    object QMHaberCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      OnChange = QMHaberCUENTAChange
      Size = 15
    end
    object QMHaberSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
  end
  object QMDescuento: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONCEPTO_DESCUENTOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONCEPTO_DESCUENTOS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,CODIGO,GLOSA,CALCULABLE,ES_PERSONAL' +
        ',MOSTRAR_IMPRESION,ORDEN_IMPRESION,ES_TOTAL,VISIBLE_EN_EMPLEADO,' +
        #13#10'CUENTA,SIGNO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?CODIGO,?GLOSA,?CALCULABLE,?ES_P' +
        'ERSONAL,?MOSTRAR_IMPRESION,?ORDEN_IMPRESION,?ES_TOTAL,?VISIBLE_E' +
        'N_EMPLEADO,'#13#10'?CUENTA,?SIGNO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONCEPTO_DESCUENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONCEPTO_DESCUENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONCEPTO_DESCUENTOS'
      'SET'
      '  GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,ES_PERSONAL=?ES_PERSONAL '
      '  ,MOSTRAR_IMPRESION=?MOSTRAR_IMPRESION '
      '  ,ORDEN_IMPRESION=?ORDEN_IMPRESION '
      '  ,ES_TOTAL=?ES_TOTAL '
      '  ,VISIBLE_EN_EMPLEADO=?VISIBLE_EN_EMPLEADO '
      '  ,CUENTA=?CUENTA '
      '  ,SIGNO=?SIGNO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO ')
    OnNewRecord = QMDescuentoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONCEPTO_DESCUENTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object QMDescuentoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDescuentoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDescuentoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDescuentoCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMDescuentoGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMDescuentoCALCULABLE: TIntegerField
      DisplayLabel = 'Calculable'
      FieldName = 'CALCULABLE'
    end
    object QMDescuentoES_PERSONAL: TIntegerField
      DisplayLabel = 'Personal'
      FieldName = 'ES_PERSONAL'
    end
    object QMDescuentoMOSTRAR_IMPRESION: TIntegerField
      DisplayLabel = 'Impresi'#243'n'
      FieldName = 'MOSTRAR_IMPRESION'
    end
    object QMDescuentoORDEN_IMPRESION: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN_IMPRESION'
    end
    object QMDescuentoES_TOTAL: TIntegerField
      DisplayLabel = 'Es Total'
      FieldName = 'ES_TOTAL'
    end
    object QMDescuentoVISIBLE_EN_EMPLEADO: TIntegerField
      DisplayLabel = 'Visible Empleado'
      FieldName = 'VISIBLE_EN_EMPLEADO'
    end
    object QMDescuentoCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      OnChange = QMDescuentoCUENTAChange
      Size = 15
    end
    object QMDescuentoSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
  end
  object DSQMDescuento: TDataSource
    DataSet = QMDescuento
    Left = 192
    Top = 104
  end
  object DSQMHaber: TDataSource
    DataSet = QMHaber
    Left = 192
    Top = 56
  end
end
