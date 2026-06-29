object DMTPVSesionCajaTurno: TDMTPVSesionCajaTurno
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 110
  Height = 270
  Width = 463
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 344
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 344
    Top = 56
  end
  object xSesion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TPV_SESIONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  SESION=?old_SESION ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TPV_SESIONES'
      
        '  (B_IMPONIBLE,TOTAL_SESION,FECHA_INICIO,FECHA_FIN,I_IVA,SESION,' +
        'SERIE,EMPRESA,EJERCICIO,CANAL,ABIERTA,USUARIO_ABRE,USUARIO_CIERR' +
        'A)'
      'VALUES'
      
        '  (?B_IMPONIBLE,?TOTAL_SESION,?FECHA_INICIO,?FECHA_FIN,?I_IVA,?S' +
        'ESION,?SERIE,?EMPRESA,?EJERCICIO,?CANAL,?ABIERTA,?USUARIO_ABRE,?' +
        'USUARIO_CIERRA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_SESIONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION ')
    SelectSQL.Strings = (
      'SELECT '
      '  * '
      'FROM GES_TPV_SESIONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND'
      '  ABIERTA = 1'
      'ORDER BY SESION DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_SESIONES'
      'SET'
      '  B_IMPONIBLE=?B_IMPONIBLE '
      '  ,TOTAL_SESION=?TOTAL_SESION '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,I_IVA=?I_IVA '
      '  ,ABIERTA=?ABIERTA '
      '  ,USUARIO_ABRE=?USUARIO_ABRE '
      '  ,USUARIO_CIERRA=?USUARIO_CIERRA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION ')
    AfterOpen = xSesionAfterOpen
    BeforeClose = xSesionBeforeClose
    OnNewRecord = xSesionNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'SESION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_SESIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object xSesionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSesionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSesionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSesionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSesionSESION: TIntegerField
      DisplayLabel = 'Sesion'
      FieldName = 'SESION'
    end
    object xSesionABIERTA: TIntegerField
      DisplayLabel = 'Abierta'
      FieldName = 'ABIERTA'
    end
    object xSesionI_IVA: TFloatField
      DisplayLabel = 'Importe IVA'
      FieldName = 'I_IVA'
    end
    object xSesionB_IMPONIBLE: TFloatField
      DisplayLabel = 'Base Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xSesionTOTAL_SESION: TFloatField
      DisplayLabel = 'Total Sesion'
      FieldName = 'TOTAL_SESION'
    end
    object xSesionFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object xSesionFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object xSesionUSUARIO_ABRE: TIntegerField
      DisplayLabel = 'Usuario Apertura'
      FieldName = 'USUARIO_ABRE'
    end
    object xSesionUSUARIO_CIERRA: TIntegerField
      DisplayLabel = 'Usuario Cierre'
      FieldName = 'USUARIO_CIERRA'
    end
  end
  object DSxSesion: TDataSource
    DataSet = xSesion
    Left = 144
    Top = 8
  end
  object xCaja: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TPV_SESIONES_CAJAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  SESION=?old_SESION AND '
      '  CAJA=?old_CAJA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TPV_SESIONES_CAJAS'
      
        '  (I_IVA,B_IMPONIBLE,TOTAL_SESION,FECHA_INICIO,FECHA_FIN,SESION,' +
        'CAJA,SERIE,EMPRESA,EJERCICIO,CANAL,ABIERTA,USUARIO_ABRE,USUARIO_' +
        'CIERRA)'
      'VALUES'
      
        '  (?I_IVA,?B_IMPONIBLE,?TOTAL_SESION,?FECHA_INICIO,?FECHA_FIN,?S' +
        'ESION,?CAJA,?SERIE,?EMPRESA,?EJERCICIO,?CANAL,?ABIERTA,?USUARIO_' +
        'ABRE,?USUARIO_CIERRA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_SESIONES_CAJAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION AND '
      '  CAJA=?CAJA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_SESIONES_CAJAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION'
      'ORDER BY CAJA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_SESIONES_CAJAS'
      'SET'
      '  I_IVA=?I_IVA '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,TOTAL_SESION=?TOTAL_SESION '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,ABIERTA=?ABIERTA '
      '  ,USUARIO_ABRE=?USUARIO_ABRE '
      '  ,USUARIO_CIERRA=?USUARIO_CIERRA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION AND '
      '  CAJA=?CAJA ')
    DataSource = DSxSesion
    AfterOpen = xCajaAfterOpen
    BeforeClose = xCajaBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'SESION '
      'CAJA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_SESIONES_CAJAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object xCajaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCajaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCajaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCajaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xCajaSESION: TIntegerField
      DisplayLabel = 'Sesion'
      FieldName = 'SESION'
    end
    object xCajaCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object xCajaABIERTA: TIntegerField
      DisplayLabel = 'Abierta'
      FieldName = 'ABIERTA'
    end
    object xCajaI_IVA: TFloatField
      DisplayLabel = 'Importe IVA'
      FieldName = 'I_IVA'
    end
    object xCajaB_IMPONIBLE: TFloatField
      DisplayLabel = 'Base Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xCajaTOTAL_SESION: TFloatField
      DisplayLabel = 'Total Sesion'
      FieldName = 'TOTAL_SESION'
    end
    object xCajaFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object xCajaFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object xCajaUSUARIO_ABRE: TIntegerField
      DisplayLabel = 'Usuario Apertura'
      FieldName = 'USUARIO_ABRE'
    end
    object xCajaUSUARIO_CIERRA: TIntegerField
      DisplayLabel = 'Usuario Cierre'
      FieldName = 'USUARIO_CIERRA'
    end
  end
  object DSxCaja: TDataSource
    DataSet = xCaja
    Left = 144
    Top = 56
  end
  object xTurno: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TPV_SESIONES_CAJAS_TURNO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  SESION=?old_SESION AND '
      '  CAJA=?old_CAJA AND '
      '  TURNO=?old_TURNO ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TPV_SESIONES_CAJAS_TURNO'
      
        '  (CAMBIO_ENTREGADO,FECHA_FIN,FECHA_INICIO,TOTAL_TURNO,B_IMPONIB' +
        'LE,I_IVA,DIFERENCIA,SALDO,CAJA,SESION,SERIE,USUARIO_CIERRA,USUAR' +
        'IO_ABRE,TURNO,ABIERTO,CANAL,EJERCICIO,EMPRESA)'
      'VALUES'
      
        '  (?CAMBIO_ENTREGADO,?FECHA_FIN,?FECHA_INICIO,?TOTAL_TURNO,?B_IM' +
        'PONIBLE,?I_IVA,?DIFERENCIA,?SALDO,?CAJA,?SESION,?SERIE,?USUARIO_' +
        'CIERRA,?USUARIO_ABRE,?TURNO,?ABIERTO,?CANAL,?EJERCICIO,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_SESIONES_CAJAS_TURNO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION AND '
      '  CAJA=?CAJA AND '
      '  TURNO=?TURNO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_SESIONES_CAJAS_TURNO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION AND '
      '  CAJA=?CAJA'
      'ORDER BY TURNO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_SESIONES_CAJAS_TURNO'
      'SET'
      '  CAMBIO_ENTREGADO=?CAMBIO_ENTREGADO '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,TOTAL_TURNO=?TOTAL_TURNO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_IVA=?I_IVA '
      '  ,DIFERENCIA=?DIFERENCIA '
      '  ,SALDO=?SALDO '
      '  ,USUARIO_CIERRA=?USUARIO_CIERRA '
      '  ,USUARIO_ABRE=?USUARIO_ABRE '
      '  ,ABIERTO=?ABIERTO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  SESION=?SESION AND '
      '  CAJA=?CAJA AND '
      '  TURNO=?TURNO ')
    DataSource = DSxCaja
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'SESION '
      'CAJA '
      'TURNO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_SESIONES_CAJAS_TURNO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object xTurnoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTurnoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTurnoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTurnoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTurnoSESION: TIntegerField
      DisplayLabel = 'Sesion'
      FieldName = 'SESION'
    end
    object xTurnoCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object xTurnoTURNO: TIntegerField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
    end
    object xTurnoABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
    object xTurnoI_IVA: TFloatField
      DisplayLabel = 'Importe IVA'
      FieldName = 'I_IVA'
    end
    object xTurnoB_IMPONIBLE: TFloatField
      DisplayLabel = 'Base Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xTurnoTOTAL_TURNO: TFloatField
      DisplayLabel = 'Total Turno'
      FieldName = 'TOTAL_TURNO'
    end
    object xTurnoFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object xTurnoFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object xTurnoUSUARIO_ABRE: TIntegerField
      DisplayLabel = 'Usuario Apertura'
      FieldName = 'USUARIO_ABRE'
    end
    object xTurnoUSUARIO_CIERRA: TIntegerField
      DisplayLabel = 'Usuario Cierre'
      FieldName = 'USUARIO_CIERRA'
    end
    object xTurnoCAMBIO_ENTREGADO: TFloatField
      DisplayLabel = 'Cambio Entregado'
      FieldName = 'CAMBIO_ENTREGADO'
    end
    object xTurnoDIFERENCIA: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'DIFERENCIA'
    end
    object xTurnoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxTurno: TDataSource
    DataSet = xTurno
    Left = 144
    Top = 104
  end
end
