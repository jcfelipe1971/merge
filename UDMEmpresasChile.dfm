object DMEmpresasChile: TDMEmpresasChile
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 514
  Top = 209
  Height = 293
  Width = 511
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 8
  end
  object QMEmpresasChile: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_EMPRESAS_CHILE'
      'WHERE'
      '  ID_SYS_EMPRESAS_CHILE=?old_ID_SYS_EMPRESAS_CHILE ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_EMPRESAS_CHILE'
      
        '  (ID_SYS_EMPRESAS_CHILE,RUT,NOMBRE_R_SOCIAL,NUMERO,FECHA_RESOLU' +
        'CION,EMAIL,URL)'
      'VALUES'
      
        '  (?ID_SYS_EMPRESAS_CHILE,?RUT,?NOMBRE_R_SOCIAL,?NUMERO,?FECHA_R' +
        'ESOLUCION,?EMAIL,?URL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_EMPRESAS_CHILE'
      'WHERE'
      '  ID_SYS_EMPRESAS_CHILE=?ID_SYS_EMPRESAS_CHILE ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS_CHILE'
      'ORDER BY RUT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_EMPRESAS_CHILE'
      'SET'
      '  RUT=?RUT '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NUMERO=?NUMERO '
      '  ,FECHA_RESOLUCION=?FECHA_RESOLUCION '
      '  ,EMAIL=?EMAIL '
      '  ,URL=?URL '
      'WHERE'
      '  ID_SYS_EMPRESAS_CHILE=?ID_SYS_EMPRESAS_CHILE ')
    OnNewRecord = QMEmpresasChileNewRecord
    ClavesPrimarias.Strings = (
      'ID_SYS_EMPRESAS_CHILE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_EMPRESAS_CHILE'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 40
    Top = 8
    object QMEmpresasChileID_SYS_EMPRESAS_CHILE: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_SYS_EMPRESAS_CHILE'
    end
    object QMEmpresasChileRUT: TFIBStringField
      FieldName = 'RUT'
    end
    object QMEmpresasChileNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMEmpresasChileNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEmpresasChileFECHA_RESOLUCION: TDateTimeField
      DisplayLabel = 'Fecha Resoluci'#243'n'
      FieldName = 'FECHA_RESOLUCION'
    end
    object QMEmpresasChileEMAIL: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMEmpresasChileURL: TFIBStringField
      FieldName = 'URL'
      Size = 500
    end
  end
  object DSQMEmpresasChile: TDataSource
    DataSet = QMEmpresasChile
    Left = 144
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 56
  end
end
