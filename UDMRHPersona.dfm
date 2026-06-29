object DMRHPersona: TDMRHPersona
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 396
  Top = 201
  Height = 454
  Width = 690
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 368
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 296
    Top = 16
  end
  object DSQMRHPersona: TDataSource
    DataSet = QMRHPersona
    Left = 160
    Top = 16
  end
  object QMRHPersona: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_RH_PERSONA'
      'WHERE'
      '  ID_PERSONA=?old_ID_PERSONA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_RH_PERSONA'
      
        '  (EMPRESA,ID_PERSONA,NOMBRE,APELLIDOS,GENERO,POBLACION,PROVINCI' +
        'A,TELEFONO01,TELEFONO02,EMAIL,TIPO_DOCUMENTO,NUMERO_DOCUMENTO,N_' +
        'SEGURIDAD_SOCIAL,FECHA_NACIMIENTO,ESTADO_CIVIL,NOTAS,FORMACION_I' +
        'NI,EXPERIENCIA_PROF,BAJA,MINUSVALIA,APTO,PUESTO_TRABAJO,FECHA_EN' +
        'TREVISTA,ENTREVISTADOR,COMENTARIO,VALORACION_1,VALORACION_2,VALO' +
        'RACION_3,ACEPTADO,FECHA_ACEPTADO)'
      'VALUES'
      
        '  (?EMPRESA,?ID_PERSONA,?NOMBRE,?APELLIDOS,?GENERO,?POBLACION,?P' +
        'ROVINCIA,?TELEFONO01,?TELEFONO02,?EMAIL,?TIPO_DOCUMENTO,?NUMERO_' +
        'DOCUMENTO,?N_SEGURIDAD_SOCIAL,?FECHA_NACIMIENTO,?ESTADO_CIVIL,?N' +
        'OTAS,?FORMACION_INI,?EXPERIENCIA_PROF,?BAJA,?MINUSVALIA,?APTO,?P' +
        'UESTO_TRABAJO,?FECHA_ENTREVISTA,?ENTREVISTADOR,?COMENTARIO,?VALO' +
        'RACION_1,?VALORACION_2,?VALORACION_3,?ACEPTADO,?FECHA_ACEPTADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_RH_PERSONA'
      'WHERE'
      '  ID_PERSONA=?ID_PERSONA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_RH_PERSONA'
      'ORDER BY ID_PERSONA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_RH_PERSONA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,NOMBRE=?NOMBRE '
      '  ,APELLIDOS=?APELLIDOS '
      '  ,GENERO=?GENERO '
      '  ,POBLACION=?POBLACION '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,EMAIL=?EMAIL '
      '  ,TIPO_DOCUMENTO=?TIPO_DOCUMENTO '
      '  ,NUMERO_DOCUMENTO=?NUMERO_DOCUMENTO '
      '  ,N_SEGURIDAD_SOCIAL=?N_SEGURIDAD_SOCIAL '
      '  ,FECHA_NACIMIENTO=?FECHA_NACIMIENTO '
      '  ,ESTADO_CIVIL=?ESTADO_CIVIL '
      '  ,NOTAS=?NOTAS '
      '  ,FORMACION_INI=?FORMACION_INI '
      '  ,EXPERIENCIA_PROF=?EXPERIENCIA_PROF '
      '  ,BAJA=?BAJA '
      '  ,MINUSVALIA=?MINUSVALIA '
      '  ,APTO=?APTO '
      '  ,PUESTO_TRABAJO=?PUESTO_TRABAJO '
      '  ,FECHA_ENTREVISTA=?FECHA_ENTREVISTA '
      '  ,ENTREVISTADOR=?ENTREVISTADOR '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,VALORACION_1=?VALORACION_1 '
      '  ,VALORACION_2=?VALORACION_2 '
      '  ,VALORACION_3=?VALORACION_3 '
      '  ,ACEPTADO=?ACEPTADO '
      '  ,FECHA_ACEPTADO=?FECHA_ACEPTADO '
      'WHERE'
      '  ID_PERSONA=?ID_PERSONA ')
    BeforePost = QMRHPersonaBeforePost
    OnNewRecord = QMRHPersonaNewRecord
    ClavesPrimarias.Strings = (
      'ID_PERSONA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_RH_PERSONA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMRHPersonaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRHPersonaID_PERSONA: TIntegerField
      DisplayLabel = 'Id Persona'
      FieldName = 'ID_PERSONA'
    end
    object QMRHPersonaNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMRHPersonaAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 60
    end
    object QMRHPersonaGENERO: TFIBStringField
      DisplayLabel = 'G'#233'nero'
      FieldName = 'GENERO'
      Size = 1
    end
    object QMRHPersonaPOBLACION: TFIBStringField
      DisplayLabel = 'Poblaci'#243'n'
      FieldName = 'POBLACION'
      Size = 15
    end
    object QMRHPersonaPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 15
    end
    object QMRHPersonaTELEFONO01: TFIBStringField
      DisplayLabel = 'Telefono 1'
      FieldName = 'TELEFONO01'
    end
    object QMRHPersonaTELEFONO02: TFIBStringField
      DisplayLabel = 'Telefono 2'
      FieldName = 'TELEFONO02'
    end
    object QMRHPersonaEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMRHPersonaTIPO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOCUMENTO'
      Size = 15
    end
    object QMRHPersonaNUMERO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'N'#250'mero de documento'
      FieldName = 'NUMERO_DOCUMENTO'
      Size = 15
    end
    object QMRHPersonaN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'N'#250'mero seguridad social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object QMRHPersonaFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
    end
    object QMRHPersonaESTADO_CIVIL: TFIBStringField
      DisplayLabel = 'Entado civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 15
    end
    object QMRHPersonaNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMRHPersonaFORMACION_INI: TMemoField
      DisplayLabel = 'Formaci'#243'n  Inicial'
      FieldName = 'FORMACION_INI'
      BlobType = ftMemo
      Size = 8
    end
    object QMRHPersonaEXPERIENCIA_PROF: TMemoField
      DisplayLabel = 'Referencia'
      FieldName = 'EXPERIENCIA_PROF'
      BlobType = ftMemo
      Size = 8
    end
    object QMRHPersonaBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMRHPersonaMINUSVALIA: TIntegerField
      DisplayLabel = 'Minusval'#237'a'
      FieldName = 'MINUSVALIA'
    end
    object QMRHPersonaAPTO: TIntegerField
      DisplayLabel = 'Apto'
      FieldName = 'APTO'
    end
    object QMRHPersonaPUESTO_TRABAJO: TFIBStringField
      DisplayLabel = 'Puesto de Trabajo'
      FieldName = 'PUESTO_TRABAJO'
      Size = 15
    end
    object QMRHPersonaFECHA_ENTREVISTA: TDateTimeField
      DisplayLabel = 'Fehca de Entrevista'
      FieldName = 'FECHA_ENTREVISTA'
    end
    object QMRHPersonaENTREVISTADOR: TFIBStringField
      DisplayLabel = 'Entrevistador'
      FieldName = 'ENTREVISTADOR'
      Size = 15
    end
    object QMRHPersonaCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMRHPersonaVALORACION_1: TFIBStringField
      DisplayLabel = 'Valoraci'#243'n 1'
      FieldName = 'VALORACION_1'
      Size = 15
    end
    object QMRHPersonaVALORACION_2: TFIBStringField
      DisplayLabel = 'Valoraci'#243'n 2'
      FieldName = 'VALORACION_2'
      Size = 15
    end
    object QMRHPersonaVALORACION_3: TFIBStringField
      DisplayLabel = 'Valoraci'#243'n 3'
      FieldName = 'VALORACION_3'
      Size = 15
    end
    object QMRHPersonaACEPTADO: TIntegerField
      DisplayLabel = 'Aceptado'
      FieldName = 'ACEPTADO'
    end
    object QMRHPersonaFECHA_ACEPTADO: TDateTimeField
      DisplayLabel = 'Fecha Aceptado'
      FieldName = 'FECHA_ACEPTADO'
    end
  end
end
