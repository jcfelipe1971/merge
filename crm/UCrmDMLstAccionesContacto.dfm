object CrmDMLstAccContactos: TCrmDMLstAccContactos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 567
  Top = 173
  Height = 676
  Width = 663
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 488
    Top = 16
  end
  object frListadoAcc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Acciones Contacto'
    RebuildPrinter = False
    OnGetValue = frListadoAccGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 544
    Top = 16
    ReportForm = {19000000}
  end
  object frDBListadoContacto: TfrDBDataSet
    DataSource = DSLstContacto
    Left = 248
    Top = 104
  end
  object QMLstContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from crm_contactos contact'
      'left join crm_ambitos_contacto ambito'
      'on contact.id_contacto = ambito.id_crm_contacto'
      
        'where contact.id_contacto>=?contacto_ini and contact.id_contacto' +
        '<=?contacto_fin'
      
        '   and (contact.zona=?zona or ?check_zona=0) and(ambito.id_crm_a' +
        'mbito=?ambito or ?check_ambito=0)'
      'order by contact.nombre_comercial ASC')
    SelectSQL.Strings = (
      'select * from crm_contactos contact'
      'left join crm_ambitos_contacto ambito'
      'on contact.id_contacto = ambito.id_crm_contacto'
      
        'where contact.id_contacto>=?contacto_ini and contact.id_contacto' +
        '<=?contacto_fin'
      
        '   and (contact.zona=?zona or ?check_zona=0) and(ambito.id_crm_a' +
        'mbito=?ambito or ?check_ambito=0)'
      'order by contact.nombre_comercial ASC')
    UniDirectional = False
    Left = 48
    Top = 104
  end
  object DSLstContacto: TDataSource
    DataSet = QMLstContacto
    Left = 136
    Top = 104
  end
  object QMLstAcciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from crm_contactos_acciones acc '
      'where (acc.id_contacto=?id_contacto'
      
        '           and acc.fecha_accion>=?fecha_ini and acc.fecha_accion' +
        '<=?fecha_fin)')
    UniDirectional = False
    DataSource = DSLstContacto
    Left = 48
    Top = 8
  end
  object DSLstAcciones: TDataSource
    DataSet = QMLstAcciones
    Left = 136
    Top = 8
  end
  object frDBLisradoAcciones: TfrDBDataSet
    DataSource = DSLstAcciones
    Left = 248
    Top = 8
  end
  object xContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select min(id_contacto), max(id_contacto) from crm_contactos')
    UniDirectional = False
    Left = 48
    Top = 152
  end
  object DSxContacto: TDataSource
    DataSet = xContacto
    Left = 136
    Top = 152
  end
  object xZonaDefault: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select zona'
      'from sys_zonas'
      'where defecto = 1')
    UniDirectional = False
    Left = 48
    Top = 200
  end
  object DSxZonaDefault: TDataSource
    DataSet = xZonaDefault
    Left = 136
    Top = 200
  end
  object DSLstPersonas: TDataSource
    DataSet = QMLstPersonas
    Left = 136
    Top = 56
  end
  object QMLstPersonas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from crm_contactos_personas'
      'where id_contacto=?id_contacto')
    UniDirectional = False
    DataSource = DSLstContacto
    Left = 48
    Top = 56
  end
  object frDBListadoPersonas: TfrDBDataSet
    DataSource = DSLstPersonas
    Left = 248
    Top = 56
  end
  object xAmbitoDefault: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select min(ambito) as ambito'
      'from crm_sys_ambitos')
    UniDirectional = False
    Left = 48
    Top = 248
  end
  object DSxAmbitoDefault: TDataSource
    DataSet = xAmbitoDefault
    Left = 136
    Top = 248
  end
  object xAmbito: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select DESCRIPCION'
      'from crm_sys_ambitos'
      'where ambito=?ambito')
    UniDirectional = False
    Left = 48
    Top = 296
  end
  object DSxAmbito: TDataSource
    DataSet = xAmbito
    Left = 136
    Top = 296
  end
end
