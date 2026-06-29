object DMAyudaenLinea: TDMAyudaenLinea
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 570
  Top = 265
  Height = 204
  Width = 280
  object DSQMFormularios: TDataSource
    DataSet = QMFormularios
    Left = 202
    Top = 20
  end
  object QMFormularios: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_FORMULARIOS'
      'WHERE'
      '  FORMULARIO=?FORMULARIO ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_FORMULARIOS'
      'WHERE FORMULARIO = ?FORMULARIO')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'FORMULARIO ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'DIC_FORMULARIOS'
    Left = 110
    Top = 20
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 28
    Top = 20
  end
end
