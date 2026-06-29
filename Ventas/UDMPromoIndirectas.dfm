object DMPromoIndirectas: TDMPromoIndirectas
  OldCreateOrder = False
  OnCreate = DMPromoIndirectasCreate
  OnDestroy = DataModuleDestroy
  Left = 579
  Top = 287
  Height = 334
  Width = 393
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 280
    Top = 8
  end
  object QMPromociones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_PROMOCIONES'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_PROMOCIONES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_DETALLES_S,EN' +
        'TRADA,ARTICULO,TITULO,UNIDADES,PRECIO,MARCADO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_DETAL' +
        'LES_S,?ENTRADA,?ARTICULO,?TITULO,?UNIDADES,?PRECIO,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_PROMOCIONES'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_PROMOCIONES'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_PROMOCIONES'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_PROMOCIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMPromocionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPromocionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPromocionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPromocionesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMPromocionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPromocionesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMPromocionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPromocionesID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMPromocionesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMPromocionesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPromocionesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMPromocionesUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMPromocionesPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMPromocionesMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
  end
  object DSQMPromociones: TDataSource
    DataSet = QMPromociones
    Left = 136
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 328
    Top = 8
  end
end
