object DMTipoNCF: TDMTipoNCF
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 230
  Top = 161
  Height = 351
  Width = 363
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 24
  end
  object QMTipoNCF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_TIPO_NCF'
      'WHERE'
      '  TIPO_NCF=?old_TIPO_NCF ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_TIPO_NCF'
      '  (TIPO_NCF,TITULO,TIPO_DOCUMENTO)'
      'VALUES'
      '  (?TIPO_NCF,?TITULO,?TIPO_DOCUMENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_TIPO_NCF'
      'WHERE'
      '  TIPO_NCF=?TIPO_NCF ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF'
      'ORDER BY TIPO_NCF')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_TIPO_NCF'
      'SET'
      '  TITULO=?TITULO ,'
      '  TIPO_DOCUMENTO = ?TIPO_DOCUMENTO'
      'WHERE'
      '  TIPO_NCF=?TIPO_NCF ')
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (PK_GES_CABECERAS_S),'
      
        '           VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_' +
        'ID),'
      '           VER_CABECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    ClavesPrimarias.Strings = (
      'TIPO_NCF ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_TIPO_NCF'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_FAC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMTipoNCFTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_NCF'
    end
    object QMTipoNCFTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMTipoNCFTIPO_DOCUMENTO: TIntegerField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOCUMENTO'
    end
  end
  object DSQMTipoNCF: TDataSource
    DataSet = QMTipoNCF
    Left = 128
    Top = 24
  end
end
