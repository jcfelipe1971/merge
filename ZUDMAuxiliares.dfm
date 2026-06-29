object ZDMAuxiliares: TZDMAuxiliares
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 484
  Top = 176
  Height = 239
  Width = 236
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 156
    Top = 18
  end
  object QMAuxiliares: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_AUXILIARES'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  TIPO_AUX=?old_TIPO_AUX ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_AUXILIARES'
      '  (TIPO_AUX,CODIGO,DESCRIPCION,IMAGEN)'
      'VALUES'
      '  (?TIPO_AUX,?CODIGO,?DESCRIPCION,?IMAGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_AUXILIARES'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  TIPO_AUX=?TIPO_AUX ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_AUXILIARES'
      'where tipo_aux=?tipo'
      'order by codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_AUXILIARES'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IMAGEN=?IMAGEN'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  TIPO_AUX=?TIPO_AUX ')
    OnNewRecord = QMAuxiliaresNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'TIPO_AUX ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_AUXILIARES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 51
    Top = 16
    object QMAuxiliaresTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object QMAuxiliaresCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMAuxiliaresDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMAuxiliaresIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
  end
  object DSQMAuxiliares: TDataSource
    DataSet = QMAuxiliares
    Left = 51
    Top = 64
  end
  object xDescTipo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from z_sys_auxiliares_tipo'
      'where tipo=?tipo')
    UniDirectional = False
    Left = 56
    Top = 136
    object xDescTipoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxDescTipo: TDataSource
    DataSet = xDescTipo
    Left = 131
    Top = 136
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 156
    Top = 66
  end
end
