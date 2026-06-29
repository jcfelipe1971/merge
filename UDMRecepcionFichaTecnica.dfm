object DMRecepcionFichaTecnica: TDMRecepcionFichaTecnica
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 322
  Top = 218
  Height = 259
  Width = 393
  object xRecepcion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_REP_RECEPCION'
      'WHERE'
      '  ID_REP_RECEPCION=?old_ID_REP_RECEPCION ')
    InsertSQL.Strings = (
      'INSERT INTO VER_REP_RECEPCION'
      
        '  (EMPRESA,'#13#10'ID_REP_RECEPCION,ID_FICHA_TECNICA,MATRICULA,TITULO_' +
        'VEHICULO,KILOMETRAJE,COMBUSTIBLE,ID_CLIENTE,CLIENTE,NOMBRE_R_SOC' +
        'IAL,ID_REPARACION,'#13#10'ID_EMPLEADO,EMPLEADO,NOMBRE_EMPLEADO,FECHA,T' +
        'ESTIGO_AVERIA,ESTADO_PLACAS_MATRICULA,ESTADO_CRISTALES,ESTADO_ES' +
        'COBILLAS,ANTENA,PILOTOS_Y_FAROS,'#13#10'APERTURA_PUERTAS_DELANTERAS,AP' +
        'ERTURA_PUERTAS_TRASERAS,ELEVALUNAS_DELATEROS,ELEVALUNAS_TRASEROS' +
        ',RETROVISORES,COMENTARIO_ESTADO,TRABAJOS_A_REALIZAR,ID_GALERIA_R' +
        'ECEPCION,COMENTARIOS_CLIENTE,AUTORIZA_PRESUPUESTO,'#13#10'AUTORIZA_PRU' +
        'EBAS,PIEZAS_DEL_CLIENTE,RECOGER_PIEZAS_SUSTITUIDAS,ID_FIRMA,FECH' +
        'A_HORA_CIERRE)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ID_REP_RECEPCION,?ID_FICHA_TECNICA,?MATRICULA,?TI' +
        'TULO_VEHICULO,?KILOMETRAJE,?COMBUSTIBLE,?ID_CLIENTE,?CLIENTE,?NO' +
        'MBRE_R_SOCIAL,?ID_REPARACION,'#13#10'?ID_EMPLEADO,?EMPLEADO,?NOMBRE_EM' +
        'PLEADO,?FECHA,?TESTIGO_AVERIA,?ESTADO_PLACAS_MATRICULA,?ESTADO_C' +
        'RISTALES,?ESTADO_ESCOBILLAS,?ANTENA,?PILOTOS_Y_FAROS,'#13#10'?APERTURA' +
        '_PUERTAS_DELANTERAS,?APERTURA_PUERTAS_TRASERAS,?ELEVALUNAS_DELAT' +
        'EROS,?ELEVALUNAS_TRASEROS,?RETROVISORES,?COMENTARIO_ESTADO,?TRAB' +
        'AJOS_A_REALIZAR,?ID_GALERIA_RECEPCION,?COMENTARIOS_CLIENTE,?AUTO' +
        'RIZA_PRESUPUESTO,'#13#10'?AUTORIZA_PRUEBAS,?PIEZAS_DEL_CLIENTE,?RECOGE' +
        'R_PIEZAS_SUSTITUIDAS,?ID_FIRMA,?FECHA_HORA_CIERRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_REP_RECEPCION'
      'WHERE'
      '  ID_REP_RECEPCION=?ID_REP_RECEPCION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_REP_RECEPCION'
      'WHERE'
      'EMPRESA = :EMPRESA '
      'ORDER BY ID_REP_RECEPCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_REP_RECEPCION'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      '  ,MATRICULA=?MATRICULA '
      '  ,TITULO_VEHICULO=?TITULO_VEHICULO '
      '  ,KILOMETRAJE=?KILOMETRAJE '
      '  ,COMBUSTIBLE=?COMBUSTIBLE '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,ID_REPARACION=?ID_REPARACION '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,NOMBRE_EMPLEADO=?NOMBRE_EMPLEADO '
      '  ,FECHA=?FECHA '
      '  ,TESTIGO_AVERIA=?TESTIGO_AVERIA '
      '  ,ESTADO_PLACAS_MATRICULA=?ESTADO_PLACAS_MATRICULA '
      '  ,ESTADO_CRISTALES=?ESTADO_CRISTALES '
      '  ,ESTADO_ESCOBILLAS=?ESTADO_ESCOBILLAS '
      '  ,ANTENA=?ANTENA '
      '  ,PILOTOS_Y_FAROS=?PILOTOS_Y_FAROS '
      '  ,APERTURA_PUERTAS_DELANTERAS=?APERTURA_PUERTAS_DELANTERAS '
      '  ,APERTURA_PUERTAS_TRASERAS=?APERTURA_PUERTAS_TRASERAS '
      '  ,ELEVALUNAS_DELATEROS=?ELEVALUNAS_DELATEROS '
      '  ,ELEVALUNAS_TRASEROS=?ELEVALUNAS_TRASEROS '
      '  ,RETROVISORES=?RETROVISORES '
      '  ,COMENTARIO_ESTADO=?COMENTARIO_ESTADO '
      '  ,TRABAJOS_A_REALIZAR=?TRABAJOS_A_REALIZAR '
      '  ,ID_GALERIA_RECEPCION=?ID_GALERIA_RECEPCION '
      '  ,COMENTARIOS_CLIENTE=?COMENTARIOS_CLIENTE '
      '  ,AUTORIZA_PRESUPUESTO=?AUTORIZA_PRESUPUESTO '
      '  ,AUTORIZA_PRUEBAS=?AUTORIZA_PRUEBAS '
      '  ,PIEZAS_DEL_CLIENTE=?PIEZAS_DEL_CLIENTE '
      '  ,RECOGER_PIEZAS_SUSTITUIDAS=?RECOGER_PIEZAS_SUSTITUIDAS '
      '  ,ID_FIRMA=?ID_FIRMA '
      '  ,FECHA_HORA_CIERRE=?FECHA_HORA_CIERRE '
      'WHERE'
      '  ID_REP_RECEPCION=?ID_REP_RECEPCION ')
    AfterOpen = xRecepcionAfterOpen
    BeforeClose = xRecepcionBeforeClose
    BeforePost = xRecepcionBeforePost
    OnNewRecord = xRecepcionNewRecord
    ClavesPrimarias.Strings = (
      'ID_REP_RECEPCION ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_REP_RECEPCION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object xRecepcionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecepcionID_REP_RECEPCION: TIntegerField
      DisplayLabel = 'Id Recepcion'
      FieldName = 'ID_REP_RECEPCION'
    end
    object xRecepcionID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Ficha Tecnica'
      FieldName = 'ID_FICHA_TECNICA'
      OnChange = xRecepcionID_FICHA_TECNICAChange
    end
    object xRecepcionMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object xRecepcionTITULO_VEHICULO: TFIBStringField
      DisplayLabel = 'Tipo Vehiculo'
      FieldName = 'TITULO_VEHICULO'
      Size = 256
    end
    object xRecepcionKILOMETRAJE: TIntegerField
      DisplayLabel = 'Kilometraje'
      FieldName = 'KILOMETRAJE'
    end
    object xRecepcionCOMBUSTIBLE: TFloatField
      DisplayLabel = 'Combustible'
      FieldName = 'COMBUSTIBLE'
    end
    object xRecepcionID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object xRecepcionCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = xRecepcionCLIENTEChange
    end
    object xRecepcionNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xRecepcionID_REPARACION: TIntegerField
      DisplayLabel = 'Id Reparacion'
      FieldName = 'ID_REPARACION'
    end
    object xRecepcionID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xRecepcionEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
      OnChange = xRecepcionEMPLEADOChange
    end
    object xRecepcionNOMBRE_EMPLEADO: TFIBStringField
      DisplayLabel = 'Nombre Empleado'
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 60
    end
    object xRecepcionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xRecepcionTESTIGO_AVERIA: TIntegerField
      DisplayLabel = 'Testigo Averia'
      FieldName = 'TESTIGO_AVERIA'
    end
    object xRecepcionESTADO_PLACAS_MATRICULA: TIntegerField
      DisplayLabel = 'Estado Matriculas'
      FieldName = 'ESTADO_PLACAS_MATRICULA'
    end
    object xRecepcionESTADO_CRISTALES: TIntegerField
      DisplayLabel = 'Estado Cristales'
      FieldName = 'ESTADO_CRISTALES'
    end
    object xRecepcionESTADO_ESCOBILLAS: TIntegerField
      DisplayLabel = 'Estado Escobillas'
      FieldName = 'ESTADO_ESCOBILLAS'
    end
    object xRecepcionANTENA: TIntegerField
      DisplayLabel = 'Antena'
      FieldName = 'ANTENA'
    end
    object xRecepcionPILOTOS_Y_FAROS: TIntegerField
      DisplayLabel = 'Piltotos'
      FieldName = 'PILOTOS_Y_FAROS'
    end
    object xRecepcionAPERTURA_PUERTAS_DELANTERAS: TIntegerField
      DisplayLabel = 'Apertura Puertas Delanteras'
      FieldName = 'APERTURA_PUERTAS_DELANTERAS'
    end
    object xRecepcionAPERTURA_PUERTAS_TRASERAS: TIntegerField
      DisplayLabel = 'Apertura Puertas Traseras'
      FieldName = 'APERTURA_PUERTAS_TRASERAS'
    end
    object xRecepcionELEVALUNAS_DELATEROS: TIntegerField
      DisplayLabel = 'Elevalunas Delaterios'
      FieldName = 'ELEVALUNAS_DELATEROS'
    end
    object xRecepcionELEVALUNAS_TRASEROS: TIntegerField
      DisplayLabel = 'Elevalunas Traseros'
      FieldName = 'ELEVALUNAS_TRASEROS'
    end
    object xRecepcionRETROVISORES: TIntegerField
      DisplayLabel = 'Retrovisores'
      FieldName = 'RETROVISORES'
    end
    object xRecepcionCOMENTARIO_ESTADO: TMemoField
      DisplayLabel = 'Comentario Estado'
      FieldName = 'COMENTARIO_ESTADO'
      BlobType = ftMemo
      Size = 8
    end
    object xRecepcionTRABAJOS_A_REALIZAR: TMemoField
      DisplayLabel = 'Trabajos a Realizar'
      FieldName = 'TRABAJOS_A_REALIZAR'
      BlobType = ftMemo
      Size = 8
    end
    object xRecepcionID_GALERIA_RECEPCION: TIntegerField
      DisplayLabel = 'Id Galeria'
      FieldName = 'ID_GALERIA_RECEPCION'
    end
    object xRecepcionCOMENTARIOS_CLIENTE: TMemoField
      DisplayLabel = 'Comentarios Cliente'
      FieldName = 'COMENTARIOS_CLIENTE'
      BlobType = ftMemo
      Size = 8
    end
    object xRecepcionAUTORIZA_PRESUPUESTO: TIntegerField
      DisplayLabel = 'Autoriza Presupuesto'
      FieldName = 'AUTORIZA_PRESUPUESTO'
    end
    object xRecepcionAUTORIZA_PRUEBAS: TIntegerField
      DisplayLabel = 'Autoriza Pruebas'
      FieldName = 'AUTORIZA_PRUEBAS'
    end
    object xRecepcionPIEZAS_DEL_CLIENTE: TIntegerField
      DisplayLabel = 'Piezas del cliente'
      FieldName = 'PIEZAS_DEL_CLIENTE'
    end
    object xRecepcionRECOGER_PIEZAS_SUSTITUIDAS: TIntegerField
      DisplayLabel = 'Recoge Peizas Sustituidas'
      FieldName = 'RECOGER_PIEZAS_SUSTITUIDAS'
    end
    object xRecepcionID_FIRMA: TIntegerField
      DisplayLabel = 'Id Firma'
      FieldName = 'ID_FIRMA'
    end
    object xRecepcionFECHA_HORA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha Cierre'
      FieldName = 'FECHA_HORA_CIERRE'
      OnChange = xRecepcionFECHA_HORA_CIERREChange
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 224
    Top = 16
  end
  object DSxRecepcion: TDataSource
    DataSet = xRecepcion
    Left = 136
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
    Left = 320
    Top = 16
  end
  object xPreITV: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRE_ITV_INSPECCION'
      'WHERE'
      '  ID_INSPECCION=?old_ID_INSPECCION ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRE_ITV_INSPECCION'
      
        '  (ID_INSPECCION,'#13#10'ID_RECEPCION,EMPRESA,ID_FICHA_TECNICA,KILOMET' +
        'ROS,FECHA,OBSERVACIONES,ID_EMPLEADO,MATRICULA,MARCA,MODELO,'#13#10'TIT' +
        'ULO,EMPLEADO,TERCERO,NOMBRE_R_SOCIAL,FECHA_HORA_CIERRE)'
      'VALUES'
      
        '  (?ID_INSPECCION,'#13#10'?ID_RECEPCION,?EMPRESA,?ID_FICHA_TECNICA,?KI' +
        'LOMETROS,?FECHA,?OBSERVACIONES,?ID_EMPLEADO,?MATRICULA,?MARCA,?M' +
        'ODELO,'#13#10'?TITULO,?EMPLEADO,?TERCERO,?NOMBRE_R_SOCIAL,?FECHA_HORA_' +
        'CIERRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRE_ITV_INSPECCION'
      'WHERE'
      '  ID_INSPECCION=?ID_INSPECCION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRE_ITV_INSPECCION'
      'WHERE'
      'ID_RECEPCION = :ID_REP_RECEPCION'
      'ORDER BY ID_INSPECCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRE_ITV_INSPECCION'
      'SET'
      '  ID_RECEPCION=?ID_RECEPCION '
      '  ,EMPRESA=?EMPRESA '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      '  ,KILOMETROS=?KILOMETROS '
      '  ,FECHA=?FECHA '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,MATRICULA=?MATRICULA '
      '  ,MARCA=?MARCA '
      '  ,MODELO=?MODELO '
      '  ,TITULO=?TITULO '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,TERCERO=?TERCERO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,FECHA_HORA_CIERRE=?FECHA_HORA_CIERRE '
      'WHERE'
      '  ID_INSPECCION=?ID_INSPECCION ')
    DataSource = DSxRecepcion
    AfterOpen = xPreITVAfterOpen
    BeforeClose = xPreITVBeforeClose
    BeforePost = xPreITVBeforePost
    OnNewRecord = xPreITVNewRecord
    ClavesPrimarias.Strings = (
      'ID_INSPECCION ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRE_ITV_INSPECCION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object xPreITVID_INSPECCION: TIntegerField
      DisplayLabel = 'Id Inspeccion'
      FieldName = 'ID_INSPECCION'
    end
    object xPreITVID_RECEPCION: TIntegerField
      DisplayLabel = 'Id Recepcion'
      FieldName = 'ID_RECEPCION'
    end
    object xPreITVEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPreITVID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Fic. Tecnica'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object xPreITVKILOMETROS: TFloatField
      DisplayLabel = 'Kilometros'
      FieldName = 'KILOMETROS'
    end
    object xPreITVFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPreITVOBSERVACIONES: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object xPreITVID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empl.'
      FieldName = 'ID_EMPLEADO'
    end
    object xPreITVMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object xPreITVMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 5
    end
    object xPreITVMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 60
    end
    object xPreITVTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xPreITVEMPLEADO: TIntegerField
      DisplayLabel = 'empleado'
      FieldName = 'EMPLEADO'
      OnChange = xPreITVEMPLEADOChange
    end
    object xPreITVTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xPreITVNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xPreITVFECHA_HORA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha Cierre'
      FieldName = 'FECHA_HORA_CIERRE'
      OnChange = xPreITVFECHA_HORA_CIERREChange
    end
  end
  object DSxPreITV: TDataSource
    DataSet = xPreITV
    Left = 136
    Top = 64
  end
  object xPreITVVerificacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRE_ITV_INSPEC_VERIF'
      'WHERE'
      '  ID_INSPECCION=?old_ID_INSPECCION AND '
      '  ID_VERIFICACION=?old_ID_VERIFICACION ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRE_ITV_INSPEC_VERIF'
      
        '  (ID_INSPECCION,'#13#10'ID_VERIFICACION,ORDEN,TITULO,RESULTADO,REPARA' +
        'DO,OBSERVACIONES)'
      'VALUES'
      
        '  (?ID_INSPECCION,'#13#10'?ID_VERIFICACION,?ORDEN,?TITULO,?RESULTADO,?' +
        'REPARADO,?OBSERVACIONES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRE_ITV_INSPEC_VERIF'
      'WHERE'
      '  ID_INSPECCION=?ID_INSPECCION AND '
      '  ID_VERIFICACION=?ID_VERIFICACION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRE_ITV_INSPEC_VERIF'
      'WHERE'
      'ID_INSPECCION = :ID_INSPECCION'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRE_ITV_INSPEC_VERIF'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,TITULO=?TITULO '
      '  ,RESULTADO=?RESULTADO '
      '  ,REPARADO=?REPARADO '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      'WHERE'
      '  ID_INSPECCION=?ID_INSPECCION AND '
      '  ID_VERIFICACION=?ID_VERIFICACION ')
    DataSource = DSxPreITV
    BeforePost = xRecepcionBeforePost
    OnNewRecord = xRecepcionNewRecord
    ClavesPrimarias.Strings = (
      'ID_INSPECCION '
      'ID_VERIFICACION ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRE_ITV_INSPEC_VERIF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object xPreITVVerificacionID_INSPECCION: TIntegerField
      DisplayLabel = 'Id Inspeccion'
      FieldName = 'ID_INSPECCION'
    end
    object xPreITVVerificacionID_VERIFICACION: TIntegerField
      DisplayLabel = 'Id Verificacion'
      FieldName = 'ID_VERIFICACION'
    end
    object xPreITVVerificacionORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xPreITVVerificacionTITULO: TFIBStringField
      DisplayLabel = 'titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPreITVVerificacionRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 1
    end
    object xPreITVVerificacionREPARADO: TIntegerField
      DisplayLabel = 'Reparado'
      FieldName = 'REPARADO'
    end
    object xPreITVVerificacionOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 60
    end
  end
  object DSPreITVVerificacion: TDataSource
    DataSet = xPreITVVerificacion
    Left = 136
    Top = 112
  end
end
