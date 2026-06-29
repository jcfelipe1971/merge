object DMTerceros2: TDMTerceros2
  OldCreateOrder = False
  OnCreate = DMTercerosCreate
  OnDestroy = DMTercerosDestroy
  Left = 432
  Top = 213
  Height = 425
  Width = 568
  object DSQMTerceros: TDataSource
    DataSet = QMTerceros
    Left = 112
    Top = 16
  end
  object DSxLoc_T: TDataSource
    DataSet = xLoc_T
    Left = 336
    Top = 64
  end
  object DSQMContactos: TDataSource
    DataSet = QMContactos
    Left = 112
    Top = 64
  end
  object QMContactos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TERCEROS_CONTACTOS'
      'WHERE'
      '  TERCERO=?old_TERCERO AND '
      '  CONTACTO=?old_CONTACTO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TERCEROS_CONTACTOS'
      
        '  (NOTAS,ULT_MODIFICACION,TERCERO,AGENTE,ID_FORCEMANAGER,ENTRADA' +
        ',CONTACTO,NOMBRE,APELLIDOS,MOVIL,TELEFONO,FAX,CORREO,DIRECCION,P' +
        'ADRE,EMAIL_OFC,EMAIL_PEC,EMAIL_ALB,EMAIL_FAC,EMAIL_OFP,EMAIL_OCP' +
        ',EMAIL_PEP,EMAIL_ALP,EMAIL_FAP,EMAIL_FCR,EXTENSION,ZONA,DEPARTAM' +
        'ENTO,ID_USUARIO_WEB)'
      'VALUES'
      
        '  (?NOTAS,?ULT_MODIFICACION,?TERCERO,?AGENTE,?ID_FORCEMANAGER,?E' +
        'NTRADA,?CONTACTO,?NOMBRE,?APELLIDOS,?MOVIL,?TELEFONO,?FAX,?CORRE' +
        'O,?DIRECCION,?PADRE,?EMAIL_OFC,?EMAIL_PEC,?EMAIL_ALB,?EMAIL_FAC,' +
        '?EMAIL_OFP,?EMAIL_OCP,?EMAIL_PEP,?EMAIL_ALP,?EMAIL_FAP,?EMAIL_FC' +
        'R,?EXTENSION,?ZONA,?DEPARTAMENTO,?ID_USUARIO_WEB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS_CONTACTOS'
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  CONTACTO=?CONTACTO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_CONTACTOS'
      'WHERE'
      'TERCERO = ?TERCERO'
      'ORDER BY CONTACTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TERCEROS_CONTACTOS'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,AGENTE=?AGENTE '
      '  ,ID_FORCEMANAGER=?ID_FORCEMANAGER '
      '  ,ENTRADA=?ENTRADA '
      '  ,NOMBRE=?NOMBRE '
      '  ,APELLIDOS=?APELLIDOS '
      '  ,MOVIL=?MOVIL '
      '  ,TELEFONO=?TELEFONO '
      '  ,FAX=?FAX '
      '  ,CORREO=?CORREO '
      '  ,DIRECCION=?DIRECCION '
      '  ,PADRE=?PADRE '
      '  ,EMAIL_OFC=?EMAIL_OFC '
      '  ,EMAIL_PEC=?EMAIL_PEC '
      '  ,EMAIL_ALB=?EMAIL_ALB '
      '  ,EMAIL_FAC=?EMAIL_FAC '
      '  ,EMAIL_OFP=?EMAIL_OFP '
      '  ,EMAIL_OCP=?EMAIL_OCP '
      '  ,EMAIL_PEP=?EMAIL_PEP '
      '  ,EMAIL_ALP=?EMAIL_ALP '
      '  ,EMAIL_FAP=?EMAIL_FAP '
      '  ,EMAIL_FCR=?EMAIL_FCR '
      '  ,EXTENSION=?EXTENSION '
      '  ,ZONA=?ZONA '
      '  ,DEPARTAMENTO=?DEPARTAMENTO '
      '  ,ID_USUARIO_WEB=?ID_USUARIO_WEB '
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  CONTACTO=?CONTACTO ')
    DataSource = DSQMTerceros
    AfterOpen = QMContactosAfterOpen
    AfterScroll = QMContactosAfterScroll
    BeforePost = QMContactosBeforePost
    OnNewRecord = QMContactosNewRecord
    ClavesPrimarias.Strings = (
      'TERCERO '
      'CONTACTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TERCEROS_CONTACTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMContactosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMContactosCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object QMContactosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object QMContactosAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 40
    end
    object QMContactosMOVIL: TFIBStringField
      DisplayLabel = 'M'#243'vil'
      FieldName = 'MOVIL'
    end
    object QMContactosTELEFONO: TFIBStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO'
    end
    object QMContactosFAX: TFIBStringField
      DisplayLabel = 'F.A.X.'
      FieldName = 'FAX'
    end
    object QMContactosEXTENSION: TFIBStringField
      DisplayLabel = 'Ext.'
      FieldName = 'EXTENSION'
      Size = 5
    end
    object QMContactosCORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'CORREO'
      Size = 100
    end
    object QMContactosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMContactosAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMContactosZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 3
    end
    object QMContactosDIRECCION: TIntegerField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECCION'
    end
    object QMContactosPADRE: TIntegerField
      DisplayLabel = 'Padre'
      FieldName = 'PADRE'
    end
    object QMContactosDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 5
    end
    object QMContactosULT_MODIFICACION: TDateTimeField
      FieldName = 'ULT_MODIFICACION'
    end
    object QMContactosID_FORCEMANAGER: TIntegerField
      DisplayLabel = 'Id ForceManager'
      FieldName = 'ID_FORCEMANAGER'
    end
    object QMContactosEMAIL_OFC: TIntegerField
      DisplayLabel = 'EMail Ofe Cli'
      FieldName = 'EMAIL_OFC'
    end
    object QMContactosEMAIL_PEC: TIntegerField
      DisplayLabel = 'EMail Ped Cli'
      FieldName = 'EMAIL_PEC'
    end
    object QMContactosEMAIL_ALB: TIntegerField
      DisplayLabel = 'EMail Alb Cli'
      FieldName = 'EMAIL_ALB'
    end
    object QMContactosEMAIL_FAC: TIntegerField
      DisplayLabel = 'EMail Fac Cli'
      FieldName = 'EMAIL_FAC'
    end
    object QMContactosEMAIL_FCR: TIntegerField
      DisplayLabel = 'EMail Fac Acr'
      FieldName = 'EMAIL_FCR'
    end
    object QMContactosEMAIL_PEP: TIntegerField
      DisplayLabel = 'EMail Ped Prov'
      FieldName = 'EMAIL_PEP'
    end
    object QMContactosEMAIL_ALP: TIntegerField
      DisplayLabel = 'EMail Alb Prov'
      FieldName = 'EMAIL_ALP'
    end
    object QMContactosEMAIL_FAP: TIntegerField
      DisplayLabel = 'EMail Fac Prov'
      FieldName = 'EMAIL_FAP'
    end
    object QMContactosEMAIL_OCP: TIntegerField
      DisplayLabel = 'EMail Prop Conf'
      FieldName = 'EMAIL_OCP'
    end
    object QMContactosEMAIL_OFP: TIntegerField
      DisplayLabel = 'EMail Prop Prov'
      FieldName = 'EMAIL_OFP'
    end
    object QMContactosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMContactosID_USUARIO_WEB: TIntegerField
      DisplayLabel = 'Id Usuario Web'
      FieldName = 'ID_USUARIO_WEB'
    end
  end
  object QMTerceros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TERCEROS_EDICION'
      'WHERE'
      '  TERCERO=?old_TERCERO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TERCEROS_EDICION'
      
        '  (TERCERO,'#13#10'NOMBRE_COMERCIAL,NOMBRE_R_SOCIAL,TIPO_RAZON,NIF,DIR' +
        '_CLASE,DIR_TIPO,DIR_NOMBRE,DIR_NOMBRE_2,DIR_NOMBRE_3,DIR_NUMERO,' +
        #13#10'DIR_BLOQUE_ESCALERA,DIR_PISO,DIR_PUERTA,DIR_LOCALIDAD,COLONIA,' +
        'DIR_DEFECTO,FECHA_ALTA,NOTAS,TELEFONO01,TELEFONO02,'#13#10'TELEFAX,EMA' +
        'IL,WEB,IMAGEN,CLIENTE_POTENCIAL,CODIGO_EDI,REGISTRO_MERCANTIL,TI' +
        'T_LOCALIDAD,CODIGO_POSTAL,ID_LOCAL,'#13#10'FECHA_NACIMIENTO,CARNET_APL' +
        'ICADOR,FECHA_VALIDEZ_CARNET_APLICADOR,LATITUD,LONGITUD,PAIS_TERC' +
        'ERO,TIPO_DOC_IDENT,PAIS_DIRECCION,PROVINCIA_DIRECCION,REGION_DIR' +
        'ECCION,'#13#10'POBLACION_DIRECCION,DIRECCION,DIR_TRANSPORTISTA,DIRECCI' +
        'ON_LITERAL,DIRECCION_CODIGO_POSTAL,TITULO_REGION,TITULO_PROVINCI' +
        'A,TITULO_POBLACION,TITULO_CODIGO_POSTAL,TITULO_PROVINCIA_LOC,'#13#10'C' +
        'OMO_NOS_CONOCIERON)'
      'VALUES'
      
        '  (?TERCERO,'#13#10'?NOMBRE_COMERCIAL,?NOMBRE_R_SOCIAL,?TIPO_RAZON,?NI' +
        'F,?DIR_CLASE,?DIR_TIPO,?DIR_NOMBRE,?DIR_NOMBRE_2,?DIR_NOMBRE_3,?' +
        'DIR_NUMERO,'#13#10'?DIR_BLOQUE_ESCALERA,?DIR_PISO,?DIR_PUERTA,?DIR_LOC' +
        'ALIDAD,?COLONIA,?DIR_DEFECTO,?FECHA_ALTA,?NOTAS,?TELEFONO01,?TEL' +
        'EFONO02,'#13#10'?TELEFAX,?EMAIL,?WEB,?IMAGEN,?CLIENTE_POTENCIAL,?CODIG' +
        'O_EDI,?REGISTRO_MERCANTIL,?TIT_LOCALIDAD,?CODIGO_POSTAL,?ID_LOCA' +
        'L,'#13#10'?FECHA_NACIMIENTO,?CARNET_APLICADOR,?FECHA_VALIDEZ_CARNET_AP' +
        'LICADOR,?LATITUD,?LONGITUD,?PAIS_TERCERO,?TIPO_DOC_IDENT,?PAIS_D' +
        'IRECCION,?PROVINCIA_DIRECCION,?REGION_DIRECCION,'#13#10'?POBLACION_DIR' +
        'ECCION,?DIRECCION,?DIR_TRANSPORTISTA,?DIRECCION_LITERAL,?DIRECCI' +
        'ON_CODIGO_POSTAL,?TITULO_REGION,?TITULO_PROVINCIA,?TITULO_POBLAC' +
        'ION,?TITULO_CODIGO_POSTAL,?TITULO_PROVINCIA_LOC,'#13#10'?COMO_NOS_CONO' +
        'CIERON)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      '  TERCERO=?TERCERO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'ORDER BY TERCERO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE VER_TERCEROS_EDICION'
      'SET'
      '  NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,TIPO_RAZON=?TIPO_RAZON '
      '  ,NIF=?NIF '
      '  ,DIR_CLASE=?DIR_CLASE '
      '  ,DIR_TIPO=?DIR_TIPO '
      '  ,DIR_NOMBRE=?DIR_NOMBRE '
      '  ,DIR_NOMBRE_2=?DIR_NOMBRE_2 '
      '  ,DIR_NOMBRE_3=?DIR_NOMBRE_3 '
      '  ,DIR_NUMERO=?DIR_NUMERO '
      '  ,DIR_BLOQUE_ESCALERA=?DIR_BLOQUE_ESCALERA '
      '  ,DIR_PISO=?DIR_PISO '
      '  ,DIR_PUERTA=?DIR_PUERTA '
      '  ,DIR_LOCALIDAD=?DIR_LOCALIDAD '
      '  ,COLONIA=?COLONIA '
      '  ,DIR_DEFECTO=?DIR_DEFECTO '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,NOTAS=?NOTAS '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFAX=?TELEFAX '
      '  ,EMAIL=?EMAIL '
      '  ,WEB=?WEB '
      '  ,IMAGEN=?IMAGEN '
      '  ,CLIENTE_POTENCIAL=?CLIENTE_POTENCIAL '
      '  ,CODIGO_EDI=?CODIGO_EDI '
      '  ,REGISTRO_MERCANTIL=?REGISTRO_MERCANTIL '
      '  ,TIT_LOCALIDAD=?TIT_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,ID_LOCAL=?ID_LOCAL '
      '  ,FECHA_NACIMIENTO=?FECHA_NACIMIENTO '
      '  ,CARNET_APLICADOR=?CARNET_APLICADOR '
      
        '  ,FECHA_VALIDEZ_CARNET_APLICADOR=?FECHA_VALIDEZ_CARNET_APLICADO' +
        'R '
      '  ,LATITUD=?LATITUD '
      '  ,LONGITUD=?LONGITUD '
      '  ,PAIS_TERCERO=?PAIS_TERCERO '
      '  ,TIPO_DOC_IDENT=?TIPO_DOC_IDENT '
      '  ,PAIS_DIRECCION=?PAIS_DIRECCION '
      '  ,PROVINCIA_DIRECCION=?PROVINCIA_DIRECCION '
      '  ,REGION_DIRECCION=?REGION_DIRECCION '
      '  ,POBLACION_DIRECCION=?POBLACION_DIRECCION '
      '  ,DIRECCION=?DIRECCION '
      '  ,DIR_TRANSPORTISTA=?DIR_TRANSPORTISTA '
      '  ,DIRECCION_LITERAL=?DIRECCION_LITERAL '
      '  ,DIRECCION_CODIGO_POSTAL=?DIRECCION_CODIGO_POSTAL '
      '  ,TITULO_REGION=?TITULO_REGION '
      '  ,TITULO_PROVINCIA=?TITULO_PROVINCIA '
      '  ,TITULO_POBLACION=?TITULO_POBLACION '
      '  ,TITULO_CODIGO_POSTAL=?TITULO_CODIGO_POSTAL '
      '  ,TITULO_PROVINCIA_LOC=?TITULO_PROVINCIA_LOC '
      '  ,COMO_NOS_CONOCIERON=?COMO_NOS_CONOCIERON '
      'WHERE'
      '  TERCERO=?TERCERO ')
    AfterOpen = QMTercerosAfterOpen
    AfterPost = Graba
    AfterScroll = QMTercerosAfterScroll
    BeforeClose = QMTercerosBeforeClose
    BeforeEdit = QMTercerosBeforeEdit
    BeforePost = QMTercerosBeforePost
    OnNewRecord = QMTercerosNewRecord
    ClavesPrimarias.Strings = (
      'TERCERO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TERCEROS_EDICION'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'SYS_TERCEROS')
    CamposBloqueo.Strings = (
      'TERCERO')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMTercerosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMTercerosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      OnChange = QMTercerosNOMBRE_COMERCIALChange
      Size = 60
    end
    object QMTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMTercerosTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Raz'#243'n'
      FieldName = 'TIPO_RAZON'
      OnChange = QMTercerosTIPO_RAZONChange
      Size = 4
    end
    object QMTercerosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMTercerosDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Dir.'
      FieldName = 'DIR_TIPO'
      OnChange = QMTercerosDIR_TIPOChange
      Size = 3
    end
    object QMTercerosDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object QMTercerosDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direcci'#243'n 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMTercerosDIR_NUMERO: TFIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object QMTercerosDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object QMTercerosDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object QMTercerosDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object QMTercerosDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      OnChange = QMTercerosDIR_LOCALIDADChange
      Size = 8
    end
    object QMTercerosFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMTercerosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMTercerosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel'#233'fono 1'
      FieldName = 'TELEFONO01'
    end
    object QMTercerosTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel'#233'fono 2'
      FieldName = 'TELEFONO02'
    end
    object QMTercerosTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object QMTercerosEMAIL: TFIBStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMTercerosWEB: TFIBStringField
      DisplayLabel = 'web'
      FieldName = 'WEB'
      Size = 60
    end
    object QMTercerosIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMTercerosCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cli. Pot.'
      FieldName = 'CLIENTE_POTENCIAL'
    end
    object QMTercerosCODIGO_EDI: TFIBStringField
      DisplayLabel = 'Cod. EDI'
      FieldName = 'CODIGO_EDI'
      Size = 25
    end
    object QMTercerosDIR_DEFECTO: TIntegerField
      DisplayLabel = 'Dir. Defecto'
      FieldName = 'DIR_DEFECTO'
    end
    object QMTercerosDIR_CLASE: TIntegerField
      DisplayLabel = 'Clase Dir.'
      FieldName = 'DIR_CLASE'
    end
    object QMTercerosTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object QMTercerosCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMTercerosID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
    object QMTercerosCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMTercerosFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
    end
    object QMTercerosREGISTRO_MERCANTIL: TFIBStringField
      DisplayLabel = 'Registro Mercantil'
      DisplayWidth = 100
      FieldName = 'REGISTRO_MERCANTIL'
      Size = 100
    end
    object QMTercerosCARNET_APLICADOR: TFIBStringField
      DisplayLabel = 'Carnet Aplicador'
      FieldName = 'CARNET_APLICADOR'
    end
    object QMTercerosFECHA_VALIDEZ_CARNET_APLICADOR: TDateTimeField
      DisplayLabel = 'Fec. Val. Carnet'
      FieldName = 'FECHA_VALIDEZ_CARNET_APLICADOR'
    end
    object QMTercerosPAIS_TERCERO: TFIBStringField
      FieldName = 'PAIS_TERCERO'
      OnChange = QMTercerosPAIS_TERCEROChange
      Size = 3
    end
    object QMTercerosTIPO_DOC_IDENT: TFIBStringField
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object QMTercerosDIRECCION_LITERAL: TMemoField
      DisplayLabel = 'Dir. Literal'
      FieldName = 'DIRECCION_LITERAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMTercerosPAIS_DIRECCION: TFIBStringField
      DisplayLabel = 'Pais Dir.'
      FieldName = 'PAIS_DIRECCION'
      Size = 3
    end
    object QMTercerosTITULO_PROVINCIA_LOC: TFIBStringField
      DisplayLabel = 'Tit. Provincia (Loc)'
      FieldName = 'TITULO_PROVINCIA_LOC'
      Size = 40
    end
    object QMTercerosDIR_NOMBRE_3: TFIBStringField
      DisplayLabel = 'Direcci'#243'n 3'
      FieldName = 'DIR_NOMBRE_3'
      Size = 40
    end
    object QMTercerosLATITUD: TFloatField
      DisplayLabel = 'Latitud'
      FieldName = 'LATITUD'
    end
    object QMTercerosLONGITUD: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
    object QMTercerosPROVINCIA_DIRECCION: TFIBStringField
      DisplayLabel = 'Provincia (Dir)'
      FieldName = 'PROVINCIA_DIRECCION'
      Size = 2
    end
    object QMTercerosREGION_DIRECCION: TFIBStringField
      DisplayLabel = 'Region (Dir)'
      FieldName = 'REGION_DIRECCION'
      Size = 15
    end
    object QMTercerosPOBLACION_DIRECCION: TFIBStringField
      DisplayLabel = 'Poblacion (Dir)'
      FieldName = 'POBLACION_DIRECCION'
      Size = 15
    end
    object QMTercerosDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object QMTercerosDIR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Dir. Transportista'
      FieldName = 'DIR_TRANSPORTISTA'
    end
    object QMTercerosDIRECCION_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal (Dir)'
      FieldName = 'DIRECCION_CODIGO_POSTAL'
      Size = 10
    end
    object QMTercerosTITULO_REGION: TFIBStringField
      DisplayLabel = 'Tit. Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object QMTercerosTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Tit. Provincia (Dir)'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object QMTercerosTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'Titulo Poblacion (Dir)'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object QMTercerosTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Tit. Cod. Posta (Dir)'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object QMTercerosCOMO_NOS_CONOCIERON: TIntegerField
      DisplayLabel = 'Como nos conocieron'
      FieldName = 'COMO_NOS_CONOCIERON'
    end
  end
  object xLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT LOCALIDAD, PAIS, CODPOSTAL, TITULO, PROVINCIA, C_PAIS, ID' +
        '_LOCAL'
      'FROM VER_LOCALIDADES'
      'WHERE'
      'LOCALIDAD = :DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 240
    Top = 64
  end
  object QMBancos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      '  TERCERO=?old_TERCERO AND '
      '  BANCO=?old_BANCO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TERCEROS_BANCOS'
      
        '  (TERCERO,'#13#10'BANCO,TITULO,ENTIDAD,SUCURSAL,CONTROL,CUENTA,ACTIVA' +
        ',MODO,ORDEN,NOTAS,'#13#10'IBAN,BIC,TIPO_ADEUDO_SEPA,FIRMA,FECHA_FIRMA,' +
        'TIPO_CONTRATO_SEPA,TIPO_CUENTA,PAIS)'
      'VALUES'
      
        '  (?TERCERO,'#13#10'?BANCO,?TITULO,?ENTIDAD,?SUCURSAL,?CONTROL,?CUENTA' +
        ',?ACTIVA,?MODO,?ORDEN,?NOTAS,'#13#10'?IBAN,?BIC,?TIPO_ADEUDO_SEPA,?FIR' +
        'MA,?FECHA_FIRMA,?TIPO_CONTRATO_SEPA,?TIPO_CUENTA,?PAIS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  BANCO=?BANCO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_BANCOS'
      'WHERE '
      'TERCERO = ?TERCERO '
      'ORDER BY ACTIVA DESC, ORDEN, BANCO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TERCEROS_BANCOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,ENTIDAD=?ENTIDAD '
      '  ,SUCURSAL=?SUCURSAL '
      '  ,CONTROL=?CONTROL '
      '  ,CUENTA=?CUENTA '
      '  ,ACTIVA=?ACTIVA '
      '  ,MODO=?MODO '
      '  ,ORDEN=?ORDEN '
      '  ,NOTAS=?NOTAS '
      '  ,IBAN=?IBAN '
      '  ,BIC=?BIC '
      '  ,TIPO_ADEUDO_SEPA=?TIPO_ADEUDO_SEPA '
      '  ,FIRMA=?FIRMA '
      '  ,FECHA_FIRMA=?FECHA_FIRMA '
      '  ,TIPO_CONTRATO_SEPA=?TIPO_CONTRATO_SEPA '
      '  ,TIPO_CUENTA=?TIPO_CUENTA '
      '  ,PAIS=?PAIS '
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  BANCO=?BANCO ')
    DataSource = DSQMTerceros
    AfterOpen = QMBancosAfterOpen
    BeforeClose = QMBancosBeforeClose
    BeforePost = QMBancosBeforePost
    OnNewRecord = QMBancosNewRecord
    ClavesPrimarias.Strings = (
      'TERCERO '
      'BANCO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TERCEROS_BANCOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 112
    object QMBancosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMBancosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMBancosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMBancosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      OnChange = QMBancosENTIDADChange
      Size = 4
    end
    object QMBancosSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object QMBancosCONTROL: TFIBStringField
      DisplayLabel = 'Ctrol.'
      FieldName = 'CONTROL'
      Size = 2
    end
    object QMBancosACTIVA: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVA'
    end
    object QMBancosMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMBancosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMBancosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMBancosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
    end
    object QMBancosIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object QMBancosBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object QMBancosTIPO_ADEUDO_SEPA: TFIBStringField
      DisplayLabel = 'Tipo Adeudo SEPA'
      FieldName = 'TIPO_ADEUDO_SEPA'
      Size = 4
    end
    object QMBancosFIRMA: TFIBStringField
      DisplayLabel = 'Firma SEPA'
      FieldName = 'FIRMA'
      Size = 15
    end
    object QMBancosFECHA_FIRMA: TDateTimeField
      DisplayLabel = 'Fec. Firma SEPA'
      FieldName = 'FECHA_FIRMA'
    end
    object QMBancosTIPO_CONTRATO_SEPA: TFIBStringField
      DisplayLabel = 'Tipo Contrato SEPA'
      FieldName = 'TIPO_CONTRATO_SEPA'
      Size = 4
    end
    object QMBancosTIPO_CUENTA: TIntegerField
      DisplayLabel = 'Tipo Cuenta'
      FieldName = 'TIPO_CUENTA'
    end
    object QMBancosPAIS: TFIBStringField
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSQMBancos: TDataSource
    DataSet = QMBancos
    Left = 112
    Top = 112
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT ENTIDAD, TITULO'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD')
    SelectSQL.Strings = (
      'SELECT ENTIDAD, TITULO'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD')
    UniDirectional = False
    DataSource = DSQMBancos
    Left = 240
    Top = 16
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 336
    Top = 16
  end
  object xRazones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS_RAZONES'
      'WHERE'
      '  RAZON=?RAZON ')
    SelectSQL.Strings = (
      'SELECT RAZON, TITULO'
      'FROM SYS_TERCEROS_RAZONES'
      'WHERE'
      'RAZON=?TIPO_RAZON'
      'ORDER BY RAZON'
      '')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 240
    Top = 112
    object xRazonesRAZON: TFIBStringField
      DisplayLabel = 'Razon'
      FieldName = 'RAZON'
      Size = 4
    end
    object xRazonesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxRazones: TDataSource
    DataSet = xRazones
    Left = 336
    Top = 112
  end
  object xTipDir_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_DIRECCION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT TITULO'
      'FROM SYS_TIPO_DIRECCION'
      'WHERE'
      'TIPO=?DIR_TIPO'
      '')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 240
    Top = 160
  end
  object DSxTipDir_T: TDataSource
    DataSet = xTipDir_T
    Left = 336
    Top = 160
  end
  object QMDirecciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TERCEROS_DIRECCIONES'
      'WHERE'
      '  TERCERO=?old_TERCERO AND '
      '  DIRECCION=?old_DIRECCION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TERCEROS_DIRECCIONES'
      
        '  (DIR_PISO,DIR_LOCALIDAD,ULT_MODIFICACION,NOTAS,CODIGO_POSTAL,L' +
        'ATITUD,LONGITUD,'
      
        '  DIRECCION_LITERAL,TERCERO,DIR_PUERTA,ID_LOCAL,DIR_TRANSPORTIST' +
        'A,'
      
        '  ID_FORCEMANAGER,ID_CODIGO_POSTAL,DIRECCION,DIR_NOMBRE,DIR_NOMB' +
        'RE_2,'
      
        '  DIR_BLOQUE_ESCALERA,DIR_CLASE,DIR_TELEFONO01,DIR_TELEFONO02,DI' +
        'R_TELEFAX,'
      
        '  DIR_DEFECTO,COLONIA,DIR_NOMBRE_3,ACTIVO,BANCO,PROVINCIA,DIR_TI' +
        'PO,'
      
        '  DIR_NUMERO,CODIGO_EDI,POBLACION,REGION,PAIS_DIRECCION,HORARIO,' +
        'MEDIOS,'
      '  DIR_CORREO,DIR_CONTACTO)'
      'VALUES'
      
        '  (?DIR_PISO,?DIR_LOCALIDAD,?ULT_MODIFICACION,?NOTAS,?CODIGO_POS' +
        'TAL,?LATITUD,?LONGITUD,'
      
        '  ?DIRECCION_LITERAL,?TERCERO,?DIR_PUERTA,?ID_LOCAL,?DIR_TRANSPO' +
        'RTISTA,'
      
        '  ?ID_FORCEMANAGER,?ID_CODIGO_POSTAL,?DIRECCION,?DIR_NOMBRE,?DIR' +
        '_NOMBRE_2,'
      
        '  ?DIR_BLOQUE_ESCALERA,?DIR_CLASE,?DIR_TELEFONO01,?DIR_TELEFONO0' +
        '2,?DIR_TELEFAX,'
      
        '  ?DIR_DEFECTO,?COLONIA,?DIR_NOMBRE_3,?ACTIVO,?BANCO,?PROVINCIA,' +
        '?DIR_TIPO,'
      
        '  ?DIR_NUMERO,?CODIGO_EDI,?POBLACION,?REGION,?PAIS_DIRECCION,?HO' +
        'RARIO,?MEDIOS,'
      '  ?DIR_CORREO,?DIR_CONTACTO)')
    RefreshSQL.Strings = (
      
        'SELECT DI.*, PO.TITULO AS TITULO_POBLACION, PR.TITULO AS TITULO_' +
        'PROVINCIA, PA.TITULO AS TITULO_PAIS,'
      '       CP.TITULO AS TITULO_COD_POSTAL'
      'FROM SYS_TERCEROS_DIRECCIONES DI'
      'JOIN SYS_PAISES PA ON (PA.PAIS = DI.PAIS_DIRECCION)'
      
        'LEFT JOIN SYS_PROVINCIAS PR ON (PR.PAIS = DI.PAIS_DIRECCION AND ' +
        'PR.PROVINCIA = DI.PROVINCIA)'
      
        'LEFT JOIN SYS_POBLACION PO ON (PO.PAIS = DI.PAIS_DIRECCION AND P' +
        'O.POBLACION = DI.POBLACION)'
      
        'LEFT JOIN SYS_CODIGOS_POSTALES CP ON (CP.PAIS = DI.PAIS_DIRECCIO' +
        'N AND CP.CODIGO_POSTAL = DI.CODIGO_POSTAL)'
      'WHERE'
      'DI.TERCERO = ?TERCERO AND'
      'DI.DIRECCION = ?DIRECCION ')
    SelectSQL.Strings = (
      
        'SELECT DI.*, PO.TITULO AS TITULO_POBLACION, PR.TITULO AS TITULO_' +
        'PROVINCIA, PA.TITULO AS TITULO_PAIS,'
      
        '       CP.TITULO AS TITULO_COD_POSTAL, LO.TITULO AS TIT_LOCALIDA' +
        'D, PRL.TITULO AS TIT_PROVINCIA_LOC'
      'FROM SYS_TERCEROS_DIRECCIONES DI'
      'JOIN SYS_PAISES PA ON (PA.PAIS = DI.PAIS_DIRECCION)'
      'JOIN SYS_LOCALIDADES LO ON(DI.DIR_LOCALIDAD = LO.LOCALIDAD)'
      
        'JOIN SYS_PROVINCIAS PRL ON(LO.PAIS = PRL.PAIS AND LO.PROVINCIA =' +
        ' PRL.PROVINCIA)'
      
        'LEFT JOIN SYS_PROVINCIAS PR ON (PR.PAIS = DI.PAIS_DIRECCION AND ' +
        'PR.PROVINCIA = DI.PROVINCIA)'
      
        'LEFT JOIN SYS_POBLACION PO ON (PO.PAIS = DI.PAIS_DIRECCION AND P' +
        'O.POBLACION = DI.POBLACION)'
      
        'LEFT JOIN SYS_CODIGOS_POSTALES CP ON (CP.PAIS = DI.PAIS_DIRECCIO' +
        'N AND CP.CODIGO_POSTAL = DI.CODIGO_POSTAL)'
      'WHERE'
      'DI.TERCERO = ?TERCERO'
      'ORDER BY DI.DIR_DEFECTO DESC, DI.DIRECCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TERCEROS_DIRECCIONES'
      'SET'
      '  DIR_PISO=?DIR_PISO '
      '  ,DIR_LOCALIDAD=?DIR_LOCALIDAD '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,NOTAS=?NOTAS '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,LATITUD=?LATITUD '
      '  ,LONGITUD=?LONGITUD '
      '  ,DIRECCION_LITERAL=?DIRECCION_LITERAL '
      '  ,DIR_PUERTA=?DIR_PUERTA '
      '  ,ID_LOCAL=?ID_LOCAL '
      '  ,DIR_TRANSPORTISTA=?DIR_TRANSPORTISTA '
      '  ,ID_FORCEMANAGER=?ID_FORCEMANAGER '
      '  ,ID_CODIGO_POSTAL=?ID_CODIGO_POSTAL '
      '  ,DIR_NOMBRE=?DIR_NOMBRE '
      '  ,DIR_NOMBRE_2=?DIR_NOMBRE_2 '
      '  ,DIR_BLOQUE_ESCALERA=?DIR_BLOQUE_ESCALERA '
      '  ,DIR_CLASE=?DIR_CLASE '
      '  ,DIR_TELEFONO01=?DIR_TELEFONO01 '
      '  ,DIR_TELEFONO02=?DIR_TELEFONO02 '
      '  ,DIR_TELEFAX=?DIR_TELEFAX '
      '  ,DIR_DEFECTO=?DIR_DEFECTO '
      '  ,COLONIA=?COLONIA '
      '  ,DIR_NOMBRE_3=?DIR_NOMBRE_3 '
      '  ,ACTIVO=?ACTIVO '
      '  ,BANCO=?BANCO '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,DIR_TIPO=?DIR_TIPO '
      '  ,DIR_NUMERO=?DIR_NUMERO '
      '  ,CODIGO_EDI=?CODIGO_EDI '
      '  ,POBLACION=?POBLACION '
      '  ,REGION=?REGION '
      '  ,PAIS_DIRECCION=?PAIS_DIRECCION '
      '  ,HORARIO=?HORARIO '
      '  ,MEDIOS=?MEDIOS'
      '  ,DIR_CORREO=?DIR_CORREO'
      '  ,DIR_CONTACTO=?DIR_CONTACTO'
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  DIRECCION=?DIRECCION ')
    DataSource = DSQMTerceros
    AfterOpen = QMDireccionesAfterOpen
    AfterPost = QMDireccionesAfterPost
    BeforeClose = QMDireccionesBeforeClose
    BeforeDelete = QMDireccionesBeforeDelete
    BeforePost = QMDireccionesBeforePost
    OnNewRecord = QMDireccionesNewRecord
    ClavesPrimarias.Strings = (
      'TERCERO '
      'DIRECCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TERCEROS_DIRECCIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 160
    object QMDireccionesDIRECCION: TIntegerField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECCION'
    end
    object QMDireccionesDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direcci'#243'n 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMDireccionesDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object QMDireccionesDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object QMDireccionesDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object QMDireccionesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMDireccionesDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      OnChange = QMDireccionesDIR_LOCALIDADChange
      Size = 8
    end
    object QMDireccionesDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      OnChange = QMDireccionesDIR_TIPOChange
      Size = 3
    end
    object QMDireccionesDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object QMDireccionesDIR_NUMERO: TFIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object QMDireccionesDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Dir. Completa'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object QMDireccionesDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Dir. Complete N.'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMDireccionesDIR_CLASE: TIntegerField
      DisplayLabel = 'Clase'
      FieldName = 'DIR_CLASE'
    end
    object QMDireccionesDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel'#233'fono 1'
      FieldName = 'DIR_TELEFONO01'
    end
    object QMDireccionesDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel'#233'fono 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object QMDireccionesDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
    object QMDireccionesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftFmtMemo
      GraphicHeader = False
      Size = 8
    end
    object QMDireccionesCODIGO_EDI: TFIBStringField
      DisplayLabel = 'Cod. EDI'
      FieldName = 'CODIGO_EDI'
      Size = 25
    end
    object QMDireccionesDIR_DEFECTO: TIntegerField
      DisplayLabel = 'Dir. Defecto'
      FieldName = 'DIR_DEFECTO'
    end
    object QMDireccionesID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
    object QMDireccionesULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Mod.'
      FieldName = 'ULT_MODIFICACION'
    end
    object QMDireccionesDIR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp. Dir.'
      FieldName = 'DIR_TRANSPORTISTA'
    end
    object QMDireccionesCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMDireccionesDIR_NOMBRE_3: TFIBStringField
      DisplayLabel = 'Direcci'#243'n 3'
      FieldName = 'DIR_NOMBRE_3'
      Size = 40
    end
    object QMDireccionesACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMDireccionesID_FORCEMANAGER: TIntegerField
      DisplayLabel = 'Id ForceManager'
      FieldName = 'ID_FORCEMANAGER'
    end
    object QMDireccionesBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMDireccionesCODIGO_POSTAL: TFIBStringField
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMDireccionesLATITUD: TFloatField
      FieldName = 'LATITUD'
    end
    object QMDireccionesLONGITUD: TFloatField
      FieldName = 'LONGITUD'
    end
    object QMDireccionesID_CODIGO_POSTAL: TIntegerField
      FieldName = 'ID_CODIGO_POSTAL'
    end
    object QMDireccionesPAIS_DIRECCION: TFIBStringField
      DisplayLabel = 'Pais Dir.'
      FieldName = 'PAIS_DIRECCION'
      Size = 3
    end
    object QMDireccionesPROVINCIA: TFIBStringField
      FieldName = 'PROVINCIA'
      Size = 2
    end
    object QMDireccionesPOBLACION: TFIBStringField
      FieldName = 'POBLACION'
      Size = 15
    end
    object QMDireccionesREGION: TFIBStringField
      FieldName = 'REGION'
      Size = 15
    end
    object QMDireccionesDIRECCION_LITERAL: TBlobField
      DisplayLabel = 'Direcci'#243'n literal'
      FieldName = 'DIRECCION_LITERAL'
      Size = 8
    end
    object QMDireccionesTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'Poblaci'#243'n'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object QMDireccionesTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object QMDireccionesTITULO_PAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'TITULO_PAIS'
      Size = 60
    end
    object QMDireccionesTITULO_COD_POSTAL: TFIBStringField
      DisplayLabel = 'T'#237't. Cod. postal'
      FieldName = 'TITULO_COD_POSTAL'
      Size = 40
    end
    object QMDireccionesHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 256
    end
    object QMDireccionesMEDIOS: TFIBStringField
      DisplayLabel = 'Medios'
      FieldName = 'MEDIOS'
      Size = 256
    end
    object QMDireccionesDIR_CORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'DIR_CORREO'
      Size = 256
    end
    object QMDireccionesDIR_CONTACTO: TFIBStringField
      DisplayLabel = 'Contacto'
      FieldName = 'DIR_CONTACTO'
      Size = 256
    end
    object QMDireccionesTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Tit. Localidad'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object QMDireccionesTIT_PROVINCIA_LOC: TFIBStringField
      DisplayLabel = 'Tit. Provincia (Loc)'
      FieldName = 'TIT_PROVINCIA_LOC'
      Size = 40
    end
  end
  object DSQMDirecciones: TDataSource
    DataSet = QMDirecciones
    Left = 112
    Top = 160
  end
  object xLoc_D: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT LOCALIDAD, PAIS, CODPOSTAL, TITULO, PROVINCIA, C_PAIS, ID' +
        '_LOCAL'
      'FROM VER_LOCALIDADES'
      'WHERE'
      'LOCALIDAD = :DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSQMDirecciones
    Left = 32
    Top = 256
  end
  object DSxLoc_D: TDataSource
    DataSet = xLoc_D
    Left = 112
    Top = 256
  end
  object xTipDir_D: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_DIRECCION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT tipo,titulo FROM SYS_TIPO_DIRECCION             '
      'where tipo=?dir_Tipo')
    UniDirectional = False
    DataSource = DSQMDirecciones
    Left = 32
    Top = 208
  end
  object DSxTipDir_D: TDataSource
    DataSet = xTipDir_D
    Left = 112
    Top = 208
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 424
    Top = 16
  end
  object xEmails: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_CORREOS_ENVIADOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'RIG=?RIG AND '
      'TERCERO=?TERCERO AND'
      'USUARIO=?USUARIO AND'
      'LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CORREO_ENVIADO'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'TERCERO=?TERCERO'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 240
    Top = 256
    object xEmailsEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEmailsRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xEmailsUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xEmailsTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xEmailsFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xEmailsLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSxEmails: TDataSource
    DataSet = xEmails
    Left = 336
    Top = 256
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 496
    Top = 16
  end
  object QMComoNosConocieron: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_COMO_NOS_CONOCIERON'
      'ORDER BY MODO')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 32
    Top = 304
    object QMComoNosConocieronMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMComoNosConocieronTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMComoNosConocieron: TDataSource
    DataSet = QMComoNosConocieron
    Left = 112
    Top = 304
  end
  object xValidacionDoc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_DIRECCION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT RESULTADO, RESULTADO_NOMBRE, FECHA_COMPROBACION'
      'FROM VALIDACION_DOCUMENTO'
      'WHERE'
      'PAIS = :PAIS_TERCERO AND'
      'TIPO_DOC_IDENT = :TIPO_DOC_IDENT AND'
      'DOCUMENTO = :NIF')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 240
    Top = 304
    object xValidacionDocRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 35
    end
    object xValidacionDocRESULTADO_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'RESULTADO_NOMBRE'
      Size = 256
    end
    object xValidacionDocFECHA_COMPROBACION: TDateTimeField
      DisplayLabel = 'Fec. Comprobacion'
      FieldName = 'FECHA_COMPROBACION'
    end
  end
  object DSxValidacionDoc: TDataSource
    DataSet = xValidacionDoc
    Left = 336
    Top = 304
  end
end
