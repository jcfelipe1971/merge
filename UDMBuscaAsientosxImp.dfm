object DMBuscaAsientosxImp: TDMBuscaAsientosxImp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 107
  Height = 214
  Width = 439
  object xAsientosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_APUNTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  RIC=?old_RIC AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_APUNTES'
      
        '  (IMPORTE,DOC_FECHA,LINEA,RIC,ENTRADA,DOC_NUMERO,DOC_SERIE,EMPR' +
        'ESA,CANAL,EJERCICIO,TEXTO,PUNTEO,TIPO,CUENTA,SIGNO)'
      'VALUES'
      
        '  (?IMPORTE,?DOC_FECHA,?LINEA,?RIC,?ENTRADA,?DOC_NUMERO,?DOC_SER' +
        'IE,?EMPRESA,?CANAL,?EJERCICIO,?TEXTO,?PUNTEO,?TIPO,?CUENTA,?SIGN' +
        'O)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_APUNTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      '/* Atencion: Se modifica en Delphi */'
      'select ap.*, ast.asiento, ast.fecha '
      'from con_cuentas_apuntes ap '
      'join con_cuentas_asientos ast '
      'on (ap.empresa=ast.empresa and ap.ejercicio=ast.ejercicio and '
      'ap.canal=ast.canal and ap.ric=ast.ric)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_APUNTES'
      'SET'
      '  IMPORTE=?IMPORTE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,ENTRADA=?ENTRADA '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,TEXTO=?TEXTO '
      '  ,PUNTEO=?PUNTEO '
      '  ,TIPO=?TIPO '
      '  ,CUENTA=?CUENTA '
      '  ,SIGNO=?SIGNO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'RIC '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_APUNTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object xAsientosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAsientosDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAsientosDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAsientosDetRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xAsientosDetLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xAsientosDetCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xAsientosDetSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xAsientosDetTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object xAsientosDetIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xAsientosDetENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xAsientosDetDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xAsientosDetDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xAsientosDetDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xAsientosDetPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
    end
    object xAsientosDetTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object xAsientosDetCargo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cargo'
      OnGetText = xAsientosDetCargoGetText
      Calculated = True
    end
    object xAsientosDetAbono: TStringField
      FieldKind = fkCalculated
      FieldName = 'Abono'
      OnGetText = xAsientosDetAbonoGetText
      Calculated = True
    end
    object xAsientosDetASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xAsientosDetFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxAsientosDet: TDataSource
    DataSet = xAsientosDet
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
    Left = 248
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 320
    Top = 16
  end
end
