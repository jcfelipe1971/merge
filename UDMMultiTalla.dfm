object DMMultiTalla: TDMMultiTalla
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 106
  Height = 150
  Width = 270
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
  object DSQMTallas: TDataSource
    DataSet = QMTallas
    Left = 104
    Top = 8
  end
  object QMTallas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_ART_TALLAS'
      'WHERE'
      '  ID_A_T=?old_ID_A_T AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_ART_TALLAS'
      '  (ENTRADA,ID_A_T,TALLA,TITULO,MARCADO)'
      'VALUES'
      '  (?ENTRADA,?ID_A_T,?TALLA,?TITULO,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ART_TALLAS'
      'WHERE'
      '  ID_A_T=?ID_A_T AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ART_TALLAS'
      'WHERE'
      'ENTRADA=?ENTRADA'
      'ORDER BY TALLA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_ART_TALLAS'
      'SET'
      '  TALLA=?TALLA '
      '  ,TITULO=?TITULO '
      '  ,MARCADO=?MARCADO '
      'WHERE'
      '  ID_A_T=?ID_A_T AND '
      '  ENTRADA=?ENTRADA ')
    ClavesPrimarias.Strings = (
      'ID_A_T '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_ART_TALLAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMTallasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMTallasID_A_T: TIntegerField
      DisplayLabel = 'ID Art. Talla'
      FieldName = 'ID_A_T'
    end
    object QMTallasTALLA: TFIBStringField
      DisplayLabel = 'Talla'
      FieldName = 'TALLA'
      Size = 15
    end
    object QMTallasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 15
    end
    object QMTallasMARCADO: TIntegerField
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
