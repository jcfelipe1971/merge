object DMInfoTercero: TDMInfoTercero
  OldCreateOrder = False
  OnCreate = DMInfoTerceroCreate
  Left = 435
  Top = 163
  Height = 317
  Width = 396
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS'
      'where tercero=?tercero')
    UniDirectional = False
    Left = 32
    Top = 12
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 133
    Top = 12
  end
  object xTituloRazon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO'
      'FROM SYS_TERCEROS_RAZONES'
      'WHERE'
      '    RAZON=?TIPO_RAZON')
    UniDirectional = False
    DataSource = DSxTercero
    Left = 32
    Top = 68
  end
  object DSxTituloRazon: TDataSource
    DataSet = xTituloRazon
    Left = 138
    Top = 70
  end
  object xDireccionPrincipal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_DIRECCIONES       '
      'WHERE TERCERO=?TERCERO AND DIR_DEFECTO=1')
    UniDirectional = False
    DataSource = DSxTercero
    Left = 34
    Top = 126
    object xDireccionPrincipalTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDireccionPrincipalDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xDireccionPrincipalDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xDireccionPrincipalDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xDireccionPrincipalDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xDireccionPrincipalCOMPOSICION: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPOSICION'
      Size = 60
      Calculated = True
    end
    object xDireccionPrincipalDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xDireccionPrincipalDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      OnChange = xDireccionPrincipalDIR_TIPOChange
      Size = 3
    end
    object xDireccionPrincipalDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xDireccionPrincipalDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xDireccionPrincipalDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xDireccionPrincipalDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xDireccionPrincipalDIR_CLASE: TIntegerField
      DisplayLabel = 'Clase'
      FieldName = 'DIR_CLASE'
      OnChange = xDireccionPrincipalDIR_CLASEChange
    end
  end
  object DSxDireccionPrincipal: TDataSource
    DataSet = xDireccionPrincipal
    Left = 138
    Top = 128
  end
  object xLocalidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad=?dir_localidad')
    UniDirectional = False
    DataSource = DSxDireccionPrincipal
    Left = 226
    Top = 20
  end
  object DSxLocalidad: TDataSource
    DataSet = xLocalidad
    Left = 292
    Top = 20
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_BANCOS'
      'where tercero = ?tercero order by banco')
    UniDirectional = False
    DataSource = DSxTercero
    Left = 228
    Top = 76
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 296
    Top = 76
  end
  object xContactos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_CONTACTOS'
      'where tercero = ?tercero')
    UniDirectional = False
    DataSource = DSxTercero
    Left = 228
    Top = 126
  end
  object DSxContactos: TDataSource
    DataSet = xContactos
    Left = 296
    Top = 124
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_DIRECCIONES'
      'WHERE TERCERO=?TERCERO AND DIR_DEFECTO<>1')
    UniDirectional = False
    DataSource = DSxTercero
    Left = 228
    Top = 172
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 296
    Top = 172
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 30
    Top = 178
  end
  object xTipDir_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_DIRECCION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_DIRECCION             '
      'where tipo=?DIR_TIPO')
    UniDirectional = False
    DataSource = DSxDireccionPrincipal
    Left = 224
    Top = 226
  end
  object DSxTipDir_T: TDataSource
    DataSet = xTipDir_T
    Left = 296
    Top = 224
  end
  object xClasDir_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TITULO'
      'FROM SYS_CLASE_DIRECCION'
      'WHERE'
      '  CLASE=?CLASE ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_CLASE_DIRECCION'
      'where clase=?dir_clase')
    UniDirectional = False
    DataSource = DSxDireccionPrincipal
    Left = 36
    Top = 237
  end
  object DSxClasDir_T: TDataSource
    DataSet = xClasDir_T
    Left = 108
    Top = 237
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 118
    Top = 178
  end
end
