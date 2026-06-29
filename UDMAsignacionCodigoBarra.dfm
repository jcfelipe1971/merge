object DMAsignacionCodigoBarra: TDMAsignacionCodigoBarra
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 106
  Height = 286
  Width = 284
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 16
  end
  object QMCodigosBarra: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_BARRAS_INSERT'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  BARRAS=?old_BARRAS AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_BARRAS_INSERT'
      '  (EMPRESA,ARTICULO,TIPO,FUNCION,TITULO,LONGITUD,ID_A)'
      'VALUES'
      '  (?EMPRESA,?ARTICULO,?TIPO,?FUNCION,?TITULO,?LONGITUD,?ID_A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_BARRAS_INSERT'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  BARRAS=?old_BARRAS AND '
      '  TIPO=?old_TIPO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_BARRAS_INSERT'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO '
      'ORDER BY ARTICULO, BARRAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_BARRAS_INSERT'
      'SET'
      '  BARRAS=?new_BARRAS'
      '  ,FUNCION=?FUNCION '
      '  ,TIPO=?new_TIPO'
      '  ,TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  BARRAS=?old_BARRAS AND '
      '  TIPO=?old_TIPO ')
    BeforePost = QMCodigosBarraBeforePost
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'BARRAS '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_BARRAS_INSERT'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMCodigosBarraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCodigosBarraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCodigosBarraBARRAS: TFIBStringField
      DisplayLabel = 'Cod. Barra'
      FieldName = 'BARRAS'
      Size = 25
    end
    object QMCodigosBarraTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCodigosBarraFUNCION: TIntegerField
      DisplayLabel = 'Funcion'
      FieldName = 'FUNCION'
    end
    object QMCodigosBarraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMCodigosBarraLONGITUD: TIntegerField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
    object QMCodigosBarraID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
  end
  object DSQMCodigosBarra: TDataSource
    DataSet = QMCodigosBarra
    Left = 144
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 144
    Top = 16
  end
end
