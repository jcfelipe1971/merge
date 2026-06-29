object DMSincronizacionTiendaMasYMasBarato: TDMSincronizacionTiendaMasYMasBarato
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 103
  Height = 296
  Width = 499
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 8
  end
  object MSSQLConnection: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=Balala1ka&Uk3l3l3;User ID=dikram;Ext' +
      'ended Properties="DSN=masymasbarato;Description=Tienda Carlos Ma' +
      's y Mas Barato;UID=dikram;PWD=Balala1ka&Uk3l3l3;APP=Enterprise;W' +
      'SID=VMDUILIO-543;DATABASE=masymasbarato;Network=DBMSSOCN;Address' +
      '=85.214.55.138,1433"'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'MSDASQL.1'
    Left = 56
    Top = 24
  end
  object QMSSQL: TADOQuery
    CacheSize = 100
    Connection = MSSQLConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT [idComanda]'
      '      ,[DataComanda]'
      '      ,[afNom]'
      '      ,[afCognoms]'
      '      ,[afEmpresa]'
      '      ,[afNIF]'
      '      ,[afAdreca1]'
      '      ,[afAdreca2]'
      '      ,[afCP]'
      '      ,[afPoblcacion]'
      '      ,[afProvincia]'
      '      ,[Email]'
      '      ,[Telefon]'
      '      ,[aeNom]'
      '      ,[aeCognoms]'
      '      ,[aeAdreca1]'
      '      ,[aeAdreca2]'
      '      ,[aeCP]'
      '      ,[aePoblacion]'
      '      ,[aeProvincia]'
      '      ,[aiNom]'
      '      ,[aiCognoms]'
      '      ,[aiAdreca1]'
      '      ,[aiAdreca2]'
      '      ,[aiCP]'
      '      ,[aiPoblacion]'
      '      ,[aiProvincia]'
      '      ,[aiEmail]'
      '      ,[aiTelefon]'
      '      ,[OpcioTransport]'
      '      ,[ConfirmatClient]'
      '      ,[ConfirmatPagament]'
      '      ,[PassatProveidors]'
      '      ,[ComandaRebuda]'
      '      ,[idSeguimentTransportista]'
      '      ,[Incidencia]'
      '      ,[idIncidencia]'
      '      ,[idClient]'
      '      ,[idPagament]'
      '      ,[BISumaMercaderies]'
      '      ,[IVAMercaderies]'
      '      ,[TotalMercaderies]'
      '      ,[BITransport]'
      '      ,[IVATransport]'
      '      ,[TotalTransport]'
      '      ,[BIPagament]'
      '      ,[IVAPagament]'
      '      ,[TOTALPagament]'
      '      ,[BITotal]'
      '      ,[IVATotal]'
      '      ,[TotalPagar]'
      '      ,[idSessio]'
      '  FROM [masymasbarato].[dbo].[ComandaClient_cap]')
    Left = 160
    Top = 24
  end
  object QMConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_MAS_Y_MAS_BARATO'
      'WHERE'
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_MAS_Y_MAS_BARATO'
      
        '  (DSN,EMPRESA,CANAL,FORMA_PAGO,SERIE,ACTIVO,ALMACEN,AGENTE,ULT_' +
        'FACTURA)'
      'VALUES'
      
        '  (?DSN,?EMPRESA,?CANAL,?FORMA_PAGO,?SERIE,?ACTIVO,?ALMACEN,?AGE' +
        'NTE,?ULT_FACTURA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_MAS_Y_MAS_BARATO'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONF_MAS_Y_MAS_BARATO'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_MAS_Y_MAS_BARATO'
      'SET'
      '  DSN=?DSN '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,SERIE=?SERIE '
      '  ,ACTIVO=?ACTIVO '
      '  ,ALMACEN=?ALMACEN '
      '  ,AGENTE=?AGENTE '
      '  ,ULT_FACTURA=?ULT_FACTURA '
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfiguracionNewRecord
    ClavesPrimarias.Strings = (
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_MAS_Y_MAS_BARATO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 80
    object QMConfiguracionDSN: TFIBStringField
      DisplayLabel = 'D.S.N.'
      FieldName = 'DSN'
      Size = 200
    end
    object QMConfiguracionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfiguracionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConfiguracionFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMConfiguracionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfiguracionACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfiguracionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMConfiguracionAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMConfiguracionULT_FACTURA: TIntegerField
      DisplayLabel = 'Ult. Factura'
      FieldName = 'ULT_FACTURA'
    end
  end
  object DSQMConfPrestaShop: TDataSource
    DataSet = QMConfiguracion
    Left = 160
    Top = 80
  end
end
