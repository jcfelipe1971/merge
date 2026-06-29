object DMGestProcesos: TDMGestProcesos
  OldCreateOrder = False
  OnCreate = DMGestProcesosCreate
  Left = 613
  Top = 356
  Height = 356
  Width = 381
  object DSxVerGesPrc: TDataSource
    DataSet = xVerGesPrc
    Left = 128
    Top = 8
  end
  object xProcesos1: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO,TITULO'
      'FROM VER_MOVIMIENTOS_PROCESOS'
      'order by tipo')
    UniDirectional = False
    Left = 40
    Top = 104
    object xProcesos1TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xProcesos1TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 8
  end
  object xVerGesPrc: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_GES_PROCESOS_AUTO'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l)'
      
        'and ((serie=?serie) or (serie  is null) or (serie = cast('#39' '#39' as ' +
        'varchar(10)))) and(tipo=?tipo)) order by contador desc ')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 40
    Top = 8
    object xVerGesPrcEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerGesPrcEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerGesPrcCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerGesPrcSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerGesPrcPROCESO: TFIBStringField
      DisplayLabel = 'Proceso'
      FieldName = 'PROCESO'
      Size = 40
    end
    object xVerGesPrcTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVerGesPrcCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xVerGesPrcANTERIOR: TIntegerField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerGesPrcENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVerGesPrcUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xVerGesPrcNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object xVerGesPrcFECHA_E: TDateTimeField
      DisplayLabel = 'Entrada'
      FieldName = 'FECHA_E'
    end
    object xVerGesPrcFECHA_S: TDateTimeField
      DisplayLabel = 'Salida'
      FieldName = 'FECHA_S'
    end
    object xVerGesPrcUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 31
    end
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_deshacer_facturacion'
      'where empresa=?empresa and ejercicio=?ejercicio '
      
        'and ((serie=?serie) or (cast('#39' '#39' as varchar(10)) =?serie)) and e' +
        'ntrada=?entrada and PROC_AUTO = ?PROC_AUTO')
    UniDirectional = False
    Left = 40
    Top = 56
    object xRecorreENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xRecorreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecorreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecorreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecorreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xRecorreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xRecorreID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xRecorreESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xRecorreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xRecorrePROC_AUTO: TIntegerField
      DisplayLabel = 'Proc. Autom.'
      FieldName = 'PROC_AUTO'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 56
  end
end
