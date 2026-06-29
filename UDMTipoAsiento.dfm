object DMTipoAsiento: TDMTipoAsiento
  OldCreateOrder = False
  OnCreate = DMTipoAsientoCreate
  Left = 595
  Top = 423
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 32
    Top = 8
  end
  object SysTipoAsiento: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_ASIENTO'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_ASIENTO'
      '  (DEFECTO,TITULO,VISIBLE,TIPO,RESTRICCION)'
      'VALUES'
      '  (?DEFECTO,?TITULO,?VISIBLE,?TIPO,?RESTRICCION')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_ASIENTO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_ASIENTO'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_ASIENTO'
      'SET'
      '  DEFECTO=?DEFECTO '
      '  ,TITULO=?TITULO '
      '  ,VISIBLE=?VISIBLE '
      '  ,RESTRICCION=?RESTRICCION'
      'WHERE'
      '  TIPO=?TIPO ')
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_ASIENTO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object SysTipoAsientoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object SysTipoAsientoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object SysTipoAsientoDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object SysTipoAsientoVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object SysTipoAsientoRESTRICCION: TIntegerField
      DisplayLabel = 'Restric.'
      FieldName = 'RESTRICCION'
    end
  end
  object DSSysTipoAsiento: TDataSource
    DataSet = SysTipoAsiento
    Left = 128
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 128
    Top = 8
  end
end
