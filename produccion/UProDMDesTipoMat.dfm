object ProDMDesTipoMat: TProDMDesTipoMat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 405
  Top = 207
  Height = 268
  Width = 302
  object DSCabTipoMat: TDataSource
    DataSet = QMCabTipoMat
    Left = 128
    Top = 40
  end
  object QMCabTipoMat: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DES_CAB_MATERIAL'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DES_CAB_MATERIAL'
      '  (TIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DES_CAB_MATERIAL'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DES_CAB_MATERIAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DES_CAB_MATERIAL'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterOpen = QMCabTipoMatAfterOpen
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DES_CAB_MATERIAL'
    UpdateTransaction = TLocal
    Left = 32
    Top = 40
    object QMCabTipoMatTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabTipoMatDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMCabTipoMatID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
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
    Left = 208
    Top = 24
  end
  object QMDetTipoMat: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DES_DET_MATERIAL'
      'WHERE'
      '  ID_CAB=?old_ID_CAB AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DES_DET_MATERIAL'
      '  (POR_DEFECTO,LINEA,ID_CAB,ARTICULO)'
      'VALUES'
      '  (?POR_DEFECTO,?LINEA,?ID_CAB,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DES_DET_MATERIAL'
      'WHERE'
      '  ID_CAB=?ID_CAB AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DES_DET_MATERIAL'
      'where id_cab=?id'
      'order by id_cab,linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DES_DET_MATERIAL'
      'SET'
      '  POR_DEFECTO=?POR_DEFECTO '
      '  ,ARTICULO=?ARTICULO '
      'WHERE'
      '  ID_CAB=?ID_CAB AND '
      '  LINEA=?LINEA ')
    DataSource = DSCabTipoMat
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMDetTipoMatNewRecord
    ClavesPrimarias.Strings = (
      'ID_CAB '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DES_DET_MATERIAL'
    UpdateTransaction = TLocal
    Left = 32
    Top = 104
    object QMDetTipoMatID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMDetTipoMatARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMDetTipoMatARTICULOChange
      Size = 15
    end
    object QMDetTipoMatLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetTipoMatDescArticulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMDetTipoMatDescArticuloGetText
      Size = 60
      Calculated = True
    end
    object QMDetTipoMatPOR_DEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'POR_DEFECTO'
    end
  end
  object DSDetTipoMat: TDataSource
    DataSet = QMDetTipoMat
    Left = 128
    Top = 104
  end
  object xLineaDetTipoMat: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea)  as NLinea from pro_des_det_material'
      'where (id_cab=?idcab)')
    Transaction = TLocal
    AutoTrans = True
    Left = 32
    Top = 160
  end
  object xDescArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 144
    Top = 160
    object xDescArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
end
