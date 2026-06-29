object DMEstadisticasComparadas: TDMEstadisticasComparadas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 352
  Top = 478
  Height = 530
  Width = 824
  object xEstadisticaClientes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM EST_CLIENTE_COMPARADA (?EMPRESA, ?EJERCICIO, ?CANA' +
        'L, ?DESDE, ?HASTA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 104
    object xEstadisticaClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xEstadisticaClientesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEstadisticaClientesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xEstadisticaClientesPERIODO: TFloatField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
    end
    object xEstadisticaClientesTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xEstadisticaClientesINCREMENTO: TFloatField
      DisplayLabel = 'Incremento'
      FieldName = 'INCREMENTO'
    end
    object xEstadisticaClientesINCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Incremento Total'
      FieldName = 'INCREMENTO_TOTAL'
    end
    object xEstadisticaClientesPERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Periodo Ant.'
      FieldName = 'PERIODO_ANTERIOR'
    end
    object xEstadisticaClientesTOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Total Ant.'
      FieldName = 'TOTAL_ANTERIOR'
    end
  end
  object DSxEstadisticaClientes: TDataSource
    DataSet = xEstadisticaClientes
    Left = 232
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 368
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 424
    Top = 8
  end
  object DSxEstadisticaArticulos: TDataSource
    DataSet = xEstadisticaArticulos
    Left = 232
    Top = 8
  end
  object xEstadisticaArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM EST_ARTICULO_COMPARADA (?EMPRESA, ?EJERCICIO, ?CAN' +
        'AL, ?DESDE, ?HASTA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object xEstadisticaArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEstadisticaArticulosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xEstadisticaArticulosPERIODO: TFloatField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
    end
    object xEstadisticaArticulosTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xEstadisticaArticulosINCREMENTO: TFloatField
      DisplayLabel = 'Incremento'
      FieldName = 'INCREMENTO'
    end
    object xEstadisticaArticulosINCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Incremento Total'
      FieldName = 'INCREMENTO_TOTAL'
    end
    object xEstadisticaArticulosPERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Periodo Ant.'
      FieldName = 'PERIODO_ANTERIOR'
    end
    object xEstadisticaArticulosTOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Total Ant.'
      FieldName = 'TOTAL_ANTERIOR'
    end
    object xEstadisticaArticulosUNID_PERIODO: TFloatField
      DisplayLabel = 'Uds. Periodo'
      FieldName = 'UNID_PERIODO'
    end
    object xEstadisticaArticulosUNID_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNID_TOTAL'
    end
    object xEstadisticaArticulosUNID_INCREMENTO: TFloatField
      DisplayLabel = 'Uds. Incremento'
      FieldName = 'UNID_INCREMENTO'
    end
    object xEstadisticaArticulosUNID_INCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Uds. Incr. Total'
      FieldName = 'UNID_INCREMENTO_TOTAL'
    end
    object xEstadisticaArticulosUNID_PERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Periodo Ant.'
      FieldName = 'UNID_PERIODO_ANTERIOR'
    end
    object xEstadisticaArticulosUNID_TOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Total Ant.'
      FieldName = 'UNID_TOTAL_ANTERIOR'
    end
  end
  object DSxEstadisticaFamilias: TDataSource
    DataSet = xEstadisticaFamilias
    Left = 232
    Top = 56
  end
  object xEstadisticaFamilias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM EST_FAMILIA_COMPARADA (?EMPRESA, ?EJERCICIO, ?CANA' +
        'L, ?DESDE, ?HASTA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 56
    object xEstadisticaFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 15
    end
    object xEstadisticaFamiliasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEstadisticaFamiliasPERIODO: TFloatField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
    end
    object xEstadisticaFamiliasTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xEstadisticaFamiliasINCREMENTO: TFloatField
      DisplayLabel = 'Incremento'
      FieldName = 'INCREMENTO'
    end
    object xEstadisticaFamiliasINCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Incremento Total'
      FieldName = 'INCREMENTO_TOTAL'
    end
    object xEstadisticaFamiliasPERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Periodo Ant.'
      FieldName = 'PERIODO_ANTERIOR'
    end
    object xEstadisticaFamiliasTOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Total Ant.'
      FieldName = 'TOTAL_ANTERIOR'
    end
    object xEstadisticaFamiliasUNID_PERIODO: TFloatField
      DisplayLabel = 'Uds. Periodo'
      FieldName = 'UNID_PERIODO'
    end
    object xEstadisticaFamiliasUNID_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNID_TOTAL'
    end
    object xEstadisticaFamiliasUNID_INCREMENTO: TFloatField
      DisplayLabel = 'Uds. Incremento'
      FieldName = 'UNID_INCREMENTO'
    end
    object xEstadisticaFamiliasUNID_INCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Uds. Incr. Total'
      FieldName = 'UNID_INCREMENTO_TOTAL'
    end
    object xEstadisticaFamiliasUNID_PERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Periodo Ant.'
      FieldName = 'UNID_PERIODO_ANTERIOR'
    end
    object xEstadisticaFamiliasUNID_TOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Total Ant.'
      FieldName = 'UNID_TOTAL_ANTERIOR'
    end
  end
  object xEstadisticaClientesFamilia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM EST_CLIENTE_FAMILIA_COMPARADA (?EMPRESA, ?EJERCICI' +
        'O, ?CANAL, ?DESDE, ?HASTA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 152
    object xEstadisticaClientesFamiliaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xEstadisticaClientesFamiliaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEstadisticaClientesFamiliaNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xEstadisticaClientesFamiliaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 15
    end
    object xEstadisticaClientesFamiliaTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object xEstadisticaClientesFamiliaPERIODO: TFloatField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
    end
    object xEstadisticaClientesFamiliaTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xEstadisticaClientesFamiliaINCREMENTO: TFloatField
      DisplayLabel = 'Incremento'
      FieldName = 'INCREMENTO'
    end
    object xEstadisticaClientesFamiliaINCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Incremento Total'
      FieldName = 'INCREMENTO_TOTAL'
    end
    object xEstadisticaClientesFamiliaPERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Periodo Ant.'
      FieldName = 'PERIODO_ANTERIOR'
    end
    object xEstadisticaClientesFamiliaTOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Total Ant.'
      FieldName = 'TOTAL_ANTERIOR'
    end
    object xEstadisticaClientesFamiliaUNID_PERIODO: TFloatField
      DisplayLabel = 'Uds. Periodo'
      FieldName = 'UNID_PERIODO'
    end
    object xEstadisticaClientesFamiliaUNID_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNID_TOTAL'
    end
    object xEstadisticaClientesFamiliaUNID_INCREMENTO: TFloatField
      DisplayLabel = 'Uds. Incremento'
      FieldName = 'UNID_INCREMENTO'
    end
    object xEstadisticaClientesFamiliaUNID_INCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Uds. Incr. Total'
      FieldName = 'UNID_INCREMENTO_TOTAL'
    end
    object xEstadisticaClientesFamiliaUNID_PERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Periodo Ant.'
      FieldName = 'UNID_PERIODO_ANTERIOR'
    end
    object xEstadisticaClientesFamiliaUNID_TOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Total Ant.'
      FieldName = 'UNID_TOTAL_ANTERIOR'
    end
  end
  object DSxEstadisticaClientesFamilia: TDataSource
    DataSet = xEstadisticaClientesFamilia
    Left = 232
    Top = 152
  end
  object xEstadisticaClientesArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM EST_CLIENTE_ARTICULO_COMPARADA (?EMPRESA, ?EJERCIC' +
        'IO, ?CANAL, ?DESDE, ?HASTA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 200
    object xEstadisticaClientesArticuloCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xEstadisticaClientesArticuloNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEstadisticaClientesArticuloNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xEstadisticaClientesArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEstadisticaClientesArticuloTITULO: TFIBStringField
      DisplayLabel = 'Titulo Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object xEstadisticaClientesArticuloPERIODO: TFloatField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
    end
    object xEstadisticaClientesArticuloTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xEstadisticaClientesArticuloINCREMENTO: TFloatField
      DisplayLabel = 'Incremento'
      FieldName = 'INCREMENTO'
    end
    object xEstadisticaClientesArticuloINCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Incremento Total'
      FieldName = 'INCREMENTO_TOTAL'
    end
    object xEstadisticaClientesArticuloPERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Periodo Ant.'
      FieldName = 'PERIODO_ANTERIOR'
    end
    object xEstadisticaClientesArticuloTOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Total Ant.'
      FieldName = 'TOTAL_ANTERIOR'
    end
    object xEstadisticaClientesArticuloUNID_PERIODO: TFloatField
      DisplayLabel = 'Uds. Periodo'
      FieldName = 'UNID_PERIODO'
    end
    object xEstadisticaClientesArticuloUNID_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNID_TOTAL'
    end
    object xEstadisticaClientesArticuloUNID_INCREMENTO: TFloatField
      DisplayLabel = 'Uds. Incremento'
      FieldName = 'UNID_INCREMENTO'
    end
    object xEstadisticaClientesArticuloUNID_INCREMENTO_TOTAL: TFloatField
      DisplayLabel = 'Uds. Incr. Total'
      FieldName = 'UNID_INCREMENTO_TOTAL'
    end
    object xEstadisticaClientesArticuloUNID_PERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Periodo Ant.'
      FieldName = 'UNID_PERIODO_ANTERIOR'
    end
    object xEstadisticaClientesArticuloUNID_TOTAL_ANTERIOR: TFloatField
      DisplayLabel = 'Uds. Total Ant.'
      FieldName = 'UNID_TOTAL_ANTERIOR'
    end
  end
  object DSxEstadisticaClientesArticulo: TDataSource
    DataSet = xEstadisticaClientesArticulo
    Left = 232
    Top = 200
  end
end
