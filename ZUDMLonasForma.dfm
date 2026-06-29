object ZDMLonasForma: TZDMLonasForma
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 268
  Width = 228
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 130
    Top = 18
  end
  object QMLonasForma: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_LONAS_FORMA'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_LONAS_FORMA'
      '  (CODIGO,DESCRIPCION,IMAGEN)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION,?IMAGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_LONAS_FORMA'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_LONAS_FORMA'
      'order by codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_LONAS_FORMA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IMAGEN=?IMAGEN '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_LONAS_FORMA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMLonasFormaCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMLonasFormaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMLonasFormaIMAGEN: TIntegerField
      DisplayLabel = 'N'#250'm. Imagen'
      FieldName = 'IMAGEN'
    end
  end
  object DSQMLonasForma: TDataSource
    DataSet = QMLonasForma
    Left = 38
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 130
    Top = 74
  end
end
