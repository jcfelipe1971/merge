object DMAsientosPorImputar: TDMAsientosPorImputar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 516
  Top = 363
  Height = 227
  Width = 409
  object DSxAsientos: TDataSource
    DataSet = xAsientos
    Left = 110
    Top = 15
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 237
    Top = 12
  end
  object xAsientos: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from con_cuentas_asientos c '#39'+'
      '                      '#39'join ana_con_cuentas_asientos_imp i '#39'+'
      
        '                      '#39'on (c.empresa=i.empresa and c.ejercicio=i' +
        '.ejercicio and c.canal=i.canal and c.ric=i.ric) '#39'+'
      
        '                      '#39'where c.empresa=?empresa and c.ejercicio=' +
        '?ejercicio and c.canal=?canal and '#39'+'
      
        '                      '#39'i.imputacion=1 and c.fecha>=?desde and c.' +
        'fecha<=?hasta and  '#39'+'
      '                      '#39'i.plan_contable=?plan_contable and '#39' +'
      
        '      '#39' ( ((select count(proyecto) from con_cuentas_apuntes wher' +
        'e empresa=?empresa and ejercicio=?ejercicio and '#39' +'
      
        '      '#39'     canal=?canal and ric=c.ric and proyecto=?proyecto)>0' +
        ') or (?proyecto=0) )')
    UniDirectional = False
    AfterOpen = xAsientosAfterOpen
    Opciones = []
    AutoSQLdeVistas = False
    Left = 30
    Top = 15
    object xAsientosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAsientosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAsientosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAsientosRIC: TIntegerField
      DisplayLabel = 'RIC'
      FieldName = 'RIC'
    end
    object xAsientosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAsientosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAsientosDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xAsientosHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xAsientosTITULO: TFIBStringField
      DisplayLabel = 'T'#180'titulo'
      FieldName = 'TITULO'
      Size = 100
    end
    object xAsientosFIRME: TIntegerField
      DisplayLabel = 'firme'
      FieldName = 'FIRME'
    end
    object xAsientosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xAsientosLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xAsientosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xAsientosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xAsientosAGRUPACION_GENERAL: TIntegerField
      DisplayLabel = 'Agrup. Gen.'
      FieldName = 'AGRUPACION_GENERAL'
    end
    object xAsientosIMPUTACION: TIntegerField
      DisplayLabel = 'Imputaci'#243'n'
      FieldName = 'IMPUTACION'
    end
  end
  object xApuntes: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from con_cuentas_apuntes'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      '      ric=?ric'
      '')
    UniDirectional = False
    DataSource = DSxAsientos
    Opciones = []
    AutoSQLdeVistas = False
    Left = 30
    Top = 79
    object xApuntesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xApuntesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xApuntesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xApuntesRIC: TIntegerField
      DisplayLabel = 'RIC'
      FieldName = 'RIC'
    end
    object xApuntesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xApuntesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xApuntesSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xApuntesTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object xApuntesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xApuntesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xApuntesDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xApuntesDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xApuntesDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xApuntesPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
    end
    object xApuntesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object xApuntesCargo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cargo'
      OnGetText = xApuntesCargoGetText
      Calculated = True
    end
    object xApuntesAbono: TStringField
      FieldKind = fkCalculated
      FieldName = 'Abono'
      OnGetText = xApuntesAbonoGetText
      Calculated = True
    end
    object xApuntesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xApuntesTITULO_PROYECTO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO_PROYECTO'
      OnGetText = xApuntesTITULO_PROYECTOGetText
      Size = 60
      Calculated = True
    end
  end
  object DSxApuntes: TDataSource
    DataSet = xApuntes
    Left = 110
    Top = 79
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_PROYECTOS'
      'WHERE '
      '  EMPRESA  = ?EMPRESA AND'
      '  PROYECTO= ?PROYECTO'
      ' ')
    UniDirectional = True
    Left = 242
    Top = 136
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 330
    Top = 136
  end
  object xProyectosField: TFIBDataSetRO
    Database = DMMain.DataBase
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_PROYECTOS'
      'WHERE '
      '  EMPRESA  = ?EMPRESA AND'
      '  PROYECTO= ?PROYECTO'
      ' ')
    UniDirectional = True
    DataSource = DSxApuntes
    Left = 242
    Top = 80
  end
  object DSxProyectosField: TDataSource
    DataSet = xProyectosField
    Left = 330
    Top = 80
  end
end
