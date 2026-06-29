object DMTipoModelo: TDMTipoModelo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 443
  Top = 217
  Height = 235
  Width = 222
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 128
    Top = 28
  end
  object DSQMTipoModelo: TDataSource
    DataSet = QMTipoModelo
    Left = 36
    Top = 80
  end
  object QMTipoModelo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_TIPO_MODELO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_TIPO_MODELO'
      '  (CODIGO,DESCRIPCION,PREFIJO_ARTICULO,PREFIJO_TITULO_ART)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION,?PREFIJO_ARTICULO,?PREFIJO_TITULO_ART)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_TIPO_MODELO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_TIPO_MODELO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_TIPO_MODELO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION, '
      '  PREFIJO_ARTICULO=?PREFIJO_ARTICULO,'
      '  PREFIJO_TITULO_ART=?PREFIJO_TITULO_ART'
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_TIPO_MODELO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 36
    Top = 24
    object QMTipoModeloCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ReadOnly = True
      Size = 1
    end
    object QMTipoModeloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
    object QMTipoModeloPREFIJO_ARTICULO: TFIBStringField
      DisplayLabel = 'Prefijo Articulo'
      FieldName = 'PREFIJO_ARTICULO'
      Size = 3
    end
    object QMTipoModeloPREFIJO_TITULO_ART: TFIBStringField
      DisplayLabel = 'Prefijo Titulo'
      FieldName = 'PREFIJO_TITULO_ART'
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
    Left = 128
    Top = 84
  end
end
