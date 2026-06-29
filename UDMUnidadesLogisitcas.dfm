object DMUnidadesLogisitcas: TDMUnidadesLogisitcas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 150
  Width = 284
  object DSQMUnidadesLogisticas: TDataSource
    DataSet = QMUnidadesLogisticas
    Left = 172
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 46
    Top = 4
  end
  object QMUnidadesLogisticas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_UNIDAD_LOGISTICA'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_UNIDAD_LOGISTICA'
      '  (TIPO,TITULO,UNIDADES,RELACIONAR_CON_UNIDADES)'
      'VALUES'
      '  (?TIPO,?TITULO,?UNIDADES,?RELACIONAR_CON_UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_UNIDAD_LOGISTICA'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_UNIDAD_LOGISTICA'
      ' ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_UNIDAD_LOGISTICA'
      'SET'
      '  TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,RELACIONAR_CON_UNIDADES=?RELACIONAR_CON_UNIDADES'
      'WHERE'
      '  TIPO=?TIPO ')
    OnNewRecord = QMUnidadesLogisticasNewRecord
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_UNIDAD_LOGISTICA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 49
    Top = 68
    object QMUnidadesLogisticasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMUnidadesLogisticasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMUnidadesLogisticasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMUnidadesLogisticasRELACIONAR_CON_UNIDADES: TIntegerField
      DisplayLabel = 'Relac. Uds.'
      FieldName = 'RELACIONAR_CON_UNIDADES'
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
    Left = 174
    Top = 4
  end
end
