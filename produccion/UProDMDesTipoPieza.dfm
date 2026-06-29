object ProDMDesTipoPieza: TProDMDesTipoPieza
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 456
  Top = 348
  Height = 224
  Width = 350
  object QMTipoPieza: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DES_TIPO_PIEZA'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DES_TIPO_PIEZA'
      
        '  (CODIGO,DESCRIPCION,FORMULA_CALC_ALTURA,FORMULA_CALC_ANCHURA,F' +
        'ORMULA_CALC_PROF,FORMULA_CALC_GRUESO)'
      'VALUES'
      
        '  (?CODIGO,?DESCRIPCION,?FORMULA_CALC_ALTURA,?FORMULA_CALC_ANCHU' +
        'RA,?FORMULA_CALC_PROF,?FORMULA_CALC_GRUESO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DES_TIPO_PIEZA'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DES_TIPO_PIEZA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DES_TIPO_PIEZA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,FORMULA_CALC_ALTURA=?FORMULA_CALC_ALTURA '
      '  ,FORMULA_CALC_ANCHURA=?FORMULA_CALC_ANCHURA '
      '  ,FORMULA_CALC_PROF=?FORMULA_CALC_PROF '
      '  ,FORMULA_CALC_GRUESO=?FORMULA_CALC_GRUESO '
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DES_TIPO_PIEZA'
    UpdateTransaction = TLocal
    Left = 40
    Top = 40
    object QMTipoPiezaCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMTipoPiezaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMTipoPiezaFORMULA_CALC_ALTURA: TFIBStringField
      DisplayLabel = 'F. Calc. Altura'
      FieldName = 'FORMULA_CALC_ALTURA'
      Size = 60
    end
    object QMTipoPiezaFORMULA_CALC_ANCHURA: TFIBStringField
      DisplayLabel = 'F. Calc. Anchura'
      FieldName = 'FORMULA_CALC_ANCHURA'
      Size = 60
    end
    object QMTipoPiezaFORMULA_CALC_PROF: TFIBStringField
      DisplayLabel = 'F. Calc. Prof.'
      FieldName = 'FORMULA_CALC_PROF'
      Size = 60
    end
    object QMTipoPiezaFORMULA_CALC_GRUESO: TFIBStringField
      DisplayLabel = 'F. Calc. Grueso'
      FieldName = 'FORMULA_CALC_GRUESO'
      Size = 60
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 264
    Top = 16
  end
  object DSTipoPieza: TDataSource
    DataSet = QMTipoPieza
    Left = 128
    Top = 40
  end
end
