object IsoDMFirmas: TIsoDMFirmas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 255
  Top = 107
  Height = 165
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 144
    Top = 16
  end
  object QMFirmas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_FIRMAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ID_FIRMA=?old_ID_FIRMA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_FIRMAS'
      '  (EMPRESA,ID_FIRMA,OK,PERSONA,FECHA,NOTAS)'
      'VALUES'
      '  (?EMPRESA,?ID_FIRMA,?OK,?PERSONA,?FECHA,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_FIRMAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID_FIRMA=?ID_FIRMA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_FIRMAS'
      'where empresa=?empresa'
      'order by id_firma')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_FIRMAS'
      'SET'
      '  OK=?OK '
      '  ,PERSONA=?PERSONA '
      '  ,FECHA=?FECHA '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID_FIRMA=?ID_FIRMA ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ID_FIRMA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_FIRMAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMFirmasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFirmasID_FIRMA: TIntegerField
      DisplayLabel = 'Id. Firma'
      FieldName = 'ID_FIRMA'
    end
    object QMFirmasOK: TIntegerField
      DisplayLabel = 'Ok'
      FieldName = 'OK'
    end
    object QMFirmasPERSONA: TFIBStringField
      DisplayLabel = 'Persona'
      FieldName = 'PERSONA'
    end
    object QMFirmasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMFirmasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSQMFirmas: TDataSource
    DataSet = QMFirmas
    Left = 40
    Top = 72
  end
end
