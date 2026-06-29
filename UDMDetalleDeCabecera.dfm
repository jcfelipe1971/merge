object DMDetalleDeCabecera: TDMDetalleDeCabecera
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 329
  Top = 99
  Height = 253
  Width = 328
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
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
    Left = 264
    Top = 64
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_DETALLE'
      
        '  (SERIE,DIRECCION,RIG,ID_S,ENTRADA,EMPRESA,EJERCICIO,CANAL,TRAN' +
        'SP_INSTAL,VEHICULO_ESPECIAL,TIPO_VEHICULO,CONTACTO,TELEFONO,EMAI' +
        'L,TIPO,TIPO_SERVICIO)'
      'VALUES'
      
        '  (?SERIE,?DIRECCION,?RIG,?ID_S,?ENTRADA,?EMPRESA,?EJERCICIO,?CA' +
        'NAL,?TRANSP_INSTAL,?VEHICULO_ESPECIAL,?TIPO_VEHICULO,?CONTACTO,?' +
        'TELEFONO,?EMAIL,?TIPO,?TIPO_SERVICIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_DETALLE'
      'WHERE ID_S = ?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_DETALLE'
      'SET'
      '  DIRECCION=?DIRECCION '
      '  ,ID_S=?ID_S '
      '  ,ENTRADA=?ENTRADA '
      '  ,TRANSP_INSTAL=?TRANSP_INSTAL '
      '  ,VEHICULO_ESPECIAL=?VEHICULO_ESPECIAL '
      '  ,TIPO_VEHICULO=?TIPO_VEHICULO '
      '  ,CONTACTO=?CONTACTO '
      '  ,TELEFONO=?TELEFONO '
      '  ,EMAIL=?EMAIL '
      '  ,TIPO_SERVICIO=?TIPO_SERVICIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    BeforePost = QMCabeceraBeforePost
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'TIPO'
      'RIG')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_DETALLE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMCabeceraID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMCabeceraTRANSP_INSTAL: TFIBStringField
      DisplayLabel = 'Transportista/Instalador'
      FieldName = 'TRANSP_INSTAL'
      Size = 60
    end
    object QMCabeceraVEHICULO_ESPECIAL: TIntegerField
      DisplayLabel = 'Vehiculo Especial'
      FieldName = 'VEHICULO_ESPECIAL'
    end
    object QMCabeceraTIPO_VEHICULO: TFIBStringField
      DisplayLabel = 'tipo Vehiculo'
      FieldName = 'TIPO_VEHICULO'
      Size = 60
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraDIRECCION: TBlobField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 8
    end
    object QMCabeceraCONTACTO: TFIBStringField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
      Size = 60
    end
    object QMCabeceraTELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
      Size = 60
    end
    object QMCabeceraEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMCabeceraTIPO_SERVICIO: TFIBStringField
      DisplayLabel = 'Tipo Servicio'
      FieldName = 'TIPO_SERVICIO'
      Size = 60
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 8
  end
end
