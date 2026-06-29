object DMTarifas: TDMTarifas
  OldCreateOrder = False
  OnCreate = DMTarifasCreate
  Left = 397
  Top = 338
  Height = 249
  Width = 357
  object QMTarifas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_TARIFAS_C'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  TARIFA=?old_TARIFA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_TARIFAS_C'
      '  (EMPRESA,TITULO,ACTIVA,TARIFA,MONEDA,IVA_INCLUIDO)'
      'VALUES'
      '  (?EMPRESA,?TITULO,?ACTIVA,?TARIFA,?MONEDA,?IVA_INCLUIDO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_TARIFAS_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TARIFA=?TARIFA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_TARIFAS_C'
      'where(empresa=?empresa) order by tarifa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_TARIFAS_C'
      'SET'
      '  TITULO=?TITULO '
      '  ,ACTIVA=?ACTIVA '
      '  ,MONEDA=?MONEDA '
      '  ,IVA_INCLUIDO=?IVA_INCLUIDO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TARIFA=?TARIFA ')
    AfterDelete = Graba
    AfterOpen = QMTarifasAfterOpen
    AfterPost = Graba
    BeforeEdit = QMTarifasBeforeEdit
    OnNewRecord = QMTarifasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TARIFA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_TARIFAS_C'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMTarifasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTarifasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMTarifasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMTarifasACTIVA: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVA'
    end
    object QMTarifasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMTarifasMONEDAChange
      Size = 3
    end
    object QMTarifasIVA_INCLUIDO: TIntegerField
      DisplayLabel = 'IVA Inc.'
      FieldName = 'IVA_INCLUIDO'
    end
  end
  object DSQMTarifas: TDataSource
    DataSet = QMTarifas
    Left = 112
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 8
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_TARIFAS_D'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  TARIFA=?old_TARIFA AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_TARIFAS_D'
      
        '  (EMPRESA,TARIFA,LINEA,CALCULO,TIT_CALCULO,UNID_MINIMAS,UNID_MA' +
        'XIMAS)'
      'VALUES'
      
        '  (?EMPRESA,?TARIFA,?LINEA,?CALCULO,?TIT_CALCULO,?UNID_MINIMAS,?' +
        'UNID_MAXIMAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TARIFA=?TARIFA AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_TARIFAS_D'
      'where(empresa=?empresa)'
      '  and(tarifa=?tarifa)'
      'order by UNID_MINIMAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_TARIFAS_D'
      'SET'
      '  CALCULO=?CALCULO '
      '  ,TIT_CALCULO=?TIT_CALCULO '
      '  ,UNID_MINIMAS=?UNID_MINIMAS '
      '  ,UNID_MAXIMAS=?UNID_MAXIMAS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TARIFA=?TARIFA AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMTarifas
    AfterPost = QMDetalleAfterPost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TARIFA '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_TARIFAS_D'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCALCULO: TIntegerField
      DisplayLabel = 'Calculo'
      FieldName = 'CALCULO'
      OnChange = QMDetalleCALCULOChange
    end
    object QMDetalleTIT_CALCULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_CALCULO'
      Size = 60
    end
    object QMDetalleUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMDetalleUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 8
  end
end
