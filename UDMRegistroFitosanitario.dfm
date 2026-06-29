object DMRegistroFitosanitario: TDMRegistroFitosanitario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 728
  Top = 247
  Height = 421
  Width = 552
  object QMRegistroFitosanitario: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_REGISTRO_FITOSANITARIO'
      'WHERE'
      '  ID_REGISTRO_FITOSANITARIO=?old_ID_REGISTRO_FITOSANITARIO ')
    InsertSQL.Strings = (
      'INSERT INTO GES_REGISTRO_FITOSANITARIO'
      
        '  (ID_REGISTRO_FITOSANITARIO,EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,' +
        'RIG,LINEA,ID_S,ID_DETALLES_S,TIPO_REGISTRO,ARTICULO,DESCRIPCION,' +
        'LOTE,CANTIDAD,FECHA,NIF,NOMBRE,DIRECCION,C_POSTAL,LOCALIDAD,COD_' +
        'REG_FITOSANITARIO,CARNET_APLICADOR,NOTAS)'
      'VALUES'
      
        '  (?ID_REGISTRO_FITOSANITARIO,?EMPRESA,?EJERCICIO,?CANAL,?SERIE,' +
        '?TIPO,?RIG,?LINEA,?ID_S,?ID_DETALLES_S,?TIPO_REGISTRO,?ARTICULO,' +
        '?DESCRIPCION,?LOTE,?CANTIDAD,?FECHA,?NIF,?NOMBRE,?DIRECCION,?C_P' +
        'OSTAL,?LOCALIDAD,?COD_REG_FITOSANITARIO,?CARNET_APLICADOR,?NOTAS' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_REGISTRO_FITOSANITARIO'
      'WHERE'
      '  ID_REGISTRO_FITOSANITARIO=?ID_REGISTRO_FITOSANITARIO ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_REGISTRO_FITOSANITARIO'
      'WHERE'
      'EMPRESA = ?EMPRESA AND '
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL'
      'ORDER BY ID_REGISTRO_FITOSANITARIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_REGISTRO_FITOSANITARIO'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ID_S=?ID_S '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,TIPO_REGISTRO=?TIPO_REGISTRO '
      '  ,ARTICULO=?ARTICULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,LOTE=?LOTE '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,FECHA=?FECHA '
      '  ,NIF=?NIF '
      '  ,NOMBRE=?NOMBRE '
      '  ,DIRECCION=?DIRECCION '
      '  ,C_POSTAL=?C_POSTAL '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,COD_REG_FITOSANITARIO=?COD_REG_FITOSANITARIO'
      '  ,CARNET_APLICADOR=?CARNET_APLICADOR'
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  ID_REGISTRO_FITOSANITARIO=?ID_REGISTRO_FITOSANITARIO ')
    BeforePost = QMRegistroFitosanitarioBeforePost
    OnNewRecord = QMRegistroFitosanitarioNewRecord
    ClavesPrimarias.Strings = (
      'ID_REGISTRO_FITOSANITARIO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_REGISTRO_FITOSANITARIO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMRegistroFitosanitarioID_REGISTRO_FITOSANITARIO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_REGISTRO_FITOSANITARIO'
    end
    object QMRegistroFitosanitarioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRegistroFitosanitarioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRegistroFitosanitarioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRegistroFitosanitarioSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMRegistroFitosanitarioTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMRegistroFitosanitarioRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMRegistroFitosanitarioLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMRegistroFitosanitarioID_S: TIntegerField
      FieldName = 'ID_S'
      OnChange = QMRegistroFitosanitarioID_SChange
    end
    object QMRegistroFitosanitarioID_DETALLES_S: TIntegerField
      FieldName = 'ID_DETALLES_S'
      OnChange = QMRegistroFitosanitarioID_DETALLES_SChange
    end
    object QMRegistroFitosanitarioTIPO_REGISTRO: TFIBStringField
      DisplayLabel = 'Tipo Reg. Fitosanitario'
      FieldName = 'TIPO_REGISTRO'
      Size = 1
    end
    object QMRegistroFitosanitarioARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMRegistroFitosanitarioARTICULOChange
      Size = 15
    end
    object QMRegistroFitosanitarioDESCRIPCION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object QMRegistroFitosanitarioCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMRegistroFitosanitarioFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMRegistroFitosanitarioNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMRegistroFitosanitarioNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMRegistroFitosanitarioDIRECCION: TFIBStringField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECCION'
      Size = 100
    end
    object QMRegistroFitosanitarioC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object QMRegistroFitosanitarioLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localildad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMRegistroFitosanitarioLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMRegistroFitosanitarioCOD_REG_FITOSANITARIO: TFIBStringField
      DisplayLabel = 'Reg. Fitosanitario'
      FieldName = 'COD_REG_FITOSANITARIO'
      Size = 40
    end
    object QMRegistroFitosanitarioCARNET_APLICADOR: TFIBStringField
      DisplayLabel = 'Carnet de Aplicador'
      FieldName = 'CARNET_APLICADOR'
    end
    object QMRegistroFitosanitarioNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMRegistroFitosanitarioFECHA_VALIDEZ_CARNET_APLICADOR: TDateTimeField
      DisplayLabel = 'Fec. Validez Carnet'
      FieldName = 'FECHA_VALIDEZ_CARNET_APLICADOR'
    end
  end
  object DSQMRegistroFitosanitario: TDataSource
    DataSet = QMRegistroFitosanitario
    Left = 184
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 408
    Top = 16
  end
end
