object DMMultiColor: TDMMultiColor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 106
  Height = 150
  Width = 269
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 200
    Top = 8
  end
  object DSQMColores: TDataSource
    DataSet = QMColores
    Left = 104
    Top = 8
  end
  object QMColores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_ART_ARTICULOS_MOD_COLOR'
      'WHERE'
      '  ID_A_M_C=?old_ID_A_M_C AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_ART_ARTICULOS_MOD_COLOR'
      '  (ENTRADA,ID_A_M_C,COD_COLOR,S_COLOR,TITULO,MARCADO)'
      'VALUES'
      '  (?ENTRADA,?ID_A_M_C,?COD_COLOR,?S_COLOR,?TITULO,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ART_ARTICULOS_MOD_COLOR'
      'WHERE'
      '  ID_A_M_C=?ID_A_M_C AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ART_ARTICULOS_MOD_COLOR'
      'WHERE'
      'ENTRADA=?ENTRADA'
      'ORDER BY S_COLOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_ART_ARTICULOS_MOD_COLOR'
      'SET'
      '  COD_COLOR=?COD_COLOR '
      '  ,S_COLOR=?S_COLOR '
      '  ,TITULO=?TITULO '
      '  ,MARCADO=?MARCADO '
      'WHERE'
      '  ID_A_M_C=?ID_A_M_C AND '
      '  ENTRADA=?ENTRADA ')
    ClavesPrimarias.Strings = (
      'ID_A_M_C'
      'ENTRADA')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_ART_ARTICULOS_MOD_COLOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMColoresENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMColoresID_A_M_C: TIntegerField
      DisplayLabel = 'Id Art. Mod. Color'
      FieldName = 'ID_A_M_C'
    end
    object QMColoresCOD_COLOR: TFIBStringField
      DisplayLabel = 'Cod. Color'
      FieldName = 'COD_COLOR'
      Size = 15
    end
    object QMColoresS_COLOR: TFIBStringField
      DisplayLabel = 'Su Color'
      FieldName = 'S_COLOR'
      Size = 15
    end
    object QMColoresTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMColoresMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 200
    Top = 56
  end
end
