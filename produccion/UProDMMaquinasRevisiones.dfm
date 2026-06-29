object ProDMMaquinasRevisiones: TProDMMaquinasRevisiones
  OldCreateOrder = False
  OnCreate = DMProTipoMaquinasRevisionesCreate
  Left = 608
  Top = 271
  Height = 246
  Width = 351
  object QMTiposRevisiones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TIPO_MAQUINAS_REVISIONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TIPO_MAQUINAS_REVISIONES'
      
        '  (NOTAS,RESPONSABLE,ID,FRECUENCIA,DENOMINACION,EMPRESA,TIPO_REV' +
        'ISION)'
      'VALUES'
      
        '  (?NOTAS,?RESPONSABLE,?ID,?FRECUENCIA,?DENOMINACION,?EMPRESA,?T' +
        'IPO_REVISION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TIPO_MAQUINAS_REVISIONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TIPO_MAQUINAS_REVISIONES'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TIPO_MAQUINAS_REVISIONES'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,DENOMINACION=?DENOMINACION '
      '  ,TIPO_REVISION=?TIPO_REVISION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID=?ID ')
    AfterDelete = Graba
    AfterOpen = QMTiposRevisionesAfterOpen
    AfterPost = Graba
    BeforePost = QMTiposRevisionesBeforePost
    OnNewRecord = QMTiposRevisionesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TIPO_MAQUINAS_REVISIONES'
    UpdateTransaction = TLocal
    Left = 56
    Top = 24
    object QMTiposRevisionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTiposRevisionesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMTiposRevisionesTIPO_REVISION: TFIBStringField
      DisplayLabel = 'Tipo Rev.'
      FieldName = 'TIPO_REVISION'
      Size = 3
    end
    object QMTiposRevisionesDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION'
      Size = 60
    end
    object QMTiposRevisionesFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object QMTiposRevisionesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMTiposRevisionesRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
  end
  object DSQMTiposRevisiones: TDataSource
    DataSet = QMTiposRevisiones
    Left = 176
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 24
  end
  object QMTipoRevDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TIPO_MAQUINAS_REV_DET'
      'WHERE'
      '  ID_DETALL=?old_ID_DETALL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TIPO_MAQUINAS_REV_DET'
      '  (EMPRESA,ID_DETALL,ID_CAB_REV,TIPO_MAQUINA)'
      'VALUES'
      '  (?EMPRESA,?ID_DETALL,?ID_CAB_REV,?TIPO_MAQUINA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TIPO_MAQUINAS_REV_DET'
      'WHERE'
      '  ID_DETALL=?ID_DETALL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TIPO_MAQUINAS_REV_DET'
      'where empresa=?empresa and id_cab_rev=?id')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TIPO_MAQUINAS_REV_DET'
      'SET'
      '  ID_CAB_REV=?ID_CAB_REV '
      '  ,TIPO_MAQUINA=?TIPO_MAQUINA '
      'WHERE'
      '  ID_DETALL=?ID_DETALL AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMTiposRevisiones
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMTipoRevDetNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TIPO_MAQUINAS_REV_DET'
    UpdateTransaction = TLocal
    Left = 56
    Top = 72
    object QMTipoRevDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTipoRevDetID_DETALL: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_DETALL'
    end
    object QMTipoRevDetID_CAB_REV: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_CAB_REV'
    end
    object QMTipoRevDetTIPO_MAQUINA: TFIBStringField
      DisplayLabel = 'Tipo Maq.'
      FieldName = 'TIPO_MAQUINA'
      OnChange = QMTipoRevDetTIPO_MAQUINAChange
      Size = 5
    end
    object QMTipoRevDetDescMaquina: TStringField
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'DescMaquina'
      OnGetText = QMTipoRevDetDescMaquinaGetText
      Size = 100
      Calculated = True
    end
  end
  object DSQMTipoRevDet: TDataSource
    DataSet = QMTipoRevDet
    Left = 176
    Top = 72
  end
  object xDescTipoMaquina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_tipo_maquinas'
      'where empresa=?empresa and tipo=?tipo_maquina')
    UniDirectional = False
    DataSource = DSQMTipoRevDet
    Left = 56
    Top = 120
    object xDescTipoMaquinaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
end
