object DMPropagaStock: TDMPropagaStock
  OldCreateOrder = False
  OnCreate = DMPropagaCreate
  Left = 554
  Top = 222
  Height = 132
  Width = 284
  object QMPropaga: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_STOCKS_PROPAGACION'
      'WHERE'
      '  EMPRESA_O=?old_EMPRESA_O AND '
      '  CANAL_O=?old_CANAL_O AND '
      '  ALMACEN_O=?old_ALMACEN_O AND '
      '  EMPRESA_D=?old_EMPRESA_D AND '
      '  CANAL_D=?old_CANAL_D AND '
      '  ALMACEN_D=?old_ALMACEN_D ')
    InsertSQL.Strings = (
      'INSERT INTO ART_STOCKS_PROPAGACION'
      
        '  (EMPRESA_O,CANAL_O,ALMACEN_O,EMPRESA_D,CANAL_D,ALMACEN_D,PMP,S' +
        'TOCK)'
      'VALUES'
      
        '  (?EMPRESA_O,?CANAL_O,?ALMACEN_O,?EMPRESA_D,?CANAL_D,?ALMACEN_D' +
        ',?PMP,?STOCK)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_STOCKS_PROPAGACION'
      'WHERE'
      '  EMPRESA_O=?EMPRESA_O AND '
      '  CANAL_O=?CANAL_O AND '
      '  ALMACEN_O=?ALMACEN_O AND '
      '  EMPRESA_D=?EMPRESA_D AND '
      '  CANAL_D=?CANAL_D AND '
      '  ALMACEN_D=?ALMACEN_D ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_STOCKS_PROPAGACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_STOCKS_PROPAGACION'
      'SET  PMP = ?PMP,'
      '  STOCK = ?STOCK '
      'WHERE'
      '  EMPRESA_O = ?EMPRESA_O AND'
      '  ALMACEN_O = ?ALMACEN_O AND'
      '  CANAL_O = ?CANAL_O AND'
      '  EMPRESA_D = ?EMPRESA_D AND'
      '  ALMACEN_D = ?ALMACEN_D AND'
      ' CANAL_D  = ?CANAL_D')
    AfterPost = Graba
    OnNewRecord = QMPropagaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA_O '
      'CANAL_O '
      'ALMACEN_O '
      'EMPRESA_D '
      'CANAL_D '
      'ALMACEN_D ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_STOCKS_PROPAGACION'
    UpdateTransaction = TLocal
    Left = 40
    Top = 24
    object QMPropagaEMPRESA_O: TIntegerField
      DisplayLabel = 'Emp. Origen'
      FieldName = 'EMPRESA_O'
    end
    object QMPropagaCANAL_O: TIntegerField
      DisplayLabel = 'Can. Origen'
      FieldName = 'CANAL_O'
    end
    object QMPropagaALMACEN_O: TFIBStringField
      DisplayLabel = 'Alm. Origen'
      FieldName = 'ALMACEN_O'
      Size = 3
    end
    object QMPropagaEMPRESA_D: TIntegerField
      DisplayLabel = 'Emp. Destino'
      FieldName = 'EMPRESA_D'
    end
    object QMPropagaCANAL_D: TIntegerField
      DisplayLabel = 'Can. Destino'
      FieldName = 'CANAL_D'
    end
    object QMPropagaALMACEN_D: TFIBStringField
      DisplayLabel = 'Alm. Destino'
      FieldName = 'ALMACEN_D'
      Size = 3
    end
    object QMPropagaPMP: TIntegerField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object QMPropagaSTOCK: TIntegerField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 198
    Top = 22
  end
  object DSQMPropaga: TDataSource
    DataSet = QMPropaga
    Left = 112
    Top = 26
  end
end
