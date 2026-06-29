object CrmDMAsistenteImpContactos: TCrmDMAsistenteImpContactos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 306
  Top = 152
  Height = 590
  Width = 779
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 40
    Top = 16
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 144
    Top = 16
  end
  object QLlenarTemporal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'insert into crm_tmp_importar_contactos (entrada,linea,empresa,no' +
        'mbre_contacto,codigo_postal,direccion,'
      
        'observaciones,telefono1,telefono2,email,web,persona_contacto,fax' +
        ',nif,cli_prov_imp,forma_pago_imp,origen_imp,agente, zona,nombre_' +
        'r_social,nombre_corto,notas)'
      
        'values (?entrada,?linea,?empresa,?nombre_contacto,?codigo_postal' +
        ',?direccion,'
      
        '?observaciones,?telefono1,?telefono2,?email,?web,?persona_contac' +
        'to,?fax,?nif,?cli_prov_imp,?forma_pago_imp,'
      
        '?origen_imp,?agente,?zona, ?nombre_r_social, ?nombre_corto, ?not' +
        'as)')
    Transaction = TLocal
    AutoTrans = True
    Left = 272
    Top = 24
  end
  object QBorrarTemporal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from crm_tmp_importar_contactos '
      'where entrada=?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 384
    Top = 24
  end
  object QSeleccionarTodas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update crm_tmp_importar_contactos'
      'set importar=?modo'
      'where entrada=?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 272
    Top = 72
  end
  object QMContactosImp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_TMP_IMPORTAR_CONTACTOS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_TMP_IMPORTAR_CONTACTOS'
      
        '  (ENTRADA,LINEA,EMPRESA,NOMBRE_CONTACTO,CODIGO_POSTAL,DIRECCION' +
        ',PERSONA_CONTACTO,OBSERVACIONES,TELEFONO1,TELEFONO2,EMAIL,WEB,IM' +
        'PORTAR,FAX,NIF,CLI_PROV_IMP,FORMA_PAGO_IMP,ORIGEN_IMP,NOMBRE_R_S' +
        'OCIAL,NOMBRE_CORTO,NOTAS)'
      'VALUES'
      
        '  (?ENTRADA,?LINEA,?EMPRESA,?NOMBRE_CONTACTO,?CODIGO_POSTAL,?DIR' +
        'ECCION,?PERSONA_CONTACTO,?OBSERVACIONES,?TELEFONO1,?TELEFONO2,?E' +
        'MAIL,?WEB,?IMPORTAR,?FAX,?NIF,?CLI_PROV_IMP,?FORMA_PAGO_IMP,?ORI' +
        'GEN_IMP,?NOMBRE_R_SOCIAL,?NOMBRE_CORTO,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_TMP_IMPORTAR_CONTACTOS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_TMP_IMPORTAR_CONTACTOS'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_TMP_IMPORTAR_CONTACTOS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,NOMBRE_CONTACTO=?NOMBRE_CONTACTO '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,DIRECCION=?DIRECCION '
      '  ,PERSONA_CONTACTO=?PERSONA_CONTACTO '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,TELEFONO1=?TELEFONO1 '
      '  ,TELEFONO2=?TELEFONO2 '
      '  ,EMAIL=?EMAIL '
      '  ,WEB=?WEB '
      '  ,IMPORTAR=?IMPORTAR'
      '  ,FAX=?FAX'
      '  ,NIF=?NIF'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    AfterPost = QMContactosImpAfterPost
    OnNewRecord = QMContactosImpNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_TMP_IMPORTAR_CONTACTOS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 64
    object QMContactosImpENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMContactosImpLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMContactosImpEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContactosImpNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 60
    end
    object QMContactosImpCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 8
    end
    object QMContactosImpDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 60
    end
    object QMContactosImpPERSONA_CONTACTO: TFIBStringField
      DisplayLabel = 'Pers. Contacto'
      FieldName = 'PERSONA_CONTACTO'
      Size = 40
    end
    object QMContactosImpOBSERVACIONES: TMemoField
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QMContactosImpTELEFONO1: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO1'
    end
    object QMContactosImpTELEFONO2: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO2'
    end
    object QMContactosImpEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMContactosImpWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object QMContactosImpIMPORTAR: TIntegerField
      DisplayLabel = 'Importar'
      FieldName = 'IMPORTAR'
    end
    object QMContactosImpFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object QMContactosImpNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMContactosImpFORMA_PAGO_IMP: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO_IMP'
      Size = 3
    end
    object QMContactosImpCLI_PROV_IMP: TFIBStringField
      DisplayLabel = 'Cli./Prov.'
      FieldName = 'CLI_PROV_IMP'
      Size = 40
    end
    object QMContactosImpORIGEN_IMP: TFIBStringField
      DisplayLabel = 'Origen Imp.'
      FieldName = 'ORIGEN_IMP'
      Size = 3
    end
    object QMContactosImpAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMContactosImpZONA: TFIBStringField
      DisplayLabel = 'Zona'
      DisplayWidth = 15
      FieldName = 'ZONA'
      Size = 15
    end
    object QMContactosImpNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMContactosImpNOMBRE_CORTO: TFIBStringField
      DisplayLabel = 'Nombre Corto'
      FieldName = 'NOMBRE_CORTO'
      Size = 60
    end
    object QMContactosImpNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSQMContactosImp: TDataSource
    DataSet = QMContactosImp
    Left = 144
    Top = 64
  end
  object QInsertarContacto: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO CRM_VER_CONTACTOS'
      
        '  (IPAD_VISIBLE,TELEFONO01,TELEFONO02,TELEFAX,DIR_NOMBRE,DIR_LOC' +
        'ALIDAD,ID_LOCAL,EMAIL,WEB,COMENTARIO,ID_CONTACTO,NUM_CONTACTO,TE' +
        'RCERO,NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL,NOMBRE_CORTO,FECHA_ALTA,T' +
        'IPO_RAZON,NIF,CLIENTE,ORIGEN_CONTACTO,LINK_GOOGLE,AMBITO,ACTIVIT' +
        'AT_ECONOMICA,CLI_PROV_IMP,FORMA_DE_PAGO_IMP,AGENTE,EMPRESA,PAIS,' +
        'ZONA,NOMBRE_R_SOCIAL,NOMBRE_CORTO,NOTAS)'
      'VALUES'
      
        '  (?IPAD_VISIBLE,?TELEFONO01,?TELEFONO02,?TELEFAX,?DIR_NOMBRE,?D' +
        'IR_LOCALIDAD,?ID_LOCAL,?EMAIL,?WEB,?OBSERVACIONES,?ID_CONTACTO,?' +
        'NUM_CONTACTO,?TERCERO,?NOMBRE_R_SOCIAL,?NOMBRE_COMERCIAL,?NOMBRE' +
        '_CORTO,?FECHA_ALTA,?TIPO_RAZON,?NIF,?CLIENTE,?ORIGEN_CONTACTO,?L' +
        'INK_GOOGLE,?AMBITO,?ACTIVITAT_ECONOMICA,?CLI_PROV_IMP,?FORMA_DE_' +
        'PAGO_IMP,?AGENTE,?EMPRESA,?PAIS,?ZONA,?NOMBRE_R_SOCIAL,?NOMBRE_C' +
        'ORTO,?NOTAS)'
      ' ')
    Transaction = TLocal
    AutoTrans = True
    Left = 272
    Top = 120
  end
  object QInsertarPContacto: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into crm_contactos_personas (id_contacto,nombre)'
      'values (?id_contacto,?nombre)')
    Transaction = TLocal
    AutoTrans = True
    Left = 384
    Top = 120
  end
  object xTiposOrigenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from crm_sys_origen_contacto'
      'order by torigen')
    UniDirectional = False
    Left = 40
    Top = 112
    object xTiposOrigenesTORIGEN: TFIBStringField
      DisplayLabel = 'T. Origen'
      FieldName = 'TORIGEN'
      Size = 3
    end
    object xTiposOrigenesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxTiposOrigenes: TDataSource
    DataSet = xTiposOrigenes
    Left = 144
    Top = 112
  end
end
