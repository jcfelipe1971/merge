object DMNominasCabecera: TDMNominasCabecera
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 641
  Top = 224
  Height = 470
  Width = 563
  object QMNomCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      ''
      ' delete from  ver_emp_nominas_cabecera'
      '    where'
      '    ID=?old_ID ;')
    InsertSQL.Strings = (
      'insert into EMP_NOMINAS_CABECERA ('
      '  ID,'
      '  EMPRESA,'
      '  EJERCICIO,'
      '  CANAL,'
      '  EMPLEADO,'
      '  PERIODO,'
      '  CERRADO,'
      '  PAGADO,'
      '  LISTADO,'
      '  EJERCICIO_CIERRE,'
      '  FECHA_COBRO,'
      '  ENTRADA,'
      '  FECHA_INI_PERIODO,'
      '  ESTADO,'
      '  FECHA,'
      '  FECHA_FIN_PERIODO,'
      '  AFP,'
      '  ISAPRE,'
      ' PLAN_ISAPRE'
      ')'
      ''
      '  VALUES'
      '  ('
      '  ?ID,'
      '  ?EMPRESA,'
      '  ?EJERCICIO,'
      '  ?CANAL,'
      '  ?EMPLEADO,'
      '  ?PERIODO,'
      '  ?CERRADO,'
      '  ?PAGADO,'
      '  ?LISTADO,'
      '  ?EJERCICIO_CIERRE,'
      '  ?FECHA_COBRO,'
      '  ?ENTRADA,'
      '  ?FECHA_INI_PERIODO,'
      '  ?ESTADO,'
      '  ?FECHA,'
      '  ?FECHA_FIN_PERIODO,'
      '  ?AFP,'
      '  ?ISAPRE,'
      '  ?PLAN_ISAPRE);')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_CABECERA'
      'WHERE '
      'ID = ?ID')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_CABECERA'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL= ?CANAL'
      'ORDER BY EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update EMP_NOMINAS_CABECERA'
      '    set'
      '  EMPRESA = ?EMPRESA,'
      '  EJERCICIO = ?EJERCICIO,'
      '  CANAL =  ?CANAL,'
      '  EMPLEADO = ?EMPLEADO,'
      '  PERIODO = ?PERIODO,'
      '  CERRADO = ?CERRADO,'
      '  LISTADO = ?LISTADO ,'
      '  PAGADO = ?PAGADO,'
      '  EJERCICIO_CIERRE = ?EJERCICIO_CIERRE,'
      '  FECHA_COBRO = ?FECHA_COBRO ,'
      '  ENTRADA = ?ENTRADA,'
      '  FECHA_INI_PERIODO = ?FECHA_INI_PERIODO,'
      '  ESTADO = ?ESTADO,'
      '  FECHA = ?FECHA,'
      '  FECHA_FIN_PERIODO = ?FECHA_FIN_PERIODO,'
      '  AFP = ?AFP,'
      '  ISAPRE = ?ISAPRE,'
      ' PLAN_ISAPRE = ?PLAN_ISAPRE'
      '  WHERE '
      '  ID = ?ID;')
    AfterOpen = QMNomCabAfterOpen
    AfterPost = QMNomCabAfterPost
    BeforeClose = QMNomCabBeforeClose
    BeforeDelete = QMNomCabBeforeDelete
    BeforeEdit = QMNomCabBeforeEdit
    BeforeInsert = QMNomCabBeforeInsert
    BeforePost = QMNomCabBeforePost
    OnNewRecord = QMNomCabNewRecord
    ClavesPrimarias.Strings = (
      'ID'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_CABECERA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 80
    Top = 8
    object QMNomCabID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNomCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNomCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNomCabEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMNomCabPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      OnChange = QMNomCabPERIODOChange
      Size = 40
    end
    object QMNomCabCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object QMNomCabEJERCICIO_CIERRE: TIntegerField
      DisplayLabel = 'Ejercicio Cierre'
      FieldName = 'EJERCICIO_CIERRE'
    end
    object QMNomCabENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMNomCabFECHA_INI_PERIODO: TDateTimeField
      DisplayLabel = 'Fec. Ini. Periodo'
      FieldName = 'FECHA_INI_PERIODO'
    end
    object QMNomCabESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMNomCabFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMNomCabFECHA_FIN_PERIODO: TDateTimeField
      DisplayLabel = 'Fec. Fin Periodo'
      FieldName = 'FECHA_FIN_PERIODO'
    end
    object QMNomCabFECHA_COBRO: TDateTimeField
      DisplayLabel = 'Fec. Cobro'
      FieldName = 'FECHA_COBRO'
    end
    object QMNomCabTDEVENGO: TFloatField
      DisplayLabel = 'Total Devengo'
      FieldName = 'TDEVENGO'
    end
    object QMNomCabTDEDUCCION: TFloatField
      DisplayLabel = 'Total Deduccion'
      FieldName = 'TDEDUCCION'
    end
    object QMNomCabPERCIBIR: TFloatField
      DisplayLabel = 'Percibir'
      FieldName = 'PERCIBIR'
    end
    object QMNomCabNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMNomCabNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMNomCabCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object QMNomCabTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMNomCabDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object QMNomCabSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMNomCabN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'Nro Seg. Social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object QMNomCabINI_CONTRATO: TDateTimeField
      DisplayLabel = 'Inicio Contrato'
      FieldName = 'INI_CONTRATO'
      EditMask = '!99/99/00;1;_'
    end
    object QMNomCabTITULO_PERIODO: TFIBStringField
      DisplayLabel = 'Desc. Periodo'
      FieldName = 'TITULO_PERIODO'
      Size = 40
    end
    object QMNomCabID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMNomCabLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMNomCabPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMNomCabRIC_CIERRE: TIntegerField
      DisplayLabel = 'RIC de Cierre'
      FieldName = 'RIC_CIERRE'
    end
    object QMNomCabEJERCICIO_PAGO: TIntegerField
      DisplayLabel = 'Ejercicio de Pago'
      FieldName = 'EJERCICIO_PAGO'
    end
    object QMNomCabRIC_PAGO: TIntegerField
      DisplayLabel = 'RIC de Pago'
      FieldName = 'RIC_PAGO'
    end
    object QMNomCabIMP_PAGADO: TFloatField
      DisplayLabel = 'Importe de Pago'
      FieldName = 'IMP_PAGADO'
    end
    object QMNomCabIMP_ANTICIPO: TFloatField
      DisplayLabel = 'Importe de Anticipo'
      FieldName = 'IMP_ANTICIPO'
    end
    object QMNomCabCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cuenta de Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QMNomCabFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha de Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QMNomCabFECHA_INGRESO: TDateTimeField
      DisplayLabel = 'Fecha Ingreso'
      FieldName = 'FECHA_INGRESO'
    end
    object QMNomCabAFP: TFIBStringField
      FieldName = 'AFP'
      Size = 15
    end
    object QMNomCabISAPRE: TFIBStringField
      FieldName = 'ISAPRE'
      Size = 15
    end
    object QMNomCabPLAN_ISAPRE: TFloatField
      DisplayLabel = 'Plan ISAPRE'
      FieldName = 'PLAN_ISAPRE'
    end
  end
  object DSQMNomCab: TDataSource
    DataSet = QMNomCab
    Left = 216
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 344
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 464
    Top = 8
  end
  object QMNomDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_DETALLE'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_DETALLE'
      
        '  (CONCEPTO,'#13#10'DESCRIPCION,ID,ID_CABECERA,ID_CONCEPTO,LINEA,CANTI' +
        'DAD,IMPORTE,DEVENGO,DEDUCCION,SUJETO_SEG_SOCIAL,'#13#10'SIGNO,TIPO_IMP' +
        'ORTE)'
      'VALUES'
      
        '  (?CONCEPTO,'#13#10'?DESCRIPCION,?ID,?ID_CABECERA,?ID_CONCEPTO,?LINEA' +
        ',?CANTIDAD,?IMPORTE,?DEVENGO,?DEDUCCION,?SUJETO_SEG_SOCIAL,'#13#10'?SI' +
        'GNO,?TIPO_IMPORTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DETALLE'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_NOMINAS_DETALLE'
      'WHERE'
      'ID_CABECERA = :ID'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_DETALLE'
      'SET'
      '  CONCEPTO=?CONCEPTO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,ID_CABECERA=?ID_CABECERA '
      '  ,ID_CONCEPTO=?ID_CONCEPTO '
      '  ,LINEA=?LINEA '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,IMPORTE=?IMPORTE '
      '  ,DEVENGO=?DEVENGO '
      '  ,DEDUCCION=?DEDUCCION '
      '  ,SUJETO_SEG_SOCIAL=?SUJETO_SEG_SOCIAL '
      '  ,SIGNO=?SIGNO '
      '  ,TIPO_IMPORTE=?TIPO_IMPORTE '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMNomCab
    AfterDelete = QMNomDetAfterDelete
    AfterOpen = QMNomDetAfterOpen
    AfterPost = QMNomDetAfterPost
    BeforeClose = QMNomDetBeforeClose
    BeforeDelete = QMNomDetBeforeDelete
    BeforeEdit = QMNomDetBeforeEdit
    BeforeInsert = QMNomDetBeforeInsert
    BeforePost = QMNomDetBeforePost
    OnNewRecord = QMNomDetNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 80
    Top = 56
    object QMNomDetCONCEPTO: TFIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      OnChange = QMNomDetCONCEPTOChange
      Size = 5
    end
    object QMNomDetDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMNomDetID: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID'
    end
    object QMNomDetID_CABECERA: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_CABECERA'
    end
    object QMNomDetID_CONCEPTO: TIntegerField
      DisplayLabel = 'Id Concepto'
      FieldName = 'ID_CONCEPTO'
    end
    object QMNomDetDEVENGO: TFloatField
      DisplayLabel = 'Devengo'
      FieldName = 'DEVENGO'
    end
    object QMNomDetDEDUCCION: TFloatField
      DisplayLabel = 'Deduccion'
      FieldName = 'DEDUCCION'
    end
    object QMNomDetCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMNomDetIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMNomDetSUJETO_SEG_SOCIAL: TIntegerField
      DisplayLabel = 'Sujeto Seg. Social'
      FieldName = 'SUJETO_SEG_SOCIAL'
    end
    object QMNomDetLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMNomDetSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object QMNomDetTIPO_IMPORTE: TIntegerField
      DisplayLabel = 'Tipo Importe'
      FieldName = 'TIPO_IMPORTE'
    end
    object QMNomDetTIPO_CONCEPTO: TIntegerField
      DisplayLabel = 'Tipo Concepto'
      FieldName = 'TIPO_CONCEPTO'
    end
  end
  object QMNomConcp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_NOMINA_CONCEPTOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_NOMINA_CONCEPTOS'
      '  (ID,CONCEPTO,DESCRIPCION)'
      'VALUES'
      '  (?ID,?CONCEPTO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_NOMINA_CONCEPTOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_NOMINA_CONCEPTOS'
      'WHERE'
      'ID = :ID_CONCEPTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_NOMINA_CONCEPTOS'
      'SET'
      '  CONCEPTO=?CONCEPTO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMNomDet
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_NOMINA_CONCEPTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 344
    Top = 56
  end
  object DSQMNomConcp: TDataSource
    DataSet = QMNomConcp
    Left = 464
    Top = 56
  end
  object DSQMNomDet: TDataSource
    DataSet = QMNomDet
    Left = 216
    Top = 56
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 216
    Top = 104
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT C.TDEVENGO, C.TDEDUCCION, C.PERCIBIR, C.ESTADO, C.LISTADO' +
        ', C.PAGADO,'
      '       (SELECT SUM(D.IMPORTE)'
      '        FROM EMP_NOMINAS_DETALLE D'
      '        JOIN SYS_NOMINA_CONCEPTOS CC ON D.ID_CONCEPTO = CC.ID'
      '        WHERE'
      '        D.ID_CABECERA = C.ID AND'
      '        CC.TIPO_CONCEPTO = 1) TOTAL_DEDUCCION_CONCEPTO,'
      '       (SELECT SUM(D.IMPORTE)'
      '        FROM EMP_NOMINAS_DETALLE D'
      '        JOIN SYS_NOMINA_CONCEPTOS CC ON D.ID_CONCEPTO = CC.ID'
      '        WHERE'
      '        D.ID_CABECERA = C.ID AND'
      '        CC.TIPO_CONCEPTO = 2) TOTAL_DEVENGO_CONCEPTO,'
      '       (SELECT SUM(D.IMPORTE)'
      '        FROM EMP_NOMINAS_DETALLE D'
      '        JOIN SYS_NOMINA_CONCEPTOS CC ON D.ID_CONCEPTO = CC.ID'
      '        WHERE'
      '        D.ID_CABECERA = C.ID AND'
      '        CC.TIPO_CONCEPTO = 3) TOTAL_PERCIBIR_CONCEPTO'
      'FROM EMP_NOMINAS_CABECERA C'
      'WHERE'
      'C.ID = :ID')
    SelectSQL.Strings = (
      
        'SELECT C.TDEVENGO, C.TDEDUCCION, C.PERCIBIR, C.ESTADO, C.LISTADO' +
        ', C.PAGADO,'
      '       (SELECT SUM(D.IMPORTE)'
      '        FROM EMP_NOMINAS_DETALLE D'
      '        JOIN SYS_NOMINA_CONCEPTOS CC ON D.ID_CONCEPTO = CC.ID'
      '        WHERE'
      '        D.ID_CABECERA = C.ID AND'
      '        CC.TIPO_CONCEPTO = 1) TOTAL_DEDUCCION_CONCEPTO,'
      '       (SELECT SUM(D.IMPORTE)'
      '        FROM EMP_NOMINAS_DETALLE D'
      '        JOIN SYS_NOMINA_CONCEPTOS CC ON D.ID_CONCEPTO = CC.ID'
      '        WHERE'
      '        D.ID_CABECERA = C.ID AND'
      '        CC.TIPO_CONCEPTO = 2) TOTAL_DEVENGO_CONCEPTO,'
      '       (SELECT SUM(D.IMPORTE)'
      '        FROM EMP_NOMINAS_DETALLE D'
      '        JOIN SYS_NOMINA_CONCEPTOS CC ON D.ID_CONCEPTO = CC.ID'
      '        WHERE'
      '        D.ID_CABECERA = C.ID AND'
      '        CC.TIPO_CONCEPTO = 3) TOTAL_PERCIBIR_CONCEPTO'
      'FROM EMP_NOMINAS_CABECERA C'
      'WHERE'
      'C.ID = :ID')
    UniDirectional = False
    DataSource = DSQMNomCab
    Left = 80
    Top = 104
    object xInfoActualizadaTDEVENGO: TFloatField
      DisplayLabel = 'Total Devengo'
      FieldName = 'TDEVENGO'
    end
    object xInfoActualizadaTDEDUCCION: TFloatField
      FieldName = 'TDEDUCCION'
      DisplayFormat = 'Total Deduccion'
    end
    object xInfoActualizadaPERCIBIR: TFloatField
      FieldName = 'PERCIBIR'
      DisplayFormat = 'Total Percibir'
    end
    object xInfoActualizadaESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object xInfoActualizadaTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = xInfoActualizadaTITULO_ESTADOGetText
      Calculated = True
    end
    object xInfoActualizadaLISTADO: TIntegerField
      FieldName = 'LISTADO'
    end
    object xInfoActualizadaPAGADO: TIntegerField
      FieldName = 'PAGADO'
    end
    object xInfoActualizadaTOTAL_DEDUCCION_CONCEPTO: TFloatField
      DisplayLabel = 'Total Deduccion Concepto'
      FieldName = 'TOTAL_DEDUCCION_CONCEPTO'
    end
    object xInfoActualizadaTOTAL_DEVENGO_CONCEPTO: TFloatField
      DisplayLabel = 'Total Devengo Concepto'
      FieldName = 'TOTAL_DEVENGO_CONCEPTO'
    end
    object xInfoActualizadaTOTAL_PERCIBIR_CONCEPTO: TFloatField
      FieldName = 'TOTAL_PERCIBIR_CONCEPTO'
      DisplayFormat = 'Total Percibir Concepto'
    end
  end
  object QMNomDetHaberes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_DET_HABERES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_DET_HABERES'
      
        '  (ID,'#13#10'EMPRESA,EJERCICIO,CANAL,ID_CABECERA,LINEA,IMPORTE,CODIGO' +
        ',GLOSA,CALCULABLE,ES_IMPONIBLE,'#13#10'MOSTRAR_IMPRESION,ORDEN_IMPRESI' +
        'ON,ES_TOTAL,VISIBLE_EN_EMPLEADO)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?ID_CABECERA,?LINEA,?IMPORTE' +
        ',?CODIGO,?GLOSA,?CALCULABLE,?ES_IMPONIBLE,'#13#10'?MOSTRAR_IMPRESION,?' +
        'ORDEN_IMPRESION,?ES_TOTAL,?VISIBLE_EN_EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_HABERES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_HABERES'
      'WHERE'
      '   ID_CABECERA=?ID AND'
      '  VISIBLE_EN_EMPLEADO = 1 AND '
      '  ORDEN_IMPRESION <> 0'
      'ORDER BY ORDEN_IMPRESION ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_DET_HABERES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,ID_CABECERA=?ID_CABECERA '
      '  ,LINEA=?LINEA '
      '  ,IMPORTE=?IMPORTE '
      '  ,CODIGO=?CODIGO '
      '  ,GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,ES_IMPONIBLE=?ES_IMPONIBLE '
      '  ,MOSTRAR_IMPRESION=?MOSTRAR_IMPRESION '
      '  ,ORDEN_IMPRESION=?ORDEN_IMPRESION '
      '  ,ES_TOTAL=?ES_TOTAL '
      '  ,VISIBLE_EN_EMPLEADO=?VISIBLE_EN_EMPLEADO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMNomCab
    AfterInsert = QMNomDetHaberesAfterInsert
    AfterPost = QMNomDet_HDPAfterPost
    BeforeDelete = QMNomDetHaberesBeforeDelete
    BeforeEdit = QMNomDetHaberesBeforeEdit
    BeforeInsert = QMNomDetHaberesBeforeInsert
    BeforePost = QMNomDetHaberesBeforePost
    OnNewRecord = QMNomDetHaberesNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_DET_HABERES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 80
    Top = 152
    object QMNomDetHaberesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomDetHaberesID_CABECERA: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_CABECERA'
    end
    object QMNomDetHaberesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMNomDetHaberesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMNomDetHaberesCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      OnChange = QMNomDetHaberesCODIGOChange
      Size = 15
    end
    object QMNomDetHaberesGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMNomDetHaberesCALCULABLE: TIntegerField
      DisplayLabel = 'Calculable'
      FieldName = 'CALCULABLE'
    end
    object QMNomDetHaberesES_IMPONIBLE: TIntegerField
      DisplayLabel = 'Imponible'
      FieldName = 'ES_IMPONIBLE'
    end
    object QMNomDetHaberesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNomDetHaberesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNomDetHaberesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNomDetHaberesES_TOTAL: TIntegerField
      DisplayLabel = 'Es Total'
      FieldName = 'ES_TOTAL'
    end
    object QMNomDetHaberesORDEN_IMPRESION: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN_IMPRESION'
    end
  end
  object DSQMNomDetHaberes: TDataSource
    DataSet = QMNomDetHaberes
    Left = 216
    Top = 152
  end
  object QMNomDetDescuentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_DET_DESCUENTOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_DET_DESCUENTOS'
      
        '  (ID,'#13#10'EMPRESA,EJERCICIO,CANAL,ID_CABECERA,LINEA,IMPORTE,CODIGO' +
        ',GLOSA,CALCULABLE,ES_PERSONAL,'#13#10'MOSTRAR_IMPRESION,ORDEN_IMPRESIO' +
        'N,ES_TOTAL,VISIBLE_EN_EMPLEADO)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?ID_CABECERA,?LINEA,?IMPORTE' +
        ',?CODIGO,?GLOSA,?CALCULABLE,?ES_PERSONAL,'#13#10'?MOSTRAR_IMPRESION,?O' +
        'RDEN_IMPRESION,?ES_TOTAL,?VISIBLE_EN_EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_DESCUENTOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_DESCUENTOS'
      'WHERE'
      '  ID_CABECERA=?ID AND'
      '  VISIBLE_EN_EMPLEADO = 1 AND '
      '  ORDEN_IMPRESION <> 0'
      'ORDER BY ORDEN_IMPRESION ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_DET_DESCUENTOS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,ID_CABECERA=?ID_CABECERA '
      '  ,LINEA=?LINEA '
      '  ,IMPORTE=?IMPORTE '
      '  ,CODIGO=?CODIGO '
      '  ,GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,ES_PERSONAL=?ES_PERSONAL '
      '  ,MOSTRAR_IMPRESION=?MOSTRAR_IMPRESION '
      '  ,ORDEN_IMPRESION=?ORDEN_IMPRESION '
      '  ,ES_TOTAL=?ES_TOTAL '
      '  ,VISIBLE_EN_EMPLEADO=?VISIBLE_EN_EMPLEADO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMNomCab
    AfterPost = QMNomDet_HDPAfterPost
    BeforeDelete = QMNomDetDescuentosBeforeDelete
    BeforeEdit = QMNomDetDescuentosBeforeEdit
    BeforeInsert = QMNomDetDescuentosBeforeInsert
    BeforePost = QMNomDetDescuentosBeforePost
    OnNewRecord = QMNomDetDescuentosNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_DET_DESCUENTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 80
    Top = 200
    object QMNomDetDescuentosID: TIntegerField
      FieldName = 'ID'
    end
    object QMNomDetDescuentosID_CABECERA: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_CABECERA'
    end
    object QMNomDetDescuentosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMNomDetDescuentosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMNomDetDescuentosCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      OnChange = QMNomDetDescuentosCODIGOChange
      Size = 15
    end
    object QMNomDetDescuentosGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMNomDetDescuentosCALCULABLE: TIntegerField
      DisplayLabel = 'Calculable'
      FieldName = 'CALCULABLE'
    end
    object QMNomDetDescuentosES_PERSONAL: TIntegerField
      DisplayLabel = 'Personal'
      FieldName = 'ES_PERSONAL'
    end
    object QMNomDetDescuentosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNomDetDescuentosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNomDetDescuentosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNomDetDescuentosES_TOTAL: TIntegerField
      DisplayLabel = 'Es Total'
      FieldName = 'ES_TOTAL'
    end
    object QMNomDetDescuentosORDEN_IMPRESION: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN_IMPRESION'
    end
  end
  object DSQMNomDetDescuentos: TDataSource
    DataSet = QMNomDetDescuentos
    Left = 216
    Top = 200
  end
  object QMNomDetParametros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_DET_PARAMETROS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_DET_PARAMETROS'
      
        '  (ID,'#13#10'EMPRESA,EJERCICIO,CANAL,ID_CABECERA,LINEA,IMPORTE,DATO_T' +
        'EXTO,DATO_FECHA,CODIGO,GLOSA,'#13#10'CALCULABLE,TIPO_DATO,ES_TOTAL,VIS' +
        'IBLE_EN_EMPLEADO)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?ID_CABECERA,?LINEA,?IMPORTE' +
        ',?DATO_TEXTO,?DATO_FECHA,?CODIGO,?GLOSA,'#13#10'?CALCULABLE,?TIPO_DATO' +
        ',?ES_TOTAL,?VISIBLE_EN_EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_PARAMETROS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_NOMINAS_DET_PARAMETROS'
      'WHERE'
      '  ID_CABECERA=?ID '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_DET_PARAMETROS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,ID_CABECERA=?ID_CABECERA '
      '  ,LINEA=?LINEA '
      '  ,IMPORTE=?IMPORTE '
      '  ,DATO_TEXTO=?DATO_TEXTO '
      '  ,DATO_FECHA=?DATO_FECHA '
      '  ,CODIGO=?CODIGO '
      '  ,GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,TIPO_DATO=?TIPO_DATO '
      '  ,ES_TOTAL=?ES_TOTAL '
      '  ,VISIBLE_EN_EMPLEADO=?VISIBLE_EN_EMPLEADO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMNomCab
    AfterPost = QMNomDet_HDPAfterPost
    BeforeDelete = QMNomDetParametrosBeforeDelete
    BeforeEdit = QMNomDetParametrosBeforeEdit
    BeforeInsert = QMNomDetParametrosBeforeInsert
    BeforePost = QMNomDetParametrosBeforePost
    OnNewRecord = QMNomDetParametrosNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_DET_PARAMETROS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 80
    Top = 248
    object QMNomDetParametrosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomDetParametrosID_CABECERA: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_CABECERA'
    end
    object QMNomDetParametrosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMNomDetParametrosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      OnGetText = QMNomDetParametrosIMPORTEGetText
    end
    object QMNomDetParametrosCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      OnChange = QMNomDetParametrosCODIGOChange
      Size = 15
    end
    object QMNomDetParametrosGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMNomDetParametrosCALCULABLE: TIntegerField
      DisplayLabel = 'Calculable'
      FieldName = 'CALCULABLE'
    end
    object QMNomDetParametrosDATO_TEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'DATO_TEXTO'
      Size = 15
    end
    object QMNomDetParametrosDATO_FECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'DATO_FECHA'
    end
    object QMNomDetParametrosTIPO_DATO: TFIBStringField
      DisplayLabel = 'Tipo Dato'
      FieldName = 'TIPO_DATO'
      Size = 15
    end
    object QMNomDetParametrosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNomDetParametrosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNomDetParametrosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNomDetParametrosES_TOTAL: TIntegerField
      DisplayLabel = 'Es Total'
      FieldName = 'ES_TOTAL'
    end
    object QMNomDetParametrosORDEN_IMPRESION: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN_IMPRESION'
    end
  end
  object DSQMNomDetParametros: TDataSource
    DataSet = QMNomDetParametros
    Left = 216
    Top = 248
  end
  object xInfoActualizadaDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      ''
      'WITH consulta AS ('
      '  select * from VER_EMP_NOMINAS_DET_HABERES H'
      'where  (H.CODIGO='#39'H012'#39' or'
      '          H.CODIGO='#39'H013'#39' or'
      '          H.CODIGO='#39'H014'#39' or'
      '          H.CODIGO='#39'H020'#39') and id_cabecera=:ID'
      'union'
      'select * from VER_EMP_NOMINAS_DET_DESCUENTOS D'
      'where  (D.CODIGO='#39'D017'#39' ) and id_cabecera=ID'
      ')'
      ' '
      'SELECT'
      '   M.importe as ImporteH012,'
      '   N.importe as ImporteH013,'
      '   O.importe as ImporteH020,'
      '   P.importe as ImporteD017'
      'FROM'
      '   RDB$DATABASE'
      'JOIN'
      '   consulta M'
      '      ON M.CODIGO='#39'H012'#39
      'JOIN'
      '   consulta N'
      '      ON N.CODIGO='#39'H013'#39
      'JOIN'
      '   consulta O'
      '      ON O.CODIGO='#39'H020'#39
      'JOIN'
      '   consulta P'
      '      ON P.CODIGO='#39'D017'#39' ')
    SelectSQL.Strings = (
      'with consulta'
      'as (select *'
      '    from ver_emp_nominas_det_haberes h'
      '    where'
      
        '    (h.codigo = '#39'H012'#39' or h.codigo = '#39'H013'#39' or h.codigo = '#39'H014'#39 +
        ' or h.codigo = '#39'H020'#39') and'
      '    id_cabecera = :id'
      '    union'
      '    select *'
      '    from ver_emp_nominas_det_descuentos d'
      '    where'
      '    (d.codigo = '#39'D017'#39') and'
      '    id_cabecera = :id)'
      
        'select m.importe as importeh012, n.importe as importeh013, o.imp' +
        'orte as importeh020, p.importe as imported017'
      'from rdb$database'
      'left join consulta m on m.codigo = '#39'H012'#39
      'left join consulta n on n.codigo = '#39'H013'#39
      'left join consulta o on o.codigo = '#39'H020'#39
      'left join consulta p on p.codigo = '#39'D017'#39)
    UniDirectional = False
    DataSource = DSQMNomCab
    Left = 80
    Top = 296
    object xInfoActualizadaDetIMPORTEH012: TFloatField
      DisplayLabel = 'Tot. Haberes'
      FieldName = 'IMPORTEH012'
    end
    object xInfoActualizadaDetIMPORTEH013: TFloatField
      DisplayLabel = 'Base Impon.'
      FieldName = 'IMPORTEH013'
    end
    object xInfoActualizadaDetIMPORTEH020: TFloatField
      DisplayLabel = 'Liq. a Pagar'
      FieldName = 'IMPORTEH020'
    end
    object xInfoActualizadaDetIMPORTED017: TFloatField
      DisplayLabel = 'Total Descuentos'
      FieldName = 'IMPORTED017'
    end
  end
  object DSxInfoActualizadaDet: TDataSource
    DataSet = xInfoActualizadaDet
    Left = 216
    Top = 296
  end
  object QMFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF FROM GES_FIRMAS'
      'WHERE'
      'TIPO = '#39'NOM'#39' AND'
      'ID_DOC = :ID AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    DataSource = DSQMNomCab
    Left = 80
    Top = 344
    object QMFirmasID_FIRMA: TIntegerField
      DisplayLabel = 'Id Firma'
      FieldName = 'ID_FIRMA'
    end
    object QMFirmasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMFirmasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSQMFirmas: TDataSource
    DataSet = QMFirmas
    Left = 216
    Top = 344
  end
  object DSQPagos: TDataSource
    DataSet = QPagos
    Left = 216
    Top = 392
  end
  object QPagos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT N.*, T.NOMBRE_R_SOCIAL AS NOMBRE, T.NIF, 3 AS MOD_PAGO, B' +
        '.CUENTA AS CTA_EMPLEADO, T.EMAIL AS CORREO'
      'FROM EMP_NOMINAS_CABECERA N'
      
        'JOIN OPE_EMPLEADO E ON N.EMPRESA = E.EMPRESA AND N.EMPLEADO = E.' +
        'EMPLEADO'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_BANCOS B ON T.TERCERO = B.TERCERO AND B.B' +
        'ANCO = 1'
      'WHERE'
      'N.EMPRESA = :EMPRESA AND'
      'N.EJERCICIO = :EJERCICIO AND'
      'N.CANAL = :CANAL AND'
      'N.EMPLEADO = :EMPLEADO AND'
      'N.PERIODO = :PERIODO ')
    SelectSQL.Strings = (
      
        'SELECT N.*, T.NOMBRE_R_SOCIAL AS NOMBRE, T.NIF, 3 AS MOD_PAGO, B' +
        '.CUENTA AS CTA_EMPLEADO, T.EMAIL AS CORREO'
      'FROM EMP_NOMINAS_CABECERA N'
      
        'JOIN OPE_EMPLEADO E ON N.EMPRESA = E.EMPRESA AND N.EMPLEADO = E.' +
        'EMPLEADO'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_BANCOS B ON T.TERCERO = B.TERCERO AND B.B' +
        'ANCO = 1'
      'WHERE'
      'N.EMPRESA = :EMPRESA AND'
      'N.EJERCICIO = :EJERCICIO AND'
      'N.CANAL = :CANAL AND'
      'N.PERIODO = :PERIODO '
      'ORDER BY N.EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_NOMINAS_CABECERA'
      'SET'
      '  CUENTA_PAGO=?CUENTA_PAGO '
      '  ,FECHA_PAGO=?FECHA_PAGO '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_NOMINAS_CABECERA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 80
    Top = 392
    object QPagosENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Seleccion'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QPagosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QPagosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QPagosRUT: TFIBStringField
      FieldName = 'NIF'
    end
    object QPagosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QPagosMOD_PAGO: TIntegerField
      DisplayLabel = 'Modo de Pago'
      FieldName = 'MOD_PAGO'
    end
    object QPagosCTA_EMPLEADO: TFIBStringField
      DisplayLabel = 'Cuenta Empleado'
      FieldName = 'CTA_EMPLEADO'
    end
    object QPagosCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cuenta  Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QPagosFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QPagosCORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'CORREO'
      Size = 100
    end
    object QPagosPERIODO: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      Size = 40
    end
    object QPagosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QPagosRIC_PAGO: TIntegerField
      DisplayLabel = 'RIG Pago'
      FieldName = 'RIC_PAGO'
    end
    object QPagosEJERCICIO_PAGO: TIntegerField
      DisplayLabel = 'Ejercicio Pago'
      FieldName = 'EJERCICIO_PAGO'
    end
    object QPagosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QPagosMARCA: TIntegerField
      DisplayLabel = 'Marca'
      FieldKind = fkCalculated
      FieldName = 'MARCA'
      Calculated = True
    end
    object QPagosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QPagosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QPagosEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QPagosCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object QPagosEJERCICIO_CIERRE: TIntegerField
      DisplayLabel = 'Ejer. Cierre'
      FieldName = 'EJERCICIO_CIERRE'
    end
    object QPagosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QPagosFECHA_INI_PERIODO: TDateTimeField
      DisplayLabel = 'Fec. Ini. Periodo'
      FieldName = 'FECHA_INI_PERIODO'
    end
    object QPagosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QPagosFECHA_FIN_PERIODO: TDateTimeField
      DisplayLabel = 'Fec. aFin Periodo'
      FieldName = 'FECHA_FIN_PERIODO'
    end
    object QPagosFECHA_COBRO: TDateTimeField
      DisplayLabel = 'Fec. Cobro'
      FieldName = 'FECHA_COBRO'
    end
    object QPagosTDEVENGO: TFloatField
      DisplayLabel = 'Total Devengo'
      FieldName = 'TDEVENGO'
    end
    object QPagosTDEDUCCION: TFloatField
      DisplayLabel = 'Total Deducido'
      FieldName = 'TDEDUCCION'
    end
    object QPagosPERCIBIR: TFloatField
      DisplayLabel = 'A Percibir'
      FieldName = 'PERCIBIR'
    end
    object QPagosLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QPagosRIC_CIERRE: TIntegerField
      DisplayLabel = 'RIC Cierre'
      FieldName = 'RIC_CIERRE'
    end
    object QPagosIMP_PAGADO: TFloatField
      DisplayLabel = 'Importe Pagado'
      FieldName = 'IMP_PAGADO'
    end
    object QPagosIMP_ANTICIPO: TFloatField
      DisplayLabel = 'Importe Anticipo'
      FieldName = 'IMP_ANTICIPO'
    end
  end
end
