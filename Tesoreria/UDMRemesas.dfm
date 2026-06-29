object DMRemesas: TDMRemesas
  OldCreateOrder = False
  OnCreate = DMRemesasCreate
  OnDestroy = DMRemesasDestroy
  Left = 417
  Top = 162
  Height = 531
  Width = 708
  object QMRemesas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_REMESAS'
      'WHERE'
      'ID_REMESAS = ?old_ID_REMESAS')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_REMESAS'
      
        '  (GASTOS_DESCUENTO,GASTOS_SIN_IVA,GASTOS_IVA,FECHA_ABONO,IMPORT' +
        'E_CA,GASTOS,FECHA,RIESGO_REMESA,IMPORTE_REMESA,LINEAS,RIC_ABONO_' +
        '2,RIS_ABONO,RIC_ABONO,RIC_VTO,REMESA,BANCO,RIC,ID_REMESAS,TIPO_R' +
        'EMESA_PAG,VENCIDA,ABONADA,CERRADA,TITULO,EMPRESA,EJERCICIO,CANAL' +
        ',TIPO_REMESA,TIPO_ASIENTO_KRI,SIGNO,TIPO_ASIENTO,FUERZA_VENCIMIE' +
        'NTO,FECHA_VENCIMIENTO)'
      'VALUES'
      
        '  (?GASTOS_DESCUENTO,?GASTOS_SIN_IVA,?GASTOS_IVA,?FECHA_ABONO,?I' +
        'MPORTE_CA,?GASTOS,?FECHA,?RIESGO_REMESA,?IMPORTE_REMESA,?LINEAS,' +
        '?RIC_ABONO_2,?RIS_ABONO,?RIC_ABONO,?RIC_VTO,?REMESA,?BANCO,?RIC,' +
        '?ID_REMESAS,?TIPO_REMESA_PAG,?VENCIDA,?ABONADA,?CERRADA,?TITULO,' +
        '?EMPRESA,?EJERCICIO,?CANAL,?TIPO_REMESA,?TIPO_ASIENTO_KRI,?SIGNO' +
        ',?TIPO_ASIENTO,?FUERZA_VENCIMIENTO,?FECHA_VENCIMIENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_REMESAS'
      'WHERE'
      'ID_REMESAS = ?ID_REMESAS')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_REMESAS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO in (?EJERCICIO,?EJERCICIO-1,0) AND'
      '  CANAL=?CANAL AND'
      '  SIGNO='#39'C'#39'  AND'
      '  TIPO_REMESA_PAG=?TIPO_REMESA_PAG'
      '  AND REMESA <> 0 AND REMESA <> -1'
      'ORDER BY EJERCICIO, REMESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_REMESAS'
      'SET'
      '  GASTOS_DESCUENTO=?GASTOS_DESCUENTO '
      '  ,GASTOS_SIN_IVA=?GASTOS_SIN_IVA '
      '  ,GASTOS_IVA=?GASTOS_IVA '
      '  ,FECHA_ABONO=?FECHA_ABONO '
      '  ,IMPORTE_CA=?IMPORTE_CA '
      '  ,GASTOS=?GASTOS '
      '  ,FECHA=?FECHA '
      '  ,RIESGO_REMESA=?RIESGO_REMESA '
      '  ,IMPORTE_REMESA=?IMPORTE_REMESA '
      '  ,LINEAS=?LINEAS '
      '  ,RIC_ABONO_2=?RIC_ABONO_2 '
      '  ,RIS_ABONO=?RIS_ABONO '
      '  ,RIC_ABONO=?RIC_ABONO '
      '  ,RIC_VTO=?RIC_VTO '
      '  ,BANCO=?BANCO '
      '  ,RIC=?RIC '
      '  ,TIPO_REMESA_PAG=?TIPO_REMESA_PAG '
      '  ,VENCIDA=?VENCIDA '
      '  ,ABONADA=?ABONADA '
      '  ,CERRADA=?CERRADA '
      '  ,TITULO=?TITULO '
      '  ,TIPO_REMESA=?TIPO_REMESA '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI '
      '  ,TIPO_ASIENTO=?TIPO_ASIENTO '
      '  ,FUERZA_VENCIMIENTO=?FUERZA_VENCIMIENTO '
      '  ,FECHA_VENCIMIENTO=?FECHA_VENCIMIENTO '
      'WHERE'
      'ID_REMESAS = ?ID_REMESAS')
    AfterDelete = Graba
    AfterOpen = QMRemesasAfterOpen
    AfterPost = QMRemesasAfterPost
    AfterScroll = QMRemesasAfterScroll
    BeforePost = QMRemesasBeforePost
    BeforeScroll = QMRemesasBeforeScroll
    OnNewRecord = QMRemesasNewRecord
    OnPostError = QMRemesasPostError
    ClavesPrimarias.Strings = (
      'ID_REMESAS'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_REMESAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMRemesasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRemesasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMRemesasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRemesasREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMRemesasSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMRemesasBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      OnChange = QMRemesasBANCOChange
    end
    object QMRemesasIMPORTE_REMESA: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE_REMESA'
    end
    object QMRemesasRIESGO_REMESA: TFloatField
      DisplayLabel = 'Riesgo'
      FieldName = 'RIESGO_REMESA'
    end
    object QMRemesasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMRemesasLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMRemesasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMRemesasCERRADA: TIntegerField
      DisplayLabel = 'Cerrada'
      FieldName = 'CERRADA'
    end
    object QMRemesasRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMRemesasVENCIDA: TIntegerField
      DisplayLabel = 'Vencida'
      FieldName = 'VENCIDA'
    end
    object QMRemesasABONADA: TIntegerField
      DisplayLabel = 'Abonada'
      FieldName = 'ABONADA'
    end
    object QMRemesasRIC_ABONO: TIntegerField
      DisplayLabel = 'RIC Abono'
      FieldName = 'RIC_ABONO'
    end
    object QMRemesasGASTOS: TFloatField
      DisplayLabel = 'Gastos'
      FieldName = 'GASTOS'
    end
    object QMRemesasIMPORTE_CA: TFloatField
      DisplayLabel = 'Importe Ca.'
      FieldName = 'IMPORTE_CA'
    end
    object QMRemesasFECHA_ABONO: TDateTimeField
      DisplayLabel = 'Fec. Abono'
      FieldName = 'FECHA_ABONO'
    end
    object QMRemesasTIPO_REMESA: TIntegerField
      DisplayLabel = 'Tipo Remesa'
      FieldName = 'TIPO_REMESA'
    end
    object QMRemesasTIPO_ASIENTO: TFIBStringField
      DisplayLabel = 'Tipo Asi.'
      FieldName = 'TIPO_ASIENTO'
      OnChange = QMRemesasTIPO_ASIENTOChange
      Size = 3
    end
    object QMRemesasTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asi. Kri'
      FieldName = 'TIPO_ASIENTO_KRI'
      OnChange = QMRemesasTIPO_ASIENTO_KRIChange
      Size = 3
    end
    object QMRemesasRIC_VTO: TIntegerField
      DisplayLabel = 'RIC Vto.'
      FieldName = 'RIC_VTO'
    end
    object QMRemesasRIC_ABONO_2: TIntegerField
      DisplayLabel = 'RIC Abono'
      FieldName = 'RIC_ABONO_2'
    end
    object QMRemesasRIS_ABONO: TIntegerField
      DisplayLabel = 'RIS Abono'
      FieldName = 'RIS_ABONO'
    end
    object QMRemesasGASTOS_IVA: TFloatField
      DisplayLabel = 'Gastos IVA'
      FieldName = 'GASTOS_IVA'
    end
    object QMRemesasGASTOS_SIN_IVA: TFloatField
      DisplayLabel = 'Gastos s/IVA'
      FieldName = 'GASTOS_SIN_IVA'
    end
    object QMRemesasGASTOS_DESCUENTO: TFloatField
      DisplayLabel = 'Gastos Desc.'
      FieldName = 'GASTOS_DESCUENTO'
    end
    object QMRemesasTIPO_REMESA_PAG: TIntegerField
      DisplayLabel = 'Tipo Rem. Pagare'
      FieldName = 'TIPO_REMESA_PAG'
    end
    object QMRemesasID_REMESAS: TIntegerField
      DisplayLabel = 'Id Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMRemesasFUERZA_VENCIMIENTO: TIntegerField
      DisplayLabel = 'Fuerza Venc.'
      FieldName = 'FUERZA_VENCIMIENTO'
      OnChange = QMRemesasFUERZA_VENCIMIENTOChange
    end
    object QMRemesasFECHA_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Venc.'
      FieldName = 'FECHA_VENCIMIENTO'
    end
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_REMESAS'
      'WHERE'
      '  ID_REMESAS = ?ID_REMESAS')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_REMESAS'
      'WHERE '
      ' ID_REMESAS = ?ID_REMESAS')
    UniDirectional = False
    DataSource = DSQMRemesas
    Left = 40
    Top = 56
    object xInfoActualizadaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoActualizadaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoActualizadaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoActualizadaREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xInfoActualizadaSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xInfoActualizadaBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xInfoActualizadaIMPORTE_REMESA: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE_REMESA'
    end
    object xInfoActualizadaRIESGO_REMESA: TFloatField
      DisplayLabel = 'Riesgo Rem.'
      FieldName = 'RIESGO_REMESA'
    end
    object xInfoActualizadaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xInfoActualizadaLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xInfoActualizadaCERRADA: TIntegerField
      DisplayLabel = 'Cerrada'
      FieldName = 'CERRADA'
    end
    object xInfoActualizadaABONADA: TIntegerField
      DisplayLabel = 'Abonada'
      FieldName = 'ABONADA'
    end
    object xInfoActualizadaVENCIDA: TIntegerField
      DisplayLabel = 'Vencida'
      FieldName = 'VENCIDA'
    end
    object xInfoActualizadaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xInfoActualizadaRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xInfoActualizadaRIC_VTO: TIntegerField
      DisplayLabel = 'RIC Vto.'
      FieldName = 'RIC_VTO'
    end
    object xInfoActualizadaRIC_ABONO: TIntegerField
      DisplayLabel = 'RIC Abono'
      FieldName = 'RIC_ABONO'
    end
    object xInfoActualizadaRIC_ABONO_2: TIntegerField
      DisplayLabel = 'RIC Abono'
      FieldName = 'RIC_ABONO_2'
    end
    object xInfoActualizadaRIS_ABONO: TIntegerField
      DisplayLabel = 'Reg. IVA Abono'
      FieldName = 'RIS_ABONO'
    end
    object xInfoActualizadaGASTOS: TFloatField
      DisplayLabel = 'Gastos'
      FieldName = 'GASTOS'
    end
    object xInfoActualizadaGASTOS_IVA: TFloatField
      DisplayLabel = 'Gastos IVA'
      FieldName = 'GASTOS_IVA'
    end
    object xInfoActualizadaGASTOS_SIN_IVA: TFloatField
      DisplayLabel = 'Gastos s/IVA'
      FieldName = 'GASTOS_SIN_IVA'
    end
    object xInfoActualizadaGASTOS_DESCUENTO: TFloatField
      DisplayLabel = 'Gastos Desc.'
      FieldName = 'GASTOS_DESCUENTO'
    end
    object xInfoActualizadaIMPORTE_CA: TFloatField
      DisplayLabel = 'Importe Ca.'
      FieldName = 'IMPORTE_CA'
    end
    object xInfoActualizadaFECHA_ABONO: TDateTimeField
      DisplayLabel = 'Fec. Abono'
      FieldName = 'FECHA_ABONO'
    end
    object xInfoActualizadaTIPO_REMESA: TIntegerField
      DisplayLabel = 'Tipo Remesa'
      FieldName = 'TIPO_REMESA'
    end
    object xInfoActualizadaTIPO_REMESA_PAG: TIntegerField
      DisplayLabel = 'Tipo Rem. Pagare'
      FieldName = 'TIPO_REMESA_PAG'
    end
  end
  object DSQMRemesas: TDataSource
    DataSet = QMRemesas
    Left = 152
    Top = 8
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT RIESGO_UTI, RIESGO_CON, ENTIDAD, SUCURSAL, TITULO, CODIGO' +
        '_ORDENANTE, ALFANUMERO, ACTIVO'
      'FROM EMP_BANCOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'BANCO = :BANCO')
    SelectSQL.Strings = (
      
        'SELECT RIESGO_UTI, RIESGO_CON, ENTIDAD, SUCURSAL, TITULO, CODIGO' +
        '_ORDENANTE, ALFANUMERO, ACTIVO'
      'FROM EMP_BANCOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'BANCO = :BANCO')
    UniDirectional = False
    DataSource = DSQMRemesas
    Left = 40
    Top = 104
    object xBancosRIESGO_UTI: TFloatField
      DisplayLabel = 'Riesgo Utilizado'
      FieldName = 'RIESGO_UTI'
    end
    object xBancosRIESGO_CON: TFloatField
      DisplayLabel = 'Riesgo Con.'
      FieldName = 'RIESGO_CON'
    end
    object xBancosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xBancosSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xBancosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xBancosCODIGO_ORDENANTE: TFIBStringField
      DisplayLabel = 'C'#243'digo Ordenante'
      FieldName = 'CODIGO_ORDENANTE'
      Size = 3
    end
    object xBancosALFANUMERO: TFIBStringField
      DisplayLabel = 'Alfan'#250'mero'
      FieldName = 'ALFANUMERO'
      Size = 11
    end
    object xBancosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 152
    Top = 104
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 152
    Top = 56
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_REMESA'
      'WHERE'
      '  ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_REMESA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,VENCIMIENTO,CTA_' +
        'PAGO,LIQUIDO,PAGADO,TIPO_EFECTO,REMESAR,ESTADO,REMESA,DOC_NUMERO' +
        ',DOC_SERIE,DOC_FECHA,RIC,RIVA,BANCO_CLIPRO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,'#39'C'#39',?REGISTRO,?LINEA,?VENCIMIENTO,' +
        '?CTA_PAGO,?LIQUIDO,?PAGADO,?TIPO_EFECTO,?REMESAR,?ESTADO,?REMESA' +
        ',?DOC_NUMERO,?DOC_SERIE,?DOC_FECHA,?RIC,?RIVA,?BANCO_CLIPRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_REMESA'
      'WHERE'
      ' ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_REMESA'
      'WHERE'
      '  ID_REMESAS = ?ID_REMESAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_REMESA'
      'SET'
      '  REMESA=?REMESA '
      '  ,EJERCICIO=?EJERCICIO'
      '  ,ABONO=?ABONO'
      '  ,ID_REMESAS = ?ID_REMESAS'
      '  ,AGRUP_COD_CLI_PRO_KRI = ?AGRUP_COD_CLI_PRO_KRI'
      '  ,BANCO_CLIPRO=?BANCO_CLIPRO'
      'WHERE'
      '  ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE')
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    BeforeClose = QMDetalleBeforeClose
    BeforeEdit = QMDetalleBeforeEdit
    BeforePost = QMDetalleBeforePost
    OnPostError = QMDetallePostError
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE'#13)
    AccionesInhibidas = [Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_REMESA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMDetallePAGADO: TIntegerField
      DisplayLabel = 'Pag.'
      FieldName = 'PAGADO'
    end
    object QMDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'T. Efec.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMDetalleREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMDetalleDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMDetalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMDetalleRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object QMDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'COD_CLI_PRO'
    end
    object QMDetalleIMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'IMPAGADO'
    end
    object QMDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMDetalleACEPTADO: TIntegerField
      DisplayLabel = 'Aceptado'
      FieldName = 'ACEPTADO'
    end
    object QMDetalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMDetalleFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMDetalleESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMDetalleRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMDetalleFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Reg.'
      FieldName = 'FECHA_REGISTRO'
    end
    object QMDetalleEJERCICIO_CARTERA: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO_CARTERA'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido'
      FieldKind = fkCalculated
      FieldName = 'LIQUIDO_CANAL'
      OnGetText = QMDetalleLIQUIDO_CANALGetText
      Calculated = True
    end
    object QMDetalleORIGEN_IMPAGADO: TIntegerField
      DisplayLabel = 'Orig. Impag.'
      FieldName = 'ORIGEN_IMPAGADO'
    end
    object QMDetalleFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMDetalleABONO: TIntegerField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
    end
    object QMDetalleEJERCICIO_ABONO: TIntegerField
      DisplayLabel = 'Ejer. Abono'
      FieldName = 'EJERCICIO_ABONO'
    end
    object QMDetalleMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDetalleNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nom. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMDetalleNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nom. R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMDetalleID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMDetalleID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMDetalleID_REMESAS: TIntegerField
      DisplayLabel = 'Id Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMDetalleBANCO_KRI: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO_KRI'
    end
    object QMDetalleAGRUP_COD_CLI_PRO_KRI: TIntegerField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUP_COD_CLI_PRO_KRI'
    end
    object QMDetalleBANCO_CLIPRO: TIntegerField
      DisplayLabel = 'Banco Cli./Prov.'
      FieldName = 'BANCO_CLIPRO'
    end
    object QMDetalleENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 152
    Top = 152
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TERCERO, TITULO FROM SYS_EMPRESAS'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    DataSource = DSQMRemesas
    AfterOpen = xEmpresaAfterOpen
    Left = 40
    Top = 200
    object xEmpresaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xEmpresaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xTerceroEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT NIF, NOMBRE_R_SOCIAL, DIR_LOCALIDAD, TIPO_RAZON FROM VER_' +
        'TERCEROS_EDICION'
      'WHERE TERCERO=?TERCERO')
    SelectSQL.Strings = (
      
        'SELECT NIF, NOMBRE_R_SOCIAL, DIR_LOCALIDAD, TIPO_RAZON, PAIS_TER' +
        'CERO FROM VER_TERCEROS_EDICION'
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    DataSource = DSxEmpresa
    AfterOpen = xTerceroEmpresaAfterOpen
    AfterScroll = xTerceroEmpresaAfterScroll
    Left = 40
    Top = 248
  end
  object DSxEmpresa: TDataSource
    DataSet = xEmpresa
    Left = 152
    Top = 200
  end
  object DSxTerceroEmpresa: TDataSource
    DataSet = xTerceroEmpresa
    Left = 152
    Top = 248
  end
  object xLocalidadEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CODPOSTAL, TITULO, C_PAIS FROM VER_LOCALIDADES'
      'WHERE LOCALIDAD=?DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSxTerceroEmpresa
    Left = 280
    Top = 296
    object xLocalidadEmpresaCODPOSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object xLocalidadEmpresaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xLocalidadEmpresaC_PAIS: TFIBStringField
      DisplayLabel = 'Cod. Pa'#237's'
      FieldName = 'C_PAIS'
      Size = 3
    end
  end
  object xBancoRemesa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_BANCOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    DataSource = DSQMRemesas
    Left = 280
    Top = 344
    object xBancoRemesaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xBancoRemesaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xBancoRemesaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xBancoRemesaBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xBancoRemesaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xBancoRemesaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xBancoRemesaENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xBancoRemesaSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xBancoRemesaCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xBancoRemesaRIESGO_CON: TFloatField
      DisplayLabel = 'Riesgo Con.'
      FieldName = 'RIESGO_CON'
    end
    object xBancoRemesaRIESGO_UTI: TFloatField
      DisplayLabel = 'Riesgo Utilizado'
      FieldName = 'RIESGO_UTI'
    end
    object xBancoRemesaRIESGO_DES: TFloatField
      DisplayLabel = 'Riesgo Descuento'
      FieldName = 'RIESGO_DES'
    end
    object xBancoRemesaRIESGO_CFM: TFloatField
      DisplayLabel = 'Riesgo Confirming'
      FieldName = 'RIESGO_CFM'
    end
    object xBancoRemesaACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xBancoRemesaCUENTA_CONTABLE: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CONTABLE'
      Size = 15
    end
    object xBancoRemesaCUENTA_CC: TFIBStringField
      DisplayLabel = 'Cta. Ccorriente'
      FieldName = 'CUENTA_CC'
      Size = 15
    end
    object xBancoRemesaCUENTA_AHORRO: TFIBStringField
      DisplayLabel = 'Cta. Ahorro'
      FieldName = 'CUENTA_AHORRO'
      Size = 15
    end
    object xBancoRemesaCUENTA_CONFIRMING: TFIBStringField
      DisplayLabel = 'Cta. Confirming'
      FieldName = 'CUENTA_CONFIRMING'
      Size = 15
    end
    object xBancoRemesaCUENTA_DTO: TFIBStringField
      DisplayLabel = 'Cta. Dto.'
      FieldName = 'CUENTA_DTO'
      Size = 15
    end
    object xBancoRemesaSEPARA_APUNTES: TIntegerField
      DisplayLabel = 'Separa Apu.'
      FieldName = 'SEPARA_APUNTES'
    end
    object xBancoRemesaCUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object xBancoRemesaCUENTA_GASTOS_DESCUENTO: TFIBStringField
      DisplayLabel = 'Cta. Gastos Dto.'
      FieldName = 'CUENTA_GASTOS_DESCUENTO'
      Size = 15
    end
    object xBancoRemesaDIA_VALOR: TIntegerField
      DisplayLabel = 'Dia Valor'
      FieldName = 'DIA_VALOR'
    end
    object xBancoRemesaCUENTA_PAGARES: TFIBStringField
      DisplayLabel = 'Cta. Pagares'
      FieldName = 'CUENTA_PAGARES'
      Size = 15
    end
    object xBancoRemesaCUENTAS_GASTOS_PAGARES: TFIBStringField
      DisplayLabel = 'Cta. Gastos Pagares'
      FieldName = 'CUENTAS_GASTOS_PAGARES'
      Size = 15
    end
    object xBancoRemesaCUENTA_INTERESES: TFIBStringField
      DisplayLabel = 'Cta. Intereses'
      FieldName = 'CUENTA_INTERESES'
      Size = 15
    end
    object xBancoRemesaRIESGO_DES_PAG: TFloatField
      DisplayLabel = 'Riesgo Des. Pagare'
      FieldName = 'RIESGO_DES_PAG'
    end
    object xBancoRemesaCUENTA_CORRIENTE: TFIBStringField
      DisplayLabel = 'Cta. Corriente'
      FieldName = 'CUENTA_CORRIENTE'
    end
    object xBancoRemesaIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object xBancoRemesaBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
  end
  object QMClienteRecibo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CLIENTE=?COD_CLI_PRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMDetalle
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_CUENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 392
    Top = 296
    object QMClienteReciboEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMClienteReciboEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMClienteReciboCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMClienteReciboCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMClienteReciboTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMClienteReciboTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMClienteReciboFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMClienteReciboRIESGO_AUT: TFloatField
      DisplayLabel = 'Riesgo Autorizado'
      FieldName = 'RIESGO_AUT'
    end
    object QMClienteReciboRIESGO_ACT: TFloatField
      DisplayLabel = 'Riesgo Actual'
      FieldName = 'RIESGO_ACT'
    end
    object QMClienteReciboMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMClienteReciboDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMClienteReciboDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMClienteReciboDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMClienteReciboAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMClienteReciboNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMClienteReciboCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMClienteReciboTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMClienteReciboPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMClienteReciboTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
    end
    object QMClienteReciboPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMClienteReciboTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMClienteReciboDESCUENTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DESCUENTO_CIAL'
    end
    object QMClienteReciboPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMClienteReciboNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMClienteReciboUSAR_ANTICIPOS: TIntegerField
      DisplayLabel = 'Usar Antic.'
      FieldName = 'USAR_ANTICIPOS'
    end
    object QMClienteReciboSU_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Su Prov.'
      FieldName = 'SU_PROVEEDOR'
      Size = 40
    end
    object QMClienteReciboEVAL_FEB: TIntegerField
      DisplayLabel = 'Eval. Feb.'
      FieldName = 'EVAL_FEB'
    end
    object QMClienteReciboEVAL_FEB_SI: TIntegerField
      DisplayLabel = 'Eval. Feb. Si'
      FieldName = 'EVAL_FEB_SI'
    end
    object QMClienteReciboMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMClienteReciboFINANCIACION: TIntegerField
      DisplayLabel = 'Financ.'
      FieldName = 'FINANCIACION'
    end
    object QMClienteReciboFACTURAR_AGENTE: TIntegerField
      DisplayLabel = 'Fact. Agente'
      FieldName = 'FACTURAR_AGENTE'
    end
    object QMClienteReciboFACTURAR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Fact. Transp.'
      FieldName = 'FACTURAR_TRANSPORTISTA'
    end
    object QMClienteReciboFACTURAR_REFERENCIA: TIntegerField
      DisplayLabel = 'Fact. Ref.'
      FieldName = 'FACTURAR_REFERENCIA'
    end
    object QMClienteReciboFACTURAR_DIRECCION: TIntegerField
      DisplayLabel = 'Fact. Dir.'
      FieldName = 'FACTURAR_DIRECCION'
    end
    object QMClienteReciboFACTURAR_SERIE: TIntegerField
      DisplayLabel = 'Fact. Serie'
      FieldName = 'FACTURAR_SERIE'
    end
    object QMClienteReciboSERIE_A_FACTURAR: TFIBStringField
      DisplayLabel = 'Serie a Fact.'
      FieldName = 'SERIE_A_FACTURAR'
      Size = 10
    end
    object QMClienteReciboFACTURAR_ALMACEN: TIntegerField
      DisplayLabel = 'Fact. Alm.'
      FieldName = 'FACTURAR_ALMACEN'
    end
    object QMClienteReciboTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMClienteReciboFACTURA_DIRECCION_ADMTVA: TIntegerField
      DisplayLabel = 'Fact. Dir. Admtiva.'
      FieldName = 'FACTURA_DIRECCION_ADMTVA'
    end
    object QMClienteReciboALBARAN_DIRECCION_ENVIO: TIntegerField
      DisplayLabel = 'Alb. Direccion de Envio'
      FieldName = 'ALBARAN_DIRECCION_ENVIO'
    end
    object QMClienteReciboPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMClienteReciboNO_ALB_FAC: TIntegerField
      DisplayLabel = 'No Alb. Fac.'
      FieldName = 'NO_ALB_FAC'
    end
    object QMClienteReciboNO_VENTA_RIESGO: TIntegerField
      DisplayLabel = 'No venta bajo riesgo'
      FieldName = 'NO_VENTA_RIESGO'
    end
    object QMClienteReciboSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMClienteReciboRIESGO_FAC: TFloatField
      DisplayLabel = 'Riesgo Fac.'
      FieldName = 'RIESGO_FAC'
    end
    object QMClienteReciboRIESGO_ALB: TFloatField
      DisplayLabel = 'Riesgo Alb.'
      FieldName = 'RIESGO_ALB'
    end
    object QMClienteReciboRIESGO_CAR: TFloatField
      DisplayLabel = 'Riesgo Cartera'
      FieldName = 'RIESGO_CAR'
    end
    object QMClienteReciboRIESGO_REM: TFloatField
      DisplayLabel = 'Riesgo Rem.'
      FieldName = 'RIESGO_REM'
    end
    object QMClienteReciboINTRA: TIntegerField
      DisplayLabel = 'Intra.'
      FieldName = 'INTRA'
    end
    object QMClienteReciboINTRA_TRANS: TIntegerField
      DisplayLabel = 'Intra. Trans.'
      FieldName = 'INTRA_TRANS'
    end
    object QMClienteReciboFACTURAR_TARIFA: TIntegerField
      DisplayLabel = 'Fact. Tarifa'
      FieldName = 'FACTURAR_TARIFA'
    end
    object QMClienteReciboPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
  end
  object xTipoEfecto: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_EFECTO'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_EFECTO'
      '  (TIPO,TITULO)'
      'VALUES'
      '  (?TIPO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_EFECTO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_EFECTO'
      'WHERE TIPO=?TIPO_EFECTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_EFECTO'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  TIPO=?TIPO ')
    DataSource = DSQMDetalle
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_EFECTO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 280
    Top = 248
    object xTipoEfectoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xTipoEfectoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 624
    Top = 8
  end
  object CVBNorma19CSB1: TCVBNorma19CSB
    NomFichero = 'CSB19.TXT'
    Procedimiento = prSegundo
    EnCasoError = CVBNorma19CSB1EnCasoError
    Left = 624
    Top = 104
  end
  object xCuentaClientes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select ejercicio_cartera,registro, linea, cod_cli_pro,nombre_com' +
        'ercial,id_cartera_detalle from ver_cartera_remesa '
      'where id_remesas = ?id_remesas')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMRemesas
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 296
    object xCuentaClientesCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xCuentaClientesREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xCuentaClientesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCuentaClientesEJERCICIO_CARTERA: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_CARTERA'
    end
    object xCuentaClientesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xCuentaClientesID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
  end
  object DSxCuentaClientes: TDataSource
    DataSet = xCuentaClientes
    Left = 152
    Top = 296
  end
  object xClientesBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_clientes_bancos '
      'where empresa=?empresa and ejercicio=?ejercicio and '
      '           canal=?canal and cliente=?cliente'
      'order by orden')
    UniDirectional = False
    DataSource = DSQMRemesas
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_BANCOS EC INDEX (EMP_CLIENTES_CLI_' +
        'TER),'
      'VER_CLIENTES_BANCOS CU INDEX (PK_CON_CUENTAS_GES_CLI),'
      
        'VER_CLIENTES_BANCOS ST INDEX (PK_SYS_TERCEROS),VER_CLIENTES_BANC' +
        'OS BAN INDEX (PK_SYS_TERCEROS_BANCOS)))')
    Left = 392
    Top = 248
    object xClientesBancosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xClientesBancosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xClientesBancosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xClientesBancosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClientesBancosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xClientesBancosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xClientesBancosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xClientesBancosRIESGO_AUT: TFloatField
      DisplayLabel = 'Riesgo Autorizado'
      FieldName = 'RIESGO_AUT'
    end
    object xClientesBancosRIESGO_ACT: TFloatField
      DisplayLabel = 'Riesgo Actual'
      FieldName = 'RIESGO_ACT'
    end
    object xClientesBancosAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xClientesBancosTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xClientesBancosDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object xClientesBancosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xClientesBancosMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object xClientesBancosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xClientesBancosTITULAR: TFIBStringField
      DisplayLabel = 'Titular'
      FieldName = 'TITULAR'
      Size = 40
    end
    object xClientesBancosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xClientesBancosSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xClientesBancosCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xClientesBancosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xClientesBancosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
    end
  end
  object xFacturas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'DOC_NUMERO, DOC_SERIE, DOC_FECHA, '
      'REGISTRO, LINEA, LIQUIDO, LIQUIDO_CANAL, '
      'VENCIMIENTO, TIPO_EFECTO, DOC_FECHA, '
      'MONEDA, MONEDA_CANAL,'
      'DOC_TIPO, ID_CARTERA, ID_DOC'
      'FROM VER_CARTERA_REMESA'
      'WHERE'
      'ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE AND'
      'COD_CLI_PRO = ?COD_CLI_PRO'
      'ORDER BY DOC_SERIE, DOC_NUMERO')
    UniDirectional = False
    DataSource = DSQMRemesas
    Left = 280
    Top = 8
    object xFacturasDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xFacturasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xFacturasDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xFacturasREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xFacturasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xFacturasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xFacturasLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xFacturasVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xFacturasTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xFacturasDOC_FECHA1: TDateTimeField
      DisplayLabel = 'Fecha Doc. 1'
      FieldName = 'DOC_FECHA1'
    end
    object xFacturasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xFacturasMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object xFacturasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xFacturasID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xFacturasID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
  end
  object xDireccionCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_terceros_direccion where tercero=?tercero')
    UniDirectional = False
    AfterOpen = xDireccionClienteAfterOpen
    AfterScroll = xDireccionClienteAfterScroll
    Left = 40
    Top = 344
    object xDireccionClienteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDireccionClienteNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xDireccionClienteNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xDireccionClienteDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xDireccionClienteLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xDireccionClienteTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object xDireccionClienteDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object xDireccionClienteDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object xDireccionClienteDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 152
    Top = 440
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TERCERO, TITULO FROM VER_CLIENTES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 40
    Top = 440
    object xClientesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xClientesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xOrdenantes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select max(vencimiento) as vencimiento from ver_cartera_remesa w' +
        'here'
      'id_remesas = ?id_remesas')
    UniDirectional = False
    DataSource = DSQMRemesas
    Left = 392
    Top = 152
    object xOrdenantesVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
  end
  object xDescripcionRecibo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select * from dame_descripciones_csb(?empresa,?ejercicio,?canal,' +
        '?serie,?rig)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 280
    Top = 56
    object xDescripcionReciboUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xDescripcionReciboUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 3
    end
    object xDescripcionReciboTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDescripcionReciboLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xDescripcionReciboMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object DSxDescripcionRecibo: TDataSource
    DataSet = xDescripcionRecibo
    Left = 392
    Top = 56
  end
  object xCodigoPostal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CODPOSTAL, INE, C_PAIS FROM VER_LOCALIDADES'
      'where localidad = ?localidad')
    UniDirectional = False
    DataSource = DSxDireccionCliente
    Left = 40
    Top = 392
  end
  object DSxCodPostal: TDataSource
    DataSet = xCodigoPostal
    Left = 152
    Top = 392
  end
  object DSxDireccionCliente: TDataSource
    DataSet = xDireccionCliente
    Left = 152
    Top = 344
  end
  object Norma32: TCVBNorma32CSB
    NomFichero = 'CSB32.TXT'
    Depura = True
    Left = 624
    Top = 152
  end
  object Norma58: TCVBNorma58CSB
    NomFichero = 'CSB58.TXT'
    Left = 624
    Top = 200
  end
  object xCuentasClientes58: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* SQL se crea nuevamente dependiendo de Norma58 o SEPA */'
      'SELECT'
      'CAR.EJERCICIO_CARTERA, CAR.REGISTRO, CAR.LINEA, CAR.COD_CLI_PRO,'
      
        'CAR.ID_DOC, CAR.ID_CARTERA_DETALLE, CAR.ID_CARTERA, CAR.VENCIMIE' +
        'NTO,'
      'BAN.ENTIDAD, BAN.SUCURSAL, BAN.CONTROL, BAN.CUENTA, CAR.TERCERO,'
      'BAN.BANCO, BAN.IBAN, BAN.BIC,'
      'ST.NOMBRE_R_SOCIAL AS TITULO'
      'FROM VER_CARTERA_REMESA CAR'
      'LEFT JOIN SYS_TERCEROS ST  '
      'ON (CAR.TERCERO=ST.TERCERO) '
      'LEFT JOIN SYS_TERCEROS_BANCOS BAN  '
      'ON (CAR.TERCERO=BAN.TERCERO) AND '
      '   (BAN.ORDEN= (SELECT MIN(ORDEN) FROM SYS_TERCEROS_BANCOS BB  '
      
        '                WHERE (BAN.TERCERO=BB.TERCERO)AND(BB.ACTIVA=1)AN' +
        'D '
      '                      (BB.MODO = 0 OR BB.MODO = 2))) '
      'WHERE CAR.ID_REMESAS = ?ID_REMESAS '
      'ORDER BY BAN.ENTIDAD, BAN.SUCURSAL, BAN.CONTROL, BAN.CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMRemesas
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 280
    Top = 392
    object xCuentasClientes58REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xCuentasClientes58LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCuentasClientes58COD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xCuentasClientes58ENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xCuentasClientes58SUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xCuentasClientes58CONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xCuentasClientes58CUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 10
    end
    object xCuentasClientes58TERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCuentasClientes58TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCuentasClientes58EJERCICIO_CARTERA: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_CARTERA'
    end
    object xCuentasClientes58ID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object xCuentasClientes58ID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xCuentasClientes58ID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xCuentasClientes58IBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object xCuentasClientes58BIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object xCuentasClientes58BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
  end
  object DSXFacturas: TDataSource
    DataSet = xFacturas
    Left = 392
    Top = 8
  end
  object xTextoRecibo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,TEXTO FROM EMP_CAR' +
        'TERA_TEXTO'
      'WHERE ID_CARTERA = ?ID_CARTERA')
    UniDirectional = False
    Left = 280
    Top = 152
    object xTextoReciboEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTextoReciboEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTextoReciboCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTextoReciboSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xTextoReciboREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xTextoReciboTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 60
    end
  end
  object xCuentaTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT B.ENTIDAD, B.SUCURSAL, B.CONTROL, B.CUENTA, B.IBAN, B.BIC' +
        ', B.TIPO_ADEUDO_SEPA, B.FIRMA, B.TIPO_CONTRATO_SEPA,'
      '       S.TITULO, B.PAIS'
      'FROM SYS_TERCEROS_BANCOS B'
      'JOIN SYS_BANCOS S ON B.PAIS = S.PAIS AND B.ENTIDAD = S.ENTIDAD'
      'WHERE'
      'B.TERCERO = :TERCERO AND'
      'B.BANCO = :BANCO')
    SelectSQL.Strings = (
      
        'SELECT B.ENTIDAD, B.SUCURSAL, B.CONTROL, B.CUENTA, B.IBAN, B.BIC' +
        ', B.TIPO_ADEUDO_SEPA, B.FIRMA, B.TIPO_CONTRATO_SEPA,'
      '       S.TITULO, B.PAIS'
      'FROM SYS_TERCEROS_BANCOS B'
      'JOIN SYS_BANCOS S ON B.PAIS = S.PAIS AND B.ENTIDAD = S.ENTIDAD'
      'WHERE'
      'B.TERCERO = :TERCERO AND'
      '((B.BANCO = :BANCO_CLIPRO) OR (:BANCO_CLIPRO = 0)) AND'
      'B.ACTIVA = 1 AND'
      'B.MODO IN (0, 2)'
      'ORDER BY B.ORDEN')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 280
    Top = 104
    object xCuentaTercerosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xCuentaTercerosSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xCuentaTercerosCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xCuentaTercerosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
    end
    object xCuentaTercerosIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object xCuentaTercerosBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object xCuentaTercerosTIPO_ADEUDO_SEPA: TFIBStringField
      DisplayLabel = 'Tipo Adeudo'
      FieldName = 'TIPO_ADEUDO_SEPA'
      Size = 4
    end
    object xCuentaTercerosFIRMA: TFIBStringField
      DisplayLabel = 'Mandato'
      FieldName = 'FIRMA'
      Size = 15
    end
    object xCuentaTercerosTIPO_CONTRATO_SEPA: TFIBStringField
      DisplayLabel = 'Tipo Contrato'
      FieldName = 'TIPO_CONTRATO_SEPA'
      Size = 4
    end
    object xCuentaTercerosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCuentaTercerosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSxCuentaTerceros: TDataSource
    DataSet = xCuentaTerceros
    Left = 392
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 624
    Top = 56
  end
  object xBancoNorma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      'ENTIDAD, SUCURSAL, CONTROL, CUENTA, IBAN, BIC, '
      'TIPO_ADEUDO_SEPA, FIRMA, FECHA_FIRMA, TIPO_CONTRATO_SEPA'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'BANCO = :BANCO')
    UniDirectional = False
    Left = 280
    Top = 440
  end
end
