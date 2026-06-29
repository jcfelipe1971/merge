object CrmDMLstSegAccContactos: TCrmDMLstSegAccContactos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 406
  Top = 171
  Height = 296
  Width = 504
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 368
    Top = 32
  end
  object frListadoAccSeg: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Seguimiento Acciones'
    RebuildPrinter = False
    OnGetValue = frListadoAccSegGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 368
    Top = 80
    ReportForm = {19000000}
  end
  object frDBListadoContacto: TfrDBDataSet
    DataSource = DSLstContacto
    Left = 224
    Top = 24
  end
  object QMLstContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from crm_contactos contact'
      
        'left join crm_contactos_acciones acc on (contact.id_contacto=acc' +
        '.id_contacto)'
      
        'where (contact.id_contacto>=-1 and contact.id_contacto<=1 and ac' +
        'c.fecha_accion>='#39'02/01/2008'#39' and acc.fecha_accion<='#39'03/30/2008'#39')'
      'order by acc.id_contacto')
    SelectSQL.Strings = (
      'select * from crm_contactos '
      'where '
      'id_contacto >= ?contacto_ini and'
      'id_contacto <= ?contacto_fin'
      'order by id_contacto')
    UniDirectional = False
    Left = 40
    Top = 24
  end
  object DSLstContacto: TDataSource
    DataSet = QMLstContacto
    Left = 120
    Top = 24
  end
  object QMLstAcciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * '
      'from crm_contactos_acciones acc '
      'where '
      'acc.id_contacto=?id_contacto and '
      'acc.fecha_accion>=?fecha_ini and '
      'acc.fecha_accion<=?fecha_fin and'
      'acc.id_accion_cab>=?accion_ini and '
      'acc.id_accion_cab<=?accion_fin and'
      'acc.tipo_accion>=?tipo_accion_ini and '
      'acc.tipo_accion<=?tipo_accion_fin'
      'order by acc.id_contacto, acc.fecha_accion')
    UniDirectional = False
    DataSource = DSLstContacto
    Left = 40
    Top = 72
  end
  object DSLstAcciones: TDataSource
    DataSet = QMLstAcciones
    Left = 120
    Top = 72
  end
  object frDBListadoAcciones: TfrDBDataSet
    DataSource = DSLstAcciones
    Left = 224
    Top = 72
  end
  object DSLstAccDet: TDataSource
    DataSet = QMLstAccionesDet
    Left = 120
    Top = 120
  end
  object QMLstAccionesDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from crm_contactos_acciones_det'
      'where id_accion=?id_accion'
      'order by id_accion,orden')
    UniDirectional = False
    DataSource = DSLstAcciones
    Left = 40
    Top = 120
  end
  object frDBListadoAccDet: TfrDBDataSet
    DataSource = DSLstAccDet
    Left = 224
    Top = 120
  end
end
