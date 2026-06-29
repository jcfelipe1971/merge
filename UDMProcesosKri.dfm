object DMProcesosKri: TDMProcesosKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 271
  Top = 226
  Height = 225
  Width = 383
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 308
    Top = 22
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 308
    Top = 70
  end
  object DSQMProcesosDetalle: TDataSource
    DataSet = QMProcesosDetalle
    Left = 192
    Top = 72
  end
  object QMProcesosDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_PROCESOS_DET_KRI'
      'WHERE'
      '  AVISO=?old_AVISO AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_PROCESOS_DET_KRI'
      
        '  (ID,AVISO,AVISO_DESTINO,FECHA_INI,USUARIO_FIN,TERCERO,USUARIO,' +
        'FECHA_VAL,FECHA_RESPUESTA,URGENTE,MENSAJE,RESULTADO)'
      'VALUES'
      
        '  (?ID,?AVISO,?AVISO_DESTINO,?FECHA_INI,?USUARIO_FIN,?TERCERO,?U' +
        'SUARIO,?FECHA_VAL,?FECHA_RESPUESTA,?URGENTE,?MENSAJE,?RESULTADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_PROCESOS_DET_KRI'
      'WHERE'
      '  AVISO=?AVISO AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_PROCESOS_DET_KRI'
      'WHERE ID=?ID'
      'ORDER BY ID, AVISO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_PROCESOS_DET_KRI'
      'SET'
      '  AVISO_DESTINO=?AVISO_DESTINO '
      '  ,FECHA_INI=?FECHA_INI '
      '  ,USUARIO_FIN=?USUARIO_FIN '
      '  ,TERCERO=?TERCERO '
      '  ,USUARIO=?USUARIO '
      '  ,FECHA_VAL=?FECHA_VAL '
      '  ,FECHA_RESPUESTA=?FECHA_RESPUESTA '
      '  ,URGENTE=?URGENTE '
      '  ,MENSAJE=?MENSAJE '
      '  ,RESULTADO=?RESULTADO '
      'WHERE'
      '  AVISO=?AVISO AND '
      '  ID=?ID ')
    DataSource = DSQMProcesosCabecera
    BeforePost = QMProcesosDetalleBeforePost
    OnNewRecord = QMProcesosDetalleNewRecord
    ClavesPrimarias.Strings = (
      'AVISO '
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_PROCESOS_DET_KRI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 50
    Top = 72
    object QMProcesosDetalleID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMProcesosDetalleAVISO: TIntegerField
      DisplayLabel = 'Aviso'
      FieldName = 'AVISO'
    end
    object QMProcesosDetalleAVISO_DESTINO: TIntegerField
      DisplayLabel = 'Aviso Dest.'
      FieldName = 'AVISO_DESTINO'
    end
    object QMProcesosDetalleFECHA_INI: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INI'
    end
    object QMProcesosDetalleUSUARIO_FIN: TIntegerField
      DisplayLabel = 'Usu. Fin'
      FieldName = 'USUARIO_FIN'
    end
    object QMProcesosDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMProcesosDetalleUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMProcesosDetalleFECHA_VAL: TDateTimeField
      DisplayLabel = 'Fec. val.'
      FieldName = 'FECHA_VAL'
    end
    object QMProcesosDetalleFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fec. Respuesta'
      FieldName = 'FECHA_RESPUESTA'
    end
    object QMProcesosDetalleURGENTE: TIntegerField
      DisplayLabel = 'Urg.'
      FieldName = 'URGENTE'
    end
    object QMProcesosDetalleMENSAJE: TBlobField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Size = 8
    end
    object QMProcesosDetalleRESULTADO: TBlobField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 8
    end
  end
  object DSQMProcesosCabecera: TDataSource
    DataSet = QMProcesosCabecera
    Left = 192
    Top = 24
  end
  object QMProcesosCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_PROCESOS_CAB_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_PROCESOS_CAB_KRI'
      '  (ID,TITULO)'
      'VALUES'
      '  (?ID,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_PROCESOS_CAB_KRI'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_PROCESOS_CAB_KRI'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_PROCESOS_CAB_KRI'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMProcesosCabeceraBeforePost
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_PROCESOS_CAB_KRI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 50
    Top = 24
    object QMProcesosCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMProcesosCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
  end
end
