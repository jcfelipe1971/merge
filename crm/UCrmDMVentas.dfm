object CrmDmVentas: TCrmDmVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 560
  Top = 194
  Height = 291
  Width = 460
  object QMCrmVentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_VENTAS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_VENTAS'
      '  (ID,ID_CONTACTO,ID_ARTICULO,FECHA)'
      'VALUES'
      '  (?ID,?ID_CONTACTO,?ID_ARTICULO,?FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_VENTAS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_VENTAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_VENTAS'
      'SET'
      '  ID_CONTACTO=?ID_CONTACTO '
      '  ,ID_ARTICULO=?ID_ARTICULO '
      '  ,FECHA=?FECHA '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      '')
    AfterDelete = Graba
    AfterPost = Graba
    OnCalcFields = QMCrmVentasCalcFields
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_VENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMCrmVentasID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object QMCrmVentasID_CONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object QMCrmVentasID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Articulo'
      FieldName = 'ID_ARTICULO'
    end
    object QMCrmVentasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCrmVentasDescContacto: TStringField
      DisplayLabel = 'Nombre'
      FieldKind = fkCalculated
      FieldName = 'DescContacto'
      Calculated = True
    end
    object QMCrmVentasDescArticulo: TStringField
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      Calculated = True
    end
    object QMCrmVentasCantidad: TFloatField
      DisplayLabel = 'Cantidad'
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
  end
  object DSQMCrmVentas: TDataSource
    DataSet = QMCrmVentas
    Left = 136
    Top = 16
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 240
    Top = 16
  end
  object xContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CLIENTES                   '
      '    where empresa=?empresa '
      'and ejercicio=?ejercicio'
      'and canal=?canal'
      'and cliente=?cliente')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_CONTACTOS '
      'where id_contacto=?id_contacto')
    UniDirectional = False
    DataSource = DSQMCrmVentas
    Left = 40
    Top = 64
    object xContactoID_CONTACTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONTACTO'
    end
    object xContactoNUM_CONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'NUM_CONTACTO'
    end
    object xContactoFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object xContactoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xContactoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xContactoNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xContactoNOMBRE_CORTO: TFIBStringField
      DisplayLabel = 'Nombre Corto'
      FieldName = 'NOMBRE_CORTO'
      Size = 15
    end
    object xContactoTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xContactoNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object xContactoTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xContactoTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xContactoTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xContactoDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 60
    end
    object xContactoDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xContactoID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
    object xContactoEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xContactoWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object xContactoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xContactoCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xContactoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xContactoRUTA_IMAGEN: TFIBStringField
      DisplayLabel = 'Carpeta Imagen'
      FieldName = 'RUTA_IMAGEN'
      Size = 200
    end
    object xContactoORIGEN_CONTACTO: TFIBStringField
      DisplayLabel = 'Orig. Contacto'
      FieldName = 'ORIGEN_CONTACTO'
      Size = 3
    end
    object xContactoLINK_GOOGLE: TFIBStringField
      DisplayLabel = 'Link Goolge'
      FieldName = 'LINK_GOOGLE'
      Size = 200
    end
    object xContactoACTIVITAT_ECONOMICA: TFIBStringField
      DisplayLabel = 'Actividad Econ.'
      FieldName = 'ACTIVITAT_ECONOMICA'
      Size = 200
    end
    object xContactoAMBITO: TIntegerField
      DisplayLabel = 'Ambito'
      FieldName = 'AMBITO'
    end
    object xContactoFORMA_DE_PAGO_IMP: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_DE_PAGO_IMP'
      Size = 3
    end
    object xContactoCLI_PROV_IMP: TFIBStringField
      DisplayLabel = 'Cli./Prov.'
      FieldName = 'CLI_PROV_IMP'
      Size = 40
    end
    object xContactoID_AGENTE: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_AGENTE'
    end
    object xContactoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xContactoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSxContacto: TDataSource
    DataSet = xContacto
    Left = 136
    Top = 64
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CRM_ARTICULO'
      'where id_articulo=?id_articulo')
    UniDirectional = False
    DataSource = DSQMCrmVentas
    Left = 40
    Top = 112
    object xArticuloID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_ARTICULO'
    end
    object xArticuloCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object xArticuloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xArticuloCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 136
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 240
    Top = 64
  end
end
