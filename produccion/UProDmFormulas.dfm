object ProDmFormulas: TProDmFormulas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 524
  Top = 165
  Height = 218
  Width = 270
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 48
    Top = 8
  end
  object QMProFormulas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_FORMULAS'
      'WHERE'
      '  ID_FORMULA=?old_ID_FORMULA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_FORMULAS'
      '  (ID_FORMULA,NOMBRE,ACTIVO)'
      'VALUES'
      '  (?ID_FORMULA,?NOMBRE,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_FORMULAS'
      'WHERE'
      '  ID_FORMULA=?ID_FORMULA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_FORMULAS'
      'ORDER BY ID_FORMULA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_FORMULAS'
      'SET'
      '  NOMBRE=?NOMBRE,'
      '  activo=?activo '
      'WHERE'
      '  ID_FORMULA=?ID_FORMULA ')
    AfterOpen = QMProFormulasAfterOpen
    BeforeClose = QMProFormulasBeforeClose
    BeforePost = QMProFormulasBeforePost
    OnNewRecord = QMProFormulasNewRecord
    ClavesPrimarias.Strings = (
      'ID_FORMULA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_FORMULAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMProFormulasID_FORMULA: TIntegerField
      DisplayLabel = 'ID F'#243'rmula'
      FieldName = 'ID_FORMULA'
    end
    object QMProFormulasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 25
    end
    object QMProFormulasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMProFormulasESTADO_FORMULA: TStringField
      DisplayLabel = 'Estado'
      FieldKind = fkCalculated
      FieldName = 'ESTADO_FORMULA'
      OnGetText = QMProFormulasESTADO_FORMULAGetText
      Size = 60
      Calculated = True
    end
  end
  object DSQMProFormulas: TDataSource
    DataSet = QMProFormulas
    Left = 168
    Top = 56
  end
  object QMProFormulasDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_FORMULAS_CAMPOS_CAB'
      'WHERE'
      '  ID_FORMULA_CAMPOS_CAB=?old_ID_FORMULA_CAMPOS_CAB ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_FORMULAS_CAMPOS_CAB'
      
        '  (ID_FORMULA_CAMPOS_CAB,ID_FORMULA,CAMPO_ESC,TABLA_ESC,CAMPO_OR' +
        'D,TABLA_ORD,VALIDA,FORMULA,TABLA_DESP,CAMPOS_DESP)'
      'VALUES'
      
        '  (?ID_FORMULA_CAMPOS_CAB,?ID_FORMULA,?CAMPO_ESC,?TABLA_ESC,?CAM' +
        'PO_ORD,?TABLA_ORD,?VALIDA,?FORMULA,?TABLA_DESP,?CAMPOS_DESP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_FORMULAS_CAMPOS_CAB'
      'WHERE'
      '  ID_FORMULA_CAMPOS_CAB=?ID_FORMULA_CAMPOS_CAB ')
    SelectSQL.Strings = (
      'SELECT *  FROM PRO_FORMULAS_CAMPOS_CAB '
      'WHERE'
      '  ID_FORMULA=?ID_FORMULA '
      'ORDER BY'
      '  ID_FORMULA_CAMPOS_CAB')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_FORMULAS_CAMPOS_CAB'
      'SET'
      '  ID_FORMULA=?ID_FORMULA '
      '  ,CAMPO_ESC=?CAMPO_ESC '
      '  ,TABLA_ESC=?TABLA_ESC '
      '  ,CAMPO_ORD=?CAMPO_ORD '
      '  ,TABLA_ORD=?TABLA_ORD '
      '  ,VALIDA=?VALIDA '
      '  ,FORMULA=?FORMULA'
      '  ,TABLA_DESP=?TABLA_DESP'
      '  ,CAMPOS_DESP=?CAMPOS_DESP'
      'WHERE'
      '  ID_FORMULA_CAMPOS_CAB=?ID_FORMULA_CAMPOS_CAB ')
    DataSource = DSQMProFormulas
    BeforePost = QMProFormulasDetBeforePost
    OnNewRecord = QMProFormulasDetNewRecord
    ClavesPrimarias.Strings = (
      'ID_FORMULA_CAMPOS_CAB ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_FORMULAS_CAMPOS_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMProFormulasDetID_FORMULA_CAMPOS_CAB: TIntegerField
      DisplayLabel = 'ID F'#243'rmula Cab.'
      FieldName = 'ID_FORMULA_CAMPOS_CAB'
    end
    object QMProFormulasDetID_FORMULA: TIntegerField
      DisplayLabel = 'ID Formula'
      FieldName = 'ID_FORMULA'
    end
    object QMProFormulasDetVALIDA: TIntegerField
      DisplayLabel = 'V'#225'lida'
      FieldName = 'VALIDA'
    end
    object QMProFormulasDetFORMULA: TFIBStringField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
      Size = 200
    end
    object QMProFormulasDetCAMPO_ESC: TFIBStringField
      DisplayLabel = 'Campo Escandallo'
      FieldName = 'CAMPO_ESC'
      Size = 100
    end
    object QMProFormulasDetTABLA_ESC: TFIBStringField
      DisplayLabel = 'Escandallo'
      FieldName = 'TABLA_ESC'
      Size = 100
    end
    object QMProFormulasDetCAMPO_ORD: TFIBStringField
      DisplayLabel = 'Campo Orden'
      FieldName = 'CAMPO_ORD'
      Size = 100
    end
    object QMProFormulasDetTABLA_ORD: TFIBStringField
      DisplayLabel = 'Orden'
      FieldName = 'TABLA_ORD'
      Size = 100
    end
    object QMProFormulasDetTABLA_DESP: TFIBStringField
      DisplayLabel = 'Despiece'
      FieldName = 'TABLA_DESP'
      Size = 100
    end
    object QMProFormulasDetCAMPOS_DESP: TFIBStringField
      DisplayLabel = 'Campo Despiece'
      FieldName = 'CAMPOS_DESP'
      Size = 100
    end
  end
  object DSQMProFormulasDet: TDataSource
    DataSet = QMProFormulasDet
    Left = 168
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 168
    Top = 8
  end
end
