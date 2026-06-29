object DMProtocoloDeVenta: TDMProtocoloDeVenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 607
  Top = 204
  Height = 150
  Width = 312
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 188
    Top = 10
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 252
    Top = 10
  end
  object QMProtocolo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_PROTOCOLO_C'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  PROTOCOLO=?old_PROTOCOLO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_PROTOCOLO_C'
      '  (EMPRESA,EJERCICIO,CANAL,PROTOCOLO,TIPO,ALTA,BAJA)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?PROTOCOLO,?TIPO,?ALTA,?BAJA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_PROTOCOLO_C'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  PROTOCOLO=?PROTOCOLO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_PROTOCOLO_C'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY PROTOCOLO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_PROTOCOLO_C'
      'SET'
      '  ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  PROTOCOLO=?PROTOCOLO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMProtocoloAfterOpen
    BeforeClose = QMProtocoloBeforeClose
    OnNewRecord = QMProtocoloNewRecord
    ClavesPrimarias.Strings = (
      'TIPO '
      'PROTOCOLO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_PROTOCOLO_C'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 16
    object QMProtocoloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProtocoloEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProtocoloCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProtocoloPROTOCOLO: TFIBStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      Size = 5
    end
    object QMProtocoloTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProtocoloALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMProtocoloBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMProtocoloTITULO: TStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      ReadOnly = True
      OnGetText = QMProtocoloTITULOGetText
      Size = 60
      Calculated = True
    end
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_PROTOCOLO_D'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  TIPO=?old_TIPO AND '
      '  PROTOCOLO=?old_PROTOCOLO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_PROTOCOLO_D'
      
        '  (EMPRESA,EJERCICIO,CANAL,PROTOCOLO,TIPO,UNID_MINIMAS,UNID_MAXI' +
        'MAS,PRECIO,DESCUENTO,DESCUENTO_2,DESCUENTO_3,ARTICULO,FAMILIA,LI' +
        'NEA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PROTOCOLO,?TIPO,?UNID_MINIMAS,?UN' +
        'ID_MAXIMAS,?PRECIO,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?ARTICUL' +
        'O,?FAMILIA,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_PROTOCOLO_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  TIPO=?TIPO AND '
      '  PROTOCOLO=?PROTOCOLO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_PROTOCOLO_D'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  PROTOCOLO=?PROTOCOLO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_PROTOCOLO_D'
      'SET'
      '  UNID_MINIMAS=?UNID_MINIMAS '
      '  ,UNID_MAXIMAS=?UNID_MAXIMAS '
      '  ,PRECIO=?PRECIO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,ARTICULO=?ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  TIPO=?TIPO AND '
      '  PROTOCOLO=?PROTOCOLO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMProtocolo
    AfterPost = QMDetalleAfterPost
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'TIPO '
      'PROTOCOLO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_PROTOCOLO_D'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 64
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallePROTOCOLO: TFIBStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      Size = 5
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMDetalleUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMDetalleUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
  end
  object DSQMProtocolo: TDataSource
    DataSet = QMProtocolo
    Left = 104
    Top = 16
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 104
    Top = 64
  end
end
