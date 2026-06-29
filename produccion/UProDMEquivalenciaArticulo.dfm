object ProDMEquivalenciaArticulo: TProDMEquivalenciaArticulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 421
  Top = 609
  Height = 335
  Width = 380
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 8
  end
  object QMProCabEquival: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_CAB_EQUIVAL'
      'WHERE'
      '  ID_EQUIVAL=?old_ID_EQUIVAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_CAB_EQUIVAL'
      '  (EMPRESA,ID_EQUIVAL,DESC_EQUIVAL,ARTICULO,DEFECTO)'
      'VALUES'
      '  (?EMPRESA,?ID_EQUIVAL,?DESC_EQUIVAL,?ARTICULO,?DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_CAB_EQUIVAL'
      'WHERE'
      '  ID_EQUIVAL=?ID_EQUIVAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_CAB_EQUIVAL'
      'WHERE'
      '  EMPRESA=?EMPRESA '
      'ORDER BY ID_EQUIVAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_CAB_EQUIVAL'
      'SET'
      '  DESC_EQUIVAL=?DESC_EQUIVAL '
      '  ,ARTICULO=?ARTICULO '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  ID_EQUIVAL=?ID_EQUIVAL AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMProCabEquivalAfterOpen
    AfterPost = QMProCabEquivalAfterPost
    BeforeClose = QMProCabEquivalBeforeClose
    BeforePost = QMProCabEquivalBeforePost
    OnNewRecord = QMProCabEquivalNewRecord
    ClavesPrimarias.Strings = (
      'ID_EQUIVAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_CAB_EQUIVAL'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMProCabEquivalEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCabEquivalID_EQUIVAL: TIntegerField
      DisplayLabel = 'Equivalencia'
      FieldName = 'ID_EQUIVAL'
    end
    object QMProCabEquivalDESC_EQUIVAL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_EQUIVAL'
      Size = 60
    end
    object QMProCabEquivalARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProCabEquivalDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object QMProDetEquival: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_DET_EQUIVAL'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_EQUIVAL=?old_ID_EQUIVAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_DET_EQUIVAL'
      '  (EMPRESA,ID_EQUIVAL,LINEA,ORDEN,ARTICULO_EQUIVAL)'
      'VALUES'
      '  (?EMPRESA,?ID_EQUIVAL,?LINEA,?ORDEN,?ARTICULO_EQUIVAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_DET_EQUIVAL'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_EQUIVAL=?ID_EQUIVAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_DET_EQUIVAL'
      'WHERE'
      '  ID_EQUIVAL=?ID_EQUIVAL AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_DET_EQUIVAL'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,ARTICULO_EQUIVAL=?ARTICULO_EQUIVAL '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_EQUIVAL=?ID_EQUIVAL AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSProCabEquival
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMProDetEquivalNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_EQUIVAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_DET_EQUIVAL'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMProDetEquivalEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDetEquivalID_EQUIVAL: TIntegerField
      DisplayLabel = 'Equivalencia'
      FieldName = 'ID_EQUIVAL'
    end
    object QMProDetEquivalLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDetEquivalORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProDetEquivalARTICULO_EQUIVAL: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO_EQUIVAL'
      Size = 15
    end
    object QMProDetEquivalTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = QMProDetEquivalTITULOGetText
      Size = 60
      Calculated = True
    end
    object QMProDetEquivalSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK'
      OnGetText = QMProDetEquivalSTOCKGetText
      Calculated = True
    end
  end
  object DSProCabEquival: TDataSource
    DataSet = QMProCabEquival
    Left = 136
    Top = 8
  end
  object DSProDetEquival: TDataSource
    DataSet = QMProDetEquival
    Left = 136
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
    Left = 272
    Top = 56
  end
end
