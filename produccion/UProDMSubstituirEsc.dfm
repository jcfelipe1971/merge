object ProDMSubstituirEsc: TProDMSubstituirEsc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 658
  Top = 239
  Height = 381
  Width = 444
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 304
    Top = 8
  end
  object QTempSubsEsc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TEMP_SUBS_ESC'
      'WHERE'
      '  ID_ESC=?old_ID_ESC AND '
      '  ENTRADA=?old_ENTRADA AND '
      '  LINEA_MAT=?old_LINEA_MAT ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TEMP_SUBS_ESC'
      
        '  (FECHA,ID_ESC,ESCANDALLO,ENTRADA,LINEA_MAT,ESTADO,MARCADO,EMPR' +
        'ESA,DESC_COMPUESTO,COMPUESTO)'
      'VALUES'
      
        '  (?FECHA,?ID_ESC,?ESCANDALLO,?ENTRADA,?LINEA_MAT,?ESTADO,?MARCA' +
        'DO,?EMPRESA,?DESC_COMPUESTO,?COMPUESTO)')
    RefreshSQL.Strings = (
      
        'SELECT T.*, (SELECT SUM(unidades) FROM PRO_MAT_ESC WHERE ID_ESC ' +
        '= T.ID_ESC AND COMPONENTE = '#39'PARAMETRO'#39') UNIDADES FROM PRO_TEMP_' +
        'SUBS_ESC T'
      'WHERE'
      '  T.ID_ESC=?ID_ESC AND '
      '  T.ENTRADA=?ENTRADA AND '
      '  T.LINEA_MAT=?LINEA_MAT ')
    SelectSQL.Strings = (
      
        'SELECT T.*, (SELECT SUM(unidades) FROM PRO_MAT_ESC WHERE ID_ESC ' +
        '= T.ID_ESC AND COMPONENTE = '#39'PARAMETRO'#39') UNIDADES FROM PRO_TEMP_' +
        'SUBS_ESC T'
      'WHERE'
      'T.EMPRESA = ?EMPRESA AND'
      'T.ENTRADA = ?ENTRADA AND'
      'T.ESTADO = ?ESTADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TEMP_SUBS_ESC'
      'SET'
      '  FECHA=?FECHA '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,ESTADO=?ESTADO '
      '  ,MARCADO=?MARCADO '
      '  ,EMPRESA=?EMPRESA '
      '  ,DESC_COMPUESTO=?DESC_COMPUESTO '
      '  ,COMPUESTO=?COMPUESTO '
      'WHERE'
      '  ID_ESC=?ID_ESC AND '
      '  ENTRADA=?ENTRADA AND '
      '  LINEA_MAT=?LINEA_MAT ')
    ClavesPrimarias.Strings = (
      'ID_ESC '
      'ENTRADA '
      'LINEA_MAT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TEMP_SUBS_ESC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QTempSubsEscID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QTempSubsEscESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QTempSubsEscCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QTempSubsEscFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QTempSubsEscESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QTempSubsEscENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QTempSubsEscMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
      OnChange = QTempSubsEscMARCADOChange
    end
    object QTempSubsEscEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QTempSubsEscDESC_COMPUESTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_COMPUESTO'
      Size = 256
    end
    object QTempSubsEscUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSQTempSubsEsc: TDataSource
    DataSet = QTempSubsEsc
    Left = 168
    Top = 8
  end
  object QMCompuestoDestino: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TEMP_COMPUESTO_DESTINO'
      'WHERE'
      '  COMPONENTE=?old_COMPONENTE AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TEMP_COMPUESTO_DESTINO'
      '  (ENTRADA,COMPONENTE,DESC_COMPONENTE,UNIDADES,ORDEN)'
      'VALUES'
      '  (?ENTRADA,?COMPONENTE,?DESC_COMPONENTE,?UNIDADES,?ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TEMP_COMPUESTO_DESTINO'
      'WHERE'
      '  COMPONENTE=?COMPONENTE AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TEMP_COMPUESTO_DESTINO'
      'WHERE'
      '  ENTRADA=?ENTRADA'
      'ORDER BY COMPONENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TEMP_COMPUESTO_DESTINO'
      'SET'
      '  DESC_COMPONENTE=?DESC_COMPONENTE '
      '  ,UNIDADES=?UNIDADES '
      '  ,ORDEN=?ORDEN '
      '  ,COMPONENTE=?new_COMPONENTE'
      'WHERE'
      '  COMPONENTE=?old_COMPONENTE AND '
      '  ENTRADA=?ENTRADA ')
    BeforePost = QMCompuestoDestinoBeforePost
    OnNewRecord = QMCompuestoDestinoNewRecord
    ClavesPrimarias.Strings = (
      'COMPONENTE '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TEMP_COMPUESTO_DESTINO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMCompuestoDestinoENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCompuestoDestinoCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMCompuestoDestinoCOMPONENTEChange
      Size = 15
    end
    object QMCompuestoDestinoDESC_COMPONENTE: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'DESC_COMPONENTE'
      Size = 256
    end
    object QMCompuestoDestinoUNIDADES: TIntegerField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMCompuestoDestinoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSQMCompuestoDestino: TDataSource
    DataSet = QMCompuestoDestino
    Left = 168
    Top = 104
  end
  object QMCompuestoOrigen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TEMP_COMPUESTO_ORIGEN'
      'WHERE'
      '  COMPONENTE=?old_COMPONENTE AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TEMP_COMPUESTO_ORIGEN'
      '  (ENTRADA,COMPONENTE,DESC_COMPONENTE,MAESTRO)'
      'VALUES'
      '  (?ENTRADA,?COMPONENTE,?DESC_COMPONENTE,?MAESTRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TEMP_COMPUESTO_ORIGEN'
      'WHERE'
      '  COMPONENTE=?COMPONENTE AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TEMP_COMPUESTO_ORIGEN'
      'WHERE'
      '  ENTRADA=?ENTRADA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TEMP_COMPUESTO_ORIGEN'
      'SET'
      '  DESC_COMPONENTE=?DESC_COMPONENTE '
      '  ,MAESTRO=?MAESTRO '
      '  ,COMPONENTE=?new_COMPONENTE '
      'WHERE'
      '  COMPONENTE=?old_COMPONENTE AND '
      '  ENTRADA=?ENTRADA ')
    AfterPost = QMCompuestoOrigenAfterPost
    BeforePost = QMCompuestoOrigenBeforePost
    OnNewRecord = QMCompuestoOrigenNewRecord
    ClavesPrimarias.Strings = (
      'COMPONENTE '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TEMP_COMPUESTO_ORIGEN'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMCompuestoOrigenENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCompuestoOrigenCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMCompuestoOrigenCOMPONENTEChange
      Size = 15
    end
    object QMCompuestoOrigenDESC_COMPONENTE: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'DESC_COMPONENTE'
      Size = 256
    end
    object QMCompuestoOrigenMAESTRO: TIntegerField
      DisplayLabel = 'Maestro'
      FieldName = 'MAESTRO'
    end
  end
  object DSQMCompuestoOrigen: TDataSource
    DataSet = QMCompuestoOrigen
    Left = 168
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 384
    Top = 8
  end
end
