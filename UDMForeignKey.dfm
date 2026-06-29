object DMForeignKey: TDMForeignKey
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 502
  Top = 331
  Height = 250
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 24
  end
  object QMForeignKey: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select A.RDB$RELATION_NAME,'
      'A.RDB$CONSTRAINT_NAME,'
      'A.RDB$CONSTRAINT_TYPE,'
      'B.RDB$CONST_NAME_UQ,'
      'B.RDB$UPDATE_RULE,'
      'B.RDB$DELETE_RULE,'
      'C.RDB$RELATION_NAME as FK_Table,'
      'A.RDB$INDEX_NAME,'
      'D.RDB$FIELD_NAME as FK_Field,'
      'E.RDB$FIELD_NAME as OnField'
      'from RDB$REF_CONSTRAINTS B, '
      'RDB$RELATION_CONSTRAINTS A, '
      'RDB$RELATION_CONSTRAINTS C,'
      'RDB$INDEX_SEGMENTS D,'
      'RDB$INDEX_SEGMENTS E'
      'where (A.RDB$CONSTRAINT_TYPE = '#39'FOREIGN KEY'#39') and'
      '(A.RDB$CONSTRAINT_NAME = B.RDB$CONSTRAINT_NAME) and'
      
        '(B.RDB$CONST_NAME_UQ=C.RDB$CONSTRAINT_NAME) and (C.RDB$INDEX_NAM' +
        'E=D.RDB$INDEX_NAME) and'
      '(A.RDB$INDEX_NAME=E.RDB$INDEX_NAME)'
      'AND A.RDB$CONSTRAINT_NAME=?fk'
      
        'order by A.RDB$RELATION_NAME, A.RDB$CONSTRAINT_NAME, D.RDB$FIELD' +
        '_POSITION, E.RDB$FIELD_POSITION')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 128
    Top = 24
  end
end
