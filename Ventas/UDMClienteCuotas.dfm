object DMClienteCuotas: TDMClienteCuotas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 910
  Top = 194
  Height = 242
  Width = 359
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 8
  end
  object QMCuotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_CLIENTES_CUOTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  CUOTA=?old_CUOTA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_CLIENTES_CUOTAS'
      
        '  (NOTAS,FECHA_ULT_CUOTA,FECHA_PROX_CUOTA,SERIE_ULT_CUOTA,FECHA_' +
        'FIN_CUOTA,OBSERVACIONES,CLIENTE,TERCERO,DIAS,RIG_DOC,ID_S,ID_S_D' +
        ',ID_ORIGEN,LINEA_INICIAL,PROYECTO,ID_CUOTA,EMPRESA,CUOTA,SUPLIDO' +
        ',PERIODICIDAD,AGRUPADA,CANAL,NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL,NI' +
        'F,EMAIL,TELEFONO01,TIPO_DOC,TIPO_ORIGEN,SU_REFERENCIA)'
      'VALUES'
      
        '  (?NOTAS,?FECHA_ULT_CUOTA,?FECHA_PROX_CUOTA,?SERIE_ULT_CUOTA,?F' +
        'ECHA_FIN_CUOTA,?OBSERVACIONES,?CLIENTE,?TERCERO,?DIAS,?RIG_DOC,?' +
        'ID_S,?ID_S_D,?ID_ORIGEN,?LINEA_INICIAL,?PROYECTO,?ID_CUOTA,?EMPR' +
        'ESA,?CUOTA,?SUPLIDO,?PERIODICIDAD,?AGRUPADA,?CANAL,?NOMBRE_R_SOC' +
        'IAL,?NOMBRE_COMERCIAL,?NIF,?EMAIL,?TELEFONO01,?TIPO_DOC,?TIPO_OR' +
        'IGEN,?SU_REFERENCIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CLIENTES_CUOTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE AND '
      '  CUOTA=?CUOTA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CLIENTES_CUOTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND '
      'CANAL=?CANAL'
      'ORDER BY CLIENTE, CUOTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CLIENTES_CUOTAS'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,FECHA_ULT_CUOTA=?FECHA_ULT_CUOTA '
      '  ,FECHA_PROX_CUOTA=?FECHA_PROX_CUOTA '
      '  ,SERIE_ULT_CUOTA=?SERIE_ULT_CUOTA '
      '  ,FECHA_FIN_CUOTA=?FECHA_FIN_CUOTA '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,TERCERO=?TERCERO '
      '  ,DIAS=?DIAS '
      '  ,RIG_DOC=?RIG_DOC '
      '  ,ID_S=?ID_S '
      '  ,ID_S_D=?ID_S_D '
      '  ,ID_ORIGEN=?ID_ORIGEN '
      '  ,LINEA_INICIAL=?LINEA_INICIAL '
      '  ,PROYECTO=?PROYECTO '
      '  ,ID_CUOTA=?ID_CUOTA '
      '  ,SUPLIDO=?SUPLIDO '
      '  ,PERIODICIDAD=?PERIODICIDAD '
      '  ,AGRUPADA=?AGRUPADA '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,NIF=?NIF '
      '  ,EMAIL=?EMAIL '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TIPO_DOC=?TIPO_DOC '
      '  ,TIPO_ORIGEN=?TIPO_ORIGEN '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE AND '
      '  CUOTA=?CUOTA ')
    Plan.Strings = (
      ' ')
    AfterOpen = QMCuotasAfterOpen
    AfterPost = QMCuotasAfterPost
    BeforeClose = QMCuotasBeforeClose
    BeforeEdit = AntesDeEditar
    BeforePost = QMCuotasBeforePost
    OnNewRecord = QMCuotasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'CANAL'
      'CLIENTE'
      'CUOTA')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CLIENTES_CUOTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMCuotasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCuotasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCuotasCLIENTEChange
    end
    object QMCuotasCUOTA: TIntegerField
      DisplayLabel = 'Cuota'
      FieldName = 'CUOTA'
    end
    object QMCuotasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCuotasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCuotasSUPLIDO: TIntegerField
      DisplayLabel = 'Suplido'
      FieldName = 'SUPLIDO'
    end
    object QMCuotasPERIODICIDAD: TIntegerField
      DisplayLabel = 'Periodicidad'
      FieldName = 'PERIODICIDAD'
    end
    object QMCuotasFECHA_ULT_CUOTA: TDateTimeField
      DisplayLabel = 'Fec. '#218'lt. Cuota'
      FieldName = 'FECHA_ULT_CUOTA'
    end
    object QMCuotasFECHA_PROX_CUOTA: TDateTimeField
      DisplayLabel = 'Fec. Pr'#243'x. Cuota'
      FieldName = 'FECHA_PROX_CUOTA'
    end
    object QMCuotasSERIE_ULT_CUOTA: TFIBStringField
      DisplayLabel = 'Serie '#218'lt. Cuota'
      FieldName = 'SERIE_ULT_CUOTA'
      Size = 10
    end
    object QMCuotasTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
      OnChange = QMCuotasTIPO_DOCChange
      Size = 3
    end
    object QMCuotasDIAS: TIntegerField
      DisplayLabel = 'D'#237'as'
      FieldName = 'DIAS'
    end
    object QMCuotasRIG_DOC: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_DOC'
    end
    object QMCuotasAGRUPADA: TIntegerField
      DisplayLabel = 'Agrupada'
      FieldName = 'AGRUPADA'
    end
    object QMCuotasID_S: TIntegerField
      DisplayLabel = 'ID S.'
      FieldName = 'ID_S'
    end
    object QMCuotasID_S_D: TIntegerField
      DisplayLabel = 'ID Det. S.'
      FieldName = 'ID_S_D'
    end
    object QMCuotasFECHA_FIN_CUOTA: TDateTimeField
      DisplayLabel = 'Fecha Fin Cuota'
      FieldName = 'FECHA_FIN_CUOTA'
    end
    object QMCuotasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCuotasID_ORIGEN: TIntegerField
      DisplayLabel = 'Id Origen'
      FieldName = 'ID_ORIGEN'
    end
    object QMCuotasTIPO_ORIGEN: TFIBStringField
      DisplayLabel = 'Tipo Origen'
      FieldName = 'TIPO_ORIGEN'
      Size = 3
    end
    object QMCuotasLINEA_INICIAL: TIntegerField
      DisplayLabel = 'Cuota Inicial'
      FieldName = 'LINEA_INICIAL'
    end
    object QMCuotasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMCuotasOBSERVACIONES: TBlobField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object QMCuotasID_CUOTA: TIntegerField
      DisplayLabel = 'ID Cuota'
      FieldName = 'ID_CUOTA'
    end
    object QMCuotasNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCuotasNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCuotasNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMCuotasEMAIL: TFIBStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMCuotasTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO01'
    end
    object QMCuotasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
  end
  object DSQMCuotas: TDataSource
    DataSet = QMCuotas
    Left = 128
    Top = 8
  end
  object xTipoDoc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_MOVIMIENTO'
      'WHERE TIPO = ?TIPO_DOC')
    UniDirectional = False
    DataSource = DSQMCuotas
    Left = 32
    Top = 56
    object xTipoDocTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTipoDoc: TDataSource
    DataSet = xTipoDoc
    Left = 128
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 56
  end
  object QMCuotasDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete FROM EMP_CLIENTES_CUOTAS_DETALLE'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND '
      'CLIENTE = :CLIENTE AND '
      'CUOTA = :CUOTA AND '
      'LINEA = :LINEA')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_CUOTAS_DETALLE ('
      
        'EMPRESA, CANAL, CLIENTE, CUOTA, LINEA, ARTICULO, DESCRIPCION, UN' +
        'IDADES, IMPORTE, DESCUENTO, ID_A, ID_CUOTA, P_COSTE, UNIDAD_FOME' +
        'NTO)'
      'VALUES ('
      
        ':EMPRESA, :CANAL, :CLIENTE, :CUOTA, :LINEA, :ARTICULO, :DESCRIPC' +
        'ION, :UNIDADES, :IMPORTE, :DESCUENTO, :ID_A, :ID_CUOTA,'
      ' :P_COSTE, :UNIDAD_FOMENTO)  ')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM EMP_CLIENTES_CUOTAS_DETALLE'
      'WHERE'
      'EMPRESA = :EMPRESA  AND'
      'CANAL = :CANAL  AND'
      'CLIENTE  = :CLIENTE  AND'
      'CUOTA = :CUOTA  AND'
      'LINEA = :LINEA  ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_CLIENTES_CUOTAS_DETALLE'
      'WHERE'
      'ID_CUOTA = :ID_CUOTA   '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_CUOTAS_DETALLE'
      'SET'
      'ARTICULO = :ARTICULO,'
      'DESCRIPCION = :DESCRIPCION,'
      'UNIDADES = :UNIDADES,'
      'IMPORTE = :IMPORTE,'
      'DESCUENTO = :DESCUENTO,'
      'ID_A = :ID_A,'
      'ID_CUOTA = :ID_CUOTA,'
      'P_COSTE = :P_COSTE,'
      'UNIDAD_FOMENTO = :UNIDAD_FOMENTO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE AND'
      'CUOTA = :CUOTA AND'
      'LINEA = :LINEA')
    DataSource = DSQMCuotas
    OnNewRecord = QMCuotasDetalleNewRecord
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 104
    object QMCuotasDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCuotasDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCuotasDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCuotasDetalleCUOTA: TIntegerField
      DisplayLabel = 'Cuota'
      FieldName = 'CUOTA'
    end
    object QMCuotasDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCuotasDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMCuotasDetalleARTICULOChange
      Size = 15
    end
    object QMCuotasDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object QMCuotasDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMCuotasDetalleIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMCuotasDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object QMCuotasDetalleID_A: TIntegerField
      FieldName = 'ID_A'
    end
    object QMCuotasDetalleID_CUOTA: TIntegerField
      FieldName = 'ID_CUOTA'
    end
    object QMCuotasDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMCuotasDetalleUNIDAD_FOMENTO: TFloatField
      DisplayLabel = 'Unidad Fomento'
      FieldName = 'UNIDAD_FOMENTO'
    end
  end
  object DSCuotasDetalle: TDataSource
    DataSet = QMCuotasDetalle
    Left = 128
    Top = 104
  end
end
