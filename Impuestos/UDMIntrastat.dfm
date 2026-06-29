object DMIntrastat: TDMIntrastat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 431
  Top = 210
  Height = 329
  Width = 504
  object QMIntrastat: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_INTRASTAT'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  PERIODO=?old_PERIODO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_INTRASTAT'
      '  (EMPRESA,EJERCICIO,CANAL,PERIODO,TIPO,COMENTARIOS,REAL_MOD)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PERIODO,?TIPO,?COMENTARIOS,?REAL_' +
        'MOD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_INTRASTAT'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  PERIODO=?PERIODO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_INTRASTAT'
      'WHERE'
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL'
      'ORDER BY PERIODO, TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_INTRASTAT'
      'SET'
      '  COMENTARIOS=?COMENTARIOS '
      '  ,REAL_MOD=?REAL_MOD '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  PERIODO=?PERIODO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMIntrastatAfterOpen
    AfterScroll = QMIntrastatAfterScroll
    BeforeClose = QMIntrastatBeforeClose
    ClavesPrimarias.Strings = (
      'TIPO '
      'PERIODO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_INTRASTAT'
    UpdateTransaction = TUpdate
    Left = 32
    Top = 24
    object QMIntrastatEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIntrastatEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMIntrastatCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMIntrastatPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMIntrastatTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMIntrastatCOMENTARIOS: TMemoField
      DisplayLabel = 'Comentarios'
      FieldName = 'COMENTARIOS'
      BlobType = ftMemo
      Size = 8
    end
    object QMIntrastatREAL_MOD: TIntegerField
      DisplayLabel = 'Modificado'
      FieldName = 'REAL_MOD'
    end
  end
  object DSQMIntrastat: TDataSource
    DataSet = QMIntrastat
    Left = 112
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 208
    Top = 24
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_INTRASTAT_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PERIODO=?old_PERIODO AND '
      '  TIPO=?old_TIPO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_INTRASTAT_DETALLE'
      
        '  (MASA_NETA,UNIDADES_SUPLEMENTARIAS,VALOR,VALOR_ESTADISTICO,LIN' +
        'EA,EMPRESA,EJERCICIO,CANAL,PERIODO,ESTADO_MIEMBRO,PROVINCIA_ORI_' +
        'DES,NATURALEZA_TRANSACCION,MODALIDAD_TRANSPORTE,CODIGO_MERCANCIA' +
        ',PAIS_ORIGEN,IVA_VIES,TIPO,COND_ENTREGA,PUERTO_CARGA_DESCARGA,RE' +
        'GIMEN_ESTADISTICO,I_PORTE_PROPORCIONAL)'
      'VALUES'
      
        '  (?MASA_NETA,?UNIDADES_SUPLEMENTARIAS,?VALOR,?VALOR_ESTADISTICO' +
        ',?LINEA,?EMPRESA,?EJERCICIO,?CANAL,?PERIODO,?ESTADO_MIEMBRO,?PRO' +
        'VINCIA_ORI_DES,?NATURALEZA_TRANSACCION,?MODALIDAD_TRANSPORTE,?CO' +
        'DIGO_MERCANCIA,?PAIS_ORIGEN,?IVA_VIES,?TIPO,?COND_ENTREGA,?PUERT' +
        'O_CARGA_DESCARGA,?REGIMEN_ESTADISTICO,?I_PORTE_PROPORCIONAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_INTRASTAT_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO AND '
      '  TIPO=?TIPO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_INTRASTAT_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO AND '
      '  TIPO=?TIPO '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_INTRASTAT_DETALLE'
      'SET'
      '  MASA_NETA=?MASA_NETA '
      '  ,UNIDADES_SUPLEMENTARIAS=?UNIDADES_SUPLEMENTARIAS '
      '  ,VALOR=?VALOR '
      '  ,VALOR_ESTADISTICO=?VALOR_ESTADISTICO '
      '  ,ESTADO_MIEMBRO=?ESTADO_MIEMBRO '
      '  ,PROVINCIA_ORI_DES=?PROVINCIA_ORI_DES '
      '  ,NATURALEZA_TRANSACCION=?NATURALEZA_TRANSACCION '
      '  ,MODALIDAD_TRANSPORTE=?MODALIDAD_TRANSPORTE '
      '  ,CODIGO_MERCANCIA=?CODIGO_MERCANCIA '
      '  ,PAIS_ORIGEN=?PAIS_ORIGEN '
      '  ,IVA_VIES=?IVA_VIES '
      '  ,COND_ENTREGA=?COND_ENTREGA '
      '  ,PUERTO_CARGA_DESCARGA=?PUERTO_CARGA_DESCARGA '
      '  ,REGIMEN_ESTADISTICO=?REGIMEN_ESTADISTICO '
      '  ,I_PORTE_PROPORCIONAL=?I_PORTE_PROPORCIONAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO AND '
      '  TIPO=?TIPO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMIntrastat
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PERIODO '
      'TIPO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_INTRASTAT_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallePERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleESTADO_MIEMBRO: TFIBStringField
      DisplayLabel = 'Estado Miembro'
      FieldName = 'ESTADO_MIEMBRO'
      Size = 2
    end
    object QMDetallePROVINCIA_ORI_DES: TIntegerField
      DisplayLabel = 'Prov. Ori./Dest.'
      FieldName = 'PROVINCIA_ORI_DES'
      DisplayFormat = '00'
    end
    object QMDetalleCOND_ENTREGA: TFIBStringField
      DisplayLabel = 'Cond. Entrega'
      FieldName = 'COND_ENTREGA'
      Size = 3
    end
    object QMDetalleNATURALEZA_TRANSACCION: TIntegerField
      DisplayLabel = 'Nat. Transp.'
      FieldName = 'NATURALEZA_TRANSACCION'
    end
    object QMDetalleMODALIDAD_TRANSPORTE: TIntegerField
      DisplayLabel = 'Mod. Transp.'
      FieldName = 'MODALIDAD_TRANSPORTE'
    end
    object QMDetallePUERTO_CARGA_DESCARGA: TFIBStringField
      DisplayLabel = 'Puerto'
      FieldName = 'PUERTO_CARGA_DESCARGA'
      Size = 3
    end
    object QMDetalleCODIGO_MERCANCIA: TFIBStringField
      DisplayLabel = 'Cod. Mercancia'
      FieldName = 'CODIGO_MERCANCIA'
      Size = 10
    end
    object QMDetallePAIS_ORIGEN: TFIBStringField
      DisplayLabel = 'Pais Orig.'
      FieldName = 'PAIS_ORIGEN'
      Size = 2
    end
    object QMDetalleREGIMEN_ESTADISTICO: TFIBStringField
      DisplayLabel = 'Reg. Estadistico'
      FieldName = 'REGIMEN_ESTADISTICO'
      Size = 3
    end
    object QMDetalleMASA_NETA: TFloatField
      DisplayLabel = 'Masa Neta (Kg)'
      FieldName = 'MASA_NETA'
    end
    object QMDetalleUNIDADES_SUPLEMENTARIAS: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES_SUPLEMENTARIAS'
    end
    object QMDetalleVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object QMDetalleVALOR_ESTADISTICO: TFloatField
      DisplayLabel = 'Valor Estadistico'
      FieldName = 'VALOR_ESTADISTICO'
    end
    object QMDetalleIVA_VIES: TFIBStringField
      DisplayLabel = 'Nro. IVA-VIES'
      FieldName = 'IVA_VIES'
    end
    object QMDetalleI_PORTE_PROPORCIONAL: TFloatField
      DisplayLabel = 'Imp. Porte Proporc.'
      FieldName = 'I_PORTE_PROPORCIONAL'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 72
  end
  object xPeriodos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PERIODOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'PERIODO = :PERIODO')
    UniDirectional = False
    DataSource = DSQMIntrastat
    Left = 32
    Top = 120
    object xPeriodosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPeriodosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPeriodosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xPeriodosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xPeriodosDESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object xPeriodosHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
  end
  object DSxPeriodos: TDataSource
    DataSet = xPeriodos
    Left = 112
    Top = 120
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 24
  end
  object xDocumentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S_FAC_INTRASTAT'
      'WHERE'
      '  ID_DETALLES_DOC=?old_ID_DETALLES_DOC ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S_FAC_INTRASTAT'
      
        '  (SERIE,MASA_NETA,UNIDADES_SUPLEMENTARIAS,VALOR,VALOR_ESTADISTI' +
        'CO,RIG,LINEA,ID_DOC,ID_DETALLES_DOC,EMPRESA,EJERCICIO,CANAL,PERI' +
        'ODO,ESTADO_MIEMBRO,PROVINCIA_ORI_DES,NATURALEZA_TRANSACCION,MODA' +
        'LIDAD_TRANSPORTE,CODIGO_MERCANCIA,PAIS_ORIGEN,IVA_VIES,TIPO,ARTI' +
        'CULO,COND_ENTREGA,PUERTO_CARGA_DESCARGA,REGIMEN_ESTADISTICO,I_PO' +
        'RTE_PROPORCIONAL,IGNORAR)'
      'VALUES'
      
        '  (?SERIE,?MASA_NETA,?UNIDADES_SUPLEMENTARIAS,?VALOR,?VALOR_ESTA' +
        'DISTICO,?RIG,?LINEA,?ID_DOC,?ID_DETALLES_DOC,?EMPRESA,?EJERCICIO' +
        ',?CANAL,?PERIODO,?ESTADO_MIEMBRO,?PROVINCIA_ORI_DES,?NATURALEZA_' +
        'TRANSACCION,?MODALIDAD_TRANSPORTE,?CODIGO_MERCANCIA,?PAIS_ORIGEN' +
        ',?IVA_VIES,?TIPO,?ARTICULO,?COND_ENTREGA,?PUERTO_CARGA_DESCARGA,' +
        '?REGIMEN_ESTADISTICO,?I_PORTE_PROPORCIONAL,?IGNORAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S_FAC_INTRASTAT'
      'WHERE'
      '  ID_DETALLES_DOC=?ID_DETALLES_DOC ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_FAC_INTRASTAT'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO AND'
      '  TIPO = ?TIPO'
      'ORDER BY SERIE, RIG, LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_FAC_INTRASTAT'
      'SET'
      '  SERIE=?SERIE '
      '  ,MASA_NETA=?MASA_NETA '
      '  ,UNIDADES_SUPLEMENTARIAS=?UNIDADES_SUPLEMENTARIAS '
      '  ,VALOR=?VALOR '
      '  ,VALOR_ESTADISTICO=?VALOR_ESTADISTICO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ID_DOC=?ID_DOC '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PERIODO=?PERIODO '
      '  ,ESTADO_MIEMBRO=?ESTADO_MIEMBRO '
      '  ,PROVINCIA_ORI_DES=?PROVINCIA_ORI_DES '
      '  ,NATURALEZA_TRANSACCION=?NATURALEZA_TRANSACCION '
      '  ,MODALIDAD_TRANSPORTE=?MODALIDAD_TRANSPORTE '
      '  ,CODIGO_MERCANCIA=?CODIGO_MERCANCIA '
      '  ,PAIS_ORIGEN=?PAIS_ORIGEN '
      '  ,IVA_VIES=?IVA_VIES '
      '  ,TIPO=?TIPO '
      '  ,ARTICULO=?ARTICULO '
      '  ,COND_ENTREGA=?COND_ENTREGA '
      '  ,PUERTO_CARGA_DESCARGA=?PUERTO_CARGA_DESCARGA '
      '  ,REGIMEN_ESTADISTICO=?REGIMEN_ESTADISTICO '
      '  ,I_PORTE_PROPORCIONAL=?I_PORTE_PROPORCIONAL '
      '  ,IGNORAR=?IGNORAR '
      'WHERE'
      '  ID_DETALLES_DOC=?ID_DETALLES_DOC ')
    DataSource = DSQMIntrastat
    AfterPost = xDocumentosAfterPost
    ClavesPrimarias.Strings = (
      'ID_DETALLES_DOC ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S_FAC_INTRASTAT'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 168
    object xDocumentosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDocumentosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDocumentosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDocumentosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDocumentosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDocumentosRIG: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'RIG'
    end
    object xDocumentosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDocumentosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDocumentosID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object xDocumentosID_DETALLES_DOC: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLES_DOC'
    end
    object xDocumentosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xDocumentosESTADO_MIEMBRO: TFIBStringField
      DisplayLabel = 'Estado Miembro'
      FieldName = 'ESTADO_MIEMBRO'
      Size = 2
    end
    object xDocumentosPROVINCIA_ORI_DES: TIntegerField
      DisplayLabel = 'Prov. Ori./Dest.'
      FieldName = 'PROVINCIA_ORI_DES'
      DisplayFormat = '00'
    end
    object xDocumentosCOND_ENTREGA: TFIBStringField
      DisplayLabel = 'Cond. Entrega'
      FieldName = 'COND_ENTREGA'
      Size = 3
    end
    object xDocumentosNATURALEZA_TRANSACCION: TIntegerField
      DisplayLabel = 'Nat. Transp.'
      FieldName = 'NATURALEZA_TRANSACCION'
    end
    object xDocumentosMODALIDAD_TRANSPORTE: TIntegerField
      DisplayLabel = 'Mod. Transp.'
      FieldName = 'MODALIDAD_TRANSPORTE'
    end
    object xDocumentosPUERTO_CARGA_DESCARGA: TFIBStringField
      DisplayLabel = 'Puerto'
      FieldName = 'PUERTO_CARGA_DESCARGA'
      Size = 3
    end
    object xDocumentosCODIGO_MERCANCIA: TFIBStringField
      DisplayLabel = 'Cod. Mercancia'
      FieldName = 'CODIGO_MERCANCIA'
      Size = 10
    end
    object xDocumentosPAIS_ORIGEN: TFIBStringField
      DisplayLabel = 'Pais Orig.'
      FieldName = 'PAIS_ORIGEN'
      Size = 2
    end
    object xDocumentosREGIMEN_ESTADISTICO: TFIBStringField
      DisplayLabel = 'Reg. Estadistico'
      FieldName = 'REGIMEN_ESTADISTICO'
      Size = 3
    end
    object xDocumentosMASA_NETA: TFloatField
      DisplayLabel = 'Masa Neta (Kg)'
      FieldName = 'MASA_NETA'
    end
    object xDocumentosUNIDADES_SUPLEMENTARIAS: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES_SUPLEMENTARIAS'
    end
    object xDocumentosVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object xDocumentosVALOR_ESTADISTICO: TFloatField
      DisplayLabel = 'Valor Estadistico'
      FieldName = 'VALOR_ESTADISTICO'
    end
    object xDocumentosIVA_VIES: TFIBStringField
      DisplayLabel = 'Nro. IVA-VIES'
      FieldName = 'IVA_VIES'
    end
    object xDocumentosI_PORTE_PROPORCIONAL: TFloatField
      DisplayLabel = 'Imp. Porte Proporc.'
      FieldName = 'I_PORTE_PROPORCIONAL'
    end
    object xDocumentosIGNORAR: TIntegerField
      DisplayLabel = 'Ignorar'
      FieldName = 'IGNORAR'
    end
  end
  object DSDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 112
    Top = 168
  end
end
