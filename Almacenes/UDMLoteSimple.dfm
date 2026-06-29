object DMLoteSimple: TDMLoteSimple
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 260
  Top = 283
  Height = 150
  Width = 400
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 256
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
    Left = 256
    Top = 56
  end
  object DSQMLoteSimple: TDataSource
    DataSet = QMLoteSimple
    Left = 120
    Top = 8
  end
  object QMLoteSimple: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_LOTE_SIMPLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  LOTE_SIMPLE=?old_LOTE_SIMPLE AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_LOTE_SIMPLE'
      
        '  (EMPRESA,'#13#10'LOTE_SIMPLE,FAMILIA,FECHA_INICIO,NOTAS,FECHA_CADUCI' +
        'DAD,ARTICULO,DISPONIBLE)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?LOTE_SIMPLE,?FAMILIA,?FECHA_INICIO,?NOTAS,?FECHA_' +
        'CADUCIDAD,?ARTICULO,?DISPONIBLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_LOTE_SIMPLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  LOTE_SIMPLE=?LOTE_SIMPLE AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      '/* Se establece dinamicamente */'
      'SELECT * FROM ART_LOTE_SIMPLE'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'ORDER BY LOTE_SIMPLE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_LOTE_SIMPLE'
      'SET'
      '  FAMILIA=?FAMILIA '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA_CADUCIDAD=?FECHA_CADUCIDAD '
      '  ,DISPONIBLE=?DISPONIBLE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  LOTE_SIMPLE=?LOTE_SIMPLE AND '
      '  ARTICULO=?ARTICULO ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMLoteSimpleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'LOTE_SIMPLE '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_LOTE_SIMPLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMLoteSimpleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLoteSimpleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Lote Simple'
      FieldName = 'LOTE_SIMPLE'
    end
    object QMLoteSimpleFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMLoteSimpleFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Inicio'
      FieldName = 'FECHA_INICIO'
      OnChange = QMLoteSimpleFECHA_INICIOChange
    end
    object QMLoteSimpleFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object QMLoteSimpleNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMLoteSimpleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMLoteSimpleARTICULOChange
      Size = 15
    end
    object QMLoteSimpleDISPONIBLE: TIntegerField
      DisplayLabel = 'Disponible'
      FieldName = 'DISPONIBLE'
    end
  end
end
