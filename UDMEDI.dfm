object DMEDI: TDMEDI
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 536
  Top = 266
  Height = 325
  Width = 578
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 512
    Top = 16
  end
  object QEDIPedCab: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into'
      '  edi_ped_cab'
      '('
      '  empresa,'
      '  ejercicio,'
      '  canal,'
      '  serie,'
      '  tipo,'
      '  clave1,'
      '  nodo,'
      '  funcion,'
      '  numped,'
      '  fecha,'
      '  fechaepr,'
      '  fechaere,'
      '  fechatop,'
      '  formapag,'
      '  condesp,'
      '  pedabier,'
      '  lprecios,'
      '  ncontrat,'
      '  fcontrat,'
      '  cliente,'
      '  qpide,'
      '  aqsf,'
      '  depto,'
      '  receptor,'
      '  muelle,'
      '  vendedor,'
      '  qpaga,'
      '  portes,'
      '  recogida,'
      '  reposi,'
      '  entrega,'
      '  moneda,'
      '  calif1,'
      '  secuen1,'
      '  tipo1,'
      '  porcen1,'
      '  imp_des1,'
      '  calif2,'
      '  secuen2,'
      '  tipo2,'
      '  porcen2,'
      '  imp_des2,'
      '  calif3,'
      '  secuen3,'
      '  tipo3,'
      '  porcen3,'
      '  imp_des3,'
      '  calif4,'
      '  secuen4,'
      '  tipo4,'
      '  porcen4,'
      '  imp_des4,'
      '  calif5,'
      '  secuen5,'
      '  tipo5,'
      '  porcen5,'
      '  imp_des5,'
      '  tipoimp1,'
      '  tasaimp1,'
      '  baseimp1,'
      '  impimp1,'
      '  tipoimp2,'
      '  tasaimp2,'
      '  baseimp2,'
      '  impimp2,'
      '  tipoimp3,'
      '  tasaimp3,'
      '  baseimp3,'
      '  impimp3,'
      '  patref,'
      '  patdias,'
      '  patmes,'
      '  fechav,'
      '  vto1,'
      '  impvto1,'
      '  vto2,'
      '  impvto2,'
      '  vto3,'
      '  impvto3,'
      '  tbruto,'
      '  tneto,'
      '  tcargdes,'
      '  baseimp,'
      '  totimpues,'
      '  total,'
      '  frecogida,'
      '  transpor,'
      '  almrecog,'
      '  frefpag,'
      '  totcant,'
      '  tempora,'
      '  deptovent,'
      '  sucursal,'
      '  destmsg,'
      '  condpago,'
      '  transport,'
      '  lugadient'
      ')'
      'values'
      '('
      '  ?empresa,'
      '  ?ejercicio,'
      '  ?canal,'
      '  ?serie,'
      '  ?tipo,'
      '  ?clave1,'
      '  ?nodo,'
      '  ?funcion,'
      '  ?numped,'
      '  ?fecha,'
      '  ?fechaepr,'
      '  ?fechaere,'
      '  ?fechatop,'
      '  ?formapag,'
      '  ?condesp,'
      '  ?pedabier,'
      '  ?lprecios,'
      '  ?ncontrat,'
      '  ?fcontrat,'
      '  ?cliente,'
      '  ?qpide,'
      '  ?aqsf,'
      '  ?depto,'
      '  ?receptor,'
      '  ?muelle,'
      '  ?vendedor,'
      '  ?qpaga,'
      '  ?portes,'
      '  ?recogida,'
      '  ?reposi,'
      '  ?entrega,'
      '  ?moneda,'
      '  ?calif1,'
      '  ?secuen1,'
      '  ?tipo1,'
      '  ?porcen1,'
      '  ?imp_des1,'
      '  ?calif2,'
      '  ?secuen2,'
      '  ?tipo2,'
      '  ?porcen2,'
      '  ?imp_des2,'
      '  ?calif3,'
      '  ?secuen3,'
      '  ?tipo3,'
      '  ?porcen3,'
      '  ?imp_des3,'
      '  ?calif4,'
      '  ?secuen4,'
      '  ?tipo4,'
      '  ?porcen4,'
      '  ?imp_des4,'
      '  ?calif5,'
      '  ?secuen5,'
      '  ?tipo5,'
      '  ?porcen5,'
      '  ?imp_des5,'
      '  ?tipoimp1,'
      '  ?tasaimp1,'
      '  ?baseimp1,'
      '  ?impimp1,'
      '  ?tipoimp2,'
      '  ?tasaimp2,'
      '  ?baseimp2,'
      '  ?impimp2,'
      '  ?tipoimp3,'
      '  ?tasaimp3,'
      '  ?baseimp3,'
      '  ?impimp3,'
      '  ?patref,'
      '  ?patdias,'
      '  ?patmes,'
      '  ?fechav,'
      '  ?vto1,'
      '  ?impvto1,'
      '  ?vto2,'
      '  ?impvto2,'
      '  ?vto3,'
      '  ?impvto3,'
      '  ?tbruto,'
      '  ?tneto,'
      '  ?tcargdes,'
      '  ?baseimp,'
      '  ?totimpues,'
      '  ?total,'
      '  ?frecogida,'
      '  ?transpor,'
      '  ?almrecog,'
      '  ?frefpag,'
      '  ?totcant,'
      '  ?tempora,'
      '  ?deptovent,'
      '  ?sucursal,'
      '  ?destmsg,'
      '  ?condpago,'
      '  ?transport,'
      '  ?lugadient'
      ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 32
    Top = 16
  end
  object QEDIPedCabNotas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into'
      '  edi_ped_cab_notas'
      '('
      '  empresa,'
      '  ejercicio,'
      '  canal,'
      '  serie,'
      '  tipo,'
      '  clave1,'
      '  clave2,'
      '  tema,'
      '  texto1,'
      '  texto2,'
      '  texto3,'
      '  texto4,'
      '  texto5,'
      '  notas'
      ')'
      'values'
      '('
      '  ?empresa,'
      '  ?ejercicio,'
      '  ?canal,'
      '  ?serie,'
      '  ?tipo,'
      '  ?clave1,'
      '  ?clave2,'
      '  ?tema,'
      '  ?texto1,'
      '  ?texto2,'
      '  ?texto3,'
      '  ?texto4,'
      '  ?texto5,'
      '  ?notas'
      ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 128
    Top = 16
  end
  object QPedDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into'
      '  edi_ped_det'
      '('
      '  empresa,'
      '  ejercicio,'
      '  canal,'
      '  serie,'
      '  tipo,'
      '  rig,'
      '  clave1,'
      '  clave2,'
      '  refean,'
      '  dun14,'
      '  vp,'
      '  refcli,'
      '  refprov,'
      '  refetiq,'
      '  descmer,'
      '  descmer2,'
      '  desccons,'
      '  cantped,'
      '  umedida,'
      '  cantgrat,'
      '  cantue,'
      '  cantboni,'
      '  fechae,'
      '  precion,'
      '  preciob,'
      '  pvp,'
      '  neto,'
      '  calif1,'
      '  secuen1,'
      '  tipo1,'
      '  porcen1,'
      '  impdes1,'
      '  calif2,'
      '  secuen2,'
      '  tipo2,'
      '  porcen2,'
      '  impdes2,'
      '  calif3,'
      '  secuen3,'
      '  tipo3,'
      '  porcen3,'
      '  impdes3,'
      '  calif4,'
      '  secuen4,'
      '  tipo4,'
      '  porcen4,'
      '  impdes4,'
      '  tipoimp1,'
      '  tasaimp1,'
      '  impimp1,'
      '  tipoimp2,'
      '  tasaimp2,'
      '  impimp2,'
      '  tipoimp3,'
      '  tasaimp3,'
      '  impimp3,'
      '  nucue,'
      '  formato,'
      '  nuexp,'
      '  pncaja,'
      '  monprec,'
      '  marca,'
      '  color,'
      '  tamano,'
      '  present,'
      '  unidcom,'
      '  pum'
      ')'
      'values'
      '('
      '  ?empresa,'
      '  ?ejercicio,'
      '  ?canal,'
      '  ?serie,'
      '  ?tipo,'
      '  ?rig,'
      '  ?clave1,'
      '  ?clave2,'
      '  ?refean,'
      '  ?dun14,'
      '  ?vp,'
      '  ?refcli,'
      '  ?refprov,'
      '  ?refetiq,'
      '  ?descmer,'
      '  ?descmer2,'
      '  ?desccons,'
      '  ?cantped,'
      '  ?umedida,'
      '  ?cantgrat,'
      '  ?cantue,'
      '  ?cantboni,'
      '  ?fechae,'
      '  ?precion,'
      '  ?preciob,'
      '  ?pvp,'
      '  ?neto,'
      '  ?calif1,'
      '  ?secuen1,'
      '  ?tipo1,'
      '  ?porcen1,'
      '  ?impdes1,'
      '  ?calif2,'
      '  ?secuen2,'
      '  ?tipo2,'
      '  ?porcen2,'
      '  ?impdes2,'
      '  ?calif3,'
      '  ?secuen3,'
      '  ?tipo3,'
      '  ?porcen3,'
      '  ?impdes3,'
      '  ?calif4,'
      '  ?secuen4,'
      '  ?tipo4,'
      '  ?porcen4,'
      '  ?impdes4,'
      '  ?tipoimp1,'
      '  ?tasaimp1,'
      '  ?impimp1,'
      '  ?tipoimp2,'
      '  ?tasaimp2,'
      '  ?impimp2,'
      '  ?tipoimp3,'
      '  ?tasaimp3,'
      '  ?impimp3,'
      '  ?nucue,'
      '  ?formato,'
      '  ?nuexp,'
      '  ?pncaja,'
      '  ?monprec,'
      '  ?marca,'
      '  ?color,'
      '  ?tamano,'
      '  ?present,'
      '  ?unidcom,'
      '  ?pum'
      ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 224
    Top = 16
  end
  object QPedDetNotas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into'
      '  edi_ped_det_notas'
      '('
      '  empresa,'
      '  ejercicio,'
      '  canal,'
      '  serie,'
      '  tipo,'
      '  clave1,'
      '  clave2,'
      '  clave3,'
      '  tema,'
      '  texto1,'
      '  texto2,'
      '  texto3,'
      '  texto4,'
      '  texto5,'
      '  notas'
      ')'
      'values'
      '('
      '  ?empresa,'
      '  ?ejercicio,'
      '  ?canal,'
      '  ?serie,'
      '  ?tipo,'
      '  ?clave1,'
      '  ?clave2,'
      '  ?clave3,'
      '  ?tema,'
      '  ?texto1,'
      '  ?texto2,'
      '  ?texto3,'
      '  ?texto4,'
      '  ?texto5,'
      '  ?notas'
      ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 320
    Top = 16
  end
  object xEDIPedCab: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from edi_ped_cab'
      'where'
      'empresa = ?empresa and'
      'rig = 0'
      'order by clave1')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 32
    Top = 72
  end
  object xPedDet: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'select * from edi_ped_cab epc'
      'join edi_ped_det epd'
      'on epc.clave1 = epd.clave1'
      'where'
      'epc.empresa = ?empresa and'
      'epc.clave1 = ?clave1 and '
      'epd.clave2 = ?clave2')
    SelectSQL.Strings = (
      'select * from edi_ped_cab epc'
      'join edi_ped_det epd'
      'on epc.clave1 = epd.clave1'
      'where'
      'epc.empresa = ?empresa and'
      'epc.rig = 0 and'
      'epd.rig = 0'
      'order by epc.clave1, epd.clave2')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 224
    Top = 72
  end
  object DSxEDIPedCab: TDataSource
    DataSet = xEDIPedCab
    Left = 32
    Top = 120
  end
  object DSxPedDet: TDataSource
    DataSet = xPedDet
    Left = 224
    Top = 120
  end
  object DSxAlbAProcesar: TDataSource
    DataSet = xAlbAProcesar
    Left = 32
    Top = 216
  end
  object xAlbAProcesar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EDI_PROCESADO'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EDI_PROCESADO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,PROCESADO,PROCESAR,ETI' +
        'QUETA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?PROCESADO,?PROC' +
        'ESAR,?ETIQUETA)')
    RefreshSQL.Strings = (
      
        'SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,' +
        'GC.ALMACEN,'
      
        '       GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGE' +
        'NTE,GC.LIQUIDO,'
      '       EP.PROCESAR,EP.PROCESADO '
      'FROM EDI_PROCESADO EP'
      'JOIN GES_CABECERAS_S GC'
      'ON'
      'EP.EMPRESA = GC.EMPRESA AND'
      'EP.EJERCICIO = GC.EJERCICIO AND'
      'EP.CANAL = GC.CANAL AND'
      'EP.SERIE = GC.SERIE AND'
      'EP.TIPO = GC.TIPO AND'
      'EP.RIG = GC.RIG'
      'WHERE'
      '  EP.RIG=?RIG AND '
      '  EP.TIPO=?TIPO AND '
      '  EP.SERIE=?SERIE AND '
      '  EP.CANAL=?CANAL AND '
      '  EP.EJERCICIO=?EJERCICIO AND '
      '  EP.EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,' +
        'GC.ALMACEN,'
      
        '       GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGE' +
        'NTE,GC.LIQUIDO,'
      '       EP.PROCESAR,EP.PROCESADO '
      'FROM EDI_PROCESADO EP'
      'JOIN GES_CABECERAS_S GC'
      'ON'
      'EP.EMPRESA = GC.EMPRESA AND'
      'EP.EJERCICIO = GC.EJERCICIO AND'
      'EP.CANAL = GC.CANAL AND'
      'EP.SERIE = GC.SERIE AND'
      'EP.TIPO = GC.TIPO AND'
      'EP.RIG = GC.RIG'
      'WHERE'
      '  EP.EMPRESA=?EMPRESA AND '
      
        '  ((EP.EJERCICIO=?EJERCICIO) OR (EP.EJERCICIO=?EJERCICIO - 1)) A' +
        'ND '
      '  EP.CANAL=?CANAL AND '
      '  EP.TIPO=?TIPO AND'
      '  EP.PROCESADO <= ?PROCESADO AND'
      
        '  (GC.TERCERO in (SELECT TERCERO FROM SYS_TERCEROS WHERE CODIGO_' +
        'EDI >'#39#39'))'
      ''
      'ORDER BY EP.SERIE,EP.RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EDI_PROCESADO'
      'SET'
      '  PROCESAR=?PROCESAR '
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EDI_PROCESADO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 168
    object xAlbAProcesarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlbAProcesarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAlbAProcesarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlbAProcesarSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlbAProcesarTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlbAProcesarRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object xAlbAProcesarALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlbAProcesarFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAlbAProcesarCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xAlbAProcesarSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xAlbAProcesarFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xAlbAProcesarAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAlbAProcesarLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xAlbAProcesarPROCESAR: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'PROCESAR'
    end
    object xAlbAProcesarPROCESADO: TIntegerField
      DisplayLabel = 'Procesado'
      FieldName = 'PROCESADO'
    end
  end
  object DSxFacAProcesar: TDataSource
    DataSet = xFacAProcesar
    Left = 128
    Top = 216
  end
  object xFacAProcesar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EDI_PROCESADO'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EDI_PROCESADO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,PROCESADO,PROCESAR,ETI' +
        'QUETA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?PROCESADO,?PROC' +
        'ESAR,?ETIQUETA)')
    RefreshSQL.Strings = (
      
        'SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,' +
        'GC.ALMACEN,'
      
        '       GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGE' +
        'NTE,GC.LIQUIDO,'
      '       EP.PROCESAR,EP.PROCESADO '
      'FROM EDI_PROCESADO EP'
      'JOIN GES_CABECERAS_S GC'
      'ON'
      'EP.EMPRESA = GC.EMPRESA AND'
      'EP.EJERCICIO = GC.EJERCICIO AND'
      'EP.CANAL = GC.CANAL AND'
      'EP.SERIE = GC.SERIE AND'
      'EP.TIPO = GC.TIPO AND'
      'EP.RIG = GC.RIG'
      'WHERE'
      '  EP.RIG=?RIG AND '
      '  EP.TIPO=?TIPO AND '
      '  EP.SERIE=?SERIE AND '
      '  EP.CANAL=?CANAL AND '
      '  EP.EJERCICIO=?EJERCICIO AND '
      '  EP.EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,' +
        'GC.ALMACEN,'
      
        '       GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGE' +
        'NTE,GC.LIQUIDO,'
      '       EP.PROCESAR,EP.PROCESADO '
      'FROM EDI_PROCESADO EP'
      'JOIN GES_CABECERAS_S GC'
      'ON'
      'EP.EMPRESA = GC.EMPRESA AND'
      'EP.EJERCICIO = GC.EJERCICIO AND'
      'EP.CANAL = GC.CANAL AND'
      'EP.SERIE = GC.SERIE AND'
      'EP.TIPO = GC.TIPO AND'
      'EP.RIG = GC.RIG'
      'WHERE'
      '  EP.EMPRESA=?EMPRESA AND '
      
        '  ((EP.EJERCICIO=?EJERCICIO) OR (EP.EJERCICIO=?EJERCICIO - 1)) A' +
        'ND '
      '  EP.CANAL=?CANAL AND '
      '  EP.TIPO=?TIPO AND'
      '  EP.PROCESADO <= ?PROCESADO AND'
      '  GC.ESTADO = 5 AND'
      
        '  (GC.TERCERO in (SELECT TERCERO FROM SYS_TERCEROS WHERE CODIGO_' +
        'EDI >'#39#39'))'
      ''
      'ORDER BY EP.SERIE,EP.RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EDI_PROCESADO'
      'SET'
      '  PROCESAR=?PROCESAR  '
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EDI_PROCESADO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 128
    Top = 168
    object xFacAProcesarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFacAProcesarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFacAProcesarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFacAProcesarSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacAProcesarTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacAProcesarRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object xFacAProcesarALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xFacAProcesarFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xFacAProcesarCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xFacAProcesarSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xFacAProcesarFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xFacAProcesarAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xFacAProcesarLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xFacAProcesarPROCESAR: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'PROCESAR'
    end
    object xFacAProcesarPROCESADO: TIntegerField
      DisplayLabel = 'Procesado'
      FieldName = 'PROCESADO'
    end
  end
  object DSxAlbEtiAProcesar: TDataSource
    DataSet = xAlbEtiAProcesar
    Left = 224
    Top = 216
  end
  object xAlbEtiAProcesar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EDI_PROCESADO'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EDI_PROCESADO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,PROCESADO,PROCESAR,ETI' +
        'QUETA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?PROCESADO,?PROC' +
        'ESAR,?ETIQUETA)')
    RefreshSQL.Strings = (
      
        'SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,' +
        'GC.ALMACEN,'
      
        '       GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGE' +
        'NTE,GC.LIQUIDO,'
      '       EP.PROCESAR,EP.PROCESADO '
      'FROM EDI_PROCESADO EP'
      'JOIN GES_CABECERAS_S GC'
      'ON'
      'EP.EMPRESA = GC.EMPRESA AND'
      'EP.EJERCICIO = GC.EJERCICIO AND'
      'EP.CANAL = GC.CANAL AND'
      'EP.SERIE = GC.SERIE AND'
      'EP.TIPO = GC.TIPO AND'
      'EP.RIG = GC.RIG'
      'WHERE'
      '  EP.RIG=?RIG AND '
      '  EP.TIPO=?TIPO AND '
      '  EP.SERIE=?SERIE AND '
      '  EP.CANAL=?CANAL AND '
      '  EP.EJERCICIO=?EJERCICIO AND '
      '  EP.EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,' +
        'GC.ALMACEN,'
      
        '       GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGE' +
        'NTE,GC.LIQUIDO,'
      '       EP.PROCESAR,EP.ETIQUETA'
      'FROM EDI_PROCESADO EP'
      'JOIN GES_CABECERAS_S GC'
      'ON'
      'EP.EMPRESA = GC.EMPRESA AND'
      'EP.EJERCICIO = GC.EJERCICIO AND'
      'EP.CANAL = GC.CANAL AND'
      'EP.SERIE = GC.SERIE AND'
      'EP.TIPO = GC.TIPO AND'
      'EP.RIG = GC.RIG'
      'WHERE'
      '  EP.EMPRESA=?EMPRESA AND '
      
        '  ((EP.EJERCICIO=?EJERCICIO) OR (EP.EJERCICIO=?EJERCICIO - 1)) A' +
        'ND '
      '  EP.CANAL=?CANAL AND '
      '  EP.TIPO=?TIPO AND'
      '  EP.ETIQUETA <= ?ETIQUETA AND'
      
        '  (GC.TERCERO in (SELECT TERCERO FROM SYS_TERCEROS WHERE CODIGO_' +
        'EDI >'#39#39'))'
      ''
      'ORDER BY EP.SERIE,EP.RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EDI_PROCESADO'
      'SET'
      '  PROCESAR=?PROCESAR '
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EDI_PROCESADO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 224
    Top = 168
    object xAlbEtiAProcesarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlbEtiAProcesarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAlbEtiAProcesarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlbEtiAProcesarSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlbEtiAProcesarTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlbEtiAProcesarRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object xAlbEtiAProcesarALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlbEtiAProcesarFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAlbEtiAProcesarCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xAlbEtiAProcesarSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xAlbEtiAProcesarFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xAlbEtiAProcesarAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAlbEtiAProcesarLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xAlbEtiAProcesarPROCESAR: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'PROCESAR'
    end
  end
  object QPedDetLoc: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into'
      '  edi_ped_det_loc'
      '('
      '  empresa,'
      '  ejercicio,'
      '  canal,'
      '  serie,'
      '  tipo,'
      '  rig,'
      '  clave1,'
      '  clave2,'
      '  clave3,'
      '  lugar,'
      '  cantidad,'
      '  fechentr,'
      '  fechult'
      ')'
      'values'
      '('
      '  ?empresa,'
      '  ?ejercicio,'
      '  ?canal,'
      '  ?serie,'
      '  ?tipo,'
      '  ?rig,'
      '  ?clave1,'
      '  ?clave2,'
      '  ?clave3,'
      '  ?lugar,'
      '  ?cantidad,'
      '  ?fechentr,'
      '  ?fechult'
      ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 416
    Top = 16
  end
  object xEDIPedDetLoc: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from edi_ped_det_loc'
      'where'
      'empresa = ?empresa and'
      'rig = 0'
      'order by clave1')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 128
    Top = 72
  end
  object DSxEDIPedDetLoc: TDataSource
    DataSet = xEDIPedDetLoc
    Left = 128
    Top = 120
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 512
    Top = 64
  end
  object xArticulosEDI: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT'
      'A.ARTICULO, A.TITULO_LARGO AS TITULO '
      'FROM ART_ARTICULOS_MODELOS M'
      'LEFT JOIN ART_ARTICULOS_MOD_COLOR C'
      'ON M.ID_A_M = C.ID_A_M'
      'LEFT JOIN ART_ARTICULOS_M_C_TALLAS T'
      'ON C.ID_A_M_C = T.ID_A_M_C'
      'LEFT JOIN ART_ARTICULOS A'
      
        'ON M.EMPRESA = A.EMPRESA AND A.ARTICULO = T.ARTICULO -- T.ID_A_M' +
        '_C_T = A.ID_A_M_C_T'
      'WHERE'
      'M.EMPRESA=?EMPRESA AND'
      '?REF_CLIENTE STARTING WITH M.REF_CLIENTE AND'
      'M.REF_CLIENTE > '#39#39
      'ORDER BY A.EMPRESA, A.ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 320
    Top = 168
    object xArticulosEDIARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosEDITITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSxArticulosEDI: TDataSource
    DataSet = xArticulosEDI
    Left = 416
    Top = 168
  end
  object xReporteDeVentas: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select '
      
        't.nombre_r_social, td.dir_completa_n, l.titulo titulo_localidad,' +
        ' l.codigo_postal, pa.pais, c.fecha, c.moneda, '
      
        'd.articulo, ar.alfa_1, ar.alfa_7, ar.alfa_8, d.unidades, d.b_imp' +
        'onible, d.liquido, '
      
        '(d.b_imponible / d.unidades) b_imponible_unit, (d.liquido / d.un' +
        'idades) liquido_unit'
      'from ges_cabeceras_s c'
      'join ges_cabeceras_s_alb a on c.id_s = a.id_s'
      'join ges_detalles_s d on c.id_s = d.id_s'
      'join ges_detalles_s_alb da on d.id_detalles_s = da.id_detalles_s'
      
        'join emp_clientes cl on c.empresa = cl.empresa and c.cliente = c' +
        'l.cliente'
      'join sys_terceros t on c.tercero = t.tercero'
      
        'join sys_terceros_direcciones td on c.tercero = td.tercero and c' +
        '.direccion = td.direccion'
      'join sys_localidades l on td.id_local = l.id_local'
      
        'join sys_provincias pr on l.pais = pr.pais and l.provincia = pr.' +
        'provincia'
      'join sys_paises pa on pr.pais = pa.pais'
      
        'join art_articulos ar on d.id_a = ar.id_a --d.empresa = a.empres' +
        'a a d.articulo = a.articulo'
      'where'
      'c.empresa = :empresa and'
      'c.ejercicio = :ejercicio and'
      'c.canal = :canal and'
      'c.serie = :serie and'
      'c.tipo = '#39'ALB'#39' and'
      'c.fecha between :desde and :hasta and'
      'ar.familia = :familia'
      'order by c.fecha, c.rig, d.linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 320
    Top = 216
  end
  object DSxReporteDeVentas: TDataSource
    DataSet = xReporteDeVentas
    Left = 416
    Top = 216
  end
end
