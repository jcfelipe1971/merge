object ProDMPregDeslanza: TProDMPregDeslanza
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 291
  Top = 191
  Height = 259
  Width = 236
  object QMLanza_Masivo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_CAB_LANZA_ORDENES'
      'WHERE'
      '  ID_CAB=?old_ID_CAB AND '
      '  FECHA=?old_FECHA AND '
      '  MARCA=?old_MARCA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_CAB_LANZA_ORDENES'
      '  (ID_CAB,FECHA,MARCA,ENTRADA)'
      'VALUES'
      '  (?ID_CAB,?FECHA,?MARCA,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_CAB_LANZA_ORDENES'
      'WHERE'
      '  ID_CAB=?ID_CAB')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_CAB_LANZA_ORDENES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_CAB_LANZA_ORDENES'
      'SET MARCA=?MARCA'
      '       ,ENTRADA=?ENTRADA'
      'WHERE'
      '  ID_CAB=?ID_CAB'
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMLanza_MasivoBeforePost
    ClavesPrimarias.Strings = (
      'ID_CAB'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_CAB_LANZA_ORDENES'
    UpdateTransaction = TLocal
    Left = 48
    Top = 8
    object QMLanza_MasivoID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMLanza_MasivoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMLanza_MasivoMARCA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'MARCA'
    end
    object QMLanza_MasivoENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
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
    Left = 152
    Top = 8
  end
  object DSQMLanza_Masivo: TDataSource
    DataSet = QMLanza_Masivo
    Left = 48
    Top = 56
  end
  object SPUpdateSituacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure pro_deslanza_ordenes ?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 104
  end
end
