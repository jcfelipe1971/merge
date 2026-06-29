object CrmDMConfiguracion: TCrmDMConfiguracion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 608
  Top = 212
  Height = 311
  Width = 307
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 8
  end
  object xTAcciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from crm_sys_acciones'
      'ORDER BY ACCION')
    UniDirectional = False
    Left = 32
    Top = 8
  end
  object DSxTAcciones: TDataSource
    DataSet = xTAcciones
    Left = 120
    Top = 8
  end
  object QMCrmConfig: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONFIGURACION'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONFIGURACION'
      
        '  (LOGO_CRM,HTML_EMPRESA,HTML_CLIENTE,HTML_CONTACTOS,HTML_CONTAC' +
        'TO,CRM_TAMANO_LETRA,ID,CRM_TIPO_LETRA,CRM_AUTO_ACCION,CRM_AVISOS' +
        ',CRM_ACCION_DEFECTO,IMAGEN,FORMATO,CRM_IP_IMPRESORA,CRM_NOMBRE_I' +
        'MPRESORA,CRM_NOMBRE,CRM_CIUDAD,CRM_PROVINCIA,CRM_CP,CRM_PAIS,CRM' +
        '_TELEFONO,CRM_DIRECCION,CRM_DIRECCION_AMPLIADA,CRM_EMAIL,CRM_WEB' +
        ',CRM_FAX)'
      'VALUES'
      
        '  (?LOGO_CRM,?HTML_EMPRESA,?HTML_CLIENTE,?HTML_CONTACTOS,?HTML_C' +
        'ONTACTO,?CRM_TAMANO_LETRA,?ID,?CRM_TIPO_LETRA,?CRM_AUTO_ACCION,?' +
        'CRM_AVISOS,?CRM_ACCION_DEFECTO,?IMAGEN,?FORMATO,?CRM_IP_IMPRESOR' +
        'A,?CRM_NOMBRE_IMPRESORA,?CRM_NOMBRE,?CRM_CIUDAD,?CRM_PROVINCIA,?' +
        'CRM_CP,?CRM_PAIS,?CRM_TELEFONO,?CRM_DIRECCION,?CRM_DIRECCION_AMP' +
        'LIADA,?CRM_EMAIL,?CRM_WEB,?CRM_FAX)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONFIGURACION'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_CONFIGURACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_CONFIGURACION'
      'SET'
      '  LOGO_CRM=?LOGO_CRM '
      '  ,HTML_EMPRESA=?HTML_EMPRESA '
      '  ,HTML_CLIENTE=?HTML_CLIENTE '
      '  ,HTML_CONTACTOS=?HTML_CONTACTOS '
      '  ,HTML_CONTACTO=?HTML_CONTACTO '
      '  ,CRM_TAMANO_LETRA=?CRM_TAMANO_LETRA '
      '  ,CRM_TIPO_LETRA=?CRM_TIPO_LETRA '
      '  ,CRM_AUTO_ACCION=?CRM_AUTO_ACCION '
      '  ,CRM_AVISOS=?CRM_AVISOS '
      '  ,CRM_ACCION_DEFECTO=?CRM_ACCION_DEFECTO '
      '  ,IMAGEN=?IMAGEN '
      '  ,FORMATO=?FORMATO '
      '  ,CRM_IP_IMPRESORA=?CRM_IP_IMPRESORA '
      '  ,CRM_NOMBRE_IMPRESORA=?CRM_NOMBRE_IMPRESORA '
      '  ,CRM_NOMBRE=?CRM_NOMBRE '
      '  ,CRM_CIUDAD=?CRM_CIUDAD '
      '  ,CRM_PROVINCIA=?CRM_PROVINCIA '
      '  ,CRM_CP=?CRM_CP '
      '  ,CRM_PAIS=?CRM_PAIS '
      '  ,CRM_TELEFONO=?CRM_TELEFONO '
      '  ,CRM_DIRECCION=?CRM_DIRECCION '
      '  ,CRM_DIRECCION_AMPLIADA=?CRM_DIRECCION_AMPLIADA '
      '  ,CRM_EMAIL=?CRM_EMAIL '
      '  ,CRM_WEB=?CRM_WEB '
      '  ,CRM_FAX=?CRM_FAX '
      'WHERE'
      '  ID=?ID ')
    AfterScroll = QMCrmConfigAfterScroll
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_CONFIGURACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMCrmConfigID: TIntegerField
      FieldName = 'ID'
    end
    object QMCrmConfigCRM_TIPO_LETRA: TFIBStringField
      DisplayLabel = 'Tipo Letra'
      FieldName = 'CRM_TIPO_LETRA'
      Size = 40
    end
    object QMCrmConfigCRM_TAMANO_LETRA: TIntegerField
      DisplayLabel = 'Tamano Letra'
      FieldName = 'CRM_TAMANO_LETRA'
    end
    object QMCrmConfigCRM_AUTO_ACCION: TIntegerField
      DisplayLabel = 'Auto Accino'
      FieldName = 'CRM_AUTO_ACCION'
    end
    object QMCrmConfigCRM_ACCION_DEFECTO: TFIBStringField
      DisplayLabel = 'Accion Defecto'
      FieldName = 'CRM_ACCION_DEFECTO'
      Size = 3
    end
    object QMCrmConfigCRM_AVISOS: TIntegerField
      DisplayLabel = 'Avisos'
      FieldName = 'CRM_AVISOS'
    end
    object QMCrmConfigHTML_CONTACTO: TBlobField
      DisplayLabel = 'HTML Contacto'
      FieldName = 'HTML_CONTACTO'
      Size = 8
    end
    object QMCrmConfigHTML_CONTACTOS: TBlobField
      DisplayLabel = 'HTML Contactos'
      FieldName = 'HTML_CONTACTOS'
      Size = 8
    end
    object QMCrmConfigHTML_CLIENTE: TBlobField
      DisplayLabel = 'HTML Cli.'
      FieldName = 'HTML_CLIENTE'
      Size = 8
    end
    object QMCrmConfigHTML_EMPRESA: TBlobField
      DisplayLabel = 'HTML Empresa'
      FieldName = 'HTML_EMPRESA'
      Size = 8
    end
    object QMCrmConfigLOGO_CRM: TBlobField
      DisplayLabel = 'Logo'
      FieldName = 'LOGO_CRM'
      Size = 8
    end
    object QMCrmConfigIMAGEN: TBlobField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
      Size = 8
    end
    object QMCrmConfigFORMATO: TFIBStringField
      DisplayLabel = 'Formato'
      FieldName = 'FORMATO'
      Size = 5
    end
    object QMCrmConfigOrigen: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Origen'
      Calculated = True
    end
    object QMCrmConfigCRM_IP_IMPRESORA: TFIBStringField
      DisplayLabel = 'IP Impresora'
      FieldName = 'CRM_IP_IMPRESORA'
    end
    object QMCrmConfigCRM_NOMBRE_IMPRESORA: TFIBStringField
      DisplayLabel = 'Nombre Impr.'
      FieldName = 'CRM_NOMBRE_IMPRESORA'
    end
    object QMCrmConfigCRM_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'CRM_NOMBRE'
      Size = 60
    end
    object QMCrmConfigCRM_CIUDAD: TFIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CRM_CIUDAD'
      Size = 40
    end
    object QMCrmConfigCRM_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'CRM_PROVINCIA'
      Size = 40
    end
    object QMCrmConfigCRM_CP: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CRM_CP'
    end
    object QMCrmConfigCRM_PAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'CRM_PAIS'
      Size = 60
    end
    object QMCrmConfigCRM_TELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'CRM_TELEFONO'
    end
    object QMCrmConfigCRM_DIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'CRM_DIRECCION'
      Size = 40
    end
    object QMCrmConfigCRM_DIRECCION_AMPLIADA: TBlobField
      DisplayLabel = 'Dir. Ampliada'
      FieldName = 'CRM_DIRECCION_AMPLIADA'
      Size = 8
    end
    object QMCrmConfigCRM_EMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'CRM_EMAIL'
      Size = 60
    end
    object QMCrmConfigCRM_WEB: TFIBStringField
      DisplayLabel = 'web'
      FieldName = 'CRM_WEB'
      Size = 40
    end
    object QMCrmConfigCRM_FAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'CRM_FAX'
    end
  end
  object DSQMCrmConfig: TDataSource
    DataSet = QMCrmConfig
    Left = 120
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
    Left = 256
    Top = 8
  end
end
