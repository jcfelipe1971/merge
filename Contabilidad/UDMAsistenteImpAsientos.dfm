object DMAsistenteImpAsientos: TDMAsistenteImpAsientos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 612
  Top = 178
  Height = 449
  Width = 565
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 16
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 128
    Top = 17
  end
  object QLlenarTemporal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'insert into tmp_importar_asientos (entrada,asiento,linea,cuenta,' +
        'fecha,texto,tipo,importe,debe,haber)'
      
        'values (?entrada,?asiento,?linea,?cuenta,?fecha,?texto,?tipo,?im' +
        'porte,?debe,?haber)')
    Transaction = TLocal
    AutoTrans = True
    Left = 344
    Top = 24
  end
  object QBorrarTemporal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from tmp_importar_asientos'
      'where entrada=?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 448
    Top = 24
  end
  object QMAsientosImp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_IMPORTAR_ASIENTOS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ASIENTO=?old_ASIENTO AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_IMPORTAR_ASIENTOS'
      
        '  (ENTRADA,ASIENTO,LINEA,CUENTA,TITULO,TEXTO,TIPO,IMPORTE,MARCAD' +
        'O)'
      'VALUES'
      
        '  (?ENTRADA,?ASIENTO,?LINEA,?CUENTA,?TITULO,?TEXTO,?TIPO,?IMPORT' +
        'E,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_IMPORTAR_ASIENTOS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ASIENTO=?ASIENTO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_IMPORTAR_ASIENTOS'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_IMPORTAR_ASIENTOS'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ASIENTO=?ASIENTO AND '
      '  ENTRADA=?ENTRADA ')
    OnNewRecord = QMAsientosImpNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ASIENTO '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_IMPORTAR_ASIENTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 85
  end
  object DSQMAsientosImp: TDataSource
    DataSet = QMAsientosImp
    Left = 131
    Top = 85
  end
  object QSeleccionarTodas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update tmp_importar_asientos'
      'set marcado=?modo'
      'where entrada=?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 344
    Top = 82
  end
  object QCantSel: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select count(*) as CANTIDAD from tmp_importar_asientos'
      'where entrada=?entrada and marcado=1')
    Transaction = TLocal
    AutoTrans = True
    Left = 448
    Top = 87
  end
  object DSxRecorreAsientos: TDataSource
    Left = 139
    Top = 150
  end
  object QInsertarAsiento: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into con_borrador_asientos'
      
        '  (empresa,ejercicio,rib,canal,tipo,fecha,entrada,moneda,asiento' +
        ')'
      'values'
      
        '  (?empresa,?ejercicio,?rib,?canal,'#39'NOR'#39',?fecha,?entrada,?moneda' +
        ',?asiento);'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 344
    Top = 151
  end
  object QInsertarApunte: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into con_borrador_apuntes'
      '  (empresa,ejercicio,rib,cargo,abono,texto,importe)'
      'values'
      '  (?empresa,?ejercicio,?rib,?cargo,?abono,?texto,?importe);')
    Transaction = TLocal
    AutoTrans = True
    Left = 448
    Top = 151
  end
  object TUpdate: THYTransaction
    Active = False
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 216
    Top = 16
  end
  object xAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select distinct asiento,fecha from tmp_importar_asientos'
      'where entrada=?entrada and marcado=1')
    UniDirectional = False
    Left = 136
    Top = 216
    object IntegerField1: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object xApuntes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_importar_asientos'
      
        'where entrada=?entrada and marcado=1 and asiento=?asiento and fe' +
        'cha=?fecha')
    UniDirectional = False
    Left = 136
    Top = 271
    object xApuntesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xApuntesASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xApuntesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xApuntesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xApuntesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xApuntesTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object xApuntesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object xApuntesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xApuntesMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object xApuntesDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xApuntesHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xApuntesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xApuntesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
  end
  object QInsertarApuntes: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure  c_cuentas_importar_apuntes(?empresa,'
      '?ejercicio,?asiento,?rib,?entrada,?pordebeyhaber)')
    Transaction = TLocal
    AutoTrans = True
    Left = 448
    Top = 207
  end
end
