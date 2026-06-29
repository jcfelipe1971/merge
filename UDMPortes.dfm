object DMPortes: TDMPortes
  OldCreateOrder = False
  OnCreate = DMFormasPagoCreate
  Left = 437
  Top = 266
  Height = 432
  Width = 502
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 16
  end
  object QMPortes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_PORTES'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_PORTES'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,TITULO,CTA_COMPRAS,CTA_DEV_COMPR' +
        'AS,CTA_VENTAS,CTA_DEV_VENTAS,PAIS,TIPO_IVA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?TITULO,?CTA_COMPRAS,?CTA_DE' +
        'V_COMPRAS,?CTA_VENTAS,?CTA_DEV_VENTAS,?PAIS,?TIPO_IVA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_PORTES'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_PORTES'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_PORTES'
      'SET'
      '  TITULO=?TITULO '
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_DEV_COMPRAS=?CTA_DEV_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEV_VENTAS=?CTA_DEV_VENTAS '
      '  ,PAIS=?PAIS '
      '  ,TIPO_IVA=?TIPO_IVA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TIPO=?TIPO')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMPortesNewRecord
    ClavesPrimarias.Strings = (
      'TIPO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_PORTES'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'CON_CUENTAS_GES_PORTES')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,TIPO')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMPortesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPortesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPortesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPortesTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMPortesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPortesCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      OnChange = QMPortesCTA_COMPRASChange
      Size = 15
    end
    object QMPortesCTA_DEV_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEV_COMPRAS'
      OnChange = QMPortesCTA_DEV_COMPRASChange
      Size = 15
    end
    object QMPortesCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      OnChange = QMPortesCTA_VENTASChange
      Size = 15
    end
    object QMPortesCTA_DEV_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEV_VENTAS'
      OnChange = QMPortesCTA_DEV_VENTASChange
      Size = 15
    end
    object QMPortesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMPortesTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMPortesTIPO_IVAChange
    end
  end
  object DSQMPortes: TDataSource
    DataSet = QMPortes
    Left = 144
    Top = 16
  end
  object QMPortesIdiomas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_PORTES_IDIOMAS'
      'WHERE'
      '  IDIOMA=?old_IDIOMA AND '
      '  TIPO=?old_TIPO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_PORTES_IDIOMAS'
      '  (EMPRESA,EJERCICIO,CANAL,TIPO,IDIOMA,TITULO)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?IDIOMA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_PORTES_IDIOMAS'
      'WHERE'
      '  IDIOMA=?IDIOMA AND '
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_PORTES_IDIOMAS'
      'WHERE EMPRESA=?EMPRESA AND '
      '              EJERCICIO=?EJERCICIO AND'
      '              CANAL=?CANAL AND'
      '              TIPO=?TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_PORTES_IDIOMAS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  IDIOMA=?IDIOMA')
    DataSource = DSQMPortes
    AfterDelete = GrabaIdioma
    AfterPost = GrabaIdioma
    OnNewRecord = QMPortesIdiomasNewRecord
    ClavesPrimarias.Strings = (
      'IDIOMA '
      'TIPO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_PORTES_IDIOMAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'CON_CUENTAS_GES_PORTES_IDIOMAS')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,TIPO,IDIOMA')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 256
    object QMPortesIdiomasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPortesIdiomasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPortesIdiomasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPortesIdiomasTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMPortesIdiomasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMPortesIdiomasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMPortesIdiomas: TDataSource
    DataSet = QMPortesIdiomas
    Left = 144
    Top = 256
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT P_IVA, P_RECARGO, TITULO FROM SYS_TIPO_IVA   '
      'where pais=?pais and tipo = ?tipo_iva                ')
    UniDirectional = False
    DataSource = DSQMPortes
    Left = 232
    Top = 16
    object xTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xTipoIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSxTipoIva: TDataSource
    DataSet = xTipoIva
    Left = 344
    Top = 16
  end
  object xCta_Comp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CONTRA_CONTABLES'
      'where((empresa=?empresa)and(ejercicio=?ejercicio)and'
      '(canal=?canal)and(cuenta=?cta_compras))       ')
    UniDirectional = True
    DataSource = DSQMPortes
    Left = 232
    Top = 64
  end
  object DSxCta_Comp: TDataSource
    DataSet = xCta_Comp
    Left = 344
    Top = 64
  end
  object xCta_Vent: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CONTRA_CONTABLES'
      'where((empresa=?empresa)and(ejercicio=?ejercicio)and'
      '(canal=?canal)and(cuenta=?cta_ventas))          ')
    UniDirectional = True
    DataSource = DSQMPortes
    Left = 232
    Top = 112
  end
  object DSxCta_Vent: TDataSource
    DataSet = xCta_Vent
    Left = 344
    Top = 112
  end
  object xCta_Dev_Comp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CONTRA_CONTABLES'
      'where((empresa=?empresa)and(ejercicio=?ejercicio)and'
      '(canal=?canal)and(cuenta=?cta_dev_compras))       ')
    UniDirectional = True
    DataSource = DSQMPortes
    Left = 232
    Top = 160
  end
  object DSxCta_Dev_Comp: TDataSource
    DataSet = xCta_Dev_Comp
    Left = 344
    Top = 160
  end
  object DSxCta_Dev_Vent: TDataSource
    DataSet = xCta_Dev_Vent
    Left = 344
    Top = 208
  end
  object xCta_Dev_Vent: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CONTRA_CONTABLES'
      'where((empresa=?empresa)and(ejercicio=?ejercicio)and'
      '(canal=?canal)and(cuenta=?cta_dev_ventas))          ')
    UniDirectional = True
    Left = 232
    Top = 208
  end
  object QMSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_PORTES_EECS'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_PORTES_EECS'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,CTA_COMPRAS,CTA_DEV_COMPRA' +
        'S,CTA_VENTAS,CTA_DEV_VENTAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?CTA_COMPRAS,?CTA_DEV' +
        '_COMPRAS,?CTA_VENTAS,?CTA_DEV_VENTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_PORTES_EECS'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_PORTES_EECS'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               TIPO=?TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_PORTES_EECS'
      'SET'
      '  CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_DEV_COMPRAS=?CTA_DEV_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEV_VENTAS=?CTA_DEV_VENTAS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE')
    DataSource = DSQMPortes
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMSeriesNewRecord
    ClavesPrimarias.Strings = (
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_PORTES_EECS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 304
    object QMSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      OnChange = QMSeriesSERIEChange
      Size = 10
    end
    object QMSeriesTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMSeriesCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      OnChange = QMSeriesCTA_COMPRASChange
      Size = 15
    end
    object QMSeriesCTA_DEV_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEV_COMPRAS'
      OnChange = QMSeriesCTA_DEV_COMPRASChange
      Size = 15
    end
    object QMSeriesCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      OnChange = QMSeriesCTA_VENTASChange
      Size = 15
    end
    object QMSeriesCTA_DEV_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEV_VENTAS'
      OnChange = QMSeriesCTA_DEV_VENTASChange
      Size = 15
    end
  end
  object DSQMSeries: TDataSource
    DataSet = QMSeries
    Left = 144
    Top = 304
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_SERIES'
      'WHERE EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SERIE = ?SERIE')
    UniDirectional = True
    DataSource = DSQMSeries
    Left = 232
    Top = 304
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 344
    Top = 304
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 64
  end
end
