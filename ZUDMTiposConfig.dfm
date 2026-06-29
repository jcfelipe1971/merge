object ZDMTiposConfig: TZDMTiposConfig
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 509
  Top = 185
  Height = 313
  Width = 391
  object QMConfig: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_TIPOS_CONFIG'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_TIPOS_CONFIG'
      '  (TIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_TIPOS_CONFIG'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPOS_CONFIG'
      'order by tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_TIPOS_CONFIG'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterOpen = QMConfigAfterOpen
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_TIPOS_CONFIG'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMConfigTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMConfigDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object QMConfigDefecto: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  SUBTIPO=?old_SUBTIPO AND '
      '  CAMPO=?old_CAMPO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_TIPOS_CONFIG_DET_DATOS'
      
        '  (TIPO,SUBTIPO,VISIBLE,ORDEN,CAMPO,HABILITADO,CAMPO_CALCULADO,V' +
        'ALOR_DEFECTO)'
      'VALUES'
      
        '  (?TIPO,?SUBTIPO,?VISIBLE,?ORDEN,?CAMPO,?HABILITADO,?CAMPO_CALC' +
        'ULADO,?VALOR_DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  SUBTIPO=?SUBTIPO AND '
      '  CAMPO=?CAMPO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'where tipo=?tipo and subtipo=0'
      'order by orden, campo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'SET'
      '  VISIBLE=?VISIBLE '
      '  ,ORDEN=?ORDEN '
      '  ,HABILITADO=?HABILITADO '
      '  ,CAMPO_CALCULADO=?CAMPO_CALCULADO '
      '  ,VALOR_DEFECTO=?VALOR_DEFECTO '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  SUBTIPO=?SUBTIPO AND '
      '  CAMPO=?CAMPO ')
    DataSource = DSQMConfig
    AfterPost = QMConfigDefectoAfterPost
    ClavesPrimarias.Strings = (
      'TIPO'
      'SUBTIPO'
      'CAMPO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_TIPOS_CONFIG_DET_DATOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMConfigDefectoTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMConfigDefectoSUBTIPO: TIntegerField
      DisplayLabel = 'Subtipo'
      FieldName = 'SUBTIPO'
    end
    object QMConfigDefectoCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 31
    end
    object QMConfigDefectoVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMConfigDefectoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMConfigDefectoHABILITADO: TIntegerField
      DisplayLabel = 'Habilitado'
      FieldName = 'HABILITADO'
    end
    object QMConfigDefectoCAMPO_CALCULADO: TIntegerField
      DisplayLabel = 'Calculado'
      FieldName = 'CAMPO_CALCULADO'
    end
    object QMConfigDefectoVALOR_DEFECTO: TFIBStringField
      DisplayLabel = 'Valor Def.'
      FieldName = 'VALOR_DEFECTO'
      Size = 60
    end
  end
  object QMConfigDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_TIPOS_CONFIG_DET'
      'WHERE'
      '  SUBTIPO=?old_SUBTIPO AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_TIPOS_CONFIG_DET'
      '  (TIPO,SUBTIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?SUBTIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_TIPOS_CONFIG_DET'
      'WHERE'
      '  SUBTIPO=?SUBTIPO AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPOS_CONFIG_DET'
      'where tipo=?tipo and subtipo>0'
      'order by subtipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_TIPOS_CONFIG_DET'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  SUBTIPO=?SUBTIPO AND '
      '  TIPO=?TIPO ')
    DataSource = DSQMConfig
    AfterOpen = QMConfigDetAfterOpen
    OnNewRecord = QMConfigDetNewRecord
    ClavesPrimarias.Strings = (
      'SUBTIPO '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_TIPOS_CONFIG_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 128
    object QMConfigDetTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMConfigDetSUBTIPO: TIntegerField
      DisplayLabel = 'Subtipo'
      FieldName = 'SUBTIPO'
    end
    object QMConfigDetDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object QMConfigDetDatos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  SUBTIPO=?old_SUBTIPO AND '
      '  CAMPO=?old_CAMPO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_TIPOS_CONFIG_DET_DATOS'
      
        '  (TIPO,SUBTIPO,VISIBLE,ORDEN,CAMPO,HABILITADO,CAMPO_CALCULADO,V' +
        'ALOR_DEFECTO)'
      'VALUES'
      
        '  (?TIPO,?SUBTIPO,?VISIBLE,?ORDEN,?CAMPO,?HABILITADO,?CAMPO_CALC' +
        'ULADO,?VALOR_DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  SUBTIPO=?SUBTIPO AND '
      '  CAMPO=?CAMPO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'where tipo=?tipo and subtipo=?SUBTIPO'
      'order by orden, campo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'SET'
      '  VISIBLE=?VISIBLE '
      '  ,ORDEN=?ORDEN '
      '  ,HABILITADO=?HABILITADO '
      '  ,CAMPO_CALCULADO=?CAMPO_CALCULADO '
      '  ,VALOR_DEFECTO=?VALOR_DEFECTO '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  SUBTIPO=?SUBTIPO AND '
      '  CAMPO=?CAMPO ')
    DataSource = DSQMConfigDet
    ClavesPrimarias.Strings = (
      'TIPO'
      'SUBTIPO'
      'CAMPO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_TIPOS_CONFIG_DET_DATOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 176
    object QMConfigDetDatosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMConfigDetDatosSUBTIPO: TIntegerField
      DisplayLabel = 'Subtipo'
      FieldName = 'SUBTIPO'
    end
    object QMConfigDetDatosCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 31
    end
    object QMConfigDetDatosVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMConfigDetDatosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMConfigDetDatosHABILITADO: TIntegerField
      DisplayLabel = 'Habilitado'
      FieldName = 'HABILITADO'
    end
    object QMConfigDetDatosCAMPO_CALCULADO: TIntegerField
      DisplayLabel = 'Calculado'
      FieldName = 'CAMPO_CALCULADO'
    end
    object QMConfigDetDatosVALOR_DEFECTO: TFIBStringField
      DisplayLabel = 'Valor Def.'
      FieldName = 'VALOR_DEFECTO'
      Size = 60
    end
  end
  object DSQMConfig: TDataSource
    DataSet = QMConfig
    Left = 139
    Top = 16
  end
  object DSQMConfigDefecto: TDataSource
    DataSet = QMConfigDefecto
    Left = 139
    Top = 64
  end
  object DSQMConfigDet: TDataSource
    DataSet = QMConfigDet
    Left = 144
    Top = 128
  end
  object DSQMConfigDetDatos: TDataSource
    DataSet = QMConfigDetDatos
    Left = 144
    Top = 176
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 234
    Top = 18
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 234
    Top = 66
  end
end
