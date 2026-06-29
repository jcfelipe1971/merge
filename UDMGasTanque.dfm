object DMGasTanque: TDMGasTanque
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1000
  Top = 308
  Height = 309
  Width = 436
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 228
    Top = 18
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 244
    Top = 96
  end
  object QMGasTanque: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_GAS_TANQUE'
      'WHERE'
      '  COD_TANQUE=?old_COD_TANQUE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_GAS_TANQUE'
      
        '  (NOTAS,CAPACIDAD,SERIE,COD_TANQUE,CANAL,EJERCICIO,ESTADO,EVAPO' +
        'RACION,TITULO,EMPRESA,TARIFA,ARTICULO,ALMACEN)'
      'VALUES'
      
        '  (?NOTAS,?CAPACIDAD,?SERIE,?COD_TANQUE,?CANAL,?EJERCICIO,?ESTAD' +
        'O,?EVAPORACION,?TITULO,?EMPRESA,?TARIFA,?ARTICULO,?ALMACEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_GAS_TANQUE'
      'WHERE'
      '  COD_TANQUE=?COD_TANQUE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_TANQUE'
      'WHERE'
      '  EMPRESA=?EMPRESA '
      'ORDER BY '
      '  COD_TANQUE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_GAS_TANQUE'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,CAPACIDAD=?CAPACIDAD '
      '  ,SERIE=?SERIE '
      '  ,CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,ESTADO=?ESTADO '
      '  ,EVAPORACION=?EVAPORACION '
      '  ,TITULO=?TITULO '
      '  ,TARIFA=?TARIFA '
      '  ,ARTICULO=?ARTICULO '
      '  ,ALMACEN=?ALMACEN '
      'WHERE'
      '  COD_TANQUE=?COD_TANQUE AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    OnNewRecord = QMGasTanqueNewRecord
    ClavesPrimarias.Strings = (
      'COD_TANQUE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_GAS_TANQUE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 24
    object QMGasTanqueEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGasTanqueSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMGasTanqueCOD_TANQUE: TIntegerField
      DisplayLabel = 'Cod. Tanque'
      FieldName = 'COD_TANQUE'
    end
    object QMGasTanqueTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMGasTanqueEVAPORACION: TFloatField
      DisplayLabel = 'Evaporacion'
      FieldName = 'EVAPORACION'
    end
    object QMGasTanqueCAPACIDAD: TFloatField
      DisplayLabel = 'Capacidad'
      FieldName = 'CAPACIDAD'
    end
    object QMGasTanqueALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMGasTanqueARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMGasTanqueTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMGasTanqueESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMGasTanqueNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMGasTanqueDescSerie: TStringField
      DisplayLabel = 'Desc. Serie'
      FieldKind = fkCalculated
      FieldName = 'DescSerie'
      OnGetText = QMGasTanqueDescSerieGetText
      Size = 0
      Calculated = True
    end
    object QMGasTanqueDescAlmacen: TStringField
      DisplayLabel = 'Desc. Almacen'
      FieldKind = fkCalculated
      FieldName = 'DescAlmacen'
      OnGetText = QMGasTanqueDescAlmacenGetText
      Calculated = True
    end
    object QMGasTanqueDescArticulo: TStringField
      DisplayLabel = 'Desc. Articulo'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMGasTanqueDescArticuloGetText
      Calculated = True
    end
    object QMGasTanqueDescTarifa: TStringField
      DisplayLabel = 'Desc. Tarifa'
      FieldKind = fkCalculated
      FieldName = 'DescTarifa'
      OnGetText = QMGasTanqueDescTarifaGetText
      Calculated = True
    end
    object QMGasTanqueEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMGasTanqueCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object DSQMGasTanque: TDataSource
    DataSet = QMGasTanque
    Left = 160
    Top = 24
  end
end
