object CrmDMLstContactoDetallado: TCrmDMLstContactoDetallado
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 486
  Top = 50
  Height = 691
  Width = 555
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 432
    Top = 8
  end
  object xContactoDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE_COMERCIAL'
      'from crm_contactos'
      'where id_contacto=?id_contacto')
    UniDirectional = False
    Left = 40
    Top = 16
    object xContactoDesdeNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object xContactoHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE_COMERCIAL'
      'from crm_contactos'
      'where id_contacto=?id_contacto')
    UniDirectional = False
    Left = 40
    Top = 64
    object xContactoHastaNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object DSxContactoD: TDataSource
    DataSet = xContactoDesde
    Left = 160
    Top = 16
  end
  object DSxContactoH: TDataSource
    DataSet = xContactoHasta
    Left = 160
    Top = 64
  end
  object frListadoContactos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Acciones Contacto'
    RebuildPrinter = False
    OnGetValue = frListadoContactosGetValue
    OnBeforePrint = frListadoContactosBeforePrint
    OnEnterRect = frListadoContactosBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 432
    Top = 56
    ReportForm = {19000000}
  end
  object QMLstContactos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CRM_VER_CONTACTOS'
      'WHERE'
      'ID_CONTACTO >= ?CONTACTO_INI AND'
      'ID_CONTACTO <= ?CONTACTO_FIN AND'
      'FECHA_ALTA >= ?FECHA_DESDE AND'
      'FECHA_ALTA <= ?FECHA_HASTA'
      'ORDER BY ID_CONTACTO'
      ' ')
    UniDirectional = False
    AfterScroll = QMLstContactosAfterScroll
    Left = 40
    Top = 112
  end
  object DSLstContactos: TDataSource
    DataSet = QMLstContactos
    Left = 160
    Top = 112
  end
  object frDBListadoContactos: TfrDBDataSet
    DataSource = DSLstContactos
    Left = 280
    Top = 120
  end
  object QMTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CLI.*, CON.*,'
      
        '       TRA.TITULO AS TITULO_TRANPORTISTA, POR.TITULO AS TITULO_P' +
        'ORTES'
      'FROM VER_CLIENTES_CUENTAS CLI'
      'JOIN CRM_VER_CONTACTOS CON ON (CLI.TERCERO = CON.TERCERO)'
      
        'JOIN VER_TRANSPORTISTAS TRA ON (CLI.TRANSPORTISTA = TRA.TRANSPOR' +
        'TISTA AND CLI.EMPRESA = TRA.EMPRESA)'
      
        'JOIN CON_CUENTAS_GES_PORTES POR ON (POR.EMPRESA = CLI.EMPRESA AN' +
        'D POR.EJERCICIO = CLI.EJERCICIO AND POR.CANAL = CLI.CANAL AND PO' +
        'R.TIPO = CLI.TIPO_PORTES)'
      'WHERE'
      'CON.ID_CONTACTO = ?ID_CONTACTO AND'
      'CLI.EMPRESA = ?EMPRESA AND'
      'CLI.EJERCICIO = ?EJERCICIO AND'
      'CLI.CANAL = ?CANAL'
      'ORDER BY CON.ID_CONTACTO')
    UniDirectional = False
    DataSource = DSLstContactos
    Left = 40
    Top = 208
  end
  object DSQMTerceros: TDataSource
    DataSet = QMTerceros
    Left = 160
    Top = 208
  end
  object QMBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_BANCOS BAN'
      'JOIN CRM_VER_CONTACTOS CON ON (BAN.TERCERO = CON.TERCERO)'
      'WHERE'
      'CON.ID_CONTACTO = ?ID_CONTACTO AND'
      'BAN.EMPRESA = ?EMPRESA AND'
      'BAN.EJERCICIO = ?EJERCICIO AND'
      'BAN.CANAL = ?CANAL'
      'ORDER BY CON.ID_CONTACTO')
    UniDirectional = False
    DataSource = DSLstContactos
    Left = 40
    Top = 256
  end
  object DSQMBancos: TDataSource
    DataSet = QMBancos
    Left = 160
    Top = 256
  end
  object QMContactos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CRM_CONTACTOS_PERSONAS'
      'WHERE'
      'ID_CONTACTO = ?ID_CONTACTO'
      'ORDER BY NUM_PERSONA')
    UniDirectional = False
    DataSource = DSLstContactos
    Left = 40
    Top = 160
  end
  object DSQMContactos: TDataSource
    DataSet = QMContactos
    Left = 160
    Top = 160
  end
  object QMCondiciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_C CLI'
      'JOIN CRM_VER_CONTACTOS CON ON (CLI.CLIENTE = CON.CLIENTE)'
      'WHERE'
      'CON.ID_CONTACTO = ?ID_CONTACTO AND'
      'CLI.EMPRESA = ?EMPRESA AND'
      'CLI.EJERCICIO = ?EJERCICIO AND'
      'CLI.CANAL = ?CANAL'
      'ORDER BY CON.ID_CONTACTO')
    UniDirectional = False
    DataSource = DSLstContactos
    Left = 40
    Top = 304
  end
  object DSCondiciones: TDataSource
    DataSet = QMCondiciones
    Left = 160
    Top = 304
  end
  object frDBNombreContactos: TfrDBDataSet
    DataSource = DSQMContactos
    Left = 280
    Top = 168
  end
  object frDBBancos: TfrDBDataSet
    DataSource = DSQMBancos
    Left = 280
    Top = 264
  end
  object frDBTerceros: TfrDBDataSet
    DataSource = DSQMTerceros
    Left = 280
    Top = 216
  end
  object frDBCondiciones: TfrDBDataSet
    DataSource = DSCondiciones
    Left = 280
    Top = 312
  end
  object QMDetalleCondiciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM  ART_CONDICIONES_D'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'RIG = ?RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSCondiciones
    Left = 40
    Top = 400
  end
  object DSDetalleCondiciones: TDataSource
    DataSet = QMDetalleCondiciones
    Left = 160
    Top = 400
  end
  object frDBDetalleCondiciones: TfrDBDataSet
    DataSource = DSDetalleCondiciones
    Left = 280
    Top = 400
  end
  object frUDNotas: TfrUserDataset
    OnCheckEOF = frUDNotasCheckEOF
    OnFirst = frUDNotasFirst
    OnNext = frUDNotasNext
    Left = 432
    Top = 104
  end
  object xEtiquetas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CRM_VER_CONTACTOS '
      'WHERE '
      'ID_AGENTE = ?AGENTE'
      'ORDER BY ID_CONTACTO')
    UniDirectional = False
    Left = 40
    Top = 352
  end
  object DSxEtiquetas: TDataSource
    DataSet = xEtiquetas
    Left = 160
    Top = 352
  end
  object frDBxEtiquetas: TfrDBDataSet
    DataSource = DSxEtiquetas
    Left = 280
    Top = 352
  end
end
