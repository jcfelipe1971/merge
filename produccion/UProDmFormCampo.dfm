object ProDmFormCampo: TProDmFormCampo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 607
  Top = 182
  Height = 270
  Width = 340
  object QmProFormulasCamp: TFIBTableSet
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
      
        '  (ID_FORMULA_CAMPOS_CAB,ID_FORMULA,CAMPO,TABLA,VALIDA,FORMULA,A' +
        'CTIVO,TIPO_REDONDEO)'
      'VALUES'
      
        '  (?ID_FORMULA_CAMPOS_CAB,?ID_FORMULA,?CAMPO,?TABLA,?VALIDA,?FOR' +
        'MULA,?ACTIVO,?TIPO_REDONDEO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_FORMULAS_CAMPOS_CAB'
      'WHERE'
      '  ID_FORMULA_CAMPOS_CAB=?ID_FORMULA_CAMPOS_CAB ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_FORMULAS_CAMPOS_CAB')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_FORMULAS_CAMPOS_CAB'
      'SET'
      '  VALIDA=?VALIDA '
      '  ,FORMULA=?FORMULA '
      '  ,TIPO_REDONDEO=?TIPO_REDONDEO '
      'WHERE'
      '  ID_FORMULA_CAMPOS_CAB=?ID_FORMULA_CAMPOS_CAB ')
    AfterOpen = QmProFormulasCampAfterOpen
    BeforeClose = QmProFormulasCampBeforeClose
    ClavesPrimarias.Strings = (
      'ID_FORMULA_CAMPOS_CAB ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_FORMULAS_CAMPOS_CAB'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QmProFormulasCampID_FORMULA_CAMPOS_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_FORMULA_CAMPOS_CAB'
    end
    object QmProFormulasCampID_FORMULA: TIntegerField
      DisplayLabel = 'ID F'#243'rmula'
      FieldName = 'ID_FORMULA'
    end
    object QmProFormulasCampVALIDA: TIntegerField
      DisplayLabel = 'Valida'
      FieldName = 'VALIDA'
    end
    object QmProFormulasCampFORMULA: TFIBStringField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
      Size = 200
    end
    object QmProFormulasCampESTADO_FORMULA: TStringField
      DisplayLabel = 'Estado'
      FieldKind = fkCalculated
      FieldName = 'ESTADO_FORMULA'
      OnGetText = QmProFormulasCampESTADO_FORMULAGetText
      Calculated = True
    end
    object QmProFormulasCampTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
      OnChange = QmProFormulasCampTIPO_REDONDEOChange
    end
  end
  object DSQmProFormulasCamp: TDataSource
    DataSet = QmProFormulasCamp
    Left = 192
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 56
    Top = 8
  end
  object QmProFormulasCampDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_FORMULAS_CAMPOS_DET'
      'WHERE'
      '  ID_FORMULA_CAMPOS_DET=?old_ID_FORMULA_CAMPOS_DET ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_FORMULAS_CAMPOS_DET'
      
        '  (ID_FORMULA_CAMPOS_DET,ID_FORMULA_CAMPOS_CAB,NOMBRE,VALOR,CAMP' +
        'O_ESC,TABLA_ESC,CAMPO_ORD,TABLA_ORD,TABLA_DESP,CAMPO_DESP)'
      'VALUES'
      
        '  (?ID_FORMULA_CAMPOS_DET,?ID_FORMULA_CAMPOS_CAB,?NOMBRE,?VALOR,' +
        '?CAMPO_ESC,?TABLA_ESC,?CAMPO_ORD,?TABLA_ORD,?TABLA_DESP,?CAMPO_D' +
        'ESP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_FORMULAS_CAMPOS_DET'
      'WHERE'
      '  ID_FORMULA_CAMPOS_DET=?ID_FORMULA_CAMPOS_DET ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_FORMULAS_CAMPOS_DET'
      'WHERE'
      '  ID_FORMULA_CAMPOS_CAB=?ID_FORMULA_CAMPOS_CAB')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_FORMULAS_CAMPOS_DET'
      'SET'
      '   VALOR=?VALOR '
      '  ,CAMPO_ESC=?CAMPO_ESC '
      '  ,TABLA_ESC=?TABLA_ESC '
      '  ,CAMPO_ORD=?CAMPO_ORD '
      '  ,TABLA_ORD=?TABLA_ORD '
      '  ,TABLA_DESP=?TABLA_DESP'
      '  ,CAMPO_DESP=?CAMPO_DESP'
      'WHERE'
      '  ID_FORMULA_CAMPOS_DET=?ID_FORMULA_CAMPOS_DET ')
    DataSource = DSQmProFormulasCamp
    OnNewRecord = QmProFormulasCampDetNewRecord
    ClavesPrimarias.Strings = (
      'ID_FORMULA_CAMPOS_DET ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_FORMULAS_CAMPOS_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object QmProFormulasCampDetID_FORMULA_CAMPOS_DET: TIntegerField
      DisplayLabel = 'ID Form. Campo'
      FieldName = 'ID_FORMULA_CAMPOS_DET'
    end
    object QmProFormulasCampDetID_FORMULA_CAMPOS_CAB: TIntegerField
      DisplayLabel = 'ID Form. Campos Cab.'
      FieldName = 'ID_FORMULA_CAMPOS_CAB'
    end
    object QmProFormulasCampDetNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 1
    end
    object QmProFormulasCampDetVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object QmProFormulasCampDetCAMPO_ESC: TFIBStringField
      DisplayLabel = 'Campo Esc.'
      FieldName = 'CAMPO_ESC'
      Size = 100
    end
    object QmProFormulasCampDetTABLA_ESC: TFIBStringField
      DisplayLabel = 'Tabla Esc.'
      FieldName = 'TABLA_ESC'
      Size = 100
    end
    object QmProFormulasCampDetCAMPO_ORD: TFIBStringField
      DisplayLabel = 'Campo Ord.'
      FieldName = 'CAMPO_ORD'
      Size = 100
    end
    object QmProFormulasCampDetTABLA_ORD: TFIBStringField
      DisplayLabel = 'Tabla Ord.'
      FieldName = 'TABLA_ORD'
      Size = 100
    end
    object QmProFormulasCampDetTABLA_DESP: TFIBStringField
      DisplayLabel = 'Tabla Desp.'
      FieldName = 'TABLA_DESP'
      Size = 100
    end
    object QmProFormulasCampDetCAMPO_DESP: TFIBStringField
      DisplayLabel = 'Campo Desp.'
      FieldName = 'CAMPO_DESP'
      Size = 100
    end
  end
  object DsQmProFormulasCampDet: TDataSource
    DataSet = QmProFormulasCampDet
    Left = 192
    Top = 104
  end
  object DSxTipoRedondeo: TDataSource
    DataSet = xTipoRedondeo
    Left = 192
    Top = 152
  end
  object xTipoRedondeo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_REDONDEOS'
      'WHERE TIPO_REDONDEO=?TIPO_REDONDEO')
    UniDirectional = False
    DataSource = DSQmProFormulasCamp
    Left = 56
    Top = 152
    object xTipoRedondeoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 192
    Top = 8
  end
end
