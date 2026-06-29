object ProDMFicherosCliente: TProDMFicherosCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1022
  Top = 217
  Height = 219
  Width = 146
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 18
    Top = 22
  end
  object DSFicheros: TDataSource
    DataSet = xFicheros
    Left = 89
    Top = 71
  end
  object xFicheros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_FICHEROS_PEDIDOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_FICHEROS_PEDIDOS'
      
        '  (ID,PROCEDENCIA,CLAVE,TABLAS,NOMBRE,EXTENSION,DESCRIPCION,FECH' +
        'A)'
      'VALUES'
      
        '  (?ID,?PROCEDENCIA,?CLAVE,?TABLAS,?NOMBRE,?EXTENSION,?DESCRIPCI' +
        'ON,?FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_FICHEROS_PEDIDOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_FICHEROS_PEDIDOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_FICHEROS_PEDIDOS'
      'SET'
      '  PROCEDENCIA=?PROCEDENCIA '
      '  ,CLAVE=?CLAVE '
      '  ,TABLAS=?TABLAS '
      '  ,NOMBRE=?NOMBRE '
      '  ,EXTENSION=?EXTENSION '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,FECHA=?FECHA '
      'WHERE'
      '  ID=?ID ')
    AfterCancel = xFicherosAfterCancel
    AfterDelete = Borra
    AfterOpen = xFicherosAfterOpen
    AfterPost = xFicherosAfterPost
    AfterScroll = xFicherosAfterScroll
    BeforeDelete = xFicherosBeforeDelete
    OnNewRecord = xFicherosNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_FICHEROS_PEDIDOS'
    UpdateTransaction = TLocal
    Left = 22
    Top = 72
    object xFicherosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xFicherosPROCEDENCIA: TFIBStringField
      DisplayLabel = 'Procedencia'
      FieldName = 'PROCEDENCIA'
      Size = 100
    end
    object xFicherosCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 100
    end
    object xFicherosTABLAS: TFIBStringField
      DisplayLabel = 'Tablas'
      FieldName = 'TABLAS'
      Size = 100
    end
    object xFicherosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 100
    end
    object xFicherosEXTENSION: TFIBStringField
      DisplayLabel = 'Extensi'#243'n'
      FieldName = 'EXTENSION'
      Size = 5
    end
    object xFicherosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xFicherosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
end
